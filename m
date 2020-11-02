Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3821044lfa;
        Mon, 2 Nov 2020 02:58:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTYScIU3SvqEHChci3BTHCEaqk5BhansIslLA3z2hpEjxtPkKO4kf2sa1quMVw2rjgYI2i
X-Received: by 2002:ac8:5bd5:: with SMTP id b21mr13880977qtb.60.1604314700599;
        Mon, 02 Nov 2020 02:58:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604314700; cv=none;
        d=google.com; s=arc-20160816;
        b=jyTVRpYGPksOFSHqE8lyJN4Byuh6ylQ4pIEqkcLPFvLw0sLRqQx5zH3JRlybGX8p5t
         Ql4kseWILZeF40yIc83sUR46r6gvjKXL3zH8/JyKJyV/MUeeuwdfbpZYDl20kt+8sRin
         A3f2yuhVep9mQJC7AI/Q31v6R9AGXCDUO/dwQQ/Re+HrJ1/nqsORUMvJ9/0pU2KZ+N1d
         +MlIQRs8N3h3ueLR27v7GCmjRrVVz/stxApKvXqFgdbLfwK/uYHUKfSpLD9stJMMd0Sz
         E7MivPP+cVo07Obmz/XrGP2tyChAqlVN11LFyok6a8CehEVKjLGl5XklAi/X7v8terqf
         W2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ZvzD0qJPE3nghe8Dbw+eD9G3Px+g3d+PnNhV+NDN1pE=;
        b=s57OTeK2g5LQ9kzDwRrSO6w9Z7o9e1os2s2Qh0ay346vlH3Ek7vL/+ZwJFG2SzaRpu
         NPRbwRjVAmmIJaQywLYcPvE9HSjSBX+7CM53BvPbYRKDa3U2ruvAvS9GTH1p13VgntqJ
         jUhIVIXIifiMeEdek2PkGe4Uqp4TJkz5n8dgi08Dxd4ogGR+QdlWJRTcSWZ1bNAHOEAC
         aPlsM+PkjanMDLPza4DshRULt7NUIwSTVEvlogI3QNhxbO7js57COaIKun33N4zMjlc6
         BWKZP5iMZvv4B/vhgJEsG2ZS8ppjXAe2YsRIppOF7TMcipQgFPPpVuYJVQqX7cZ+45zU
         KAvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si8418036qka.58.2020.11.02.02.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 02:58:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZXXX-0007Rm-UJ
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 05:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kZXXN-0007QB-Lc; Mon, 02 Nov 2020 05:58:09 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:39546
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kZXXL-0006jB-T4; Mon, 02 Nov 2020 05:58:09 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 7B21860098;
 Mon,  2 Nov 2020 11:58:03 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 05/14] target/arm: declare new AA64PFR0 bit-fields
Date: Mon,  2 Nov 2020 12:57:53 +0200
Message-Id: <20201102105802.39332-5-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <2172054.ElGaqSPkdT@basile.remlab.net>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:57:15
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iuDTxsWBT0LR

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 263e650560..724b11ee57 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1849,6 +1849,12 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
 FIELD(ID_AA64PFR0, GIC, 24, 4)
 FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
+FIELD(ID_AA64PFR0, SEL2, 36, 4)
+FIELD(ID_AA64PFR0, MPAM, 40, 4)
+FIELD(ID_AA64PFR0, AMU, 44, 4)
+FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, CSV2, 56, 4)
+FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
 FIELD(ID_AA64PFR1, SBSS, 4, 4)
@@ -3879,6 +3885,11 @@ static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
 }
 
+static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
-- 
2.29.1

