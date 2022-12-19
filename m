Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3459370ejb;
        Mon, 19 Dec 2022 05:02:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Yu2UdPEOz45eJlg7Nz6avwqvum8HMp3a0GNYBDwotK4XhogXugiLNXAI4Ux+iCqByvwz+
X-Received: by 2002:a17:906:7857:b0:7c4:fa23:861f with SMTP id p23-20020a170906785700b007c4fa23861fmr16795544ejm.31.1671454942412;
        Mon, 19 Dec 2022 05:02:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671454942; cv=none;
        d=google.com; s=arc-20160816;
        b=hBFFZz42HVVnxEd3eBaxotVnu1x7oO+rmoHxHuhmx50vUm7bHkLOn+Z2HiL0kcsJls
         TX3+apRmdkGOQqBGsmZ9UrHOn7hpQDwy/v3dQGvVYgo0WNl7HbxlMYFEy/CyFQNKuN25
         WeSosDMYtqIumxYtPfpv4p6yllDIQdgm1ZYOC2r5ZV4V4xBlvnW5nagKqI9GUPvgEuQx
         sQuzox//zf/D0riroyLhLxNYP54JhxGy/lYy/lgX1A/j8HyOvaiUZhnxEeM4xrSLtpa2
         VY3Oj+988fCJ8A05DQLHyQ3RKSatZDxWwu8g5aQo0PdAzIut41xAfe6vsj+N7K7si6q9
         OyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=y/JPz/RYrixYpdTBpAkJB1EIwOzHLyPTKspd8A5hdhQ=;
        b=ljWIPiIOi708pCPxmqdSQ0EQ9swA7bojyPs0D4h10l1229u1hcyM7IPb9bzp/CG/14
         srV4XooJMvpsGHRliu5/uCsellKTCXwsoqhXA3oNSbbQRouYVocsjVFefjhiOYJl+NSE
         cLJxin2LAlWeXIxTuwN2c97huiNBj9n+OLoYxMKBlVGt2NqZPTW3dI6H9FS7EBJMbR9h
         Wn1jqVLnnuyHCf/1CGK87JvmIrGxGIcFYSQ07RBnBytW2QOYWMrst4Sy+bxWCNOjadw5
         Tg95no2Ci5mhlr+SZeInYURV52LY6TkqrtrrBK0r0JrvFcuMOZbO1iEth/9Zo3GutB4j
         G8Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OIGzZZRU;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id vj16-20020a170907d49000b007c12a22dc43si7923453ejc.662.2022.12.19.05.02.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 05:02:22 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OIGzZZRU;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/JPz/RYrixYpdTBpAkJB1EIwOzHLyPTKspd8A5hdhQ=;
	b=OIGzZZRUMOGxHlpk2/CfBdTi7o4wG8gHbniDrDEHu0o6y2YXcs4RJdH7Oih24haPN6mzRL
	qR7SbXrJjMOoLrmT8uKMEW8qLeLpNZtaGyblT+JDZ6v7rP9zq2UCg+kFk5Q5LXgWv08Gpr
	vVT9yLdUM3fExYbBbTu22+UhxAxg4/s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-rbAz9N-rM3GgWBs_tCRJuw-1; Mon, 19 Dec 2022 08:02:17 -0500
X-MC-Unique: rbAz9N-rM3GgWBs_tCRJuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B973D88743B;
	Mon, 19 Dec 2022 13:02:09 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C57F14171BA;
	Mon, 19 Dec 2022 13:02:09 +0000 (UTC)
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
Subject: [PATCH 4/6] util/error: add G_GNUC_PRINTF for various functions
Date: Mon, 19 Dec 2022 08:02:03 -0500
Message-Id: <20221219130205.687815-5-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: IxdK16W1Hes+

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/error-report.c | 1 +
 util/error.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/util/error-report.c b/util/error-report.c
index 5edb2e6040..6e44a55732 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -193,6 +193,7 @@ real_time_iso8601(void)
  * a single phrase, with no newline or trailing punctuation.
  * Prepend the current location and append a newline.
  */
+G_GNUC_PRINTF(2, 0)
 static void vreport(report_type type, const char *fmt, va_list ap)
 {
     gchar *timestr;
diff --git a/util/error.c b/util/error.c
index b6c89d1412..1e7af665b8 100644
--- a/util/error.c
+++ b/util/error.c
@@ -45,6 +45,7 @@ static void error_handle_fatal(Error **errp, Error *err)
     }
 }
 
+G_GNUC_PRINTF(6, 0)
 static void error_setv(Error **errp,
                        const char *src, int line, const char *func,
                        ErrorClass err_class, const char *fmt, va_list ap,
-- 
2.38.1
