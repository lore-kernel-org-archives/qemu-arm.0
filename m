Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3459422ejb;
        Mon, 19 Dec 2022 05:02:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7dWj+8UpyG2O0XujTadXKd4CCV8jhiqjU/xKnOCEe8KvmmRIUcjqNqpgErhqO2INm82Doz
X-Received: by 2002:aca:2b03:0:b0:35e:d1f9:d6e8 with SMTP id i3-20020aca2b03000000b0035ed1f9d6e8mr7272442oik.13.1671454944583;
        Mon, 19 Dec 2022 05:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671454944; cv=none;
        d=google.com; s=arc-20160816;
        b=LC0rXhb7fO/kME14qMF/cZXfW+CGBJkTKZKP/v/lJ8P9V+7HpdsqkmutDN/QURVOUQ
         50+ub1+R773BogoxiwgRIZZMLXFCPHfBCZPS4GmkTyj+WQb5QNyjQAYdDsQ0iXyPZGTZ
         5JnvjPWUYV+qUVIrITgeaW2Nxa9lnydwPtrRpLEBJjP8hVh3Djiv/u2ZN28XqCRRDLEc
         fPw98DRp9GjlA9YBNgUOIWO9pQnUApnhezxjx9M7MTSCLqPV/i8jOIjpx/mrDkAvJlSt
         oCiREBPWd+mMXctsGTchVtkXS+O3+UVD0sz5k0YpsJlhPGxyD5D+mN0akPe40wSBfIKw
         obrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wzWaSBpVzZ+UszDBN2auCYULSVVrv+uDnPPKe4kNt7I=;
        b=oQ/8kLzxYB2t7NLTuJvvxF8FAv4Z8x49/F2YXH0rYAnG3AdPKppXwY40Ir4YHpgd1N
         2tN1ati0JMZc+APlLAeBh0OUgO6T4s7vluxsn9BqBk0mxiG2pPLb4Be5shhKNQgMWsjz
         zgT8OhseymNX50+XDmO64/dVOI9nWIzYcTT69eNLE6LrGo7cEp+eoqYSzBSdgq7XD9xj
         vSns7U9rPhsM9cfk1VPF1NCTuce64tLx02E0YljtL6qHxdKiMaKsQWBMer+dkjDUavLa
         5j7HDwnbyilSA5XaH7VcCmp+o6vQ4cU+kX5OXY2+00TUQBJ3CAdM2hzN0OJHffvKb35d
         PJLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LF3xbbJ/";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id eo8-20020ad45948000000b004c5da004515si3924271qvb.119.2022.12.19.05.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 05:02:24 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LF3xbbJ/";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzWaSBpVzZ+UszDBN2auCYULSVVrv+uDnPPKe4kNt7I=;
	b=LF3xbbJ/SkQ7bH01PgPdnHP9M+kcB68fjgvj+y+6Ot2oKczoGGybNN2paO+uDRZPr60Arr
	GJ1ACsuOpm51af8IR86aZ1SDdBeiOq2VadV2WYc12xuX1a6FapaSZsD4J7v8rbsdo0r/c9
	RN+fJVzLAg2LYBiLkYahp5z5cxWRzKo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-mFdMVFyuMJy-tJT1BG9NhQ-1; Mon, 19 Dec 2022 08:02:16 -0500
X-MC-Unique: mFdMVFyuMJy-tJT1BG9NhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10B1F887434;
	Mon, 19 Dec 2022 13:02:09 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6669D14171B6;
	Mon, 19 Dec 2022 13:02:08 +0000 (UTC)
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
Subject: [PATCH 3/6] tools/virtiofsd: add G_GNUC_PRINTF for logging functions
Date: Mon, 19 Dec 2022 08:02:02 -0500
Message-Id: <20221219130205.687815-4-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: WY/L+mkpHZNg

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tools/virtiofsd/fuse_log.c       | 1 +
 tools/virtiofsd/fuse_log.h       | 6 ++++--
 tools/virtiofsd/passthrough_ll.c | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_log.c b/tools/virtiofsd/fuse_log.c
index 745d88cd2a..2de3f48ee7 100644
--- a/tools/virtiofsd/fuse_log.c
+++ b/tools/virtiofsd/fuse_log.c
@@ -12,6 +12,7 @@
 #include "fuse_log.h"
 
 
+G_GNUC_PRINTF(2, 0)
 static void default_log_func(__attribute__((unused)) enum fuse_log_level level,
                              const char *fmt, va_list ap)
 {
diff --git a/tools/virtiofsd/fuse_log.h b/tools/virtiofsd/fuse_log.h
index 8d7091bd4d..e5c2967ab9 100644
--- a/tools/virtiofsd/fuse_log.h
+++ b/tools/virtiofsd/fuse_log.h
@@ -45,7 +45,8 @@ enum fuse_log_level {
  * @param ap format string arguments
  */
 typedef void (*fuse_log_func_t)(enum fuse_log_level level, const char *fmt,
-                                va_list ap);
+                                va_list ap)
+    G_GNUC_PRINTF(2, 0);
 
 /**
  * Install a custom log handler function.
@@ -68,6 +69,7 @@ void fuse_set_log_func(fuse_log_func_t func);
  * @param level severity level (FUSE_LOG_ERR, FUSE_LOG_DEBUG, etc)
  * @param fmt sprintf-style format string including newline
  */
-void fuse_log(enum fuse_log_level level, const char *fmt, ...);
+void fuse_log(enum fuse_log_level level, const char *fmt, ...)
+    G_GNUC_PRINTF(2, 3);
 
 #endif /* FUSE_LOG_H_ */
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 20f0f41f99..40ea2ed27f 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -4182,6 +4182,7 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
     }
 }
 
+G_GNUC_PRINTF(2, 0)
 static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
 {
     g_autofree char *localfmt = NULL;
-- 
2.38.1
