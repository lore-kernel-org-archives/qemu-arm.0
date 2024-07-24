Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3360642njc;
        Wed, 24 Jul 2024 15:07:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxL0o1ihXhewEGlpnJeGFTekyVHaDWcscMKzeJlHqwQ58ApwSO2TCQKDPa3nJ0zcp/nWznHalicUHXQKCbBGg2C/R0b09p
X-Google-Smtp-Source: AGHT+IFs/gte3yNeogF03U0sv0+3Muphqbf29BuXhLmzKy4jC9HTKkbbn4u/h3vyn2jeR5ENbfWj
X-Received: by 2002:a05:6808:ec1:b0:3da:ab89:a808 with SMTP id 5614622812f47-3db1410791emr75587b6e.20.1721858837905;
        Wed, 24 Jul 2024 15:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721858837; cv=none;
        d=google.com; s=arc-20160816;
        b=tAy117KxXErNGRjjHA/9z7AT+oksCzo3PyUtnuP/rhMzY4JIkZ1Tm/REZ+9sudzEN9
         I4J3dRx3jgyr1H4w12uQMWPBeWoNjkp1N2+Kzvg/Ms7d8YlZ/PWsyzplU2QkcVyjhLO7
         vc19ltQYjZSO+5VR0688VFBOGpYxoIPY4wrsxRoyFXdYbpXdmLCtql7NQqUFGuzDbYF9
         cRd1H8TqBc0Frx02tulQ1hczUcHV2ACPPtxak5p53bioXfW+B31vXXE9t0achFqQ23N2
         noE2MhFyCNl9jvAzOX71+4r6SD3rvqgrj9uwrz8nO1RubNFlHrlCoyFZYNYcSx3fzCLe
         kLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7Whe4XPbca7lrsBGH9KDOzbYV/caOsn/K1GjqT+CBVQ=;
        fh=HUUBwPTUKFKjwU3mCJMW89Jko5k+6/ZUOu/1tIsbciM=;
        b=nKzXqrfKpfjeQyQDnaayUEuDAMeNbe9CeNQB+CQaVXBOnFqo2RKZmfKihqMSANCdaW
         uQX3QVBEj8j4G3ZlYeY23Odf6oZrGbuvJYtxunRzFLLxqPXvXShcljxUx4RsyLM5ADzz
         2iCV0fuQxM1apuG1S6pyh34sBtyMDjPrxlSXypTfTKhSx305W5BJ09aKYkZxE3E+Yy5q
         YHHgqB3ujV3BNs/TIE+mUcczMMSf8zA5Ma1+SjjK/yA0O6ldzy9ktUR040fn4USOU90K
         yA6l/0H9PA9e9mnwOWj5aeZVTl/1ir1WXjzII7ixX/U0qljcNrt/jQU/MTvBzHyR95Bv
         E0gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=ahXEshit;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81fcfeesi1135741cf.282.2024.07.24.15.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 15:07:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=ahXEshit;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWk88-000185-Tp; Wed, 24 Jul 2024 18:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7y-0000T6-Oy
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:31 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7w-0006bu-DT
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:30 -0400
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7fe8d029fbeso13826739f.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 15:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721858787; x=1722463587;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Whe4XPbca7lrsBGH9KDOzbYV/caOsn/K1GjqT+CBVQ=;
 b=ahXEshitWKLHCQ0G+SO8WLSU6/YAYY8o8oRi1coH4/xTmPKiGEEHNfmM5kZEmVgOqU
 GGmKVChlkrRY0W/NgSpCK2qLtoKUhmgJKF2DqfJL5I0fSGMZLjHW5J2GffzKc89UsEiw
 BfgU//kLFrfM7nUuPb+gbIm8XufXRuSnDeSDLQnEAEe1lDf7Alari4xrhihqzX3ybF3n
 2L2aXVAk6Yz8hCbBvY9sR3m4D47AjahYPzCsUk5T0Stf+Uff4HvjSMbOppzu7PVmjsVR
 nBymYSQctZXrPlrQm5a5SBVCK7M2sgKff9TwqlaayLxU6Y1jaqwfcGh9roTz0KjHbe7w
 QYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721858787; x=1722463587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Whe4XPbca7lrsBGH9KDOzbYV/caOsn/K1GjqT+CBVQ=;
 b=nkIiL+C/sWM7iTT4bInH2hyQJUUHCK31rBdha2wMYLnploDJLBOA6Wt7oqfhgldPVy
 bxoLAc/vPjFhtycbrZSrXI0HzemzwFsEaQ+Pm8fzagouYm3hmzRw/yy59FioDDijiX7F
 cOKUuwmrGvhMDzrIUJrVTupI+6CZ5v3GVHISFosjm0X/4C9M5z5mNc4wuhd2RBbGrRY4
 m07zSCNjaevJL7X40Jp8aLs16kmJZyDd2jTZPENyNNbeSR5imK/LKYBzeogHf+krQcXY
 QoKoJ7S6RIvqzwwMyZaXQQG3ljek8boxdUruGhZ8HwKmkLIqbyVnQ4UIs7IE8XKesmMO
 ps9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzxYkcz80rYv9yUsErI7wZjXeDVFvkdjlNfv6KftJxtdgvBLGx9sP/u6AD9XroI4ymZzVWlAHDPMlvpgd5nhPA4AC8
