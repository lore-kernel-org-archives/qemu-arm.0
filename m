Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp641140njb;
        Wed, 27 Nov 2024 01:16:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXpMavyZNoLW4mu7tVLYI2FpDYIW5fyAXdMIfzjY9SjARkGuW0eXOYB7ySqGcTlhPp6TH/9wn+TJb6apw==@linaro.org
X-Google-Smtp-Source: AGHT+IH8DF12XCWEHkfoG0fu8VHzWt/c/xl4KdWv3tmrSAScioq0WbII/21fnafxGI3aeKp6da+I
X-Received: by 2002:a05:6214:27e5:b0:6d4:262d:da6c with SMTP id 6a1803df08f44-6d856c7ac90mr106827946d6.24.1732699004596;
        Wed, 27 Nov 2024 01:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732699004; cv=none;
        d=google.com; s=arc-20240605;
        b=JuWIUnfVzbg2+zTIO1ZOLRO8HAtdgW8kxCV6kwMCY9p8qWOzPF53KcMin0BytnU3V2
         /u8867p42amLRajCfa6vSdfLKccJxQp80igy5G8dHcgdzWPo8YFdgyi2tbuwdWWAGlQs
         O+57XSbD+BouOncespT+oKD+PgSCXqG61O7wSjk1UcHu+xEqq8ZucPd1HNgCOIpXkAwo
         znJDpIhQ8Q1t/6COBnkOc1ZcJrk+b4BGqQszgW6xsBwkVSlGzdGEk4waVb7Fj43uDUrU
         j0B5vCkISn1k4nnY6E5B/m6MfM+HgPwb9eeJJXlyfJfuUKtGDDoSnRzhfWLuke2UbeOA
         VmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=aAThn4sxjogIKcetluiBQcYROFHoJidvvEhvbiaIUos=;
        fh=0qytIn8qIo3O2ioMBXDhPd+VFcV9yTlaki0kk0ux4hY=;
        b=CxoSzCvu283TP9xojBRozhma/pVAUzNM3YRxybojYsByrbmB9RpFbD2mpDRfvhy1zC
         3gIQ6E+wgRpfoKJzUFcAosWoRaK2m6wnAluHAC0QWdypkxDCaTR/rVrPBAzxh0idApIm
         PBvOjcd3e5YKIRqEUVnDzmkhJiaJC/mk0/E0DVeVxO+gQD8X/Vg7ACPOmP2UjOFBiRPS
         3nyam9wsXVn7t8w9gTQrC3yW6gobXfdEk8vdIOLwFgn+v1PtxrapgRKybgAKeDQKChvT
         ftg44CJ7xfk3fMIrUgHN+GJ60PZ4sNZOPebtfjL1NWDJJgK7EvDHnyTuCgrcF1XH601j
         BpzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451a99421si137414166d6.119.2024.11.27.01.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 01:16:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGE9O-00026W-2X; Wed, 27 Nov 2024 04:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9M-00026D-3j; Wed, 27 Nov 2024 04:15:56 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9K-0004K2-3h; Wed, 27 Nov 2024 04:15:55 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 27 Nov
 2024 17:15:43 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 27 Nov 2024 17:15:43 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 00/10] Add smc qtest testcase to support AST2700
Date: Wed, 27 Nov 2024 17:15:33 +0800
Message-ID: <20241127091543.1243114-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: Wj6cfsJi7DZo

change from v1:
 1. Fix write incorrect data into flash in user mode.
 2. Refactor aspeed smc qtest testcases to support AST2600, AST2500 and
AST1030.
 3. Add ast2700 smc qtest testcase to support AST2700.

change from v2:
1. Introduce a new aspeed-smc-utils.c to place common testcases.
2. Fix hardcode attach flash model of spi controllers
3. Add reviewers suggestion and fix review issue.

change from v3:
1. replace the TestData type name with AspeedSMCTestData
2. add an 'aspeed_smc' prefix in the name of aspeed smc test routine functions

Jamin Lin (10):
  test/qtest/aspeed_smc-test: Move testcases to test_palmetto_bmc
    function
  test/qtest/aspeed_smc-test: Introduce a new TestData to test different
    BMC SOCs
  test/qtest/aspeed_smc-test: Support to test all CE pins
  test/qtest/aspeed_smc-test: Introducing a "page_addr" data field
  test/qtest/aspeed_smc-test: Support to test AST2500
  test/qtest/aspeed_smc-test: Support to test AST2600
  test/qtest/aspeed_smc-test: Support to test AST1030
  test/qtest/aspeed_smc-test: Support write page command with QPI mode
  test/qtest: Introduce a new aspeed-smc-utils.c to place common
    testcases
  test/qtest/ast2700-smc-test: Support to test AST2700

 tests/qtest/aspeed-smc-utils.c | 686 +++++++++++++++++++++++++++++
 tests/qtest/aspeed-smc-utils.h |  95 ++++
 tests/qtest/aspeed_smc-test.c  | 775 ++++++++-------------------------
 tests/qtest/ast2700-smc-test.c |  71 +++
 tests/qtest/meson.build        |   5 +-
 5 files changed, 1034 insertions(+), 598 deletions(-)
 create mode 100644 tests/qtest/aspeed-smc-utils.c
 create mode 100644 tests/qtest/aspeed-smc-utils.h
 create mode 100644 tests/qtest/ast2700-smc-test.c

-- 
2.34.1

