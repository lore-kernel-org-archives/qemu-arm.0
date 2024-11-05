Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2806750njc;
        Tue, 5 Nov 2024 05:06:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcp5istaFwPhIsnzErqVveBLcRzlGQL5eBm2NdVW67Wihb5a6P1IMXf7nGa71Lm2Cty/jxw1bEWiBoXg==@linaro.org
X-Google-Smtp-Source: AGHT+IFa+cNkNDhVGgUJvIwCHE4+emVBm1ILTHjjTqMycm+OgYAD/ymDDsTlqVrmlTrgzrTA87cV
X-Received: by 2002:a05:622a:1825:b0:462:a6d8:d13e with SMTP id d75a77b69052e-462b876d66emr240775871cf.51.1730811987374;
        Tue, 05 Nov 2024 05:06:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730811987; cv=none;
        d=google.com; s=arc-20240605;
        b=XmtOvG40qKlD0HpCWMfJLZJtw1F80CZSC/25k0j58v3HkkzMg9fwN2DUK2V+nfCfQO
         Qgg4AtHPI3P6Jl7wEJUWY8vgYLMsQ/P8h0WMvICSQJE6mzh31mizDODVRZy/KHeQiIF8
         yGtgRU091vyMX99ARUb6G7+r5JI6sfhZQs2CfPETUiHKMhAHOzu4M69Znkju/sLZJ3oI
         X3B55G4eAMLfZHd9kIpo5ifYO2P60lzEVvnPQ61uQfqpcsFTvGIOOLJ8GMkRvjSdIl2t
         EGY8yyyB9Hw/MYGZ1+SLTbvl0bOmp97jiuv6EFBc/gbyDj/cNda8ODumr1ca6FAvQTin
         etZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kz42cmMFB8jc7GreGUWRF6XY9EJ0BnYu9J8zOkqLmVs=;
        fh=ffK9JL+ZzoMZP1sB5Xwa4ZY4u/oqNFGKgVQsFShVcJQ=;
        b=eEQ3ZeqDfXAM6PtyTe/jNmsuXDC5SEO4l7aVfYA+5IGkWGsZvf8CiQrLcbjCzaOTCD
         S2nC0QBTcA6qeiG39v5RHNO4XQCxDndF3Jdg0miT4BBRpVfyyRTgCzxRn6L+KJAuIsMx
         BduHAMhYsIdXPLbhM5uzBExbgLaGrcSCs/a1HWWIoyD6+aO0qQ7i7qI/tZfpEoXEWNmF
         VrHVAI9nFz9McsfTBzJawWJYBCcRxAyJIzjwA2umCgZpsEjfgcb549FXdkT8JSFVE+7O
         WIjWYlfsUqv/Ugrllbut2AWgVkSmb1jr/0jC1W6hXF7CvhWTU9OzA9RH86VmxxK6mCv0
         KLIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yvd+TdA2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1f2b15si142979911cf.460.2024.11.05.05.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:06:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yvd+TdA2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JGB-0003qG-Jh; Tue, 05 Nov 2024 08:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JG5-0003eC-4X
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:06:09 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JG3-0002Yv-Aj
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:06:08 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d3ecad390so4093085f8f.1
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730811966; x=1731416766; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kz42cmMFB8jc7GreGUWRF6XY9EJ0BnYu9J8zOkqLmVs=;
 b=Yvd+TdA2OZ0srQfysSZYncN9VXypsibYwkQm5JWQvYAzvNW34b/6RMRLs0cGdi4hZE
 XYBQD0iVkBywoZqM9tPLtO3g2nxdFtRj95N4+uC7j8QNOrgk0lhYJ2bPO7J+33tPi25x
 BMC/+zZ1wDEge9ZgYys16PUE3/QtNXbVZ53QELIGQHNtPx6Pc8MZCBwQqrH1uehrL3j7
 oHfP2TYk/WhlHvQG1dVGhxgyY9kOoscUF+kUuzjOA6UVST7jp8y9H0aIRBmvVT82OKm2
 sdFM8b7NCT50nDWu8ghorYMn8fM7fZ/4ie5RKgH+ZFNFDGQvJKP56LfBsIeJLiTBqeiH
 2W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730811966; x=1731416766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kz42cmMFB8jc7GreGUWRF6XY9EJ0BnYu9J8zOkqLmVs=;
 b=uQY4VWZZzWW6ZGVxijPq2qh2A9LilqoVXPW7SSRObDNZDHBsTzYnNp/INyH2zIZfsq
 PnCysNKiTrSgWU9/N44XPR3h0hAgfG8alXvKH9FVZEJ7Dz7twzOLdczdyO4FUgDx7EdE
 iXPo4fmnVC7PeHtROZU1sFvKDez3f9QOBw7B/cXpP9XzSFoQj5IQdUpBlQ0cFZ57eVHg
 C4dMn3E+Ludfj/ca5Wj4KQ0eqfMnAfLVm/oEsuwCypWUL5aeZ8OU5CHUyV8tObjvXFZ1
 R5UkJMs4R5e7od1v1UU9t6dScw2F7s8M/qhHuX9c2NP+Wm671WsB5CiHYodATJLSwxCB
 mvXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsLjto/z4o2z/q5GmPG6HMR/xv4NKdMhdZvNMmThdnCA/F3eCeDUxpXv7Cr9CM2ij2oyy7aMB3eg==@nongnu.org
X-Gm-Message-State: AOJu0YzEJg0zZtf3Ght44xh2lfLl+wVpBwn+1nk1yKxTUJIpLRUpnDeW
 p6riJFJpvr58nJM52dCGDYbAindDYFBMC58G50rkPGNqrNJktj1OYCbejojT4dA=
X-Received: by 2002:a05:6000:718:b0:37c:f561:1130 with SMTP id
 ffacd0b85a97d-381c149f129mr15229256f8f.18.1730811965862; 
 Tue, 05 Nov 2024 05:06:05 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7bb7sm16338383f8f.3.2024.11.05.05.06.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:06:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/19] hw/intc/xilinx_intc: Only expect big-endian accesses
Date: Tue,  5 Nov 2024 14:04:21 +0100
Message-ID: <20241105130431.22564-10-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105130431.22564-1-philmd@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: RtN9pO1t626c

Per the datasheet (reference added in file header, p.9)
'Programming Model' -> 'Register Data Types and Organization':

    "The XPS INTC registers are read as big-endian data"

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/xilinx_intc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index 1762b34564e..71f743a1f14 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -3,6 +3,9 @@
  *
  * Copyright (c) 2009 Edgar E. Iglesias.
  *
+ * https://docs.amd.com/v/u/en-US/xps_intc
+ * DS572: LogiCORE IP XPS Interrupt Controller (v2.01a)
+ *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
  * in the Software without restriction, including without limitation the rights
@@ -143,12 +146,20 @@ static void pic_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps pic_ops = {
     .read = pic_read,
     .write = pic_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    /* The XPS INTC registers are read as big-endian data. */
+    .endianness = DEVICE_BIG_ENDIAN,
     .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
     .valid = {
+        /*
+         * All XPS INTC registers are accessed through the PLB interface.
+         * The base address for these registers is provided by the
+         * configuration parameter, C_BASEADDR. Each register is 32 bits
+         * although some bits may be unused and is accessed on a 4-byte
+         * boundary offset from the base address.
+         */
         .min_access_size = 4,
         .max_access_size = 4,
     },
-- 
2.45.2

