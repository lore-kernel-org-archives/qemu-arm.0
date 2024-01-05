Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp800972ejo;
        Fri, 5 Jan 2024 08:00:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNkIDQavWipwd4SLmI+XDmpafyLoZb/InM7l0c8H+Rt9Cdafr+DBxZGwLTb4AEYbVGiqS2
X-Received: by 2002:a25:e30d:0:b0:dbe:a53b:2eef with SMTP id z13-20020a25e30d000000b00dbea53b2eefmr2131954ybd.53.1704470443618;
        Fri, 05 Jan 2024 08:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704470443; cv=none;
        d=google.com; s=arc-20160816;
        b=zWgLzXpOnQpEeREHXMfAhUJWZVzKRYncVG3cXAh05O5BY19VKxpLxLghNFssa+JjPt
         LY/DAces15/WDX+Y/Jxld9VD+98HnRaFc380uVaF55tPRCl8IwaxyB1+UkZgqLQHpSDz
         m41y+s7i3otYuWy9+LtBtYPXrbd/rr1HRMy9DZHoJfoopwEkpdIRZSkwoHMKwjgf2l4l
         ruSwrdN8uYwpOBlPh+5a0lVCM1dN9vAU9U1FrDLkhvAXCPfy69jvBMwDGopZkOaaFGJF
         xVkb5cNMFQWpLRfcMBbIBNFeBZnJ88J+8RtEEHy5E2VHgzfb28yZDkbaR/gUK4um2Ig1
         5bFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h8Y9INkkzpXAHIBaDV6X4EdXcLZoAOfyToK+IgBwRCs=;
        fh=+qf+pcB7BYjjnfnO4Nktpjd3J5C2qdC6t0g0pNpbakY=;
        b=iJCEtMfh9AZ+plqVhV7a1Ar+Ij0yF5Xk3gInVQn9qHLwXyzear2HXwoncWRVYQkFeW
         5n9uWbhVUPJiFFBYgPbf6vT+YpwzU3v/WvUeGtF6OrzPncZqrquKOhRA/zYfMkQHkWlE
         ckegz4Md5jtxlALnYsgynWmK1r0n9yCC56KRMANVkMIRc/F1SYouqJI5UgaMQpqV3QBz
         UaFV3Gfpz+2znYZXXEwydKUwgGxSOaIpw62hpUS7kUIC785wgEDIWgZdW+in5oVCnHpL
         qIQQshqiNlPlv0P0PhI3FVTqZc0AQgoqfAJ0khG4yST45zhAvz7w5rynHFyfOf+02DPq
         blRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=trG9EbVh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020a25be45000000b00dbd713387c1si819752ybm.214.2024.01.05.08.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 08:00:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=trG9EbVh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmU9-0005N5-Q8; Fri, 05 Jan 2024 10:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSN-0008TZ-JS
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:49:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSL-00010D-Tr
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:49:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so18922475e9.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469796; x=1705074596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8Y9INkkzpXAHIBaDV6X4EdXcLZoAOfyToK+IgBwRCs=;
 b=trG9EbVhTGYocEygqSoykHHDkh1JoR0PUhzxazvHz7oZ+PleHicBzuXNFOjxTqEdDK
 8By/C6OFTFxt2LuM7D35vPSxPo5QBx5ucQfRiq4Z5tiBTgUDo/1P2XckLZAGMtk4LQ/l
 2Keu9fXhHLFt+ix/xtuFH/axA4ea7Ne4l9ybsrDQU/mbkD8y3vIuS+eFtm+7MzX6zad1
 vR9ZifAi9/DdS8gdg56M0j/w/alidI2k/fsSif4vcdnbGqB1ZlhHqUMF1h2LwRMzawVi
 UOYQs7Dogxrk8Lq4RoqKbjkyP4HscJ4Np4DT561c6jjxMWMM9I0ZFYUGyzODoK/yfwKE
 gitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469796; x=1705074596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8Y9INkkzpXAHIBaDV6X4EdXcLZoAOfyToK+IgBwRCs=;
 b=WBJOrY4KN8hY0QyV5BRVgrrBKOc/Skg2j0wSIqcXVb/nBSIBh7Kf6bGt31x+8N1nA8
 iuu9XT12GH2j/3/VYeaGm/v9VcHjqZTsu+V4VSPaasFlS2kXON9I0uyNGhRk243AWIvc
 ZSStcrvst3rza6XxggnsoFfJ1Hiqxjyz38lZ0J5GMxrQnt4W1IFYlTIdOYjEu2/oy7jU
 0uZ9tM0/NxYO4J6mqSMGmGsJgbEM/cA1nsDZB8nJ2tTpF6SoO1MM3LaIDaETdfhTqfbq
 0lt24ua14XuxUhlOMq4JKyxPY1NxTunsxoF+LhWKEDFiQB6z4gFdpbPpNfzr6Q69EUIA
 eeTA==
X-Gm-Message-State: AOJu0YyHfKjzLY4Wzmn2foVBnMqB9CxJGsNSr1ELX1+kdlAZdyH44auW
 BDwr6kfc1GELaCRKveEC4T7M7JttC+F6Xw==
X-Received: by 2002:a05:600c:a02:b0:40c:45e:f89a with SMTP id
 z2-20020a05600c0a0200b0040c045ef89amr1280111wmp.50.1704469796358; 
 Fri, 05 Jan 2024 07:49:56 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b0040d94b65342sm1927739wmo.48.2024.01.05.07.49.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 67/71] hw/nvram: Simplify memory_region_init_rom_device() calls
Date: Fri,  5 Jan 2024 16:43:00 +0100
Message-ID: <20240105154307.21385-68-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: X+1kqHM5jffx

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, arg5, arg6, errp;
@@
-   memory_region_init_rom_device(mr, owner, arg3, arg4, arg5, arg6, &errp);
    if (
-       errp
+       !memory_region_init_rom_device(mr, owner, arg3, arg4, arg5, arg6, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-25-philmd@linaro.org>
---
 hw/nvram/nrf51_nvm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
index ed8b836074..73564f7e6e 100644
--- a/hw/nvram/nrf51_nvm.c
+++ b/hw/nvram/nrf51_nvm.c
@@ -336,12 +336,9 @@ static void nrf51_nvm_init(Object *obj)
 static void nrf51_nvm_realize(DeviceState *dev, Error **errp)
 {
     NRF51NVMState *s = NRF51_NVM(dev);
-    Error *err = NULL;
 
-    memory_region_init_rom_device(&s->flash, OBJECT(dev), &flash_ops, s,
-        "nrf51_soc.flash", s->flash_size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom_device(&s->flash, OBJECT(dev), &flash_ops, s,
+                                       "nrf51_soc.flash", s->flash_size, errp)) {
         return;
     }
 
-- 
2.41.0

