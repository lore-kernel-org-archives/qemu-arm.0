Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D08CCA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:39:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENA2-0001na-7L; Wed, 07 Oct 2026 04:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEIGn-0002co-6Z
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:24:43 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEIGi-0004ul-V2
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:24:40 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c2e5d08214dso521319766b.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 20:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791343474; x=1791948274; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v1hlWCjEXq2Rpv8CcWewbOeohwMMSFMs5Fi76JDaHOM=;
 b=dPb8P7K2qZXBbSGiu4CxNyK6BYBZjCE23z8C5GR1nqge20adXR2UtgVfUgyvSl9InW
 AxOs7jEIbjQ+YGO8K2ZYwzwvdegGwQq/ZwkpC5dalrvmT4wpUdFJ10bE5yeYjKiXM+Fh
 /1objW0xQqIQH/B0w0ZsYnz9zuCYlFSZxQubuAGTbHE/TU6+A+vj7oVIz5dLetdAv9nS
 23ZYRdYbYZlwaoYDWrXNo/p5vCcd6rp4Y58maDhgAjvlC4LuUT+DayyxAXgX/odfAx7U
 8vepri3H211W5qWqyOd6Fvenz4szvUbER0KfNg+Czm8k6BPas2Qgfg/IgHu5PxTBI2n2
 u9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791343474; x=1791948274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=v1hlWCjEXq2Rpv8CcWewbOeohwMMSFMs5Fi76JDaHOM=;
 b=rQM7ngM84LdLoI+Iw4JorZns7eYronRCiZX6tu07D3KmlOU3bQMdu2BTfyr6RlHONQ
 a9HM/Ts1/5Wut/CRel2DDRRFY1/z4ehCWrVpxXc3Xva071/BZgbK3hV+BUFmSTs9rOx9
 jfQ1tbgjdIrN85P8wDZZQcN4X2jpGFKhjFYwefcxJ7RrBX1Q6SNb7D7BqnYjdCHesTMK
 Zmzr60Z0V5iQWbENqMj3cTns96oD+M/5RrWrnQlgKDuyaBHV9EQRwggkiHALLjLlosnM
 KrYNwn5iA+kT/FbROzVIi43TkVYUXXcRoGbbVZuN2+4Yn7k7DxZHDNCc/I1IT4DbnIqL
 4arA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwPMfGGc3XTzQJIIeuuCxg8mVkPpUbe4EJhqXmeM3IeDWD91UvSnjCoSyNP+NN3RCMKOu9MJJgrcw==@nongnu.org
X-Gm-Message-State: AFuF++n4wokkIu6PfiTMD8BMk0wurYzaA/hoSDHb5f7aK9yk0CWFP+Bo
 rTOcy79Crq4GL9xlpLrNa7mIl/Jc4f+RKJZ2EUfCx+Hpl0mCH86ANOfYnZcudg==
X-Gm-Gg: AYBFou0gUCpwSaT8yAl2FqJd86yKur0p8NiCC3zj1r3Vb5IMqfsY25if26R6nGllnaD
 iTNvTkSaP/zNdEZ7thsxyJPp4mnoXt3AWSEyDQjYOai9fYHpiCGVC4Fm8NNka9DCQj+4SWPW1cA
 v5hnVbbZXnITRD9O227GA5g4lBOEBokTPZBGHHwsTLof7l9n7AUEu2mRDG0GpA97QDvLMea4DHb
 W319dxMwpEm4tqJ5pakz7ik6CzPPfTB6behqlmRq1RyZ/e2S9qrXybQbVPoczIMXevd4fcsNmdS
 YdxYwMEH6L+LpbO/VfH3lmvE6QUiDAhIsQcVKp02HvpgBED630VDEqiGHAQ9lhyk7N1neCOYcPz
 IiFexmRp/1MJ2BkpcK86sVvFHcbYPziyxBTLPoSS2xS20kkbG1A0koZp+H+m7CT2q8RVq+cyWVR
 inctgTgzLj5NwWjnul9rOLPpkgxl7683BhTkrNejNrkmwokDxTgdqCHFsyPkQsvgyKJ8hr82fqL
 btXVf9ZO2h/u1c3mNkcM4GjADgr547U179EVfdqaIu+FGtT
X-Received: by 2002:a5d:5f09:0:b0:48a:f464:2cc5 with SMTP id
 ffacd0b85a97d-48c4800d152mr18207837f8f.37.1791275748380; 
 Tue, 06 Oct 2026 01:35:48 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:47 -0700 (PDT)
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
Subject: [PATCH v4 23/31] Kconfig: Extract config FSL_IMX7_SNVS from config IMX
Date: Tue,  6 Oct 2026 10:34:35 +0200
Message-ID: <20261006083445.30362-24-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
config FSL_IMX7_SNVS to eventually eliminate config IMX.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 5 +++++
 hw/misc/Kconfig     | 3 +++
 hw/misc/meson.build | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index edd3bf0dc9..8d857d8bd1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -506,6 +506,7 @@ config FSL_IMX6
     imply I2C_DEVICES
     select A9MPCORE
     select FSL_IMX6_SRC
+    select FSL_IMX7_SNVS
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -581,6 +582,7 @@ config FSL_IMX7
     imply I2C_DEVICES
     select A15MPCORE
     select FSL_IMX7_GPR
+    select FSL_IMX7_SNVS
     select FSL_IMX7_SRC
     select PCI
     select IMX
@@ -600,6 +602,7 @@ config FSL_IMX8MP
     imply PCI_DEVICES
     select ARM_GIC
     select CAN_FLEXCAN
+    select FSL_IMX7_SNVS
     select FSL_IMX8MP_ANALOG
     select FSL_IMX8MP_CCM
     select IMX
@@ -625,6 +628,7 @@ config FSL_IMX8MM
     imply PCI_DEVICES
     imply I2C_DEVICES
     select ARM_GIC
+    select FSL_IMX7_SNVS
     select FSL_IMX8MP_ANALOG
     select FSL_IMX8MP_CCM
     select IMX
@@ -664,6 +668,7 @@ config FSL_IMX6UL
     imply I2C_DEVICES
     select A15MPCORE
     select FSL_IMX6_SRC
+    select FSL_IMX7_SNVS
     select IMX
     select IMX6UL_LCDIF
     select IMX_FEC
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 193a6b5f56..4d47de6a02 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -103,6 +103,9 @@ config FSL_IMX6_SRC
 config FSL_IMX7_GPR
     bool
 
+config FSL_IMX7_SNVS
+    bool
+
 config FSL_IMX7_SRC
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 477fbd60fa..48c5c20455 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -62,6 +62,7 @@ system_ss.add(when: 'CONFIG_ECCMEMCTL', if_true: files('eccmemctl.c'))
 system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pmu.c', 'exynos4210_clk.c', 'exynos4210_rng.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX6_SRC', if_true: files('imx6_src.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX7_GPR', if_true: files('imx7_gpr.c'))
+system_ss.add(when: 'CONFIG_FSL_IMX7_SNVS', if_true: files('imx7_snvs.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX7_SRC', if_true: files('imx7_src.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX8MP_ANALOG', if_true: files('imx8mp_analog.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX8MP_CCM', if_true: files('imx8mp_ccm.c'))
@@ -72,7 +73,6 @@ system_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx6_ccm.c',
   'imx6ul_ccm.c',
   'imx7_ccm.c',
-  'imx7_snvs.c',
   'imx_ccm.c',
 ))
 system_ss.add(when: 'CONFIG_MAX78000_AES', if_true: files('max78000_aes.c'))
-- 
2.56.0


