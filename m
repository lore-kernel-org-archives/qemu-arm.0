Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c322c85sm7790031a12.84.2024.05.14.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 10:42:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E552D5F8B0;
	Tue, 14 May 2024 18:42:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 00/11] maintainer updates (plugins, testing) pre-PR
Date: Tue, 14 May 2024 18:42:42 +0100
Message-Id: <20240514174253.694591-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: I0gqlN0j3U8X

This is mostly plugin related stuff which is all ready to go however
I have a few miscellaneous testing updates which would appreciate the
review.

Thanks.

Alex Bennée (2):
  tests/tcg: don't append QEMU_OPTS for armv6m-undef test
  scripts/update-linux-header.sh: be more src tree friendly

Pierrick Bouvier (9):
  plugins: prepare introduction of new inline ops
  plugins: extract generate ptr for qemu_plugin_u64
  plugins: add new inline op STORE_U64
  tests/plugin/inline: add test for STORE_U64 inline op
  plugins: conditional callbacks
  tests/plugin/inline: add test for conditional callback
  plugins: distinct types for callbacks
  plugins: extract cpu_index generate
  plugins: remove op from qemu_plugin_inline_cb

 include/qemu/plugin.h                 |  42 +++++---
 include/qemu/qemu-plugin.h            |  80 ++++++++++++++-
 plugins/plugin.h                      |  12 ++-
 accel/tcg/plugin-gen.c                | 136 ++++++++++++++++++++------
 plugins/api.c                         |  39 ++++++++
 plugins/core.c                        | 109 +++++++++++++++------
 tests/plugin/inline.c                 | 130 ++++++++++++++++++++++--
 plugins/qemu-plugins.symbols          |   2 +
 scripts/update-linux-headers.sh       |  80 +++++++--------
 tests/tcg/arm/Makefile.softmmu-target |   2 +-
 10 files changed, 508 insertions(+), 124 deletions(-)

-- 
2.39.2
