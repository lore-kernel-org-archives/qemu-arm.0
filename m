Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1114149njk;
        Thu, 17 Apr 2025 16:59:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKWIqBzsHMGBCERQUopLnJS/9/yhFICY/gJS1+3k9m7aZO7MOzG+0MaeBNBvWkGYk4M5pJEASf97yXqw==@linaro.org
X-Google-Smtp-Source: AGHT+IFQ4kqKbE8eRLvT8Av4ge8okr+p6aBIJZ/biDIA6V4FVx+OeUTO/4KNHfJD5NHXea+ng2Ro
X-Received: by 2002:a05:620a:2901:b0:7c7:a6c1:71bc with SMTP id af79cd13be357-7c9280091e0mr145388385a.43.1744934359967;
        Thu, 17 Apr 2025 16:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744934359; cv=none;
        d=google.com; s=arc-20240605;
        b=UPxEeO9HujEiEIu4ijHohcT9cMKgrCyw+HakJDm5Sgxu1ZXu1kLy5H9IkRWc8KRfxC
         pxH9VYQ/TY0N55GwPot+4teU63FQPA5SwUkSTzcak2njIWGrDUoEAVtFONsuK2Gfm/Jn
         xfszZoiSVMXwWhbkRycICzclGgWdEXz0KCohRyVsOnuLlfuYsXEFiDjYg3iLMOAxV6Li
         +qhAe+/jpKQI2+DzaMvhGj4fbcO4xNzVPaL0hNfdL7laMmaM+eM6oyimxrH9XIUTzTy8
         BXvWyiGS3GVibRfhWQy1ljZ+wTFzRkqKnJtspid2xx/XkQGeoMSyuN11G/xq0gDbChhG
         9fLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SRLDxPi9DU57mRVzZF+y7gziW65NUViWJDX+QKf250M=;
        fh=85A14eJQxmox6rRllN7x+op8M8OdlWn4Uar9szblyk8=;
        b=Wq+hPeFBXQcNkwVJeSRth5yb9+uiuZP0AI2YLGLJNciIj9mV844PpeNwKCWJjS2a/W
         1i2zUBxv6YNvO/STblIBX5m9UxTCADOiC29rwibNGrRQP//8073Y9ImPTxHtSpFCjSWs
         PVNRHWwH619u8pB8AgvNI1dlVUepQaqhbJy//W9Tgj3XC7eVo+OdaybF/zoBYVG1dLi/
         bmfFnvdL1S64bLCpACQqRamC4wwAeu6e+C8zhH5FWI5NpqS5+o0vENdqEta+Gpg2YLVN
         uPNbYNASCkrPpe5+1VbcPHToSUj0HrlZerD1uwGGQMyKhqYnTDI3+tVfYjLxiOgV6dqg
         YeZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cA0XvlqF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925bc170fsi91892085a.427.2025.04.17.16.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Apr 2025 16:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cA0XvlqF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u5Z7x-0006ui-RW; Thu, 17 Apr 2025 19:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z7t-0006rq-Dc
 for qemu-devel@nongnu.org; Thu, 17 Apr 2025 19:58:37 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z7r-0003qK-Dx
 for qemu-devel@nongnu.org; Thu, 17 Apr 2025 19:58:37 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso10022445e9.3
 for <qemu-devel@nongnu.org>; Thu, 17 Apr 2025 16:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744934313; x=1745539113; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRLDxPi9DU57mRVzZF+y7gziW65NUViWJDX+QKf250M=;
 b=cA0XvlqF5DHk+8lbH2dqSM5tpqY862Rw+tr2NYeP9JbA726mmLm7rltZBlz78oWORc
 FtmR/2QkKaEHsV6k+EBSUWbpEwFcRaB/VZPfAMgAH0f9iLHO0zXNVBU486SOXgYVztAc
 ZF1xPwM+8cf9/G0MDuA/wOdahSB7ADrimOmTnW43KK9iIV9ta65fB/uP60imdlIUdgXd
 8ItY3/xItVnsKd17sUcAuDwe0Xchy5bOR30tcKlzzqCH1KI/8CB7UVxGIUVCKxNYonyU
 fVFKrh2KG78lVrTlBgawRH3rGOtSCgj6x4uD4DK3esjC/uF7FZWrPiOexfmj+W12UHGM
 HZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934313; x=1745539113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SRLDxPi9DU57mRVzZF+y7gziW65NUViWJDX+QKf250M=;
 b=lld1NQ1ujW6Vt5Ip+bBDWS+Hsyq8jG8wN5tJCn0nVqPktkQdRlOCdRU4QrVrD+VVzm
 oTvi1KZwBJxD3Re6IQpo3u+DgqxU+At+3mXBzfvj/GsoQFtWQSW5v5f/3ncdeT++MEqy
 rY6KCha2pFM5ly5w3tmBgiJYGe4P++SBi9+cOrTV+3CxUU/G590GarB6n2W2MAsf6A5v
 D5toJqRG5qkBXSSTLpoO/SgBZm4Kr78Sme6g77CTB0VARGVHm/cDP9/pt7xENCctzgM5
 sT+qLd+l0eN6XFohSsXSXElX5EOfewyssmA97fb6+oznHcEmyIuy/CDEeFLh6y1Ukw4R
 Di2w==
