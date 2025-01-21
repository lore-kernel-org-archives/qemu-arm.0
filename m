Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp152831dlq;
        Tue, 21 Jan 2025 06:25:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdqnDJQFFNxgYp8yh6Ba3eaanHE3HZd1+m1q18tFPPo5SsvRqg3Rw6GP1OASDNTSEwIeej3PXdxXCqOw==@linaro.org
X-Google-Smtp-Source: AGHT+IGImbSnjlE1/Q1eZcZ3h5JietluRfu9xgtuCcQv4y5LXzK9B17dmQDPkSxJEtF4LePnSVaO
X-Received: by 2002:a05:6214:31a0:b0:6e1:89c7:bc7e with SMTP id 6a1803df08f44-6e1b2262efbmr295182986d6.38.1737469503748;
        Tue, 21 Jan 2025 06:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469503; cv=none;
        d=google.com; s=arc-20240605;
        b=ZeHjuN7PmLnY1iBV5stxLs66LbU05hhDNEpPDtQBBIazE5Sr90XIPuhaS5UemVTJQK
         F4DjUKxCCQXVS+evDBQVWuy/n7uFKdm9Q1+mqsicPsM2HPnWZiDS/y2UwLXFQaokCe6q
         5saf6Hoa83vNZe9gollq1bHqdXr+t/uOCc/xWOsBmWNctt1vM8YnFWxkQ+kwouUkyu9U
         7/at8uIsBMpr65RjlDkwhrijHN5uO4yqEj6S9tdLV9LyBa7BVHwQPh+omVeiNnQAjWc1
         836qPEneJVMHKSv6TX57Xd+QawFvJwXs9feFmSEpDiUZ2+74CND+CyAcI1sLCG3skXTn
         v84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rNIgPRy0oQV98ilB0QwBxq4p43kinmbOyoZfOJB/SO0=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=Nqr6m5DiJj8kajjfTImBC3LILbbwdI63jv3ahkioWW9lcgfpGyEfzNGMjQV3dtgFVR
         jgF8ATR5NZtSs+2lTpuqzHT97hd8KBlFUVK2jic2uvATcaLJpcnPMeFq0G31YVFPoN1A
         eQKMPXz0fMBi7RIPY4Y2aMp9oCSkumofaM4M3qIB5vaSqjthtBFp4m+2XXuvTl49zdsv
         UAwb8LZMh/fbpQ7YozB6xvMQxZwozBgUspwvQPbQ76gaKweRKYgyF2sRJSO+G5nHk1Q3
         0a2sEBZKolFXzUrpKZnfVBykixa9rR9JYWJ+BAuFM8vwpU301EbU14c3+jJ6Xz7LW9Q9
         9Fjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ybs3JTAZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e102f17basi129726871cf.65.2025.01.21.06.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:25:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ybs3JTAZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFBc-0001jP-VY; Tue, 21 Jan 2025 09:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBa-0001eX-Id
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:59 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBY-0003GB-UM
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:58 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so39771885e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469495; x=1738074295; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNIgPRy0oQV98ilB0QwBxq4p43kinmbOyoZfOJB/SO0=;
 b=Ybs3JTAZv1f1cKoJ7cY1UaTpa7paPCbav+D4rAiIqrfwh8cUZ7odrEdwL5bvYx7tvu
 /1f+CrUTy5LUqe339MwlC+OuUpRUyWe1a77PQXd5N9NGu/O7A3s2FURhyGv48bKnIME8
 yCPlSvbLpxfgbJnNLGfj0CVzEw41KTs4AaWsvtRCzWMDrJBtxQe3IzPrOlREuyTK3wbk
 Et4FrjJEorPaQoPk2D41h0qIhX5NUB1+ASErzBvCUMdiBoKQu/BQkwSxRUTxeJqYNeF+
 RYBdD1exSS+dmEdStJHO9POwW4iYrUUWkbWQ4GiGDILGAvIsCEz6A3kdxwYV6uuUvllS
 ddHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469495; x=1738074295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rNIgPRy0oQV98ilB0QwBxq4p43kinmbOyoZfOJB/SO0=;
 b=rMXPfT98s+LxBlodFrncuSaNRO1CZ5rOcRqfsSeKvhfovhPntKLXVqEPSHrhvO4cZK
 KHf3Ju/bePkvio6xCLDul7QbN1fLp5e/W8LLVADXtF/dvLrWjWa1Shu2wY4xP2SVM+gZ
 pkg5B7caPxpGLNTtyq76Mn8wGKFUrv8jW0eI67ffHdZD8W9jRLMJJjz5Jz/3r4P6xPCi
 rXBdGQNzHNXsjaGXBAJRTfiR7T67xSaL8kDl6BII6zVzAKGo+L/VhAr1aL5fRL9Ua3/L
 8rfSvX+D7EKKBCjOd2aDLM2jYJyu7gaMCgy8B3+H7fn1GOd7uUeagY/fCRsMAqhm3IHJ
 PRRA==
X-Gm-Message-State: AOJu0Yy9jY1hefWzzh/zyMZsp68V1NA2FRpbvvmB6mX2rel5Xt9tQWWi
 g5PRLbqfxkqxs/yGHJXwn1YCk3xyymPLsHJ+p0tJJs0807xpktfpud9386R0zYs=
X-Gm-Gg: ASbGncvbXIm4oqnTXygpeYsFHDCfD/QhM0hJ1ukCLwlb45tJTZsldG/NFN4QjNpADkF
 T2YBwQKwRcoz5IwoMjesT+IJLfajf++1bXes23xXirk4e4EpUForc3pjVigc3UYdHZMNuoosD0m
 tl459CShNBukpcMSXrjrecaEVY7P35RiIRTGvyZzUdGZYv7RW1aSe2+MvxZKJ7RASRA4IH3ZWfC
 /fnHhV/YYQSsbx+fBcQ7Du5PlUUF19r/RMaC+lnUDo0NatNbU5RN9Y7IW2KH2UCG5c2ArtQVzaR
 ZqctgflXyHhDqHlJR8UE86uacoSbkzEWG+CS2rt6kjs3
X-Received: by 2002:a05:600c:1908:b0:434:9c1b:b36a with SMTP id
 5b1f17b1804b1-438913dbf63mr157694825e9.13.1737469495469; 
 Tue, 21 Jan 2025 06:24:55 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890408a66sm184008325e9.5.2025.01.21.06.24.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/28] target/m68k: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:28 +0100
Message-ID: <20250121142341.17001-16-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: pBwvB4fDkRjR

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 41dfdf58045..eb7fb4f7e4c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -51,10 +51,12 @@ static void m68k_restore_state_to_opc(CPUState *cs,
     }
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool m68k_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int m68k_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -543,6 +545,7 @@ static const VMStateDescription vmstate_m68k_cpu = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps m68k_sysemu_ops = {
+    .has_work = m68k_cpu_has_work,
     .get_phys_page_debug = m68k_cpu_get_phys_page_debug,
 };
 #endif /* !CONFIG_USER_ONLY */
@@ -576,7 +579,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = m68k_cpu_class_by_name;
-    cc->has_work = m68k_cpu_has_work;
     cc->mmu_index = m68k_cpu_mmu_index;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
-- 
2.47.1

