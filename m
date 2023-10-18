Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4668311ejc;
        Wed, 18 Oct 2023 07:12:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPWrfbDNsgYKcDF9zscU1+KFbyq65HeVA7BhaO1n82LwXD28B2qXBxq6nFhRXc4WEY9SEj
X-Received: by 2002:a05:622a:34f:b0:40d:589d:9ce5 with SMTP id r15-20020a05622a034f00b0040d589d9ce5mr6234356qtw.34.1697638351504;
        Wed, 18 Oct 2023 07:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697638351; cv=none;
        d=google.com; s=arc-20160816;
        b=V2itgkyuW+J+UKtT+pNKlOMoAY4hxtjpg5cFBxCfgrlm/iwWIVsQHGe6Fzg0Z+E3UF
         3cYQRnnq6OLaI73dSJPJmaO3KWj+nvQlFjDB7SdVC1BwTvcb7271iuOEg7tb208Xv8l/
         iOWUojIvUoFWLwa36nyfpMG5GYdr9kxDm0QpVZ7z0P4UfnjLN9p+/CkjSC1gD7fbLmrI
         wGoaAgUHjJux0Tm5xpb8A23AdFjUXC5Vez21p6TRLE/Ug+IhW9ZJXg4BBd5Ro2uJQWyQ
         gnG8lGIcLiD/a7pwHaBNBqu9tkls1vVo6KERx7xExqrjtg5OJZ4R+44ZVlZoSxxbW1TA
         oVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OG/eTeWn+OzUtyx8iBSPb0Amcuu5LlJ9K/x3TvIXfKM=;
        fh=ANIikQnX6ADG7FYuHYnQUKFZKV9+VnxLLzGv0RFOlfg=;
        b=ncwiWwUh8nx6SU1W20qX/qF77qS4cx2qvoSVhoEC+4+Atk2TZWRsiYFKpgzXZCZ2kA
         zI5gzk0GX8Xfo7Dbq05eBcD71gcBM4g9wLYiO4mYd/c/Fzc/7+SUazsv6wS0JrGWo7DC
         lpM3/NMH60dVaqcDboG3Lk7GTeS0CNVwysdQuNPmXA09NN4INItxvkZXGCLU6TCAlezq
         FeeQ53GIQ+kuRn/xWh9oeFHspmFKPWyQZ8gh2emQB+UJpHnN8GgCZcbL4w4Db0gJO46o
         zOjs35fCpamsVKV4Tw4UfY8Zj3m4K5k5QGY3lBDWhfmsHE3M1sLSymhHBP9RjcbMYggT
         pwRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6XBzWAG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020ac85a51000000b0041815de1524si2907701qta.178.2023.10.18.07.12.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 07:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6XBzWAG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt7Hf-0006dw-0b; Wed, 18 Oct 2023 10:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7Hb-0006ZO-Ni
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:12:23 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7Ha-0004nj-3i
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:12:23 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53f6ccea1eeso890255a12.3
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697638340; x=1698243140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OG/eTeWn+OzUtyx8iBSPb0Amcuu5LlJ9K/x3TvIXfKM=;
 b=O6XBzWAGJEbDYnp9Qhkf44wboosoFezSlnL8AqWEa0PHlRXYOAcefz8acs0DWCpZI/
 mCzDQk2xfLucil+lpXTbCG6wSM2zfoatCIsVfjk2goQk8pMVtMg5Kxwm9NZmWUYChIWW
 JigeAgt+IB36yuvcRoOaInA20B9d1qIHTUZGKeEffM93+fX37G/ZI+mM1jHS4J4Vu1QU
 w/wFJws+AtB6OfG8Q8kacOC715s36oqWFPtJiEAs7ctmNs9dZI0bAuefYRboZT9ggR1B
 gOLpLdH6X2T71a8bGBe9560bYMj8buKRkGYJjN0hXwXsVZg2xuClVQ5iNtdWp4b7qIhd
 jRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697638340; x=1698243140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OG/eTeWn+OzUtyx8iBSPb0Amcuu5LlJ9K/x3TvIXfKM=;
 b=L+QVyYQeDOKuawXlBUBAs2mbREFEdAFCaNOSj2/HJMIz0uo0ZWXT3AKPFH1NGIE1LA
 Qsl37kkQV16dD6McyWln0O7jlF0IpfPjTmgkZlw80CGu24Xw+eAa9vqodGI0Zh81+Ltv
 q7yJKmYDmn1oUV8f8dD4eVCegFdUWbOqasELuSyIKh32M9rzTJ1XTqG/sD+2etzMuDCJ
 P4fwO/xQlJ57V4DLfuAWnjXxN2lG6wZOlPVXu3R4M0nPnmj277r7OjGcmSDZ6JDudgTH
 Z+V3O1H2B+GzDwX4ZxCGQO8o2Gn6b8VyQHEZYV+8grhb3Yt7eqmXGRKxnPTTnEJqeJ7n
 +M0w==
