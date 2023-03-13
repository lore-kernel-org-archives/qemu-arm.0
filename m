Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169041ejb;
        Mon, 13 Mar 2023 04:43:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set+1WJx/3mephKY9+ILkXGD3Uz0I10r4qbl362UChSzf0sZGGMas/J2yrcqSQGT4VTbiH7xh
X-Received: by 2002:ad4:5fce:0:b0:579:5dbc:ab8b with SMTP id jq14-20020ad45fce000000b005795dbcab8bmr12693508qvb.52.1678707829628;
        Mon, 13 Mar 2023 04:43:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707829; cv=none;
        d=google.com; s=arc-20160816;
        b=Cmo8o4oga4GJ4BLZtlnF2ox7hr0DFpuKZGp4lxCJM4aR+0K77wVXuGGLLetqDHETkZ
         2LnOvQ3DOizE/WJk86VGH2QshzAuhVdNdWcVk0IJiMMRHm7ZlTjPNCsJRUtEuqOUV2Fr
         QXm4FArXkiDbkQnacHxcbNSNixZoQ8e1vZ5bSqJF7y72yyRD5GGDyXr5UZmCSqXJ1fEp
         Hrebbk4WEZO57y5v1YnEV59OrhLTPL3jeTu2SWEJFJaRJDA3dKLGmEcp+repHyCX3CNC
         P6zsWT+96RVKm6CiBfrLD2JspbVABi7EtXGM9+1xLtv+cYdeLMPUH8Ii8UMqO6MWWWXv
         8etw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9CDG1QAa4TCDbCNsqeNWyQrEnH8MUpubsGVfZYyi7So=;
        b=FLloxbmdKB5oTVKK8710EIbrMRRd3axuCsyjdBGUOj1mSiBF+lgdvyOq/hRqkLRKwf
         48c4PEND/0clTPTQZzrOhWgNUwCJfBaP8HZ1bZ0kui26a6eSPcwtNMlbCvqG5mhuV+Oy
         8WUxFSjOyl9FgxSzi54rSYocvaQ5aMvbolZfVUFa+rMrZY3183hLwFsIMGnk96m/vz+h
         4bDVWgvpoRhSJu7iobpIchvrWyBcI1RlxGWnc6bu4JY2aHHeBkWGK8oQokatyVTWw/TD
         55I7hjhWr0Z/lon16HEwh6gsrgpRd+rHnGeo33s+LcmHmh8DGVnWFnN49grQerJBu21Y
         uvkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SfuKoixm;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v4-20020a0c8e04000000b005355c2c6db1si4726231qvb.494.2023.03.13.04.43.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:43:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SfuKoixm;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9CDG1QAa4TCDbCNsqeNWyQrEnH8MUpubsGVfZYyi7So=;
	b=SfuKoixmEouvdt84aAyOyqjH5MOCPp74i81oaAxf6xVC00Pnxu34BqDNa5/erM63amlA44
	8fZYGlCKe9RQCRyVfJ8KOH3/Tiwmeywq2bK23QFK8exjJJtMT2cUweCOdMYf7uKuu7FLiy
	tXVDJmxLjKMNUrgVKNZ+GLknbMtiS48=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-KLsWBQv7NX6u3hRK9s7Zyw-1; Mon, 13 Mar 2023 07:43:46 -0400
X-MC-Unique: KLsWBQv7NX6u3hRK9s7Zyw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 574CD185A794;
	Mon, 13 Mar 2023 11:43:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 021EE492C13;
	Mon, 13 Mar 2023 11:43:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 01/25] util: drop qemu_fork()
Date: Mon, 13 Mar 2023 15:43:11 +0400
Message-Id: <20230313114335.424093-2-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: Ukkr9Sv59hkp

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fortunately, qemu_fork() is no longer used since commit
a95570e3e4d6 ("io/command: use glib GSpawn, instead of open-coding
fork/exec"). (GSpawn uses posix_spawn() whenever possible instead)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230221124802.4103554-2-marcandre.lureau@redhat.com>
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
2.39.2