X-Gm-Message-State: AOJu0Yz+Xd2JOPTE03Ftz2Z70tkglV8+b+8nM18U+ORf9/N/N5PONUHO
 vtl6Y9ayz3toOB+364zj9n6ZdZ+DNFaThb8oduNgIMBB3wvdyAdWkUXWXEbKaNaUie6tBNBSP+h
 u
X-Gm-Gg: ASbGncu7eADGJ8pGVVwrxNkIs7HRoU6Jt9pXx2I9uqJEdT45xWyQtfufA6Sjw+rl52S
 ebaRc6UXOIqQ5rZn7qkNIfl/EGSF+CFa1DtWBGSxRNMTZaPZFk434avhmj3QFqr+V9Uh+TW3/v3
 ubkbcCI5l052whjLJRvTMZRQ8P4EJzYnzyHHJzhVofzekB5UzV1oEh+Ch9/ewTUUhYi32kJslGT
 w5VKVQQ9i7q5I8nOsd05Gc9HjXlkzHVS09V+JELFsg+Snn8iSPrM3Bvep+oFU9CMjYUtyCPwn8m
 d9dHCOhX2tOUpIvZdDYh6FvF9MIhJkRgxPQFvMa6B7ZfMytADD2wocjmb/Irci2JYgK2skciWqb
 TGqQaNbzmJrCWXXYSPbqM
X-Received: by 2002:a05:600c:5107:b0:43d:fa58:700d with SMTP id
 5b1f17b1804b1-4406ac2179dmr4288955e9.32.1744934313162; 
 Thu, 17 Apr 2025 16:58:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5d712esm907335e9.36.2025.04.17.16.58.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Apr 2025 16:58:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Felipe Balbi <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 03/11] hw/arm/cubieboard: Define machine as generic QOM type
Date: Fri, 18 Apr 2025 01:58:06 +0200
Message-ID: <20250417235814.98677-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250417235814.98677-1-philmd@linaro.org>
References: <20250417235814.98677-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: qt31i5tJnfp8

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/cubieboard.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index d665d4edd97..36062ac7037 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -106,12 +106,13 @@ static void cubieboard_init(MachineState *machine)
     arm_load_kernel(&a10->cpu, machine, &cubieboard_binfo);
 }
 
-static void cubieboard_machine_init(MachineClass *mc)
+static void cubieboard_machine_class_init(ObjectClass *oc, void *data)
 {
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-a8"),
         NULL
     };
+    MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "cubietech cubieboard (Cortex-A8)";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a8");
@@ -125,4 +126,12 @@ static void cubieboard_machine_init(MachineClass *mc)
     mc->auto_create_sdcard = true;
 }
 
-DEFINE_MACHINE("cubieboard", cubieboard_machine_init)
+static const TypeInfo cubieboard_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("cubieboard"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = cubieboard_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(cubieboard_machine_types)
-- 
2.47.1

