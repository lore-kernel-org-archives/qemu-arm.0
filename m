Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4645876ejc;
        Wed, 18 Oct 2023 06:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo0Gl876xqMCQR/eOIOfY4jc2nyOqWLBFTTuujP20AmGcqvdumctWTADlFt3ByN3q6vsSh
X-Received: by 2002:a25:d0d6:0:b0:d7b:9211:51a5 with SMTP id h205-20020a25d0d6000000b00d7b921151a5mr5234301ybg.44.1697636439928;
        Wed, 18 Oct 2023 06:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636439; cv=none;
        d=google.com; s=arc-20160816;
        b=S2hnxd5NaliItG91u2oYo0gP5w56DrmzWxFwGffV3SZSg5fUdfB1UCftM2bbjSUG/C
         VMljKoIreB52FoL6ZljvY3u1k1boDiSwwvMfwlWJxpXo0wY2BbbW0BeYLjpMc+ff4m3I
         dS/G+U8DcM1y/8UOjtYmnJXZp3VbOgC0YC3jgA+m26bJ91kRZDjdCvKFi/BkAw1RfBhP
         PcvYHoUIe6tOlqPQm6suxBS6lf1QVbWhM8HjZIAxJbs51lEndBzEEX5vKZ19opbgbUxc
         zB+0P52/gHwGyS8dCseHdgVxQKkLrJv32Tv6hoMIvTvopDzu6dy08igzJl7o5UnPTgcZ
         waUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T6xjrN7887k/ybU0jIiiMTuLEWDRldLbFb/r1uyi5ms=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=PNNaTS86S3Cma8DWcrLBzzV5iaWLEPE6I7OWwW2iBtXtXe/HZghx+IaHZz0sqV7zKp
         VwpXQiDCIhKi3cBxTOeRP5HE5733Av/V5dilxDubkixLXtvHfWQxYXvSNwRTJN5r1IJl
         uepp70NnkIs1rLxgS7CvzgHWxh1QiagXa2xZJSQdOrVdVelVdO4p+1f/O0X4tFPXMXzK
         u4Rqai1euXacHj0BJ5kdnorex7J1xm5Yjhkaqne2nTddkmaL9LOT63NZtZNe6k1lzwd9
         kFR6I2Ok6WDIvzjpa7udMuGSEQDIYooDSjJIbdAc2CtysnhcMnGgT7jes5oAyxmOT4fF
         HaEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fc6XmFQA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id es1-20020a056214192100b0066d12ac2600si2627209qvb.158.2023.10.18.06.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fc6XmFQA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6lW-0000Tp-Kt; Wed, 18 Oct 2023 09:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lU-0000NM-ES
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lS-0006F0-T7
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6xjrN7887k/ybU0jIiiMTuLEWDRldLbFb/r1uyi5ms=;
 b=fc6XmFQASOB0Gd3VbmU4StZDGlU1GvI1QpLhg6Wdyqqh0a3kC5D10uY2k1ZUQVlED7cTQt
 bdGv0mkNNQPLEDnrV7qWLLB9dcrRKYSevTac8YrEQ2FasmEDbEeVEtUFbheuHbvdLPHHes
 RJWDu5oLrEvAi/VItCAZauGRgYVQJ7c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-Q306MCuNNqGXEU0tv8S_4A-1; Wed, 18 Oct 2023 09:39:05 -0400
X-MC-Unique: Q306MCuNNqGXEU0tv8S_4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 214A4800C7A;
 Wed, 18 Oct 2023 13:39:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BBC7503B;
 Wed, 18 Oct 2023 13:39:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 09/19] ui/console: when PIXMAN is unavailable,
 don't draw placeholder msg
Date: Wed, 18 Oct 2023 17:38:10 +0400
Message-ID: <20231018133820.1556962-10-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: 4rsQLtCfRqoL

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

