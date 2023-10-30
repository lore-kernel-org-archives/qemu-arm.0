Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1773548ejc;
        Mon, 30 Oct 2023 03:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG30RvhIeeaMusDTUEA9vYVCzKcBBUOUbPbQ2+Uqu4IrTYqLA0uKPtxVI5VG1TgmCHwUG2B
X-Received: by 2002:a05:620a:448b:b0:778:9a19:da98 with SMTP id x11-20020a05620a448b00b007789a19da98mr11164326qkp.8.1698662995770;
        Mon, 30 Oct 2023 03:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698662995; cv=none;
        d=google.com; s=arc-20160816;
        b=lapgMHOSsL4QKd3+UeicV7zCT0xHDeP4kxMeVMwQ6VxF+3//iyy1fQr0/Rls7cArlm
         waEEUKrSXhIysNnLfW+0fOkPmGerT/Q7We0YvYGuxk6DWlTnZiP7RKTSX+A5mK7unWo7
         Le99hEncpc++vvi+rnORULwPPevdC8gAEzdFw2pxHBwWITVa9FYrc6JOjsI7iAd3q9gA
         q+CM4p86NGmKz4e3UCViapgYWdme2jjb2nDFWNuKNHLZP+MNiF5cINDb6b+xZuMK3UWF
         pyzEr/FZNsTpQ26wnebsayjJ2YTJEXcTsOYQsPaCBpaO22U16StoKuwg9LbBlj+NnxLb
         OfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mB1ujEtWUOmOeJwT57HbXRVHFW4v0Dxs3+X0YxZJ+mw=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=KiPUN30EXFZGhOZ1xyVkK41e/Scomzy54uY1OW/cVvPeOJaGTu74oaViCd6iR7Q7W7
         VAwXeW+reWkJ5GshSZW+Hzwqwb0FDGMPRYCh9Pifj2ZefgigL9W61LxEoNGSEUDexc7S
         KdubiSA4QkvExSU5npkLPZHkUzDQFYX1WPubb6VNmbx/b6SixA9b//yIK22533MZzFDZ
         ZjIrkkZOjIsCULJnwrZ3G/yupEspJRXIhOP61rmUtHCj8dllFI8ncArmtP276ddl+flp
         OD+E67ygS/iH/kBiBatVjZLktWt+GasMKcZgNitsQakt3n8M0rR0nVcSer5IgHC2Pv2/
         NUBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gvDSNA87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qr2-20020a05620a390200b00773d18bea8fsi5546906qkn.47.2023.10.30.03.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gvDSNA87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxPq7-0005g9-Vv; Mon, 30 Oct 2023 06:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPq6-0005ds-T0
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:49:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPq5-0002lP-Ag
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mB1ujEtWUOmOeJwT57HbXRVHFW4v0Dxs3+X0YxZJ+mw=;
 b=gvDSNA871COrqNocGPguvZYnPnDu5VBzoy7aT4lh6xIOTU4nJ94V8Nw5P2NwCNVDXuybJW
 lilIvd+Ml07kLIrjcRRofzKDrK4KkhCfda6aROUUEPr37TTDU3EZVSqL1ySJsCe0Apm9Js
 G+2ye2tzc4F6BVT2B05ssAcOyKi2lPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-HAIRiQDhNDaJBU_XRNC7WQ-1; Mon, 30 Oct 2023 06:49:40 -0400
X-MC-Unique: HAIRiQDhNDaJBU_XRNC7WQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C33E101A550;
 Mon, 30 Oct 2023 10:49:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 417D71C060AE;
 Mon, 30 Oct 2023 10:49:38 +0000 (UTC)
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
Subject: [PATCH v7 20/23] arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
Date: Mon, 30 Oct 2023 14:47:51 +0400
Message-ID: <20231030104755.124188-21-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: 2eVXQ3soMdfB

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The Display Port has some strong PIXMAN dependency.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig         | 3 ++-
 hw/display/Kconfig     | 5 +++++
 hw/display/meson.build | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7e68348440..57178bc299 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -451,7 +451,7 @@ config STM32F405_SOC
 config XLNX_ZYNQMP_ARM
     bool
     default y
-    depends on TCG && AARCH64
+    depends on TCG && AARCH64 && PIXMAN
     select AHCI
     select ARM_GIC
     select CADENCE
@@ -463,6 +463,7 @@ config XLNX_ZYNQMP_ARM
     select XILINX_AXI
     select XILINX_SPIPS
     select XLNX_CSU_DMA
+    select XLNX_DISPLAYPORT
     select XLNX_ZYNQMP
     select XLNX_ZDMA
     select USB_DWC3
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 4d8b0cec40..1aafe1923d 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -134,3 +134,8 @@ config MACFB
     bool
     select FRAMEBUFFER
     depends on NUBUS
+
+config XLNX_DISPLAYPORT
+    bool
+    # defaults to "N", enabled by specific boards
+    depends on PIXMAN
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 2b64fd9f9d..9c06aaee20 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -58,7 +58,7 @@ if config_all_devices.has_key('CONFIG_QXL')
 endif
 
 system_ss.add(when: 'CONFIG_DPCD', if_true: files('dpcd.c'))
-system_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dp.c'))
+system_ss.add(when: 'CONFIG_XLNX_DISPLAYPORT', if_true: files('xlnx_dp.c'))
 
 system_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
-- 
2.41.0

