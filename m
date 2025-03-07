Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1937590njm;
        Thu, 6 Mar 2025 20:00:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXz2dPkXCD5hzLzeW7pZ0kkg8iTc/xjU+04t5yaq/RO+kZ8VTKqffZUIoRu65wG8//cPnQvOsiyEQFBEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFCBVns+W1XOe9HITAHmw+qZmDtpP0fMNi+G0Ob4h4sKSSSTiU1o8QsO10qW1McaUc/ZAtu
X-Received: by 2002:a05:620a:284e:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7c4e16829f5mr309574185a.18.1741320041994;
        Thu, 06 Mar 2025 20:00:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320041; cv=none;
        d=google.com; s=arc-20240605;
        b=LZTLs6k9mD2Oefsa/rnI8x+4LNRMNskOBN0m9bT8nQog7Vb9VCxecuR0fAF99Y0CM8
         +h0awy0fiTTc0DUdKtWi2y9PfTQcPJTav/ihdS3jISIEW/+ODlWSxfCeSy0mTCiBkJVu
         CcNWG2UYxGEaZsgcqiIB4+kj9Q+VIvmifWeOgRZBy8+fFBLkSwcgbPGrePj8WClD6vMS
         Bz6lSLF3taoq+LhFX2wfefGOH7ICK8stiKH459QjT3uxO1BqHUXN7puSXLKtn2TquQFP
         3DVPL2yfBD08/ZxhTTI606sfmj97lUBUy3YRr31AiQANFwA/Zt5cw9tRMw/adh/D0uH3
         sdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=CpOxkulXCmek00PKn2DPYNY/bW7giwM/0+GM50EHFWQ=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=bUONgY4Uz+gfwk8NPuIEsq6xmYn3oKN8LPJJilQPTlgQ77zo4sECz4pQiLN9/FrB0m
         n0DRgNzJNCFvbN5uCc7JVpe4Aq/cFnIjjDG9yVRY2K3pWM5JZRtildxxE+EBj9uryIX9
         EX07OhdIH+/I6eofynbOTUdPycxOlu+ymXDiJhPzpqtzixN1g4Gtj3BCEVbYfA/joiOj
         aQ73PhALW5W7myBHF/dU9PlOP1JwI+MEDDB16RuwPpadrRmDFgZ0MxETMF9F7zbv80eE
         e7yiKs8Qixh4o6fA8ZFXkbXLoda3TN9xZV3NASpfdaWExqUQwXUu9OUOyLQISS6K+AS+
         x5Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f707ce9bsi25555726d6.99.2025.03.06.20.00.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:00:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqOsQ-0007ZP-W9; Thu, 06 Mar 2025 22:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsO-0007X2-Gl; Thu, 06 Mar 2025 22:59:56 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOsL-0004iq-Uw; Thu, 06 Mar 2025 22:59:56 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:45 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:45 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v6 00/29] Support AST2700 A1
Date: Fri, 7 Mar 2025 11:59:09 +0800
Message-ID: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: In9YvqBeDzvV

v1:
 1. Refactor INTC model to support both INTC0 and INTC1.
 2. Support AST2700 A1.
 3. Create ast2700a0-evb machine.
 
v2:
  To streamline the review process, split the following patch series into
  three parts.
  https://patchwork.kernel.org/project/qemu-devel/cover/20250121070424.2465942-1-jamin_lin@aspeedtech.com/
  This patch series focuses on cleaning up the INTC model to
  facilitate future support for the INTC_IO model.

v3:
 1. Update and add functional test for AST2700
 2. Add AST2700 INTC design guidance and its block diagram.
 3. Retaining the INTC naming and introducing a new INTCIO model to support the AST2700 A1.
 4. Create ast2700a1-evb machine and rename ast2700a0-evb machine
 5. Fix silicon revision issue and support AST2700 A1.

v4:
 1. rework functional test for AST2700
 2. the initial machine "ast2700-evb" is aliased to "ast2700a0-evb.
 3. intc: Reduce regs array size by adding a register sub-region
 4. intc: split patch for Support setting different register sizes
 5. update ast2700a1-evb machine parent to TYPE_ASPEED_MACHINE

v5:
 1. Rename status_addr and addr to status_reg and reg for clarity
 2. Introduce dynamic allocation for regs array
 3. Sort the memmap table by mapping address
 4. ast27x0.c split patch for Support two levels of INTC controllers for AST2700 A1
 5. tests/functional/aspped split patch for Introduce start_ast2700_test API
 6. keep variable naming for reviewer suggestion.
 7. Add reviewer suggestion and split patch to make more readable.
 
