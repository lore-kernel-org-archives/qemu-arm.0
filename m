Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp802323ejb;
        Thu, 19 Oct 2023 14:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGeRI0Qwm3t+/6K2bo1yy2M/LSFNCgDvcPcmTxATX1L5Xx4PmFrNPNznJ520X4A/AhWxpq
X-Received: by 2002:a05:620a:2548:b0:76f:8c6:a537 with SMTP id s8-20020a05620a254800b0076f08c6a537mr3792045qko.77.1697750657925;
        Thu, 19 Oct 2023 14:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750657; cv=none;
        d=google.com; s=arc-20160816;
        b=e8cWnMSU8V4Mkp3aoPnMNX2gdup5ZvchvnycuYUhXSgcPKz58IQRNRTI7blYGV7CrD
         fi9txelIn3veVPsztLapRkoezdTqgS1fJgGF5ah7hIoB1ziY3teqHS6cthXv7fHK6rEI
         oN07srNJQJvyGRQ5hL6vZ3Utw+Kegy5blpqmhvjmTHExjc+KDLa2ESVsZjF66WR40lpm
         MT+RoFwxecT7/cmtlEwskC2FQHMhzgVKFAmeEy3Ldybh00ln9tNZNh5lT0mwKmNZhMNw
         NDs0J0m2HAufJXbrKmSjGwITH7LnXQzZ69b2FExftBUTUAzhIKkjOk1NobSEgF3P5lnG
         CVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8655uhkf4Iv3nGM9fMF2CltwIDAJNWHol1jKSBeCR8A=;
        fh=Uj8HDrldIoYWHqqMC7Rg3wRXZjU4364GbB0sXdwIGXY=;
        b=nsC352iKq8PClwQC6iNmVX3XsWPgO+/EhPsJw3PbFnCHu6Lun8F2tv30gW0Eyy6U30
         3s/147zEIgrWS2GWH8wXZS8zVNEdDZXguhTFRLwEH68MRVGRe2dAp7Pkhar82PDnrIi6
         OAxJJjkZfkNFQW6rDR+XeJDV48Th52TWtwROeYO9elUYP8DnI2SQ2NUR+A7K26tgRFfX
         7BDhtbjnPXKqHEFf4QQAbqk/HiXIc3rBUQcJqSF2X66p7xGYlcXRQVO3v3h0q6/XQDRO
         hASeIaPfP3NcsN6RhUs0bGm+/49HlW+UDT4Mt17kVOLzFfqOKz6WSi1Px/N3qk/isqYe
         hi2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X+UUb/6U";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25-20020a05620a12d900b0077431227b58si247567qkl.27.2023.10.19.14.24.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:24:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X+UUb/6U";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaTO-0003kK-VT; Thu, 19 Oct 2023 17:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTN-0003hx-MD
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:22:29 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTK-0000aA-UM
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:22:29 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so1160695e9.0
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750545; x=1698355345; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8655uhkf4Iv3nGM9fMF2CltwIDAJNWHol1jKSBeCR8A=;
 b=X+UUb/6U60mLi+OG1P+nmw2Y3pBMwy6+hXg33OSoxjofgUE/R17wqSqikT5OiLzAnm
 1jRCS0VbGGXWBiVMCBmfbVmA/4NBFVPJ+cwMks6S47/UkAX58/KTsufxo3vB6p5a60tN
 1BgLc4k1wGo801pJMx8TQNPHJKc5g3F1MyXRRa6dz8i4R5VXQDxLE4OWTAYWm692mKqf
 ycIM3nkb+yaTcsOEdM4+Nt+LQgs0fprdouRXnIP/WsVPnu2/yQmXiPjvJ7u6iCA7d9dQ
 yBJL9Ccu6D9vMcyZbO3Bepju5CoB8KRx/JTa8PKc52z4jP4b89MQOziw+1gXSoJ1tDcU
 GlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750545; x=1698355345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8655uhkf4Iv3nGM9fMF2CltwIDAJNWHol1jKSBeCR8A=;
 b=SA0IGC1TuvdgcX/7rIMOFpmZMawtErB6NwyCoX9j+ofwPs8zfHnQCir2NojJJ/M8Yf
 ypv6gDrXq7Mjco0vkpTIhEC07GqIZ6dCB5hsNgmkv6NtjeGf0aNrQlHbkhP93UjU5khF
 1Q/GmqMSumXzAxTD4HXGnWhGNeYUatha+1NNzTstQjvaEyGQ95He+642aG0akjPgHOYD
 G9RSj1CwPilUHBZUkX7/F+Kv1wll8RzKxeATPg6yCsEE9I4p8DEM6vrWXklVzKrJc6mR
 D+lXeWtGpcRxQKfHGvUNEA2Egq67uDm8onoang+KvFSbWn552/PG5m2s3vRty7qvNIbg
 T/+A==
X-Gm-Message-State: AOJu0YyS28R0DA3DfHIplITJ7JaAcSQFu1rNvtw85YR0p9uJJpu8CjLa
 C+MiJwGen6OLFVQ7MbGQDZbqhXkORl6wdypRWyjFAw==
X-Received: by 2002:adf:ee06:0:b0:32d:9e48:c2ef with SMTP id
 y6-20020adfee06000000b0032d9e48c2efmr2057438wrn.44.1697750545332; 
 Thu, 19 Oct 2023 14:22:25 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a056000136b00b0032dc74c093dsm215583wrz.103.2023.10.19.14.22.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:22:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 37/46] hw/arm/virt: Realize ARM_GICV2M sysbus device before
 accessing it
Date: Thu, 19 Oct 2023 23:18:02 +0200
Message-ID: <20231019211814.30576-38-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BrwSPVEzsRT3

sysbus_mmio_map() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231018141151.87466-8-philmd@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 02c7a7ff3c..5b08a98f07 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -690,10 +690,10 @@ static void create_v2m(VirtMachineState *vms)
     DeviceState *dev;
 
     dev = qdev_new("arm-gicv2m");
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_V2M].base);
     qdev_prop_set_uint32(dev, "base-spi", irq);
     qdev_prop_set_uint32(dev, "num-spi", NUM_GICV2M_SPIS);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_V2M].base);
 
     for (i = 0; i < NUM_GICV2M_SPIS; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
-- 
2.41.0

