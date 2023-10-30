Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1774073ejc;
        Mon, 30 Oct 2023 03:50:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJtSw3r9VPHRpPGYTnilzN4ENVjpkIov/55AQ1cMH+EsZJ9/xK0+GkLyIt7VCNyXvhyEL0
X-Received: by 2002:a05:622a:1113:b0:41e:1f5d:7009 with SMTP id e19-20020a05622a111300b0041e1f5d7009mr11206307qty.25.1698663052667;
        Mon, 30 Oct 2023 03:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698663052; cv=none;
        d=google.com; s=arc-20160816;
        b=wgO3W24Hl17OTodklnd49syktz47c8zh+fVI2uTYHuEwTUHr1Wz4Z2IoviD8cHUsPY
         +oIzlRTDRpYtE0ef76WRqtMO6R585iSYl3z2G26/o0aorI5JZmT5PzKKQj67JwW5NSa/
         nDFWFxVWc5ymOd10BviNA6Lwjx91zMfX0yRo5PUS7Unv+MtdkQiodESjVLwrYTqFYRO5
         eR9wI7xKsRWi/lLAUiWu0v01NXfVIDmjeCiX7deX0B21SyihT/CyNFpulMC3gktMskeh
         7nw0vqP9MX+ux8J8gXUJI48J/SmYUzuaL1/PskQkJNAaoNflBfGLFtcpEUku+hNPboxI
         NUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3AFikoxqnKEK721avSJDiab7E/fh9h5DnwunW97iVck=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=Wd3mHro6sbM03yjwuM1WaGfx88mt09GEX6V+Kgg7z2dEngFTdujzLW7lKmPtRBl3/f
         uvaJJ3ptHSJ44mXXKBqnM4636KoC0vwhMmMlI+LGSoYfZuXqfDDvWmol+L3aBQS0mTR1
         sx1NnQMZ0ltU0EEQ8Z+/Zjby4Q6BYE0miF5uOvI9/4x9DvaHajFKWcIxA5//iMhFkgqs
         3wsSn/zw4xUejApRMblU6XlVLtRWXL2Cxmy/7+2VDz7DKltxRVttIsfe71GFf00ZI+k6
         VMnfBAzaKprJqODQc+qZaLEApIWqNLwUY9Wknm3C0CAEFW72k5fbjalQZIgCTtlNTjgN
         +xRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KZIlASpK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020ac85c01000000b0041cb4580e9asi5352776qti.674.2023.10.30.03.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:50:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KZIlASpK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxPqG-0006kl-Jp; Mon, 30 Oct 2023 06:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPqF-0006d9-JQ
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPqB-0002mH-QA
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3AFikoxqnKEK721avSJDiab7E/fh9h5DnwunW97iVck=;
 b=KZIlASpKUBLFJYEDdXNFQI8pMvcKQOiP4ANRJ6HMQQAyuSNyL+jHIJf0hZCNAWCOrfg7Jd
 U8MmLlsVrOqH1mLhyn/goUwp/u3uaQQN7Ui8NYJ+gVlyFdlJyRqcrSNm1YE1Lmchmqnlx6
 WeGDvpLV6GLxD80Dsnn1y9sMOGCeWb8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-U6ww7AbROeqLIRAn-oefyA-1; Mon,
 30 Oct 2023 06:49:50 -0400
X-MC-Unique: U6ww7AbROeqLIRAn-oefyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A98C11C07554;
 Mon, 30 Oct 2023 10:49:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDF402026D4C;
 Mon, 30 Oct 2023 10:49:48 +0000 (UTC)
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
Subject: [PATCH v7 22/23] hw/display: make ATI_VGA depend on PIXMAN
Date: Mon, 30 Oct 2023 14:47:53 +0400
Message-ID: <20231030104755.124188-23-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: nj2uyuqZ2gRg

From: Marc-André Lureau <marcandre.lureau@redhat.com>

To avoid a kconfig cycle, change "depends on PCI" to "select PCI".

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 configs/devices/mips64el-softmmu/default.mak | 3 +--
 hw/display/Kconfig                           | 3 ++-
 hw/display/meson.build                       | 2 +-
 hw/mips/Kconfig                              | 2 ++
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
index d5188f7ea5..4d80d60511 100644
--- a/configs/devices/mips64el-softmmu/default.mak
+++ b/configs/devices/mips64el-softmmu/default.mak
@@ -1,9 +1,8 @@
 # Default configuration for mips64el-softmmu
 
 include ../mips-softmmu/common.mak
-CONFIG_FULOONG=y
+#CONFIG_FULOONG=y
 CONFIG_LOONGSON3V=y
-CONFIG_ATI_VGA=y
 CONFIG_RTL8139_PCI=y
 CONFIG_JAZZ=y
 CONFIG_VT82C686=y
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 1aafe1923d..8219225a1c 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -125,7 +125,8 @@ config DPCD
 config ATI_VGA
     bool
     default y if PCI_DEVICES
-    depends on PCI
+    depends on PIXMAN
+    select PCI
     select VGA
     select BITBANG_I2C
     select DDC
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 9c06aaee20..344dfe3d8c 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -62,7 +62,7 @@ system_ss.add(when: 'CONFIG_XLNX_DISPLAYPORT', if_true: files('xlnx_dp.c'))
 
 system_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
-system_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
+system_ss.add(when: 'CONFIG_ATI_VGA', if_true: [files('ati.c', 'ati_2d.c', 'ati_dbg.c'), pixman])
 
 
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index ac1eb06a51..48bb15fdd3 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -32,7 +32,9 @@ config JAZZ
 
 config FULOONG
     bool
+    default y if MIPS
     select PCI_BONITO
+    depends on ATI_VGA
 
 config LOONGSON3V
     bool
-- 
2.41.0

