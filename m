Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3170397dlj;
        Wed, 15 Jan 2025 09:10:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXw13DD956BX1uwOYjPVM76Q04JRIQL/6TnrUKFkMZIvsLojyxe+BKhTZFxEOpKMn4WrdPqiMV8XiZSTA==@linaro.org
X-Google-Smtp-Source: AGHT+IHXbbOL+cmTCNcykCyCIjGaF9DtqTsIonH7ewV8Lu8zGyzhdbViOYx3lYQMZpxT2uLu6Gcy
X-Received: by 2002:a05:620a:2947:b0:7b6:742d:c01e with SMTP id af79cd13be357-7bcd974fd39mr5146793685a.25.1736961051113;
        Wed, 15 Jan 2025 09:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961051; cv=none;
        d=google.com; s=arc-20240605;
        b=CxNDCGpt5anbBlewZPShSWY/2oHJPRhyUnZ02RxMdfqlxECBA/UjPxMxMln4wK8QNG
         6p5zargRpZHIDvD9tppUop69aqPJQAF+rggA+YNiSnwtuY4l6cxiECLMIaxu7lGI4nqJ
         qXsEBaZdT0KAYqU4RTRH1kZ1CpK2DF9b7tZ5YCoKDb/16j3AwJRLEj4lA2gNdpwbtn1n
         HjsP3m1+aErwvtRTcJlrqbYVOUSv8s/WMIWiVn0dBE5RHSeQBc6TlSeZQEF/JVCGA5Vo
         I2lun0vfgn8EPK0ih+ou3eMCU/Ex0BHxIeUlkGXgtuMBy6yL4CvO8y1J9sZfqqzZs9Q3
         tlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KLyfo8A7IZIE7IOrZd9qH5+UHn+eynSluJZ+bRJ10/s=;
        fh=AkLZo0XR+pExfr+1BDg9lM5ZCCtSF3gkmMHjgY+An3s=;
        b=gwC/B2fZ3lPSy81gi4ZbWqKjBLCoRFO3cJfCBmUTweQvpE2zLyTHtKHhdiuaOBNfrr
         ffkzAXpzBzUIyZ5wfUUqEMA7yKPyzkv+JJV3e3Ttr7iuavHqs+gChzmQ7P/bxTMMeiZy
         G/5X97fvh/q9CElvPYu1IE57IZ4eryKD4Zzfn12dGeuM7PiLvnxsafEDIUn3UztNoMlq
         2szODsINwcmFxsiy9hoVr7Br1mynT7w6jY+6l5r/dzJlW5KCCB5bMXfn9M1TM33xDT9z
         jiZVGIDaRn+JZ8vN8kLLIBOanDsxDLarprWDvrcRsVNRMFidnSQ0w6G1qAzsEhFqCEYB
         Qp9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1mof02f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce33072b3si1685551185a.293.2025.01.15.09.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1mof02f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY6uk-0007Qw-Vp; Wed, 15 Jan 2025 12:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6ug-0007QG-Sr
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:42 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uf-0006ZW-9z
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso72278335e9.0
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961040; x=1737565840; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KLyfo8A7IZIE7IOrZd9qH5+UHn+eynSluJZ+bRJ10/s=;
 b=Y1mof02fdBTswiEUSGVm4FqMYLmwpohZLULN7oTQyFOWLHNQf8cLAweM231D0tyEwu
 EjaqkvRH6ah4T4z/cFMPPsHGyzBBPwWcU79KHWW1hGojhAK8eqQQifggW8MT9oq+UKkp
 cSHjqx1Zwlzxhd/l0zrzzYUpAIZBGNn6KWOIdhdD0XQ37g6MgQiOjISb8zAWe/tJeo/U
 6JYdTorirH3WDILqSEmYcRMA+O2CEVKd/xXIQBK8pRIeDioWC+1sQgsG+z+EXhPLvYHl
 9bMckJ6FS9pzgrHgJsK4btSXaZsN3XFT73sRMsDffNPmJddu47d0IJx5NNqFooVDvvBZ
 uOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961040; x=1737565840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KLyfo8A7IZIE7IOrZd9qH5+UHn+eynSluJZ+bRJ10/s=;
 b=OThE6QUx/u7kGfRk5RiqCeC+ztBVUvO/rS1fruQQigpARrX/Xxsa3IL1jDHOrjGGJu
 +S/FxG2pRjuYpJQZH5kI1xnJZJnNpxRe4gz3EXIVelnmxDj5ir3OQegrSjyzhdordwZI
 T9NhvvMnwytoKWGpf5lwzwn86g2oM5Q8BJKkDQixvcXCP+/EiQonHTaqrd4zP7CG4xcT
 YzAosa/bWOYFvzfA8m5S1kyylZrFACIzXvYxoVLx/cfIid+SWDsO1DOwl7/HDAGmf8lw
 ncS/gpf5cl6mdSUtQDuq34fYvIH489VdSpwKNAX6P5zbL6cVM4fQ/2Cxjftq0XIIQFkg
 XGbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVl6G6AFsyYIJahXETqOn6Ai4QedoRsRRwEuRUMsww2AFHmBHUz6fsB4ZBR2lzFKQo/ceV7UqPHw==@nongnu.org
