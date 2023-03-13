Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172840ejb;
        Mon, 13 Mar 2023 04:48:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Icl1+zkutHFTAtQ1PShWTVrLkzufnwwIUqL5lAlemmdAsjJSOKifLqxVOlzOmRT6rs3+O
X-Received: by 2002:ac8:4e90:0:b0:3b6:2e12:4d25 with SMTP id 16-20020ac84e90000000b003b62e124d25mr20086855qtp.31.1678708130641;
        Mon, 13 Mar 2023 04:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708130; cv=none;
        d=google.com; s=arc-20160816;
        b=UkSb39Nj+xEU+pr9YiKGYAJ9WfLX6jEeZwAddcb2P5DSUFDKxyPh14Ln4bg823M59Y
         Yjjbfr4+/rO17TBb/w/1+vgfw/J7Vbpj7HBC8ZeN+4WtKAKYKRRPNh/mOSB1SSq6vhYE
         jckH4bbhecVg1GfQFUCGJ6mOqGuSbIIibcLXwicLGbcfcIG6xrnGYeEXk62vJ983TNRr
         FkY/uym3pIEIf5pSnU/EXOBfnwe5Q+VIubt8OPeIHP664eDhoVOUrEb9NXAD7/g5Jh/x
         KwoQwV8oZKe3WMW9mlmd5y6p/WpsKQDAgR+ZbWNy4RI/WILfK5h6A/BoYysUdnad1TgM
         HJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8SMSiKbHRECIjx1vILPEIMZcCmojGbLhRPWW6JR2gVQ=;
        b=dN06yJXtkVr/C3O87Uj1K3SrHbJHY/mrmOy7pjChx75BtJViq0ZIe9n1WLLP24mQHy
         eTQJHBbWhOrckXSxqfDOr+LdhxalNM8kDAF7vuc+EhEpOD38eRQwOGelZRA1XjR0kfsE
         XjjErEB0GI4mYkbQUVfFMcL4PkVieeaEsSBCu0OM+k4ZJ4MQuQWh8ACzINBO6vYo6uas
         bOzRMKs6WJ0sibyMCFY2hD23FHtQu4NjAZNTqBFldMxgCQ1ztD+pk8rGFerEy3CWqCiJ
         GvJCrbXihzKZus1fUr3XGeuDVX20jd7Kr09u4g+lEUz/J6ytUPMEbZOZTCmIyhnD9gL9
         zeYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gUWdC03S;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id f3-20020a05622a104300b003a51b82f290si4998288qte.495.2023.03.13.04.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:48:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gUWdC03S;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8SMSiKbHRECIjx1vILPEIMZcCmojGbLhRPWW6JR2gVQ=;
	b=gUWdC03SEcgSaO+eaZYLGl/gBvhzdJekWP+2msbSi+2Psib8rzPkw3jQfwSgJkipjKjNL4
	88RZhvsXevYtTCtVLbcjZqke31GZFi+YZ1JH+EC9I1HeISA00vwLESSZ8RchxikDxAauUF
	NqeVEA19pmYa+jwQUDl6cNVRH4hOpIw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-Gw97UR-TMO-e43WqiPCO8w-1; Mon, 13 Mar 2023 07:48:48 -0400
X-MC-Unique: Gw97UR-TMO-e43WqiPCO8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B2173828887;
	Mon, 13 Mar 2023 11:48:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 462AE1410F1C;
	Mon, 13 Mar 2023 11:48:45 +0000 (UTC)
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
Subject: [PULL v2 25/25] monitor: restrict command getfd to POSIX hosts
Date: Mon, 13 Mar 2023 15:46:48 +0400
Message-Id: <20230313114648.426607-26-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: EHWMDa0Yhbca

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Currently, the function will simply fail if ancillary fds are not
provided, for ex on unsupported platforms.

This changes the failure from:

    {"error": {"class": "GenericError", "desc": "No file descriptor
    supplied via SCM_RIGHTS"}}

to:

    {"error": {"class": "CommandNotFound", "desc": "The command getfd
    has not been found"}}

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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
