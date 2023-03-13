Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172584ejb;
        Mon, 13 Mar 2023 04:48:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set/aU0Q92FiG5S8jIE1nZ/yb1CyhtsOVL8+2RPZMtJwOkoh7WAldrJOL+L5HoxvJ+xTgU/mS
X-Received: by 2002:ad4:5761:0:b0:5a9:5285:13e2 with SMTP id r1-20020ad45761000000b005a9528513e2mr2851644qvx.4.1678708111941;
        Mon, 13 Mar 2023 04:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708111; cv=none;
        d=google.com; s=arc-20160816;
        b=BxSX9Mb7pj4Lv2Vsa6iG6q4XmgQwMP7zxo/5ad4DB9Vf39GTLAiRIZKaNwrDjNq7tp
         kdNDiUTRg6o6PkoYkwE2ZE+bwxRNfH23ydJ3g9aEct6LKn+byx4kLfv6R8F9RMNyEuOu
         L8rUfFCrtawROLQK3pfmhtV6Snvj4l0qTJOr2P1uz2mv5PSh80/ySXWexv+8DYRvcXaM
         lJjSpuB5pbqT9ckBkWfT1x3TRDfd5ZUktv0UXE3+694FmrYMJ4Tl+Uu5E+OsaY496tlE
         G+zfPHcLvsNd8qJd5dDRFzzvbEbv3nKz6SnIo940WnB8BH0fEgoCaUtw4zKBAYsBAWOF
         81Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vY41lKMgTDFfWz8h2Umz3+YohajBmUcq3B29GCIk2wU=;
        b=vYY9o/cDZd4jJeaaCcJj8oR/oa07exXcrdZ9QCfc2keJEZ1wyLXqHnCz8di4OCQulq
         bhrpURG7Px4OQ3DejLGzDYV6oR2jSZwuZr1zzplAk70UqFpoKlVgWJbkS6rqQXu5C9aT
         o3fZTQrbm1rp2NwZn0QIY+weVB+amSG57P8AzaqvGO6geLwhVsXieJDOdyiKeoXIdf2N
         PIJ1rw04U2NSKAZ5Oc7WY6vR9UBtGO2xPuMGnvuyc9QSNbw0B1gnPkeK4IhaxFghvj8d
         wqllfwbmkFOyf1+ggnQQ9xZTLv7X6iBbRb02L4GP8JkQm8Q4YVT+hvafqBqUsI23+FSE
         bx9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z/wZLptZ";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l4-20020a0ce504000000b005aada7ffcfdsi75006qvm.363.2023.03.13.04.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z/wZLptZ";
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vY41lKMgTDFfWz8h2Umz3+YohajBmUcq3B29GCIk2wU=;
	b=Z/wZLptZCrS2WhdtkkNePLy8KLwlPzOWqrVs1yyCeYnoQNR9HHuTDoMMyHeE15PZ5AqjUV
	z8bIj8uE5YORNK5i+jtc9b2ijE8R9hkYOoAyx7W9eLu1LQvZnf9mP1DuD8fJ3ZNkasdZsT
	wwQw1xR7LAYl1cAdMcAhNYd1W/HFABU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-RswgkX12MMK-Jtkzq-9haQ-1; Mon, 13 Mar 2023 07:48:30 -0400
X-MC-Unique: RswgkX12MMK-Jtkzq-9haQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C684858F0E;
	Mon, 13 Mar 2023 11:48:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4FE962A68;
	Mon, 13 Mar 2023 11:48:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	Thomas Huth <thuth@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 21/25] monitor: release the lock before calling close()
Date: Mon, 13 Mar 2023 15:46:44 +0400
Message-Id: <20230313114648.426607-22-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: +5equEuUAynO

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
