Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp551191njc;
        Wed, 12 Mar 2025 14:27:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcd6pt7nFilFqW6OHsXfVcvsww0PhO0/nmgcRXocN+T7mLdy9nF1dfwO2X5e1ZbS7K+nk1a8Bw7KgKDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGL7JL8qqqacNhPmnqrsOhZL2hrp/k7391Nf9u2iJaozVEDqFumsI0QV5iLUsczuM7x4iB7
X-Received: by 2002:a05:6214:76c:b0:6e8:f470:2b11 with SMTP id 6a1803df08f44-6e9006519d9mr340941096d6.23.1741814834751;
        Wed, 12 Mar 2025 14:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741814834; cv=none;
        d=google.com; s=arc-20240605;
        b=QOpPc+mzH+7ChpzyDzJ5aL7T2b+nEcFUDSHSVJdkHi9HBVk/VnYcBKGrgRHyfloiSG
         AB8URIbYxd1oPurw3cGDjWqxtpT0HHaN1xd4ukTBxe6GTrKits8rCaUp7RqQpi3vlauf
         5ZddRdM5pdaC7y6ZLz2qFiY2X7CHtCLkEEoUy/ZgeU5lIGxdrkBOqRHZJ46DDZgCMj6p
         LGATRleDltW/0IHeVjiRKgTQFyIuIC9tfRqGexvfarW3YZF4EgrTpuMufCgFk7qdTRWU
         vp5V0TX5S+/XusYrihIgiKlMx8U0prhit6OL0rmKM4b3GzommZMBagrWZrT0PZt+YwSh
         RrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uOqb8zOa9Um9cZYXPSgdJyu+uX2T6VsrvFJJEhBaw1g=;
        fh=ZNTcRDeAzjHOfUsvvhtmg9snZE7DYt5tRmjS+X4zz08=;
        b=K0QX0RcPlm4WeOa3FBdN85tq6V9UmG01jxBluoyTwJc2iIAWbpa2untlhnDD6Vv592
         hr8brbXMk/NL86ur3HjOrVTi65D9EzqglSXqvc7Aryhwm/RnlW1Ib6ecBdHVg3ZZ1BIO
         xGFU3bNh0dLde11iPPzCjeT9CBATYTT8wr2U3gm1L0DYsmdCK7xL7U/hifYj9n9MvdfM
         bn+drACl9ORodafRpeVZeAFZRQwJwV53GC/W2mLNpwK+ihmZ+fdosr4d5gi2icbLWmx8
         U80o+xG9pL1gEFExq3PcT2bwwNCzavNF5ou7WxZIPblMCe1oNm3SV9U7LdtaDWz8of+P
         eoRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FtQnlDpG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7175ec3si142891746d6.355.2025.03.12.14.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 14:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FtQnlDpG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsTax-0003KB-9l; Wed, 12 Mar 2025 17:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tsTau-0003Ig-DX; Wed, 12 Mar 2025 17:26:28 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tsTas-0002in-BX; Wed, 12 Mar 2025 17:26:28 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e5491eb379so343760a12.3; 
 Wed, 12 Mar 2025 14:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741814783; x=1742419583; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uOqb8zOa9Um9cZYXPSgdJyu+uX2T6VsrvFJJEhBaw1g=;
 b=FtQnlDpGOXahqRRHbLQDY1MtTy9BtTDWwsMP3M3S2p4U3fIOd1Gpt3ez+UbDE9PEyX
 nTTEtb41uC9+0EDs83eMzLwpj2Pt322QhrvPl+Wz0XcC3kRA4lAvY68iiHLdf+1m4w0r
 riIBG2oekHvAONoq+gKwTRrrQcwJsp2l4q8iXfHYh1O0oDTvxVc/Omf9rsO4lLu1S2k1
 dh94RXxJHWr9BWatXd3VUeyUwZHubd6wv4hL99fYsmystEL5nw9EjM6FFcHEORVuyeum
 cFQCvXqq7B41APW+i6teD+1awL21BvzZTzv49zhUmU0OIYHUbj33QdiTc9ymSFJ4I7J0
 QKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814783; x=1742419583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uOqb8zOa9Um9cZYXPSgdJyu+uX2T6VsrvFJJEhBaw1g=;
 b=g0K3ow806lgBs3Vf33+n96orC+PHLZcoOgKR7IR1vmdBwdLd5tlfTF1Z5nYy7d5YP8
 uODGFm9I1pFmYRGft8qD9Cag151Ke0+j2TJ7imBD2u3MNxy4DuWgYdtbzKkcB2DqAJzW
 P1ppd/Oldd25AsKT22d5E9X4OnIVeyPkwt+1cjR5Z+lQhy5IJfo90FU55RegulxB4BmH
 UjMtqtTr9AU5KAXKT8ggBfw2dOm9xLv/gW2RZSil0Se0yjYBE1rj386zLfxyWio8g2S4
 bcfEI3jfSfzyrsuXTi3N9P/5Kk5TgKGfcxCFD0hMBLKxw2wfkyPZhv527sJGWKf7j4JH
 V1BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi0eqY2jN5ALgPhyT5F2y0XG/qoHvN8VpK2wLPycFr2V88YPaMr9hie+pPh/EIQMmNci7OZvdGzQ==@nongnu.org
