Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B814C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:42:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZG4b-00009G-VY; Tue, 08 Jul 2025 17:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZEnW-0001lw-8m
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 16:20:14 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZEnT-0006yh-Im
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 16:20:13 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ae401ebcbc4so799079866b.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 13:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752006009; x=1752610809; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+TqTY3yHXS8e/i0KnNKmn40UXfWJZswqZbcAaZ/doVk=;
 b=d4kCAPnL33eBLXUKWIinJvG6gWpA6ZzPZsYc4lBlC+Cedr71xR7i0D2frAMjvIBQT8
 VsJS9NZo2DDHPljEam5qyS4Be4LsTWAPlPnDY+JP1VcjC9juGoxmvLv/W3YX5+IcwWrV
 V452VSdPs9sOrLSsbjvVa4XsvNC8iOcZJdtHnve+DSrNbq8ZpBQtd1TX5JlfU3KR6Gnh
 cJMviFD9Of0NRNk4nIsy//VgDM3jpCLEWxUAyZja95F3vLbHt5K+0+AfKW/RIuY6p24G
 XXPq7DXErEh/mj6hnMPyRhFekh8tDc6lIjBAg6IBf0ErBUKvawNKBG3pPY4qYMNW+l+U
 kHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752006009; x=1752610809;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+TqTY3yHXS8e/i0KnNKmn40UXfWJZswqZbcAaZ/doVk=;
 b=cmssLTtXB2KXuG2qJtoWZZmEO7z8Sci1yBjQDIxste8Kwgv/yQpj0Gtf4pmrtwcfAE
 tGPFgG8MMuTUFC4ndw4al9AMB/xrPuX0lB4au0LRXi8HAbeNkrlfroiT947VqUhYHii8
 mjpaQjGVJNltj5xzdw5Z9fCm2MBWjgIbWKQhUAOSCFtiJRW+9m6FN8PaARiC5w/itiHm
 TEu1i+QaZ4yQLoGsIznmDsxfFbYqIwBLJeLjtDItMy4rOOkUOBsmYvLhfhO9zLj7YIz2
 wA3eLM58agvOQ6m2d4b06vTTPt7t2BMHs8hdi7mWEG0AXoTIbaKKAnwzYFsvXDOTiIds
 EXmA==
X-Gm-Message-State: AOJu0YyRyz2LV3bSqEx3oZ0nivs6gA0z9Ob7R+uM+2hS1dsinobQpbG4
 DKd4h5FCbDZh40Z5OQHo7uwEZm6MBIyPIa6je1QKecGPcZFeCCGsbvcwIbgncmAaspdTE6SlR1v
 iGmQ6
X-Gm-Gg: ASbGncvbFCevxsAgaaF330JEe4J/NfP6ULxhvH/iLe8xuT7lh4lJlo2RkJHsKUmqbGo
 aObwqxvJ/E0pQyY66xn+22afxBQXuM/cRd4LtoKpS9hbfVM9EKuxE2wSr4Ef9jez/ilsDBLrIGW
 FLhGDkALUc7M151W4TD5Z8j1DAZUC/YEfIEIcaPe3QBIpGb7p/HmAtcvnLL6kx9Um93D4u4pfHH
 5rBmy4/M/JirfV5gc6ObXoi8mwMPdLgrSZ6eJmyHBiAVZ7tWcgidNRrS3aa1y9cVYIBG7XGismd
 761nC0jLrqKgX0XByGzq9gsbumPBqyLolYqePeFEurlQpZ8uh5uXmc6rV3WrN3b7AfcH
X-Google-Smtp-Source: AGHT+IEeE4OHrunj85O3Z4W0/4U0TYcYJkE0DZDU+67WQU2UmN9o1V0yDvDLIGgq3N6+42cCxlr+rA==
X-Received: by 2002:a05:6000:2588:b0:3a5:1cc5:4a17 with SMTP id
 ffacd0b85a97d-3b5ddedc49cmr2575326f8f.42.1751983851091; 
 Tue, 08 Jul 2025 07:10:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030c2e8sm12872264f8f.3.2025.07.08.07.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 07:10:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Correct encoding of Debug Communications Channel
 registers
Date: Tue,  8 Jul 2025 15:10:48 +0100
Message-ID: <20250708141049.778361-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We don't implement the Debug Communications Channel (DCC), but
we do attempt to provide dummy versions of its system registers
so that software that tries to access them doesn't fall over.

However, we got the tx/rx register definitions wrong. These
should be:

AArch32:
  DBGDTRTX   p14 0 c0 c5 0  (on writes)
  DBGDTRRX   p14 0 c0 c5 0  (on reads)

AArch64:
  DBGDTRTX_EL0  2 3 0 5 0 (on writes)
  DBGDTRRX_EL0  2 3 0 5 0 (on reads)
  DBGDTR_EL0    2 3 0 4 0 (reads and writes)

where DBGDTRTX and DBGDTRRX are effectively different names for the
same 32-bit register, which has tx behaviour on writes and rx
behaviour on reads.  The AArch64-only DBGDTR_EL0 is a 64-bit wide
register whose top and bottom halves map to the DBGDTRRX and DBGDTRTX
registers.

Currently we have just one cpreg struct, which:
 * calls itself DBGDTR_EL0
 * uses the DBGDTRTX_EL0/DBGDTRRX_EL0 encoding
 * is marked as ARM_CP_STATE_BOTH but has the wrong opc1
   value for AArch32
 * is implemented as RAZ/WI

Correct the encoding so:
 * we name the DBGDTRTX/DBGDTRRX register correctly
 * we split it into AA64 and AA32 versions so we can get the
   AA32 encoding right
 * we implement DBGDTR_EL0 at its correct encoding

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2986
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 69fb1d0d9ff..aee06d4d426 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -988,11 +988,20 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
-    /* DBGDTRTX_EL0/DBGDTRRX_EL0 depend on direction */
-    { .name = "DBGDTR_EL0", .state = ARM_CP_STATE_BOTH, .cp = 14,
+    /* Architecturally DBGDTRTX is named DBGDTRRX when used for reads */
+    { .name = "DBGDTRTX_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 5, .opc2 = 0,
       .access = PL0_RW, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "DBGDTRTX", .state = ARM_CP_STATE_AA32, .cp = 14,
+      .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
+      .access = PL0_RW, .accessfn = access_tdcc,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    /* This is AArch64-only and is a combination of DBGDTRTX and DBGDTRRX */
+    { .name = "DBGDTR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 4, .opc2 = 0,
+      .access = PL0_RW, .accessfn = access_tdcc,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * OSECCR_EL1 provides a mechanism for an operating system
      * to access the contents of EDECCR. EDECCR is not implemented though,
-- 
2.43.0


