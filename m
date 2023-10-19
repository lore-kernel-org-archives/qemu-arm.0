Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801850ejb;
        Thu, 19 Oct 2023 14:23:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxpSavV3KUQFZQCixo1NYgVeC+FxidBZO/5VKyMG4E4tksMYwQtv+ymEF89TcwwW2UvsWV
X-Received: by 2002:a05:622a:40f:b0:41c:d41b:1b99 with SMTP id n15-20020a05622a040f00b0041cd41b1b99mr1036146qtx.35.1697750595819;
        Thu, 19 Oct 2023 14:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750595; cv=none;
        d=google.com; s=arc-20160816;
        b=YE0RjIbolZBY9ent+hd9u/DDOmHKTJCbDRNL5Dts2lGilcB8qyD1J2IeX7RLOaDdJ/
         jJsrh1L5NWrj6ioDZ1NOxaT2T3L2+BrvrdwM0/qeVT80NAk1Ysutv1J+3hQOVcNE0i6K
         +DadQaCkuqNtcryXgDqb3KX4A0jhLYG+oTJHXQwoOyurp37XetDEUx0MKBHMXo/py03g
         cAgt6Lnv6qXbkjHG1i6GGMKor0C7o7cWVPc58Db1CSaol1hDSe0zsuLYf9QmXklGwVon
         GCuHJsmnrNCE4KVlfgJHbfEqllwFUEoqbF6Lmu7xvlQpyb6l+mBiHY932b4lZQ07xesp
         xGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mySmSJOrGLyGZadXYNDWy1G5mj7NTLtIFHeDWQ7Xcwk=;
        fh=dmOCqvos1g3r1RzW1CO0kfggl2PD3Dx25NFBbr1xQIo=;
        b=TCac5jvq431Tl0yUl+9HGEUWOQqUCFrUDZzTIzW5VZijPeEUJS1YAZVtWyLa7iWods
         jzduxZuQ1onT/osErFYS5jhMtFGCDpjeaDU2fNP5FYKpe1DSi90TqyBvIcUC8zflF7gD
         tbGoksePZxEEzbVPO59wQZy56Sgdig5Gh7xrmCWqzDfDzsqhiH06GrRU8xfXuqMVE/WK
         I+dUTX7h9W47Nl6aA4ePUN6ywryPxW5hzQMfwI+W373/HCIDdOfvRqP5Q8rMjzGw+Jkr
         0hD8dwqJmwE1gjZMZP2dIxEa33IEVMHDvJDZU9V2SNwpvyR7go8PMpfTs1dwkdpfjYx7
         WYQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Keu3ui6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac85d49000000b00419a4b7aa59si241914qtx.481.2023.10.19.14.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Keu3ui6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaT4-0002sh-Ac; Thu, 19 Oct 2023 17:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaT2-0002i9-Qq
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:22:08 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaT0-0008JE-Vs
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:22:08 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507b96095abso139775e87.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750525; x=1698355325; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mySmSJOrGLyGZadXYNDWy1G5mj7NTLtIFHeDWQ7Xcwk=;
 b=Keu3ui6XR4ZkzkIxVpOkKp0OHMU/DQvHoZx+PdCRjGDYJ9lvajma+Fjz6O25MNnZa8
 OkUP6YRyv5To2FKCwfaPVY2ZX+x0ElOKSEs7001h6k8V6PWQWkKlG/DWgg3YLv47Nv/r
 YCOWuu2ItbOapl+M/OmtYg/Fo4t8u5NbvkhS3HK13zjqpFAeJYW6V5uoLYAXYfAZXd7m
 6yQiRviel52zJ6EuUYKpl3SWiFBnsh4ARomueSocp4sR6rDne8azoy+BJvH7MjmzyCBP
 3K9V9F4pmR6TGRWmWwZCi/2mC5JZKJvn7z4zDvztUa/xqv+7svRJvekRtrxoPqytxR5Y
 fZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750525; x=1698355325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mySmSJOrGLyGZadXYNDWy1G5mj7NTLtIFHeDWQ7Xcwk=;
 b=KDx51mobP+F9EDSvqnpl7KAYJLIjm8A2YSqgmHrWS6i6ZKAAzm5hQ7zNUdUOvknyAO
 SYihMAW7DqMeGgjYbjv68Q2uy2wGadBofur+rMPxJIstGV+Uf5CEj1WmPOs2ZDIEYUYT
 Muyo5/pBp8mdSqVpJArRFZxTRjvPH4XEv1raTDOAW0kK13+DCyZ51VJcG4TbI+TiXC81
 nQJPOhM+HR093kfkTmFYm++xpg3nZkYjspxb6P5FafcCuR+lojofT4dwkfLMDzwxl8FI
 na2HZ45s8Pplxfl6o1hkdaR9d0Dk7Vmd58du/5IHHxuTPMzDLcS8YSj3uH2UEDXGtQjD
 lZKw==
