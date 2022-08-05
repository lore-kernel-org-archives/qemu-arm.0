Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1107079lfg;
        Fri, 5 Aug 2022 08:21:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR60q54GpicuagULV5REsLqpjYwfp/a/S32DwcVbTgz1ntMHxVUm6CVclOCKuJYh2xSJyzgV
X-Received: by 2002:ac8:7f0e:0:b0:31f:402f:1b89 with SMTP id f14-20020ac87f0e000000b0031f402f1b89mr6391540qtk.590.1659712864252;
        Fri, 05 Aug 2022 08:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659712864; cv=none;
        d=google.com; s=arc-20160816;
        b=EpXPaUN1dE/NPtIVurju+EaA3mduInw+xZpVC4yn4sR/CQPfZ5LNsRc8HY4KhoijO3
         GmcdcsjQqpiwiv5NSQomGCqRpDIGIqNi3xrQT/EZ+zUOBPy4ubHy6x0sq7Qul+oaNe+x
         mbIoTkIMG/9O7zPRY1NXLl13TKFXdcAr+3gzt477LvySNvMwC4kUM+xtWK0MY+1/HrJ+
         uLmDN5aFEEH1uWe4xe+Asp07su3SCmVowPxPapkWO7nDm0Qq3E/YcRuD4gveLDbW8G7U
         puEgvncCafqFPaB+Beh3JXTh9ts6RlKaD8f7MjVBN9RKTEbLIb6cy7rQ6Hq4OJqiQGKD
         JBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UOT/8lZvPj0pecATGxp5bq0muJCXkI4mu9fSpzeFelo=;
        b=Kze2uD7Q/s0EJHRI+kgJCPnNzN7dMKRWaF45GYh9TKa6TVXc3JOfKxO2GcreaDaCAK
         7ig75bCDXltOgtfGeM5lmvFgMiqQy4Lzzo6WH3DwpV6jbI9a42yTiEgAIuL9hxt21ZTw
         HD6TxkhO2qlJ5rxEIpSxuqp4ZDOZQYBi3T2otlW4hmpzYaQ0hq6sEzefk6u0mnFq7xGr
         NZcTawfwOiCemcV8pLN5xo2X85pCC5btt618/JksrlDgMV6rL+24CZzYt6HnsXkqib0J
         lUT2Y4N9WtTDRJQI7s49oqFxR6Gr+71BcqtTKMIHedh/DspM/n+tYXitvSYMPZDZepyl
         cIfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JfpzXqg1;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id cb22-20020a05622a1f9600b0031ee0950fb6si2610652qtb.734.2022.08.05.08.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Aug 2022 08:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JfpzXqg1;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659712863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOT/8lZvPj0pecATGxp5bq0muJCXkI4mu9fSpzeFelo=;
	b=JfpzXqg1EJa1/Rm3uo8lGPdNoDpV2VcMRQnXkqO3fQTaQGvZDx2aqfjm2jhFLfSa1PGXAb
	Catbl0rIYyb3vuTMQoSv9uaTKBF21Fvm/27OUw8SGy0hzvNcdeBCXzNDD0DMUjlf8QK272
	oGvJsGOAbt9bW8Apg2X7llvKIHa0Vm4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-UAm5Ccq5O1CItd2ymkbADQ-1; Fri, 05 Aug 2022 11:20:44 -0400
X-MC-Unique: UAm5Ccq5O1CItd2ymkbADQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F657801585;
	Fri,  5 Aug 2022 15:20:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B25732026D4C;
	Fri,  5 Aug 2022 15:20:40 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Bin Meng <bin.meng@windriver.com>
Subject: [PULL 6/6] util/qemu-sockets: Replace the call to close a socket with closesocket()
Date: Fri,  5 Aug 2022 16:20:14 +0100
Message-Id: <20220805152014.135768-7-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-TUID: GiLNs0QRezpB

From: Bin Meng <bin.meng@windriver.com>

close() is a *nix function. It works on any file descriptor, and
sockets in *nix are an example of a file descriptor.

closesocket() is a Windows-specific function, which works only
specifically with sockets. Sockets on Windows do not use *nix-style
file descriptors, and socket() returns a handle to a kernel object
instead, so it must be closed with closesocket().

In QEMU there is already a logic to handle such platform difference
in os-posix.h and os-win32.h, that:

  * closesocket maps to close on POSIX
  * closesocket maps to a wrapper that calls the real closesocket()
    on Windows

Replace the call to close a socket with closesocket() instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/qemu-sockets.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9..0e2298278f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -487,7 +487,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
 
         if (ret < 0) {
             error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
-            close(sock);
+            closesocket(sock);
             return -1;
         }
     }
@@ -1050,7 +1050,7 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     return sock;
 
  err:
-    close(sock);
+    closesocket(sock);
     return -1;
 }
 
-- 
2.37.1
