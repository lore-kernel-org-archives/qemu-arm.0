Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1292282ejb;
        Mon, 23 Oct 2023 04:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+B89aWiodvsORL6/WGMsJa0IwRsiVc+VvvxxJrAxFZGZpbJFX8Efvsw7j2gWypRNHRB8H
X-Received: by 2002:ad4:5aaf:0:b0:66d:9bb7:3026 with SMTP id u15-20020ad45aaf000000b0066d9bb73026mr11376677qvg.25.1698060811232;
        Mon, 23 Oct 2023 04:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060811; cv=none;
        d=google.com; s=arc-20160816;
        b=JRP2CnE2A7J+bcZx/e8B8LoeuBk5WujCeZMZxaeKBXR5thwVdo6knNYP3yblvPJTBb
         VRS8UVy0MKNqG0HunSYrvOex7YW2U/lFfuZHacLkeTpLfTW3b9Hsb0jXKu7puPlLwEIE
         OI2WwYs9YQv3PJ6hi4jW/+J5JHDckYNT7TF/AFacBeBSH6ZBYca94/p3lm37Sdid0TEl
         MJv5y03NIKG3KUo7JY76zXQJJ+SsfuqpFgwUncI8dwj/JjJ0gyOneWJaqUkQQjjwWak4
         BQCig3o+85XxZcbgSezgxQ+FX4SKqLm4u94J807c5Iz2DOMPkxBCobP73Wgz6U/ivYY0
         djFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KjyX/hzVkoTNTRue4FPmHzJ+w3/YyERyvkVhX3gqTLo=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=nZuy3xVBVufKehVCYqlgefVAaFgMeuy5mU5NRiLt0PBSyxlVPDXB7rXC8uAW8HCyx4
         CzRHUtJ+cVUOyMVVG93ToOrQ6s1belo0B9v8XX+xDxMtOM6/wT1E0BJUfc1mh4HbaA4E
         V9bLioHMKvHu8+zUfpuEQlWD5OVvAkMWG3ZNGDzy/B4cH/CZ9IxOlpPSeI43guMlGAyj
         VX7IaTXYnoPQF+dD6YUSi6VnTLNby5rtIMColXDK2TxCExSge61GKfmOUrpEi44WOyOJ
         DvwRXdvTkBraMUUe/vxp49VFKuEhGIXt6BAtgHeB80F3msUIZlJQVM8jXlZwsRsYpbky
         t+YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ur5gEf5P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eu18-20020ad44f52000000b0065e0125a6besi5375326qvb.410.2023.10.23.04.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ur5gEf5P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qutAf-0001HS-Fz; Mon, 23 Oct 2023 07:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutA7-0008VK-W9
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutA6-0003gt-Ga
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjyX/hzVkoTNTRue4FPmHzJ+w3/YyERyvkVhX3gqTLo=;
 b=Ur5gEf5P8eQIILke4875IcZ9qkfb17/APPaOnGV8pkTE7ZH/hzapUlyOwfGG7mS1z5ioqH
 iM6M6gtuNG2hnO0OINNNEXqwlHmSiJAJghmUFZpPQv537NPvwZ/Nh8OEGF1IExZZxfiHuW
 FUcOmBALo6UY4ZErs5WscdWGAgt8EBc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-3ZJ3kmeWNAGdeVWIcTu10w-1; Mon, 23 Oct 2023 07:31:49 -0400
X-MC-Unique: 3ZJ3kmeWNAGdeVWIcTu10w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 567E58021B1;
 Mon, 23 Oct 2023 11:31:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FE09111D784;
 Mon, 23 Oct 2023 11:31:47 +0000 (UTC)
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
Subject: [PATCH v5 13/19] ui/spice: SPICE/QXL requires PIXMAN
Date: Mon, 23 Oct 2023 15:30:40 +0400
Message-ID: <20231023113047.2572137-14-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: is14rZVCUgR1

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build        |  6 +++++-
 hw/display/Kconfig |  2 +-
 ui/meson.build     | 10 +++++-----
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index c4dd9e01ea..3d6e41d1fb 100644
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

