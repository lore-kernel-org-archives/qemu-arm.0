Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2645270ejb;
        Mon, 20 Feb 2023 13:50:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+nzpGlik4jBg66tgvT/x95NKw8ZFm6Ghr/lcOEwZVq4roh9G91gI3cXybeQY0QWi9W3Bo7
X-Received: by 2002:a05:6214:dc7:b0:56e:b25f:3602 with SMTP id 7-20020a0562140dc700b0056eb25f3602mr6778356qvt.43.1676929802474;
        Mon, 20 Feb 2023 13:50:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929802; cv=none;
        d=google.com; s=arc-20160816;
        b=VP7lQm0w/P6I6LOsuwJXxTulUn58yN204FqMHl6v4dFzHS5p0+dyx8LoOpen2u5em2
         BMj5/Ynm7/WZPglSxc9H+b0J51ExWmrBq32pFEqOgMOxk3cw20AklMfHe/2qVQXr54iT
         3dblojL4mYCcy5J9QK78KmWjFcvWNyuYrYUbpS1D35LB2Z/PKwnLhyUrvs70Vz31Ry7m
         pzmWcGSx9GnwJvbYxuLo0Q5YPtEkZw32I4cOyVBaMMEZpJc9M0g4yEq4gM1HQnyk2Ch9
         eZNNqDmT1+zsr7lOOyq0Q9UGim6CcOhjaSpJ9886jYtOIOA7Ol1/LlQVQrDaKPsYYb4L
         HfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tjjwd784Y94WrzQQX5HuuQunV9l5Ak3IUG0XDnxdkl4=;
        b=jIbk+5s9VWjRlJMnWlLfDBAyTGlyIdrOcgZXpIN9aevI0EhmBkPZqiq7mVJsyU9a/X
         O8BuLI8OafaLSxb/F9IwICv9ByJpRhLpp8bO+d1EGZtKOGt5mZ1L1KvitXXFR/mvKdzD
         FkZnNjhSELra1Zb5RGkBeacFu6RrEZFbNTITgYUQpwjXgDei6ZWvZjMzFgDafHoPsW04
         4Y8fYA5Cfli1Xvo+m7cxtLRqfmL9SWhLnC/CcVRhhTCBBMTq4FcybOST2d/BzSldNvAq
         roITjyiCKeXPk6BYU0J2ybKpdgCJf0iGulfWNChQacQG5HUGJJxCtk67QQyYdBn4iRy+
         nCCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AFx6aFrA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ef14-20020a05620a808e00b0073913032996si10337654qkb.506.2023.02.20.13.50.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:50:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AFx6aFrA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUE2A-0003Ox-OX; Mon, 20 Feb 2023 16:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE29-0003Oh-08
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE25-0007vn-9U
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjjwd784Y94WrzQQX5HuuQunV9l5Ak3IUG0XDnxdkl4=;
 b=AFx6aFrA5IP4h5HxknAqsTuBenfPcWkFe80s8rAya+9kFEyxvqlJXoHm2ugkDq6R+X9FxL
 BpaK7r/LhnrvvTQa7+uvOPkUpBVJdqulwOHGLLj8m8dGsU2BY/oEEBbETER84BHZdSEcuY
 TfV4SI2DSGbMaQCwDKNqKa/MNTHLU88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-aV9EnTwiNJWc9AUkPnL0Fw-1; Mon, 20 Feb 2023 16:49:08 -0500
X-MC-Unique: aV9EnTwiNJWc9AUkPnL0Fw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01AD3802D19;
 Mon, 20 Feb 2023 21:49:08 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C7D7492B04;
 Mon, 20 Feb 2023 21:49:06 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 01/15] util: drop qemu_fork()
