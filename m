Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp126522eji;
        Tue, 6 Feb 2024 18:52:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE96d3+xCasjPl5bIk+lfDWQ7T1iHQVeVFdtgRgeLTYfP99TIhrkqGTvow0Cs7R1+3NRDYn
X-Received: by 2002:a05:620a:4d03:b0:785:8bee:7aef with SMTP id wa3-20020a05620a4d0300b007858bee7aefmr4550812qkn.8.1707274347652;
        Tue, 06 Feb 2024 18:52:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707274347; cv=none;
        d=google.com; s=arc-20160816;
        b=Cpn3LWFBYdFKXmZ1dt8xrWhsdwvh1pQcwO3XJAKXssXwtwGlDQzbPGRisNEobQa7xU
         tNjgea/4nSvuM/lBY9cpuj33Zs4PnCNkqBwq228MVo5snIY9GGZMNZrYAZY/KIEto/1H
         jGrjwYaavbSkF0+iVfszyULbpsSEP1tpbS4ETL1o0bTOMrtJCxvrb9UDG/U6PN7YCBBr
         d8GNqO7TDhL/fDfedWLGZ7gUgXPESX8pQkuPZiBw3GHWRK3eg6Xc/nSs1LmB6yy9Sq19
         7UsYFaJ3cSd+aAdX2L7kVQq8xZtfZ51cVi4OBaXwhbHrjGOlHn123XKQK0ig9BHmAEDX
         lz4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XeR3jaWaGEublhkyds5zMH3a9rvdTlNi440zus838qM=;
        fh=e60wilearzJur25NLyaouqibzpYelTjVUA7pt1F740U=;
        b=D9zBPIQTtEt6UsML8aFlksXYoOf9ZneSN0SpRvjIW/MFJB+91UeG4xGvWuWHd+8B/P
         eRS8JFGGQpoo0du+N+0K/JEima+E7oGDK4bNBSwLe2mIC/jrSeNoTU0IZmF/r4Dup/Ex
         pyortUGatKXDgz52EMecGrypDm64TB3l+APxFZr/Q8OQ5BVog6KgUACKp3gwbm05OnVC
         qzPiO+kEBhEP89zQfOj2of/aEayWoxgXRW5HMkGvF0naBsx6R63WO+nYgsbWSbNkkMcn
         C1LRskybbKrQYql+Jft0WxxzCTVNl3drl3GXcOyMc/h7X0xzdUwuRTXk3o1QnXbXhO5P
         d15A==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jPPRtVt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCW8l67FqxIDR8YlpNWHuUybP85LTVmQONacQmh9ARwGgFlm2UKLQJ2MUTdqpVKOO9dG+MSwKvF2I4DUDq9HreveyLjiEaiS
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020a05620a44d300b0078538a992ccsi314653qkp.24.2024.02.06.18.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 18:52:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jPPRtVt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXY2z-0003Bo-Lz; Tue, 06 Feb 2024 21:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY2y-0003Bd-Nw
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:24 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY2x-0000aZ-Ao
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:24 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d94b222a3aso1721145ad.2
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 18:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707274342; x=1707879142; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XeR3jaWaGEublhkyds5zMH3a9rvdTlNi440zus838qM=;
 b=jPPRtVt2qlWbOd4dk8tsixl03xv5kvn5NHQcsSVcWLuy4CDw+BoDGX5N2AOSphQeLc
 ebJIA9APqAoOLUhm+S5LjZQwsRB3VlnGlSLbO2bUqG9D92qtRk90LWg+3b9ie9N3qKoR
 uEl5IQBSrew7npzOBNC53EijHBVkITqLaQRA22TdBcatZpr+9MI7kFO9KbRvTYc4RGtx
 tFHF82FgVnn7S5j41vogvK9/u2hODsk6aZ+Vx31hOHJ70We+r5TbdtwNVGrXdDCpnQzj
 6x8BlXYj79dqrnm5tL9gXvzx30VitpOxJzX1ZfoXxjb79KfFkx0TZ9i3dagBL7jyYhp6
 7eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707274342; x=1707879142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XeR3jaWaGEublhkyds5zMH3a9rvdTlNi440zus838qM=;
 b=lXQD+UnFkBFDCCPW+CiTPR2O42GypGUbA7f+/aT1/+5+GOBsFizzqtHeaP34a+Nft6
 HPlf1KJNIbrkZERT9RbltrWLCSHf42X20AgnLudZzuYLAxgGadbLhjzRouUyhAVOzJ6n
 I0tmIFziyX93su2Mk2jwSkxH+aZ8mQxNxC4Rl39T/38GulODkYkPRbKqEoV1MTtqfJPf
 e59EU9i5/X9oiEAtf2O9QJTQ3DTj1LvaxWMbMvL73wiZgQUcx0t3YfXn0O29oPiATQYH
 3jcmnJVfytNaUSDEU/7ZKxcsF40+jgaAVJWY1R4iqDtGBCOf+CypPDtGbZbpSs3pazNr
 oO9w==
