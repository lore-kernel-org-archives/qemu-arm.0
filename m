Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2896787lft;
        Mon, 27 Jun 2022 21:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uKwj793OgfFIY9srzUPEaiGRNDVCHkDHIWz/6JV3U4qTpyWe7tNSzgjIDS04yqLPf8r1pp
X-Received: by 2002:a37:a1c9:0:b0:6ae:db28:ea0a with SMTP id k192-20020a37a1c9000000b006aedb28ea0amr10361736qke.141.1656392224099;
        Mon, 27 Jun 2022 21:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656392224; cv=none;
        d=google.com; s=arc-20160816;
        b=SwXH3jyfz1lV0nsBbUm1Ujee3Fsu2lm60a5lO6EGuWavBMIlbnMLnboEIAl8Riv9BE
         3dv/FcclI6vE083sMvhLPsn0DyYhisZFvXsaejm7gpDIhzwB8HIrlfj/PLDl64ItF24I
         2+bg6I2+HqCU4F3ogOYxHUb6tXsAODJ+qGydz8Qer/dCPlMwJCDM7TTU9ErUvTcSe7NZ
         iV5rQCb8g/+X5Aff7rddWhsvWNGHUHzgf8Rus/KJF7wvkuxsCgPcb7MCxzrmfLFCfi5e
         cqQNhcpi7Wbby4ZHV/wuIZijUI/Hg1MwFspnIvAW0sogiehgDwUFRGvjn53+OFk6Wt76
         0ZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
        b=pe+jMA7jRVSP91vQ4QNkMFPk9SvJbXUxqBvh8IVXfjoWYxW7fqEmhFI36DOhoHougA
         V5Dm7Fsr7BaL9wkr0qBf+9prDi3d+dlhNSH8Y0Ez7Dd9OjP63/QTGyqD9LG4dLz6mlo3
         vi2fTYJ47ctR49ZKx3DsryoOG8svTL4JahKT9BgWuppEfsHWsgo4d5Ezu+1TsWToyhPC
         3BvHhhjaz+9lGt/NI7KCV9uzV7mD0wvXeYwgi0rnL6YP2/a3Uj3gQVh8wrK0ZcGz1PVG
         5hZRk/8ZuWqi+/G/9QDZDjAfWqjVbft/qrbEN1XUlwsb9Fjj0OogU7We0nEmwvwu8TXo
         Sd2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2x5BqQu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib11-20020a0562141c8b00b00470ad988246si4256896qvb.156.2022.06.27.21.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2x5BqQu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o63Hb-0004y4-Jf
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kR-0002om-C2
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:47 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kO-0003vl-Fs
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:46 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q18so9948866pld.13
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=Y2x5BqQuJUT7L7s9ZfBDTQkmSgsAXZkm0wo8r3elruj8sASAQSfwJlOyyOTvuyHWGG
 mHpnenItkofw/LO/xc6LvPlI9DZGkuh6I4os/uQQIRWgjlCN68C283qlf1O1e1Ov1z/B
 nLR+d/uL5FX8hnHcfqn4NH4FwcFqjdGH8dbFmsKIuJkcQDxtHHsNB2ay7dVHjqfamQg2
 Xc5u5J960qp4HOg5F+YD6vvjzidBW1KoUG1203tDSXQgMBj5+zsncu1YXIvGTXO/6ZJ6
 tUYav39LszqtUc0NAVNO0M9Pb1b3Z23It7cyMn6yvGR2z6ic2Cn10iFW0ILTGNO+Dr0q
 M2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=iWucglytDtaH6Q3gsfuwip/QqT3h97Zm73AS1q182uFA3FK5YCbDwXX/QWNRKDnI3m
 r+rmULyMI3WxK0b8FpSWO1z4WLGB58uiMyFN0LRvmdBFFfoGrrohhXZBiT2pgV0jDAW2
 fVXqrou0MMrm7hqcVblSf/hiAomZpe3cwU1bOsGqdS3FXqXMTPiQ39d95/uCuAwE89ez
 RHZaW47dIcqX2r8CH7gTadvtACR32MWqRxfCALsRIGlIcmETOLqwZwpAoWT5QObFNoeH
 /nF7lOjdygwG+2UzRCDtpRJGbMziHMv8vok7ouZaP8e6RY077Q07oz0QUfydnptttoHX
 h70A==
X-Gm-Message-State: AJIora/O3R3EpRVP00tXa3Kbi5d+gQGm+39zbbXojDcmEqkvv1OFvutp
 f8z4dSsPZ38NTRc9AQP1go+e8ptt1Fkumw==
X-Received: by 2002:a17:90b:4b42:b0:1ed:f6f:ff2 with SMTP id
 mi2-20020a17090b4b4200b001ed0f6f0ff2mr25916066pjb.131.1656390161288; 
 Mon, 27 Jun 2022 21:22:41 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 33/45] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Tue, 28 Jun 2022 09:51:05 +0530
Message-Id: <20220628042117.368549-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nx1UBTDmcomg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e..f90359faf2 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.34.1

