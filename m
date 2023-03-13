Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp170163ejb;
        Mon, 13 Mar 2023 04:45:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set/t8Vx6gzDuXmRYL+HA8WAv15YGZNTxmLVV74Q+ojjAU5GWA3JCl6ACEP5l4vDRUIyXUWBr
X-Received: by 2002:ac8:5b15:0:b0:3b6:33c6:c5ac with SMTP id m21-20020ac85b15000000b003b633c6c5acmr57533735qtw.4.1678707916907;
        Mon, 13 Mar 2023 04:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707916; cv=none;
        d=google.com; s=arc-20160816;
        b=xzlWErtgj39sZiTTeEI2HrhW/pqnwuzt3ULjX/RDsV5n1MGbPmn5gwPYKnH3j1j8R7
         s6dhbL215GLDSMqz2X283Z3FIczAn0LihII52+QdA5rZoG5h4ssaxtIx/iTKOIw75APX
         bnRBHpSrIEEGb4uP1j9V5XVz5nHMwUgf7SFit/cZPDB7+7K5dObGcxZL3ASIm7e5lMf7
         WApPUkwWw6ESPquMxO6U6IyvUa3pYvXvxwguGuVR+kn5g4OV36Bfj7nSYdXKaZJTUBKn
         0WPW/7SSVGO1Dp0Ly5u/ZN/4jSt0CHKzBPWZpDLW+IwbnovQhiG2G/NifP7j4NySPHqM
         8IdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QVXYek2aD1GDbLaBzwM+PhSho8Hk9PdY3riLVXeSemU=;
        b=IRR6P2CWliH3ioKP1avrN+M+DFSIYU2IOumjn/JaCvbS3EsxN9KmbltWK4kmved+WK
         UEUse23xoE0LLYOmd3M3sNXSlbVTW/xk4Vec9RKWJkWoFrgkGdolCAs3ipBtF47XIooj
         DA7pm1eR73irnZK6sFmSFp45FWVkvInwQscXQF+eP0K1zrvZmD4TPydYxzb/vVJTHpQR
         RHNgn6NaSSWeOeZ4Y85ox44r7mMBVFAqG/DCN1vDNmMpddeawobQtfJcs91NqyavSaj1
         IbA5C3IW0Lkmzmzxe6F+7QyZS+kc/XtlRK9TdHKSHR9uvghm2N9o/IxtXV6l6GxVwGHQ
         p/vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xw9+Gzpt;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id j7-20020ac85c47000000b003b24d335c00si5041108qtj.617.2023.03.13.04.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xw9+Gzpt;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QVXYek2aD1GDbLaBzwM+PhSho8Hk9PdY3riLVXeSemU=;
	b=Xw9+GzptmK5BFaCuILBoxlqtlWCm25x/7dpDbs9yhFlTW9GakFTpN40i5yO47Riy3b4iU6
	ypYZY4cwN59TmpE+Xrm437Gh1WykBgnUwRni2hmKCJ3vnBfdkoRmVKW2gpwpVGsHr+HglT
	BEtq3jOMWaxLrDI4fl7/DmpfbwpkG1o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-7Gq2Ye3kNYKwlZBnIjA-3g-1; Mon, 13 Mar 2023 07:45:13 -0400
X-MC-Unique: 7Gq2Ye3kNYKwlZBnIjA-3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9C801C04328;
	Mon, 13 Mar 2023 11:45:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA0264042AC2;
	Mon, 13 Mar 2023 11:45:11 +0000 (UTC)
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
Subject: [PULL 20/25] qmp: 'add_client' actually expects sockets
Date: Mon, 13 Mar 2023 15:43:30 +0400
Message-Id: <20230313114335.424093-21-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: NiI9ZRQGwYxe

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