X-Gm-Message-State: AOJu0YxVrCR322cvEV14e+Tq7KLuBavAV8gsf/18QP8CYgEZy3jAvxmZ
 mvBw2v3n1vT/I5HWayWt6QT3x4AkhgPUDG3kmx4ean9sjCyFTmpUGEohHFpP9g/a059SiWAm2n8
 rzKE=
X-Received: by 2002:a17:902:f544:b0:1d9:cded:4ef1 with SMTP id
 h4-20020a170902f54400b001d9cded4ef1mr4766316plf.13.1707274341606; 
 Tue, 06 Feb 2024 18:52:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU5m2j9cgPXpIuWFfZLH0bgymEtyndClnEul0XDonZ3RMXQEcItZrvl/TiYj0n+tgcVJd7B1yCWirZp6UXIFJJmhtvoRkXoQpZJmy3xkZEgBzw6X6OQssd/BoxDvXXS/YY/
Received: from stoup.. (60-242-98-186.static.tpgi.com.au. [60.242.98.186])
 by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d8ef97de4asm255435plb.38.2024.02.06.18.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:52:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org,
	qemu-stable@nongnu.org
Subject: [PATCH v3 1/6] linux-user/aarch64: Choose SYNC as the preferred MTE
 mode
Date: Wed,  7 Feb 2024 12:52:05 +1000
Message-Id: <20240207025210.8837-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207025210.8837-1-richard.henderson@linaro.org>
References: <20240207025210.8837-1-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: f9O64ZUK49F1

The API does not generate an error for setting ASYNC | SYNC; that merely
constrains the selection vs the per-cpu default.  For qemu linux-user,
choose SYNC as the default.

Cc: qemu-stable@nongnu.org
Reported-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 5067e7d731..aa8e203c15 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -173,21 +173,26 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
     env->tagged_addr_enable = arg2 & PR_TAGGED_ADDR_ENABLE;
 
     if (cpu_isar_feature(aa64_mte, cpu)) {
-        switch (arg2 & PR_MTE_TCF_MASK) {
-        case PR_MTE_TCF_NONE:
-        case PR_MTE_TCF_SYNC:
-        case PR_MTE_TCF_ASYNC:
-            break;
-        default:
-            return -EINVAL;
-        }
-
         /*
          * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
-         * Note that the syscall values are consistent with hw.
+         *
+         * The kernel has a per-cpu configuration for the sysadmin,
+         * /sys/devices/system/cpu/cpu<N>/mte_tcf_preferred,
+         * which qemu does not implement.
+         *
+         * Because there is no performance difference between the modes, and
+         * because SYNC is most useful for debugging MTE errors, choose SYNC
+         * as the preferred mode.  With this preference, and the way the API
+         * uses only two bits, there is no way for the program to select
+         * ASYMM mode.
          */
-        env->cp15.sctlr_el[1] =
-            deposit64(env->cp15.sctlr_el[1], 38, 2, arg2 >> PR_MTE_TCF_SHIFT);
+        unsigned tcf = 0;
+        if (arg2 & PR_MTE_TCF_SYNC) {
+            tcf = 1;
+        } else if (arg2 & PR_MTE_TCF_ASYNC) {
+            tcf = 2;
+        }
+        env->cp15.sctlr_el[1] = deposit64(env->cp15.sctlr_el[1], 38, 2, tcf);
 
         /*
          * Write PR_MTE_TAG to GCR_EL1[Exclude].
-- 
2.34.1

