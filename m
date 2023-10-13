Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1333223ejc;
        Fri, 13 Oct 2023 00:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGBpFE/ZLOcyg6tfFmQf/oHOE6LG9t/tiqwFnGWTX2RY82NnUZ3FxrjAtEyzcZkwx3fUd1
X-Received: by 2002:a05:620a:f0d:b0:76c:a9a1:a318 with SMTP id v13-20020a05620a0f0d00b0076ca9a1a318mr30902947qkl.6.1697183899879;
        Fri, 13 Oct 2023 00:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183899; cv=none;
        d=google.com; s=arc-20160816;
        b=K6EPEcYnYUDK12F+1gIyBVXvjbQtmROVfs0zElJYCBl7Pc9K0YpZfp0mLdIPKQ1HwS
         ptBqQL6mRXi+zXHfGD73OKKtO9w0t4ZkKu7GQvnwB7pbFlFrID4EFbNXIkL6ydkUy+fk
         aOg2v5CglNt+ohIW5N6Ox/j6wGKmS04ZkUoNBNA437cm54pihtTFGWHS8+PKke1yw60J
         jWILa6AnNZtGGZ5nEFpwzV4UcSs2pzFb0pmVDl1oXed2A6jx0OGJsFu1Fkn8oh7SMk00
         NBRIr1ZqAbGb64X9jYtJ1RrFagKKM9nlwRj3nlANI7lyMcsTMevmGImHENAKdMYpEVYu
         BzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=liKgkIDmjxIZ8iQlMr82pqfYKW1BlEIkMZjnyTOJpWk=;
        fh=lAN3ewggoeNY0L/ap0zquylTO2ylw0STTp2NOOj+9bo=;
        b=PnrOxqPsKXGGVMOges4H9emaI1l6ai49mzdqW0SIYg1LmfbXQr7Z4HH2KJVLKz8sW/
         e/mhPrz3Cs9P7LNMMRxE1JZNRRLb+dW+bvaEJNEueeEP/jP20jCyZfSAdaPncRkVYOaG
         eXIqcHcyTw16DxMl48x9p9tRUpn6UlRMT+3vn1DrmHn586mkbp7KQuKm/wJ39qg5hvRX
         WtC/VityJxk0l0K6YfPQC1NfeVjVlUg+hOV/JaLdGaqKD9E1Js6JZbd8++o7ph1ynGnZ
         PiP6yJeZHBOurThzdVmEJDFSezzlvHU5RYcNrO5sqQYdeMOa792fvAHHlvxzDWfleZ5b
         XFYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nsfyFHwI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm15-20020a05620a198f00b00773e066060csi878285qkb.296.2023.10.13.00.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nsfyFHwI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrCxc-00089k-Se; Fri, 13 Oct 2023 03:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwv-00068R-QE
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:51:10 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwi-0004tP-CL
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:51:09 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32d569e73acso1689734f8f.1
 for <qemu-devel@nongnu.org>; Fri, 13 Oct 2023 00:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183454; x=1697788254; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liKgkIDmjxIZ8iQlMr82pqfYKW1BlEIkMZjnyTOJpWk=;
 b=nsfyFHwILkbNAyiTABDKjy+GPUP0whvI5vqf/tWhsMBcRppix1h6enBc6ifySzaLmp
 xJ2gyD2XC38IOXjol3E75qfqnVEI8KjOJiLe4617AiPgC88XX9TOWcKqKIfwIYX/dnv2
 5nk17f9TpiojRQvChe5/mD2iV+4zG8bsfIzH2K6cjLAmsJT7nx3CQf0FpJTugta8+pI/
 vWJP+1vs3kwbT2lrsqn3S1Qp2D3/0pMznmuCh1aj5Ofs0/P3YKQRJgfpdClatyuGTeIC
 iCKFJpVbTW975VLkmm2FqcqNmyxod714zUtkx6vpqjSBbvE37oleZpJVgcf1FSV4BF60
 V6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183454; x=1697788254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liKgkIDmjxIZ8iQlMr82pqfYKW1BlEIkMZjnyTOJpWk=;
 b=X/ueZchDdaXyKr0Mb71nMUgDxZPUHHF6yn+Ear3XOCwjlYDhGgRqm0wsq5GqDDv4qf
 rs8WmzZ5EOj4P6sAyNeFuSHlp6BUk9EUoYCZrZdZjUzkgvmDNQarGPet/kOs0F43/0Jb
 mRL4edGBNe3bystL3LlkdP3uozPEljYPjNaf5pZYn47yKlJhU1+o7h5ghlTt07zcT8mC
 AUBKbUplrIpxtuVcGduxC34htwTXzQK5S7RXuzdDN8XolKQ5LlZzYxBj/KVsI2SdzTbO
 Iqgd3Yl5MQkcw/3n4si7hKVSegSc1xNu9weh+GLwwItnsvUrt2nUMxOhlrjGwFkawwJe
 e/EQ==
