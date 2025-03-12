Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp160423njc;
        Wed, 12 Mar 2025 03:48:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlZkMvXnvZwmumzathirzPYW51Y+aqYVKEThrV1sRXankWEtTBTwgoECUgbk9qqHFRJCn5WULfhVjPUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH2doyVcm9ozuBBlQ54Vb4k7pzWo2o4yFFF9ykMTjiQEZi0E10hYIAFxueyrqUV8m0sP5go
X-Received: by 2002:a05:620a:8810:b0:7c5:5d4b:e62a with SMTP id af79cd13be357-7c55e93bb5cmr1370104985a.54.1741776522543;
        Wed, 12 Mar 2025 03:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741776522; cv=none;
        d=google.com; s=arc-20240605;
        b=FVx3nUKlt/yGBEpYNUvTPt+EVYK4T0/umhdpIZwaYQg6ZgUo20u5AUcJI8L9mSTd0t
         7QkpnjOKR1lpLSJea1OXB6zTFwkdXbZoOJqR6w0pgnO3x+epc8o3qjMAaLAjqbLYO1h0
         ayQWV8w39q/wKsY/Q56DVaJP3YNqviE4oelu6Q/FA67w5GkFn+1zCGL330Ps/Jmpu3rm
         NlTJutyoscW2CpHcXVYD43VhlfhGL/k8BHUb2zoxVl6wAWouhGzce0iuWT1QehsA/Il/
         z23SIC3glj+5RBB6npxLVxps1ygp72wnouUvLzeDgPOnvSUU82dpg3qh2NWU4EIzB/kS
         psNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bGTk3wZieMnMBHFN56YbH1bCGtYh8kBdfeLs078qQRo=;
        fh=zhpBvWf3a2N9KQbECFcPm8QQs6fF4wwT0dLz0UfEc7c=;
        b=GjMA0/HynYi0uARW15NoFSpPmQ0hsPWY+wifFMkPHTV6ZWij/yVjpjeyGep+6+ijn8
         fwevTC6cjUSeT8wEZ9X7Wh03BCGNXKHV27zXn49JpI+mM9QbZgxeoNHn2O+mPl52hrIN
         YtJx5r9XB7B9sVLgJgxruCsCpHT0omrpfiUeAGcfE3nRGxlsotSYNnqutGotLYFSG92+
         HlqdEUrtFBwDxFR2kUoCQPXmt52SAzsLx45w7VSd4bvYLpNbuMRLeodiKwfihCbAlmIV
         1JNl3oStVgoMFJKHvjelfD0Rr+Tb1OfZuJA7vsQGG1DvesaA4pPr5OVvwnxcdU21qt08
         SoPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hDkVtQ2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c53e7136fcsi907408685a.144.2025.03.12.03.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 03:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hDkVtQ2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsJdY-0006tm-QK; Wed, 12 Mar 2025 06:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tsJdV-0006qy-Gp
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 06:48:29 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tsJdT-0003uf-H5
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 06:48:29 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so38984105e9.3
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 03:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741776505; x=1742381305; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bGTk3wZieMnMBHFN56YbH1bCGtYh8kBdfeLs078qQRo=;
 b=hDkVtQ2RK1Al64rEhSl0+th8E8RusTtmcI1Vsc2Wqv5kPb0xWzztL1koAt+tFcmqsl
 1LtwCzU/iIVbeoikjrztEWCpfmrhqVA7cRP/zYlXs25Lttm4QwMSiYVOByIK4bgEZgLq
 kBU4+C5+gHD5/MWcfCDTDdsUrGarqNAKnEh/+lMtHaqKzDYAbOr4XWeO8Khu3CjGbQBk
 2AR7m1KWqsN47S+hhK4vJdhLoxDAtldd7do6L5WF7UbVapjPL1LUWAgMik1vSsEl/6pX
 mZfCD2bEEYB0WX67UsPvoW+LtgXR+ON/lr6xkumFpdLuRNJ9gPi6RwwGN7KRyW7WmJVA
 eD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741776505; x=1742381305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bGTk3wZieMnMBHFN56YbH1bCGtYh8kBdfeLs078qQRo=;
 b=rN8gsVZXFPFAqZCrHMxZKkQm7tDVb3QlmORMyWb9QURVFVIx6nOSYUyMOjC9e7MQj8
 /uYdHrRVdyHDrdqWvjWuI2+iiY2Y2pCwlCh3DXj73JlW8EZ5L9SSLdPMbHvpoS2XkKxM
 Z4vM25br31nSAsR53ggaRRKB8TyEiAknD4EnKdHXEiqmjuuCLsDrAzYngBf11IMUCi+w
 rb01iAMaTCtPj0UJnZfh8j/GZwcruJeOvhyEw8p4A9Q1f9DNxHx5jl6gt09cyhLJo8Ge
 Xl5YcnJUfJyVnfkWNfL39H1W3ZVshlrEHUinOrnBhKla4up+zpJSVnvKGwa4Wei3gRkN
 3zrQ==
