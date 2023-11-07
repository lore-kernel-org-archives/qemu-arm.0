Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp211400ejv;
        Tue, 7 Nov 2023 02:18:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEa/AsN0fElXu5pBnQR8H+GRvcilqy/1XyEzDMBxc39TRmoDdLy2bQBPqVc397eGQUowssS
X-Received: by 2002:a05:620a:2a14:b0:778:9a18:68f6 with SMTP id o20-20020a05620a2a1400b007789a1868f6mr34115262qkp.58.1699352325348;
        Tue, 07 Nov 2023 02:18:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699352325; cv=none;
        d=google.com; s=arc-20160816;
        b=Ak1xoGtFSA4gn6mh/TlYUsheKUNU6ULDrOGITO6+gK1P50vhNMPfl7J7toCSoz8g6G
         WRNYJzKOd4e1En8b0vYSAuIb7fc1pBGiN5JOutwyLbP9lUI0wX6FMIy7NfYe3+dbOdg8
         no3t7lII1EmlDj5LS+z0ewdtfVIFNADFQ5VRpcnMdKdXamlluLdqJplmt2+DAcLpLWFy
         4+1C8U/HuNHX0mOYJ1AhLhwwWV92efQFZXqHQX5jzPCnPEY8gcXS4B9ny1aEKN6Dra1E
         JbNsJ0JqOXV3fi/t9xeM/1qv9sJpQ65h4sLgWX46/Xxo+03q4IKz9TKNDIrrsiUXTWAJ
         51lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hQfRZVe4aWCRcrIFPWGMMVbZE0100phOCEI7lTdBBaM=;
        fh=jCWr8o4gKfVryjAlDChV7jmMrIfhOWUhS6ngY+scWJ0=;
        b=Pn6f6COpuyv0bt748qUobIQ5OCo72lUPUW9akcyBAg03gvgm9ewvXFVCDiy60aFvtf
         lRYqyRaAMcKZK4RCB4ScbKo+qBr1DJouNfXL/Qpaxc7+kDfwRxJIo2L6Xk82pz94+H0w
         AqtyiLJ7NVc3QhJfF0GGiBqMAKP2KAiqEZhPRWFF8i1sN+e1iyUl76FPXBGgBQhgHx+X
         PVgUEVj8y3YFg+PIWbEvZcPFTdlicR/NAdMN+zVFi4cls7or7QpSbMzZ/WyMx8B1OjlQ
         tnv0Jmvj30wJrDQfi+mg65aiJ4zLbkrEKOA+wqCz/48xNbDQLNPzmyFv6IAlbZHG1FbT
         z5SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GfBQlPUT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qc10-20020a05620a654a00b00778b115b7b4si6173326qkn.440.2023.11.07.02.18.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 02:18:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GfBQlPUT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r0J8i-00027E-VZ; Tue, 07 Nov 2023 05:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1r0J8h-0001wb-5x
 for qemu-devel@nongnu.org; Tue, 07 Nov 2023 05:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1r0J8e-0003fa-Vt
 for qemu-devel@nongnu.org; Tue, 07 Nov 2023 05:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699352211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQfRZVe4aWCRcrIFPWGMMVbZE0100phOCEI7lTdBBaM=;
 b=GfBQlPUT42r+36qoyAYlVBMURnop52Ex4RVIXtqgZcueaKw9F+yd3zcCxUedy9hX4VU8V0
 WgYivfiXfZai0/OmX98yGULlVavzUhJXR5RJ4ONm5E6CVEpBuZH5IR8013lj+wGLWFupSr
 EbeVUiUDwzIOw5JZK1Ddc4bqsKl/eio=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-1KB8BR8hNu61Cprmwn6DdA-1; Tue, 07 Nov 2023 05:16:50 -0500
X-MC-Unique: 1KB8BR8hNu61Cprmwn6DdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9B54811E97;
 Tue,  7 Nov 2023 10:16:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFFE81C060AE;
 Tue,  7 Nov 2023 10:16:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL v3 20/25] arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
Date: Tue,  7 Nov 2023 14:15:18 +0400
Message-ID: <20231107101524.2993389-21-marcandre.lureau@redhat.com>
In-Reply-To: <20231107101524.2993389-1-marcandre.lureau@redhat.com>
References: <20231107101524.2993389-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DxXoEE7x2R4Z

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The Display Port has some strong PIXMAN dependency.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig         | 3 ++-
 hw/display/Kconfig     | 5 +++++
 hw/display/meson.build | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e35007ed41..d215a2c729 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -450,7 +450,7 @@ config STM32F405_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
-    default y
+    default y if PIXMAN
     depends on TCG && AARCH64
     select AHCI
     select ARM_GIC
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

