Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1291506ejb;
        Mon, 23 Oct 2023 04:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5cohEJF9brF1wG6hFDthGddY9EYnmnEp6+OP0drPvWBFsDjw0ExWlmudhXixRqLq5xnSY
X-Received: by 2002:ad4:5f09:0:b0:66d:6043:fa16 with SMTP id fo9-20020ad45f09000000b0066d6043fa16mr12463469qvb.2.1698060726991;
        Mon, 23 Oct 2023 04:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060726; cv=none;
        d=google.com; s=arc-20160816;
        b=dSio8TMGJWdE/0BbOGgHmRMZUlNMLSGWv4nncSt/A8cAZhZI2Syvd9Ks2x8eA2+QpA
         Of7hYT2TTkCjPGZwsdb4BKHQbyDQ/F+MQrj5+MGK9exPIC2RIRa1Al42ofBbLvb5LpD7
         Hil9nvCpa/+r0NlS+ImWhHSBt29BHhz4H25dNz7CDYjrnJ9XJISX742sM1phWqvXUwkk
         Yxvfh9o7+MH+J2e8cVbaErNjypylN+znI797yI1kUq8rtzFSldVKeXRKgFd8EQBCIXtZ
         p1EOXMOUcIeMmaDcxQx3GC+yPiPCAhgqqxvXNEqcvem9qeOTNWiNS5DgHYppGrvxIgOO
         zStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T6xjrN7887k/ybU0jIiiMTuLEWDRldLbFb/r1uyi5ms=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=h3u1kLTCCDfccagBTrmm7Nx7JaIjLIlPBz95LNiX6PWLMIvDR1TBSEC0A/LuPeydH3
         1L3yswisY9tePccRMwG5mJypYmbiGLN+LYOc2wzt0Ik4X0Xzv7P5tsqGuCZqTpdPEEu1
         amoSvk4G0emqjG8jGQtppGGCG/Hwm/bIjxuShQ+fLH5bik36dSw8QlscBP/KVBX4nSxi
         aaSpQkoPU2g4fjQYNx2bb3c15+fP/+chO/Qrps7+XQppPNYmHwM5ObMyI6s305tYsAwY
         yC5a9Y9gNfHInyh1pOb/LqtgTyjBBFhCjzwvRmyehb0wABOruRXF4LwAm17Dzjcz2nj7
         +ogA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="e7/3jb4l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az44-20020a05620a172c00b007759a519e0dsi5328548qkb.73.2023.10.23.04.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:32:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="e7/3jb4l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qut9v-0008Fh-Tr; Mon, 23 Oct 2023 07:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut9o-0007r3-Ay
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut9l-0003ah-5W
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6xjrN7887k/ybU0jIiiMTuLEWDRldLbFb/r1uyi5ms=;
 b=e7/3jb4l9l8Gi3bkzR/OBd5P8eQMUiGMYfsyeksbSPYplGBiuvCAuzGs6T3t9LxJbztykL
 tocDtxVBa7ecw/YKEbgbIZ9YWJLXPGKzj54xuGaEw9PPjmR64L3VCzC2AD2KWz19pRzRTw
 emCccEfIB5RQySVZqpzzJnJS0hT37j0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-49-oEimriL8PZKDCEYDmgmSJg-1; Mon,
 23 Oct 2023 07:31:33 -0400
X-MC-Unique: oEimriL8PZKDCEYDmgmSJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84648280604A;
 Mon, 23 Oct 2023 11:31:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CCC91C060AE;
 Mon, 23 Oct 2023 11:31:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 09/19] ui/console: when PIXMAN is unavailable,
 don't draw placeholder msg
Date: Mon, 23 Oct 2023 15:30:36 +0400
Message-ID: <20231023113047.2572137-10-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: Dx5ulzypJFz8

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

