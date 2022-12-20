Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4362300ejb;
        Tue, 20 Dec 2022 06:26:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtEvK4cpRuNHsVl0hzzq9Sxz/lMQjOK1B0oWoEdWFJzlAVavQFX4YwvBOAtF+M/yasOW2Te
X-Received: by 2002:ac8:67ce:0:b0:3a7:e91f:d23 with SMTP id r14-20020ac867ce000000b003a7e91f0d23mr3317152qtp.67.1671546369471;
        Tue, 20 Dec 2022 06:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671546369; cv=none;
        d=google.com; s=arc-20160816;
        b=XD5AZLj1Awm/c9/WF4b2ORhl/TThMBsyNcbmMYX8vKi2npYcVwi55PVKFtzu0mJReX
         wC2lPwiVq5TceRLN45cBzA8E6mhSTcxkj5xWbaqsXZu7X17pTARGZPTo+MxVpzF9LCaQ
         NXZt69BsReNIVD2UTOUeKoPLCwgzXc3YIhFI8VyPqLUVdAeRNGYOQgUpL78WcqoWTUA1
         Nrhhkbnm/xUodu8/NhtY3bHO3qVX97V6sZ8S73AV4TWOOmSy8pmuKoxpstYmzyY1QQhG
         9uyNewIeEmz2YVMhQwq8/dHsB/q3ZVjgwK736ZrHhaG1m/ts+XfUHbYdQjV3YjCDlsXw
         v0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YZacuc6hkXuywYHHFZgq2CU0UxEHNQQJhCq+mOWh6sc=;
        b=QbQYLOrMm+//5vdE3BwDaQAFZVRH66YnW2OW6CnNgLZHXMotbWFIA1R0/4Lmt6WAaB
         phzRXiQ6o0yAqGgoxUf73b817a1SmTebZTneEeYSF/rzKsM1BC1iRNnK0uBcIMwzxNnm
         Xp5FYR1Eot0y0QwFikSTArHDe/w6RFPLVUrBlpg5U6ysvgrAaP5UNr9lwcrrfUtcFbiL
         DMZ1dwAJ7uWrUvWP39DfJ8iR0TxtpQR32ltJQGEwcpim7uUX/zAOK1koetvcqRuytlu2
         zxvKvPWYwlZ2yCs5mLxggFmCT5SzSO9uJcXb/mSrBVu5CEi0usdbkr7oBXGvfvuju3zy
         UJ5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oK90c5EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020ac845d4000000b003a6a7728c2fsi784524qto.753.2022.12.20.06.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 06:26:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oK90c5EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7dZ2-0002yK-BZ; Tue, 20 Dec 2022 09:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYh-0002jO-UV
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 09:25:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYg-00076o-C7
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 09:25:31 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso8970256wmb.0
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 06:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZacuc6hkXuywYHHFZgq2CU0UxEHNQQJhCq+mOWh6sc=;
 b=oK90c5EMFqv9gleN3CJ9GTFswxADLz1WoH7MV9oKWkECdkw9D3mfmpSY/zKO28OsZW
 LJpqB/Oq5owlBGdje5kthNYVHwRi6Wc3zQCUjQRlgUPB3Xa0uH3csLCS9h9rnOpPCezt
 1F9IS30DxtaMELeod4B7k5Ysf7rPHuy7JJo8yl7jYkZDMaFbt+hjVAco/rcTEKbvyy5F
 UQhhatKoDxMXzzDooP2pi55ASEjpB5NmE0/tisFbFw57tVrsyQIvybpKH72QXCmpzbgw
 iKvCdttEqtry7gZVahF64ADPde2hNITkyvWeozSEDLDTCBA8YTT3msRrZkPqod43Fi9r
 QQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZacuc6hkXuywYHHFZgq2CU0UxEHNQQJhCq+mOWh6sc=;
 b=RtsI+SH85R5d6V+mW134Y53bw1CSfFQpluHjUHWJ4862tT73XJX5ZelazI21kVm87x
 aDrV6nN2YIi6AH+uDK9MsVbwujqRgUkzn8nA4a01xi12Wx8tBnwDnX2D3Apr6GKd7qkW
 zUkBno7Df4OtM3xbJf5tGxBA8jTvRtR7f9sh0K7yxaTaai92+ThOcPGyNxGbFqAguNGx
 rU+q8G3Ak57XS6By1OjK33rq1K4GJLfwi3optxfNlzAXvA9057j6fkHCRiTgMtwIn7O3
 c0C0+9qXI96G+HAgMhKstVVUCKRwBNJF/bFj8AGEAMoSt7CodxhRAcfvz0pZiVIldCOj
 Y7vQ==
