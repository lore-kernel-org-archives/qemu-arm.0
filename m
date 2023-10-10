Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp297201ejb;
        Tue, 10 Oct 2023 00:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6wcNu3vqZy2xVKPNx62ZcyOBHniqoxm+TMRqdMtIg2DJsr1cgCWsafb1WfIi3DhbS7lh1
X-Received: by 2002:a05:620a:2a03:b0:776:5135:d96d with SMTP id o3-20020a05620a2a0300b007765135d96dmr18054523qkp.69.1696923650449;
        Tue, 10 Oct 2023 00:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923650; cv=none;
        d=google.com; s=arc-20160816;
        b=uRD2MQv786TP7G1PHNklMGLx3BZft7vDLDvt0Xi2qLKXWJNDL4vySoaRSEHub2j/ao
         IURFflUwBUI/XLKOeIgdXu4xhOqozfixi2pDlqVZ88L3SW5PVD06ePt3qqMpXrZiHGTt
         LALUnQF9KX/C2RIawHPDkEfdmmi/6o+o6iCqSBggNZ8YgKbA6VqLx0TOxHxvc30ivOBf
         9ViTaBok5QtrR3CClm5tXj+SfZR1WHbO2i5zIl9VQv18EwD3DbIFhPnH4E9H3U+IN+7S
         2PZ/ILiIIMUxfiDztt1NW93fgSgysu5c086lEQSEIbX8/gheECDQIziHJGqTkuuE1IhP
         Gmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4SZ/OasRCxgbsCQYI36rdtboQkh+0BPjMMpQl7MHELU=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=XFWRTOVrT5uedrvQXBSxAo6dATYZIvL5nFl5mprb3Gq4+FJClfDRxw0z4t3VJpz7CJ
         Y3wXLDYAi0jjE7GLp82cLR+G/eRt4MhLOLXw5SMI+rR91soGRXzZrZg++JVcWG0JSRmJ
         sYyRY1ONZ31CIgb3GOVaoYDvuGRdhUS8zY6QT/VBZVe4t4kDJ1vy5yAYaV3lH23dIvjN
         NDJuhfYsDEadzTVVqjH5bRPp03PuCzFCHahGwBXWWpJEk7dXrgcUeflVkRFFFkNk/I+v
         Qnqn1Ce1+d/Gx7uxmgJW4EioGgntYJEt2Pc8zd++G8fL8U1pwPRO5B4aj2mG0ab1HUQw
         RnFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ePHSMtUY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a05620a0bc200b00775cab41f38si7114563qki.79.2023.10.10.00.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ePHSMtUY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq7Ks-0000kk-JW; Tue, 10 Oct 2023 03:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7Kr-0000il-CU
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7Kq-0001kQ-15
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SZ/OasRCxgbsCQYI36rdtboQkh+0BPjMMpQl7MHELU=;
 b=ePHSMtUY4l29wlUJmx7wk066yBqr0jSYwZZqwMztjPLM9LqGIg0DPZ8mD+MLr/UYfWUQ1k
 XCRw0Mbls2zUiz8HpamNr0F578rmdBbsCwZCG265Ae5LbCU577EN1htLA7Pw2Ca5U1AEku
 HCUsUAUprwP75dH7qCKRFMapG0FpAsE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-VkZBKONhMx-whdJikSoTtw-1; Tue, 10 Oct 2023 03:39:17 -0400
X-MC-Unique: VkZBKONhMx-whdJikSoTtw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EC8A3C40C06;
 Tue, 10 Oct 2023 07:39:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA163492B16;
 Tue, 10 Oct 2023 07:39:15 +0000 (UTC)
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
Subject: [PATCH v3 10/18] ui/gl: opengl doesn't require PIXMAN
Date: Tue, 10 Oct 2023 11:38:22 +0400
Message-ID: <20231010073830.606570-11-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-TUID: rLCFPrA2yUmA

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The QEMU fallback covers the requirements. We still need the flags of
header inclusion with CONFIG_PIXMAN.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/meson.build b/ui/meson.build
index 3085e10a72..7c99613950 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -60,8 +60,8 @@ endif
 system_ss.add(opengl)
 if opengl.found()
   opengl_ss = ss.source_set()
-  opengl_ss.add(gbm)
-  opengl_ss.add(when: [opengl, pixman],
+  opengl_ss.add(gbm, pixman)
+  opengl_ss.add(when: [opengl],
                if_true: files('shader.c', 'console-gl.c', 'egl-helpers.c', 'egl-context.c'))
   ui_modules += {'opengl' : opengl_ss}
 endif
-- 
2.41.0

