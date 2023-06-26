Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d17-20020adffbd1000000b002fb60c7995esm8347280wrs.8.2023.06.26.13.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 13:25:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1C0751FFBB;
	Mon, 26 Jun 2023 21:25:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Xu <peterx@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Cleber Rosa <crosa@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Bandan Das <bsd@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 0/6] maintainer omnibus: testing, fuzz, plugins, documentation
Date: Mon, 26 Jun 2023 21:25:09 +0100
Message-Id: <20230626202516.2507915-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: g2YOSsvObJml

As softfreeze is fast approaching I thought it would be work combining
my various trees into an omnibus series to ease the review and
merging.

The testing updates exposed a number of latent leaks that confused the
oss-fuzz jobs (hence the test-fuzz addition to help debug that). This
also includes some minor plugin updates and finally some documentation
updates that clean-up and expose the QOM and QDEV APIs which are so
core to emulating anything in QEMU.

v2
  - applied a bunch of review tags
  - added missing doc suggestions from Paolo
  - tweaked the plugin fix for CI

The following patches need review:

 - qemu-keymap: properly check return from xkb_keymap_mod_get_index

Alex Bennée (3):
  gitlab: reduce testing scope of check-gcov
  tests/tcg: add mechanism to handle plugin arguments
  qemu-keymap: properly check return from xkb_keymap_mod_get_index

Ani Sinha (1):
  docs/devel: remind developers to run CI container pipeline when
    updating images

Daniel P. Berrangé (2):
  gitlab: explicit set artifacts publishing criteria
  gitlab: ensure coverage job also publishes meson log

 docs/devel/testing.rst               |  6 ++++++
 qemu-keymap.c                        | 24 ++++++++++++++++--------
 .gitlab-ci.d/buildtest-template.yml  |  4 +++-
 .gitlab-ci.d/buildtest.yml           |  7 ++++++-
 .gitlab-ci.d/crossbuild-template.yml |  1 +
 .gitlab-ci.d/crossbuilds.yml         |  2 ++
 .gitlab-ci.d/opensbi.yml             |  1 +
 tests/tcg/Makefile.target            |  8 ++++++--
 8 files changed, 41 insertions(+), 12 deletions(-)

-- 
2.39.2
