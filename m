Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp247101ejc;
        Thu, 31 Aug 2023 15:58:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG78DVmwvlZ1p9h+29yY3E0omu3qExsiRVpbhZ3T/hnbnl+Oi48fYks4zyqvAuAPMV4Mq5R
X-Received: by 2002:ac8:7d16:0:b0:402:2e84:f06e with SMTP id g22-20020ac87d16000000b004022e84f06emr1043442qtb.27.1693522701159;
        Thu, 31 Aug 2023 15:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693522701; cv=none;
        d=google.com; s=arc-20160816;
        b=UappRE6SRI72igeTs2MMlCT9UI49mwqnWdwluUzvdmu1znIuQLJO83+i+wZ251d+oX
         eMjEq4zO5oMrbIWv6ShLjK1l2j5xRaVIG0dRVXXOE6eKVLNQguCjIvI4Uw1nZDZEaxkG
         fA9C8EgvKxnM7NyIRj83hsVc1vsW+y+e/w8KGn0NQnPoVlmztUJErzemccAbVrYhcqcK
         OYcmSXeuh91yDgKLW34MiqSYZYDa4Cj+Qto0+edmO/xlUpQSkk69EcER5PYZhCWcdCp2
         QtlSQT/c5+XaCBkLrARSWJO393aD9ZMx7Jg/PDLlyi5DHIqXJLAbx6xMJ3TED/UAJmFF
         8GTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PQQ92YswPrJjLh8GJHh2K0OTvyaJRT2v7+qtQtVGLSE=;
        fh=CBl7qg6Xhfzjse9V+dxyNEdr3C/AYoRggW/zcQwfpDs=;
        b=Ne5Jl4BfZqGDkd6aaukb3YGMJuXf2u6HxGHnYdP1aLtn6wN4hN/R6oZsh/THdQ0kYq
         eHqYEHgukbXy+PNlDOejzxj++VQSQLBwFR2EcJvFch3DTRQVFaa6w7CFxYJTr+KHrMxv
         AE9ICl3NtaX2LAa0FTFQa2vYPPw0iFFINBSFlAlICjEfLbMj4dxuMYDaF8cvocBkPJHS
         IKxaIVs++I/xgYL0gE9wvpuUV08eA3HjibzBimQRJbOjLvQtSPklT1Nj/IzShXq7VqlS
         bRpGMbbFjSvpaGk3Cejh9ug9F0Ly70FbX9YKq8T9upqiw7XNHHY0aFNz5hqfIBYaXPJ9
         SzuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=volQLzVT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020a05622a11ca00b004042849cfb3si1502917qtk.262.2023.08.31.15.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 15:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=volQLzVT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbqap-00040l-As; Thu, 31 Aug 2023 18:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqal-0003za-BL
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:56:47 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqah-0002so-74
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:56:47 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-986d8332f50so161147066b.0
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 15:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693522600; x=1694127400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQQ92YswPrJjLh8GJHh2K0OTvyaJRT2v7+qtQtVGLSE=;
 b=volQLzVT7NPtC6xojkdLJGx+wzd1RhzBa0sD7ExXP9huapP61zVcVYxu3kXCpqntiK
 U4M1jrWh5lphCRLly1h7XciVYBC0yznfylycrBMR8fLDKxcXPpxzfJsh8VZMApYETKVe
 cqIU8QPf4y63PLecbN+KPLMsTmCqOLCXDuOSt4FL2uP1sqMxgSF0o2x1pdSqcMNptGcn
 xu/DdFzhlCGU/P+/vEJqSUh9DGF43162II2zf/tylgvmclfjAjhCtlg7mhFuUHxzsdHO
 kEiQx38K4XS7kJes0g4839HGF+AnmETOHw+bigPlJO02EcIeE8VBbIrKYNmqfO/WvL8b
 I+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693522600; x=1694127400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQQ92YswPrJjLh8GJHh2K0OTvyaJRT2v7+qtQtVGLSE=;
 b=J7tqw+KybUuYYl0CmNxiIahAfWsQ2/gVvVdplY96g7WWkpanhWHDJVFOR8Rr8XEH3j
 zkVftMXD8i8F2uh+8ZXi+0f7JgOjbjOUBX0KvG5VbnHTyw8ggdievqDkFG+63cPrqACY
 rZxfb8+u4CycwzAqy76TlOuibIqrmXYtfnrcIc1GQSk8S/hHGU2LkQsnPOS7V+LzCVG4
 yPThSLwP9l7qYsGWQEKpCRGu6GTxCYfT321e3mGbxmEAuVMbzfYJJuf278gfXbnBKN/O
 8YI4zZVBB7NvznngVuXhteJtWzyFpyIFbGyfW76CZRzZngt9hbnnMBgm8/qfgouowdnk
 9wow==
X-Gm-Message-State: AOJu0YxY1GyX4Yu/ums+qb+yAlUbvOYLBaOy5WbBItJ0X4pb1cdaHeVF
 UkLK7hZ/uradXakZgczC/MzAgQ==
X-Received: by 2002:a17:907:2ce7:b0:9a1:bb8f:17d7 with SMTP id
 hz7-20020a1709072ce700b009a1bb8f17d7mr463648ejc.12.1693522600451; 
 Thu, 31 Aug 2023 15:56:40 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a1709064d8d00b0099bca8b9a31sm1240738eju.100.2023.08.31.15.56.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 15:56:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 05/11] hw/arm/virt: Clean up local variable shadowing
Date: Fri,  1 Sep 2023 00:56:00 +0200
Message-ID: <20230831225607.30829-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831225607.30829-1-philmd@linaro.org>
References: <20230831225607.30829-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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
X-TUID: Y6HygygbcVpC

Fix:

  hw/arm/virt.c:821:22: error: declaration shadows a local variable [-Werror,-Wshadow]
            qemu_irq irq = qdev_get_gpio_in(vms->gic,
                     ^
  hw/arm/virt.c:803:13: note: previous declaration is here
        int irq;
            ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a13c658bbf..32a964b572 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -800,7 +800,6 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     for (i = 0; i < smp_cpus; i++) {
         DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
         int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
-        int irq;
         /* Mapping from the output timer irq lines from the CPU to the
          * GIC PPI inputs we use for the virt board.
          */
@@ -811,7 +810,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
             [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
         };
 
-        for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
+        for (unsigned irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
             qdev_connect_gpio_out(cpudev, irq,
                                   qdev_get_gpio_in(vms->gic,
                                                    ppibase + timer_irq[irq]));
-- 
2.41.0

