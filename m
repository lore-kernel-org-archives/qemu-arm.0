Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1773014ejc;
        Mon, 30 Oct 2023 03:48:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrTzY3WDMtRxacuuChnz+l1uqD6se3ALDrp9u0NpGfRPvaNEfp5c36J3x+eArVqx9aZ2cM
X-Received: by 2002:a05:622a:1752:b0:41e:3259:529a with SMTP id l18-20020a05622a175200b0041e3259529amr13426055qtk.9.1698662927828;
        Mon, 30 Oct 2023 03:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698662927; cv=none;
        d=google.com; s=arc-20160816;
        b=K55Wn6cKHDeBGEDtowYaoSONGDkacv4Nvh7EwOvmmyBu88wZali9izyVhtndJPzFE8
         NbQgZc95ic6bkGc3fo/lVQfhgDIcWRgvddD8WMW3UX6OcQxCiY4B6HPj6hTG1/yLyovH
         3RL8Cvoa9kA8SfUe2WrbnPQ3/Dujd9x9LixpY8PLzbwyx8//cMYTbkT4VXKlhOvNqIo0
         sEGjh4KQhCh4EYnVLeCzFjznYJPKrdqZR7PPU73dmrS1xl6+GtlW2fpc7C1Lcb69kuno
         D1Wa8qZXDweQ9Xsv7XnMAsM4Y1039/uDRQYOhLfgdcX7goEyc00RXzKwn6Od82xJn9Qj
         kNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jn0M5HddPTW3wCc5nq/h0iBnVCjIfSYvQaej6oaWHQo=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=nhwmSVY2EcvkocVUlZtk+YzDgc8zpkytcIt6zxX9774qwb3pjElJZIEXDyRMvKQk0r
         nYb4sYJbs6qdclLsdouumKxTNAZgjdF5TAQB/hLkjFA8AhdJvBffQyrR1613vN25iR8l
         FLrl3YPpXzODBTo1o23PcYzem5B7qvKBZUjFtSLy9l1Om3+T3bY6vD7jxbRAzCYA6lWc
         BVbaCBOg+1bDz+ptJSdgmsj2FE9vUdMAjIPUdD+evjsqBTaJAZUnnXNt0YYKPQFuqNHL
         dPoy0wqpG6Vo38fdfbcESoLkQ/Fy6Ed3OQx4QpHrZUUg3P+eO+G4aYmXr8JtbkP6LbQH
         siLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a0MoLoL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020ac85f48000000b0041810764755si5322008qta.797.2023.10.30.03.48.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:48:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a0MoLoL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxPoz-0001dV-Cm; Mon, 30 Oct 2023 06:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPou-0001bo-3f
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:48:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPol-0002Vn-Fs
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jn0M5HddPTW3wCc5nq/h0iBnVCjIfSYvQaej6oaWHQo=;
 b=a0MoLoL27aqP9cD8RLkx7/uiEPm9diHI6rqpgV/np21VzowBobiBUL0Emj9r6/cqIkiRtP
 xs88bX18SMQp41suJhSgIFhQS63Em7KU/o2Tm+SyIE2exvB1qWofc8pVVvGP90wfBu10rW
 uLe76ADrBvBT79CXNbvbxOazNvCFAn8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-fEBBtcMfP4C2DBiiyVXUuA-1; Mon, 30 Oct 2023 06:48:15 -0400
X-MC-Unique: fEBBtcMfP4C2DBiiyVXUuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EA721019C85;
 Mon, 30 Oct 2023 10:48:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBD512026D4C;
 Mon, 30 Oct 2023 10:48:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v7 03/23] ui: compile out some qemu-pixman functions when
 !PIXMAN
Date: Mon, 30 Oct 2023 14:47:34 +0400
Message-ID: <20231030104755.124188-4-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P6RPxlF6zGNE

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Those functions require the PIXMAN library.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/ui/qemu-pixman.h | 7 +++++--
 ui/qemu-pixman.c         | 6 ++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index 4bfa8fae0c..c140cd84b6 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -72,17 +72,17 @@ pixman_format_code_t qemu_default_pixman_format(int bpp, bool native_endian);
 pixman_format_code_t qemu_drm_format_to_pixman(uint32_t drm_format);
 uint32_t qemu_pixman_to_drm_format(pixman_format_code_t pixman);
 int qemu_pixman_get_type(int rshift, int gshift, int bshift);
-pixman_format_code_t qemu_pixman_get_format(PixelFormat *pf);
 bool qemu_pixman_check_format(DisplayChangeListener *dcl,
                               pixman_format_code_t format);
 
+#ifdef CONFIG_PIXMAN
+pixman_format_code_t qemu_pixman_get_format(PixelFormat *pf);
 pixman_image_t *qemu_pixman_linebuf_create(pixman_format_code_t format,
                                            int width);
 void qemu_pixman_linebuf_fill(pixman_image_t *linebuf, pixman_image_t *fb,
                               int width, int x, int y);
 pixman_image_t *qemu_pixman_mirror_create(pixman_format_code_t format,
                                           pixman_image_t *image);
-void qemu_pixman_image_unref(pixman_image_t *image);
 
 pixman_image_t *qemu_pixman_glyph_from_vgafont(int height, const uint8_t *font,
                                                unsigned int ch);
@@ -91,6 +91,9 @@ void qemu_pixman_glyph_render(pixman_image_t *glyph,
                               pixman_color_t *fgcol,
                               pixman_color_t *bgcol,
                               int x, int y, int cw, int ch);
+#endif
+
+void qemu_pixman_image_unref(pixman_image_t *image);
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(pixman_image_t, qemu_pixman_image_unref)
 
diff --git a/ui/qemu-pixman.c b/ui/qemu-pixman.c
index b43ec38bf0..5ca55dd199 100644
--- a/ui/qemu-pixman.c
+++ b/ui/qemu-pixman.c
@@ -145,6 +145,7 @@ int qemu_pixman_get_type(int rshift, int gshift, int bshift)
     return type;
 }
 
+#ifdef CONFIG_PIXMAN
 pixman_format_code_t qemu_pixman_get_format(PixelFormat *pf)
 {
     pixman_format_code_t format;
@@ -158,6 +159,7 @@ pixman_format_code_t qemu_pixman_get_format(PixelFormat *pf)
     }
     return format;
 }
+#endif
 
 /*
  * Return true for known-good pixman conversions.
@@ -186,6 +188,7 @@ bool qemu_pixman_check_format(DisplayChangeListener *dcl,
     }
 }
 
+#ifdef CONFIG_PIXMAN
 pixman_image_t *qemu_pixman_linebuf_create(pixman_format_code_t format,
                                            int width)
 {
@@ -211,6 +214,7 @@ pixman_image_t *qemu_pixman_mirror_create(pixman_format_code_t format,
                                     NULL,
                                     pixman_image_get_stride(image));
 }
+#endif
 
 void qemu_pixman_image_unref(pixman_image_t *image)
 {
@@ -220,6 +224,7 @@ void qemu_pixman_image_unref(pixman_image_t *image)
     pixman_image_unref(image);
 }
 
+#ifdef CONFIG_PIXMAN
 pixman_image_t *qemu_pixman_glyph_from_vgafont(int height, const uint8_t *font,
                                                unsigned int ch)
 {
@@ -262,3 +267,4 @@ void qemu_pixman_glyph_render(pixman_image_t *glyph,
     pixman_image_unref(ifg);
     pixman_image_unref(ibg);
 }
+#endif /* CONFIG_PIXMAN */
-- 
2.41.0

