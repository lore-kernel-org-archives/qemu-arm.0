Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp192645lff;
        Thu, 12 Aug 2021 02:38:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9Bk2+FFwijTbfPjrayX0ewMQ1lAwY9LxSTtq2L3QySZBJeR6YPc4I0Q4VjVIIYAh93cMX
X-Received: by 2002:a92:d9c2:: with SMTP id n2mr2158092ilq.214.1628761093637;
        Thu, 12 Aug 2021 02:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628761093; cv=none;
        d=google.com; s=arc-20160816;
        b=iN7e+8DnXUOKCk5zjcYI6ZOs9EFWAi1s0BCGKDEUHBkaxRvx7orHvQJPZQYct34EX3
         sO8StT58V4RxfJ204eq9kMFWPWFYVOVdn1u+K+XQIkLypFmBx0/usD9+svnUwWsCzLPh
         whUPTbsKMxHjqjs5PVXWii1C7KdL0eIhzi2wBtl8PIdf4wsvFPvY3VnCOo227Mm2hVgh
         Mo8Zkm2aWDfNON4annrRquoGCis9/abuhaTx2Fg5i2VFAPMXsD/H3dXBJ672cpcpp/Gj
         ytG4v8GXj7kI1YLjMRk2pmmCRMbUQFo5EyKj3NwrdW6IP0jGlibwzCtGl706yAKO9iPl
         6QEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Gy7QIjwsa6xMVXE5/WQWgxzP9shOsuOqrCvuoAh1kM0=;
        b=ICXHIcAIxsETQ5WwHQ9BJM+eTYg43NkmvYcWW6CQGzwEGZRmZ28DIXXeQ0IMHCV7KU
         ldYZpjsDBYoDRdxR0R4qGw7Ccy9tV+nr1NVEAGMvLpabzxSArdIyKsUQiRCRF+v/98rE
         E3jE3k2puOafIsSi6wBBtJLmuMr+kMgfcsxUeLSU+/AryF4ElyKvFA1z0vB1BiDB2nsV
         jKJP8P7QO/VgkRXFQNeuWwWStm48GCN6K9oBiAYqTAE+XQZRra/XE82WhcRSVvA70iAc
         2bHge7vJ/MXBq/OWuBMge88eviZYE9ma0KqVAzR2HuOx0D6XhIzs6z+v00Y0u+pS01Nx
         HG+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yjEztFIi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21si2570325jao.126.2021.08.12.02.38.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:38:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yjEztFIi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE7AC-0000Z4-Vx
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76J-0005Aw-EM
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:11 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76F-0007pR-Bq
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:10 -0400
Received: by mail-wm1-x335.google.com with SMTP id f10so874591wml.2
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gy7QIjwsa6xMVXE5/WQWgxzP9shOsuOqrCvuoAh1kM0=;
 b=yjEztFIiLyTiFaUGHat3wweOHC+q7B1SVZktRxyNoKabbUmXzq9zgwbvQHWkRlskJR
 PH0GtkH6Js8m1bZRrw+PUP5heepK13l56bubLm8B8GNQSIKdnblBTW3yBugpEiH0qMmK
 aqUWHQX6fBC0xSWJn/4i9hkbNtzErj0qBLTrDoW44DpCiEQVEkN7LLd3QHgvirYs4ufx
 cS8557TZEjDNjxUb1ZUW0maKaeUMrHTzYIHJNDoW4oazsoF2rGbHFUvOgJPQfZO5JMF1
 MA3hkthZJTZGv7a9+z43gWFUmnfTledZGrMOjx0/LPvx7YnBxNh53ZBGVskn0egqKfgY
 ywdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gy7QIjwsa6xMVXE5/WQWgxzP9shOsuOqrCvuoAh1kM0=;
 b=BCnuvV7bJtOMoanGyFYQjIOc/rEPvdj67ZOi5ji8XtkOe2q/CmeHZRJbJyQqFTXTbD
 Hi4IWjY9OZOQqFmgtPBiXg33ZhBbQdB6bX5GsdEzBftVIdr34lBTU3LkWc2JOZKdZBSO
 Ncb/F4c1sfBpZyOWjC3v04vii2+80GtPEDL0oipkecUcfezQHT3HjwH7m9kHm1+3rs2z
 fVsnlALuztUQt4umE7NrNdJ59b5jaipI39ZmnTtWSIydwTFtwEYQKQcn9k0/FmeSUJS9
 5BgL3p1t2O2Lb3xgpw+Yut5/lC8B/3JrewjF5hq0JJYcfN9fj9k/NZrbWiczjULxfgrD
 qTVQ==
X-Gm-Message-State: AOAM531/qE8nqLxVQugD7s2jOGEPsygEVp9gDJw2nuQVBhZIdKu79zL2
 obfyHI4U7c8GPdrDrDo7gIMZfn6ANlwsbg==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr14389545wmc.15.1628760845800; 
 Thu, 12 Aug 2021 02:34:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 07/25] armsse: Wire up systick cpuclk clock
Date: Thu, 12 Aug 2021 10:33:38 +0100
Message-Id: <20210812093356.1946-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sHCVsQus9ptl

Wire up the cpuclk for the systick devices to the SSE object's
existing mainclk clock.

We do not wire up the refclk because the SSE subsystems do not
provide a refclk.  (This is documented in the IoTKit and SSE-200
TRMs; the SSE-300 TRM doesn't mention it but we assume it follows the
same approach.) When we update the systick device later to honour "no
refclk connected" this will fix a minor emulation inaccuracy for the
SSE-based boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index a1456cb0f42..70b52c3d4b9 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -995,6 +995,9 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         int j;
         char *gpioname;
 
+        qdev_connect_clock_in(cpudev, "cpuclk", s->mainclk);
+        /* The SSE subsystems do not wire up a systick refclk */
+
         qdev_prop_set_uint32(cpudev, "num-irq", s->exp_numirq + NUM_SSE_IRQS);
         /*
          * In real hardware the initial Secure VTOR is set from the INITSVTOR*
-- 
2.20.1

