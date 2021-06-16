Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp3469935lff;
        Tue, 15 Jun 2021 18:12:13 -0700 (PDT)
X-Received: by 2002:a17:90b:881:: with SMTP id bj1mr2140458pjb.119.1623805932858;
        Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623805932; cv=none;
        d=google.com; s=arc-20160816;
        b=mDeEb89GCexdLx/888ovjGWvZ9P3HQ7roi/u4XwLV6T82KiXu4NQVZPnCovpvL2rnw
         sL2+HbUN5o66ExSVxGsB0/k2GXpjsO/1O9zumljJcA0aK8P208Eu2BCEhxkWgbAqfX8r
         ORifqaV96cSj+PU0dDOEokAQn3F6jGeopbn/vsb0dDT2//xE3GMKuTNA3DsFY/UmEYrX
         UJodbNKXZymbwMuzqj7FolYbpb4DC/LELf9V/b2zY6luTZ70UCKgTZsj11TeHZioMvso
         kHPxwRmpMO19WFnx6Izp/gBW20OMm23KeQpScCo5vQg/BiQ63yA8UR9MZ8HMjEu1/sLT
         Rypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ll4cjliMp/QpwwT+A7QYxtz3tMdXsCsrcywGN6UTaqo=;
        b=iHDEkXPIGncXPwfVThPb/60KHjDBf81zVOJW5mWdgHRo7RmIB7ncqtG3dfzCT0U5R0
         854GuMJwAYWMuUa9t83fy1GLX7gRHqTXjshnUxXbau1Cgd4P7P2+pzDaprJLQCrrEgJ8
         kM967etBstQOGT/kfjzm/g2FnGXwAZRnU6JpMyZj0FanPY1WxysBAENCseJJNEhDla3P
         b6mqkct4fZxctdUVC+h7qGVSr3ytZ4MvJa0ds8RNUlg+a47qSVdD/0TRGa9e+73gpgGA
         n7S0BKwBgy2nIv8zUZbUEGaAD3ErQ9CSD9vin6IdbdqC1i2wPTj3zM+3dyT7JLZQSVjZ
         umZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XasN7Ker;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c11sor336739plr.68.2021.06.15.18.12.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XasN7Ker;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ll4cjliMp/QpwwT+A7QYxtz3tMdXsCsrcywGN6UTaqo=;
        b=XasN7KerkAux5h/jqkF/x0qQLCMBrL+BnCwPXIvknphiqrpc1TCbj2pTT0ycnJ7pKk
         tU4upxoBSfv5BacrpoBM+ckumBy3TKbVdJPwQ36Ffg+lztYZx8X1YG+xi/C4E+bPibHP
         LFjV8lryc7brQdUBqHn+uPnDIZr9WqSWy5WtNfDM65XuzoQyJB90LN2Vvs8g4FunR2ey
         9rnmx7gffIhpHNX16OOQivjGlkLsdU47j33Oj1uO3GrIKXBdzYGqp8CQ7hanFlRg2rKx
         pzSp3DBKnZKhBSfsmIt5kvqUwHNX9HOozcqaOYwjyhsbnERLmbSM2slaISTF507rSySO
         8XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ll4cjliMp/QpwwT+A7QYxtz3tMdXsCsrcywGN6UTaqo=;
        b=Kkuq1VZCmCA+e070fgUh6Ff5Fn6iGhPfGLglud9oRIzMV9dgYrYv3fqJg8t0StphIE
         d8i8L8NVimgIZtbbJQqi4FsZeE0w/M9ZpDRD5byut/QMqdNx909h3MOyb6JxXDoQg3cO
         h8KAVUfQ/ObAsALncUs60YZCQeQ8Zd7me1wznwbpUpon7xtoaJg+zCLA11KqySaSdTOO
         ql7kicTpx0BBLrP8vSwgJ8lUjyXwovZvdVdJF8XeJZt99JRSH7hMIZeo6JjcgDQZtVjS
         FVEL0pNfMjBP8xdMGagAhedEY1soz9OgNPSGwEzIXn6JBhLimXyhpyPJhm7oyPeAdUyy
         Kyrg==
X-Gm-Message-State: AOAM533cJjFGLArRYkK77jrV51pmJdmuNaKGv7AmWhGMcOVNS+abTC2p
	LHk3nvcfzPIQKcTXKGJp0mfOh+Dgpid5BFxc
X-Google-Smtp-Source: ABdhPJxAXlR2i24dSpgvsk2S5NkAGRfhxzwt3KkATdfrkhTzSAcFNF8z4QJsNi8EZ6jEJ5OKhwyfuw==
X-Received: by 2002:a17:902:562:b029:10e:eadc:41a4 with SMTP id 89-20020a1709020562b029010eeadc41a4mr6737245plf.45.1623805932310;
        Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 03/21] linux-user/arm: Force v2 frames for fdpic
Date: Tue, 15 Jun 2021 18:11:51 -0700
Message-Id: <20210616011209.1446045-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: OXHfMubW3dEB

The value of get_os_release may be controlled by a command
line option.  Since fdpic was added in v4.14, and v2 frame
were added in v2.6.12, this makes no change under normal conditions.

Split out a helper function to perform the test.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/signal.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 32b68ee302..2d30345fc2 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -165,6 +165,18 @@ static inline int valid_user_regs(CPUARMState *regs)
     return 1;
 }
 
+static bool v2_frame(void)
+{
+    /*
+     * We do not create fdpic trampolines for v1 frames.
+     * Thus we force v2 frames, regardless of what uname says.
+     * Support for fdpic dates from Linux 4.14, so this is not
+     * really a behaviour change.
+     */
+    int is_fdpic = info_is_fdpic(((TaskState *)thread_cpu->opaque)->info);
+    return is_fdpic || get_osversion() >= 0x020612;
+}
+
 static void
 setup_sigcontext(struct target_sigcontext *sc, /*struct _fpstate *fpstate,*/
                  CPUARMState *env, abi_ulong mask)
@@ -422,7 +434,7 @@ sigsegv:
 void setup_frame(int usig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUARMState *regs)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         setup_frame_v2(usig, ka, set, regs);
     } else {
         setup_frame_v1(usig, ka, set, regs);
@@ -516,7 +528,7 @@ void setup_rt_frame(int usig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         setup_rt_frame_v2(usig, ka, info, set, env);
     } else {
         setup_rt_frame_v1(usig, ka, info, set, env);
@@ -734,7 +746,7 @@ badframe:
 
 long do_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         return do_sigreturn_v2(env);
     } else {
         return do_sigreturn_v1(env);
@@ -823,7 +835,7 @@ badframe:
 
 long do_rt_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
+    if (v2_frame()) {
         return do_rt_sigreturn_v2(env);
     } else {
         return do_rt_sigreturn_v1(env);
-- 
2.25.1
