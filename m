Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4029877wru;
        Tue, 14 Aug 2018 05:43:23 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx585zYLC4p9sxStQRG14SuDJy+zaFh5P36KhsVrGaAyXltI81w1MJswBgvzAcYxXcZE8Tf
X-Received: by 2002:a0c:becb:: with SMTP id f11-v6mr19032842qvj.217.1534250603488;
        Tue, 14 Aug 2018 05:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250603; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4oqAsq1SL3LxPzWYGlf533vhCIrBgaCZ4DUblS9d86v/0F1CbIA4TkT5L2GXA4XME
         EZYcyzROp5Wpz9h5QJ9w8I7fgqYA4xsDcdeBJi5BoTD6hUxc3pakuqadI1MBpKM8gOnM
         9R60Pu8PsdzFlApdVCKUUcqwxe1idBzgvFEtiCnWvMvHkn6TsxuvEN3mt7b754qmO3gT
         W6U0UVQHOeOYWZyGzaOd5dYzWi0CTS7gUSYw+dXrjd6xkFWJQbQD5lVN5Tw8VRP//+sV
         NNVk1vEgm6e0X60Vc0iORfBQOTYeUWu1NSgVG+PneKokSqAOKPqCPfowVmh2GgDUR/h5
         0Xzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=WYnB7nGUhemAB2OMSfbBH2+7mmZxfmf6XLJKhWZVYF4=;
        b=Owv9aMw81kijdQE47vRt4EN3sclfkmWDcY/0vMkrZN7/nS5j9hsfrItO2KM6aGAYfh
         4kb4SflRLDXDXaBYzyTdBbJBXGhsHjvfIOSVumaEZK3j4iys27r403O20M+2x8rsZwKH
         BnWGjGUdVdGSemGF4x7XHGufj9PB56+1x0Xohmq4kJq1d8tdN/+w0vHhpj8/+QbJ9f07
         92w7xnxj+UyZjvM7frdn2abXmeCtRUyDAECiIo5ouYtriLpbYqMH7GqPcbgma/pCxirY
         1gwUv8Qbgad6mpo9PXeBC6XdX520ptxst72bLf4ZSsMEWcYYKLWkqPZjOs7SS+QC0D54
         lpvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m16-v6si5140882qvk.218.2018.08.14.05.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:43:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYfT-0005W2-1U
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:43:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfF-0005Ub-NE
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfE-0002Eg-Pw
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfE-0001z2-I0; Tue, 14 Aug 2018 08:43:08 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYfC-0006q5-M7; Tue, 14 Aug 2018 13:43:06 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:50 +0100
Message-Id: <20180814124254.5229-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 06/10] target/arm: Implement AArch32 Hyp FARs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgari@xilinx.com, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fwi8VTbPMXR6

The AArch32 virtualization extensions support these fault address
registers:
 * HDFAR: aliased with AArch64 FAR_EL2[31:0] and AArch32 DFAR(S)
 * HIFAR: aliased with AArch64 FAR_EL2[63:32] and AArch32 IFAR(S)

Implement the accessors for these. This fixes in passing a bug
where we weren't implementing the "RES0 from EL3 if EL2 not
implemented" behaviour for AArch64 FAR_EL2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9701e413859..d6e98e9d606 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3847,6 +3847,13 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
     { .name = "HSTR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
       .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "FAR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "HIFAR", .state = ARM_CP_STATE_AA32,
+      .type = ARM_CP_CONST,
+      .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 2,
+      .access = PL2_RW, .resetvalue = 0 },
     REGINFO_SENTINEL
 };
 
@@ -3922,9 +3929,14 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "ESR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.esr_el[2]) },
-    { .name = "FAR_EL2", .state = ARM_CP_STATE_AA64,
+    { .name = "FAR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.far_el[2]) },
+    { .name = "HIFAR", .state = ARM_CP_STATE_AA32,
+      .type = ARM_CP_ALIAS,
+      .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 2,
+      .access = PL2_RW,
+      .fieldoffset = offsetofhigh32(CPUARMState, cp15.far_el[2]) },
     { .name = "SPSR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 0,
-- 
2.18.0

