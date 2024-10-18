Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp611538njb;
        Thu, 17 Oct 2024 22:31:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVq7bYR/8J8yWKTQixR/F9RLfux5uI1nZuqQgMO2gmSLYu9v/FPYV+ZZKyVxt9Wa04paDWc3UVbs+kYAA==@linaro.org
X-Google-Smtp-Source: AGHT+IEEqjKUy0N2fxRICdjla7MzpE9sicYWQswdklKHGX/C/kQJMGV6705/jr4fRSEq98JvgMNY
X-Received: by 2002:a05:622a:2298:b0:460:90e3:24a1 with SMTP id d75a77b69052e-460aede95bfmr19367911cf.39.1729229496471;
        Thu, 17 Oct 2024 22:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729229496; cv=none;
        d=google.com; s=arc-20240605;
        b=PKzCrkTS4x4ugNg21ulVWsaFxuCy4L0XSoVP8sKCGtFJeFhXTHPR2zboowfwHtAwWw
         1oPvmWp+3UbCenwVwPZNqH+SaoqYrfqyhHTYmxoCxU8zfYJzJC+/SfMgE45QNxCPzelj
         auM0M/Wb1LDv35zSRU0/41d8mXFZK4qb0Np7yejXfwFepE2l6tPWMji8Vt5oHRT9eHlB
         NcJ3KI20S8UrZavuDQdN8R8GoDi3p4fzbbwEw82pHGvV+MXCLXLAFnoePEnHkO3/L2RJ
         hzrZcRRjwNLiX/uBUOEsWnVOqOiIwYDkN3g1+wlmo2iq+4id1kPn3aow/G3g39p2poho
         SEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=k4PIOl51i7sGpDw2bNWORAulTWKlUmvw83AOcU/P92A=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=OCeMRzqCBfbzwlxixKM+cME9cGImhpCmKppviiYteCLn3hFZPc2ZufDJ9AyUMnXgJo
         TzmVD/ridp76rU81L1Rv41shNtEerUBYgwWkcHBJ1TVEiB6JYLF+HhHWYkBgmLFFOoNv
         UGuw/tUd6KTF0K0YszNzE7soTF8imNjZF2rr1OiNYEHw1yT6oU+gvRirOqX3KtEUFgG3
         qe6cK2o11LgsZQnFsIXnAMlBIqOOrEgzG7UxpiybAfbKNSlbgAGNxi2TZGMti0uYT+1+
         4er6OuF/PrvCJj9M3V7iUOw91oeOVKGRaTDFoDSUH3N3cMN4nj+QJ3pwHNnhB7jDZRB0
         zJig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460aeac2126si9087721cf.723.2024.10.17.22.31.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 22:31:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1fa8-0008Ef-2V; Fri, 18 Oct 2024 01:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1fa6-0008EL-SW; Fri, 18 Oct 2024 01:31:23 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1fa4-00089Y-IE; Fri, 18 Oct 2024 01:31:22 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 13:31:12 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 13:31:12 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 00/16] Fix write incorrect data into flash in user mode
Date: Fri, 18 Oct 2024 13:30:56 +0800
Message-ID: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lCFTb9/oKYaC

change from v1:
 1. Fix write incorrect data into flash in user mode.
 2. Refactor aspeed smc qtest testcases to support AST2600, AST2500 and
AST1030.
 3. Add ast2700 smc qtest testcase to support AST2700.

QEMU version: https://github.com/qemu/qemu/commit/95a16ee753d6da651fce8df876333bf7fcf134d9

Depend patch series:
To successfully apply this patch series, it is required to apply this
patch series first, https://patchwork.kernel.org/project/qemu-devel/list/?series=894520

Jamin Lin (16):
  aspeed/smc: Fix write incorrect data into flash in user mode
  hw/block:m25p80: Fix coding style
  hw/block:m25p80: Support write status register 2 command (0x31) for
    w25q01jvq
  hw/block/m25p80: Add SFDP table for w25q80bl flash
  hw/arm/aspeed: Correct spi_model w25q256 for ast1030-a1 EVB.
  hw/arm/aspeed: Correct fmc_model w25q80bl for ast1030-a1 EVB
  test/qtest/aspeed_smc-test: Fix coding style
  test/qtest/aspeed_smc-test: Move testcases to test_palmetto_bmc
    function
  test/qtest/aspeed_smc-test: Introduce a new TestData to test different
    BMC SOCs
  test/qtest/aspeed_smc-test: Support to test all CE pins
  test/qtest/aspeed_smc-test: Support to test all flash models
  test/qtest/aspeed_smc-test: Support to test AST2500
  test/qtest/aspeed_smc-test: Support to test AST2600
  test/qtest/aspeed_smc-test: Support to test AST1030
  test/qtest/aspeed_smc-test: Support write page command with QPI mode
  test/qtest/ast2700-smc-test: Support to test AST2700

 hw/arm/aspeed.c                |   4 +-
 hw/block/m25p80.c              |  63 ++-
 hw/block/m25p80_sfdp.c         |  36 ++
 hw/block/m25p80_sfdp.h         |   2 +-
 hw/ssi/aspeed_smc.c            |  39 +-
 include/hw/ssi/aspeed_smc.h    |   1 +
 tests/qtest/aspeed_smc-test.c  | 783 ++++++++++++++++++++++-----------
 tests/qtest/ast2700-smc-test.c | 598 +++++++++++++++++++++++++
 tests/qtest/meson.build        |   3 +-
 9 files changed, 1245 insertions(+), 284 deletions(-)
 create mode 100644 tests/qtest/ast2700-smc-test.c

-- 
2.34.1

