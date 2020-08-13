Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp391350lfy;
        Thu, 13 Aug 2020 03:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxnGFCxhwLsmyx4Rn8ZH9YwE/t85taqeY9rqIuUagOvbk8lYuCEfKOOS0WL/SipsIhTprg
X-Received: by 2002:a25:c58c:: with SMTP id v134mr5749139ybe.138.1597315058230;
        Thu, 13 Aug 2020 03:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597315058; cv=none;
        d=google.com; s=arc-20160816;
        b=NaiA7dJGPQ0sNiD7iFN/ln1UP+nVc1hKwcDoYDRld6KzKj2YLBjACqtNLemejBSoN4
         YaYCdiFTdg5bW8QneQwyyUHyPsgD70nkm9eVZj2CnBH1Rabac0kVuN1fA6blQcfgcPwZ
         LD8rqHkE3HA7kSE3UacEwefy65BQAmhnNrcpwNAk/vJTDSNyH1IG0b5z8w+azirnHiDk
         J4+NNfgJGENPCfR2NK2pwQdIbawoR1eOlwM3NSJLqX0bcJHh/JyZ5Gdro0pCN5/HFZ6+
         /PUsX4AYu0vMNJpOviA2Ph7LpOnM52BEVj2FDDfpsE78UK2PcoEy7nsYx+N2Oby36tYx
         OiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=3yorr9qBrGmkf3aZnguexf3UWD7MUF8uK0rxdkkXRgc=;
        b=dypdeCfexjl20oiHlhfAQ5QHxMsGFQEhLAfZTo5OSRYE0oE7tkqSarT2mr3Iognnwk
         wxy9WfiMMRnV8GImLm6fwSmrg0GemIfAjW2H5naU1Px857/I0ITjBU1HUINsjhYTYCDh
         fKbj9CeLL+RRfLn389PYFHxLsU1IyZMH4fl8DNb2tM6GxKxETHjs8YHAMt2n+Ibwjs+b
         cg4qVF1qrCARbicg3Mp26BomdWtYQgEq+0UQdTJv+ITozpgS15W1LsteLWDx8pVuK55h
         r0ha/muaibBXBLKUHErhRTlmHFgfCIKG5FYOyQqNh7rxbSOm6e0c/4mDdDGJFgavXAe9
         NXnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t186si4834145ybf.203.2020.08.13.03.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 03:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6Ac4-00006o-QX
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 06:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXI-0000Hm-8H; Thu, 13 Aug 2020 06:32:41 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4187 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXE-0006qI-UM; Thu, 13 Aug 2020 06:32:39 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3200CEA3B6E4E788421F;
 Thu, 13 Aug 2020 18:32:32 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 18:32:22 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC 8/9] target/arm: Update ID fields
Date: Thu, 13 Aug 2020 18:26:56 +0800
Message-ID: <20200813102657.2588720-9-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200813102657.2588720-1-liangpeng10@huawei.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 06:32:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OQ+jSKhNvY2U

Update definitions for ID fields, up to ARMv8.6.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index da68b7f8f4..7a46d223bc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1773,6 +1773,8 @@ FIELD(ID_ISAR6, DP, 4, 4)
 FIELD(ID_ISAR6, FHM, 8, 4)
 FIELD(ID_ISAR6, SB, 12, 4)
 FIELD(ID_ISAR6, SPECRES, 16, 4)
+FIELD(ID_ISAR6, BF16, 20, 4)
+FIELD(ID_ISAR6, I8MM, 24, 4)
 
 FIELD(ID_MMFR3, CMAINTVA, 0, 4)
 FIELD(ID_MMFR3, CMAINTSW, 4, 4)
@@ -1818,6 +1820,9 @@ FIELD(ID_AA64ISAR1, GPI, 28, 4)
 FIELD(ID_AA64ISAR1, FRINTTS, 32, 4)
 FIELD(ID_AA64ISAR1, SB, 36, 4)
 FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
+FIELD(ID_AA64ISAR1, BF16, 44, 4)
+FIELD(ID_AA64ISAR1, DGH, 48, 4)
+FIELD(ID_AA64ISAR1, I8MM, 52, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -1828,11 +1833,18 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
 FIELD(ID_AA64PFR0, GIC, 24, 4)
 FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
+FIELD(ID_AA64PFR0, SEL2, 36, 4)
+FIELD(ID_AA64PFR0, MPAM, 40, 4)
+FIELD(ID_AA64PFR0, AMU, 44, 4)
+FIELD(ID_AA64PFR0, DIT, 44, 4)
+FIELD(ID_AA64PFR0, CSV2, 56, 4)
+FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
 FIELD(ID_AA64PFR1, SBSS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
+FIELD(ID_AA64PFR1, MPAM_FRAC, 16, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
 FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
@@ -1846,6 +1858,8 @@ FIELD(ID_AA64MMFR0, TGRAN16_2, 32, 4)
 FIELD(ID_AA64MMFR0, TGRAN64_2, 36, 4)
 FIELD(ID_AA64MMFR0, TGRAN4_2, 40, 4)
 FIELD(ID_AA64MMFR0, EXS, 44, 4)
+FIELD(ID_AA64MMFR0, FGT, 56, 4)
+FIELD(ID_AA64MMFR0, ECV, 60, 4)
 
 FIELD(ID_AA64MMFR1, HAFDBS, 0, 4)
 FIELD(ID_AA64MMFR1, VMIDBITS, 4, 4)
@@ -1855,6 +1869,8 @@ FIELD(ID_AA64MMFR1, LO, 16, 4)
 FIELD(ID_AA64MMFR1, PAN, 20, 4)
 FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
+FIELD(ID_AA64MMFR1, TWED, 32, 4)
+FIELD(ID_AA64MMFR1, ETS, 36, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -1881,6 +1897,7 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, MUPMU, 48, 4)
 
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
-- 
2.18.4