X-Gm-Message-State: AOJu0YzW48L+UiqI3UOKRRFLXYInTXPeNsjwUm1X4pWi5uccVNnbJkha
 02QB6ak5WIQxXcWqR62flDoFoXfVYDhmR7+N5SSHciFzYpM/tvK5Z4PJZwGFaeQ=
X-Gm-Gg: ASbGnculDE+EVhedeYrShoT7YwVy/MDDkrTUILkUhHvPAW0AeaLDDQoCAll/R7hNiIJ
 1KAz6Nn/7tkSVKcWcqifxmSULlTmUldhzpJbR4s8fb/HZdZM/+nBgc89BEtBvrnadVb9+woLzsX
 NzScRhMNN2VnfSa2CSouGn3+YjZD8AFxudacXM4fnJ0z4vFk6xrjAYKH2bL7MC+Ze/AqIuBu+Mq
 pRzKKg0x1P+l5ZIlZBH2c8knNiO+iRnfizvuyVgL63sl9N0E7XbhFyGhlahV5e0KQlAOdg9vS2T
 oSrj+EKRIENDLFs9W1wrLSHg+28eoLrw81yy
X-Received: by 2002:a5d:64ed:0:b0:38a:4b8a:e477 with SMTP id
 ffacd0b85a97d-38a87306a84mr28026807f8f.22.1736961039922; 
 Wed, 15 Jan 2025 09:10:39 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74995f6sm30405545e9.1.2025.01.15.09.10.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jan 2025 09:10:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/13] hw/arm/virt: Remove deprecated virt-2.8 machine
Date: Wed, 15 Jan 2025 18:10:02 +0100
Message-ID: <20250115171009.19302-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115171009.19302-1-philmd@linaro.org>
References: <20250115171009.19302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: qo0RAJvV+Diu

This machines has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/removed-features.rst |  4 ++--
 hw/arm/virt.c                   | 13 -------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 435f081d805..732ec2cd05d 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -1065,8 +1065,8 @@ for all machine types using the PXA2xx and OMAP2 SoCs. We are also
 dropping the ``cheetah`` OMAP1 board, because we don't have any
 test images for it and don't know of anybody who does.
 
-Arm ``virt-2.6`` and ``virt-2.7`` (removed in 10.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''
+Arm ``virt-2.6`` up to ``virt-2.8`` (removed in 10.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
 These versioned machines have been supported for a period of more than 6 years.
 
 linux-user mode CPUs
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d7a7cee79df..4ec94190769 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3556,16 +3556,3 @@ static void virt_machine_2_9_options(MachineClass *mc)
     compat_props_add(mc->compat_props, hw_compat_2_9, hw_compat_2_9_len);
 }
 DEFINE_VIRT_MACHINE(2, 9)
-
-static void virt_machine_2_8_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_2_9_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_2_8, hw_compat_2_8_len);
-    /* For 2.8 and earlier we falsely claimed in the DT that
-     * our timers were edge-triggered, not level-triggered.
-     */
-    vmc->claim_edge_triggered_timers = true;
-}
-DEFINE_VIRT_MACHINE(2, 8)
-- 
2.47.1

