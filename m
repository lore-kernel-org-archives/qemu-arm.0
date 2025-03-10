Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp842536njc;
        Sun, 9 Mar 2025 17:07:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4MgU595z/2S4Z6RbdccW4Xqx5hguLoYukA5xZ3aMckCftz6tcZJcOa+AwO9VQdCjP+vsI5UlWtzzp2A==@linaro.org
X-Google-Smtp-Source: AGHT+IEGKU/VssO0luYJchWOSsCrSiQ7esQEVkm5CuLc+pqTm0wshErPayVG1uW/H4wHNysV6ejT
X-Received: by 2002:a05:620a:27ce:b0:7c5:44d0:7dbb with SMTP id af79cd13be357-7c544d08e52mr712423985a.28.1741565277602;
        Sun, 09 Mar 2025 17:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741565277; cv=none;
        d=google.com; s=arc-20240605;
        b=iuehbfSkkcxRN6VDUjaitEsqtYtACI5L0SBJ59aAgA9rMnoy0YLU37mAVV+FDo+3Gd
         aXlQX3ZdXTaCCsrth2MYk3WAqHmewC7A4YqUVGt1EzIDvc5MP7dC24LmFSSz4JYWCySK
         Df5EAenqHuhX0YHsBTeXDG/fNcRvDWBJ66fExffKzixB48ObGu0rCx5GFsLngzdg7lsx
         dRf1eL89+uWPM4z4sd/mC0pVqG8xUa1fxMIACKYWN6Ve8/AfpVyBtLpGk70wsOGzBTpB
         WdGEcUCUC/+FWSLnoMqK308zxm1Zpx4GFr3ic0lWfpz/U3CRyal5tvi9UU5FhGuTJGSL
         4GAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=erRrSHMQeC5BJ4//qt9VD1yvOjST1dyAioJ5r7a/Pw4=;
        fh=tEYb35aNSjhrl/LISm8+oc273f3o0exmMO0wgrzCrLw=;
        b=B4bWCsETC4E5aHQ7jak1Ix0Mh2Mj1B82jfDUnHJOj98UAcA5XRlApac5FKJC/wkPyr
         fZuIBnWOHZRkfaqc9ZarGCFyGEByQg7W78eKgJrws4DLZO2t7Dl7Hi1UKqTdVYjnD2dg
         atba5b6phQ0xGkG2yn3go7V1OKT8A+hnAqRGQZu6/6btIz4xl3BoRcax8YfqDCm446rA
         R7+7rafjjo8OfIe9GlL3rQ2Lw6yxNpuaVtN+SJ22Lq1m1QmKZSRil9ERmVO0zhmNe8O4
         dMzc8jbgqFMajLRTb6dFfODQo2Jy2iUZnvFBm3GO910joztGY7rhczie8CjilR+m5Mbj
         T4kw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4lh0pR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c55150203esi127985585a.410.2025.03.09.17.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 17:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4lh0pR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trQfo-0002BP-MD; Sun, 09 Mar 2025 20:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfm-0002AH-OI
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:11 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfj-0007Oy-Jw
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:10 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43bdc607c3fso21254485e9.3
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 17:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741565226; x=1742170026; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erRrSHMQeC5BJ4//qt9VD1yvOjST1dyAioJ5r7a/Pw4=;
 b=s4lh0pR2Iet4mZM8ga22CVeDPbu3VEUtsJU84T6ZkwVKlT2MA8aK8P1dRistp2W7sp
 8AAU948Nt8rs0uA5Ovksyw6uzJotRSVAXKD2QIoSLfe6UV59t7BqHGrCoiDjiYgSheSa
 Wnymz9m8W4Pt3EMGA+dh+vqTwV+5KqI0pZNGsr54taPQ9+swlpP4+ozBvGgujQ7TDxJ7
 d5AbUubSs8pVWaKhqXvVpJgmOKRsyAp38DTN2KqeQH/tDGjwknZpUtxw7/+sRcu2utji
 wdpesBrG53tXOrFmnm/3rptQGQfby/Dq+buE4bpVbAY1CdSi4K1wW2Wl20C17N9iYT5a
 4ApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741565226; x=1742170026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=erRrSHMQeC5BJ4//qt9VD1yvOjST1dyAioJ5r7a/Pw4=;
 b=dyyM+2nHMXVp8VAj0mpLt+lBOTw5lDf1QUvCKkUalHXioTMexejoPELLfkAAGtEh0J
 G6Ckxzc93EdgIqHzRQXkxl19WkzFY8t3mgphNFA12RsrVACdu8rM0bUCkbRNnYtU3iTb
 EB3lP4W9p255bmp9T9lpAQkpbTM/H6+406IdQ81QFIgt6zZr3qMYFz+ugTq/9uS4fk4b
 IpUDgVBXBjz5jRlx/4M3hPMDF8my7GdvMxygvJY0gQDj+u6wyW5PsFq+wj2C7SOhdSmp
 jk16DvEQvVu6bF1VmnK7tj/F6DGs7sLeKrpjTyxjfkUBR35U4vowjEPfeu8SWzZWwq/C
 K8Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdRbLLP24wDjU7DsRAFX5YDXP7Qebzc1YWHgFcnLxvWZn11Yy5kV1e+dyfK3vq+yKCguw3JkTy8g==@nongnu.org
