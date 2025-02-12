Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp931774njb;
        Wed, 12 Feb 2025 03:40:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwPlrK1NPfayN+UyQxE8Y99We4VsS6mKy9rrC5lG3P9VRE/Bam73OAO7icwP7pau5dGUpXyPVOkI32EQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEnEOHTksARmDhth184dJAJ59pSFN+CxvseDF3gR8H3ENXBbZi34sfWnYEnKuTuvSasLxEJ
X-Received: by 2002:a05:600c:3b8a:b0:434:f5c0:328d with SMTP id 5b1f17b1804b1-439581be34cmr25869065e9.23.1739360426771;
        Wed, 12 Feb 2025 03:40:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739360426; cv=none;
        d=google.com; s=arc-20240605;
        b=EeNtyb1Al7CRZl5ys6ZOVCfUEKry6w5wtvtgsZzsCBQ+4a5SHGNcjCQqReV0qdpkAP
         AkXUbdiALwfzm0Fn2CEGxSjf+DjHIVd6zNg8lSNj03FlmqcpSCepR0SNWjxFi57WZPr+
         1RpA15SXcb+uvNag/CDt1D8N5ma0alWNxqQIg3pv2CmXf7w+KuhtaYil2n9OW5/1B66w
         lzjiRb3wLYLCwCCor2Ni1XVU4XtQtLgnEJkunfbBLc9dPDXI9eIsLpl+AuaCaveVMlBY
         2gtBAdlwTjaKVG3oTHOILplx3QNCHSfri35bwK0fiXiJXtCnVlOsb7fPgpYUgga7Xlp8
         Z8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/lnuOrrxbUSsaSab52olqEN/RXFUH57MkuMIqAsCkZo=;
        fh=NqMctar6iWHqVSN2H0jyrYx7Z1MVRv8nYSo0J/Y1G4U=;
        b=XywpxZjN6ZOeELLSMgQPQiyLOy1Gy2feVaeT3jMwmRUp6je1PCvNnyPDtHWr5Fbarv
         e6zW3/svKY/75xpvUN0hk3eB6tsfFps7jb62XZfMoZx20ynbLxql6+58aA7n9zj+unJp
         CSNC3QHhF+o1p99B9VFHUunG4Pvu7merabVoZb/1LEWJgHBvlGyFwj08DIfcivLji3T6
         bQHOPJcBranPY/kXCayXpuIoP213MhPqPRFW1qHdvHq+a9hYUibdkiybCSFCKxD22hqL
         d2NvmSa5etDOLK0WbCy46xORH2IiaIPWUvu0OB07Yrv0u4k7cLhCxw7oTADk+RZwAh6o
         /qrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PaWW6vcM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4395a37cc78si8439205e9.79.2025.02.12.03.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:40:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PaWW6vcM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiB64-0002Io-81; Wed, 12 Feb 2025 06:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiB60-0002HG-Cp
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:40:00 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiB5y-0000k2-3w
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:39:59 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so3486104f8f.0
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739360395; x=1739965195; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lnuOrrxbUSsaSab52olqEN/RXFUH57MkuMIqAsCkZo=;
 b=PaWW6vcML2v/AvWInuS73asjXgaw1QZ3Z1vUQ7sPr6BY58LiOo4jSJbq40Pqaz4ahZ
 RvC+aeu2JD1suGNnJFYBT/dR0TDXxYJEYsEtpTpcNt8s/xlw4QWSGTO54GMsVMGPo0S6
 8SI+WBcwWB5zu+yBlHHobMJ4/TgtdRnPOqG+FoxX7YMXfKu/GrPaQa/EuvSmbiRrNgK7
 NnNiVo+ujGT20gZEsvgRrsbUxc+/z28QO552fFfoS7BSEyJDDGTqfxyfpKGtkEkxIuZt
 InSiDlCpAtknMLwk+6uITWYqSCpqSb2ZFgRKGanwwcEIOzIeAJlxhVmqzC+cwcScyv8P
 MIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739360395; x=1739965195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/lnuOrrxbUSsaSab52olqEN/RXFUH57MkuMIqAsCkZo=;
 b=eysA+OL49oeoLudSCXCKkXqAALLtDjcA6e4I2L2+nm4/tv2ewBAj86SbqEzqaE9nhw
 VA636OlrFGN4uz5zlFOpHdSV75kASwtREH8GMGjG5fZfPSMV9G3cOlcZayvDD1ltATbk
 OtZriNhHSNmmJeuSfllV0hcZv6BscQkAidO6enA+y2u4G0QH+IEZWWn2QeFuHK/JI0b/
 pkKaoxk1VuUlonxWRFRA6ESdp8OdiWVL6fma1PUHTERltXHXN5mGYUiE0RSgq7gSI0Zv
 IXWY7TTPjgXUbxPVdwPgnlHfBhvSh+6QpMVQTD7/D6yU5Nw1Gmm3CXAqVYpxCYpadX66
 TnOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhxbwt48oj4lVA5gnQINMih4wRLaCixjEuA+vN7pdqnEBQMCDl/4AO5gZdm67kPQWZf4QTiEMLbg==@nongnu.org