v6: 
  1. rename reg_size to nr_regs
  2. Fix clean regs size
  3. replace g_malloc with g_new

With the patch applied, QEMU now supports two machines for running AST2700 SoCs:
ast2700a0-evb: Designed for AST2700 A0
ast2700a1-evb: Designed for AST2700 A1

Test information
1. QEMU version: https://github.com/qemu/qemu/commit/50d38b8921837827ea397d4b20c8bc5efe186e53
2. ASPEED SDK v09.05 pre-built image
   https://github.com/AspeedTech-BMC/openbmc/releases/tag/v09.05
   ast2700-default-obmc.tar.gz (AST2700 A1)
   https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-default-obmc.tar.gz
   ast2700-a0-default-obmc.tar.gz (AST2700 A0)
   https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz
   
This patch series depends on the following patch series:
https://patchwork.kernel.org/project/qemu-devel/cover/20250304064710.2128993-1-jamin_lin@aspeedtech.com/
https://patchwork.kernel.org/project/qemu-devel/cover/20250225075622.305515-1-jamin_lin@aspeedtech.com/

Jamin Lin (29):
  hw/intc/aspeed: Support setting different memory size
  hw/intc/aspeed: Rename status_addr and addr to status_reg and reg for
    clarity
  hw/intc/aspeed: Introduce dynamic allocation for regs array
  hw/intc/aspeed: Support setting different register size
  hw/intc/aspeed: Reduce regs array size by adding a register sub-region
  hw/intc/aspeed: Introduce helper functions for enable and status
    registers
  hw/intc/aspeed: Add object type name to trace events for better
    debugging
  hw/arm/aspeed: Rename IRQ table and machine name for AST2700 A0
  hw/arm/aspeed_ast27x0: Sort the IRQ table by IRQ number
  hw/intc/aspeed: Support different memory region ops
  hw/intc/aspeed: Rename num_ints to num_inpins for clarity
  hw/intc/aspeed: Add support for multiple output pins in INTC
  hw/intc/aspeed: Refactor INTC to support separate input and output pin
    indices
  hw/intc/aspeed: Introduce AspeedINTCIRQ structure to save the irq
    index and register address
  hw/intc/aspeed: Introduce IRQ handler function to reduce code
    duplication
  hw/intc/aspeed: Add Support for Multi-Output IRQ Handling
  hw/intc/aspeed: Add Support for AST2700 INTCIO Controller
  hw/misc/aspeed_scu: Add Support for AST2700/AST2750 A1 Silicon
    Revisions
  hw/arm/aspeed_ast27x0.c Support AST2700 A1 GIC Interrupt Mapping
  hw/arm/aspeed_ast27x0: Define an Array of AspeedINTCState with Two
    Instances
  hw/arm/aspeed_ast27x0: Support two levels of INTC controllers for
    AST2700 A1
  hw/arm/aspeed_ast27x0: Add SoC Support for AST2700 A1
  hw/arm/aspeed: Add Machine Support for AST2700 A1
  hw/arm/aspeed_ast27x0: Sort the memmap table by mapping address
  tests/functional/aspeed: Introduce start_ast2700_test API
  tests/functional/aspeed: Update temperature hwmon path
  tests/functional/aspeed: Update test ASPEED SDK v09.05
  tests/functional/aspeed: Add test case for AST2700 A1
  docs/specs: Add aspeed-intc

 docs/specs/aspeed-intc.rst              | 136 +++++
 docs/specs/index.rst                    |   1 +
 include/hw/arm/aspeed_soc.h             |   3 +-
 include/hw/intc/aspeed_intc.h           |  36 +-
 include/hw/misc/aspeed_scu.h            |   2 +
 hw/arm/aspeed.c                         |  33 +-
 hw/arm/aspeed_ast27x0.c                 | 329 ++++++++----
 hw/intc/aspeed_intc.c                   | 667 ++++++++++++++++++------
 hw/misc/aspeed_scu.c                    |   2 +
 hw/intc/trace-events                    |  25 +-
 tests/functional/test_aarch64_aspeed.py |  47 +-
 11 files changed, 978 insertions(+), 303 deletions(-)
 create mode 100644 docs/specs/aspeed-intc.rst

-- 
2.43.0

