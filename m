Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3065389lfb;
        Mon, 18 May 2020 07:03:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf0OCJyULEnj9tyuvYHYst4F0Z9JHjl6+PPwJM+uvYdQDXIImCyWTOp+fOGD84AJg7Pbo7
X-Received: by 2002:a37:6757:: with SMTP id b84mr15997360qkc.260.1589810612559;
        Mon, 18 May 2020 07:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589810612; cv=none;
        d=google.com; s=arc-20160816;
        b=P2EEBYxchrmwzgdeu2as5mCwQw+enWyjArvQ9Ee5kux/3jU6w+/qc5NqzQGphj7Fs/
         R9/4p28jVYaJPasyXXmmF8TF7wyIrT9s6D5bEslGceZlwWKYe9tw4fhXpVK0UQDmLgXC
         z4DB204UFbnZpfGo0XbxLkYG/PQcFoSC1KNZUmKT1g6s723VVYGJdeTluxSg3UvmemVt
         Y1zFAPcpoqLj4N2w/kbVs6U8zT7RbBaA5wg2MAr2jn/aGcyTI/90jmc6buvk7tEj70dm
         dYI0SoTE+KZOICaxYL6AbhEse2SvA1k+ngIfgtvWIzGkTaZ6kVhYYE6NZ6lohJHSYR4B
         2iGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dzTzLzxMdN66CsSdC/DPlwfEMmQojypcIwHvyzPMcJ8=;
        b=i99JfgR74aKiqxRdzKQ36Vue8PLIJTSh0E5vVqbR1a+dhYpRhHcXfrQIut3Ilj4tJY
         XnWM0Z7GuKYr8/a6Rng6BAJfES3/v8AA76Qtn2SVdZUSqCTLd7nUZzx3mpdfr+jUEnub
         wMjnGppMSTNXtA+nzxnZabTLpEfBWWb/wTWGfFobRP2PpzQ3synlAxFsTW5LXG8QCkQK
         Yf1WKnUlzpnpFUhq0GWxZ50jUokf9XaEzZD9/GK5B0l06r0u4O+Gu9vBFsaKsmfeyBZ4
         ks66x4iEYJnzJgXHGpgf/1FLrh5KBM909K0Bvi9eV/mFu5O1Tl+eQZMyFLkMuMUExLvc
         F0wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="l8/so8U7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o28si5757976qtb.249.2020.05.18.07.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 07:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="l8/so8U7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jagMd-0004JS-QZ
	for alex.bennee@linaro.org; Mon, 18 May 2020 10:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jagMT-0004Dt-GV; Mon, 18 May 2020 10:03:21 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jagMS-0001Ao-NE; Mon, 18 May 2020 10:03:21 -0400
Received: by mail-wr1-x444.google.com with SMTP id i15so11967621wrx.10;
 Mon, 18 May 2020 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dzTzLzxMdN66CsSdC/DPlwfEMmQojypcIwHvyzPMcJ8=;
 b=l8/so8U7RSFSkjcZPGJWBi8xfvYfzxays7nz7cAPHjbtEb3zzyNCwX/C8dqgHN1X7F
 bEMFerxZgv+cV/IDK5nxotmhrGL09Mo6Qjb2sV3AISY8U9lGM3gQq3XqR35047Ua6j9s
 pw4IOoKInzpvkspS8vifz8cPGvxJ+g3PkamH9QQk604xztKlA+qfiCLhmDtigQvxzAZA
 /JWroTVqmqHH2/yUuTPN7DQMAa21m2VGK2MoLlaYblKdWmN7E9RdosSCqbzrMO/12rEa
 S5fcsy5V3q6PpjQgy7UYKq8NDgORsF9JZx9kzjlQ53VLDkfbHUirLh4EPa2ucsxt8NE7
 oXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dzTzLzxMdN66CsSdC/DPlwfEMmQojypcIwHvyzPMcJ8=;
 b=tRwSUYnQ8YwwihgeB9DzVzEzqYj47DQwzLpF0Rr/GwNnP9OxOJUrXOqgWL+T19lTV8
 BGnmIivV6YwRTgzf5PBZo7JOIklq1rdA9dIw3wQdxz3jqs1X7vPTP+zcVF9+7ICfAy68
 zaQfuaT4cf+rdIqYPHKKfpdeIeNaDo8P+M8Qh+DtnEHnU1gtixEV3BBmbp9nsl4hrXp4
 +aowu34r9uN3gH2EEq/hqtjkjUzXH6kNvFuZ6IRnEEFwMWOwr1pKvvvcz+lyM5seQK4q
 XohRynOBYaru0JvgI7CGSbAqLdpoLN0N7mk6HA3N6vXGQgSVLD7qPzlY3Y+xPXwccwp9
 hKQw==
X-Gm-Message-State: AOAM533yEZtu0081f11tU/CHl49EjHID21GR2K3weuMbv35FfMeAlYsy
 Nv8y9mzgMW1GAqHu4wFE70EthcKP8BI=
X-Received: by 2002:a05:6000:146:: with SMTP id
 r6mr20764381wrx.9.1589810598703; 
 Mon, 18 May 2020 07:03:18 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id s67sm16611946wmf.3.2020.05.18.07.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:03:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/char/xilinx_uartlite: Replace hw_error() by
 qemu_log_mask()
Date: Mon, 18 May 2020 16:03:08 +0200
Message-Id: <20200518140309.5220-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200518140309.5220-1-f4bug@amsat.org>
References: <20200518140309.5220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eiAtDf0X0I7M

hw_error() calls exit(). This a bit overkill when we can log
the accesses as unimplemented or guest error.

When fuzzing the devices, we don't want the whole process to
exit. Replace some hw_error() calls by qemu_log_mask().

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/xilinx_uartlite.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index c6512285d7..ae4ccd00c7 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/hw.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
@@ -135,7 +135,8 @@ uart_write(void *opaque, hwaddr addr,
     switch (addr)
     {
         case R_STATUS:
-            hw_error("write to UART STATUS?\n");
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: write to UART STATUS\n",
+                          __func__);
             break;
 
         case R_CTRL:
-- 
2.21.3