X-Gm-Message-State: AOJu0YySTR41d1fnuBmmDsF39BGPCKxlHSddNhVH9nNsmKV3+BzWb3n8
 2hTJJIvRsjy5YD/cVUbIFtXdBwICrFusVYtSNaLSQDfstlEIqblcN1lOODHSaQE=
X-Gm-Gg: ASbGncsS1AL7Un10AHA0FtJ/+eTFZpXYVry0LrHU77uVH5b9YgOZCj+8V4vNEfc5pT2
 cj1QxB1O2syeEtX6uUW8sDMruQg+H8Z5KsDGkmq/gjMpqjd7/1em1RVZ4Jf/lDKPNzDB4oyUjvK
 BDKEVRIVWhD+bnt2ZFkQzTDnSWVIeShSzmEYaGXOSprnKEfcrlZegf0+H2efBLeipabnqjy6j5B
 pasZWDy5DS8PSrhHoc9ZJUz8JQ4ePqsSyHauif0dc2mswUPwBfiVFcM0rKpXhSsBquEvkRXTP32
 9pQTLefwtcUKdYkXE+FOBxrtRBXSYvP9XhcK0jPWQGONL8LTec/lGgsr5ehV768+cw==
X-Received: by 2002:a05:6000:4029:b0:38b:f44b:8663 with SMTP id
 ffacd0b85a97d-38dea2e0aa4mr2536329f8f.55.1739360394937; 
 Wed, 12 Feb 2025 03:39:54 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a055859sm17379705e9.10.2025.02.12.03.39.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:39:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Burton <paulburton@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH 3/5] hw/mips: Mark Loonson3 Virt machine devices as
 little-endian
Date: Wed, 12 Feb 2025 12:39:36 +0100
Message-ID: <20250212113938.38692-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212113938.38692-1-philmd@linaro.org>
References: <20250212113938.38692-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: fQ+Lfv/h01S+

The Loonson3 Virt machine is only built as little-endian.
Therefore the DEVICE_NATIVE_ENDIAN definition expand to
DEVICE_LITTLE_ENDIAN (besides, the DEVICE_BIG_ENDIAN case
isn't tested). Simplify directly using DEVICE_LITTLE_ENDIAN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/loongson3_virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index 831fddb1bd7..db1cc513147 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -144,7 +144,7 @@ static void loongson3_pm_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps loongson3_pm_ops = {
     .read  = loongson3_pm_read,
     .write = loongson3_pm_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
         .max_access_size = 1
@@ -560,7 +560,7 @@ static void mips_loongson3_virt_init(MachineState *machine)
 
     serial_mm_init(address_space_mem, virt_memmap[VIRT_UART].base, 0,
                    qdev_get_gpio_in(liointc, UART_IRQ), 115200, serial_hd(0),
-                   DEVICE_NATIVE_ENDIAN);
+                   DEVICE_LITTLE_ENDIAN);
 
     sysbus_create_simple("goldfish_rtc", virt_memmap[VIRT_RTC].base,
                          qdev_get_gpio_in(liointc, RTC_IRQ));
-- 
2.47.1

