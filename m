Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2968019ejb;
        Wed, 25 Oct 2023 12:10:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzmxQiOrscqv67PleDn9rzW6+rTnSWXcKVCs6LwG2jkuRKx15CwIjai8uiHR1PITRCkzhT
X-Received: by 2002:a19:6454:0:b0:503:3281:2ffd with SMTP id b20-20020a196454000000b0050332812ffdmr11556765lfj.41.1698261040772;
        Wed, 25 Oct 2023 12:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698261040; cv=none;
        d=google.com; s=arc-20160816;
        b=xYQd0SugcpmWoBgONln/K0uKldPqfxFWaivHYKlumdZcdvkf0D/zKv/lBS5Os5Gnem
         O4WU7JSoZ/sXeq1R5H8kKExehurFJS7g8iqiIKXPQpVF3MWUq3gYTa+B42f54wMv6Cxu
         9gwB1ksBMBda5l1iK9K6PdftCEUcEjmx8aDgcOT09Pmzv0tpr+LGfLa5jes9zGsL44br
         dZj4NnAwgz4/nyfS0Hko3owdeEqMYr/krZ/qbT+HDWAr+vNlDm26bkUaDMFsJueeNMk1
         hMTEviWq48M7dvieNjv9op1PJE0sYpZ2WPW7SmHtMgKk8FVKsv6WziO8mJ76t6RyyM0b
         R+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MUYXOavKjr3nBQePklqtEwSaDfyRGwnYpWD8MCr0umI=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=F8tI7U4ZoK27pohzoUCLhUozr/Vi6GJDVYo3sHmo1cD9NiW/hMHYe54qQ8b3PgtVxn
         5MehSRBed2cTalgLzp4br9QX/2gQGxX/oPDYV+tauLnCxGr7NP8GJVJrIb2Cs6qSz/BK
         P+Fcna7uuQg+OtyLLISHiVq//PP0c33DnUh4KmSUGXwhpbVfNfsbfCYsv+1v/W6rrbXd
         tuIYLN43NoI71OR/SenmlWIAfYBcWi8hXJw0vp6Q1RtlMmH4VlWebZIb87LUAZ54OauV
         P7KV9zZGBW3zjyC9yMGIBdigsC4GqlMgF6iBLLDqJ0Zn2BaypuEA+YpWcVHoKug1Bkw5
         fKKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VQQmj41t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05600c314900b004063dd186bfsi394467wmo.22.2023.10.25.12.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VQQmj41t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvjG1-0005jt-PJ; Wed, 25 Oct 2023 15:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFx-0005Gj-Fu
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFv-0000Xt-VL
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUYXOavKjr3nBQePklqtEwSaDfyRGwnYpWD8MCr0umI=;
 b=VQQmj41tjjMw4DET6mSYlyW2U3kP+g0HbtiHNuDcAwsCROXFDux0jd0WolbP3uGi/tR7O3
 uFtx+W0Qj1RZEeue7p+WtmYEZH0s+b3abqVYRd0JkaHDN5vppZY/IYT7yiX5mguGgQrwek
 a461CKl6103FsJRF/B53YRxVfOZCk38=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-qkNsX8tXPGqA8QVFp64vBQ-1; Wed,
 25 Oct 2023 15:09:19 -0400
X-MC-Unique: qkNsX8tXPGqA8QVFp64vBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE2BB1C06903;
 Wed, 25 Oct 2023 19:09:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF379502B;
 Wed, 25 Oct 2023 19:09:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 13/23] ui/console: when PIXMAN is unavailable,
 don't draw placeholder msg
Date: Wed, 25 Oct 2023 23:08:07 +0400
Message-ID: <20231025190818.3278423-14-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
X-TUID: n2S+A+9y5g/L

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When we can't draw text, simply show a blank display.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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

