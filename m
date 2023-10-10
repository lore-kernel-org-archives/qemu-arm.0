Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp297011ejb;
        Tue, 10 Oct 2023 00:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXmRNQOVmWDZ+lfglw/IyXOjqxEjdO3K707W0poYA5N4Y7HI0vnCL2/NaPRQv/v2gglB04
X-Received: by 2002:a05:6214:310f:b0:658:59e7:aac5 with SMTP id ks15-20020a056214310f00b0065859e7aac5mr16300698qvb.23.1696923623220;
        Tue, 10 Oct 2023 00:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923623; cv=none;
        d=google.com; s=arc-20160816;
        b=GTGedVWRSqfhzI+nnX7ex2VUkvwRCySQ+y5uhPg/TMzqBYrmAWlrcI1mtRZzuS27zY
         3um3LPs9GdIP8YHszMXzHjVrBKvTH/TmcBMU483yvmj32c7Q745f3QRu5M1YZFT8iPKa
         a0qsNEgUNcikvekheeXTeeRgx6icktgMaB0sPTEnk3rVtoxJVwlg9VpHz4ewgVI3SRnT
         xH3KHNsIdknzixsXJE4cKnRhssMa0whIN2SG/MO/9dDvY/MyBD0fKuynBle+WZULGvSU
         T0vm+KaieZa9uU7g3UDHiucwF/i7cBXa3KvnocLTusvVg46cX/ddITh/ZMSwHoEizoZQ
         vVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OcLFKisrvdsUnoI6kjiP3anO/6zUJnpkUfqLjcRmuyA=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=yAf2YMz7/Y1Gj93L0YODBSg5bVRNc3kWxADHfDPLmCLn3F3lynZ3c/bQIBYxUxOHTL
         fQCuBOSEP7fJB9Oj8QSVcL7JXWBa5xvZRaICn9y1NvGIWPhFRLyzf/kQt3dYrWWVuzEY
         JwS3ixxBEWtOBYi/yGYKNnDzKZdr9MzPKzn6ZZBslzDGViTa0oTQDq0aNwOh1hHtcvdY
         3D0esJpwc3IFayzFrCilqlW6JAabq3m9ufTLC3XEYvZZnhZBTA4cIE+Dm1PTA1iYE+gp
         nurGvVg/7nTQmBPq0jGm0iREfAxqAT3VvOt3fP4nu6cvCD1nUHQ0F+t972JYM8oaieAi
         zAqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b46FgVv4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7-20020a0cf047000000b0064188f9b3d0si7274671qvl.188.2023.10.10.00.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b46FgVv4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq7L9-0001iD-1p; Tue, 10 Oct 2023 03:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7L7-0001YX-Pq
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7L6-0001ph-8v
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcLFKisrvdsUnoI6kjiP3anO/6zUJnpkUfqLjcRmuyA=;
 b=b46FgVv4Bj53hnrncNLR261+VSUf2HdeL0YwfUNYf495aCb/pFYMHOkNtY4LLOdwYWmP61
 vAbWAcuV0z5aaK3Tj+ymMawVndF/o8Fp+y72fJ6Lkd0wxSyX2Zd0nAL/HWrJopa3Yilg8x
 BXjfEzXm1Njo36gT63LKV8NETuh+GvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-f4yctnwrOnuBGSXEIrcY9Q-1; Tue, 10 Oct 2023 03:39:26 -0400
X-MC-Unique: f4yctnwrOnuBGSXEIrcY9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 840EA802C1A;
 Tue, 10 Oct 2023 07:39:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68D21C154CE;
 Tue, 10 Oct 2023 07:39:24 +0000 (UTC)
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
Subject: [PATCH v3 12/18] ui/spice: SPICE/QXL requires PIXMAN
Date: Tue, 10 Oct 2023 11:38:24 +0400
Message-ID: <20231010073830.606570-13-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-TUID: PiUhbmh4s/8y

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build        |  6 +++++-
 hw/display/Kconfig |  2 +-
 ui/meson.build     | 10 +++++-----
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 291c2f1301..a84a2f25d0 100644
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