X-Gm-Message-State: AOJu0YwKnxTwjZxy5pFpy6zsW3CRdSmfF/d8R0zcogJ/TyvUGzcA43PP
 PBH4WJowDzv7DOBxhuSO+90QGbkqiL1ZV5fqd7j7wjek220KfZFloQsdj9+qT5g=
X-Gm-Gg: ASbGncul5AceZnTAeRxYk/1XdPZn1Igi1QMet/IxiUUAyfwk74Nx6rgUurSjYJvVQaf
 wjf4LvWK5XFxQ6CRKX0lsYNeP8bNQjcau+tFd1kjcQYeRfIV6U+BCw2lV7E2TUolwYsPXV9ern/
 nzxRtBzzGQ1olZI5n9QoZr1POQAZw50pxMfyyGhsysg5V30D+kemHww6OJ0luoKb3QSghPaWE3L
 8w3QU7DkzKJKhdXYlmIaFVR2XcuQs0s4+fSYbng+gQPU0LcNKth8jX3TuRH9MrzJAlrps4eArEz
 tGaqSTx2qY49fwUL3eplSDeItn898kzYVXjZMm1pMR8+hUooaIE8vI2Cz2XhGkm+zGw6/YCqC/1
 IOzx724fELD07WbQB+h3P+tg2jPPpfQ==
X-Received: by 2002:a05:600c:3544:b0:43b:c878:1466 with SMTP id
 5b1f17b1804b1-43c601d94f1mr66442495e9.8.1741565225940; 
 Sun, 09 Mar 2025 17:07:05 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ceaac390bsm60613665e9.35.2025.03.09.17.07.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 09 Mar 2025 17:07:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 08/14] hw/sd/sdhci: Make I/O region size a class property
Date: Mon, 10 Mar 2025 01:06:14 +0100
Message-ID: <20250310000620.70120-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310000620.70120-1-philmd@linaro.org>
References: <20250310000620.70120-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 9+G/2pkGBfIw

Be ready to have SDHC implementations to cover
a wider I/O address range.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 include/hw/sd/sdhci.h |  1 +
 hw/sd/sdhci.c         | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index ee1e7ef4b10..dfa0c214036 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -118,6 +118,7 @@ struct SDHCIClass {
     };
 
     uint32_t quirks;
+    uint64_t iomem_size;
 };
 
 /*
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 570d825d130..3467385490d 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1444,6 +1444,8 @@ void sdhci_uninitfn(SDHCIState *s)
 void sdhci_common_realize(SDHCIState *s, Error **errp)
 {
     ERRP_GUARD();
+    SDHCIClass *sc = s->sc;
+    const char *class_name = object_get_typename(OBJECT(s));
 
     switch (s->endianness) {
     case DEVICE_LITTLE_ENDIAN:
@@ -1469,8 +1471,9 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
-                          SDHC_REGISTERS_MAP_SIZE);
+    assert(sc->iomem_size >= SDHC_REGISTERS_MAP_SIZE);
+    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, class_name,
+                          sc->iomem_size);
 }
 
 void sdhci_common_unrealize(SDHCIState *s)
@@ -1548,10 +1551,13 @@ const VMStateDescription sdhci_vmstate = {
 void sdhci_common_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    SDHCIClass *sc = (SDHCIClass *)klass; /* No QOM cast check due to union */
 
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->vmsd = &sdhci_vmstate;
     device_class_set_legacy_reset(dc, sdhci_poweron_reset);
+
+    sc->iomem_size = SDHC_REGISTERS_MAP_SIZE;
 }
 
 /* --- qdev SysBus --- */
-- 
2.47.1

