Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009175ejf;
        Tue, 16 Aug 2022 13:34:56 -0700 (PDT)
X-Received: by 2002:a05:6870:659f:b0:10e:84bd:510 with SMTP id fp31-20020a056870659f00b0010e84bd0510mr133970oab.191.1660682096084;
        Tue, 16 Aug 2022 13:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682096; cv=none;
        d=google.com; s=arc-20160816;
        b=hHack9gP5AphoZP+xHmBU/AaiQKcV86HaBGLMea5/kGGnvlUZv7SROCa7s7aRK6+jU
         kvA2xm7Lmbbg4oQQoZq8JKCnJFFRpU4WMTuGy5RC/H2CqlU1vSbpRaMXpocHewOjJHxv
         BnotHLxqLK7FEW7cnqo39ll4ezUHDVMp/xp4GtzmXe9TjNEG6O6bztkEIAoCy90CcR6A
         jkoUDPl9jFJE4X8RvCsF2HH1KZh0IyNwdM55OCNXLb8HkRjC+4N0kQeUukKCbKkTMn5u
         eodwiJeZbxqboNcATpR3MlLffDIrkXpeaFL+05DsjjfOenNoUdnPBPM87e1tYwUdg0QF
         wQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IWlaZaIHC2PGKwPraJEjxrFHVPFHU1XNUZVWkV1OIpk=;
        b=s4LubJIest2w/EobGKC1ZpH2eRvjizOSzm7cbmOY2sguLPZKJZXoo58ht2eD5h5lZo
         CHHn2fkI5+4SfJkfUgJA4LJUL23GEFbKtT25Lsb6Cb/dASenukQ3iiRDobn2tCDBX4Bt
         B+KlFs2ZSIWk7S4Upr0Zrni+kZP2d4F0VT1wrkn6f9v4AQ1ZhzDLZhd38UM793QYt7PT
         /isUSywOuAlwt1qWN53LJstK2Me32cREElLfA5kqYU56oD200OTlrimncU5WJUszjV28
         e86kUV0iFJTCw7SmlxIoC2OFuc+9TYiaIp0Ledmk0hfCaO6USApbyubfWDWZZ767ZFQR
         HabA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BKlIQ+5Y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r29-20020a056830237d00b0061c983046d8sor870788oth.185.2022.08.16.13.34.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BKlIQ+5Y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=IWlaZaIHC2PGKwPraJEjxrFHVPFHU1XNUZVWkV1OIpk=;
        b=BKlIQ+5YT+38KuvNo6tgQEW+/xf8+sZekutZ85uXzRqkoemR5TYJz47uA7nIeZyCqe
         t6mV0Vm8zjf2B4c1EhANRMgBML0stYENP9WAqW2AIURuB0fdbirDOc9x0FQIAKHU7Y9p
         1rd+oZ0wS4E3KDLJoNlAavp3MIIbvNSaN12gInYCDo8rOhvG3pIt85kh+4BTUojKiPez
         dImJLFLbE0GOhoraQBknw3ayJerBpTm2pZrwsQP7BARvYIb20vD+MstQf8Ie7GDXdmHh
         r5+e0S4bGM/BZZDvvLyHkWCqIG5bLF0bj88UYBDzY+Mkb1z66KiOv4Iwxn01Xmkc9E/j
         6TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=IWlaZaIHC2PGKwPraJEjxrFHVPFHU1XNUZVWkV1OIpk=;
        b=myT1l80QULM6sV5uOyYovx0eT6i/GvMW6YgfYJy/785zq60148TZiw/6ZLKod8ZF0M
         3a7PQ76Y/c/M97XVdt9rOOzsmOI52rJYZu62uBy7/63SUtOr3TFq+ywZIuk43+Q/9BKp
         410xaHkQXo+YklbSFxm5pQPpqlFwjFJ08d34w6daUKuuXgMnAjYvSxTnOtwqJPCf2See
         ++b6dJ8hYzZB4HLDt/2xeVD6T+FwqTh4pQthSP5PIDMtgwuqLTmyvGiydiHvQ+gS3fR6
         DHdRs5gvQcFfHVobxSEHtJAwBJnR9M+fmmjLm3YuCaNMcKHppZfewby2Aw9tHug05Qjb
         mfnA==
X-Gm-Message-State: ACgBeo21yGdBatuziIEJaBxhJsRHq2TjTrb7CfaLjVZ5kwKytBfbQ+Hb
	suP3xV3jks0/BoKnMKeKx/XVD/DR
X-Google-Smtp-Source: AA6agR5aW1q5SS3I9prsunymWig6bYB8K4V+f2+SVHAg83nskmez5tQIhEX28HqhI2D9QnZf4jc3WQ==
X-Received: by 2002:a05:6830:18d8:b0:638:969c:1eef with SMTP id v24-20020a05683018d800b00638969c1eefmr5486363ote.49.1660682095703;
        Tue, 16 Aug 2022 13:34:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 24/33] accel/tcg: Split log_cpu_exec into inline and slow path
Date: Tue, 16 Aug 2022 15:33:51 -0500
Message-Id: <20220816203400.161187-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +5NVZoR+lgTz

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f7c82a8f2c..d758396bcd 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -283,12 +283,11 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     return tb;
 }
 
-static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
-                                const TranslationBlock *tb)
+static void log_cpu_exec1(CPUState *cpu, const TranslationBlock *tb)
 {
-    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))
-        && qemu_log_in_addr_range(pc)) {
+    target_ulong pc = tb_pc_log(tb);
 
+    if (qemu_log_in_addr_range(pc)) {
         qemu_log_mask(CPU_LOG_EXEC,
                       "Trace %d: %p [" TARGET_FMT_lx
                       "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
@@ -315,6 +314,13 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
+static inline void log_cpu_exec(CPUState *cpu, const TranslationBlock *tb)
+{
+    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))) {
+        log_cpu_exec1(cpu, tb);
+    }
+}
+
 static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
                                   uint32_t *cflags)
 {
@@ -412,7 +418,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
         return tcg_code_gen_epilogue;
     }
 
-    log_cpu_exec(pc, cpu, tb);
+    log_cpu_exec(cpu, tb);
 
     return tb->tc.ptr;
 }
@@ -435,7 +441,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     TranslationBlock *last_tb;
     const void *tb_ptr = itb->tc.ptr;
 
-    log_cpu_exec(tb_pc_log(itb), cpu, itb);
+    log_cpu_exec(cpu, itb);
 
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
-- 
2.34.1
