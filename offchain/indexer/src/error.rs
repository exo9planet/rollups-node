// Copyright Cartesi Pte. Ltd.
//
// SPDX-License-Identifier: Apache-2.0
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use
// this file except in compliance with the License. You may obtain a copy of the
// License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

use snafu::Snafu;

#[derive(Debug, Snafu)]
#[snafu(visibility(pub(crate)))]
pub enum IndexerError {
    #[snafu(display("health check error"))]
    HealthCheckError {
        source: http_health_check::HealthCheckError,
    },

    #[snafu(display("broker error"))]
    BrokerError { source: rollups_events::BrokerError },

    #[snafu(display("migrations error"))]
    MigrationsError {
        source: rollups_data::MigrationError,
    },

    #[snafu(display("repository error"))]
    RepositoryError { source: rollups_data::Error },

    #[snafu(display("join error"))]
    JoinError { source: tokio::task::JoinError },
}
