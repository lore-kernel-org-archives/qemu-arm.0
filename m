Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1114207njk;
        Thu, 17 Apr 2025 16:59:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7ZszeVMMSq+8t+s7qeoYynptqTGxlVnw67m6H4dVQhLV9wy9IU126FeA1/kxf2zBG5aE6hdoB9H92Ig==@linaro.org
X-Google-Smtp-Source: AGHT+IHg/u6lCuRImYjoXYY2h3hR68gK0Nb/pO8enUvW83YbJBAKV5DSHg2yznAn3JkNRCrwL53S
X-Received: by 2002:ac8:5890:0:b0:476:a6bc:a94a with SMTP id d75a77b69052e-47aec3923d9mr12888671cf.8.1744934374223;
        Thu, 17 Apr 2025 16:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744934374; cv=none;
        d=google.com; s=arc-20240605;
        b=lFjNR8GqY05D7aUlaN8enWM5ffSLy+JF7as2EQOiHn7zsiyhAE+eunK36LvOS5Cnk+
         iKSWQqbNKTWDvcG+0LA5eX5fVLby+GJnsAHBkCjbg+vrctnxdTNAVUIJ3hcsr0+mFPna
         ViHX/6B/cGC/DGdkZgL2kOKbZMTovdwYyuVDIHvzmooDdwm7Dj8ZqP/lqaiQqKc0aXXL
         zwbHnZfZ/tMJAhfXN/9+9rNI3nLMs9olI1TDZNF8qnlCsNziHnJOFUXm0VWtEQePefU3
         5gtqOBwnw1Pzm3uH/5c3ZNmX+lnmO/beJzCMgqSrdpw/hqqrCONGBi4xQy12SmhExN46
         Zrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yYW2b9J9rpRFJ7QVGZ2mZ7NVt+Xm7Wy9C2Beg149RFE=;
        fh=dN9O8H84FxS+EDK6AwG7uyW6ZWiRTtVESznxkKuwxKA=;
        b=QV5jfmYkns1OONYIqWNBptOjZ2fY7H0vt1ewJH67FymCyndJGwFDzddItzH2YtEP7C
         +rwoGXF9dnGISCxH25QnFW/Rh7jkLZxwCs5lQqr85/nRcwJBtrB/6SlLVbVcJ3O+UQD1
         cmOFIh5U2Ip//AYtQgWB2qbEPnhrDFwLsqRnvZwAOTJsLTEcj6w3qxuRcT13dAjIDXRz
         XySiw1gSceycrQFMfzHNbNRBM/9D6rSIR274VkOktTKJzC/r1juGvMPC6GVYPCusFCg1
         lhe6+z4aimLpySEM7qfbUr6Uae7YS7bcRUPipymr+o77V3n971P/38ZEeu6e7mV4NA5K
         E7qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gwv5TRxm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9cb6ed2si9039431cf.370.2025.04.17.16.59.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Apr 2025 16:59:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gwv5TRxm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Z8Q-0007Ff-QY; Thu, 17 Apr 2025 19:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z8P-0007EL-IJ
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:59:09 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z8N-00041r-NH
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:59:09 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so828880f8f.3
 for <qemu-arm@nongnu.org>; Thu, 17 Apr 2025 16:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744934346; x=1745539146; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYW2b9J9rpRFJ7QVGZ2mZ7NVt+Xm7Wy9C2Beg149RFE=;
 b=Gwv5TRxm12t5Dg9LE9AnVS0VhVvj0SimlvsP37r1Fgjn9Ce1az2xyoECgV2aiu4TXp
 KvpM7Lpjk3uyjbnCk2n7RSBWI+Rzea5yG1yeGE/HyOnKBCWU9tGIF8Tbz3P2Bdl/FCyk
 GCeL2I2xzgVGAFesX9zh7ZI8fmeM23HJQppBCLpLwIcI5+p9GQ9SKG5VGijYHW+fc6dB
 Fm90vGlNM1Gmq7A/njg17S/z3W50ccByINopmBHa7+dIgY6/Bbm8VsCkMEZ/iEZFFBU6
 L+EvLR/4RGnuJFao6lMzqtAxy4wScXjIw1LwDMDKdZu7obXLWT3zEJgN5zx7AYIVzMLR
 o30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934346; x=1745539146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yYW2b9J9rpRFJ7QVGZ2mZ7NVt+Xm7Wy9C2Beg149RFE=;
 b=WsQ7VDoqj6QEo5y+w9EfG5H/N3J0++LxgMhZ1HndxuJA2HgAMx9m7NHMn/5NgmIdYT
 kiUfGoLEJak/IrBadnqdMY+5X+Dq2rp5TPboYWufipBsMYFtAuXZKxt39LfuC+jlTv+9
 qKOmrCky+JZDT235tIfBcUxiTQSgP3ebk0sc22KKd6P8NVJQfHjNK+En7H1tXaVp/1r/
 WAhlukG6iAmnXBvws+qIYMNbBriLHNTeRw/Tt0vcpfF7o4oGNvHENLwbLNCogHyTKCtO
 Bgik0PHJSd+Of/umovLgbWB+qLS4c2Z2qbbQh+2uOvv76v/23FfP4Np4Gs5oGDE7OQep
 6KeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2c9UmdVFkv3UOStkpHtwo/wsupSLFM1BSxmhK24lDcUm7LQuCgXBL17ftwI99w2q06cViXPrBRw==@nongnu.org
