Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp154627dlq;
        Tue, 21 Jan 2025 06:28:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVQISQsNwJXvouhFNCiQtp5P2ouiJBqfrxlC0Or6kiPOoRXaiWe3iIS9PFM7pKiOFy/T9D0I3z0m+iTxw==@linaro.org
X-Google-Smtp-Source: AGHT+IHaWr5yezQuEnGXe9h76+0FJRxD4TJt7GQyj2DNAqPSgdABHfoHflF8e7Z1hfYx59I7iggq
X-Received: by 2002:a05:6214:2466:b0:6d8:b115:76a6 with SMTP id 6a1803df08f44-6e1b1b26187mr317623046d6.0.1737469684169;
        Tue, 21 Jan 2025 06:28:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469684; cv=none;
        d=google.com; s=arc-20240605;
        b=RizCv4ajgSoVgSG3nIqOZTOPGVQ2R1PJFNXvn81j0aAcozrBzEDt99EjtIivk2dJI9
         OohkszF1i5WSxwXbAyEfIbeJzJBG4O482cWjmIMI3PPOae2b2xzwdVLgkNLtEtTDEcrb
         IBoW3W3Xvl/cHSu4EsXRsNOVl9ri+f62yTz2tUc532StDc3tI3a+qy9WLTqdxaXhUmjw
         7ef/nWRxtm/SeEKrF/RX32HAKI/GgnwGoDyxgkW5vXVhfraGQtvM2ygY+Ir6njxIGnE7
         R9EH2JK7duGz4bRWRWFezrBtwC26YcfA06kvcZofFDRgRQPd//E4j/ZKlcipqWwipFv6
         SC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=km3kArmfsAMK0iy+xJz4rtnl5tZfE33rr6rRoUamFRE=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=IBYCMI3tXFcut6+sjZNpH7Yr1SJwsX3BO3DAYSxsvsbx49qYzoZM1IOLrAYlnCd0oQ
         TD52UFS3mbzr87o89oMx6lPvNN+tr/JkgqhGApqp9YGmABuU/UEADfZ6Vp2HYjoqkObW
         XM+htfKugh6hADlpWUetZtyOc36bWqbJOp73FAz2Xq6e9eby6k9lpqPa6W1ETLKROt7a
         Gu3g5VcJuj4zPwH7JiS4v5NxphgxEbBm4Q8ffVsOSXKXqNFdHdOgR8/d2feoU04/YGw2
         bYDgEKbrCpWifK7p27xWtrTAJAZw7RxxgUyfswyXDoFi5hmQUDViDa6IRm9Hi7vMh+Wy
         axuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esELUc+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afd1f364si132845246d6.481.2025.01.21.06.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:28:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esELUc+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFDw-0004cL-NF; Tue, 21 Jan 2025 09:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBl-0001y1-0N
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:25:17 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBi-0003TM-EA
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:25:08 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so4361751f8f.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469505; x=1738074305; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=km3kArmfsAMK0iy+xJz4rtnl5tZfE33rr6rRoUamFRE=;
 b=esELUc+iZAUrjFGWCOfV8xw8hhaKtoJauqZoaLOo4lWl+m7BDiaxuiHsX11apIorFm
 ymoIt4Stq4KdgQRiyZaX2Ea3MVPIP0HT8VK/4r1KmXlPKwQIJs5LwW0xGJ1SLSA7m6WB
 pREm4f6j1QH3cK9akG2iLCWv92WlqDEc0yKQTh8RSrdT+Cvi0k6vex489pIRRZkNIbzd
 xlaDwnvcjvpl3S4X+2bJRdugwpDWzKL3eLZQ1CRtliziSDrNIwzA6Fnm3WaDtroTvy1d
 ulVGVdGDavBa5VXX2iUxNFRoP0AOJPzCMrq98ruoE5+AL/xi1WOF2ndh7yfE++TsnDk2
 jKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469505; x=1738074305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=km3kArmfsAMK0iy+xJz4rtnl5tZfE33rr6rRoUamFRE=;
 b=QDORal0bW6R8paM7TFqDcL3XWNUQEv8AvNuDIkoC43JqG2YUUizzjy4Ll9XMkWw8xf
 ZsGhL1oKPxJhdPPX50tyo6EjVZQvDZctpwZfuLn0m8EEBZT884/egiTR1WZjy34Pgvgs
 S8zAc1qZojeNDai9DqlgIWaD4Zite67a3eTwaHvctuA3Ho+7RvuuMwdex1nSgV6yl/UP
 DHxKPjsO7dSdHebyVIiWcDRIGj7rLGw6ZaMfUqZYbmUqhslSrYllJ223DWktkcfFuofw
 ju/LeVn+/7rLWZWVYc2RLfyqk2I7K0osgOI8R/7g3GcEeJ1K2YFLLZVbLQNbsE1S7nV5
 dKwQ==
