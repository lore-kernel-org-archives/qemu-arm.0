Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3170751dlj;
        Wed, 15 Jan 2025 09:11:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWG9qylf9eHyAoNFJyzVQJdAXNNW234fNO1cLTrD5YowkqA+aqmrJucXW1ub5WN+Bht+3XU51+8st14Xw==@linaro.org
X-Google-Smtp-Source: AGHT+IEiIa9nTSK5CjXM1UW3wNL4yCsoI9Taz/FhDXMWjQc5z9n0KI3n4IqIrngRgIz8FeiRCXVe
X-Received: by 2002:a05:622a:19a0:b0:45d:8be9:b0e6 with SMTP id d75a77b69052e-46c7107e08bmr496355501cf.43.1736961075151;
        Wed, 15 Jan 2025 09:11:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961075; cv=none;
        d=google.com; s=arc-20240605;
        b=j6JoeoQoBf9nZ1tvfQcLcSnvD+darNz5h8fXagey0sONgDoSKTv2DgsOMF3k+sjgUf
         nnv8nlUr5L45tKy0UmwYnTx8yNCiMyTMzM4f+MBTF1/077aag+ttJ2cmBIzG5GDTgzb9
         h8STG+u192clo/h9La5aOyUGYGxZwaLl135foPJFKJnLIhrpiYGCYGqWGgSC10GKcJGZ
         jjPOLSV0IytspPiiE5vCol930Oc1JvgGpvSKD8QbDB15Q8Iy1onVl0Zy6Iw6JARQsA0U
         TXbm4aJAeznuMF8tXmGOPcimYbB0XznS4EBvUnFdeQQbtYdaHoJV7NenbC8jmGS/OvSi
         xq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RVAJtatL/ZPpb9lJWM6F+L2p6a5jhKW94ak9z8z1WWM=;
        fh=p2oYeaaj7EVZKSZHqhHikLLXKYve2T/6k7Q4WECb0WE=;
        b=A7rLEOnRbFYmu+SNdql5/loDsooRPuQ3g/DG4l2FxlPMWZOqPdEld/c5Dt0aSMRWpH
         IfkGcjVUmOXITFMB7AA1/jsWKsx1b3Uy3N+vJxzQK6/4bLDuTF8cdr3kYvOl6ExYmsMU
         kTaJ9Z/z2YdZsRdZCgDdB0FqJW1CgLGhuhioeVNWoHcZqUVAxH/y6qS/KWWfvRfu00Nv
         073ctuBiAoqm9dG1wUq/tcUYm3w/YDTtl2Gw/4PqeL7IUdiQBvSxRGpFqLA5xkxBaT0A
         EV2BRUHY3dfrdszCmFLrf8HUcN3x76v5yp7XVDOd6mt0fQsLIyl9Vt1m69zRDJh+NJH0
         mnRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a5/FHipK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c873fd182si158744721cf.397.2025.01.15.09.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:11:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a5/FHipK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY6v1-0007g2-OP; Wed, 15 Jan 2025 12:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6v0-0007eH-2C
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:11:02 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uy-0006cA-Hz
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:11:01 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso17027f8f.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961059; x=1737565859; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RVAJtatL/ZPpb9lJWM6F+L2p6a5jhKW94ak9z8z1WWM=;
 b=a5/FHipK8O54Bj6AOVKjPw3K82sa2M7k1XFu8KzD29RzpWnFMXHmTf8eA3/7Jkp1xu
 xMPlJBN01V2GTr8tp6BayAMZvKJtSW58hZUR6fbKkZnpyMSN5Z+2Xo8QBAW2jiQQgOdp
 bPIylf5LYOA/2p7NqDwdhfupxTf2/XeklfT0wiYZx782FDByZasOyXaaHrcizVmdUAjr
 lZSJJfu+wk8cGGT/QAS72l+1sIiAZuwChrcPB5kvvsRGlKIIfUGxdVlBCATsdXmCkrfO
 Uqu6Ka/KEPengw5uDxS5+dOZzNDkxfIOJDq/d0KIbPtxrPW1O6bELof7NlkDKAfag7pK
 Wp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961059; x=1737565859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RVAJtatL/ZPpb9lJWM6F+L2p6a5jhKW94ak9z8z1WWM=;
 b=Lv+kw44isrpEAXMfgcp/8wksScq69ciGee+44iuVQCXVa4JsYoZj5Nogysflmw3OT4
 Ujy9J3jhQXLQLsWtZtoVOzOaBzzV5VjmLcNyiDBR/x6KKoD2edbnxuYJMAB6YmDhC04M
 XKfCMct6289ezoxLIcVJqlHh8TKz8yN56GYE7T8zrxf2B4n63PtGsNh4sN738hGWOqnf
 v8O5v0jBz454KXldla/f59aRA+cirVCAu5yUy/zeQP7xLVKVZUc7XLVTq4ltstUMemzt
 E9vUM3GfCQbWoRui9CHJgzFMoPuPUj7ovZ1dly2RZwh8lqn8zGaUVVDOXwdWr4PHDYoF
 yDJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXaZf79L4GY7end7Bx9gch6M6O0JyDpPha/reS6LrsXwuz0dB/oK6hQKmCn2m8seDv2n6tvb7xnA==@nongnu.org
