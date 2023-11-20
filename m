Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp64861ejy;
        Mon, 20 Nov 2023 13:34:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEy1+FUQZ5u6m4z/GW4ZTX+Lbd3jS1rfme5ZOyowfUxlPb8K1H+RuTlSEkjuL4kpgTMPmzE
X-Received: by 2002:a05:6214:e8a:b0:677:f36a:17ae with SMTP id hf10-20020a0562140e8a00b00677f36a17aemr12054550qvb.37.1700516066560;
        Mon, 20 Nov 2023 13:34:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516066; cv=none;
        d=google.com; s=arc-20160816;
        b=pIia59ijNPhkUUmCUzygsoZH2Dz/d0Dps35qTjwmBKUQRtjri0uoe+mIq66uaIugec
         ZLtsrCqUkDmqb1w7nlTD3xbPQxywHvFEwnndRe003Xv5HJ+fL70b1VoJRWDY+ctiac16
         PI2YXPPwbwwmDaGMK+A/s0QqPjYeyT0GDkeCYQS/zn0h6JPchY/Llvp5TqjwTNST3ipX
         3ifJ+9jl2KDJY8SyqtbfbBb+ALmJLCW7JN/0tFjepq2fgkTkDgu8HMeaeJW3jQ+NzcQE
         nIRw11TV5zLfxQVZDQDUod6LwWdH2T5K6xEFwHNsMy5XtromZ1y3NOOUQmuv65bdcgNh
         aqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fonaudvT/zI6eYgx9UtSiLdTbmVbD2gVa6JY6eKabgU=;
        fh=toXMQ9nuJ3L4CLQ8EKaTQ8L/ltDlD3GauRZSJpgYVzU=;
        b=iLdytQutvJO0xvARuEKzRImsF0+/vdPbrGBfrc1FOuoIov0rnZpMyQPC91cLtCbZhm
         tnUDNBTqoDVCta8ZqHA/dMT7PD2F58QG17CACpS08vR9skCKhjXPhZWvM3q5yNH31Qjl
         LW90xRHoI01Xm2t1et7nAjv8HQwT7dLapLg++3lMOyKFLNu+axBthaxlwL1TKx8A0t0s
         cWV+9b3JNIkbPixO8XjftkEgu6gDd/Z6Y8w65UU0gHfHumlB+pH+jo6lmoNoASNN50qf
         D70R5Aa2pJt/B4vpwFz+QehVERejo3xxV1pNtoRXrsm5E+Skg4YFSmaNwOYQ9qawrAro
         MCzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=INOhgKhi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf8-20020a0562142a4800b00679da761d6dsi2948766qvb.479.2023.11.20.13.34.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:34:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=INOhgKhi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5Btz-0001AD-4y; Mon, 20 Nov 2023 16:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Btx-00019c-9G
 for qemu-devel@nongnu.org; Mon, 20 Nov 2023 16:33:53 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Btu-0003DP-Ex
 for qemu-devel@nongnu.org; Mon, 20 Nov 2023 16:33:52 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40a5a444c3eso16881325e9.2
 for <qemu-devel@nongnu.org>; Mon, 20 Nov 2023 13:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700516029; x=1701120829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fonaudvT/zI6eYgx9UtSiLdTbmVbD2gVa6JY6eKabgU=;
 b=INOhgKhilQedlZMhwtosqFZpSxTUqRnWapdsPPsXvpkFW5XoqvunY//K0AJptYpA5n
 GKlJbOhqK0H9P+lOGs8W6d6BVFsaeBc2OLIBuBsOAkEG9Inhz1LD3GgJVLuW0wPCUJir
 zRi4A4D7QnMLzFjKQ8Nj4G0rC9G7Iq3ZxNHqbcwI9YKiBaW3ew3IGZY6Z0Sfq598pCfT
 dTPrYayzQz+HwLJpF2EjKE4ec32Qsc+ZT9wo/W7bUcYhT2HKkxkCbQf0wSCQ+X/IhUol
 k0galAB/etIzsr5uqFRZ5dysweBNX/I2YkS2kcPAgFTm/4uKZVxhoH3R864xjX7PfSVM
 HVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516029; x=1701120829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fonaudvT/zI6eYgx9UtSiLdTbmVbD2gVa6JY6eKabgU=;
 b=m8B3HanIeWqvnpRewilmmybj5FFbX4AwE3XTbTVMI5OxIvtVfFc3+OJRYPICjexojc
 fEG1mCSYJqiS8tFMXf/DYpi/KVAGHBsXy5qEjhGF7RQmsMI5NE//ZlJTg6iWUUfRcYz0
 mvUkTl9Ex0k3C3EKHXpbAH3nj1yFi2dcXBiqitBhzZWuvGbjN+Z+ED9L+lmDbtnoiaV5
 UG352LNF5shJZYLUAzVCCecU2+nZ/La9qtWtOX/G0/b/8Pd+qcKwt28UEIkREen6Rd4K
 dQrqfN4AITiAKyAaTS4nB3yFUWJLn6PrZe6Duc5pB6gc7B0xY3OF6GwivtvgsBz3u+mK
 T0+A==
X-Gm-Message-State: AOJu0YyedRJMSkfyXLCMVg3YjpTsTBGdfOZ6qghY/Mv72PkXiyppV2uf
 CKatQVEm0Dqirrg4PHVk0PJHoZJsGjSF1mT2xhY=
X-Received: by 2002:a05:600c:19d2:b0:405:4f78:e128 with SMTP id
 u18-20020a05600c19d200b004054f78e128mr6897554wmq.4.1700516028900; 
 Mon, 20 Nov 2023 13:33:48 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a05600c1f8c00b0040839fcb217sm14809038wmb.8.2023.11.20.13.33.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:33:48 -0800 (PST)
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
Subject: [PATCH-for-9.0 04/25] memory: Simplify
 memory_region_init_rom_nomigrate() calls
Date: Mon, 20 Nov 2023 22:32:38 +0100
Message-ID: <20231120213301.24349-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120213301.24349-1-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: dVWSaxmfX4/O

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, errp;
@@
-   memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp);
    if (
-       errp
+       !memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/memory.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index bfe0b62d59..2fe4c3861b 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3628,11 +3628,8 @@ void memory_region_init_rom(MemoryRegion *mr,
                             Error **errp)
 {
     DeviceState *owner_dev;
-    Error *err = NULL;
 
-    memory_region_init_rom_nomigrate(mr, owner, name, size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom_nomigrate(mr, owner, name, size, errp)) {
         return;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
-- 
2.41.0

