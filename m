Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4242316lfi;
        Mon, 6 Apr 2020 10:54:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypJuO+rl279V214GTKaJrQHN+gEAZ1e6yI4ej7mQ5zhh0ntc0n4Q0H5n15LQmVCKAqz/ipVz
X-Received: by 2002:a37:bc47:: with SMTP id m68mr22990699qkf.8.1586195692240;
        Mon, 06 Apr 2020 10:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586195692; cv=none;
        d=google.com; s=arc-20160816;
        b=MiUo+9cSJmcGfmBTr7QFoHz42aiLAJ/LtQCsKBW0RMiGAdZezKP3TKGmHrZch/7QWA
         GN5Cokqn5KVqTrOmURj4ue0JeSbJn3OsPo7Edu/eCSuGGUD2t18yROizh/GgAsjes3CC
         kq6MsBKu9yo5zIS+qNY9AeDoM0Mw9ujvbLt/yMAuSYqkEN3q2MmBNr9dFbwJlGjywYFg
         J8vbJmgtjbo/2bm3X8m7Wfo500ByxZ/i/tDFVXclj7y71ukDvUMQXSj4S04jz4kskOOU
         M5O7cvleVu3NoX/DUqZ12hnbiP53aOz6Bcos/dt0UJPRbq8/hSjXecLwxe37dEkJcKLN
         n0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3C5u9DrXZj6rRyHI74cwCLmjedB/NXARv4QiTEDtzdw=;
        b=C9IQHB4SbPevRJpHsC5xPskWPnXhPT8uWj48YY+zVI1keT7aidEAJl4C+AN+2cwjV5
         MrpjfjLWJVKTFGWhdB6lDHU3MqsHFPUlxq+WPFZ/jZxbZc5Gl5p63ZniOxtx4Azu5z1i
         HRDbg6WZWB2cUcg5ATX8sNynb4Zknvq1KPetDHgEmX2hJNWAr0yBQYOlPv8QC6WZcnOY
         /C+nky49eSZtBff1WsT3bbYZ5JclKallO69EKbfGNRQf+/uflw14fRfyltd2QU5kSql+
         BJMEyhe3BcsRGXD0jllMndFVRjNlgUIbl713TDqJ5YQqrN/RPsp+yrIwwPuL4WnpZLOS
         lqAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BzmpXXpW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v27si198370qth.154.2020.04.06.10.54.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 10:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BzmpXXpW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLVxT-0005RG-Lt
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 13:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqt-0001gR-Vs
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqs-0001sc-IB
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:03 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37326)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqr-0001ng-Bi; Mon, 06 Apr 2020 13:48:02 -0400
Received: by mail-wr1-x443.google.com with SMTP id w10so513991wrm.4;
 Mon, 06 Apr 2020 10:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3C5u9DrXZj6rRyHI74cwCLmjedB/NXARv4QiTEDtzdw=;
 b=BzmpXXpW7EEA5jqIDETxNdtM+2Y/Ra/w9UV/aPg/syX2t5t7NrXFDnQS0d9IgSaWnn
 vzN4hqnvcKpcdVYe6pxdKHyEJ63mJQtLsDYD2DKwLwiwideF82cL+KDW4TC6Ao2eVhgN
 aEpBnjBpRsvgvg2UdMMNGw2m16z+jsIaRCSOVmybyourCKbhVcp5YKs1x8NxeMEMaL0I
 eU3YAktle+U7ghEkm+BDl38xUbxzq74QZ35tN7TmEMz20t27N/X/4EkLduiELZVw2kaw
 JkZGRmwIiEaIAIyq1b/2VGgGaWSABTCmqFA36hadQjP0xMu3VCt0PgwyVIWEUUxeQdJG
 s/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3C5u9DrXZj6rRyHI74cwCLmjedB/NXARv4QiTEDtzdw=;
 b=ZrjT8eh/WyIby44lzz0CYpuqsHyWLKsL14/lxeOIlXh21RKggkq2paYBbCwQNRs4lX
 xMikwGhl8OyUd9mApeU2JJqmJxX7bc5pIF/juxy4PgBnicwy+ROYiCr1AxrX/xRHWYIB
 Kh93Yn1aGEPVsaoyZZwlk5PdvkI73MotSpyhjogkYsvuaYh38ACy+6YFIs3Z0s+mv5kX
 zp9VILi2YUHUqTFgtdgNHOyxNRrL3EDZBZ0Sh79tsK71zP6NZ74wcGGf3sqCav4UmkNr
 WMInmWfMhWsNgWXO1qunCgLz1VLaPVpDws/ATFfrjwdCk3h/wpT80/yLzaKTW6rlneNN
 l/4A==
X-Gm-Message-State: AGi0PuZ2KJwZuWOs6UNN2Ulj1VNOdapBSdKIL198jMbwJKkgRakmO06a
 FnT3VnNnl2ZqO6B18IDTydEsoYbmbD0=
X-Received: by 2002:a5d:5228:: with SMTP id i8mr389256wra.156.1586195280250;
 Mon, 06 Apr 2020 10:48:00 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:47:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 10/54] hw/arm/fsl-imx31: Move some code from
 realize() to init()
Date: Mon,  6 Apr 2020 19:46:59 +0200
Message-Id: <20200406174743.16956-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:i.MX31 kzm" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z2NcBXNJ1KPB

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: hw/arm/fsl-imx31.c
  >>> possible moves from fsl_imx31_init() to fsl_imx31_realize() in hw/arm/fsl-imx31.c:68

Move the calls using &error_abort which don't depend of input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx31.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 8472d2e911..61287e24f6 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -62,6 +62,8 @@ static void fsl_imx31_init(Object *obj)
     for (i = 0; i < FSL_IMX31_NUM_GPIOS; i++) {
         sysbus_init_child_obj(obj, "gpio[*]", &s->gpio[i], sizeof(s->gpio[i]),
                               TYPE_IMX_GPIO);
+        object_property_set_bool(OBJECT(&s->gpio[i]), false, "has-edge-sel",
+                                 &error_abort);
     }
 }
 
@@ -191,8 +193,6 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
             { FSL_IMX31_GPIO3_ADDR, FSL_IMX31_GPIO3_IRQ }
         };
 
-        object_property_set_bool(OBJECT(&s->gpio[i]), false, "has-edge-sel",
-                                 &error_abort);
         object_property_set_bool(OBJECT(&s->gpio[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.21.1

