Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1507225lfg;
        Fri, 12 Mar 2021 11:03:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0Xi661nC+ffZ90CE3aWS28JmWSIfYuDyhOstxQ8I/jJuQxYNgeg3pIaMpZw2svZGeLHtP
X-Received: by 2002:a17:907:7637:: with SMTP id jy23mr9821183ejc.12.1615575824466;
        Fri, 12 Mar 2021 11:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615575824; cv=none;
        d=google.com; s=arc-20160816;
        b=z5o4bofBcWhyiUr1KSkTSqPFDj7BExQ92KXq4XNKwVzz1ijF+HH7ogTd3LD2UvAKyK
         oKaBAXEkV5U0FQh76aVcIP0h9OZ6QD7Kj99t+Gb58413eOfp1hbzYtU//cVV6d3jMEFl
         mCHrEevcsInJ/O0FmXd99KKdBaQF3T3TbuDnh+8dgyw+pF8pyq/3Jh95FebimJ7luPHb
         Y/DhcBeL2DkmUng9a7sxbbxDGczemGDRcVu4smue3K/G9d66gLL7nZLiDVm9zJYvGbtY
         UIwpzxTQE+nA2/Q9gHbRHfnnMlH1sP9pvnYFYQZVeAVdzdnEeKgRZOrYR90Ys4nlk5B7
         bz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9tJp0u8EkF/DAA9zO9gGqV8fJY+V8VUWnyEVu07oRsU=;
        b=vUbLiXsRftl49XBpQ7kqG2uXRtANent91bSTF/n42nB5ApWYMgeR/DKNsEXQ/HPP8F
         VKzLqS4h68yVDauXkJg3wgT7/O/ewDrlJZxVld3LX61EWCiE0xYKrLL68Qm88ZofiL1P
         p5/PYwF1gu//oOytUSsEKIx9DVBZcBkXketj9YRwpHsfFv4iB9MFzUkm8AdiIMuVcazS
         fHNRqdjIuO/DCDH8AFep2ehL7lIvKeZ9o2pbmXjf/i9AvwfsCA7CwzYApLUm9/cVhRYy
         G4B49PjMBs3qgC4/4CSWvApw/D87GU2DqCZqmGlseorjoZNmDNdhRxaIsikDlHHIMTm2
         1x5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D4vLJqQy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si4704068ejb.425.2021.03.12.11.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 11:03:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D4vLJqQy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKn4Z-0007GA-Dl
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 14:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmX6-0005Ys-SD; Fri, 12 Mar 2021 13:29:08 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmX5-0004xd-8q; Fri, 12 Mar 2021 13:29:08 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l12so5342000wry.2;
 Fri, 12 Mar 2021 10:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9tJp0u8EkF/DAA9zO9gGqV8fJY+V8VUWnyEVu07oRsU=;
 b=D4vLJqQyOFpCuz45zqLrkOqIezWkBmmZA6sCZs5wd+E9a+q76yyxoMXjTQLKk8DLTF
 T7cDt9CiZuIt0duYmAOcS7DA2UXzHms3jgYxPyQpapTwKPsfe3uX+GFv/YdI2EyxQ4qp
 iOSWDpVm7iVc9SpyvGB1putYGOoSx31MjZ/W+lGamX7B80noAS6waTeIkJrtreCvhA66
 q1M1Yx6+4Uph4BXgZQ/77tGYFQ32M3ztmxBtvwYP49mACpmSZrQdw7gEnVzNSODDFKV8
 PMlUCxxAWHi6Kc0Mct3lpzWDlXh7TFddBWu3l39t4jsQecqMXvDRtcoMaOQjnfhpMoFE
 kmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9tJp0u8EkF/DAA9zO9gGqV8fJY+V8VUWnyEVu07oRsU=;
 b=nvbIR8KjV8nADRW0x9zAQeglA8kDQ3X+NPXBxY5+DzMRA4/0+KIrJxGcWO8AOBpzVo
 xOkxBxJG8eTQTNj07UbmB3Tby6hIE6dD7JyQLmAaxpctYPS3CA6wln0SFWjAsSev6/vF
 yowB7e9kCT9KonMjxNqAK2TdyOqQsbGJ2jMNY0R9GvMIVXI/4CKtk1e+ly1vJkmvzMgs
 bJ74K8lxo9VLh3yDCv7aL63CtP2jFwdSVXoIFANOR7j65ZuVLrjkaUBCX/6ilqf7sLB7
 +/cH8tTfgba6nhrG779FEam2f4dD1A7TiB0MTvr7fK14Ga5jaKFGKDqFJN08DaqvogFC
 7KNA==
X-Gm-Message-State: AOAM531T72afsO9qfZh4mwnPWF1w0lH7CQSBN764+XPc3rJJHBg1/ju4
 5rN1ZBV7Ksaotz7YUPEuH7d6qBbdbso=
X-Received: by 2002:adf:e84f:: with SMTP id d15mr15382841wrn.394.1615573744919; 
 Fri, 12 Mar 2021 10:29:04 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j11sm8494397wrm.13.2021.03.12.10.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 10:29:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/arm/aspeed: Do not sysbus-map mmio flash region
 directly, use alias
Date: Fri, 12 Mar 2021 19:28:48 +0100
Message-Id: <20210312182851.1922972-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312182851.1922972-1-f4bug@amsat.org>
References: <20210312182851.1922972-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kiOvs+VxITG0

The flash mmio region is exposed as an AddressSpace.
AddressSpaces must not be sysbus-mapped, therefore map
the region using an alias.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/ssi/aspeed_smc.h | 1 +
 hw/ssi/aspeed_smc.c         | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 16c03fe64f3..e3c96cecbd8 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -84,6 +84,7 @@ struct AspeedSMCState {
 
     MemoryRegion mmio;
     MemoryRegion mmio_flash;
+    MemoryRegion mmio_flash_alias;
 
     qemu_irq irq;
     int irqline;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 16addee4dc8..aa26578bdac 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1386,7 +1386,9 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->mmio_flash, OBJECT(s),
                           &aspeed_smc_flash_default_ops, s, name,
                           s->ctrl->flash_window_size);
-    sysbus_init_mmio(sbd, &s->mmio_flash);
+    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s), name,
+                             &s->mmio_flash, 0, s->ctrl->flash_window_size);
+    sysbus_init_mmio(sbd, &s->mmio_flash_alias);
 
     s->flashes = g_new0(AspeedSMCFlash, s->ctrl->max_peripherals);
 
-- 
2.26.2

