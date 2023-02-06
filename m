Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4642101ejb;
        Mon, 6 Feb 2023 14:35:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/F8LFFJv12RAui+nkYkKnqUfhw8lJKwe8ifb6Q+jt0dmQRcQ8WqR5TaNmlRQZeMk3fbBP/
X-Received: by 2002:ac8:7f0e:0:b0:3b4:d5be:a2e0 with SMTP id f14-20020ac87f0e000000b003b4d5bea2e0mr1960908qtk.20.1675722959345;
        Mon, 06 Feb 2023 14:35:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675722959; cv=none;
        d=google.com; s=arc-20160816;
        b=BRuuu1P0qOtoseFqy/IQqh/K8+8J92/ANidBykYusgqAN4c14xpZopxC7DFXMTVG90
         aJOigsTnpWe0PDwkNy92Zpfhy3Pzo8cSnG5SoYt4hR/QtS4/+oemPxkVPFLRwFSFrVeg
         ApfWokEIBS68lxfR03cA3b35uZZ9ywmGNDJ+k59+oyV6cwYNVsXLOm9iOFrEXm8yreay
         rGRVqDCZAjd9HHA5QsFN4P7vrt0ThLrx2RSY1EBxI1t3GcHF3JG/1dsUPMxgihyxabX1
         Rxuk6olGXXKhWNq4+839V8fvzbsd8wqxQGy+tUFhKp15SbBdxmRJ1Y9WzZnzqoYNIpY0
         O2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=blxTJd5Tx9NIUQZO/x0aKGGdE7GU/DbRJ0PEKLke2ts=;
        b=IQcTxTUyfalag3+0AchvPKdR3GVRp2HdiTQpDqSkHaBsx2MTZMFrnXAGHUPnE+0d2U
         PK/P3/2O6AqBN7KpOrd3N1LuEX58Isp884YzDBdQUk36k67gAMr9Iccbj7+DxNs0BqwS
         eDiz8wS6Z5GGPkQQvAYLUtXQ9JesAKN583eRzGuXgY1IbNJxaVBEM4krrtRMdXig0YFy
         icp26wSOq2YeiQ/wsS9GPyXMIgKLuCQIFxDRRJoDy/h6t3kh1INNCtKdEUFeiWta5xQa
         SehkOhyZ+pQ6In5nImsho1yzEVz80mE1J2XJJ18aWcWQWX2jQQJe1BiSP8TbhFbp+735
         u7sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O0v/mntk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp32-20020a05622a1ba000b003b9c33fcb45si9879260qtb.13.2023.02.06.14.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 14:35:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O0v/mntk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPA5N-0001rT-Kc; Mon, 06 Feb 2023 17:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5H-0001lh-3s
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:35:36 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5F-0004To-FQ
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:35:34 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y1so11903137wru.2
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 14:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blxTJd5Tx9NIUQZO/x0aKGGdE7GU/DbRJ0PEKLke2ts=;
 b=O0v/mntkLzsAwHjb/nhX4yl/zVm8bN+5Pa5mzJVvu642xpmgEbfXxmO5QktMbPnwTa
 FDdLZKmL5u+PUBRidLc/slaVJ/YWNFQlH68bsLYuiF9ZP+My18MhDM64zcVakMJddaAS
 tS3/WInDY8JAspYoDznqDPbiutDScMJ5NpuOtC6LSgiI7214SDRINdzC4kWMXB7v5LJm
 DAMR5yGMmECHelSHznGjsbG8bD3yovzHm76Q7EiqN84H0P+Cbe0iUCYAizx3WG2TSAqY
 AHa+BpdwL6XpnWm2HwUXb1zXaoGCqgKTDk6jdGt/PBle8ssh80HXkl0WHYnawdeL4gPt
 37TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=blxTJd5Tx9NIUQZO/x0aKGGdE7GU/DbRJ0PEKLke2ts=;
 b=6IPDRI9uQpIZoqPkYuAlb9CVSEwhVYtpUwmdO1OJP0fR50XdaBNH2lmv/hUBYDBVeS
 10dHq+HBrBCsTCPr9GYToealC80JMDcODmyWe4z0Q1+fpiVpOJiMkB0/BRIzav9rb5GG
 6D28G4ZwUbPKAYb8i86PPmHQp/O68tULYWtJ+2+R4pPXcabaGUxu90v3hWsBZb2SKvr3
 Wsy/tvatplTec+xwOjTAs5JUwTxR+2EzwKwECx2gNxzLUQvYQeddkVv0Cmr16AAGcr+J
 0cYfrKfivvgxFW2GbggdQeEd5WXhP3xAE05tJ1RLAAG1xisFGm/9aKY+K8SV+tJzGYuG
 Cltg==
X-Gm-Message-State: AO0yUKVDlHXk44Som7o4yCzCJzOnJ/zA5YZFhQ8/gSQEdEb4CNxww+gl
 2cLdur7NT/LHXlc0I77UH+zFXA==
X-Received: by 2002:a05:6000:1287:b0:2bf:bb71:dc55 with SMTP id
 f7-20020a056000128700b002bfbb71dc55mr422119wrx.52.1675722932088; 
 Mon, 06 Feb 2023 14:35:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s7-20020adfeb07000000b002bff1de8d4bsm9769030wrn.49.2023.02.06.14.35.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/11] target/arm: Convert CPUARMState::eabi to boolean
Date: Mon,  6 Feb 2023 23:34:56 +0100
Message-Id: <20230206223502.25122-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: g7HAvqX77la+

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/arm/cpu_loop.c   | 4 ++--
 linux-user/user-internals.h | 2 +-
 target/arm/cpu.h            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index c0790f3246..a992423257 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -356,7 +356,7 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_SWI:
             {
-                env->eabi = 1;
+                env->eabi = true;
                 /* system call */
                 if (env->thumb) {
                     /* Thumb is always EABI style with syscall number in r7 */
@@ -382,7 +382,7 @@ void cpu_loop(CPUARMState *env)
                          * > 0xfffff and are handled below as out-of-range.
                          */
                         n ^= ARM_SYSCALL_BASE;
-                        env->eabi = 0;
+                        env->eabi = false;
                     }
                 }
 
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 0280e76add..3576da413f 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -135,7 +135,7 @@ void print_termios(void *arg);
 #ifdef TARGET_ARM
 static inline int regpairs_aligned(CPUArchState *cpu_env, int num)
 {
-    return cpu_env->eabi == 1;
+    return cpu_env->eabi;
 }
 #elif defined(TARGET_MIPS) && defined(TARGET_ABI_MIPSO32)
 static inline int regpairs_aligned(CPUArchState *cpu_env, int num) { return 1; }
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7bc97fece9..05b9012cee 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -723,7 +723,7 @@ typedef struct CPUArchState {
 
 #if defined(CONFIG_USER_ONLY)
     /* For usermode syscall translation.  */
-    int eabi;
+    bool eabi;
 #endif
 
     struct CPUBreakpoint *cpu_breakpoint[16];
-- 
2.38.1

