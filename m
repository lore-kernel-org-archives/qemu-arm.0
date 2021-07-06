Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2181234lfk;
        Tue, 6 Jul 2021 06:46:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNbhKJH/afGpzHsqDkOmEtqIB8pe27i8fQmYQB75YBetyCbXI2cNGmgiG0ZX1Tjfx0PfER
X-Received: by 2002:aa7:db93:: with SMTP id u19mr23051898edt.227.1625579200072;
        Tue, 06 Jul 2021 06:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625579200; cv=none;
        d=google.com; s=arc-20160816;
        b=hxtnB0wJyJsYE5aEEQSxA5NyHEliwGeQGEuSWqBA+uoPqyexVVQIUH2DDUzDhuhEtS
         0iccmuqOgkXLYz/tKLvIsN0l3vYdsWMl5C8yvXIGUjQ61yKhLCvzKLeSmQht8Mru6wc/
         dKFli7ekO+1WroJrlDwGOnh9ysJlVC2zG24Pcq0XpAuNW4AhKU2vNZjUAMxRf51yraPI
         NCIFx49W6W9BzWgSaxQtRPDs9FsZLM1ZVFXZocm8jtZoFBjyBiGglPP1SxF/HFdYhwd5
         x6vbJhrzGc+eX79GaH5CX0ArCCzMuXHFcphOXqMTHi1aEMJSrLZoaFd0LzRoqsg/KdpF
         iX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=fLnoO64X/zqIURApIwYoBqTfRiDgdoBv8dyDgFImGhs=;
        b=kHzBdmhtL/9ExNBzEMusrvn6w2ypn9h6C2s3v6kIsvVzh7dhDJHLhPCfw/yaUPswBd
         rKg2s9eJH73I1tBHDPm77Xg1+jmlSl6s03+MrdjlmWrdbJeVAX64itnmoTX75dVhHtUu
         JtHoxY/MTwdGZRebDccPID+hX2UKkI+jAVLYuVxngUdalhPnbMTdvuetCXwIfVlpHWj5
         qjBSbwc0Ic4t/+9v5sq8hnPO6gBULB+QLORjUYnuWXIl8ZAHjDPcZUs1nkcUxolJbPvU
         gCn4POplY8HIdUz2DWiraJ8nZlRU4ViY3Fjh1kSRZe5nkBm8q6Sbi+Vcz2MwnirhfpeF
         KlHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vmware.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx15si13923750ejc.135.2021.07.06.06.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 06:46:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vmware.com
Received: from localhost ([::1]:58200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0lPL-0001Hj-6d
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 09:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1m0lNs-0008Nc-3L; Tue, 06 Jul 2021 09:45:08 -0400
Received: from ex13-edg-ou-001.vmware.com ([208.91.0.189]:34604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1m0lNp-000463-Gb; Tue, 06 Jul 2021 09:45:06 -0400
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 6 Jul 2021 06:44:57 -0700
Received: from bos2-arm-build.eng.vmware.com (bos2-arm-build.eng.vmware.com
 [10.118.233.19])
 by sc9-mailhost3.vmware.com (Postfix) with SMTP id 0C956202AF;
 Tue,  6 Jul 2021 06:44:57 -0700 (PDT)
Received: by bos2-arm-build.eng.vmware.com (sSMTP sendmail emulation);
 Tue, 06 Jul 2021 14:44:57 +0100
From: <hnick@vmware.com>
To: 
Subject: [PATCH v2] target/arm: Correct the encoding of MDCCSR_EL0 and
 DBGDSCRint
Date: Tue, 6 Jul 2021 14:44:57 +0100
Message-ID: <20210706134457.81059-1-hnick@vmware.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-001.vmware.com: hnick@vmware.com does not
 designate permitted sender hosts)
Received-SPF: pass client-ip=208.91.0.189; envelope-from=hnick@vmware.com;
 helo=EX13-EDG-OU-001.vmware.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Nick Hudson <hnick@vmware.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SNULHLIGdq70

Signed-off-by: Nick Hudson <hnick@vmware.com>
---
 target/arm/helper.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a66c1f0b9e..910ace4274 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6326,11 +6326,21 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_tda,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
       .resetvalue = 0 },
-    /* MDCCSR_EL0, aka DBGDSCRint. This is a read-only mirror of MDSCR_EL1.
+    /*
+     * MDCCSR_EL0[30:29] map to EDSCR[30:29].  Simply RAZ as the external
+     * Debug Communication Channel is not implemented.
+     */
+    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
+      .access = PL0_R, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
+     * it is unlikely a guest will care.
      * We don't implement the configurable EL0 access.
      */
-    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
+    { .name = "DBGDSCRint", .state = ARM_CP_STATE_AA32,
+      .cp = 14, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
       .type = ARM_CP_ALIAS,
       .access = PL1_R, .accessfn = access_tda,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
-- 
2.17.1

