Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1252258dyc;
        Fri, 4 Jul 2025 07:26:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUj72Ppf0OwnbCkBASYtcSFHuP+Rexa0gd5x/pw3PyFCnvAht7mK5IqU2a7ooj8gmnUjSPEGf9QOhq9mQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFCPg1FCUjNR/rX2BvoDChrGv/w7a6QV7Fl6N/zVVgzyKLQxR7lz0mBEK2PfPHbLGFf48cZ
X-Received: by 2002:a05:622a:a549:b0:4a9:96f9:262e with SMTP id d75a77b69052e-4a996f93da0mr29946371cf.20.1751639189110;
        Fri, 04 Jul 2025 07:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639189; cv=none;
        d=google.com; s=arc-20240605;
        b=gRStu9H3XG5l0OKP6MvIcZROvL2Pfd8cA/PesPV7FFTifBv9BNu6liprOvvJPYhLGT
         xhBk9PcjRt49zLAsUYRwhpYJe/Mrs0rNboaDpwPxenWIIWkSiMobWo4UQtYnAyvXNu4e
         TTf/6F/uekuYniLjJeyCjwJIJ+LVmq7HPruxRjwKuM0VCSkpZLmRy776C4nsasxRlPdk
         J2amDz6sPxyhzXOmRsle5K3P+GzCXG0Dw69DHpM5i8W6Sys+6sz3VcPCTR3ZHQYFhKbE
         F+1i9vF2WJJDoXfZWcDD+vQA8f4VRy5gzztItqP73kgVOSR8np/BwP6iltGNGCUKYN9C
         7v3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rqIaBK24/nk8jMN0M07Cgetn4Lo2/0ptp5VJcxzRmEg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=jwcRuZWCU0FBJAzJzRGq2kD72O47GqZc0VqU+wdDJPCZb1B1z+V5c2snoNmnJ6KoYw
         K+MgO0ps8B4gkWIvuPahRzXUnFI+LxakfFEG/ZhQy3JZtTo2u08bwSe4zJGos9u842ln
         V8+CsJgw3xIlh1m0ftnsGqVjLQG823b3IdwMBxtAd6pys/UWM1gL/8ZF5U0K9y+XWD7i
         47VjYci1DfTOsDp2kaCs3m4fDxoLzfMVH1q8imXXJufFQ/7/hIP7C20y/vUbbiURv4tR
         mag+pRIZFHfcYD1VnoMlhXUdQLGOCBhJaPr5doI3b9g7QlAtrKc30Ti3kUT1+8SEs/eu
         e50A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1bK5mge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994b0bab4si21315941cf.540.2025.07.04.07.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1bK5mge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhL1-0001VE-Be; Fri, 04 Jul 2025 10:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIM-0005JE-Sp
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:43 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIL-0005xu-5M
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:42 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2f78ef10832so691069fac.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638900; x=1752243700; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqIaBK24/nk8jMN0M07Cgetn4Lo2/0ptp5VJcxzRmEg=;
 b=Z1bK5mgeuc5qmQWtDACZPyqzxlLzDVmooPaFqRstNz1EQQiPMm1hRc3gXW1WrqQrd4
 dKyEd/Bu3Dr23SnxcmPImNUTPG9Xpjfq5/VnhXck4VZv3Sv0+E3czIyoJMi/XtehlWyD
 ja3pEwTR//xISZ5iQOQn6nor5xzxjH9konOHNbIvZ8JEYE28m5O63kTcldrIJHMIb6CT
 uibNM679cLNP4eg8CZJugHWNa+py0fTK/lyvXuNJyx3ym0nGY88APn8VDjaiHyEeC9Ft
 BPR2ecE8sLDXWL4SgCal4gppcLrUK0QnbClKXZ0itT3xd5LBgSB4y9GKyAasjuR9qQvZ
 cr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638900; x=1752243700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqIaBK24/nk8jMN0M07Cgetn4Lo2/0ptp5VJcxzRmEg=;
 b=FdVvfXehX+9PvkxJ57PJCTLISUYcYu7o2Hm0ckWL/LgS1Ov0o2vVTTQchNkE0hq1dN
 INhJN8JceiKP0D1qTwKTuBMwzC23sKlwOfJFKBbC90vLGYbIX3uvnOQcN5mPknZ7SIpR
 U6NMWeamSr+J1jJ7E6o6bTAUqQdLD4KupqRUBWKz2AOuNiTsxG+tjbGKECNDDkrkTVuO
 MBaY9MLChR2CdWxdYm4lC0k2ArnSlNdBFvRgDposhahr4uRd81cB1OQ9U/G5EE3y8LYG
 bIyTVIacg1HZ1HmcgJVDWj+ShLw9G5urk1AWRpQFoX4af7USKPd3GA4m7d03HjWj/Lw/
 jobw==
X-Gm-Message-State: AOJu0YypUIRYHzPYkcxIMVH5a1IdleenzzIUUg91Ph534EYQM+fWkRBE
 YwB+F59CzVPcDbjuYe8cF6+JlQtag43jSJGFbsXP+TgY+bEDZsJ+BsSPmkFHaAlAGfo=
X-Gm-Gg: ASbGncvoNe2snuXNxZ/3+d6qtQlPDh5tcQkODbe1G+Fsnnvya34C2CL+kemWx0Bt1Z3
 JvB3ZF46n6/8azwDduXSvci/ET8eSkzGCt0ZAahbE1Tg0B+z20Cv7DZKM15ddou40zVnIMmcRuY
 C6+m5ftJbAqa7+FHSVkl4R2hX01hoi6PYzQbcoErD5lMU8GHFb4IAoNk6Lf5wfPYtai31TmJ/82
 mgWdtHJJUV5hNoe4/gCHFCcs9PORnVqo9/Ie8OeF0xCXtzkRrdpMu1kRY/9p8Widx84N3l8iaA5
 MSOTgFOc7rwmuIFsKtQRYdHUJyq3TyExPaR3e4w1doq5PfQxaqjHDAw/xL636LqOO2x0wJHA82D
 Zp/pmuPFpWoX2A1Og6VPXp1VJlbsKHLjHRvLPEVUKqsDCFoqY
X-Received: by 2002:a05:6870:c154:b0:2bc:6675:2043 with SMTP id
 586e51a60fabf-2f796ba7168mr1806318fac.14.1751638899933; 
 Fri, 04 Jul 2025 07:21:39 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 024/108] target/arm: Introduce ARMCPU.sme_max_vq
Date: Fri,  4 Jul 2025 08:19:47 -0600
Message-ID: <20250704142112.1018902-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
X-TUID: vYhe4bsU/2pi

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   | 1 +
 target/arm/cpu64.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39a9234ff2..c8cf0ab417 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1136,6 +1136,7 @@ struct ArchCPU {
 
     /* Used to set the maximum vector length the cpu will support.  */
     uint32_t sve_max_vq;
+    uint32_t sme_max_vq;
 
 #ifdef CONFIG_USER_ONLY
     /* Used to set the default vector length at process start. */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 77e7c4a6a5..bd33d6cc6e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -363,6 +363,7 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
     }
 
     cpu->sme_vq.map = vq_map;
+    cpu->sme_max_vq = 32 - clz32(vq_map);
 }
 
 static bool cpu_arm_get_sme(Object *obj, Error **errp)
-- 
2.43.0