X-Gm-Message-State: AOJu0YwRqXGFkFOJgE9pe2KhI7HDyx45Tg86TG3jnqrihA8BNpUFuPlU
 IIlx16UbFA5kEU5Lkl6tzmb3BWfzg8kMrG/5EufkdfxD4SlC1t0PqzUXiZXvar8=
X-Received: by 2002:a05:6602:2cd5:b0:81f:774b:88ee with SMTP id
 ca18e2360f4ac-81f7e49b0efmr16585639f.13.1721858786982; 
 Wed, 24 Jul 2024 15:06:26 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c29fa983f8sm10086173.47.2024.07.24.15.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 15:06:26 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>,
 Doug Rabson <dfr@rabson.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/15] bsd-user: Simplify the implementation of execve
Date: Wed, 24 Jul 2024 16:04:42 -0600
Message-ID: <20240724220449.10398-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
References: <20240724220449.10398-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: QLqIA13p8C/B

From: Doug Rabson <dfr@rabson.org>

This removes the logic which prepends the emulator to each call to
execve and fexecve. This is not necessary with the existing
imgact_binmisc support and it avoids the need to install the emulator
binary into jail environments when using 'binmiscctl --pre-open'.

Signed-off-by: Doug Rabson <dfr@rabson.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-proc.c | 118 +------------------------------------
 bsd-user/main.c            |  18 ------
 2 files changed, 3 insertions(+), 133 deletions(-)

diff --git a/bsd-user/freebsd/os-proc.c b/bsd-user/freebsd/os-proc.c
index e0203e259b0..bf993f1b662 100644
--- a/bsd-user/freebsd/os-proc.c
+++ b/bsd-user/freebsd/os-proc.c
@@ -26,65 +26,13 @@ struct kinfo_proc;
 
 #include "qemu.h"
 
