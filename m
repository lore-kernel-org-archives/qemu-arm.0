Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5043CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:38:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENAL-0003x7-01; Wed, 07 Oct 2026 04:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEINb-0003Su-KC
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:31:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEINT-0007I8-E5
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:31:40 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so1206315e9.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 20:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791343882; x=1791948682; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=quIvgnbJMv5vTwzRauO3a7Lqqn6EP9etKReuFzA3ts4=;
 b=K63dA+BLisG1YWH2VJQZfCykofj80VoTjcTVcd1IZZ5CMs69f11RmsiNW2LPe+5i1M
 EyZ+vxhEUsMNGtPLF7DbY9XAhEOthqgab0jnNSqJ/8woN6awAH+RbFpDTf5p4t4Sn5nP
 39RG4hU7kpEEakEMmevYdPwijtMimnHlSzbSnVeg+7Pihe1fycKbpibYayRDQ/a3IIos
 hoiJS+llqmzXO/YinhsxqPJ80aq+1aJ9prTV8/XLY65hhZ2gwQqobhAgITS+JO48dJli
 OviJBKJ6aCLaK1CF8mYadslB6ET+eES5Lwyc6YFodusdwSPpLqmtZVQie6jmnAKPLCeX
 6Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791343882; x=1791948682;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=quIvgnbJMv5vTwzRauO3a7Lqqn6EP9etKReuFzA3ts4=;
 b=i7YATywXBy37Ya8XeUOTD5Dfk8KwTDirmFhKEc13y+cvbifZcKzfnxQ9cR2Q45Pt4h
 XSWkfA6hI56gF5H/NnEEKQ+qM1hoMwqORh84rWDUKZKy4UzOQ7vhhlROVaNhN4hRenfd
 sjqmqGQ/3JJ31lrjhrML5nBpYsbm/mnfyd4zTkgqgDhixLTdB5GyHTpCqAARyFYQhSe7
 0uWA7Q9FUzu+NDKJ3giCdA7ZJxApVvyKUG7JtHyobQUqIeogNwVdpYY87UrMkPo/EOtO
 y47wIfUj7Qnwz0XMb72KxzIEjXsw+iWRMHA1dsFniAkeIu1rMtpjYj2VB413/MFC3c/5
 J5OA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4KPcIqAxjUBe+rfOSayCBC3xXoSZGLzyhFDS3rek7Cvdsu3I3yfZESjPaGIZWzFwvLu5o5+tk0g==@nongnu.org
X-Gm-Message-State: AFuF++mB6idCQv+k78IijpiiZOevGBiS9k4ZBkkGu72ea0J3TdAPo/vl
 YWSfrkeRmC85Gboc2ywNpD2DsYA7aTRpoD3P394TJF5lvefFSKkPi+tzXZ6BOA==
X-Gm-Gg: AYBFou13oEr3ZLumlIG4rQY2jCUqmmtZOhwXK+VmfbNBjIrdP7egNX4VWnbC+wykmF0
 D1llluautFoY7Xj3pwTtTBPT8nbQoVtMQfc4exq4KWjmoKGDACB4LOV3fykolBlAf9+Fp+ylAaA
 2Ds3hzuOITIgrbb2pkkYxQRf9VZPKPzdEsTcjnmcZ3KijV2nrUdYzPoNqhRd9c4lih+MRYUz9jL
 eeKcwrmWew3dX+KnvrNMR0GkgVBpncfvnsihSPhIVgRh3IOsl1Tv+Ohn2DqOSHh50WTZ2qHYMqf
 vQZq10Fc7oEdjDZgNRcwk1b3rblVhJWDp3yl188cyt4ykYV/dof5mBDlbTQWIUGIPlJ07AjF30J
 V5JSOpmXMUSQt7Hhol3HZSLbG1XmX+a/ERALf5YXNPJB4qOs582fpdEQ7s4hP3KZfzBJu5VUPcs
 B8DQIu2ttRe0KdpI3Yq8oZCNQPFPwcGJSSKWK4v3l3cgUqZUncqnkCRV8UVPtC+ZhOmHYTrJLaN
 hfL5i/mmXSD++BRWHnuYTN1KjQOY8ii/WPUURTL8UCXMK0l
X-Received: by 2002:a05:6000:4210:b0:48c:571a:a1aa with SMTP id
 ffacd0b85a97d-48c6d16d96fmr1412559f8f.19.1791275741864; 
 Tue, 06 Oct 2026 01:35:41 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:41 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 18/31] Kconfig: Extract config IMX_AVIC from config IMX
Date: Tue,  6 Oct 2026 10:34:30 +0200
Message-ID: <20261006083445.30362-19-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Over time, QEMU has grown a number of i.MX boards and the monolithic
config IMX drags in unneeded dependencies into each SoC model. Extract
config IMX_AVIC to eventually eliminate config IMX.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 2 ++
 hw/intc/Kconfig     | 3 +++
 hw/intc/meson.build | 3 ++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4445f16f45..030b218eb6 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -480,6 +480,7 @@ config FSL_IMX25
     depends on TCG && ARM
     imply I2C_DEVICES
     select IMX
+    select IMX_AVIC
     select IMX_FEC
     select IMX_I2C
     select USB_CHIPIDEA
@@ -493,6 +494,7 @@ config FSL_IMX31
     imply I2C_DEVICES
     select SERIAL_MM
     select IMX
+    select IMX_AVIC
     select IMX_I2C
     select WDT_IMX2
     select LAN9118
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 05e697967d..97355f9df7 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -5,6 +5,9 @@ config I8259
     bool
     select ISA_BUS
 
+config IMX_AVIC
+    bool
+
 config PL190
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 0620b0792a..74d84b8ddc 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -23,7 +23,8 @@ system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos
 system_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 system_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 system_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
+system_ss.add(when: 'CONFIG_IMX_AVIC', if_true: files('imx_avic.c'))
+system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpcv2.c'))
 system_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'), if_false: files('ioapic-stub.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 system_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
-- 
2.56.0


