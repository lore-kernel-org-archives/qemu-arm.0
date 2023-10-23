Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1292433ejb;
        Mon, 23 Oct 2023 04:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC5d9zwoZ1/s4mfBl71NKL5TMkHfV8F5g9cekzgC/5IvR8kHzOg0jcxi9RU8Sr6R+PMxxN
X-Received: by 2002:ac8:5a01:0:b0:418:225d:e9d2 with SMTP id n1-20020ac85a01000000b00418225de9d2mr13086874qta.52.1698060826666;
        Mon, 23 Oct 2023 04:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060826; cv=none;
        d=google.com; s=arc-20160816;
        b=ujkwUCVjMPh5JiaSbBAY7q1o97Kef4cP3hvD6IMwPjzhJikJh+NqoqA1Fu2e1gj5dI
         Iw41jj8D2CQTEbWElPapw2edm05de6+oYzxPM0CRQAUba+UYavPMMJuvkF0ti1OXGk3C
         Wp+xGw+YWp/dHLYfEN+jCZIb0Gep5mJEaQf6mkxpn8CeOmEb95eWSflT4k6QXWPe0E/t
         OrDK1xySKG3SqvZP49T2wcQde2IIKUAd3kHTy/2VpxRFpWoyjEa2xk11b5pSykwZsXZK
         7+d8ZmfwtWvAI2W5bfsYcyUdx+8Hj4C1YjNbu6X9oZLiWhZcrqeFDoxnIO396CQBcxya
         rV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LwmEnIroD1Cx13DLW/Gd68fu8NmVbkhOmY9kyyHLucQ=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=0c8Y80IKQK2EuuwEbk4+b0groYT17Pqcnt95x/ir3PJdnPKLmFN0AtydXFv5fyrpFm
         3/g5ZRn6GUAQX0yZdBCFLUqb/fphZP/IdM83ETC6bl2WVOwReEkNx1Fxv1yQRBgSR3QW
         aI+Lal3CkqrQOxpBzeu5Ri+gEyizjRXR5L5OH1moGYdMk46oKj6t9z4CJgdIi4EVX4uY
         /hZTyQn4Zw3zymqs5Ls/wPAanbohChKfFzWca6YxI9TuAfP7VTIJocvzQXWndF+8/ci+
         7jG4/AJfat0jVCeBadb1pEroGcfrojcxWF31KRt77Tm8r7rLirf2l8j9X3kaRJl4XB/4
         lpqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A7FwfDun;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020ac87c49000000b00418113fb90asi5236655qtv.425.2023.10.23.04.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A7FwfDun;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qutAg-0001SY-Au; Mon, 23 Oct 2023 07:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutAT-00012E-0m
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutAR-0003lW-7z
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LwmEnIroD1Cx13DLW/Gd68fu8NmVbkhOmY9kyyHLucQ=;
 b=A7FwfDunogC2A/CVHYzsHhgDxnCNNVFW1KLo4TNZ7Khn6gkQEsUhoTFWP0rQcZlQRhthJR
 dUF+YAr9xO+iVOul+yDYpSrh/5f0MJx+dKnjos7g4PO6FkuIzXC1Rn94xfvnX2eRr4Z856
 f2q/ELbMpjZhHSe2aNbOIQofj97kls4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-e83JjCQ0Noe4RQKUuMSPyg-1; Mon, 23 Oct 2023 07:32:03 -0400
X-MC-Unique: e83JjCQ0Noe4RQKUuMSPyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12F10185A7AA;
 Mon, 23 Oct 2023 11:32:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DC07503B;
 Mon, 23 Oct 2023 11:32:01 +0000 (UTC)
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
Subject: [PATCH v5 16/19] arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
Date: Mon, 23 Oct 2023 15:30:43 +0400
Message-ID: <20231023113047.2572137-17-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
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
X-TUID: gAAWrY5Qzks+

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