X-Gm-Message-State: AOJu0Yw3hZRQHEGDNND9akbGFP7aycNu4x8vUB7y7WLRH79iu7sZzCkR
 ZyZHOIJd0RVwlV9qbRnVIC3hXloTh+y7Rp+927d9fovhtYy2+ZW55EbUa63X1Jc=
X-Gm-Gg: ASbGncvcpiAZzEnhTdif2wMo6HT5Akt70Pc0LZTxXgKda52Z+GF26oxncZulQCLMmcO
 dn4bpVZTF1a7OrgdCGpdHmr9gMooXXziiqlziGuI+6CBysONR+4BqtWSY5/kdIl7mfzvYudyFDA
 edxZ1sV3mElx/uFr/A5H+uWJ2kl70UZ+NnbCIU0VS45iDRN/yzVEG1V9rvEtoSkZMPwP8g6ghGd
 y9BKyb+q6KwAkEGBvWtbH5NjkAwtz7IfEmlUTijJK5MYHajoeAnPx7NSpml2jNvxE5fv3VGJr7g
 6p+vazzuQSM/gOaaKcrcdxwQHQaNTVwfkCEGsTDCNtpf
X-Received: by 2002:a5d:4f8d:0:b0:385:e5d8:3ec2 with SMTP id
 ffacd0b85a97d-38bf566f8damr11608978f8f.28.1737469504953; 
 Tue, 21 Jan 2025 06:25:04 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e1fdsm13688194f8f.94.2025.01.21.06.25.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 17/28] target/mips: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:30 +0100
Message-ID: <20250121142341.17001-18-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: /qWa+UY78vus

Move has_work() from CPUClass to SysemuCPUOps and
cpu_mips_hw_interrupts_enabled() to system.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/internal.h | 4 ++--
 target/mips/cpu.c      | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 91c786cff8a..28eb28936ba 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -162,8 +162,6 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
 
 extern const VMStateDescription vmstate_mips_cpu;
 
-#endif /* !CONFIG_USER_ONLY */
-
 static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
 {
     return (env->CP0_Status & (1 << CP0St_IE)) &&
@@ -206,6 +204,8 @@ static inline bool cpu_mips_hw_interrupts_pending(CPUMIPSState *env)
     return r;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 void msa_reset(CPUMIPSState *env);
 
 /* cp0_timer.c */
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 47cd7cfdcef..0b3ac4e60a3 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -132,6 +132,7 @@ static vaddr mips_cpu_get_pc(CPUState *cs)
     return cpu->env.active_tc.PC;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool mips_cpu_has_work(CPUState *cs)
 {
     CPUMIPSState *env = cpu_env(cs);
@@ -177,6 +178,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     }
     return has_work;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int mips_cpu_mmu_index(CPUState *cs, bool ifunc)
 {
@@ -534,6 +536,7 @@ static ObjectClass *mips_cpu_class_by_name(const char *cpu_model)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps mips_sysemu_ops = {
+    .has_work = mips_cpu_has_work,
     .get_phys_page_debug = mips_cpu_get_phys_page_debug,
     .legacy_vmsd = &vmstate_mips_cpu,
 };
@@ -577,7 +580,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = mips_cpu_class_by_name;
-    cc->has_work = mips_cpu_has_work;
     cc->mmu_index = mips_cpu_mmu_index;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
-- 
2.47.1

