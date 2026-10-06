Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68888CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:10:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMiL-000108-MY; Wed, 07 Oct 2026 04:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEGqt-0007Pw-1c
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:53:58 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEGqh-0002kZ-TM
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:53:45 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6afb793964eso2075074a12.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 18:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791337820; x=1791942620; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tmb1LvWJuEGSfnKPDPWmN7ZvXQwtZpUegBkNdwPgjrQ=;
 b=OF19BMemgFIZObDmBxwibCfU7PB6m62vJB6L3/1gQj559hAV24tUD7STGJh3KB9DIk
 y/SbGPG6vdXC3ry8JMTeeyU0i/yhC56eREwBV6OSVqHu2ZO1QoK2oifHLXsyk3t3MGL6
 tet0lwrG4oHQ6pajm4Rd3SAS4m86/mXeQGh8kzGTsDy+ZnZ48Iq3wtokVoLLvJn3lPa4
 lVoETpvFivtP+fvHdxQT3kVQ0TmAb8aGHjIZ86jZ+SxYlyhGDP75QK6aI6QmUiy54zFM
 3L2JEPm0nlcEzfQHdzAbWb+0jHz1lh9r0205bN6u1XQxKhPDo7uQCPQHttTJFFTEyGRi
 fFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791337820; x=1791942620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tmb1LvWJuEGSfnKPDPWmN7ZvXQwtZpUegBkNdwPgjrQ=;
 b=Hz0ZEASXBcgGk7Y63y6Ernjd8lRl4YQ1eVX1mW9QycPpURnl7Z3rn1scfNFgpg/YHr
 z0p9uAmr7BVwpcgYF4+Z/N0wNZ/60Y+7RZtCnI43lbHWRDpwoJ9MpjeldH++NPhveKz5
 sNG3Cuein0RtUuhrWaT4dxKHIIUEnKBVu9W1tVR40lt1VP9uxy4ihrrmWgrmD2vgYgBj
 zuqjIxED44LKoMbCDfQr1HK6sv6Uqk3pGiLGaVh0oDKTsjBaZ6gSnV8HXxQcHFw10dZh
 6Hwj1bU0e/xaM/I4bYEyekKYH7zy4VXBJIkBedrRR02B7BGWkX3zW2lV+KNJux2xzMUX
 mJbQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNXlOcbHUxvANvCQlPkod0HwHQKy1Pw09UxFHW4bcKqX+4gC8kcExouGEQIkdOTgYIOxbZELbMeg==@nongnu.org
X-Gm-Message-State: AFuF++kKqWflr7yWRY+OXIZRGqb/cuk7UKnuhdsPmKcHNea4DUrhtuF6
 K9uZ7AMAyaBAd6J8EwM5sfhwhJImn9NJtazqJTslemmwoMm242n4tJb67tFBzQ==
X-Gm-Gg: AYBFou1ZPWXzaHbBpajyqjYNHMCBZchr3dy5LahgmwLMAam9GbkCk8UlaYkue9MagVb
 aKYHNAOm6nGMpDPpb0yIDasYPTmYovbj1YQpbgDqegPxKsKdC6NmvN9W3JNJddr40CbzKz537zZ
 eOEHMXaHR9BC4OGlrpH0vOut/gXwCG8qCeOAxlgfy0r064g7ZvCEJ7/K2Uv5XXWdhGzmyPe5R1V
 3Gdk+ViX61oMdgw2iboNGxB3Q51NT4Rz6cPxumqKdQW7cWyVyAl5mGgxsFbeoFTT3T/5Fk81A2j
 pmX8PlsK+CbvcUc5h8SI8dnZ4aksKHqyU8cZQ3A3/0KIDWgO0nZYP+on5WTBHmgO+WfAgqlH26w
 LF82Tvq2zUa0PnMg5C9Lh3W24P4fB0FWP7+nzL0svTJNAJS2eIMA/9Z+xgQvfNIksW3AW79VEtD
 Rcsej3JcijLtINTSQSyet9f+7gJcDdo7y4Elf4JX8Qva+DnOlVStLRdZvCKLf7/LXBAkuYjoYCg
 7EjcVuyME3KmJuAD0EW0u2FfQfrXhXKYaO5N4iiqv3foL2J
X-Received: by 2002:a5d:6f0a:0:b0:48c:4ca2:6218 with SMTP id
 ffacd0b85a97d-48c6d177135mr1221944f8f.27.1791275737800; 
 Tue, 06 Oct 2026 01:35:37 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:37 -0700 (PDT)
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
Subject: [PATCH v4 15/31] hw/arm/fsl-imx6ul: Derive from TYPE_SYS_BUS_DEVICE
Date: Tue,  6 Oct 2026 10:34:27 +0200
Message-ID: <20261006083445.30362-16-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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

Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
machine reset.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/arm/fsl-imx6ul.h | 5 ++---
 hw/arm/fsl-imx6ul.c         | 4 +---
 hw/arm/mcimx6ul-evk.c       | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 6205fe6b77..9ae0488990 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -18,6 +18,7 @@
 #define FSL_IMX6UL_H
 
 #include "hw/cpu/a15mpcore.h"
+#include "hw/core/sysbus.h"
 #include "hw/misc/imx6ul_ccm.h"
 #include "hw/misc/imx6_src.h"
 #include "hw/misc/imx7_snvs.h"
@@ -64,10 +65,8 @@ enum FslIMX6ULConfiguration {
 };
 
 struct FslIMX6ULState {
-    /*< private >*/
-    DeviceState    parent_obj;
+    SysBusDevice   parent_obj;
 
-    /*< public >*/
     ARMCPU             cpu;
     A15MPPrivState     a7mpcore;
     IMXGPTState        gpt[FSL_IMX6UL_NUM_GPTS];
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 1863558a0d..84451c9909 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -730,13 +730,11 @@ static void fsl_imx6ul_class_init(ObjectClass *oc, const void *data)
     device_class_set_props(dc, fsl_imx6ul_properties);
     dc->realize = fsl_imx6ul_realize;
     dc->desc = "i.MX6UL SOC";
-    /* Reason: Uses serial_hds and nd_table in realize() directly */
-    dc->user_creatable = false;
 }
 
 static const TypeInfo fsl_imx6ul_type_info = {
     .name = TYPE_FSL_IMX6UL,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(FslIMX6ULState),
     .instance_init = fsl_imx6ul_init,
     .class_init = fsl_imx6ul_class_init,
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 4964cb9345..53d221b4a9 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -44,7 +44,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
     object_property_set_uint(OBJECT(s), "fec2-phy-num", 1, &error_fatal);
     object_property_set_bool(OBJECT(s), "fec1-phy-connected", false,
                              &error_fatal);
-    qdev_realize(DEVICE(s), NULL, &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6UL_MMDC_ADDR,
                                 machine->ram);
-- 
2.56.0


