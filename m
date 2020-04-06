Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4253707lfi;
        Mon, 6 Apr 2020 11:05:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ7fW4kJmptqP/OodgVfbBTeXpLpo9+hgtaMGCDNKjtqJ+b0j1kDiCKA812mbt+aeG+95l9
X-Received: by 2002:a05:6214:72f:: with SMTP id c15mr924727qvz.3.1586196339031;
        Mon, 06 Apr 2020 11:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586196339; cv=none;
        d=google.com; s=arc-20160816;
        b=juawINXZljrvZXTbShy3WU/Fvtw3/6f7fW3gQ/sk0RlBMGU9XOBpEFsdNoaDTijbZd
         QavuLtg7FaRYrgO1RHsbrpB3+ORbFGR3u1G9b7AdVRT1x2cvQnDltGA06f3WnsUmCaPK
         zAxrlXNFWfXdLzwrWB6jJeUbAqXg/YjYFLsYIMql7cnOy+pAiaxdIJhzehgwOYO0LHJr
         LGj0fN2z4dhBahuEjq9JZSbCDX9fr7508/KWX0CXj1jPWQjY8Uxo5n+1XvrqWpWCVK5R
         Xs8r+iPCwWGi1bR5Hbrlsx4OQK3fADynIEnGI4AAV6u8UBo5hbM2qEFWZ+BKPfgKnbge
         ihwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aa+iNBsUIc02tXQoILWJv3WLGp8FOp4Qp/JxXw+sxRg=;
        b=uXxYjqwKmdfyi+EeSa8kayeG9K03AklN5dof5QAcSoVPrX3HYNZlEL4o84B4K/FZAq
         kSFnASfo0ikiSStqfPa+FcY5SK7+qKZikwljMCAvT+O8jC37eEnfEfBa1hZ1kEmV9y4/
         tgac9YAQlPlaOIqtvzGHa/PLFXxqjvTJBujY31tqKkQa7VsrOpjeCv784wlypvKHID6g
         THvotZDETCOc670LgA82FLO4Lvsl5KSwVhaL+TnajQpFEnxrm2vz4RoYC5CdjX7xQJAk
         6LOmklZWRpDj+BrCrCzlnVdDFLJ6dk5xZSNUZLxBHdeeP5Q6Tj8/05C9WKZmz1J8msS3
         eypQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gYtKflbx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e54si222570qtc.237.2020.04.06.11.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 11:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gYtKflbx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLW7u-0007Wo-E4
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 14:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrg-0002vJ-De
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:48:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVre-0003XN-BC
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:48:52 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34527)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrT-0003Ol-4W; Mon, 06 Apr 2020 13:48:39 -0400
Received: by mail-wm1-x329.google.com with SMTP id c195so140616wme.1;
 Mon, 06 Apr 2020 10:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aa+iNBsUIc02tXQoILWJv3WLGp8FOp4Qp/JxXw+sxRg=;
 b=gYtKflbxtv0KOO93GxMUFEEez7VBfiz39wC1pLQhhLlrVnwUvt27kQtjecwGYQGh24
 WwWrubbOug/megiCEdA+R+D7nl62mzfjdtvk0AoxKdGgkk59Qa4w2BTRvOW/dBB/IqTu
 PPJ12leEEvSmiv4C+p5ykHilzo3eGjjOZ3hNrdd6BGlfbWcNE2m37ZmNoB96H9eLTkcP
 ex5EcJqt6SjKn9Jv8v3z1yriYPAsKeb7isB7S/NJkvyHPVLcTZ4Vn3h01s7oI7u2yHf6
 /W1/YOlP/g0cw67BtLP7wIjh0uKfg0FuGK6disZtEixghWP2+SEI53bTZr9r2PGFiSeY
 +zUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aa+iNBsUIc02tXQoILWJv3WLGp8FOp4Qp/JxXw+sxRg=;
 b=rZ35EDLqmytOgxKQVJbSw/vycJjROmOGF35xwpDB2r+hVOjpDjK40/r+RF1PkFqwjB
 oOdQ6Yxknmpbidn1ID3MkfPvl3g9Cz4pM6a1+jl/M4RLLp8Akd0GhrDdydQ1yVkg8u8T
 FVcSuwHlT4JwRSngPenAT1uJ7MihiSxEcDJFIYf/ZMo+Xy2VOHnJ6TMoVlkNJkYsWtPJ
 DRQ9Y+h5xQm+kxYe24iVH1fMjcjDORRdv8zwFAvjBmsy6DCkYTkOKBdJSmf0NUAqeEbw
 IyyEH4nCrd3afyU6e71U5u+CLNdgl9LkezAckfK7KpMnDpz8FN7oTzlqewdIBQfhWeZr
 46Sg==
X-Gm-Message-State: AGi0PuaVQLehZuL805KJ+3vIs1FFcM7DvKSvNSinlvMheIAlxWp+1la8
 KzmxFHxhszO/zmqBgwwrx/UY6gJEXm8=
X-Received: by 2002:a1c:e242:: with SMTP id z63mr207222wmg.72.1586195318004;
 Mon, 06 Apr 2020 10:48:38 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 38/54] hw/arm/bcm2835_peripherals: Add missing
 error-propagation code
Date: Mon,  6 Apr 2020 19:47:27 +0200
Message-Id: <20200406174743.16956-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::329
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ZrraaGjIVP7

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/object_property_missing_error_propagate.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index edcaa4916d..a111e91069 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -289,8 +289,16 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
      *   SD3.0_Host_AHB_eMMC4.4_Usersguide_ver5.9_jan11_10.pdf
      */
     object_property_set_uint(OBJECT(&s->sdhci), 3, "sd-spec-version", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_uint(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
                              &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
                              &err);
     if (err) {
-- 
2.21.1

