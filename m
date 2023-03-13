Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172583ejb;
        Mon, 13 Mar 2023 04:48:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set9vKeIKkjb13QYeIBAN9OkKM2x2RCjx7kcfML/W/HQQDH+TJuk/qjEZKOBzCLWmFPqsM/Q/
X-Received: by 2002:a05:622a:178b:b0:3bf:daae:7f34 with SMTP id s11-20020a05622a178b00b003bfdaae7f34mr28634911qtk.41.1678708111726;
        Mon, 13 Mar 2023 04:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708111; cv=none;
        d=google.com; s=arc-20160816;
        b=e9EyylAsKK6SzBZ7Nd4fgrOLBQRI6r2J22Tq9FhPrvsTIxfIr0+BMKUCHb0UebIADV
         DMEJ2JeCaWKKeLAY/jxJSeFq7smsDhtAuqH/pzIG8Gx8OHtp9/1F20BPrYJWQgWwmzRU
         wNSTKyNrmimGU3gchl82RZZxvlh2msVHmPRosyw5lmamFoG+KVKK5OatY6w1NPbKoM0r
         NKsEWgNe7Z25yOCdmqxcChsJP2nmRhPa7DglvKFJ98QSywqlFwWdieZ2rBEbf6/gPqIF
         Q8uvRujuvNW5E1/R/C04pVd0Qjhqg4Jkeg4ET6pC7csRjdV8FZT8zclejP694KMHS6z+
         7tcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QVXYek2aD1GDbLaBzwM+PhSho8Hk9PdY3riLVXeSemU=;
        b=dkhevrJk5mW276VBgU2qB+glPu0vOdLU4GD7+HWh+bejUSWA5XMCBLQkVH5UWLbEG3
         +kyg6QHooMV0KJpxdCqwFVsyWmV/DVf7Fwbup6WD6d9qQC1IOjB0QzfjpbqRX0DKYM4g
         QvijxbJpTYzEyVx4j3rDxq5LN/WbPUGi8HpKcmnSWo75SAD+749qECZDePS9yiBQ+Ss5
         3M62vre7+ZKQhYBdaB908a0KELZXo4vLcjJmkPIsb14qXzl3E3rWjvtpV4fkMt99FWzN
         380Jq4v6YD4r4psJ+i6eIfDlGPfvNF37SF+hbB+8rQvnq58TJ9XmIEWLNC6vMbJClnn0
         w4eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WXpS37n5;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u3-20020a05622a010300b003b81b32738dsi5188258qtw.393.2023.03.13.04.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WXpS37n5;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QVXYek2aD1GDbLaBzwM+PhSho8Hk9PdY3riLVXeSemU=;
	b=WXpS37n5h4YNqaums9l6I89CCuUx79n/YfrcpXak+Sn7lgKUL8+P7dqRxRNoJ75bbidcF0
	JAdtYAGC6VIZQUHUbShvSY/aT6fTioy9gpfmlpbUp+eQd3e5DvrXFpbEt3KBRCxpCQiXof
	kHD/LlLmCfZ6qaMqfscnMQ4BMb+BenY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-hlgN0zGXMp6p_UK9W3nVbQ-1; Mon, 13 Mar 2023 07:48:25 -0400
X-MC-Unique: hlgN0zGXMp6p_UK9W3nVbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D66A811E9C;
	Mon, 13 Mar 2023 11:48:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9761C4042AC8;
	Mon, 13 Mar 2023 11:48:23 +0000 (UTC)
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
Subject: [PULL v2 20/25] qmp: 'add_client' actually expects sockets
Date: Mon, 13 Mar 2023 15:46:43 +0400
Message-Id: <20230313114648.426607-21-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: eG19GHFgPMWj

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Whether it is SPICE, VNC, D-Bus, or the socket chardev, they all
actually expect a socket kind or will fail in different ways at runtime.

Throw an error early if the given 'add_client' fd is not a socket, and
close it to avoid leaks.

This allows to replace the close() call with a more correct & portable
closesocket() version.

(this will allow importing sockets on Windows with a specialized command
in the following patch, while keeping the remaining monitor associated
sockets/add_client code & usage untouched)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230306122751.2355515-6-marcandre.lureau@redhat.com>
---
 qapi/misc.json     | 3 +++
 monitor/qmp-cmds.c | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/qapi/misc.json b/qapi/misc.json
index 27ef5a2b20..f0217cfba0 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -14,6 +14,9 @@
 # Allow client connections for VNC, Spice and socket based
 # character devices to be passed in to QEMU via SCM_RIGHTS.
 #
+# If the FD associated with @fdname is not a socket, the command will fail and
+# the FD will be closed.
+#
 # @protocol: protocol name. Valid names are "vnc", "spice", "@dbus-display" or
 #            the name of a character device (eg. from -chardev id=XXXX)
 #
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 859012aef4..b0f948d337 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -14,6 +14,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/sockets.h"
 #include "monitor-internal.h"
 #include "monitor/qdev.h"
 #include "monitor/qmp-helpers.h"
@@ -139,6 +140,12 @@ void qmp_add_client(const char *protocol, const char *fdname,
         return;
     }
 
+    if (!fd_is_socket(fd)) {
+        error_setg(errp, "parameter @fdname must name a socket");
+        close(fd);
+        return;
+    }
+
     for (i = 0; i < ARRAY_SIZE(protocol_table); i++) {
         if (!strcmp(protocol, protocol_table[i].name)) {
             if (!protocol_table[i].add_client(fd, has_skipauth, skipauth,
-- 
2.39.2
