Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp5531207lfb;
        Sun, 27 Mar 2022 02:35:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmahR+erG7LbLqhzcsK+Nei1Y7+4WEHPOVRIpaSWfc61EEf3LvQ/YfOSsKgLBgcss5Hotc
X-Received: by 2002:a05:6214:624:b0:441:84f3:24e3 with SMTP id a4-20020a056214062400b0044184f324e3mr8867425qvx.27.1648373751977;
        Sun, 27 Mar 2022 02:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648373751; cv=none;
        d=google.com; s=arc-20160816;
        b=vqyybqSkMS8tkDjYpN4JA4XT925BYM6g6gDm/3jFf0OuL9ygRAPhyLU1Ad+oKgvq8M
         OTgZJDqYi1gOK0s2CEkgNjWTs9XsEkecBihY/2nvnpBNJU3/D76KInXAGLvvG2fEWMEb
         NGfHkMlATk5CWoyM4SMQdG/UYzu6/2fxUDv00Ad0wgvssJdDGmb+U8CcVcMQJicKAVuO
         RUTVE8Eobk5daCpnb4wbeaJI5G6rqF2ovtn1mS/kBzZh/dLrIOUCOt03lU9+8xn7TO/N
         Gpd1HhLz6i5/ODI8RnvWldNcL40vDtMBBZvlqHqfJTJnGByns18RyO5qOtniUjnthFp6
         BQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=32ha3mXOG7idErYcB8ciYo6fEXlt3LYVju+O4kEI5V0=;
        b=r2MVEDDg/1bGviN33Agf0dnGVayLRIDXU1FOMipgnmBQoxAIguBDNuYUfvNGnBebM5
         KDgtncv/pdjw/lm+CVZV69koPdMI2lK2MVFRsH7NIbCGDf9boWSvLKyp7af5PALF7Gwr
         Ff2th4j7gbU/bdijP6d5gMtwqFPIRSp+IeQUzH0mqGMPw5+hzLRN0ga1CVcdMUOqiQia
         a0gQYUFOhlAisgJfrjl1tUVXaYiG/hSA7CID5VK5wg8FujtmzcJOKMGoNN2FqGmIrOyc
         cFh38EobNUorvHvoVGEI1xMUVM5+RPBnLChpZq1MR0FGdWvS/h8HFDgib+dUTpDdp8jQ
         BaHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=BM9uKh0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a37ba05000000b0067e4be2397fsi3560767qkf.452.2022.03.27.02.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Mar 2022 02:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=BM9uKh0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYPJP-0002lP-GC
	for alex.bennee@linaro.org; Sun, 27 Mar 2022 05:35:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIm-0002kP-Uf; Sun, 27 Mar 2022 05:35:17 -0400
Received: from [2a00:1450:4864:20::331] (port=55201
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIk-0002cE-3f; Sun, 27 Mar 2022 05:35:12 -0400
Received: by mail-wm1-x331.google.com with SMTP id r64so6721042wmr.4;
 Sun, 27 Mar 2022 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32ha3mXOG7idErYcB8ciYo6fEXlt3LYVju+O4kEI5V0=;
 b=BM9uKh0NXhgUy0rn8axSF5lMsBPvsJDMSi++snsjaIpuZDoLT1Rbfasq+mlOeD0Mpa
 SsLTCEtWlUjP2ryZGsVifHELBcry46equoDtuHYc3beBSEi2demhE8jUB5qXq9dMNlkw
 6u7YGf6kpiXP8icmlcngsCVayjbvHBmES/9VTwK/+s3/4R9mFAm6icGG1ZCCfxNpmQzT
 J0wqGiNsT69d4wpKmZxybw1n5qoMZR7caE+gP4uz7cIq4SgoBma5mqpT8svPQ2zji9d4
 n0VeJNH4BkP0L4+O9ah7PgaNGQ4MF5ozAd0waBX7PDxeEuEaehMNLKd3gos3UQziudOj
 9Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32ha3mXOG7idErYcB8ciYo6fEXlt3LYVju+O4kEI5V0=;
 b=J6csn0SLC/q9OVoLjZ8ySbA7Wgh+3neBORWWduwruiX9gfWCLVf4185KsyeXf+FA0J
 pcZtJRBfjwwOPf/+KUpvRRtF6XI8Ot3xd0NRlWULVr7gX6/bnD+iRRPl1tzaGuvJou6w
 kwVATxghq/ffYSJ8obrTo33wNgVCXHwuSh7yG6K+LqVgQsTy6ejngwkhIzIYEzsBigas
 WMMtpG+32HnTIBTMEq0rGimoA8/OccyqVVMyb389MFI5Ona8MXZ510ksCiSbVDSI/DUm
 YlT/kP0guClmaQ+UONAnlOFazD1ClBV9U7GxZIxIZOEHpzNvtmrkMht+mr9m7h+DjcNl
 qlZA==
X-Gm-Message-State: AOAM532BF2YG/u3IaVnFxIyEJlb5DCNzNojMzvFpf8qOBj5uwvdlIhb6
 RafkMe9DgU7Vm1zT4wF4ImjaMwlgneM=
X-Received: by 2002:a05:600c:4f87:b0:38c:adde:1d99 with SMTP id
 n7-20020a05600c4f8700b0038cadde1d99mr27743614wmq.16.1648373696934; 
 Sun, 27 Mar 2022 02:34:56 -0700 (PDT)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-183-80-20.red.bezeqint.net. [79.183.80.20])
 by smtp.gmail.com with ESMTPSA id
 14-20020a056000154e00b00203f8adde0csm11892039wry.32.2022.03.27.02.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 02:34:56 -0700 (PDT)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/3] target/arm: Take VSTCR.SW,
 VTCR.NSW into account in final stage 2 walk
Date: Sun, 27 Mar 2022 12:34:27 +0300
Message-Id: <20220327093427.1548629-3-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327093427.1548629-1-idan.horowitz@gmail.com>
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YDKLmY36xo/G

As per the AArch64.SS2InitialTTWState() psuedo-code in the ARMv8 ARM the
initial PA space used for stage 2 table walks is assigned based on the SW
and NSW bits of the VSTCR and VTCR registers.
This was already implemented for the recursive stage 2 page table walks
in S1_ptw_translate(), but was missing for the final stage 2 walk.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 target/arm/helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d0265b760f..e2695e846a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12657,6 +12657,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 return ret;
             }
 
+            if (arm_is_secure_below_el3(env)) {
+                if (attrs->secure) {
+                    attrs->secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+                } else {
+                    attrs->secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+                }
+            } else {
+                assert(!attrs->secure);
+            }
+
             s2_mmu_idx = attrs->secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
             is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
 
-- 
2.35.1

