Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp296767ejb;
        Tue, 10 Oct 2023 00:39:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqdDTKK1viZwIucX1eJZAk+O2un3ZO0UGS9Pyx9hl7Iiq5Zi1FcPysE7adBwMqGVICrAjo
X-Received: by 2002:a0c:eed2:0:b0:65d:31e:b810 with SMTP id h18-20020a0ceed2000000b0065d031eb810mr18345955qvs.34.1696923581588;
        Tue, 10 Oct 2023 00:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923581; cv=none;
        d=google.com; s=arc-20160816;
        b=hcbTsrX85ieP2Q0IRWp/jcxAm178O3StF550V+KcllpjtCuW5KBvUxj8K+zi6OgY7b
         5mBpqq/X/NfW87vjoVJ1RNZ2zgrsDlWkISfYAO4Qp7qjhGtwBmnIfZy7qQWmVO8cQbcS
         Hwo7WEXIxJ7IzrGM4NFOv8ESRrB0p7oZm0HdttZ4CR7VzLP6TBMbAzMBjgUlLnNjy6VO
         TihSwdNCmratiNLgBJMtq91KVhLtUE0K9fJpSRjbKz/8u6Bkaef0dL03LDx3Yr+lN/9J
         jVLw6GFx7Kl5lqtKmjamTCXeRojNZN8kPy7RROHbaG1UYTStYMbJE3XFtCgDVMUiTxFe
         ec1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T6xjrN7887k/ybU0jIiiMTuLEWDRldLbFb/r1uyi5ms=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=ePVbSFzG6r/ccXBF4yAm5SFCmTRMh9VPAwN3H5zRo1yf08IAumgmdCnH9tonTw2c2E
         KYJus4/0+tEAIt0XWNqbP8XILOiJ4x/KVNHr3jxrtYJxTYJYJBwUFxPfFp8ONnu8xB0r
         9MGjdws+yTS2+XtdFTUvSZoYhCcKKTQoiJfMO6e+evDfHA6J9TRS5KdfEuvy7SmD7Y+M
         DYL9UozL/hJs1vIriAwecm+OM6bURBtJx3AMBEkkKSnyAs5vblp6AGZmjBE+hBiSZzs5
         vw52AL7pgsWf/eWAZ/rPic6BjDZQQ0Lpru/xAJFolucD17jGuF/IxDG7xJE8j2AcHuFW
         jfHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aagcU1Mh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a0ce301000000b0065b081ea06bsi7242880qvl.22.2023.10.10.00.39.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aagcU1Mh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq7Kk-0000c8-9c; Tue, 10 Oct 2023 03:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7Kj-0000bl-1t
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7Kh-0001hu-Ng
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6xjrN7887k/ybU0jIiiMTuLEWDRldLbFb/r1uyi5ms=;
 b=aagcU1MhYiDhMJx0JBUQGQVIJIyLBl+X/AfPPx6dlRQBYPC7pdKgmVvnaiAXTRYeH3X65c
 /MW0zqG4MVHDBX7OA9N7HHTb0mRdYnwA7bqort4F/Dk4NajSMFnsPb5z/pCr90hEf92TwQ
 rjHYWbfOCNX34fdriV8jgPdGG4ob1AE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-GQxLBPXjNza6W6__roqHSA-1; Tue, 10 Oct 2023 03:39:09 -0400
X-MC-Unique: GQxLBPXjNza6W6__roqHSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D80B3C40C15;
 Tue, 10 Oct 2023 07:39:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 076F110F1BEA;
 Tue, 10 Oct 2023 07:39:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 08/18] ui/console: when PIXMAN is unavailable,
 don't draw placeholder msg
Date: Tue, 10 Oct 2023 11:38:20 +0400
Message-ID: <20231010073830.606570-9-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kEPVGpXrGWZc

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When we can't draw text, simply show a blank display.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index a72c495b5a..8e688d3569 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -584,6 +584,7 @@ DisplaySurface *qemu_create_placeholder_surface(int w, int h,
                                                 const char *msg)
 {
     DisplaySurface *surface = qemu_create_displaysurface(w, h);
+#ifdef CONFIG_PIXMAN
     pixman_color_t bg = QEMU_PIXMAN_COLOR_BLACK;
     pixman_color_t fg = QEMU_PIXMAN_COLOR_GRAY;
     pixman_image_t *glyph;
@@ -598,6 +599,7 @@ DisplaySurface *qemu_create_placeholder_surface(int w, int h,
                                  x+i, y, FONT_WIDTH, FONT_HEIGHT);
         qemu_pixman_image_unref(glyph);
     }
+#endif
     surface->flags |= QEMU_PLACEHOLDER_FLAG;
     return surface;
 }
-- 
2.41.0