X-Gm-Message-State: AOJu0YzotUMUsPp9GWE8qZOtIuWWqg/crrrhwXnWTv7SBzOXmEtluL8w
 qqb63YM0Y3yV00dShXo0WXQ39dD0yoUXKWJIw5egEOy6NS6G+6jA2p2nwGZzPGk=
X-Gm-Gg: ASbGncukg1RnN13ghnOYHFu1ERPma5qabIuk6lJ5i5HG8lMsNEqMckvuUaQu0/sN357
 UtYjsq1PwsYN4Hg0liCHhkBMgVFUxA030B+Soo3z/1oYQnNGONqhgFk0LmXgwwO7UdIjTdCHe7P
 BENbFINFldTWMPrHt58fAfXHmcFITtWPJpb2xWiyOEPGlfvDTpVbhtimo3KJeAG/p/wSBoWjd3+
 S0MTTqZEIfAwo+s+WiKLU2B0iKfBGNml01mla2VZX6njgwceOgIp5DHp7SUX+H3Ik4+4o12hd2Z
 e7/gbYMglHzlicgqL9SHAgRxnNU+kBX3gBKzrq2UHJN0dNCtZRNkGMlDxNMTyWnFgTq2h+W9MeV
 RxfPerJSGYgoBTg==
X-Received: by 2002:a05:600c:4e8f:b0:43b:cc3c:60bc with SMTP id
 5b1f17b1804b1-43d01be6503mr75918495e9.15.1741776504870; 
 Wed, 12 Mar 2025 03:48:24 -0700 (PDT)
Received: from localhost.localdomain (99.167.185.81.rev.sfr.net.
 [81.185.167.99]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a72ed3csm17441755e9.6.2025.03.12.03.48.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Mar 2025 03:48:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Tony Nguyen <tony.nguyen@bt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v2] hw/arm/armv7m: Expose and access System Control
 Space as little endian
Date: Wed, 12 Mar 2025 11:48:21 +0100
Message-ID: <20250312104821.1012-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
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
X-TUID: IyXeiCYBucvf

We only build ARM system emulators using little
endianness, so the MO_TE definition always expands to
MO_LE, and DEVICE_TARGET_ENDIAN to DEVICE_LITTLE_ENDIAN.

Replace the definitions by their expanded value, making
it closer to the Armv7-M Architecture Reference Manual
(ARM DDI 0403E) description:

  The System Control Space (SCS, address range 0xE000E000 to
  0xE000EFFF) is a memory-mapped 4KB address space that provides
  32-bit registers for configuration, status reporting and control.
  All accesses to the SCS are little endian.

Fixes: d5d680cacc ("memory: Access MemoryRegion with endianness")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 98a69846119..64009174b97 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -140,7 +140,7 @@ static MemTxResult v7m_sysreg_ns_write(void *opaque, hwaddr addr,
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
         return memory_region_dispatch_write(mr, addr, value,
-                                            size_memop(size) | MO_TE, attrs);
+                                            size_memop(size) | MO_LE, attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -160,7 +160,7 @@ static MemTxResult v7m_sysreg_ns_read(void *opaque, hwaddr addr,
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
         return memory_region_dispatch_read(mr, addr, data,
-                                           size_memop(size) | MO_TE, attrs);
+                                           size_memop(size) | MO_LE, attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -174,7 +174,7 @@ static MemTxResult v7m_sysreg_ns_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps v7m_sysreg_ns_ops = {
     .read_with_attrs = v7m_sysreg_ns_read,
     .write_with_attrs = v7m_sysreg_ns_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static MemTxResult v7m_systick_write(void *opaque, hwaddr addr,
@@ -187,7 +187,7 @@ static MemTxResult v7m_systick_write(void *opaque, hwaddr addr,
     /* Direct the access to the correct systick */
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
     return memory_region_dispatch_write(mr, addr, value,
-                                        size_memop(size) | MO_TE, attrs);
+                                        size_memop(size) | MO_LE, attrs);
 }
 
 static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
@@ -199,14 +199,14 @@ static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
 
     /* Direct the access to the correct systick */
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
-    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
-                                       attrs);
+    return memory_region_dispatch_read(mr, addr, data,
+                                       size_memop(size) | MO_LE, attrs);
 }
 
 static const MemoryRegionOps v7m_systick_ops = {
     .read_with_attrs = v7m_systick_read,
     .write_with_attrs = v7m_systick_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 /*
-- 
2.47.1

