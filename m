Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp853987ejc;
        Sun, 15 Jan 2023 09:16:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv+FgAbgOndDcOR3myDD8QTKYWnDDYyAxgrgD3GCXBABYCr6LT7B2HbzZHpRvmaiSt9ANra
X-Received: by 2002:a05:6214:b25:b0:534:7163:b2bf with SMTP id w5-20020a0562140b2500b005347163b2bfmr16516526qvj.43.1673803013729;
        Sun, 15 Jan 2023 09:16:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673803013; cv=none;
        d=google.com; s=arc-20160816;
        b=ELpmMsV7Xxus8P+MeTeTMax4QyxcM+212YNOcCbIcHZY+axhXq+UpBnZQkQh8NlaG/
         jhEPnQQ4SIJs0lU1iA2e0MrrRrYAaLYDWh9HghpwBbmkQe2l90j3Jo8jXFMCG0NSszS9
         f7XfB+pFkLPNnbOVTRefq0bue0YStib0Qekw4Ntrhfe9Wh8GzKDJEw3b+YBItw+WRoam
         js4TepVfFmMjSALYultbI1FeD9uUOk3ntXNV20P1V+uHxglNwdNYrvt4YfYBMdFkyhhv
         lMHAKF0Eq6d0RRLxnX2rbqwmUFNszMC3AbYKYBMBXlI3ONdR12p95EMdPK6y2WU76z2J
         MlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mrv9cPitT4gYyiIqkJILWgmA5af8TdIaHVS1zuDY5+g=;
        b=NPmlNTpd477z5dRBTFVPklL+MSZLbJMbzO0EA+4Ca+LZkHHhyRApsTU1UScMzontfG
         Jsm7jOvLzmbMa63XW3PAxM0BZ2uWqqq1ZHhKQADhagdkAfjT9qTjPW3iouwMboslGU82
         1KV/99h4TU4NQciv1Fpvt+/OaiYc5hTo45fpg5wELk13FWxMJWNgI/ewBZ8LjVm4aidD
         dEz6nyPNqcUL2DRHpdB7eHM0WEVQPKN+B1UJTHq/W07E9Lml9mF4K2SO941hPoLOJYuc
         NOGoyMsVPd5en+EHd8bLePe8RDlfaEF8PmfYv0Wn+Rnx5k1YmDLHRY89M7jEfNMQqImw
         kYTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V/aLbKdU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu11-20020ad45ccb000000b00534f75324a7si1064541qvb.316.2023.01.15.09.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jan 2023 09:16:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V/aLbKdU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pH6ce-0002cq-Pi; Sun, 15 Jan 2023 12:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH6cd-0002by-0K
 for qemu-arm@nongnu.org; Sun, 15 Jan 2023 12:16:43 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH6cY-0004f4-Kl
 for qemu-arm@nongnu.org; Sun, 15 Jan 2023 12:16:41 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 gz9-20020a17090b0ec900b002290bda1b07so4828500pjb.1
 for <qemu-arm@nongnu.org>; Sun, 15 Jan 2023 09:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mrv9cPitT4gYyiIqkJILWgmA5af8TdIaHVS1zuDY5+g=;
 b=V/aLbKdUeYoZYJjxyx4V5iCLqRZKYSMBIv5AxjWuJrqftbtRMaSBxzNhHaaTYaSnVv
 RoH23OE3JMVkdQf3L1Tx6Nimv+E2+HvNqPhMsZnh+Rh5vPUYqe6F9Dgtcg137WN1eTSg
 2V71LdXQuz37AsQ/GlZjNS/4UhuC+xBkc9PC4hULE5goaoXsi3K3esd/mm+ee3VGVSlq
 kh042nNb0xl9CRH4wvPXWTL/6/XKiolYumlVy8FFj0lqBznW4e/rgn2ybtCyn9CjxzO8
 7ZoFqPxAwo7lFVeIhB74sXEosmCzzECTymSUGGfcWJtoT93Nv/MuIaD2jabnk4rJDnb+
 /UVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mrv9cPitT4gYyiIqkJILWgmA5af8TdIaHVS1zuDY5+g=;
 b=eDQ04lPKYeB8WthXfwb+1egVLSrU2t1E6grFuMXiPyioi/p2wGWBkLRUwwDsZRUTbB
 Uy2NNEVqKUXpuDjORcwhcvdJxJprsIs5by22LEtiUCgWz4BPZyIzq7qX9AWGHygDuPs6
 ggKV8j13nXGXW7DAFTZ3znuMMBZQLrvm9tuihjgd6R/RpYi5T6v+BjxUx3JNJQxlGEpD
 bSCEWdTiJoYMHR3TDdLGKxAeZstcE9l8UyCULI+jU42zo2z4/+LmQ+6jsz1VG/OyzNdE
 7vYRhEfovAc39K0MMQ4x+zqduuMg8ipCJHWbVyB6qKz88vPVEviIY1+RScRUHlzicAw1
 TH0g==
X-Gm-Message-State: AFqh2kpNLrldEqgf7cdJB8rrwNpYfzN5ihYQAQHAms78eSvnEZU4qgbW
 6dQJi+RETdWgf8inMXvoeelXPhP8hCDKIfi+
X-Received: by 2002:a17:902:d48a:b0:192:48d1:f06c with SMTP id
 c10-20020a170902d48a00b0019248d1f06cmr26089646plg.35.1673802996471; 
 Sun, 15 Jan 2023 09:16:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0019472226769sm4716086pla.251.2023.01.15.09.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 09:16:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: Widen cnthctl_el2 to uint64_t
Date: Sun, 15 Jan 2023 07:16:33 -1000
Message-Id: <20230115171633.3171890-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HP6hL1dWkd8x

This is a 64-bit register on AArch64, even if the high 44 bits
are RES0.  Because this is defined as ARM_CP_STATE_BOTH, we are
asserting that the cpreg field is 64-bits.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1400
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

During my perigrinations of reorganizing cpregs, I've been thinking
of ways to detect these sorts of errors -- preferably at build time,
but failing that at startup.  I think all raw usage of offsetof has
got to be replaced with something like

#define cpreg_fieldoffset(field) \
    .fieldoffset = offsetof(CPUARMState, field), \
    .fieldsize = sizeof(((CPUARMState *)0)->field),

I'm not going to touch this until Fabiano's --disable-tcg cleanup lands.

r~

---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d..1feb63b4d7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -479,7 +479,7 @@ typedef struct CPUArchState {
         };
         uint64_t c14_cntfrq; /* Counter Frequency register */
         uint64_t c14_cntkctl; /* Timer Control register */
-        uint32_t cnthctl_el2; /* Counter/Timer Hyp Control register */
+        uint64_t cnthctl_el2; /* Counter/Timer Hyp Control register */
         uint64_t cntvoff_el2; /* Counter Virtual Offset register */
         ARMGenericTimer c14_timer[NUM_GTIMERS];
         uint32_t c15_cpar; /* XScale Coprocessor Access Register */
-- 
2.34.1

