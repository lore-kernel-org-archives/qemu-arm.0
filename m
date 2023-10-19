Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp325268ejb;
        Thu, 19 Oct 2023 00:17:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFauk2804RP+C4QOybaNYlXBG41GcfmjRFg8fBmIeYJCTLwQ7gSXzEvI+0414EAei0wqHKU
X-Received: by 2002:ad4:5ec6:0:b0:66d:4fdb:5e36 with SMTP id jm6-20020ad45ec6000000b0066d4fdb5e36mr1713570qvb.36.1697699865064;
        Thu, 19 Oct 2023 00:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697699865; cv=none;
        d=google.com; s=arc-20160816;
        b=JO06PCb8yfHAY8sQOFcIC/ySBPS3PZ2EKHq6Bw0+TMoB81sL+KQl4Rjl0F7BOv6/rh
         lcY9GY4xn+5z+157JyoNoDDHI9UxT62yBBdAzVIpF2M7tqg6iQkN7b1ugo1uIVAePVM6
         BXErKvxYd0xLk08cERq0TNYLbCv0WOsNQJZ0rbLXDIYMpjlMboVIyNPoiFya5XiwWpS6
         bwJ2aw+YHgUywosadCowkpiCuE2Qd82ZWYfFPUaeYjZeRVrHIVugNfEZH4Z0V6PfafIj
         PgmRq+T+tDTNen8P47CR5N4PLZdJm8Ih5rCOicDS+J6mbZsLdcwN+hG1Yi5r3LFJovYP
         SFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XTgBuZGYkLbr0wmI8JEwCdSLvjSRDlVIxUJmeWPbI+s=;
        fh=6jYKO1R8PvzdW4tN+W/XYlQifBf+lht0eG+bQc5OUAg=;
        b=ECunhphAQXvDUZtpGZJ5qqsyGXIHaBSO5chBkhX3ym5tDFxi2UKlZoQKzfSnaN46Wg
         FNqEHn8DRx2+qrG+39s3gTlSoEetkB9AWw7B7mMRMnrAlRFFYf1lp9MvWKbaPRxB+6h6
         ymNNWyLurr6gdO9IcPRotEfyd9rM9oylK2zEBN13sd7nnsR0qbJ3zk16HYFcnHdP6vdz
         DzlEdfcoka4jKwj0wjHcepQHL6CF9oeaZwIEwL9IdRt/iYyrCv2XkOdMlpqGaUl/Y62f
         nVawCJ1HzICoWkdjn3m3d41346Au4JwvvsTIdo8MX6EpWbA6RHZS/Wx2QAKEYADhXgM2
         u67Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1DK3B28;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11-20020a05620a22eb00b00774383c131dsi1086728qki.121.2023.10.19.00.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1DK3B28;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNHW-0005aA-MF; Thu, 19 Oct 2023 03:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNHD-00057f-OQ
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:17:03 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNHA-0003DI-Ud
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:17:03 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so6192312f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697699819; x=1698304619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTgBuZGYkLbr0wmI8JEwCdSLvjSRDlVIxUJmeWPbI+s=;
 b=B1DK3B28ACzOYr/ul6k4jg9R9rhDsxVWWLnD6Ozk1ob/zB34o75Oc7uiKVy7yINQs5
 p0QHL0AU895qGkyE1o7UwSsulk+qNS3CwIXfHs+1w/V7o6Pahd2LXM5CI/sk1kXVp9Rz
 qQMtDQgPZ6AlElGR1Xia3Okn5/lfRfwDeYRjug8zBvpb4AbHefBB5Vlmd5u3wexXLYI4
 XKaVplk2upg57RdOsQGfH8aE1jN5XF40U80jTuRUtUksz+0xPmu+pAr+TxhIzzj6GHeR
 4n7RhONKRSllMuJeNypDwM7ofBbZYvstyqujn+cuKv83yukoN7YaDIobkyiVbuKjA4Ol
 hbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697699819; x=1698304619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTgBuZGYkLbr0wmI8JEwCdSLvjSRDlVIxUJmeWPbI+s=;
 b=Sw5+INh1lA+g6ISaKaWxMmdqC7Tp70Y8XBca+EEs8EzWY/NEEJwyfTe7tfmrwl1Pv3
 5yNzTZxUh0tfT0RKWUNoJOKtSZDDLQod+4/37eeX4IJJksL2KWDRj3LO6UrTcJdAF6tj
 x6GmlhE48v/9jFbpB9aTONPCms+/vvah93hHTiJKXw2xgW0DFgPjFEOEhDWx0aLC+CrL
 y8n8Ln78/wxqzIsfd5TwAHFyoKwhDsUwgT9+eU9ZQi0f3+XQoiMoeOkGp62dQDATvlK3
 Tomb57UHN2KmqSTCD2EMZ9HNN297/hh7eOijsAYRqJhPa9AwzN8nUvfWS0tjmaMekFhe
 Vb5g==
X-Gm-Message-State: AOJu0YytjTFca7uiqilc3h2A5gxgOGS2UG5hskTc2e+bzaI8orKFOjPY
 /pMs8kJE4n744PBPY+qi7R1jYg==
X-Received: by 2002:a5d:5082:0:b0:32d:9ce0:35ae with SMTP id
 a2-20020a5d5082000000b0032d9ce035aemr788960wrt.52.1697699819245; 
 Thu, 19 Oct 2023 00:16:59 -0700 (PDT)
Received: from localhost.localdomain (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 d14-20020a056000114e00b003232380ffd5sm3732348wrx.106.2023.10.19.00.16.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 00:16:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 04/12] hw/misc/allwinner-dramc: Do not use SysBus API to
 map local MMIO region
Date: Thu, 19 Oct 2023 09:16:02 +0200
Message-ID: <20231019071611.98885-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019071611.98885-1-philmd@linaro.org>
References: <20231019071611.98885-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SQ9rPdD1n5VX

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

