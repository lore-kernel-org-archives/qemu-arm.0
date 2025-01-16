Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp4083440njn;
        Thu, 16 Jan 2025 15:05:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvgIpnX1t6nDGuGwbQIgUGDHlVgsoLCG3ryjzf2q2cmZAgIw4Ya1UN876uMCILJdu2hNU/ysfMRrwWNw==@linaro.org
X-Google-Smtp-Source: AGHT+IHqPyMmrqm6S/OhcvUtgpO64G/hvTEddid+VIj7emwNOmkdOtWmWDlT/6yNMBrQO3+52cfU
X-Received: by 2002:a05:6122:3704:b0:50a:b604:2bb2 with SMTP id 71dfb90a1353d-51d5b39b8a2mr615376e0c.11.1737068726137;
        Thu, 16 Jan 2025 15:05:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737068726; cv=none;
        d=google.com; s=arc-20240605;
        b=XUVqjCZbmILtT4+ysfz3AzM3dbpj6AVD/qAgGOF5T7X4cPwzszEgnR6t7AF1frFbxT
         LDF0/y2egz/jLrwOGeQI/dpdo6//Vq0j/lfLK2ZaSXoZahLPaSzX3iZJAnhJ8pbtkRTO
         /1Wn9OJY/iZqcKfgjAUiZ6qwzmbWVAFOxgorPHFFpIbw24HBOSDaVh8b7kcOxj4WmVRF
         1uEgNdPtELLSbyEUkMxf6vHd0MTbv0e+MVdR1MSse0ZPNxnF3AFByUM5fZ/dJulYlqnP
         BCL68hDF3XPYPSardZopFO3MaLFruoG+hLcnkb1ozSg3QNG0VBgJVjhl0JdK/QwUCJK9
         Viuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nLjAfEesdApASDyVsAST+uy4KXHzjDdggJGXjuSffuw=;
        fh=8Td+MXl0WBg9jGNOULerNuOH/KMzTDtKAvdrXNyFjp0=;
        b=jZ/6b0rQj4qxreXi7Tj8cmIfm+YlINaNxDVYB5jWeUMCcGMmBwSNBqF1D/BbeZFmEP
         t/KcxeoA8LKR3piexrD4vfK+qMF1LgFUDdCa/Byae5814NLYAxutHAi93gAnCVOeAOKd
         b9oHc083hFrNRR/sxYoeJM3E2DiEOFiWYWq9BWAIML6RB7HAThuFEII3ydmsvWb5LmKp
         CGLx4NBv8yT3r7uFTZXjZbF4ZI70GJwX2/GCR9AZgxij/Mb7+nGrEqL5GIZa8EVf51GW
         6K7TfjQ3AksACLyO39mZMNfL6+BWQV0+nDf+s4je8Fey6uyPWs0S3FewUHaHcxDq5PGJ
         JTjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NB2L90F6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51cf57c3241si528074e0c.239.2025.01.16.15.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 15:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NB2L90F6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYYuv-0005w3-JK; Thu, 16 Jan 2025 18:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYYuu-0005vd-6r
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 18:04:48 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYYus-0004xr-H1
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 18:04:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso14241295e9.0
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 15:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737068683; x=1737673483; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nLjAfEesdApASDyVsAST+uy4KXHzjDdggJGXjuSffuw=;
 b=NB2L90F67p2R+E0WAtMv6FXhMrSJ9mng/Vg51CgsXzFBcJNU6vgGxF8DnLdElR3M2i
 F56nemR/GszPpD8EzNRaIH6BCvlmTSdDbYN0JA8v+lEN8gKENmofZmWL2vnsWDy37D7S
 TZt0G8s7Zpm9ySsiqSmYNtnPhjdKH4yQZSdLoEn+XJW4X95GsfdMLDMW3ejlr6fPZRod
 G9v3v3rS8+ctlKZt4PtOQxseMZTDeSNycjIM1lxcS3nnGaBfbhcj+2f/AVTDx1Em+3S7
 E63X25SYjGkEOOmVqp8omY6s3OLAYPqYOc7hK4aVlRuyPmUmuGh2P+nMDhKwPpEL1qTO
 oIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737068683; x=1737673483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLjAfEesdApASDyVsAST+uy4KXHzjDdggJGXjuSffuw=;
 b=khNNm5YZf+bWIM5Chv/o/tmItdd45cLRJCdUKCKfdoOO70tXjLpdylj33T9wbOb27g
 mFFQ+ncWMtBW8h3l+EdS8f7bnnQdlXorTKOm3uAUcECKVWzNRekK62DXRidbzIrudpgb
 CVA7jVGg6+sh1mhlO4jCvccIfxivIJcLJmdzXuORzt6GiMHAVhn+C/nt9OpvmJX1/6bP
 3x9VjXLjNfFy41A+q8Q9haN/5xyTh8mqE2rtct6jaAPMRTy19N9tVz2mS+XiqntsNdrv
 fvaNWMatk6SoHAe4Yt0jkQFFdsXIF5dNCOidjHkA0qxZ5yXL4rvUDagpP6ynWDNR8sfW
 Kc/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxg/YKX6TKIu16EZXngkHbPTl+NljE89rZFxPO4hX4V6w/zlwAXEMgXC5724U6+2bLbczaygZZXA==@nongnu.org
