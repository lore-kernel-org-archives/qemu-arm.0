Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3459316ejb;
        Mon, 19 Dec 2022 05:02:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6YkMtahf/EOUrkwgsYbMypSt0wxfU0lG6Hq8qEsXrHRS68IFRwNa9sDwZoEDzx+J2Szev0
X-Received: by 2002:a05:6214:590d:b0:4e2:e61e:4862 with SMTP id lp13-20020a056214590d00b004e2e61e4862mr39079349qvb.4.1671454940326;
        Mon, 19 Dec 2022 05:02:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671454940; cv=none;
        d=google.com; s=arc-20160816;
        b=YGoLmTgZ3E02T4uoWZEyA2ms7+mjbfTZ8mqcWjMvfPE1Kp5eYdQ/FHF+XJAG5BZ1jH
         Mu56vxA5h72+cHgfcgj+AxnAka99cLXylW2Z5xqOOPTzoViGdP1gWtrUyxprgyqMU3l7
         upwbK0ZnTbkU7KAta7k4V76NLnzpMOiYh8/4JdYnfDV4qwkSdETFgMnz1MfYhBeNoZML
         lGIltAbSGNDj2zchEQYgOZwIVZS6NCmssbP/yY5isAJHjbNt8Py0kUoTfluarRnBVuXF
         oWLwWqL3TtnR92pvfPJ40zyU7MSGvD6cEval8bWc9yoiJBF/NvwwzHNgx3IdSG5pb8CJ
         TZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4JFb6QDUDH0Iblrn1PZyR6v+EegDDw+5LlL9IfN5m+I=;
        b=j+sQLK3KoQXr+nz8o5B8qUXhYbT2FTBJkLKUUwYLIFmuZJELNNwFVj4uoYn4TeRSC8
         ctCQgW+w/suaQ1vA3bj+nxqs6kUO4da7QDtEm4p3YJYqG1CshUMBo62F+rQhmemUFAUA
         iYzKAd+tjrso9FKV6EhmTU4dyndHf8J9zMSWG/+bk3sABZ0VKTnZTSzV/KazZxKLIxNP
         3Nl9bqNZbtF6uEZBNt6S07XwCosO3JJ//XEHlAeHJqgL4cOEBHbYR1WiQPW098wQjUn7
         RbWeFZIAPgygqm93klP25MhNrJwJRHvvmtyl+BiIxOqMJjSTe0NEie3Nr29JrYzTygLv
         4OTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fP8LdICt;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s3-20020a0562140ca300b004c73c10d022si4210095qvs.567.2022.12.19.05.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 05:02:20 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fP8LdICt;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4JFb6QDUDH0Iblrn1PZyR6v+EegDDw+5LlL9IfN5m+I=;
	b=fP8LdICt4Scg1s1mQ/M2j6G1YVpz7Luwqwad0gyPR2UxRaz2ow8Pqd8m9QHrnaDY/z9Nj9
	QU+n8tkQG3IfqRpRYBsdCiAwQyCGlkkzbwFDuM6ql64BR12ThcUilfs52cKA0as+jpRNqH
	DQ46ocMNHkdLe00ClOcTkDdOZb8fVzs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-EAFyuzouPl60pgDLpips4g-1; Mon, 19 Dec 2022 08:02:16 -0500
X-MC-Unique: EAFyuzouPl60pgDLpips4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B72588742F;
	Mon, 19 Dec 2022 13:02:08 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2A8C14171C5;
	Mon, 19 Dec 2022 13:02:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/6] hw/xen: use G_GNUC_PRINTF/SCANF for various functions
Date: Mon, 19 Dec 2022 08:02:01 -0500
Message-Id: <20221219130205.687815-3-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: hGvvEJksxex9

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/xen/xen-bus.c                | 1 +
 hw/xen/xen_pvdev.c              | 1 +
 include/hw/xen/xen-bus-helper.h | 6 ++++--
 include/hw/xen/xen-bus.h        | 3 ++-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 645a29a5a0..df3f6b9ae0 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -561,6 +561,7 @@ void xen_device_backend_printf(XenDevice *xendev, const char *key,
     }
 }
 
+G_GNUC_SCANF(3, 4)
 static int xen_device_backend_scanf(XenDevice *xendev, const char *key,
                                     const char *fmt, ...)
 {
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 037152f063..1a5177b354 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -196,6 +196,7 @@ const char *xenbus_strstate(enum xenbus_state state)
  *  2 == noisy debug messages (logfile only).
  *  3 == will flood your log (logfile only).
  */
+G_GNUC_PRINTF(3, 0)
 static void xen_pv_output_msg(struct XenLegacyDevice *xendev,
                               FILE *f, const char *fmt, va_list args)
 {
diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
index 629a904d1a..8782f30550 100644
--- a/include/hw/xen/xen-bus-helper.h
+++ b/include/hw/xen/xen-bus-helper.h
@@ -31,10 +31,12 @@ void xs_node_printf(struct xs_handle *xsh,  xs_transaction_t tid,
 /* Read from node/key unless node is empty, in which case read from key */
 int xs_node_vscanf(struct xs_handle *xsh,  xs_transaction_t tid,
                    const char *node, const char *key, Error **errp,
-                   const char *fmt, va_list ap);
+                   const char *fmt, va_list ap)
+    G_GNUC_SCANF(6, 0);
 int xs_node_scanf(struct xs_handle *xsh,  xs_transaction_t tid,
                   const char *node, const char *key, Error **errp,
-                  const char *fmt, ...);
+                  const char *fmt, ...)
+    G_GNUC_SCANF(6, 7);
 
 /* Watch node/key unless node is empty, in which case watch key */
 void xs_node_watch(struct xs_handle *xsh, const char *node, const char *key,
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 713e763348..4d966a2dbb 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -94,7 +94,8 @@ void xen_device_frontend_printf(XenDevice *xendev, const char *key,
     G_GNUC_PRINTF(3, 4);
 
 int xen_device_frontend_scanf(XenDevice *xendev, const char *key,
-                              const char *fmt, ...);
+                              const char *fmt, ...)
+    G_GNUC_SCANF(3, 4);
 
 void xen_device_set_max_grant_refs(XenDevice *xendev, unsigned int nr_refs,
                                    Error **errp);
-- 
2.38.1
