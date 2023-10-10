Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp297058ejb;
        Tue, 10 Oct 2023 00:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG77C+sth54IOGi7v8df96Z/7VTXoy3Y4KHKP5mhcZ7zDnhja0W4dSFbhStDw1jM1hhQObH
X-Received: by 2002:a05:622a:1053:b0:412:132d:3e62 with SMTP id f19-20020a05622a105300b00412132d3e62mr21494843qte.5.1696923628784;
        Tue, 10 Oct 2023 00:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923628; cv=none;
        d=google.com; s=arc-20160816;
        b=BNEX5VcqC5qfSrXEmP4MaHw+LI2ZxylxJKLIMwFdwjQbbFNBt1JPQBOddcb/vOzwGO
         kTwb1xPS2mKbyXQTw4lcYtNCpWoyQlp8cMJ6MCvKmlTA9wk2mLbEmosNcb0CEqU4DBcD
         kSCq1g+V+OO/JvphOtps6abzmlIlp+QktjdwlkiCQJCueN3lhwHoc4yiQ0xikSGThxgf
         EAqFzVqQyBt74XGUoA6oBoORlA5jJkwqKanEk4NW4YrXvhYu7nPV97jeaDeWl/e7FH6I
         m5Pa/qFgWQEeffsXR/w0l4tPjITSR0NKg/QqwHEdTx20E5n8Av+vlWVSon1koJzsjhqd
         o7uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/eZ1mJQUZQMMM+HiW565rTWdLBIwZUgzLgf/IQftMcA=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=dvhqzE32a8srZ6/KgjZybxBfP/rXOjWv4VdwLGirvXr2yLfYgXtaBGfZtK4zCRfxkJ
         4nDoQ3P1S78XSrfUnnMBdmYnA+Erp4wDevL66qQyv/hphW/le8YAsAm/ZCzw80f8pLzb
         TdW0XQUnx/he4NiKdV1h7N0D5UfZgDSLoDUZoHAnPcu3GCxRV5SLp8QbcbzdLVL8Wcs/
         gDQyTQ6b5tsx+Dc7IwyjvgyeyiVTm5kE7m0ywbKhYQwSzPM59Gom/SOT34Q8JmVy+v8M
         zCbZPrycWcoeRMON8d+dhcWukF9ZkSceVwxwMxArooRR858d5MKAqd8TIHO62fgwYNUq
         tZKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZiI32gSw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020ac87d85000000b00417b6229cd7si7121700qtd.315.2023.10.10.00.40.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZiI32gSw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq7LV-0002jl-Iu; Tue, 10 Oct 2023 03:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7LI-00025I-MB
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7LE-0001rD-FW
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/eZ1mJQUZQMMM+HiW565rTWdLBIwZUgzLgf/IQftMcA=;
 b=ZiI32gSwG+z1J1sK5O4Qu5jTdMkK3u9eMZH7L/uK5Z328rr6Sp92BkfS/SJawDD/pUdk3/
 1+7WGTUZxcM/593rOl/rtfjgNZi0VDWqcF9eKTyUOOK8D3ZgYLUQCndgoqAXr6napyQeyF
 l5AJ0Js2RHovrX0QGNg1nMuKi2H0J/M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-zwya3xcGMZGhF1-w309gHQ-1; Tue, 10 Oct 2023 03:39:39 -0400
X-MC-Unique: zwya3xcGMZGhF1-w309gHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6F22858281;
 Tue, 10 Oct 2023 07:39:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC08A40C6EC0;
 Tue, 10 Oct 2023 07:39:37 +0000 (UTC)
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
Subject: [PATCH v3 15/18] arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
Date: Tue, 10 Oct 2023 11:38:27 +0400
Message-ID: <20231010073830.606570-16-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-TUID: MuQL1xA/j9B9

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The Display Port has some strong PIXMAN dependency.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
index 05619c6968..14a57703d3 100644
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

