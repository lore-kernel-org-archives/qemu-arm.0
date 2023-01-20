Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1188148ejc;
        Fri, 20 Jan 2023 08:00:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt0CrqUxnAbYRjiXVY0PuG1JNE3BLsBGDDzG0cDsHlg7d7PvdGLHdw5bDhp5VqkKzegZLJ6
X-Received: by 2002:ac8:754f:0:b0:3b6:2ed3:9de3 with SMTP id b15-20020ac8754f000000b003b62ed39de3mr19243057qtr.17.1674230429955;
        Fri, 20 Jan 2023 08:00:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674230429; cv=none;
        d=google.com; s=arc-20160816;
        b=eOJ1dS6e0vM6jenNHtJ1urueW9ueLKdPNnp2IjsMQylldP5xS7WyTeKBOniN2H5Xch
         4aJBTSA843NkeK2fz5tS/qei0tivjVywy7AsZPG43CEmHR5ixugyQ0EYn1klmb0G2IBu
         DVcXPMn4VDflwXfMtARdF0mRe/jFcuzCYWIhuGZqo6uEZL44D0JfsYdhsUstPDlCCQMf
         IjQvsINVj15nQ3yT12xM3HgiBnUp7B1wYjVUgkLSayX4egFqbqRo0Gm37tsjp7e3GWWj
         MWpgdo9XXkq+L8RjR17COl5V5xIHQJgTK7lwCKB67o1QmmyvCMgHrmjUtOjpq+LIPmoj
         PwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=tFMPxB0L9r693TYqKyta4bP0oyicjf+0PFS4XgnOqFQ=;
        b=W+T12M8Nedbsgnxc+UOpKisv5CcGV8ahsEJ2hMGA431rluJVT14MrZNcrKV0dpyJsF
         tJxlX7ei8vCbMDhjJjpymED8897xxcha91LIcRInJX+dv3nooomI1mNZ+i7fFoI7vUZY
         5sZhVpz8GW65a/FW8etq9vxsWxYY77/EWxRzP06aFEzDlmCsaDBw8I9VvvpHIJu7U9Ov
         wpLD5qGucCx5xOFoeluzlWJ3qac7Lmmp08Mi1XO2r4U39dTH2rQgMmTrEVT7zG16WRys
         MbxaHlGL5t0udbUx5yT1hfF3rfZzvWS9OLQsDMIl09A4WWXepjk4FoyGc+gEPMJRBJYx
         pczw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Kl8trGAl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id em5-20020a05622a438500b003ab8b0622d5si6872931qtb.95.2023.01.20.08.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 08:00:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Kl8trGAl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItnu-0000gp-2E; Fri, 20 Jan 2023 10:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItnp-0000fh-Am; Fri, 20 Jan 2023 10:59:41 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItnn-000743-SA; Fri, 20 Jan 2023 10:59:41 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id A35B820E1A49;
 Fri, 20 Jan 2023 07:59:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A35B820E1A49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674230378;
 bh=tFMPxB0L9r693TYqKyta4bP0oyicjf+0PFS4XgnOqFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kl8trGAlDQ4es/UA94Xcf0bLdrQBy5Kkee1BTtXmaf7tgsmKXlkx+ZZ2R/fg+fP8j
 TwSY+KF9kv6QUi8bbXnfZ7RQyOumCKInL8+QlYC8QCBLXuTQWTGcfVHEzGm4RQHS7X
 C3ReJAJQlzcXEYkxSSsJJfyPH7tlb71cr1owSXeA=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PATCH v3 2/2] target/arm: provide stubs for more external debug
 registers
Date: Fri, 20 Jan 2023 16:59:29 +0100
Message-Id: <20230120155929.32384-3-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155929.32384-1-eiakovlev@linux.microsoft.com>
References: <20230120155929.32384-1-eiakovlev@linux.microsoft.com>
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FDwthHaCsy3P

Qemu doesn't implement Debug Communication Channel, as well as the rest
of external debug interface. However, Microsoft Hyper-V in tries to
access some of those registers during an EL2 context switch.

Since there is no architectural way to not advertise support for external
debug, provide RAZ/WI stubs for OSDTRRX_EL1, OSDTRTX_EL1 and OSECCR_EL1
registers in the same way the rest of DCM is currently done. Do account
for access traps though with access_tda.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index f95a73329d..cced3f168d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -682,6 +682,27 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
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

