// Copyright Cartesi Pte. Ltd.

// SPDX-License-Identifier: Apache-2.0
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use
// this file except in compliance with the License. You may obtain a copy of the
// License at http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

pragma solidity ^0.8.8;

/// @title Output Encoding Library
///
/// @notice Defines the encoding of outputs generated by the off-chain machine.
library OutputEncoding {
    /// @notice Encode a notice.
    /// @param notice The notice
    /// @return The encoded output
    function encodeNotice(
        bytes calldata notice
    ) internal pure returns (bytes memory) {
        return abi.encode(notice);
    }

    /// @notice Encode a voucher.
    /// @param destination The address that will receive the payload through a message call
    /// @param payload The payload, which—in the case of Solidity contracts—encodes a function call
    /// @return The encoded output
    function encodeVoucher(
        address destination,
        bytes calldata payload
    ) internal pure returns (bytes memory) {
        return abi.encode(destination, payload);
    }
}
