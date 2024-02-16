Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1307720ejb;
        Fri, 16 Feb 2024 07:36:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV2aNnZOV4nTqbj2WjdajN0pnzE826Ph5Fdkmam+wNu9MzHJkw2ji56PehRtUIhyd8T8NVN7uiSXXoqF1iPR5qk2K2JsquF
X-Google-Smtp-Source: AGHT+IGa5ZAWQYhpMsjdmJetJU8Cts+IRQn9zD7f3yzYHbrTZeYr5SoKs/SjGCjJehf2g16ytBcX
X-Received: by 2002:ad4:5743:0:b0:68f:280f:175a with SMTP id q3-20020ad45743000000b0068f280f175amr4908805qvx.12.1708097807354;
        Fri, 16 Feb 2024 07:36:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708097807; cv=none;
        d=google.com; s=arc-20160816;
        b=RAHPBE5L4JIe5SgjbpN2uBw8UFxgqCPX7/znVcc8SAI/I5uM2U6uC5MUb93ocFhAhy
         bKIXv0fkY91Yy3nwN75ZuQzWNKPdFuiG6Uv2jkgFUhM5bK4rBwUp3L0iap4cxPulKJ+E
         ruuQWj694hiJKnMhEBLNyXEPiBj5WY9jIPZ/hRe6RU13+uoQ8PF/h6eIPR0oe7k1T8V3
         W54J0e9IZyXOq2tcID1N1Q2EUm++mc18UobDf1mMb0+nqyXZKcwn4rD437vvJCvyyqrP
         2O7VNjM6RjpsjepbOI3a1dP74J1FpBj7bCgp1J5K1229esNhajZrt5hoPzv8PJUR8XhI
         xzYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FHq12xVLql3ZjDkC8k2lRJAF5RJwUJ4vzRZ5Ca5vbxw=;
        fh=/61VYDF76+LM0uVHdxtDTLdUV0q5iGy0r0mTfph67Cs=;
        b=umZ0/2GNPJbLX8XVM54KWjQ+vxDyY8IbajtQtS2W53ts5TljNmuBu594ccVV7F1Qsh
         KkCQhCtB+/aS79fZpDtuY9zoD3PKVkJZeT262ZbZJZcdZAxSZptiyDusq5KIBv3eUn+Z
         c660o8PLxP/lDUpjvab0E2jWR+P2RvjzoMMjhTs2av+L8ZJIIg3qJxxKBZ+T3+WU0BAX
         DeLmbGrL33zC2cU8d4XxUduUL6RtJtZoH0Wn8ruHs89siRvECLYM+Vrc/AdaJVpJsytK
         UKvWk1aYdSNyJ3KXaB6YCS8fE6xd6Rie8bO6gDCd2P9bAfumgYKpdn9Br8OdIEfPEFev
         BdYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGUvTxVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020ad45b81000000b0068f131028e8si4139666qvp.286.2024.02.16.07.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 07:36:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGUvTxVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rb0Fd-00049J-Od; Fri, 16 Feb 2024 10:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rb0Fa-000472-Tf
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 10:35:43 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rb0FZ-0008F7-FF
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 10:35:42 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2f79e79f0cso326103766b.2
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 07:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708097739; x=1708702539; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FHq12xVLql3ZjDkC8k2lRJAF5RJwUJ4vzRZ5Ca5vbxw=;
 b=aGUvTxVn0CSevQHyBDA9cVw+UVglgY2WrUoRExucsmzbM/eRtrS5afWbUMOl5saiC0
 DFasHe2Rr9+TBowErSS1Z8yGmXrQD7zEolWAVbCv3u/pB6icUh03uVvzxSWYi/9GFmGb
 BP6EInDIox0XWaz7Yp+j+YWO419I9+jWTsAIS5LE6Re2hd5XbihKkBlAQot/4bQEfHbZ
 /w4luttgu7EWUA9KVsmHc9R1d8NI7mDDKcl5+XcbFZ1KVzA+ZN51Kf3bMD8okv1c4nAj
 z7aahlG9hehfiZbh8Ys/psowuFQ2tCEiLN30UMG7XBTvZ6kpbggx4yTxdig7KKvFj7aL
 +UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708097739; x=1708702539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FHq12xVLql3ZjDkC8k2lRJAF5RJwUJ4vzRZ5Ca5vbxw=;
 b=Jndm35iA0nVyhBm35TnIRxxD+lS3xyZsfUPgKf16uHgfQM+QBk2zjXwymrDnfX4CWH
 U92FBVj8+9XZZqVIB/vrUYaGLtoQa6kzbbsTnVE9rcg9gxWKG2Z/NRAVXxXeZyeBfohC
 h48I0Gs9loaJmLbCXT6FUjSW/WHX4A5kfSzWbXL6Jl0fr/B9Cg+BNRj6WjTko430CaZN
 LBguqbzPZ9/N2EXc8govfAQvnmavVvk5f+OZrEKahkxyjrkyLH16lE7WcrZkB/+3MXKW
 lYEXm3dq1KMV0ot3ah8JzzujVCdtTuZFYekrM6Nkd8tRi/hOXNJiaBy+ydd1x5+Dp4U3
 1tyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMKjWWAP4XMRMJzqC+v/N8y4nvfvSebH7qG+gcYirSRUM/p4NRYmkavzcbuBTNiyUZMILuX+788IrZS3E540vNmgnA
X-Gm-Message-State: AOJu0YzVca9ksCl0slFD5uRcr7eoKMbJGCFRszThODQFjahEJV0T+H/Q
 9bkbN3PkUmG0PpD3es5mmcf7dgrzuOvndqGBh2BMm42PV8N/7DtOhJQWqv2WS/I=
X-Received: by 2002:a17:907:b9c6:b0:a3d:2e34:30a5 with SMTP id
 xa6-20020a170907b9c600b00a3d2e3430a5mr3626388ejc.29.1708097738898; 
 Fri, 16 Feb 2024 07:35:38 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 tl7-20020a170907c30700b00a3d1458523esm52110ejc.29.2024.02.16.07.35.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 07:35:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/6] hw/arm/exynos4210: Inline
 sysbus_create_varargs(EXYNOS4210_FIMD)
Date: Fri, 16 Feb 2024 16:35:14 +0100
Message-ID: <20240216153517.49422-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216153517.49422-1-philmd@linaro.org>
References: <20240216153517.49422-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: y9iSS5RHbOZ5

We want to set another qdev property (a link) for the FIMD
device, we can not use sysbus_create_varargs() which only
passes sysbus base address and IRQs as arguments. Inline
it so we can set the link property in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4210.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 57c77b140c..ab18836943 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -769,11 +769,13 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     }
 
     /*** Display controller (FIMD) ***/
-    sysbus_create_varargs("exynos4210.fimd", EXYNOS4210_FIMD0_BASE_ADDR,
-            s->irq_table[exynos4210_get_irq(11, 0)],
-            s->irq_table[exynos4210_get_irq(11, 1)],
-            s->irq_table[exynos4210_get_irq(11, 2)],
-            NULL);
+    dev = qdev_new("exynos4210.fimd");
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, EXYNOS4210_FIMD0_BASE_ADDR);
+    for (n = 0; n < 3; n++) {
+        sysbus_connect_irq(busdev, n, s->irq_table[exynos4210_get_irq(11, n)]);
+    }
 
     sysbus_create_simple(TYPE_EXYNOS4210_EHCI, EXYNOS4210_EHCI_BASE_ADDR,
             s->irq_table[exynos4210_get_irq(28, 3)]);
-- 
2.41.0