X-Gm-Message-State: AOJu0YzObxXiGk4CQ2aSj+M6MRyfS+NT/qWXG0LYHtBn2zVnyqjwzu6E
 I3b738iF7QF1ZDYQXWVAF4hFuw==
X-Received: by 2002:a17:907:98e:b0:9bd:fa48:83c5 with SMTP id
 bf14-20020a170907098e00b009bdfa4883c5mr3938988ejc.70.1697638340025; 
 Wed, 18 Oct 2023 07:12:20 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906224200b009c6e58437dasm1783529ejr.37.2023.10.18.07.12.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 07:12:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 03/12] hw/misc/allwinner-dramc: Move sysbus_mmio_map call from
 init -> realize
Date: Wed, 18 Oct 2023 16:11:41 +0200
Message-ID: <20231018141151.87466-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018141151.87466-1-philmd@linaro.org>
References: <20231018141151.87466-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: eH/irhfDQoZx

In order to make the next commit trivial, move the sysbus_init_mmio()
call in allwinner_r40_dramc_init() just before the corresponding
sysbus_mmio_map_overlap() call in allwinner_r40_dramc_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/allwinner-r40-dramc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/misc/allwinner-r40-dramc.c b/hw/misc/allwinner-r40-dramc.c
index 6944f84455..2cc0254a55 100644
--- a/hw/misc/allwinner-r40-dramc.c
+++ b/hw/misc/allwinner-r40-dramc.c
@@ -414,6 +414,7 @@ static void allwinner_r40_dramc_reset(DeviceState *dev)
 static void allwinner_r40_dramc_realize(DeviceState *dev, Error **errp)
 {
     AwR40DramCtlState *s = AW_R40_DRAMC(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     if (!get_match_ddr(s->ram_size)) {
         error_report("%s: ram-size %u MiB is not supported",
@@ -421,8 +422,12 @@ static void allwinner_r40_dramc_realize(DeviceState *dev, Error **errp)
         exit(1);
     }
 
-    /* detect_cells */
-    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(s), 3, s->ram_addr, 10);
+    /* R40 support max 2G memory but we only support up to 1G now. index 3 */
+    memory_region_init_io(&s->detect_cells, OBJECT(s),
+                          &allwinner_r40_detect_ops, s,
+                          "DRAMCELLS", 1 * GiB);
+    sysbus_init_mmio(sbd, &s->detect_cells);
+    sysbus_mmio_map_overlap(sbd, 3, s->ram_addr, 10);
     memory_region_set_enabled(&s->detect_cells, false);
 
     /*
@@ -458,12 +463,6 @@ static void allwinner_r40_dramc_init(Object *obj)
                           &allwinner_r40_dramphy_ops, s,
                           "DRAMPHY", 4 * KiB);
     sysbus_init_mmio(sbd, &s->dramphy_iomem);
-
-    /* R40 support max 2G memory but we only support up to 1G now. index 3 */
-    memory_region_init_io(&s->detect_cells, OBJECT(s),
-                          &allwinner_r40_detect_ops, s,
-                          "DRAMCELLS", 1 * GiB);
-    sysbus_init_mmio(sbd, &s->detect_cells);
 }
 
 static Property allwinner_r40_dramc_properties[] = {
-- 
2.41.0