X-Gm-Message-State: AOJu0YxtQepNbfS5Ee6kdrzTndQdSjUkaqpoVci4VaVwrJIVmO4vQHKr
 IxsEYtlecqpuqGsu2ikKXAi6/Q==
X-Received: by 2002:a05:6512:515:b0:507:9a8c:a8fe with SMTP id
 o21-20020a056512051500b005079a8ca8femr2261947lfb.53.1697750525429; 
 Thu, 19 Oct 2023 14:22:05 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 h12-20020adff18c000000b0032d402f816csm213757wro.98.2023.10.19.14.22.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:22:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PULL 34/46] hw/misc/allwinner-dramc: Do not use SysBus API to map
 local MMIO region
Date: Thu, 19 Oct 2023 23:17:59 +0200
Message-ID: <20231019211814.30576-35-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hDYBTjJv/HYS

There is no point in exposing an internal MMIO region via
SysBus and directly mapping it in the very same device.

Just map it without using the SysBus API.

Transformation done using the following coccinelle script:

  @@
  expression sbdev;
  expression index;
  expression addr;
  expression subregion;
  @@
  -    sysbus_init_mmio(sbdev, subregion);
       ... when != sbdev
  -    sysbus_mmio_map(sbdev, index, addr);
  +    memory_region_add_subregion(get_system_memory(),
  +                                addr, subregion);

  @@
  expression priority;
  @@
  -    sysbus_init_mmio(sbdev, subregion);
       ... when != sbdev
  -    sysbus_mmio_map_overlap(sbdev, index, addr, priority);
  +    memory_region_add_subregion_overlap(get_system_memory(),
  +                                        addr,
  +                                        subregion, priority);

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231019071611.98885-5-philmd@linaro.org>
---
 hw/misc/allwinner-r40-dramc.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/misc/allwinner-r40-dramc.c b/hw/misc/allwinner-r40-dramc.c
index 2cc0254a55..3d81ddb2e1 100644
--- a/hw/misc/allwinner-r40-dramc.c
+++ b/hw/misc/allwinner-r40-dramc.c
@@ -414,7 +414,6 @@ static void allwinner_r40_dramc_reset(DeviceState *dev)
 static void allwinner_r40_dramc_realize(DeviceState *dev, Error **errp)
 {
     AwR40DramCtlState *s = AW_R40_DRAMC(dev);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     if (!get_match_ddr(s->ram_size)) {
         error_report("%s: ram-size %u MiB is not supported",
@@ -422,23 +421,23 @@ static void allwinner_r40_dramc_realize(DeviceState *dev, Error **errp)
         exit(1);
     }
 
-    /* R40 support max 2G memory but we only support up to 1G now. index 3 */
+    /* R40 support max 2G memory but we only support up to 1G now. */
     memory_region_init_io(&s->detect_cells, OBJECT(s),
                           &allwinner_r40_detect_ops, s,
                           "DRAMCELLS", 1 * GiB);
-    sysbus_init_mmio(sbd, &s->detect_cells);
-    sysbus_mmio_map_overlap(sbd, 3, s->ram_addr, 10);
+    memory_region_add_subregion_overlap(get_system_memory(), s->ram_addr,
+                                        &s->detect_cells, 10);
     memory_region_set_enabled(&s->detect_cells, false);
 
     /*
      * We only support DRAM size up to 1G now, so prepare a high memory page
-     * after 1G for dualrank detect. index = 4
+     * after 1G for dualrank detect.
      */
     memory_region_init_io(&s->dram_high, OBJECT(s),
                             &allwinner_r40_dualrank_detect_ops, s,
                             "DRAMHIGH", KiB);
-    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->dram_high);
-    sysbus_mmio_map(SYS_BUS_DEVICE(s), 4, s->ram_addr + GiB);
+    memory_region_add_subregion(get_system_memory(), s->ram_addr + GiB,
+                                &s->dram_high);
 }
 
 static void allwinner_r40_dramc_init(Object *obj)
-- 
2.41.0

