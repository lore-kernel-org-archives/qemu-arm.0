Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1773991ejc;
        Mon, 30 Oct 2023 03:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrlxda6QNYn/gJLh8utKM/Zk/bkhR1oqF8BBgVLXa/ae65jmVkxu2B83UsbrLlNZIr7f6p
X-Received: by 2002:a05:620a:3725:b0:773:c43e:5e73 with SMTP id de37-20020a05620a372500b00773c43e5e73mr18340724qkb.25.1698663041212;
        Mon, 30 Oct 2023 03:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698663041; cv=none;
        d=google.com; s=arc-20160816;
        b=lLuOAluJ90mAEzbz86IUKYK9pu5iuC7xPx6hotxunIboZRh7URdEMwbaeXmPSQPKx4
         bewhjnWzygA1o3Q59ElUOwqafCoCBV2GWqIRPnV7ic8b6bHNX2WqIYpGV5sT8zN/nt58
         2WTojeQq2TGTcvB4dAIqisG57DmcOoMzrhxDf45qi1ZcaZNKRbC+iO433qlk7e3f24yn
         0oTAUt14fA1b1pQAVWer53WjfVRXiyphSHDHiWU81kXSY+E2yMKl4NRfxJaBq0Wlruur
         Ki0YETR/V0xDKh0p8oUvO3aBhTRAy0x85ELnHCEV3y1GUflynSe99vt7zQ5WwLxcTBAO
         v8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ngzny1QtASkwy4IfrDWfVKDSut+nimzaGhnpW+xw2xM=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=LBoU4G0XRKyEfcnmV6rtVuCSduA8Jvp4PymSadlkqcDI1Xj06txsIGsSrWxZD2DaCS
         FPuxPztaYYUHrTJEmjxb5cmYkIJRFp35jrQxw0fLcA4WgcQlgHZIwTmNByWP70nbO55X
         JNIbescVgnti6uGSOI5z6LMrCBusNl3wx1vHS5atyleSeWY1x6+erhmcHvwxTTaeeL5+
         FFsal/uyIveIxFajO1vOkVXmXXuJybDinBzCmRhJb2o1g5FYduNzffVOwfIxdQDqRzxL
         IBr75cCyi+isOTeOlGGACjpo6N3jmRtN2Snu8sCc/Kuj30hNe5kCRqkFLc/uSjSJD8/L
         VIUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HeTJZN/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq14-20020a05620a468e00b007788fb75a90si5369311qkb.620.2023.10.30.03.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:50:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HeTJZN/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxPpt-0004d1-Aq; Mon, 30 Oct 2023 06:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpr-0004NE-NM
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpp-0002jK-WF
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ngzny1QtASkwy4IfrDWfVKDSut+nimzaGhnpW+xw2xM=;
 b=HeTJZN/33dHJlLZPyqLgQaCz58n0L/KWgpd/et3ird1mnIZDL24oGol+i7o2xwHM3gQXNj
 PUdV85QWXIs2oS5wmvnDoJ4n0N6J6JYyoSJ+UCjoAZpCl97v49wdotyoG/p+GqvmrjWCoF
 mybkkUJefxkFNO/Mume/3EiW4YyQl0I=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-ft2FurLLNsOXejUIxoMYvA-1; Mon,
 30 Oct 2023 06:49:26 -0400
X-MC-Unique: ft2FurLLNsOXejUIxoMYvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D68753826D23;
 Mon, 30 Oct 2023 10:49:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B174F2026D4C;
 Mon, 30 Oct 2023 10:49:24 +0000 (UTC)
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
Subject: [PATCH v7 17/23] ui/spice: SPICE/QXL requires PIXMAN
Date: Mon, 30 Oct 2023 14:47:48 +0400
Message-ID: <20231030104755.124188-18-marcandre.lureau@redhat.com>
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
X-TUID: fMwpxmRdz8h2

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