X-Gm-Message-State: AOJu0YxGr7jDq4Ut1bhNOjECboS8DP7TlNzQMvo9H83BBkzMTfQh73r1
 ho1yw+s9xXLOt13pQPWSbD77HN9nm7K+dOEENzgF1YtnLqFeBxmMkIr7LQ==
X-Gm-Gg: ASbGncu0+fQwGumtKum4aEc06BpTOmf5Uzn6c9Ov5X3MP3NEwnGUGv4IzgLNim9EBY7
 r5av0jjnc2F1prGciuvFXqwLLiGGMJHPfNcteTQbkPrUpjlUCC9mRfhTUsF/hvB8MN53182z06a
 fTccb2Kjp8+P35XY/tTpAfLX7F+T6LIwfj2pHXOpzxt6obG84mAwu/wWtsg1OeWPLbA6j5oYqS9
 4e7of9b1u/btJh7+AIDkMho/xF5rMoomvSSwfGd64G9PbIgZuUVLETgBFNVRP/3EaUcxLa08U+K
 buvdtGkLImyEU2a7HhZg8JOKDRHThQ8D3mGZBBfIJW18eecOeFd6P7DzsX0abEt+TKw7N+q8YbC
 3IQe4XL9td2ivobNDpjsTscuNx1izZqCDe8Kke/P1652e4/UnDHHUuq3rN89KpnqsQAd8cujzeH
 c=
X-Received: by 2002:a05:6402:2750:b0:5e4:d229:ad3d with SMTP id
 4fb4d7f45d1cf-5e5e2319e1dmr33991556a12.16.1741814782890; 
 Wed, 12 Mar 2025 14:26:22 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2c4e-b100-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2c4e:b100:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c768d1d8sm10024540a12.67.2025.03.12.14.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:26:22 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/2] hw/arm/fsl-imx8mp: Make SoC not user-creatable,
 derive from TYPE_SYS_BUS_DEVICE
Date: Wed, 12 Mar 2025 22:26:09 +0100
Message-ID: <20250312212611.51667-2-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312212611.51667-1-shentey@gmail.com>
References: <20250312212611.51667-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1DIjWJsVJsyJ

Fixes a crash when creating the SoC object on the command line:

  $ ./qemu-system-aarch64  -M virt -device fsl-imx8mp
  **
  ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread: assertion failed:
  (n < tcg_max_ctxs)
  Bail out! ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread:
  assertion failed: (n < tcg_max_ctxs)
  Aborted (core dumped)

Furthermore, the SoC object should be derived from TYPE_SYS_BUS_DEVICE such that
it gets properly reset.

Fixes: a4eefc69b237 "hw/arm: Add i.MX 8M Plus EVK board"
Reported-by: Thomas Huth <thuth@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/arm/fsl-imx8mp.h | 3 ++-
 hw/arm/fsl-imx8mp.c         | 4 +++-
 hw/arm/imx8mp-evk.c         | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/fsl-imx8mp.h b/include/hw/arm/fsl-imx8mp.h
index bc97fc416e..22fdc0d67c 100644
--- a/include/hw/arm/fsl-imx8mp.h
+++ b/include/hw/arm/fsl-imx8mp.h
@@ -26,6 +26,7 @@
 #include "hw/timer/imx_gpt.h"
 #include "hw/usb/hcd-dwc3.h"
 #include "hw/watchdog/wdt_imx2.h"
+#include "hw/sysbus.h"
 #include "qom/object.h"
 #include "qemu/units.h"
 
@@ -49,7 +50,7 @@ enum FslImx8mpConfiguration {
 };
 
 struct FslImx8mpState {
-    DeviceState    parent_obj;
+    SysBusDevice   parent_obj;
 
     ARMCPU             cpu[FSL_IMX8MP_NUM_CPUS];
     GICv3State         gic;
diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 1ea98e1463..9133d49383 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -698,13 +698,15 @@ static void fsl_imx8mp_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, fsl_imx8mp_properties);
     dc->realize = fsl_imx8mp_realize;
 
+    /* Reason: SoC can only be instantiated from a board */
+    dc->user_creatable = false;
     dc->desc = "i.MX 8M Plus SoC";
 }
 
 static const TypeInfo fsl_imx8mp_types[] = {
     {
         .name = TYPE_FSL_IMX8MP,
-        .parent = TYPE_DEVICE,
+        .parent = TYPE_SYS_BUS_DEVICE,
         .instance_size = sizeof(FslImx8mpState),
         .instance_init = fsl_imx8mp_init,
         .class_init = fsl_imx8mp_class_init,
diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index e1a7892fd7..f17d5db466 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -37,7 +37,7 @@ static void imx8mp_evk_init(MachineState *machine)
     s = FSL_IMX8MP(object_new(TYPE_FSL_IMX8MP));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
     object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
-    qdev_realize(DEVICE(s), NULL, &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX8MP_RAM_START,
                                 machine->ram);
-- 
2.48.1

