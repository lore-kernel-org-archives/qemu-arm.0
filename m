Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp373573eja;
        Thu, 29 Feb 2024 05:12:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXN6RhFyPN7/Udbg+f/yNskVpbsFRPhqcZUR8y+huBy0IBNkaEZwyntwrlV8J58H4USMahtaspMKIqFd7jeGW31sqG7AH5p
X-Google-Smtp-Source: AGHT+IHMZ4zeZx2FVBStIcLt2Z8+aMivu+B/RtikQQDTkfsp5sO0rvOA68EUYIoCua+A/sGPWJvm
X-Received: by 2002:ac8:5dce:0:b0:42e:814e:e0c8 with SMTP id e14-20020ac85dce000000b0042e814ee0c8mr1814974qtx.47.1709212345374;
        Thu, 29 Feb 2024 05:12:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212345; cv=none;
        d=google.com; s=arc-20160816;
        b=aILpPNdzU6sLA3oZ5qK7zClEuKb2GTOYajdqTjouLu+Or4D/8usvdbQJqcB3JXTRSg
         E9imUPuWYS627aN0/fEp2l6bq4Mvniy1FrfFVYbyCNxkZJSZ4fImVOGFqrqsPluTF7xU
         FVMNxHvV6Ztp5uwJqmmW4huGo/58ORgLo9LieMFb9bczlw36SAsBQ6QWXI+QMSYTzYLZ
         Wjs2u1FYiGSKYEy/g0yxPbGiPM9gPltU5npOMh90LYBv82S7StV0xLPgtCJvu71hNeRP
         ZcR1Or2URDFZ1OmBPnTOtBJ5qfjOmnd/Qict6WHcyvMLwso8bcQqV17WIfZUmeg/TZpI
         o8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=8TFonrZeeb9Z5oiTebD7Ywi/vJ/Y18Mgf+7PSNgiT1o=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=V/B1gyPQJYfUJ1hd5D9nQlWumNj9MbyxUaEECSP3uOfTdF+9XVwGD0BOfOF+ZhEAdx
         qaWjoBSUbhg9ifpyGUoUVwiFg9TJY6NAzWM0XMh68md+x+DJep8ERnePMuT6Ul/11659
         p7PC7QrQFM3DaJGmjR/tUKo17yf+E68d8QE/JjtrpLuiKPnGYNotzDTsjxoap23ajBv2
         jLGFaT0JcBkMLNqhm3ykaVEBcb0KtjRf4BUxtiIBOl5pYlqe9ECpNFQpLYGIAxrI1xDF
         ZeyUPbRco4CdfVRhge1tOlNEu8J7o1vcOBFZY0N/LySKdn2FLhoLTBQDjnP+eEdmh6Xd
         O3cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020ac84584000000b0042e5b820fd4si1295974qtn.619.2024.02.29.05.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:12:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfgCb-0005c2-Oo; Thu, 29 Feb 2024 08:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCZ-0005YS-G0; Thu, 29 Feb 2024 08:11:55 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCW-0002d5-UG; Thu, 29 Feb 2024 08:11:55 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tls4j24zqz2BdYB;
 Thu, 29 Feb 2024 21:09:25 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 42804140390;
 Thu, 29 Feb 2024 21:11:41 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:40 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 01/22] target/arm: Handle HCR_EL2 accesses for bits
 introduced with FEAT_NMI
Date: Thu, 29 Feb 2024 13:10:18 +0000
Message-ID: <20240229131039.1868904-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ukfm9YeRZmgP

FEAT_NMI defines another three new bits in HCRX_EL2: TALLINT, HCRX_VINMI and
HCRX_VFNMI. When the feature is enabled, allow these bits to be written in
HCRX_EL2.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v4:
- Update the comment for FEAT_NMI in hcrx_write().
- Update the commit message, s/thress/three/g.
v3:
- Add Reviewed-by.
- Add HCRX_VINMI and HCRX_VFNMI support in HCRX_EL2.
- Upate the commit messsage.
---
 target/arm/cpu-features.h | 5 +++++
 target/arm/helper.c       | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 7567854db6..2ad1179be7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -681,6 +681,11 @@ static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SME) != 0;
 }
 
+static inline bool isar_feature_aa64_nmi(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, NMI) != 0;
+}
+
 static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
 {
     return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 90c4fb72ce..affa493141 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6056,6 +6056,11 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
         valid_mask |= HCRX_MSCEN | HCRX_MCE2;
     }
 
+    /* FEAT_NMI adds TALLINT, VINMI and VFNMI */
+    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
+        valid_mask |= HCRX_TALLINT | HCRX_VINMI | HCRX_VFNMI;
+    }
+
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
 }
-- 
2.34.1

