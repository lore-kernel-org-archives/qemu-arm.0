Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3647585lfa;
        Sun, 1 Nov 2020 21:44:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUfaOEJdymfDPfiGGc7mfFzn1WtJuAVa76D4JbGaasT98bMr+4cnK/zLgqY6JxVeTjlfzc
X-Received: by 2002:ae9:ed8d:: with SMTP id c135mr12021025qkg.120.1604295868028;
        Sun, 01 Nov 2020 21:44:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604295868; cv=none;
        d=google.com; s=arc-20160816;
        b=rAhECxYKElUsCP7k3rz5/vZdXvhfyBcAPorJcpMk3avGXs90ErF2CKp/lAdYSG+UKH
         /ZEYh+lYv9idCZDFqUuM0CrX1JbOSuQ2aJ59G9ckRF48gQystdDJBvySh01ByPTyLUf7
         7gXXoWzhfrjK5btZJWgXXbnnFmXUNYVCT+/A3RK+6KJw08N29Id8MITrhGOJO0I1bvzK
         9bb7Ensjpt2BFS2JtDTN3o1r5f0Npw4UUdNRqJxCT5fub6aItmK/JsT9oqmQ3PLT9mVI
         E+KhOpgi0ytnRlaZIzAzKlUIGMtv9CS+IIZYRZciFfMzE69H6QuDrKv8PHqzg5kh8ImW
         Hylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=84/K2UIuUWTCmgol1reIFv74poGtFRXhIgUZqJvA924=;
        b=B11skA8/fNLYh7YjulPiAM+Vy0Xp8/7sKO8J8ER1A4CtLtj6yy+v9CGNjcAiGhsfXS
         SLzbF9X6Qu7Go3oxdRcm8POZplgjAMmZ+5SPLQfipa1DbilWm9iIJBWCeSZh/zN6jvrg
         yL56yPwh5dk1J/WzeIwKUdJL/+3kUgVOaMMJcF6KLoezzUx7ayRxeI2/R27GsWJwTHPE
         qNWq251cY69GKSnuaN4QCOChYge75dAgZoI3VLL5XvH5TsJo8+IqbQpQ/fTKWnkpAQQ3
         ZC3Zqrdi8D1Yl2kRC01DZnWe+bmzeE9PImWuWzCsj8/FlKlAKcd6lg6VCL6BbIwga6g2
         ATyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19si8388220qkh.264.2020.11.01.21.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Nov 2020 21:44:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZSdn-0002Pa-9X
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 00:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdI-0002Mt-Vv; Mon, 02 Nov 2020 00:43:56 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdG-0001EQ-BI; Mon, 02 Nov 2020 00:43:56 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPhfh4GQmz15PWJ;
 Mon,  2 Nov 2020 13:43:40 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 13:43:35 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v3 02/10] target/arm: Update ID fields
Date: Mon, 2 Nov 2020 13:40:47 +0800
Message-ID: <20201102054055.686143-3-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102054055.686143-1-liangpeng10@huawei.com>
References: <20201102054055.686143-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 00:43:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: lNK7sKThmLQR

Update definitions for ID fields, up to ARMv8.6.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c18a91676656..4c76fff1985f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1776,6 +1776,8 @@ FIELD(ID_ISAR6, DP, 4, 4)
 FIELD(ID_ISAR6, FHM, 8, 4)
 FIELD(ID_ISAR6, SB, 12, 4)
 FIELD(ID_ISAR6, SPECRES, 16, 4)
+FIELD(ID_ISAR6, BF16, 20, 4)
+FIELD(ID_ISAR6, I8MM, 24, 4)
 
 FIELD(ID_MMFR0, VMSA, 0, 4)
 FIELD(ID_MMFR0, PMSA, 4, 4)
@@ -1839,6 +1841,9 @@ FIELD(ID_AA64ISAR1, GPI, 28, 4)
 FIELD(ID_AA64ISAR1, FRINTTS, 32, 4)
 FIELD(ID_AA64ISAR1, SB, 36, 4)
 FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
+FIELD(ID_AA64ISAR1, BF16, 44, 4)
+FIELD(ID_AA64ISAR1, DGH, 48, 4)
+FIELD(ID_AA64ISAR1, I8MM, 52, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -1849,11 +1854,18 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
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
@@ -1867,6 +1879,8 @@ FIELD(ID_AA64MMFR0, TGRAN16_2, 32, 4)
 FIELD(ID_AA64MMFR0, TGRAN64_2, 36, 4)
 FIELD(ID_AA64MMFR0, TGRAN4_2, 40, 4)
 FIELD(ID_AA64MMFR0, EXS, 44, 4)
+FIELD(ID_AA64MMFR0, FGT, 56, 4)
+FIELD(ID_AA64MMFR0, ECV, 60, 4)
 
 FIELD(ID_AA64MMFR1, HAFDBS, 0, 4)
 FIELD(ID_AA64MMFR1, VMIDBITS, 4, 4)
@@ -1876,6 +1890,8 @@ FIELD(ID_AA64MMFR1, LO, 16, 4)
 FIELD(ID_AA64MMFR1, PAN, 20, 4)
 FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
+FIELD(ID_AA64MMFR1, TWED, 32, 4)
+FIELD(ID_AA64MMFR1, ETS, 36, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -1902,6 +1918,7 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, MUPMU, 48, 4)
 
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
-- 
2.26.2