X-Gm-Message-State: AOJu0YyyDc2aSnqBBhBD0Ovt1MwK6K1ui3qpUp61FfHfZfjBG2Z0SJPj
 FUP72eBHEV5NP5YD3fasnrglf2pIqo43AVNj6RLFvPkNznpDKQhBz/5Z5jXG5y0=
X-Gm-Gg: ASbGnctHokrY46rvPUCBiLKmBIIq9TI2NXKK0/5H7C3l2F2URF21PvQDUcwXi86tLf0
 JWfPxnU6gvfPehh8WwrjRmOTBoXYFRA4UarrG72yUf3Mtftlcwig3PXk/KfR2iqScEb6MhgNfXa
 cZppK6klazZjC322ch357qrbHDczpgQriiHcZpEK8FRqOzWlrKr0zzf2DsaWtT6NYFAcSqpdApH
 PdddFf8Gq1dIQlKyuLZHpTQYFzjodakgQcrrG5iVwpBfE3D65zmkCbSGvvKwJu2/Lwi/DZbpoqa
 deTzgzv5CvBurPkiIMKts3lD4S4yAYeRDjKZcKlCrgkwzoXfND/mB8OWaJwm2TFHAVsg8nCevLK
 fa/hpXhGmKdu9hRi1eNAM
X-Received: by 2002:a05:6000:400d:b0:39c:1f19:f0c3 with SMTP id
 ffacd0b85a97d-39efbad3dffmr512039f8f.46.1744934346291; 
 Thu, 17 Apr 2025 16:59:06 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43c018sm1058365f8f.43.2025.04.17.16.59.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Apr 2025 16:59:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Felipe Balbi <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 09/11] hw/arm/musicpal: Define machine as generic QOM type
Date: Fri, 18 Apr 2025 01:58:12 +0200
Message-ID: <20250417235814.98677-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250417235814.98677-1-philmd@linaro.org>
References: <20250417235814.98677-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HmNV05GysXWA

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musicpal.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 48a32c24079..f7c488cd1d6 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1334,8 +1334,10 @@ static void musicpal_init(MachineState *machine)
     arm_load_kernel(cpu, machine, &musicpal_binfo);
 }
 
-static void musicpal_machine_init(MachineClass *mc)
+static void musicpal_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Marvell 88w8618 / MusicPal (ARM926EJ-S)";
     mc->init = musicpal_init;
     mc->ignore_memory_transaction_failures = true;
@@ -1346,8 +1348,6 @@ static void musicpal_machine_init(MachineClass *mc)
     machine_add_audiodev_property(mc);
 }
 
-DEFINE_MACHINE("musicpal", musicpal_machine_init)
-
 static void mv88w8618_wlan_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1375,3 +1375,13 @@ static void musicpal_register_types(void)
 }
 
 type_init(musicpal_register_types)
+
+static const TypeInfo musicpal_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("musicpal"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = musicpal_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(musicpal_types)
-- 
2.47.1

