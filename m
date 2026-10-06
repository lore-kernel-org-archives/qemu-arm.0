Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E503CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:06:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENbB-0007bG-PA; Wed, 07 Oct 2026 05:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEKs4-0003CA-Cn
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 02:11:57 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEKrj-00028n-Rp
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 02:11:04 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a16c399641so14394475e9.2
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 23:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791353446; x=1791958246; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=q18CxezF3O0NQZL4J8j8k8FGd9ovRcOXZH6XavOaHP0=;
 b=XGk1dtpnJAXjEygjZI+7v1xB6gEf1E+YOVorLLvEgCpTQQI1ax9gbL3PhxklgbyE8w
 AOwdKl3Ih9ij8eS++9R7YgdWl8gbMO/LgKmFkJPWueRSDUltCK0hEdVUDoKUcA2TBjvT
 zs2fBKkuQE+zHPbHkEPeFodRRnq/TRUL0lPkpLyTztpauBIe9N4spjLriKigaKSTiAbw
 Jx9t2fdwNWkgwkszKw59PbLekFCZUbDfvF3SQYbqJLxmywLrJVHzg38pSavOZSngRGSO
 ZHgli6W/JuDVmh4BQ0Hjuy3MAPZo1jbwRkBkWBeRi+shPlXOkPOrg05A67ICUq3xwCjc
 hzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791353446; x=1791958246;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=q18CxezF3O0NQZL4J8j8k8FGd9ovRcOXZH6XavOaHP0=;
 b=aaYy7PbbA9cKyTmVMPSFkeewnQV0AnXkJaPg2RFYjsDjCU8kFcevd4L4j1LxRDKwJn
 rhznMNPueybdtfyKvaRzbvC3hOa4khOlRD4h/fifjDiaa4CRK+dVyr6CbNOog4SOLuMT
 aeJNBhTdz2TyhHFVtOZsVh++Zubb2StX6cgpiMeSumuAI4oLq7xKSecBl2tFHafasMlO
 h+zsBNJzkKTC9IzA2lfSZ+DkysyFXCEpCyMD8OBaC5SPfPuGuEGn8lIWt5KqFjwsgsFQ
 Q1RqdQXpV11X0qFNBX4/X0SSxmN054NV4k2DrAatZjTsqnFuWbFXhpsK/h9X5xsH+CqU
 tjbg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzG9V2MFpKUq7lWwsz+wRulGLNKu3jbeoLiHTTj1kHnaM9K8ducpkKzHxPXE+uYYmGpRGBr+6moxA==@nongnu.org
X-Gm-Message-State: AFuF++lTPR9q1ohGbdW16yGYZClUX0exxglKXAU6CDDN4ETE6QffWho2
 ZbtaUrjxrPmldd148SyVvaJmdUPIioAokhJ8gLO0NMC+qWwkvyUFb8jb5YsbWA==
X-Gm-Gg: AYBFou3N4k4LKEbEG6dZ7vlwhnDyeT7yy0dKSnbn4DqAgNM03enSiblmyYRDdnPny6M
 tGjrg4T8UYweADhuqUMfuyUx9u38Q9DfNtKAe1k+VAMqmoLfl9IIIdcCWoZZhFljXp2DcfZnn1V
 GG1F+fk/pqgU+Ft+5GGRBQKagNBFVy6H9/8hkS6gqGkAlzBfXwzxe1T2318Eylicz0c5gx8TtV/
 nxUUSNH7iC1Cn1Uel4AyCxM2vjBKZ38cFxhjVm7NY4CTYYCjnn0sIVfTTu092k341z576q/fFtr
 U2kqW9UZs6cuxQ7zCwEPUrtg++/5fq8UTgMU+wTtIoUNrQ7nhBwSZ9PAy88KzE97qIITzpcMs1f
 4TefoszBW0Bbfm4DBg49rueebSzqCCtWPEBBI4EG8CB5eYSjjUlny01yQo8/NHvZfU/b1jYoMbV
 q2HkCMP/f4jpgFgIh01sC9z79nvJulsO/iIt7Nl+7pVt4loV/Sl6bQywmVbsy8U0D+K7jt3vvDm
 THb1ZfnD3/hKo5LuLr3R1nYCXtyRzAHzrZazg==
X-Received: by 2002:a05:6000:430c:b0:48a:f36d:fb57 with SMTP id
 ffacd0b85a97d-48c6d16d3ecmr1121502f8f.18.1791275744671; 
 Tue, 06 Oct 2026 01:35:44 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:43 -0700 (PDT)
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
Subject: [PATCH v4 20/31] Kconfig: Extract config IMX_RNG from config IMX
Date: Tue,  6 Oct 2026 10:34:32 +0200
Message-ID: <20261006083445.30362-21-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x331.google.com
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
config IMX_RNG to eventually eliminate config IMX.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 1 +
 hw/misc/Kconfig     | 3 +++
 hw/misc/meson.build | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a33f5a46f9..2084813e1c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -483,6 +483,7 @@ config FSL_IMX25
     select IMX_AVIC
     select IMX_FEC
     select IMX_I2C
+    select IMX_RNG
     select USB_CHIPIDEA
     select WDT_IMX2
     select SDHCI
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index d1711433ef..3f17d29053 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -94,6 +94,9 @@ config IMX
     select PTIMER
     select SSI
 
+config IMX_RNG
+    bool
+
 config FSL_IMX8MP_ANALOG
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 9790afa104..61e128ab7a 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -62,6 +62,7 @@ system_ss.add(when: 'CONFIG_ECCMEMCTL', if_true: files('eccmemctl.c'))
 system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pmu.c', 'exynos4210_clk.c', 'exynos4210_rng.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX8MP_ANALOG', if_true: files('imx8mp_analog.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX8MP_CCM', if_true: files('imx8mp_ccm.c'))
+system_ss.add(when: 'CONFIG_IMX_RNG', if_true: files('imx_rngc.c'))
 system_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx25_ccm.c',
   'imx31_ccm.c',
@@ -73,7 +74,6 @@ system_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx7_gpr.c',
   'imx7_snvs.c',
   'imx_ccm.c',
-  'imx_rngc.c',
 ))
 system_ss.add(when: 'CONFIG_MAX78000_AES', if_true: files('max78000_aes.c'))
 system_ss.add(when: 'CONFIG_MAX78000_GCR', if_true: files('max78000_gcr.c'))
-- 
2.56.0