X-Gm-Message-State: ANoB5pkrZXExT9B/9FTVBK/So41ja7gs/13+acsnMf+hCKBaZoLmQVrV
 RUEy+1pq5SyfF6CzvukemxaLAw==
X-Received: by 2002:a7b:ca45:0:b0:3d2:fbab:3609 with SMTP id
 m5-20020a7bca45000000b003d2fbab3609mr14806088wml.27.1671546328774; 
 Tue, 20 Dec 2022 06:25:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 189-20020a1c02c6000000b003cfd58409desm23303881wmc.13.2022.12.20.06.25.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:25:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] hw/input/tsc2xxx: Constify set_transform()'s
 MouseTransformInfo arg
Date: Tue, 20 Dec 2022 15:25:18 +0100
Message-Id: <20221220142520.24094-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220142520.24094-1-philmd@linaro.org>
References: <20221220142520.24094-1-philmd@linaro.org>
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
X-TUID: WiMQWxOHw/VD

The pointed MouseTransformInfo structure is accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/input/tsc2005.c         | 2 +-
 hw/input/tsc210x.c         | 3 +--
 include/hw/input/tsc2xxx.h | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 14698ce109..555b677173 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -523,7 +523,7 @@ void *tsc2005_init(qemu_irq pintdav)
  * from the touchscreen.  Assuming 12-bit precision was used during
  * tslib calibration.
  */
-void tsc2005_set_transform(void *opaque, MouseTransformInfo *info)
+void tsc2005_set_transform(void *opaque, const MouseTransformInfo *info)
 {
     TSC2005State *s = (TSC2005State *) opaque;
 
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index df7313db5d..fdd5ff87d9 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -1176,8 +1176,7 @@ I2SCodec *tsc210x_codec(uWireSlave *chip)
  * from the touchscreen.  Assuming 12-bit precision was used during
  * tslib calibration.
  */
-void tsc210x_set_transform(uWireSlave *chip,
-                MouseTransformInfo *info)
+void tsc210x_set_transform(uWireSlave *chip, const MouseTransformInfo *info)
 {
     TSC210xState *s = (TSC210xState *) chip->opaque;
 #if 0
diff --git a/include/hw/input/tsc2xxx.h b/include/hw/input/tsc2xxx.h
index 5b76ebc177..00eca17674 100644
--- a/include/hw/input/tsc2xxx.h
+++ b/include/hw/input/tsc2xxx.h
@@ -30,12 +30,12 @@ uWireSlave *tsc2102_init(qemu_irq pint);
 uWireSlave *tsc2301_init(qemu_irq penirq, qemu_irq kbirq, qemu_irq dav);
 I2SCodec *tsc210x_codec(uWireSlave *chip);
 uint32_t tsc210x_txrx(void *opaque, uint32_t value, int len);
-void tsc210x_set_transform(uWireSlave *chip, MouseTransformInfo *info);
+void tsc210x_set_transform(uWireSlave *chip, const MouseTransformInfo *info);
 void tsc210x_key_event(uWireSlave *chip, int key, int down);
 
 /* tsc2005.c */
 void *tsc2005_init(qemu_irq pintdav);
 uint32_t tsc2005_txrx(void *opaque, uint32_t value, int len);
-void tsc2005_set_transform(void *opaque, MouseTransformInfo *info);
+void tsc2005_set_transform(void *opaque, const MouseTransformInfo *info);
 
 #endif
-- 
2.38.1

