Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp170467ejb;
        Mon, 13 Mar 2023 04:45:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set9EQyRL9o+bKuDuzDJYRGazFZ/Wdu0u9e74PqVXqjbeZW85auJUXQnXouO/GnJq9MQqFjRg
X-Received: by 2002:a05:622a:244:b0:3b8:6763:c25f with SMTP id c4-20020a05622a024400b003b86763c25fmr57234448qtx.13.1678707939032;
        Mon, 13 Mar 2023 04:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707939; cv=none;
        d=google.com; s=arc-20160816;
        b=AGvXBa7O/kgQ5KsN5S/LroVwQZWGPXAM/8nrLi3e5fX4807VfPJLFdn0a7wuqd509C
         8Z23uwnPrsKjECi07nxL6iNJfLT56ZHQCt2flrjABXK9xRYGx2gLXV16FLxMzW1nHE5/
         EBIU1e2cVJvYb4vT8dLOmPvRSA1oEWqMhxeqwipDSP/DoGl716kMps7G3HujLOw/S1zc
         zYJfhTnn4EIqt8pdp0G34vU23wJudELmqQSfY0OXj9ubXyQ2ceEbzL2EhCQv2cfl02o9
         UDOEa59x6Cq0EHmuxgadrfStgd7949LQFg8vVZMU2GljwmdWoziQYZKzqi9PFvtiB9hh
         7pPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Vp9rOFLaZH6WrKVbY+L9GOftplQA17FCdmv9kLHK54I=;
        b=VDfDpiT2A8Cf5KJVwb21KFcnarXM044h2A4TiHDMErKtcdO9Jk2O0Vm4/ObtURgZfX
         RNFOUrGo1AUvw3SEF8lbH3M3UBx4Dh6iqtIRBcVWcA9gyf6a7KWNLY1s/UTp+3BMWKmO
         QeF5cKxgMrjQTsXVK5rKZSwXXO7lSILZQ+UzHYQhXLf55hQgIjXmmUpc0m8kdi5SC6Br
         NVJ7j94+rjR0BNFJkZcBoQen6Q/rHHsjg5UG0lTB0pozLJeMbH/xgh15sKJ7EWph2PSb
         3+n2kahot/0LliqJUHxI3krEZ3VykqNl8LFxXNHqjqsXXHZRGWenLxUVFx69V4SiHOEY
         chPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XRqcXi8K;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id e11-20020ac8598b000000b003bcdd210492si5329814qte.202.2023.03.13.04.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XRqcXi8K;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vp9rOFLaZH6WrKVbY+L9GOftplQA17FCdmv9kLHK54I=;
	b=XRqcXi8Kb2N6SYB/UMiQUguMzHFu2JdCAFB4ugvmuPZZMYXWsdxbvJbRfDDuNZcuKazDFG
	1LepdnCNdD6P9t0zMkNo3nSZqT2PP7uSyMwfMHpYFtGKD+3oQc47HHE8UWr3lBagmj4uyu
	Dljvc6Ae1cjxn1DD6HF1E+/BVwKaMOc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-lKuvaSglPLmtycUmYYq1gw-1; Mon, 13 Mar 2023 07:45:35 -0400
X-MC-Unique: lKuvaSglPLmtycUmYYq1gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9E221869B0F;
	Mon, 13 Mar 2023 11:45:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E3B9C15A0B;
	Mon, 13 Mar 2023 11:45:33 +0000 (UTC)
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
Subject: [PULL 25/25] QMP/HMP: only actually implement getfd on CONFIG_POSIX
Date: Mon, 13 Mar 2023 15:43:35 +0400
Message-Id: <20230313114335.424093-26-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: o1joqLg2UL1O

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Currently, the function will simply fail if ancillary fds are not
provided, for ex on unsupported platforms.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230306122751.2355515-12-marcandre.lureau@redhat.com>
---
 qapi/misc.json     | 2 +-
 monitor/fds.c      | 2 ++
 monitor/hmp-cmds.c | 2 ++
 hmp-commands.hx    | 2 ++
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 5ef6286af3..6ddd16ea28 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -273,7 +273,7 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'getfd', 'data': {'fdname': 'str'} }
+{ 'command': 'getfd', 'data': {'fdname': 'str'}, 'if': 'CONFIG_POSIX' }
 
 ##
 # @get-win32-socket:
diff --git a/monitor/fds.c b/monitor/fds.c
index 9ed4197358..d86c2c674c 100644
--- a/monitor/fds.c
+++ b/monitor/fds.c
@@ -98,6 +98,7 @@ static bool monitor_add_fd(Monitor *mon, int fd, const char *fdname, Error **err
     return true;
 }
 
+#ifdef CONFIG_POSIX
 void qmp_getfd(const char *fdname, Error **errp)
 {
     Monitor *cur_mon = monitor_cur();
@@ -111,6 +112,7 @@ void qmp_getfd(const char *fdname, Error **errp)
 
     monitor_add_fd(cur_mon, fd, fdname, errp);
 }
+#endif
 
 void qmp_closefd(const char *fdname, Error **errp)
 {
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 34bd8c67d7..6c559b48c8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -192,6 +192,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+#ifdef CONFIG_POSIX
 void hmp_getfd(Monitor *mon, const QDict *qdict)
 {
     const char *fdname = qdict_get_str(qdict, "fdname");
@@ -200,6 +201,7 @@ void hmp_getfd(Monitor *mon, const QDict *qdict)
     qmp_getfd(fdname, &err);
     hmp_handle_error(mon, err);
 }
+#endif
 
 void hmp_closefd(Monitor *mon, const QDict *qdict)
 {
diff --git a/hmp-commands.hx b/hmp-commands.hx
index b87c250e23..bb85ee1d26 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1486,6 +1486,7 @@ SRST
   Inject an MCE on the given CPU (x86 only).
 ERST
 
+#ifdef CONFIG_POSIX
     {
         .name       = "getfd",
         .args_type  = "fdname:s",
@@ -1501,6 +1502,7 @@ SRST
   mechanism on unix sockets, it is stored using the name *fdname* for
   later use by other monitor commands.
 ERST
+#endif
 
     {
         .name       = "closefd",
-- 
2.39.2
