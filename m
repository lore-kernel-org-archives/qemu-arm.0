Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp170218ejb;
        Mon, 13 Mar 2023 04:45:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set+UYF9NWqGWFrfmueTLw32pmrhqf/2ZKwWOa950Ua5xma4usiTT41Fs0LWsm9Xumufp3gqI
X-Received: by 2002:a05:6214:d82:b0:5a7:a406:b9c1 with SMTP id e2-20020a0562140d8200b005a7a406b9c1mr4870110qve.47.1678707921288;
        Mon, 13 Mar 2023 04:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707921; cv=none;
        d=google.com; s=arc-20160816;
        b=WUXLCOC8Pc9bIFwxHo31/6dv39dv5mN5I52cQ4vqUlDjVTaITOldcxKi5Eat5QSetL
         ademPrOVG2oCVhv+q6OK2lR5/0LAtq6YXFeSHMvLZxlsYJSx/8Nh6jRhcFTXkkc2KJBX
         b7vunm7feEvHsRcTTZKDIEjZ4QesTmp3vgz2jgdqU+JzhCoo5ydVyUvTqH/RtAY30vBt
         4I7uXeUI/KVHhF6819WAQrNUBtiXb/zpp30+9vfiuUdsL3HwHpVvX60nK4uf+qI19KTb
         cRChQ4NlltLcRL+yFc3S/t4SHRwz8PxnEbTAMxmfrwngLH0G1JHjlLRHCCi/tdNAA2k6
         OeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vY41lKMgTDFfWz8h2Umz3+YohajBmUcq3B29GCIk2wU=;
        b=HIQleT/B4p33oLZSMFrF+hptb5z6UifUF0Z5uiN/RIKAu9XH7+0G21WU68DCaTt1Kq
         1rCestL44AJIJDpik70AC5JiWCSHe1VIlw5N45K4rG9Tp3/0T80zoAUgQ0R2TFSQKSy8
         9djKFGKFBRZiDfvJs2+i7Yq/8haNhYPupoY+T84WBZIVnvhuZeOYFhzlJ6lST0tXa+c8
         57SrGFZnEh2liTDyqUu/hDJcgg1khNZwCKYEtFyhd4V259P0d1Epg6vJA6I+2z3+zyOP
         nvZpQx6WmEvYqR5xf53fNMpOkWvUIOnwFVWNOnd9N2zira9idHZcnQ7iyzbgRFvCI4Q+
         xcOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OLVVFnSc;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id j9-20020a0cab89000000b0056ea051a8f2si4732637qvb.330.2023.03.13.04.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OLVVFnSc;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vY41lKMgTDFfWz8h2Umz3+YohajBmUcq3B29GCIk2wU=;
	b=OLVVFnScWFRLby45UwdzwnUOUtihg8Y6kxraKIqDXn3ghhUjWZ0nX+g1xkTYsA/VBhaSIv
	p1JgKCOu8q+mALhB+g6La1TT/I1OcOU2T+Fad7XCKd8q3YivsR4F0NXZDumKRgLbVB1QFA
	qvw0KoYPOujPDwv2CKXydIa/8DBCKyE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-EYd5WqAVOvG9e7p5VELydw-1; Mon, 13 Mar 2023 07:45:17 -0400
X-MC-Unique: EYd5WqAVOvG9e7p5VELydw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B80C101A52E;
	Mon, 13 Mar 2023 11:45:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2B721410F1D;
	Mon, 13 Mar 2023 11:45:15 +0000 (UTC)
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
Subject: [PULL 21/25] monitor: release the lock before calling close()
Date: Mon, 13 Mar 2023 15:43:31 +0400
Message-Id: <20230313114335.424093-22-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: KDICHpAlNFmF

From: Marc-André Lureau <marcandre.lureau@redhat.com>

As per comment, presumably to avoid syscall in critical section.

Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230306122751.2355515-7-marcandre.lureau@redhat.com>
---
 monitor/fds.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/monitor/fds.c b/monitor/fds.c
index 26b39a0ce6..7daf1064e1 100644
--- a/monitor/fds.c
+++ b/monitor/fds.c
@@ -80,7 +80,8 @@ void qmp_getfd(const char *fdname, Error **errp)
         return;
     }
 
-    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
+    /* See close() call below. */
+    qemu_mutex_lock(&cur_mon->mon_lock);
     QLIST_FOREACH(monfd, &cur_mon->fds, next) {
         if (strcmp(monfd->name, fdname) != 0) {
             continue;
@@ -88,6 +89,7 @@ void qmp_getfd(const char *fdname, Error **errp)
 
         tmp_fd = monfd->fd;
         monfd->fd = fd;
+        qemu_mutex_unlock(&cur_mon->mon_lock);
         /* Make sure close() is outside critical section */
         close(tmp_fd);
         return;
@@ -98,6 +100,7 @@ void qmp_getfd(const char *fdname, Error **errp)
     monfd->fd = fd;
 
     QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
+    qemu_mutex_unlock(&cur_mon->mon_lock);
 }
 
 void qmp_closefd(const char *fdname, Error **errp)
-- 
2.39.2