Date: Tue, 21 Feb 2023 01:48:45 +0400
Message-Id: <20230220214859.3792171-2-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: n75Svv1qi6is

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fortunately, qemu_fork() is no longer used since commit
a95570e3e4d6 ("io/command: use glib GSpawn, instead of open-coding
fork/exec"). (GSpawn uses posix_spawn() whenever possible instead)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/osdep.h | 14 ---------
 util/oslib-posix.c   | 70 --------------------------------------------
 util/oslib-win32.c   |  9 ------
 3 files changed, 93 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 88c9facbf2..f68b5d8708 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -665,20 +665,6 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
  */
 char *qemu_get_pid_name(pid_t pid);
 
-/**
- * qemu_fork:
- *
- * A version of fork that avoids signal handler race
- * conditions that can lead to child process getting
- * signals that are otherwise only expected by the
- * parent. It also resets all signal handlers to the
- * default settings.
- *
- * Returns 0 to child process, pid number to parent
- * or -1 on failure.
- */
-pid_t qemu_fork(Error **errp);
-
 /* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
  * when intptr_t is 32-bit and we are aligning a long long.
  */
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 77d882e681..760390b31e 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -583,76 +583,6 @@ char *qemu_get_pid_name(pid_t pid)
 }
 
 
-pid_t qemu_fork(Error **errp)
-{
-    sigset_t oldmask, newmask;
-    struct sigaction sig_action;
-    int saved_errno;
-    pid_t pid;
-
-    /*
-     * Need to block signals now, so that child process can safely
-     * kill off caller's signal handlers without a race.
-     */
-    sigfillset(&newmask);
-    if (pthread_sigmask(SIG_SETMASK, &newmask, &oldmask) != 0) {
-        error_setg_errno(errp, errno,
-                         "cannot block signals");
-        return -1;
-    }
-
-    pid = fork();
-    saved_errno = errno;
-
-    if (pid < 0) {
-        /* attempt to restore signal mask, but ignore failure, to
-         * avoid obscuring the fork failure */
-        (void)pthread_sigmask(SIG_SETMASK, &oldmask, NULL);
-        error_setg_errno(errp, saved_errno,
-                         "cannot fork child process");
-        errno = saved_errno;
-        return -1;
-    } else if (pid) {
-        /* parent process */
-
-        /* Restore our original signal mask now that the child is
-         * safely running. Only documented failures are EFAULT (not
-         * possible, since we are using just-grabbed mask) or EINVAL
-         * (not possible, since we are using correct arguments).  */
-        (void)pthread_sigmask(SIG_SETMASK, &oldmask, NULL);
-    } else {
-        /* child process */
-        size_t i;
-
-        /* Clear out all signal handlers from parent so nothing
-         * unexpected can happen in our child once we unblock
-         * signals */
-        sig_action.sa_handler = SIG_DFL;
-        sig_action.sa_flags = 0;
-        sigemptyset(&sig_action.sa_mask);
-
-        for (i = 1; i < NSIG; i++) {
-            /* Only possible errors are EFAULT or EINVAL The former
-             * won't happen, the latter we expect, so no need to check
-             * return value */
-            (void)sigaction(i, &sig_action, NULL);
-        }
-
-        /* Unmask all signals in child, since we've no idea what the
-         * caller's done with their signal mask and don't want to
-         * propagate that to children */
-        sigemptyset(&newmask);
-        if (pthread_sigmask(SIG_SETMASK, &newmask, NULL) != 0) {
-            Error *local_err = NULL;
-            error_setg_errno(&local_err, errno,
-                             "cannot unblock signals");
-            error_report_err(local_err);
-            _exit(1);
-        }
-    }
-    return pid;
-}
-
 void *qemu_alloc_stack(size_t *sz)
 {
     void *ptr, *guardpage;
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 07ade41800..528c9ee156 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -283,15 +283,6 @@ char *qemu_get_pid_name(pid_t pid)
 }
 
 
-pid_t qemu_fork(Error **errp)
-{
-    errno = ENOSYS;
-    error_setg_errno(errp, errno,
-                     "cannot fork child process");
-    return -1;
-}
-
-
 #undef connect
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
-- 
2.39.1

