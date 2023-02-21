Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3216540ejb;
        Tue, 21 Feb 2023 04:49:08 -0800 (PST)
X-Google-Smtp-Source: AK7set92nSsGeRiyAHyJJThYxNLYLGrEMIkeMC1zoFO04mBN9Kw9hpnegUQaaqbvJgAWJ5v609zo
X-Received: by 2002:a05:6214:20eb:b0:56e:b88b:7a9f with SMTP id 11-20020a05621420eb00b0056eb88b7a9fmr9494265qvk.44.1676983747970;
        Tue, 21 Feb 2023 04:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676983747; cv=none;
        d=google.com; s=arc-20160816;
        b=X9dvI2+AgHjk9V6C8tzWeshPy7YfgkNfPb4lxTquOH96drzqrxHi+ioLr7nl65XZDk
         HJDVYmW+sF1LO5rmUZfj1lCEw+4W3KEdcgVy8CM5zHdygHZGGwyrxQpmwvKfw8HTzpEk
         y5nYz9J8SN3K7muvb8ikfBlHzJAy/4BakgaciAl3b+jVCncLmTi0odgZ5nFoCLz3NPwL
         RV4aFgvKsJVgBSJAtEe7wEygRFFU8MseoAzlVbyjniAS/1MjUjD8H+DCHKpHJxLb0Hjg
         ICfqBPIpWK6eIJ5HyKi2dMqTDfZYh8l5wEAmhMF9QxH6Lp89N3TWFkdhniGO6xh21M/c
         nQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q1VhuUIBLyJViYQfmtutUSPG/L6McyTaXl2hq9YQizo=;
        b=JNv/U0oJ85IIQTZe9aBNC/qJ7PyofViaiKRN3IQaB3MJucrs1AFDd0d0N6MoY9Yclx
         GqC22bMvHt9GuIBSa4X0t2MN01iw3BAfJXIbj1PzAMYqUlDqr/0/Q6uyl+kZPzaffUhC
         pbFAEuPU7uYNPJfLDO4kuUttqrXH86A3XkheIG8JZ+/rWf3xYIysOiCE8dvxeP8TY1sT
         VdUmM3/2bmLXj/MimqvjQTDhcNqcgmUxtrixqp3Vw2ZoQPoRjR53NSDAFQaRk6BY8qwg
         iPpoHuLuCXKqv7Y7Vy4LuxuHca9RwG7pUukpCx1wzb3hrTftO7CbyLVUqTPhCm9AV/Ew
         VD9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e4D2I0CV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a0c8bc2000000b0056ec16234f8si3628508qvc.350.2023.02.21.04.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 04:49:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e4D2I0CV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUS4q-0005XH-Th; Tue, 21 Feb 2023 07:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4b-0005I4-Cf
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:48:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4Y-0007uA-HV
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1VhuUIBLyJViYQfmtutUSPG/L6McyTaXl2hq9YQizo=;
 b=e4D2I0CVrLLVNHBLv+Ujb//EKJKOoJM3WZBQBFGDbtG0M9MRj7g6P6JnlxS0DBZ0schMCq
 vMGbd9sKTnEvwvUfuLeNdyYhtxoknPxBzLeefElXw1rARd87r0jRl0u3j5TYPICqdxmEUp
 ggxcIQipRjyINkh3MrfRtQ0SQGVH7NQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-oToJwZy1OKCsiapDZVAS2A-1; Tue, 21 Feb 2023 07:48:37 -0500
X-MC-Unique: oToJwZy1OKCsiapDZVAS2A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D290B101A521;
 Tue, 21 Feb 2023 12:48:36 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E26D6492B04;
 Tue, 21 Feb 2023 12:48:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 07/16] win32/socket: introduce qemu_socket_unselect() helper
Date: Tue, 21 Feb 2023 16:47:52 +0400
Message-Id: <20230221124802.4103554-8-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
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
X-TUID: PnFc8IQuZxbF

From: Marc-André Lureau <marcandre.lureau@redhat.com>

A more explicit version of qemu_socket_select() with no events.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/sysemu/os-win32.h | 2 ++
 io/channel-socket.c       | 4 ++--
 util/oslib-win32.c        | 7 ++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 0afb79cc2e..ae0c9a3659 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -149,6 +149,8 @@ static inline void qemu_funlockfile(FILE *f)
 bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
                         long lNetworkEvents, Error **errp);
 
+bool qemu_socket_unselect(SOCKET s, Error **errp);
+
 /* We wrap all the sockets functions so that we can
  * set errno based on WSAGetLastError()
  */
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 0bc29c4808..03757c7a7e 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -442,7 +442,7 @@ static void qio_channel_socket_finalize(Object *obj)
             }
         }
 #ifdef WIN32
-        qemu_socket_select(ioc->fd, NULL, 0, NULL);
+        qemu_socket_unselect(ioc->fd, NULL);
 #endif
         closesocket(ioc->fd);
         ioc->fd = -1;
@@ -846,7 +846,7 @@ qio_channel_socket_close(QIOChannel *ioc,
 
     if (sioc->fd != -1) {
 #ifdef WIN32
-        qemu_socket_select(sioc->fd, NULL, 0, NULL);
+        qemu_socket_unselect(sioc->fd, NULL);
 #endif
         if (qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_LISTEN)) {
             socket_listen_cleanup(sioc->fd, errp);
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index df752fc762..dbd32acc98 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -180,7 +180,7 @@ static int socket_error(void)
 void qemu_socket_set_block(int fd)
 {
     unsigned long opt = 0;
-    qemu_socket_select(fd, NULL, 0, NULL);
+    qemu_socket_unselect(fd, NULL);
     ioctlsocket(fd, FIONBIO, &opt);
 }
 
@@ -298,6 +298,11 @@ bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
     return true;
 }
 
+bool qemu_socket_unselect(SOCKET s, Error **errp)
+{
+    return qemu_socket_select(s, NULL, 0, errp);
+}
+
 #undef connect
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
-- 
2.39.2

