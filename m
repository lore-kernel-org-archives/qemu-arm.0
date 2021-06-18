Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1856672lff;
        Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
X-Received: by 2002:a62:1782:0:b029:2f7:dcbe:c292 with SMTP id 124-20020a6217820000b02902f7dcbec292mr6653629pfx.63.1624044594025;
        Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624044594; cv=none;
        d=google.com; s=arc-20160816;
        b=n0x1KraUuQoirGNdUX0XhuSyrvcVHOCFLq0dG25L9Nt6DfAJB1t+zUIrtVmM3ZZg1j
         emViYUCuCCYnPxcod4MI5DT3EVuGMhw1pr8dHxnOqbP5dAsWJZgz5wQ8GrM15wIQrqAR
         0hM11iFTHCO4hpisevZicnUMuJMk/DhSLrnuk1ZrGKR8y+CD1wqmyQpemr0/tt/xCKJe
         CI07IaA3vhS02zHDvcSF8KmWh1HIw1h17HR6tq0CfOAs+vu7yzoiwaHbABc+1KpVER77
         SkwUOHlLCfN+mLRXrkRxnEmqHXTiIQqMYSeUDA+NpvgexA38HHKeVxp6Mtouzmme28Nd
         3NFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=d9tona3FrkUxASE7ND04pERUPgqb3UguvkZrVQbmfTs=;
        b=JwKjTxPcSLwiXorNe6LCfAB5zoMH6KZFOoKi9uACC/t+FYEK5HMu6ZIXjE5ccW11Sf
         M1o4cG53eCl6bGRnO/0+xPyX0v8oD6VgWBvw4LquqQxuOqYoGL1Y4aMAldabnuKukr3z
         CumFoDXY6wcomMv8LLjYOHx0CE1ENdLiajoAetIKkKmiR7+L48RTRVtX2nRK2V3K30H4
         Xdv95YRfPRr6krOhpEQnyl9fAszbCKa+0lKyLKCYF4efwNnNP9IhhUMLQ5D2HzgZnL+c
         l9Np8+BPi7dMrmZkW/8yVf9jZ+3cWJsuKPMk4EJ49H3dU52lS/2FTmQc0ZNDwIk0d7+I
         ax7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XGhyRH02;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b15sor5349445plg.36.2021.06.18.12.29.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XGhyRH02;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d9tona3FrkUxASE7ND04pERUPgqb3UguvkZrVQbmfTs=;
        b=XGhyRH02Fyr4/voCKwCAPEr0B4x8vc3L2NbBDdzNQsnHxPxANwVl8h5L50DOc8i55e
         bk0OmD06VXOypemhj2suNsbaVy7qjQ697b+RC4+YR3B+4K4Xk8M5gUsh4tLJudADHeTv
         yhOwKr/vAg38gCqGksA03Zj8FcGuKaF3IDZXcCeVjYmn+QaCvpHHtBsedEwAuwcMu3nq
         fweYBRTpvmim2QmTotKfFPeH5llUAeJjdCh4Z+8j7Y56AqjdUtzkpFG0vLNk7GBmD1VM
         Y+koyFj40SWI3zJJDdn3yAccCIBTNI+LPGEpmUVQOoq9pNv15eekpIMPUebNTPflj5o7
         DGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d9tona3FrkUxASE7ND04pERUPgqb3UguvkZrVQbmfTs=;
        b=F6273NKgkXkqzOI7OjcWln1pAULowy5DO8l3i3MkopmYMmE7XdHzDjbKNrGoxqebEk
         HrqUUOXDInWk+z+TX5NQqpgpN8B3O6sf4r35H+TTD81KxvXl1OIAbjmv8bCICEyNRhPo
         PtugTQDiYKbgj+/1UwwFWfxGZMyMfqLO5cl7zjjwYn2RsC0zetGKX+AVAloo6CEgiBPT
         31WKx68ceXErWPf93vinshUOaYkkJZBZ99khoz9Yi6iGb0AD2JTdFc8jntUqewjzFGkR
         1PUKAUZVDURfmx645h+Q3hrrjMfp1gDh5QfimuW3adCcgCmdwhSE/bVHEODCgi24aJOM
         F8eQ==
X-Gm-Message-State: AOAM532+SfUXvVkbMnQHscaN7r0HOrEiINaNlyOjQSl9gLknEkUZlFAr
	wrrwS2g2zAlOXobktpSLejahDsLq
X-Google-Smtp-Source: ABdhPJzJufPgqfIgvKOVF7cL0CRM36A6/sUC56obCxvRpklek7Pm7gkPCs8WqjpKoGhXatvJa050iw==
X-Received: by 2002:a17:90a:4311:: with SMTP id q17mr22724216pjg.204.1624044593605;
        Fri, 18 Jun 2021 12:29:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.149.176])
        by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:29:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 02/23] linux-user/aarch64: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:30 -0700
Message-Id: <20210618192951.125651-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cke93spCG93z

Create and record the rt signal trampoline.
Use it when the guest does not use SA_RESTORER.

Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
