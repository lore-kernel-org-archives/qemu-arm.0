Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6442BCCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:15:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kDs-000531-Qy; Fri, 17 Oct 2025 09:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDX-00044S-OV
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:10:00 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDI-0004cy-MJ
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:59 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-471075c0a18so19726635e9.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706577; x=1761311377; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9xu2jmCHiYAeLROkpD0sdtohOaAgHtlD3k156owbQkw=;
 b=ZmA76biKSvoJL3UgJ+dfQ2Shp4dhMPHDuSrGnp1vrTdJkMK2vi4hyDmmfm8KNoMxad
 Hlh+R9IqGdd4j95sP3kxA+1T9xGdV87zCN4PKRtuDbVP3QV25/ugmh131COD8gbFZ31g
 8ya0Pw+GvhGe45uEjui0oTIGa1kcjqZ0YreIfA6YI54kz88HhwQL9hBfBjuihe/2iwid
 384NnGDYhjTIDOrGPMMTB5KqDXkiDABU70Zm5g+1ZxPvNQqeR8xibhWTasdzolFwVNDE
 oGzEAHVKLRi1jkYyHc11Z7QjUwqEC8VvgKGPDNpxKbEFzAEmJmREbpVYGhyUffhMVeAu
 d+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706577; x=1761311377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9xu2jmCHiYAeLROkpD0sdtohOaAgHtlD3k156owbQkw=;
 b=d05KdJtt5L8qsn3T1MdcIJObA9uRXoUCHepApryNAiyPBpO+8cO50tjdKNsc5pHN4K
 W28oJ8prntszidnUzJSrJaGNoc5mgq7hl0IdEkq3xQI0BJJbv1BLj+FMHHe2yz8RkcNK
 88GXsmbfCmge1Q+51YUFdN9je/GQVoNkHMPmd5ugi8qPex7Bt5DNYsTaeQ1vFws3zNoG
 4bO/QKFQvf+LbsH0G9WFYFGR9ZRymP3n/AmSpoeGdes7I7HF9WIEZA5LArhNpohqcT56
 xkfwQJMTFrUAQNB+hcYx7lDAEyIPU3KUqws1VZ0HgG/4oxrpqzFvcnzPKyT3k1ho7F4f
 Oibw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkdYslAirCchtPXO02P9VbBEyFcrqb8aBDyqiCdIAfHZ7yTypQAZD89eOlXpcs63o8y+9PLM5fTQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywjd08qaXmwCbDoVDCiE+xvR0iaof32Ti2VxIMRFAx2lKtjYp7x
 0wN01TIJZiHcpah8to+zV9NjBk2bBQyEyrl0bf1aYp7Z+6DW6uwlctwudHB1mPLskzw=
X-Gm-Gg: ASbGncsQ1HO2OblQTYuxjNU7HZdROt2XjFNkk1w7aRGNOi0WJX54b3GcwrV83WleeI3
 BB2nbLa6FrQxBrkz0dpkC0JvGhjk/eCwctYVcKocHOyl4twcVRC880/REs82EkPE8wV53KbiwN3
 //b1B9E7Y74ZS7VrgbkIiembjL2XHVkp6ytZB9zySw1gt9PQ5p64D/0EvXIiwfWBcOInIkkClVB
 sVf6+m5z7kgA92ntdlV3GqUv1dblHi8pu4RHPEbZeGy0srai/D/HyOWH6hSoYYQoy165Qh2JLiT
 UhR5oxynGRFjkNcu2VRJSTLb3to2wI4YKqF5VuY4g2Dg2T/v/9O2umFe4UXnD4gs5hQpuLY5Fsq
 98Qfod0LTRX9P8RX79K9ZGvpi0/lkYtzo/A14Zo9qg8F4UKozEaTAwkrLGDWpCLlDhoZiLkj23z
 rFAwKebhtA3IcGhMHwMMheg7IZoljSW9MOMGYBIHwOfpiW1u36/A==
X-Google-Smtp-Source: AGHT+IEwwA66KCv4mItbDA/DleedZpwkTerAkKFdKlPk6+S2ioQzfFLqp1lIjYkHYFtW+Tkquzs6Wg==
X-Received: by 2002:a05:600c:3150:b0:471:114e:58a8 with SMTP id
 5b1f17b1804b1-4711790696fmr28250065e9.25.1760706577011; 
 Fri, 17 Oct 2025 06:09:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47121ed98e9sm7289555e9.3.2025.10.17.06.09.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:09:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/20] hw/arm/virt: Remove deprecated virt-6.2 machine
Date: Fri, 17 Oct 2025 15:08:14 +0200
Message-ID: <20251017130821.58388-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4243da3c87e..d9ec61e7354 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3608,13 +3608,3 @@ static void virt_machine_7_0_options(MachineClass *mc)
     compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
 }
 DEFINE_VIRT_MACHINE(7, 0)
-
-static void virt_machine_6_2_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_7_0_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
-    vmc->no_tcg_lpa2 = true;
-}
-DEFINE_VIRT_MACHINE(6, 2)
-- 
2.51.0