X-Gm-Message-State: AOJu0Yz1yQiUy3Y3q9kPXd0TOAdX0egaAKkfQTSZ9HePMnpYa7iVHVrU
 /nwuKDSumkY/QAcVJDBH/W5KsTBuvVQjq+OdUtx0O2EJYMmIjeHtWyUmeHVOIk0=
X-Gm-Gg: ASbGncuVOBWH+W84WJ5Kn4Z7pHdRuXVufGaDx1PhkO2tr+rRnO0HtqjD/m5IohVCm7p
 STysFONPwmUAvjTdRSusNO6QpoCEo1s4eAhbSbImVakB66JHQDsY55fhbNr/LcNGyMo+9kadZo/
 Pjtu2m0iaJViy7ZFpryDu9w1aeMRhdUqo5CjjAvlJpMseIWba4CEjxeqz+/EO+g+SqxE/4FMsUN
 3L9ApwHix98SDmKORyqHqLQCvISiiEqV4lmpV551Arp/b/l0PQlRIjq3lxV+XSDtQwZXjZ7xkGM
 DSNxba3by0wHPHzRHk9SzMAS8maHgrs9jAfY
X-Received: by 2002:a05:6000:1f85:b0:386:4a0c:fe17 with SMTP id
 ffacd0b85a97d-38a872e9105mr26380872f8f.27.1736961059142; 
 Wed, 15 Jan 2025 09:10:59 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38378csm18013507f8f.25.2025.01.15.09.10.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jan 2025 09:10:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/13] hw/arm/virt: Remove deprecated virt-2.11 machine
Date: Wed, 15 Jan 2025 18:10:06 +0100
Message-ID: <20250115171009.19302-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115171009.19302-1-philmd@linaro.org>
References: <20250115171009.19302-1-philmd@linaro.org>
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
X-TUID: evkcBnJo2es0

This machines has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/removed-features.rst |  2 +-
 hw/arm/virt.c                   | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 7c8b98fcdf9..0594bbd4363 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -1065,7 +1065,7 @@ for all machine types using the PXA2xx and OMAP2 SoCs. We are also
 dropping the ``cheetah`` OMAP1 board, because we don't have any
 test images for it and don't know of anybody who does.
 
-Arm ``virt-2.6`` up to ``virt-2.10`` (removed in 10.0)
+Arm ``virt-2.6`` up to ``virt-2.11`` (removed in 10.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 These versioned machines have been supported for a period of more than 6 years.
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dd44fb30773..ae331df9349 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3525,13 +3525,3 @@ static void virt_machine_2_12_options(MachineClass *mc)
     mc->max_cpus = 255;
 }
 DEFINE_VIRT_MACHINE(2, 12)
-
-static void virt_machine_2_11_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_2_12_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_2_11, hw_compat_2_11_len);
-    vmc->smbios_old_sys_ver = true;
-}
-DEFINE_VIRT_MACHINE(2, 11)
-- 
2.47.1

