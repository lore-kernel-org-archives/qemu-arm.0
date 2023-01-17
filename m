Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2448846ejc;
        Tue, 17 Jan 2023 07:04:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsjwxJNSUVoTTDTdyRdlslTbUct1Yu/pl2MfUE66pWVLGiGDD5Xl0uWjHWEWJz75aFY9f4k
X-Received: by 2002:a0c:fac5:0:b0:534:dfcc:f423 with SMTP id p5-20020a0cfac5000000b00534dfccf423mr4838582qvo.48.1673967879952;
        Tue, 17 Jan 2023 07:04:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673967879; cv=none;
        d=google.com; s=arc-20160816;
        b=esSOF6mHw9JiaNFcjBx8oGu4QjdndX46013KjEHwRzdeExNIIaLPdoxB94dYGGiVlM
         Wcidpdbi+uvfYXgB5nZCtf3FoEq7WDnxEfMmeEikvzq/qtQ/Mnk4NsMfVimYkcZC79t/
         V6yW27buP6UbLb2CCxkBMyFpeD79OEIzXpAxpEs+drWnucH2OlTwAA4lC3XTMt7oZLbu
         lDFiYntv10FMnlMuYonxYJtb5FITiZP2nFeAZRW555ZxlpkMveNhdbeqcl9MuLSEV7vI
         SHV268ZvEa/JjKeYgYxV7qCazVB2oO3JyhXwNdY9q/tiqRs4PaMJVWicN1D0NfoxlMKo
         i/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=6+WWXUG+FtOsFgttNAevqrhh9iBa3N55JRLaBzhwZOw=;
        b=CVsCFvwFYgP0TA/R2E9ePyXiWmhIja35S5qsa925KrOdY/1F0n73dalBcSc9zm9nWI
         yYmi9zoZx4l/ywqYeTe+5OGWgEv2bcUhlCIfFmGPbD5xJz6InsNudqLsEnr3yF3IypQj
         yJQOC17GoN2ADDPORemtyY/pfMksuaRYde8e68k6gV3oZEmjjIrzPexzALxXRudpxPq8
         N1R1Lv7r6Ib78qbfTs85zNoLKoQN8trsOQ81tcbxXkF1bEyyIwIPJOz+kwMpC+SMVjg4
         wh8u1rJCx4T40VNEM4uMOYBX10DpV381Jxhfy1Y97SRvBDXbesBIiwqcPkO3udhOYm1y
         NA7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=bzULKc51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm11-20020ad45ecb000000b00534f2e547b7si3782752qvb.476.2023.01.17.07.04.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 07:04:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=bzULKc51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHnVb-00060V-Ip; Tue, 17 Jan 2023 10:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHnVY-0005zb-DK; Tue, 17 Jan 2023 10:04:16 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHnVW-0000Wl-UU; Tue, 17 Jan 2023 10:04:16 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5A31A20DFE9C;
 Tue, 17 Jan 2023 07:04:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5A31A20DFE9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673967853;
 bh=6+WWXUG+FtOsFgttNAevqrhh9iBa3N55JRLaBzhwZOw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bzULKc51lw2X3jXsiuNIg3XhXZ1tVlvoDPMh2E8CIUXetR3B7oMYzUTDrdo8EDnq1
 kOKzJ6sgaR2ZwluOG4O0UlfPApDiQ9Lwa+hTTho2y2PjaeRWLHmwkhY48msMpq8m0E
 sCUHM7uAYYsnqDdRHTL38rUUnES2lKFbTdUNDR0Q=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 2/2] target/arm: provide stubs for more external debug
 registers
Date: Tue, 17 Jan 2023 16:04:05 +0100
Message-Id: <20230117150405.2940-3-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117150405.2940-1-eiakovlev@linux.microsoft.com>
References: <20230117150405.2940-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bJtM7lC6XuUG

Qemu doesn't implement Debug Communication Channel, as well as the rest
of external debug interface. However, Microsoft Hyper-V tries to access
some of these registers during an EL2 context switch.

Since there is no architectural way to not advertise support for external
debug, provide RAZ/WI stubs for OSDTRRX_EL1, OSDTRTX_EL1 and OSECCR_EL1
registers in the same way the rest of external debug is currently done.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 6c34c6e27d..bc213ac91e 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -684,6 +684,27 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
       .access = PL0_R, .accessfn = access_tda,
       .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * OSDTRRX_EL1/OSDTRTX_EL1 are used for save and restore of DBGDTRRX_EL0.
+     * It is a component of the Debug Communications Channel, which is not implemented.
+     */
+    { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "OSDTRTX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * OSECCR_EL1 provides a mechanism for an operating system
+     * to access the contents of EDECCR. EDECCR is not implemented though,
+     * as is the rest of external device mechanism.
+     */
+    { .name = "OSECCR_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
      * it is unlikely a guest will care.
-- 
2.34.1