X-Gm-Message-State: AOJu0YynUipjfMrsnCxsw91HkIqjrKL/K6DxQCenZIlf/aijPbZBYTS2
 zPWmGCDCZJU0Gsu4jnzZ8fjiiflgcAm3hN/1zb1qjpkAis7ee4oA3hhLAkAuMeE=
X-Gm-Gg: ASbGncuI7qBbm7+a00f5do9Vq2arTLOS0YHbEB6vYz1t2tyfyhSkhs2PPQfH2jyDewG
 uCulEw2SZoPsq7KzBe2qJC+Q5TGKDIvsW3bM0e83S2w42rf41dOAO0OFrjbwccSRIK95yHxBooW
 ZH1jP5fqGdGfDPFgIG19QWGAs6iJ5Vyiwm/35Icsh01SxrZ4o3EzcQusnc2N2zFiaSB9qWIQdW9
 LPC86SZh+0Hf6cAXOogHauR6oMZMnytf/cyvhxL3j5vAgMlaNKY9XCmwZsKabXsdB24EMM7LWU/
 s4G/wldVb4zEFA3Wvv4co9hEGAId/tg=
X-Received: by 2002:a5d:64a1:0:b0:385:f44a:a53 with SMTP id
 ffacd0b85a97d-38bf5655b07mr267507f8f.4.1737068683638; 
 Thu, 16 Jan 2025 15:04:43 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327dee3sm922535f8f.86.2025.01.16.15.04.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Jan 2025 15:04:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 1/2] cpus: Introduce const_cpu_env() and
 const_env_archcpu()
Date: Fri, 17 Jan 2025 00:04:34 +0100
Message-ID: <20250116230435.87580-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116230435.87580-1-philmd@linaro.org>
References: <20250116230435.87580-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ZGnREmeayfJz

const_cpu_env() is similar to cpu_env() but return a const
CPU 'env' state.
Same for const_env_archcpu() w.r.t. env_archcpu().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-common.h | 5 +++++
 include/hw/core/cpu.h     | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index b1d76d69850..f765e97a973 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -250,6 +250,11 @@ static inline ArchCPU *env_archcpu(CPUArchState *env)
     return (void *)env - sizeof(CPUState);
 }
 
+static inline const ArchCPU *const_env_archcpu(const CPUArchState *env)
+{
+    return (const void *)env - sizeof(CPUState);
+}
+
 /**
  * env_cpu_const(env)
  * @env: The architecture environment
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c3ca0babcb3..ecb31221b26 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -588,6 +588,12 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
     return (CPUArchState *)(cpu + 1);
 }
 
+static inline const CPUArchState *const_cpu_env(const CPUState *cpu)
+{
+    /* We validate that CPUArchState follows CPUState in cpu-all.h. */
+    return (const CPUArchState *)(cpu + 1);
+}
+
 typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
 extern CPUTailQ cpus_queue;
 
-- 
2.47.1

