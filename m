Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E029CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:42:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEN96-00071h-2j; Wed, 07 Oct 2026 04:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEI6L-0001UT-1t
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:14:11 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEI67-0001S2-C1
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:13:45 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c2e40d62e77so142006066b.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 20:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791342758; x=1791947558; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4JrZ7jM3Cirkz5k2sQscGnyc7KzNuKYfGRblsF+5rVQ=;
 b=Ve6SluPB8DthkSdNfP0FrtKRqn1/kjdQ/aolQ1YOPcattEaiYdpIg49dJ4YwAfCPIy
 R+VQdA1V5NKSMFvv3CWXWcHYfYqJ/EPdLNN9hcciFX+4VJM43Zo4AzvpnVARZ+7U2sHV
 mSL/zywtdP/Iz7By/UaptHZREUxp0gUrKah2Zj9Hz4FIOlcw6Nxi0fPld0OqVIHAKtjy
 inF0ODk+mLNl3WQzkLCuXx6pV21j/iscO1qVKqvGpAR0v3ur9OmzmBr6KKfoGLDUcIsf
 6wj1sbRghT+3H/MCFWNzWHUUvhLOzKoe5pt0dzlBmRf4sOj2gJEnVO6zqYlG+3LJDcwT
 xjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791342758; x=1791947558;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4JrZ7jM3Cirkz5k2sQscGnyc7KzNuKYfGRblsF+5rVQ=;
 b=H8AjDxX59dcD7mTcyqb4U7Jf1UL/8/EFGjWCHqMYvklb+oDQGo5JVzpHtBqMVdeAPa
 M0KMKvosldLRyR+F11Fdmxh8e9d41mzW6yVcqddPj1eQwOj2Awqi3ltgeg2OwpggOvWP
 kU50TgaE7sZN0Tt1rQt+ZIvTm12a3uaYNzzGNo87oIbXbosEDPFanJO0fYEIgwvAtBp5
 0zwE2d+aKl+9jl589JgBgspEUMrgqFsUvXNZLfMy6RoxNC5k3Vt91aiUeBHWJX9ncm2O
 JOWLg8DLtC9YhUhGqOIbWX2H+TqnV1nfccXlRqB/x/gmmTnwXoeXOEAGCTfSvyXmvJgx
 DOYg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw74jgScwpVDdNf/M9EuZIcf/zuIhUrALCYRLJD0ba4F5vJeU/IIw67QxkWwaIpsajJvpZ7bOQokg==@nongnu.org
X-Gm-Message-State: AFuF++lZeZuoXRwrJDttdHhR5fxQ8O4BjPKLblG7XD7CKDr90iXBhOsc
 QIZXgpMo7x1Ms5fOI//DlUVD3KWK1cNn+dOLjameK6DHuZLPlue6cuLjCMJVOg==
X-Gm-Gg: AYBFou3pv8PM+8StKo1wmu/tkGDo0k0FoiWeVYnGMam8/vfUi7dEDKktXYU4TpANWyc
 Fy7AoPt4vrnGteEDn9PNCD1iZX2VGhvdpST+hIuYAoamoj4CvegnL8y8FH5/7/P4ThR2nsYdnFv
 pY6X1bpxI5RQV74gTO65lfJ2NWfBrajgnIgV4K2aaAmujZta4zrz/pbF+juLJyUDw5CyQIXIpSW
 dHO5kT4cz48LjtiGjcuEeOuYGPsFnLkKpZ0DEozRgAJvSgm5/v7H/EBnupokBFgd6tGXmexp6Yl
 sHqB3lDHb386UBQAodvGt1nc3SEJY9gKF2pO72Mplt5gqo4aQebQMaQ58FMqrTT50qGHdDA1IeC
 yjuQtFMLsVDnXKEAh1d2kvZzM3RsVQOBYGsmghFd1HK1kclU5zpRnhBOsAoSZt4hJ9qTPxEdd9w
 flb9+2Qwyt3CEXZbldrPxyBzg36tByH72Sg0ODUYuviXqfTD0PlZVBrNB3vIi/Y8kxI+lL/p2is
 PizIMJrB/MifOHtJ9HLeNQJTbBI2C6OJzhnOZQ=
X-Received: by 2002:a05:6000:40df:b0:48c:527e:92e0 with SMTP id
 ffacd0b85a97d-48c6d0ec634mr1664814f8f.8.1791275742958; 
 Tue, 06 Oct 2026 01:35:42 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:42 -0700 (PDT)
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
Subject: [PATCH v4 19/31] Kconfig: Extract config IMX_GPCV2 from config IMX
Date: Tue,  6 Oct 2026 10:34:31 +0200
Message-ID: <20261006083445.30362-20-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
config IMX_GPCV2 to eventually eliminate config IMX.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 2 ++
 hw/intc/Kconfig     | 3 +++
 hw/intc/meson.build | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 030b218eb6..a33f5a46f9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -581,6 +581,7 @@ config FSL_IMX7
     select PCI
     select IMX
     select IMX_FEC
+    select IMX_GPCV2
     select IMX_I2C
     select WDT_IMX2
     select PCI_EXPRESS_DESIGNWARE
@@ -661,6 +662,7 @@ config FSL_IMX6UL
     select IMX
     select IMX6UL_LCDIF
     select IMX_FEC
+    select IMX_GPCV2
     select IMX_I2C
     select IMX_USBPHY
     select WDT_IMX2
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 97355f9df7..98dba7efb8 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -8,6 +8,9 @@ config I8259
 config IMX_AVIC
     bool
 
+config IMX_GPCV2
+    bool
+
 config PL190
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 74d84b8ddc..2ac575095f 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -24,7 +24,7 @@ system_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 system_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 system_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 system_ss.add(when: 'CONFIG_IMX_AVIC', if_true: files('imx_avic.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpcv2.c'))
+system_ss.add(when: 'CONFIG_IMX_GPCV2', if_true: files('imx_gpcv2.c'))
 system_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'), if_false: files('ioapic-stub.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 system_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
-- 
2.56.0