-/*
- * Get the filename for the given file descriptor.
- * Note that this may return NULL (fail) if no longer cached in the kernel.
- */
-static char *
-get_filename_from_fd(pid_t pid, int fd, char *filename, size_t len)
-{
-    char *ret = NULL;
-    unsigned int cnt;
-    struct procstat *procstat = NULL;
-    struct kinfo_proc *kp = NULL;
-    struct filestat_list *head = NULL;
-    struct filestat *fst;
-
-    procstat = procstat_open_sysctl();
-    if (procstat == NULL) {
-        goto out;
-    }
-
-    kp = procstat_getprocs(procstat, KERN_PROC_PID, pid, &cnt);
-    if (kp == NULL) {
-        goto out;
-    }
-
-    head = procstat_getfiles(procstat, kp, 0);
-    if (head == NULL) {
-        goto out;
-    }
-
-    STAILQ_FOREACH(fst, head, next) {
-        if (fd == fst->fs_fd) {
-            if (fst->fs_path != NULL) {
-                (void)strlcpy(filename, fst->fs_path, len);
-                ret = filename;
-            }
-            break;
-        }
-    }
-
-out:
-    if (head != NULL) {
-        procstat_freefiles(procstat, head);
-    }
-    if (kp != NULL) {
-        procstat_freeprocs(procstat, kp);
-    }
-    if (procstat != NULL) {
-        procstat_close(procstat);
-    }
-    return ret;
-}
-
 /*
  * execve/fexecve
  */
 abi_long freebsd_exec_common(abi_ulong path_or_fd, abi_ulong guest_argp,
         abi_ulong guest_envp, int do_fexec)
 {
-    char **argp, **envp, **qargp, **qarg1, **qarg0, **qargend;
+    char **argp, **envp, **qarg0;
     int argc, envc;
     abi_ulong gp;
     abi_ulong addr;
@@ -117,9 +65,7 @@ abi_long freebsd_exec_common(abi_ulong path_or_fd, abi_ulong guest_argp,
     qarg0 = argp = g_new0(char *, argc + 9);
     /* save the first argument for the emulator */
     *argp++ = (char *)getprogname();
-    qargp = argp;
     *argp++ = (char *)getprogname();
-    qarg1 = argp;
     envp = g_new0(char *, envc + 1);
     for (gp = guest_argp, q = argp; gp; gp += sizeof(abi_ulong), q++) {
         if (get_user_ual(addr, gp)) {
@@ -137,7 +83,6 @@ abi_long freebsd_exec_common(abi_ulong path_or_fd, abi_ulong guest_argp,
         total_size += strlen(*q) + 1;
     }
     *q++ = NULL;
-    qargend = q;
 
     for (gp = guest_envp, q = envp; gp; gp += sizeof(abi_ulong), q++) {
         if (get_user_ual(addr, gp)) {
@@ -166,71 +111,14 @@ abi_long freebsd_exec_common(abi_ulong path_or_fd, abi_ulong guest_argp,
     }
 
     if (do_fexec) {
-        if (((int)path_or_fd > 0 &&
-            is_target_elf_binary((int)path_or_fd)) == 1) {
-            char execpath[PATH_MAX];
-
-            /*
-             * The executable is an elf binary for the target
-             * arch.  execve() it using the emulator if we can
-             * determine the filename path from the fd.
-             */
-            if (get_filename_from_fd(getpid(), (int)path_or_fd, execpath,
-                        sizeof(execpath)) != NULL) {
-                memmove(qarg1 + 2, qarg1, (qargend - qarg1) * sizeof(*qarg1));
-                qarg1[1] = qarg1[0];
-                qarg1[0] = (char *)"-0";
-                qarg1 += 2;
-                qargend += 2;
-                *qarg1 = execpath;
-#ifndef DONT_INHERIT_INTERP_PREFIX
-                memmove(qarg1 + 2, qarg1, (qargend - qarg1) * sizeof(*qarg1));
-                *qarg1++ = (char *)"-L";
-                *qarg1++ = (char *)interp_prefix;
-#endif
-                ret = get_errno(execve(qemu_proc_pathname, qargp, envp));
-            } else {
-                /* Getting the filename path failed. */
-                ret = -TARGET_EBADF;
-                goto execve_end;
-            }
-        } else {
-            ret = get_errno(fexecve((int)path_or_fd, argp, envp));
-        }
+        ret = get_errno(fexecve((int)path_or_fd, argp, envp));
     } else {
-        int fd;
-
         p = lock_user_string(path_or_fd);
         if (p == NULL) {
             ret = -TARGET_EFAULT;
             goto execve_end;
         }
-
-        /*
-         * Check the header and see if it a target elf binary.  If so
-         * then execute using qemu user mode emulator.
-         */
-        fd = open(p, O_RDONLY | O_CLOEXEC);
-        if (fd > 0 && is_target_elf_binary(fd) == 1) {
-            close(fd);
-            /* execve() as a target binary using emulator. */
-            memmove(qarg1 + 2, qarg1, (qargend - qarg1) * sizeof(*qarg1));
-            qarg1[1] = qarg1[0];
-            qarg1[0] = (char *)"-0";
-            qarg1 += 2;
-            qargend += 2;
-            *qarg1 = (char *)p;
-#ifndef DONT_INHERIT_INTERP_PREFIX
-            memmove(qarg1 + 2, qarg1, (qargend - qarg1) * sizeof(*qarg1));
-            *qarg1++ = (char *)"-L";
-            *qarg1++ = (char *)interp_prefix;
-#endif
-            ret = get_errno(execve(qemu_proc_pathname, qargp, envp));
-        } else {
-            close(fd);
-            /* Execve() as a host native binary. */
-            ret = get_errno(execve(p, argp, envp));
-        }
+        ret = get_errno(execve(p, argp, envp));
         unlock_user(p, path_or_fd, 0);
     }
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index dcad266c2c9..82e94a03160 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -90,7 +90,6 @@ unsigned long reserved_va;
 
 const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
-char qemu_proc_pathname[PATH_MAX];  /* full path to exeutable */
 
 unsigned long target_maxtsiz = TARGET_MAXTSIZ;   /* max text size */
 unsigned long target_dfldsiz = TARGET_DFLDSIZ;   /* initial data size limit */
@@ -247,22 +246,6 @@ adjust_ssize(void)
     setrlimit(RLIMIT_STACK, &rl);
 }
 
-static void save_proc_pathname(char *argv0)
-{
-    int mib[4];
-    size_t len;
-
-    mib[0] = CTL_KERN;
-    mib[1] = KERN_PROC;
-    mib[2] = KERN_PROC_PATHNAME;
-    mib[3] = -1;
-
-    len = sizeof(qemu_proc_pathname);
-    if (sysctl(mib, 4, qemu_proc_pathname, &len, NULL, 0)) {
-        perror("sysctl");
-    }
-}
-
 int main(int argc, char **argv)
 {
     const char *filename;
@@ -292,7 +275,6 @@ int main(int argc, char **argv)
         usage();
     }
 
-    save_proc_pathname(argv[0]);
 
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
-- 
2.45.1

