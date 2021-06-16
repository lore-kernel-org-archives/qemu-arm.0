Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp3469930lff;
        Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
X-Received: by 2002:a17:90a:8e82:: with SMTP id f2mr8004166pjo.177.1623805932271;
        Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623805932; cv=none;
        d=google.com; s=arc-20160816;
        b=kkREYnwToWY0xGlYKqzJyOG4votQkbvyDYtrZfiSOl61S+cDCr+TmImq32qIAzdqht
         u7ZAnt1zwsx4ZSbAahm29LalfYqs6xbulrdWyIdkJTcevW1duaSGjQW7NxqvHHgcBZAQ
         HftXW5Dd/KEavSv9Wp28HtAHTOnU+A7Bky04CYCAJm/fee3BDrQ7+AAPp0+P8QSKyk0K
         Rpzky9rXT3/vsjN+At0V5wZYCVbC6cPNHObHh3a+3KYj382Bw1OiRG6Zr/Fu0J+YhaYb
         0JCGKg+VKKa3YFRjO6rVRNBh5OzrEdKJRRSbMlAC0Ga0dgLN/hEMB8TrjF/HRCAl3037
         EZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pYIekZ7E/4IYX4eiK6xNe4M6uHE016F0haAs2Oq20xQ=;
        b=FLYnAesSZZ8HSbzDntyaI2Kz6Gxr36aOdZNXY8nMHBqobwhUTi+McDb8nMPTDnXleB
         Se9n/ovM2V49v5u2Fs+rsm0z19aA7WW7o47anw8AEV0btviqqPpnJ07A4b2SxOX9nqpI
         mPNrzZxV58k2Y6ISSIwAS8EVizZp6qb1J2PBb4ZhrMJT6i3KRQAsRlC/BwQeQqiKD6cA
         J+vp90ppTpqW081SUNiduRafmBlMlUb/d1AlKfA3UB3Iz40cCCki1ZaYDCXoR1RO6icI
         A+4o0RMjoDD1Ayu13AQ4z8S3q8C6uzTmHaON2euDXqcYr+qDoWnKK7aghtSuyQsuW6B+
         He8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cop90s9p;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 69sor263174pfb.41.2021.06.15.18.12.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cop90s9p;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pYIekZ7E/4IYX4eiK6xNe4M6uHE016F0haAs2Oq20xQ=;
        b=Cop90s9pWYpPLPVIBKugKe96uw6O0INI6O5CcP/EL2iTFNKsBstuetvJG4dR1F73gu
         P9vVyf47OGlWh35TZBk9/TRzOtmGCMFbw6wLsMUl50/hNRGCZZ5RdNWtkuz0S3MJxzPK
         PeAfdwOsbrNJ6sDsk/3xiJA2wtVcmylFVQKSfxM3KHJz1jipMDMayX4qvad58ThzWYXR
         poKRmOheb5gC3LdjCZq/nutiv6uGIeJjKdpWeSXT0NcFodWw5/6PWznK/3GLOek6CDRn
         gzjAvtEFrL5u3zYzzAYw/3JDGVkCRGno4R0k96V/k/80fLI9tzU65I5gpgfZYW8s2zr2
         sKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pYIekZ7E/4IYX4eiK6xNe4M6uHE016F0haAs2Oq20xQ=;
        b=HhWo32qSOtz4GHs19BfSYVD+/Ek3QOQW9lihig3McJ7xKVh/fvWBvw5uclqy0/W2oR
         9Qg3aTZj+ijnu509JP2XT8kr80QUke0gIISHPDAVXT9yYnRHlqor0fB7ddzESDASEsGO
         v+QmsCvB1wJJV7YoZzTVqF7AFvLCVVdejcdwGKij3oHXocWYkdoP+/kug88uIg947lD8
         /T3YvhnXw5z0067Gkm3NU8tOEhlGOR4JAa/W5aT+buzZSAqCteQSgvuaiO6c9iph0dE6
         gsQ1hgMrmgHiBL8Augj3jZNmwEM3puTTalqP/Bm+hqh+IfQGjU2uCk1UJE/gmGn99DnT
         qXDA==
X-Gm-Message-State: AOAM5326tl1HBAyslB7CdCzsSQbdrippxJexxBEeySdDC1HWHjFoUfFi
	F9gb2++vUDtffqN2LJZ43vGJXz6+
X-Google-Smtp-Source: ABdhPJy7tc7mQXkXt2kWBh75KuMUvKYI2MbNJbjL0kctjIV6w4PfySfE+Hnb2qi2xUcvuQG1QLrNfg==
X-Received: by 2002:a62:e307:0:b029:2f8:d49:7b65 with SMTP id g7-20020a62e3070000b02902f80d497b65mr6998165pfh.48.1623805931806;
        Tue, 15 Jun 2021 18:12:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 18:12:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 02/21] linux-user/aarch64: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:11:50 -0700
Message-Id: <20210616011209.1446045-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: reg7cAg53bAX

Create and record the rt signal trampoline.
Use it when the guest does not use SA_RESTORER.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h |  2 ++
 linux-user/aarch64/signal.c        | 28 ++++++++++++++++++----------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 18013e1b23..7580d99403 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -25,4 +25,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 662bcd1c4e..65b84eb04e 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -108,7 +108,6 @@ struct target_rt_sigframe {
 struct target_rt_frame_record {
     uint64_t fp;
     uint64_t lr;
-    uint32_t tramp[2];
 };
 
 static void target_setup_general_frame(struct target_rt_sigframe *sf,
@@ -495,15 +494,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         return_addr = ka->sa_restorer;
     } else {
-        /*
-         * mov x8,#__NR_rt_sigreturn; svc #0
-         * Since these are instructions they need to be put as little-endian
-         * regardless of target default or current CPU endianness.
-         */
-        __put_user_e(0xd2801168, &fr->tramp[0], le);
-        __put_user_e(0xd4000001, &fr->tramp[1], le);
-        return_addr = frame_addr + fr_ofs
-            + offsetof(struct target_rt_frame_record, tramp);
+        return_addr = default_rt_sigreturn;
     }
     env->xregs[0] = usig;
     env->xregs[29] = frame_addr + fr_ofs;
@@ -576,3 +567,20 @@ long do_sigreturn(CPUARMState *env)
 {
     return do_rt_sigreturn(env);
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /*
+     * mov x8,#__NR_rt_sigreturn; svc #0
+     * Since these are instructions they need to be put as little-endian
+     * regardless of target default or current CPU endianness.
+     */
+    __put_user_e(0xd2801168, &tramp[0], le);
+    __put_user_e(0xd4000001, &tramp[1], le);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1