X-Gm-Message-State: AOJu0Yywik07EyHUxNhWdI3UHxcfEOUWfssku/0VBgD4Vdbv/VdOBwMB
 IAeQ50mEpETsoB/4uufReCXbAu3KnuZBABpwwlI=
X-Received: by 2002:a5d:6daf:0:b0:32d:62e7:8ff9 with SMTP id
 u15-20020a5d6daf000000b0032d62e78ff9mr10470941wrs.34.1697183454741; 
 Fri, 13 Oct 2023 00:50:54 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:54 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [RFC PATCH 35/78] target/sh4: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:39 +0300
Message-Id: <1616b3baa81059284d7b58f2c5480f0b4dde439e.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nDM51wK3DKP5

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/sh4/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index e02e7af607..c1cc5e82f4 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -56,131 +56,131 @@ int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
 void superh_cpu_do_interrupt(CPUState *cs)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
     CPUSH4State *env = &cpu->env;
     int do_irq = cs->interrupt_request & CPU_INTERRUPT_HARD;
     int do_exp, irq_vector = cs->exception_index;
 
     /* prioritize exceptions over interrupts */
 
     do_exp = cs->exception_index != -1;
     do_irq = do_irq && (cs->exception_index == -1);
 
     if (env->sr & (1u << SR_BL)) {
         if (do_exp && cs->exception_index != 0x1e0) {
             /* In theory a masked exception generates a reset exception,
                which in turn jumps to the reset vector. However this only
                works when using a bootloader. When using a kernel and an
                initrd, they need to be reloaded and the program counter
                should be loaded with the kernel entry point.
                qemu_system_reset_request takes care of that.  */
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
             return;
         }
         if (do_irq && !env->in_sleep) {
             return; /* masked */
         }
     }
     env->in_sleep = 0;
 
     if (do_irq) {
         irq_vector = sh_intc_get_pending_vector(env->intc_handle,
 						(env->sr >> 4) & 0xf);
         if (irq_vector == -1) {
             return; /* masked */
 	}
     }
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
 	const char *expname;
         switch (cs->exception_index) {
 	case 0x0e0:
 	    expname = "addr_error";
 	    break;
 	case 0x040:
 	    expname = "tlb_miss";
 	    break;
 	case 0x0a0:
 	    expname = "tlb_violation";
 	    break;
 	case 0x180:
 	    expname = "illegal_instruction";
 	    break;
 	case 0x1a0:
 	    expname = "slot_illegal_instruction";
 	    break;
 	case 0x800:
 	    expname = "fpu_disable";
 	    break;
 	case 0x820:
 	    expname = "slot_fpu";
 	    break;
 	case 0x100:
 	    expname = "data_write";
 	    break;
 	case 0x060:
 	    expname = "dtlb_miss_write";
 	    break;
 	case 0x0c0:
 	    expname = "dtlb_violation_write";
 	    break;
 	case 0x120:
 	    expname = "fpu_exception";
 	    break;
 	case 0x080:
 	    expname = "initial_page_write";
 	    break;
 	case 0x160:
 	    expname = "trapa";
 	    break;
 	default:
             expname = do_irq ? "interrupt" : "???";
             break;
 	}
 	qemu_log("exception 0x%03x [%s] raised\n",
 		  irq_vector, expname);
         log_cpu_state(cs, 0);
     }
 
     env->ssr = cpu_read_sr(env);
     env->spc = env->pc;
     env->sgr = env->gregs[15];
     env->sr |= (1u << SR_BL) | (1u << SR_MD) | (1u << SR_RB);
     env->lock_addr = -1;
 
     if (env->flags & TB_FLAG_DELAY_SLOT_MASK) {
         /* Branch instruction should be executed again before delay slot. */
 	env->spc -= 2;
 	/* Clear flags for exception/interrupt routine. */
         env->flags &= ~TB_FLAG_DELAY_SLOT_MASK;
     }
 
     if (do_exp) {
         env->expevt = cs->exception_index;
         switch (cs->exception_index) {
         case 0x000:
         case 0x020:
         case 0x140:
             env->sr &= ~(1u << SR_FD);
             env->sr |= 0xf << 4; /* IMASK */
             env->pc = 0xa0000000;
             break;
         case 0x040:
         case 0x060:
             env->pc = env->vbr + 0x400;
             break;
         case 0x160:
             env->spc += 2; /* special case for TRAPA */
-            /* fall through */
+            fallthrough;
         default:
             env->pc = env->vbr + 0x100;
             break;
         }
         return;
     }
 
     if (do_irq) {
         env->intevt = irq_vector;
         env->pc = env->vbr + 0x600;
         return;
     }
 }
-- 
2.39.2

