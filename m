Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2968440ejb;
        Wed, 25 Oct 2023 12:11:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmnqCnJb6Pw4SVIfGuvXvdGrKftb24gTdiXb6813Vr5nBnocsJUiECnhQZubkJay9VjwV9
X-Received: by 2002:a5d:5545:0:b0:329:2649:ced5 with SMTP id g5-20020a5d5545000000b003292649ced5mr540278wrw.32.1698261081267;
        Wed, 25 Oct 2023 12:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698261081; cv=none;
        d=google.com; s=arc-20160816;
        b=ezeCNptnEP63kvBF+VbYRWW1BrtKHlr270DbpD/OZc+lSnE0ypDIHzeXtDwDTsFx0p
         Lf3LDyTV0tZvwoKcXUNKIw1Wfi4odqtwfCmlSHGQIPdndJnnvAEDuvMZ284en2FALwUC
         4vmxRn0ihdcKc+czjdo5zCV/QIvrHoKELqxUQU7lzlJWrXbY6AhgfF12oHuJU/oy3Nco
         Zimdni2lSsHwqss4TYs9qm2sHqh5lI8tX5Ak3yU194J8P3OZBaEo9URf7ZDI9NkwK9ke
         ym+Cl9Ae5PYYEByKKolHygZqjxi4jryC/JqTh5uFA5QoGxzUNW+n6iRW/O8fjJH7JDe+
         ExYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ngzny1QtASkwy4IfrDWfVKDSut+nimzaGhnpW+xw2xM=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=0mYvX/07d/d+HwZASJ5zXwYaxgmsNDzcHVm0hvkOzuG/yZ8SerITVRRnCB9nskiM/k
         kk1BWQquAO8zOZAcsV3D6yS4c28LcS4fLVnVIaEW7O3cnwgnJNV7xE8ZC+BU5KGPNqxh
         HjvAmd8DdGmh/IAcZsoo4xfSIs9yGwrCXO51G7Ai0mprewEyePH6OfOWT+CAGFEBdzmO
         nBcWuXCKZUm9AH3rm87GvCWYjN2rtJsyZpIKMfnP7oGf9493/e9O0jl/ylOwPCGA1mY/
         omjP8B7pS3C8NRoJStCg+1qNKqZlmRHMXivxPvCUj4Ec5z1BMP54bExXIs6pJ4SYWbr+
         HS0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cpBKMKvz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020adffcd2000000b00320081f7555si7996858wrs.395.2023.10.25.12.11.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:11:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cpBKMKvz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvjGE-0006L0-Dt; Wed, 25 Oct 2023 15:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjGA-0006H5-4e
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 15:09:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjG8-0000cV-E1
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 15:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ngzny1QtASkwy4IfrDWfVKDSut+nimzaGhnpW+xw2xM=;
 b=cpBKMKvzQfeV948Bk5GhwTACmxWOQn+c3vRcj1gpOr47x3DLm2rEg2BxubJIsQ2cvvymg2
 NjFFGsgl8mINsuLYsUF9uJrtugi0SdhJ8heOjCzWhZvaTHsR4ncPJleMkQzuB8Zc5iIxoP
 1oUpzkvsu8Y+ciE0bReBelrFfdLCt8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-Gcg5Adu4NUidJOvZ96cS1w-1; Wed, 25 Oct 2023 15:09:36 -0400
X-MC-Unique: Gcg5Adu4NUidJOvZ96cS1w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C9BC85D520;
 Wed, 25 Oct 2023 19:09:36 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44AD8492BFD;
 Wed, 25 Oct 2023 19:09:34 +0000 (UTC)
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
Subject: [PATCH v6 17/23] ui/spice: SPICE/QXL requires PIXMAN
Date: Wed, 25 Oct 2023 23:08:11 +0400
Message-ID: <20231025190818.3278423-18-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +C9kiNj7W8nK

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 meson.build        |  6 +++++-
 hw/display/Kconfig |  2 +-
 ui/meson.build     | 10 +++++-----
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index f3fc1ba68d..0dbad80fcc 100644
--- a/meson.build
+++ b/meson.build
@@ -1015,7 +1015,11 @@ if not get_option('spice_protocol').auto() or have_system
                               method: 'pkg-config')
 endif
 spice = not_found
-if not get_option('spice').auto() or have_system
+if get_option('spice') \
+             .disable_auto_if(not have_system) \
+             .require(pixman.found(),
+                      error_message: 'cannot enable SPICE if pixman is not available') \
+             .allowed()
   spice = dependency('spice-server', version: '>=0.14.0',
                      required: get_option('spice'),
                      method: 'pkg-config')
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 7b3da68d1c..4d8b0cec40 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -93,7 +93,7 @@ config VGA
 
 config QXL
     bool
-    depends on SPICE && PCI
+    depends on SPICE && PCI && PIXMAN
     select VGA
 
 config VIRTIO_GPU
diff --git a/ui/meson.build b/ui/meson.build
index 19723188b5..024f494faf 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -141,12 +141,12 @@ if spice.found()
     'spice-display.c'
   ))
   ui_modules += {'spice-core' : spice_core_ss}
-endif
 
-if spice.found() and gio.found()
-  spice_ss = ss.source_set()
-  spice_ss.add(spice, gio, pixman, files('spice-app.c'))
-  ui_modules += {'spice-app': spice_ss}
+  if gio.found()
+    spice_ss = ss.source_set()
+    spice_ss.add(spice, gio, pixman, files('spice-app.c'))
+    ui_modules += {'spice-app': spice_ss}
+  endif
 endif
 
 keymaps = [
-- 
2.41.0

