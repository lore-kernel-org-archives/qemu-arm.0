Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172445ejb;
        Mon, 13 Mar 2023 04:48:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set9qbMwZfEwpYnMaLed9+pDJWJRYXGi3ti4eojVyvcdGHXGZawUqK8xqy0odZlQekIhZDFAB
X-Received: by 2002:ac8:5a13:0:b0:3b8:6b6b:28c2 with SMTP id n19-20020ac85a13000000b003b86b6b28c2mr57348517qta.68.1678708099754;
        Mon, 13 Mar 2023 04:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708099; cv=none;
        d=google.com; s=arc-20160816;
        b=RzbWSI/bn2f4rDs4BEu5VVRP4Z430uihkZG/Ju9+7t8h44CTj7fQRye+P5rK+kiUg/
         l4rjTEmCCnnAsqL5nzbMADSZ6dOw1BA7CidsJg3VWRnL4bEcfnKknbaPMqZfgZw9IWrp
         SUfMQXPueKLjnRasCznt3/qELSARxEJSzJbEIQYnOYYOmFWnffsuLIEN6srtSpl43+L6
         sjL9ebS052iUaSLo5OTpf3a7gkV+eoAmSBqjXyZcQTxx2nGzDtxFi7bQ+Mo6zfc17ASs
         /lzWuvZKBIknLZVeE9lE1KrdKjSSozEjv1Cj5Q/MOspUc1+ejmDvW48mHLyFHjx5Zrvh
         JR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QZYS21+hNTFE8tMKucJRzMuigz/ZedT2zkBrAltxQo4=;
        b=PxsTuyxdbWZtuaIjM1bscwTsKy5vDb797gJjb53tAixunDEPF5i0gBI9f3TLzbi6k4
         3f6l+UBLcrWZXA1Ni8wWt2ZIHekuLz294Fro2DMcA8UCI5r7mN7cA/iEjthhL12emnzS
         xGadhTA78aavCh9GT2G3+JU/e07pQxLvO2nmUHGzU0ev9oO/Vn0sornFLfhlEdFjH2xG
         7X/vhFwczUUekWJ8zCSHvBZqh7iFsQ2XHnaWWYWx7OP5fWMCA6oLElB1PB7QF5GAJmtN
         8e1UcKhuimI4YsTTHRHP04EtCm5ISomNzkO8SaJs9+NsHK3LMuuRezFMLkvmX8QKi++Q
         kwZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UZHfcM8L;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id f3-20020a05622a104300b003a51b82f290si4997661qte.495.2023.03.13.04.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:48:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UZHfcM8L;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZYS21+hNTFE8tMKucJRzMuigz/ZedT2zkBrAltxQo4=;
	b=UZHfcM8LhTfmIjPqDtTAF56zBXsrvUA0IU6FtkURgXfGZKXCQzC2K1g9KVWvPZrJFLsP0A
	xmm5+WVb7wQP8UH4YFPzLeLAnwkRHlcUoe6bjGTVRoleBJe3YVPaV4Fhlaha5mM1YZcw6k
	vvYZPq8R9j3VV7R8Uqu2gL7MSHMUboM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-iQ8EICMSMnyuii9YwUg6jg-1; Mon, 13 Mar 2023 07:48:16 -0400
X-MC-Unique: iQ8EICMSMnyuii9YwUg6jg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E5823828888;
	Mon, 13 Mar 2023 11:48:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5CCE4042AC0;
	Mon, 13 Mar 2023 11:48:14 +0000 (UTC)
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
Subject: [PULL v2 18/25] tests/docker: fix a win32 error due to portability
Date: Mon, 13 Mar 2023 15:46:41 +0400
Message-Id: <20230313114648.426607-19-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: 2W78Wx7YgiOP

From: Marc-André Lureau <marcandre.lureau@redhat.com>

docker.py is run during configure, and produces an error: No module
named 'pwd'.

Use a more portable and recommended alternative to lookup the user
"login name".

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230306122751.2355515-4-marcandre.lureau@redhat.com>
---
 tests/docker/docker.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 3a1ed7cb18..688ef62989 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -23,10 +23,10 @@
 import tempfile
 import re
 import signal
+import getpass
 from tarfile import TarFile, TarInfo
 from io import StringIO, BytesIO
 from shutil import copy, rmtree
-from pwd import getpwuid
 from datetime import datetime, timedelta
 
 
@@ -316,7 +316,7 @@ def build_image(self, tag, docker_dir, dockerfile,
 
         if user:
             uid = os.getuid()
-            uname = getpwuid(uid).pw_name
+            uname = getpass.getuser()
             tmp_df.write("\n")
             tmp_df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
                          (uname, uid, uname))
@@ -570,7 +570,7 @@ def run(self, args, argv):
 
         if args.user:
             uid = os.getuid()
-            uname = getpwuid(uid).pw_name
+            uname = getpass.getuser()
             df.write("\n")
             df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
                      (uname, uid, uname))
-- 
2.39.2
