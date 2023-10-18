Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4645825ejc;
        Wed, 18 Oct 2023 06:40:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IForiro9kc9f52+5pHYsh4/Lw9W3Xx20i1ZdN6dCOin5v64ByY4u1eIHRMXjl0b/GFMe1Pv
X-Received: by 2002:a67:c19b:0:b0:452:5b16:c290 with SMTP id h27-20020a67c19b000000b004525b16c290mr5403560vsj.7.1697636435686;
        Wed, 18 Oct 2023 06:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636435; cv=none;
        d=google.com; s=arc-20160816;
        b=xqcGSRnD6QmgqCGEMRIhcD7bzT2jx3M7CookPLg2nqa+z6GhdJHfd8GpsynxtmU8fV
         X5DLUUFAcd4n3LDk4srR/Ck+McjjcWA6vpbJ5lxV8qwN0sxc0VYw3pfniPUzak1ubzO1
         ZCTsBczVSWI51/8ja4ERgMWIofu1dWD5aQFcqefYoLVC0GuTPlL+ll5DnCgBrnFpEMoT
         jVAJBH/yyI6SYT7S0QrAR+Yxa1v+lzte2dp7ZlijJVv0Df0H5W/CKmQMm1Ovajv4ZFPc
         sADEaBN69u/31AmGrQ3dBCEKWaehrPv9gAqNQuN5BEg8+FPCgvp6w8urZh2mTKji4Rgj
         FgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BuJtFKHOZVfj/c6VMGpMJZfLV4+i7hObcsMZ8YG7Z10=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=PqlItN7qBliECTMU2MvEfcY+9qAXI2oxrz68ox+uzV8QkrR/U/tlpZvax9DmV7QlUx
         rOOqFkHFKMlANHbbzNp07qZ57hWmau+NRO+JlJgSEGkfKlChRmGRJLu/jT2RI6Etnl5W
         FTjkV7gMRb6oZW0vRgzZ40D3bK51PvlYnknPa2Ow+R2xwwHMYdbm4VLV0wxOnNmm1kGv
         mA74bOW2dqWoQFoFZVbU9DI5ztEYIzl8w2Ey40FZlLyl01Xl+9h7UsvfKOVROp3qO6Ec
         Aj0Np0eLZzMtoEotlmP8/J1A/zFxK9/o5T8TqHyI4G3zANGSxCVk7ch9SH2y1Y/p5oeC
         ZF3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="huYGK/9G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020a05622a138b00b00418114c96e8si2678179qtk.390.2023.10.18.06.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="huYGK/9G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6m9-000256-IC; Wed, 18 Oct 2023 09:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lx-0001Zw-Bh
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lt-0006KX-An
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BuJtFKHOZVfj/c6VMGpMJZfLV4+i7hObcsMZ8YG7Z10=;
 b=huYGK/9GAn8cqiJ3drlvrFB+2s+dbxh9RWinz3Djgwie1Lb+U7K3cllx8KLuOKHDlCRKEk
 FfYdZ+eOxBAeIkSqdYh7LUaT3hRZXPZjZDsDXNn/UdXIL9MgCw4JmmemDziLoS7UzWrayQ
 m97n0pYWvnWtAvt6mxPFDZsa5VtHues=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-mzLGCA_HPLKaZovT--2ftA-1; Wed, 18 Oct 2023 09:39:23 -0400
X-MC-Unique: mzLGCA_HPLKaZovT--2ftA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E16F788B773;
 Wed, 18 Oct 2023 13:39:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2334503C;
 Wed, 18 Oct 2023 13:39:21 +0000 (UTC)
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
Subject: [PATCH v4 13/19] ui/spice: SPICE/QXL requires PIXMAN
Date: Wed, 18 Oct 2023 17:38:14 +0400
Message-ID: <20231018133820.1556962-14-marcandre.lureau@redhat.com>
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
X-TUID: ZqPnnDFmN0uL

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build        |  6 +++++-
 hw/display/Kconfig |  2 +-
 ui/meson.build     | 10 +++++-----
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 87036496af..3e5b6dc3eb 100644
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
index b3525ef064..7f806a6d48 100644
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

