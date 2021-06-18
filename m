Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1856680lff;
        Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
X-Received: by 2002:a17:90a:9b13:: with SMTP id f19mr12545621pjp.229.1624044594537;
        Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624044594; cv=none;
        d=google.com; s=arc-20160816;
        b=NE128nStQmNXcORnXd2cJNNiDkyE0wQmt/Wu/O9B6A80s+e68HTf81Yq3CMJ2GPRAf
         JcDa38tlkRN//ilb5TdGlBrjvgnNgaQpD4ZuF4SaLjeLEd5goIxr7L/uEzT0HphtoG2c
         A1Ys7MikNwv2FaYW4LhsRFbB+m9WAH0657aUZFNx7vmaNym3zmo/EN4olY1EO6GNnquv
         x1tLDHfnaZr5t+OJecC55D5lWopv+AGsvjbgSNX49vau4MOh1jSl2WSd8WA9j24U1nmc
         91IUvF5e4Iqpt2r08UUBs4Kzf2U2FTlUg6te6PoA6JiCW37OXc/YP40iemhntdQaFO2c
         yonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vF/Dv3hdb1vnrzJPeq46hpO+A1VIsu9mSs+eyoe3lIs=;
        b=SVM29/0En6Onkn+bTxdRrVMlCny8iv4QkGquruy4hRhoHckdefkaxl1xgA8J7RB2vj
         pyPcLhpZlVjbBlQybGTtsEfFSkJHR2fRnSSLuO/ZajUIkXOZi5ZeSjExU3Kdn2Q8UI6I
         8uKzM7EzJO0zfAIrXKNrLN4/qtyoA3Kme3seQj3PhZKe/Jvfy2TRk057/VoYxnsUGN6g
         tuAptt3WYACTyj8aO0LVCl/GjDmJUqCh3orP5tgUHwXTTU2nxJpIePSI3ypzDY5cPEO4
         LTQDcsnKiOpxe7oFuKMB+t3WMhf2pUaDTBXTOXPhZi2q/ycfIIu9DNG0FD9FsHy2q0qy
         PQLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RbVyyHno;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w12sor5153482ply.29.2021.06.18.12.29.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RbVyyHno;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vF/Dv3hdb1vnrzJPeq46hpO+A1VIsu9mSs+eyoe3lIs=;
        b=RbVyyHno/O+Shg0lvjANiqAKI+ptVlioZ0YFEbbi6mV7m4f0Jpo9nY9DVu83OFdkCz
         0EFEW2+PQBZDeNYfDlJNQOamB403QuqpSQ3bsIhhd5cBYDhtSES6kl0oiGab/FfhPWKr
         /xvEJYareZ/5DRQ9N4Y6OlBbTYwKle45983NV0EOpXeK4XBvhMYZeI4UQgfcV1YuSQG3
         N7WWr/EXtmpcBsBtsNhySRSqCmkFMnhoMKfdueAZttGeu5IJiUGr9eqQnoMIhNLNA+YC
         q4TYvUd9rNmtte3A26Y82v6CDhJ15H61p28phbNolHaHIXB2HFJMT7F/e9MNqMX3wHT3
         Of4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vF/Dv3hdb1vnrzJPeq46hpO+A1VIsu9mSs+eyoe3lIs=;
        b=T85IMDlfwqahC3n+zO4lUOfXu9JWCh2jqME6gEH1aCoR3R7+BUCTLohb5S2ASddTyh
         wXFmLSSNvg26oVv2/ahIOWtLCok9A9xYa1c4wnCwuasZTq05DzVxefJ4Z4r/P8nlzXnv
         GMxG5YlAAAq4TpwVOp9MihpAx9Zub9dSjsKXRIOurVQIXIiFe+MaMraWGqWnCghwV7sE
         mBEGOZQZRsXJrcEwn81bNNY2NuDqSjdcLvy3J+QWT57/tj4hIS0CNW3c8O3yQxVFLCrW
         OY4iSVYg76Al5d48putLXJTvj+4EHX6uhCWQkNNwDE0uMx9vwThLY4jHy9rMQbjWD1IY
         FPyA==
X-Gm-Message-State: AOAM5323ZAHzmrWyyQIIIdSGgzJpktxOZRqkBLNcIPbumTTfpAmFAD+H
	xJV3IiS/tjT8Fp2ARbindgYgW+m9
X-Google-Smtp-Source: ABdhPJzM7TbizGuojneKZmJl+RlBw/cUTJ9UxKZi1IIQ5Q9GshINiIYI5QGfKuVdJOTVQM5wH0hlIw==
X-Received: by 2002:a17:902:9a01:b029:11a:d4e:8f4 with SMTP id v1-20020a1709029a01b029011a0d4e08f4mr6140345plp.52.1624044594110;
        Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.149.176])
        by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:29:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 03/23] linux-user/arm: Split out v2_frame
Date: Fri, 18 Jun 2021 12:29:31 -0700
Message-Id: <20210618192951.125651-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NutYtEMvLwdF

Split out a helper function to test for a v2 signal frame.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/signal.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 32b68ee302..cb65623965 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -165,6 +165,11 @@ static inline int valid_user_regs(CPUARMState *regs)
     return 1;
 }
 
+static bool v2_frame(void)
+{
+    return get_osversion() >= 0x020612;
+}
+
 static void
 setup_sigcontext(struct target_sigcontext *sc, /*struct _fpstate *fpstate,*/
                  CPUARMState *env, abi_ulong mask)
@@ -422,7 +427,7 @@ sigsegv:
 void setup_frame(int usig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUARMState *regs)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         setup_frame_v2(usig, ka, set, regs);
     } else {
         setup_frame_v1(usig, ka, set, regs);
@@ -516,7 +521,7 @@ void setup_rt_frame(int usig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         setup_rt_frame_v2(usig, ka, info, set, env);
     } else {
         setup_rt_frame_v1(usig, ka, info, set, env);
@@ -734,7 +739,7 @@ badframe:
 
 long do_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         return do_sigreturn_v2(env);
     } else {
         return do_sigreturn_v1(env);
@@ -823,7 +828,7 @@ badframe:
 
 long do_rt_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         return do_rt_sigreturn_v2(env);
     } else {
         return do_rt_sigreturn_v1(env);
-- 
2.25.1
