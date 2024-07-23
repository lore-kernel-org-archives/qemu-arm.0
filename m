Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2672218njc;
        Tue, 23 Jul 2024 11:13:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1wqd3EHSPwxBwPVOcsxGHGsCuo9KYCMWJgKc2G6Pre+RbcvKqL1teN06fClNJE0B0a/5ZTXA8F6TV73YFWdESgcZ0dyqP
X-Google-Smtp-Source: AGHT+IGWr9mhCPSBsy34uDknz1Moz0sFwYojd0Ny1e/2MdQAcswULpEmGaiGW67wE22eHQSArXsY
X-Received: by 2002:a05:622a:448:b0:447:def8:bc8b with SMTP id d75a77b69052e-44fa5285b6amr162484271cf.20.1721758382422;
        Tue, 23 Jul 2024 11:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721758382; cv=none;
        d=google.com; s=arc-20160816;
        b=ST53BcmJ0QYW59Nc5gLEqAIDho2tK4kf8px04+UEDcg7LBBLnSn3ZfIXBbs8/5uVdm
         edmcR47etSyUTFqJqARXsp2Iqt7OPSGUdWZMdaef++WswXlrFlCFwX/EoygVDSANcjE+
         IIVn1/4YDTAzQngvcqBk8FZ/8+8OlFTvSKH7TWDD6Kgs2BcxtrBn6PhneMzJdpuGVamv
         GDNneWZ/8j7bgY9zOXXxMk+uUl2FjxITJf1huLNRSDkI4pjyakcucYo4FItGf4ZRUbOw
         TDwBB7Y0l0O0uqCBVIg4l0j8qjuNZ8UxiuXnNGlmd2CkwrqMl9lCMaO0ZxZScVI+LsCD
         Ucvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7Whe4XPbca7lrsBGH9KDOzbYV/caOsn/K1GjqT+CBVQ=;
        fh=l262GoLAQ2M1w9YWs1hgVhKodUHtUK+zt51P82utu4c=;
        b=pPMdGaoTUWpDtTwZCy0F7j8TrYQiVyHQIN5VvzkE8DOC4XtHHPL9yxAXmHHcRTtR/p
         80BQ0Qc4pRCMuOa0l4ysBvdQwuN7780+0Jxrtw2H1PS1jSk0b5KRpepZJOcpAjIgykYt
         vxEHNgoxKXWbiADZyE3YnpqADv5WYR3X200MTd1xknxv8vgYjO/a6ADRkcep7T31NTOx
         dsEA7hWQkeoPR8sQj6mf11ucfEMjhudoSXnuPv5h13icjdASKP/a4aVyIwNWf5+UVO/r
         3QmOqeD0yCmmRHNzA+aA+F28T0bcteK4n6c8VjE/WquWOPZ26kY6jkHGqDbAKT5AbO+W
         wFNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=AHm70aKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccfbdccsi108935561cf.106.2024.07.23.11.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 11:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=AHm70aKq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWJxa-0003HV-15; Tue, 23 Jul 2024 14:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwx-0001JK-Hr
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:25 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwr-0001D6-PG
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:22 -0400
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-39834949e42so18089165ab.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 11:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721758146; x=1722362946;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Whe4XPbca7lrsBGH9KDOzbYV/caOsn/K1GjqT+CBVQ=;
 b=AHm70aKqq9olJXcLfcOzSXgVjD/0QCrFL7zES63TZof2USPSNiP1VtvfmfzYnKtedu
 TkY5u/0yPYCfL1mxqcGp2mObP3oMddhA08JTZKr8SoS/DVJvXTBNPe2u51aax0eX+5uo
 Him/vIxHNFvyfYYWKa4Pyfsajh/qYaor6+rUJ9nAajfPGR/FOljtmLt+9kWZCtqGu5K+
 /VuStATNh/yjCBDQ2IAaPqLiWLGNDPAwtP/uWRLe62NjLnyvyKPgYrx5sFN8OUjsR8WU
 eOu+Bx+3qJilgWeUyVDc6UBZUGkXb3Jq/a/cU0Z2Jx3MzhBolc2jqdyJsAYo/Aj1eK0J
 tNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721758146; x=1722362946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Whe4XPbca7lrsBGH9KDOzbYV/caOsn/K1GjqT+CBVQ=;
 b=fHkU12ThyEzI8gvKYyWq7LazcXHEY1OBxE9plB00309AnsNGIqSHxgHxvaG+sf/D1r
 0mNZrztFz5l89+TdpdzA9BQOgQPJc9jDO10nY5VQix6JHZIoHHCmkpyhcIyKSq/hjpVh
 tv/z0ZIs/2mIc9UMR6CM0fdVN+iVTLYucSn6I9f5RAovtj/+JZoQMnQCwwxH3HiVE6WF
 BDWuGkzCDtkK43nCT5kPoNabntr5x2l8Dh9KOHGNKqM4rwAbbKaAjiBcV6aUIDiADIh3
 8zkGUZH/9aDQQcIZ4PVIBGZv3jbG+BIcrM77f+gKjYORXerAGX2SPRUEU2EetRMHrQ98
 9cgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7tvQba2lfQwuNOmBwawejdO3txwFH6YJyvxnczumCrZ5s3iyF/Cf0dVsuNSDhv4DNDemxovqjldnljzeSX26C6kIM
X-Gm-Message-State: AOJu0Ywf9w0ESeTiEMq4g7qKkZ5I3i1LlLF8z6HFVj14KrLapi6Di3Bh
 2nHD0H3tCCAbJEetUsTk3yW7Udi+pd3AM2fZ6w0uo9LYRr/4aNTSgsCMvMmBSfhgxlTUyRSxe8u
 k2x4=
X-Received: by 2002:a05:6e02:18c7:b0:383:4a12:b77c with SMTP id
 e9e14a558f8ab-3993ff8615bmr127566505ab.8.1721758146426; 
 Tue, 23 Jul 2024 11:09:06 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f7a2827csm33361775ab.53.2024.07.23.11.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 11:09:05 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Doug Rabson <dfr@rabson.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/14] bsd-user: Simplify the implementation of execve
Date: Tue, 23 Jul 2024 12:07:20 -0600
Message-ID: <20240723180725.99114-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240723180725.99114-1-imp@bsdimp.com>
References: <20240723180725.99114-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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
X-TUID: oTGM1WVur5Rx

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

