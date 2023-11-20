Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp65502ejy;
        Mon, 20 Nov 2023 13:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/mbi9txVp6cqtcdSNRlPB+RydTCbbvku9vZqaXFgTkZRxpFTiaJYDafEID8LhUpJKk05Q
X-Received: by 2002:a05:6214:cad:b0:65a:f5e3:5ac0 with SMTP id s13-20020a0562140cad00b0065af5e35ac0mr11876234qvs.51.1700516149488;
        Mon, 20 Nov 2023 13:35:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516149; cv=none;
        d=google.com; s=arc-20160816;
        b=LkUlL4xLxKqr8Brlupe+3SUhtiSW97snw7r/j7zsXKfzzz8kR31VyZzt0OpMeHm5ma
         rztjsqSmiusYkImOmh3VxSJk1k0HYoBG8jOcQ3qx/Df5oW0PhAEe9y9owq1syqjYO9NB
         GZPf2VjEZxAI0+mPVvHFNTO+i+LWY1NLigmISPGcc4ZiKvHTHBcxbR7mSTZMjjsl1yWi
         1IwQoKNU7wTyHwqCCM1mekRQKN2s8qTo0eNA4snglDvZumJmxIcYikgvNf7FlFQcH3Kq
         8IzhvUTqMsk4XUSHns/Xljz3vOUkQld1tUKBK+84WOZ1JNGbMvXRdejdiJFE7GY44CGp
         H88w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DIex8QjcVHMzUQGfRlZtiLonUpnm8G6I3FWEQ6zYP+4=;
        fh=toXMQ9nuJ3L4CLQ8EKaTQ8L/ltDlD3GauRZSJpgYVzU=;
        b=Ax8BL4T9lzvsjVmRNzGZcxF2MaRfIZey1ZLnijMDiUr9dDiDQ3yl2GvOGPaOyg78yB
         v4AB+8Qtn0jcT4TLLiH3ngFzpU5lSOPg55yH/pmpxTrZLwzfWWlryk55ogvzUQSF+6t4
         IOflDwz9RHuEGafZigw5hXghPOMmHy2MyfN+e5TsJAk1iAZDR19mw6811vfOFxxBUVBG
         r0QEgX1IrO90tzJSZy/CkkAKNEvC86kDXOPbu/jrptFtD1zgAIe3PKqnLfDK7hbeiNDI
         6D7OjJt0xKYIRfZTrLw9nZTcNunamAB25FCamlbenvkMkFg2o5cMnhwZStCQr17FnbO6
         KVhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFXuIQns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay35-20020a05620a17a300b0077593f7148csi7972250qkb.273.2023.11.20.13.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:35:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFXuIQns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5Bux-0002Mj-Na; Mon, 20 Nov 2023 16:34:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BuZ-0001vC-6j
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:34:32 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BuV-0003ak-W9
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:34:30 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c83d37a492so60723251fa.3
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 13:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700516066; x=1701120866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIex8QjcVHMzUQGfRlZtiLonUpnm8G6I3FWEQ6zYP+4=;
 b=CFXuIQnsSbbPfKf+1+Ki7L0fZ7WmHCfWo2WgW/tfU+ikZbqAJ6m8Oy0Wwjeyl97Gxq
 SrFoivpcSewRLeH1NXDfI4a6a4H7j2z8buwcrVrBssYP9P+Iim+tb3i4ctSrEeX7H7MJ
 8+TfQudvl+vLXkQGPGHfyvAK3HFeIkevnz0UrVrPjbyqAvRkchaNo89VCKWbZmNUg86H
 dwxMRw5m2vcK6gmgAQI8hBff8ZU9C+ZTCFUfz51T0SM1DjuIxnKwoInxS9wa6nQrbmAp
 9bnmQKBPsmQIAVzvO7twOCUpgW0tprSQBO+esxVpjI8t5zRlXjgYpi7AFhq/hEtn2L9J
 tZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516066; x=1701120866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIex8QjcVHMzUQGfRlZtiLonUpnm8G6I3FWEQ6zYP+4=;
 b=d+fKOVu8LOsbhy+yA3nTdca96DTBs6/Zsw+XE6dZlSlCkRVYr4D/8fHE7V5hblHXG8
 EzHOMyvw8f0MAsDhaN7DOETEw/olEqN2JcZlFcxey6Iryh54W78VHvE67S8iYBRAAeXc
 gwgLBRDPNa9Y37F66sX3p+BEPz5qT0L99cKpuq5WMR00a1Q36dkdawDTnoR7e0f7XZA1
 eElTRqkstrnUKvCQ4a9S/LQjWZjv0Sgvc1gD4AxMn8bHsb7XwqIrUr4dLuxtiXbsmKPh
 XdgnoaDyQzlve82/DOpEBle4FNrO2yQdfBLSZxNeE+mlTh9RqBvCK5xhffhcmXqkqxYS
 n7sw==
X-Gm-Message-State: AOJu0YyTvcI9rBtY+R8QM9OF8WnY8EFlnybJalNb+idihrlaMtQcfkce
 eoeA45NLaHpgsD0EuP0pjgKPlw==
X-Received: by 2002:a05:651c:210:b0:2c0:20e3:990f with SMTP id
 y16-20020a05651c021000b002c020e3990fmr5660346ljn.10.1700516065839; 
 Mon, 20 Nov 2023 13:34:25 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c198800b0040531f5c51asm14963797wmq.5.2023.11.20.13.34.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:34:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH-for-9.0 09/25] memory: Simplify
 memory_region_init_rom_device_nomigrate() calls
Date: Mon, 20 Nov 2023 22:32:43 +0100
Message-ID: <20231120213301.24349-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120213301.24349-1-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6Xd5qNEK9yl7

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, arg5, arg6, errp;
@@
-   memory_region_init_rom_device_nomigrate(mr, owner, arg3, arg4, arg5, arg6, &errp);
    if (
-       errp
+       !memory_region_init_rom_device_nomigrate(mr, owner, arg3, arg4, arg5, arg6, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/memory.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index 1cccc4b755..6d1d315d0e 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3654,12 +3654,9 @@ void memory_region_init_rom_device(MemoryRegion *mr,
                                    Error **errp)
 {
     DeviceState *owner_dev;
-    Error *err = NULL;
 
-    memory_region_init_rom_device_nomigrate(mr, owner, ops, opaque,
-                                            name, size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom_device_nomigrate(mr, owner, ops, opaque,
+                                                 name, size, errp)) {
         return;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
-- 
2.41.0

