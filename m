Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1804243wrm;
        Sat, 5 Oct 2019 08:49:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDMzK8RMSbtrRPFOEDBwV0EGT2HaXRcdapHd796UfgFBsnrfAtDdGEtWmSImn2lrHC/+Yp
X-Received: by 2002:a37:9b13:: with SMTP id d19mr15668579qke.178.1570290553103;
        Sat, 05 Oct 2019 08:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570290553; cv=none;
        d=google.com; s=arc-20160816;
        b=hJi8TIg0ul6O3Mpr1uEh+mE9ugFvDcsyZ0oX5dvpLwX93x0SgPY5n+lgcbBELBRwIH
         pbfLz+Ffoehqfa9tniyKpHPDmmXatc02uuBIPgQMVjf8Uonl7KcmYnAnILmDybbhzI9x
         oeuA39xQ2uz5pD51tzr7cgVJlXvithWZLkfyJEcpcJ/t0p8mn47UEUIRuNd1Q8R4WLph
         /BwsCBGIlRLqEE9wondkQiELz5mfEUIVJW0jJZuL1XCsUp4Qwfu4RMmeVZBeKCoygmLX
         LrrZtBlyC9x8hiVmU0mr6+O4WkV/AL/bIgrGjcD3ll/Y5+6K7MGBIe9yPLTzZphcYlCf
         17yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x7aN04x8oQId+qYbRq/uf3XYmeFkyrCLW6hBSepKaf4=;
        b=T41DJu+4hKc1o50oyHFYMy5xKkspyiNnsRSbxvt7HGfVB/G7FLBtEWRAMh9BbF454g
         1OtSUBPINuSudixceGs5VSQb9M2FfCbvQJthsbSEt9EfTFROHOwh1iwUZm3sYASZC/Vg
         HmNQsgCKaGDjWdb4WnlyuLFqstDEwRLOZjkrWkfV2MncZRY4T4yK7Ng5c+R2+Wk4bk9w
         TIhgz0BZd+ArFVLcmR8UA7Dod3fw7CAoODcxUTt/t/ns+fU3EgzETHGA2CZ3TvaHWiU1
         6Fq6wTGTtyAP9VjeQmVWNanJmsriCpF9E67N/VDxuN864ZEWZumoXCBXUvCv1ZD9AO4m
         Q8Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hexhCZg6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y66si8742553qke.145.2019.10.05.08.49.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2019 08:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hexhCZg6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGmIy-0008KE-8t
	for alex.bennee@linaro.org; Sat, 05 Oct 2019 11:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iGmHm-0008Jy-94
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 11:47:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iGmHl-0007yO-CX
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 11:47:58 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36861)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iGmHj-0007xJ-Mu; Sat, 05 Oct 2019 11:47:55 -0400
Received: by mail-wm1-x341.google.com with SMTP id m18so8508046wmc.1;
 Sat, 05 Oct 2019 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x7aN04x8oQId+qYbRq/uf3XYmeFkyrCLW6hBSepKaf4=;
 b=hexhCZg6tJ9CiWyczT9P2o+wWILPANwGhS8LPCAyCnJcbTFNv9xNd4JrHMnfbR9wnT
 qWFXXoaOV4ywP0m40pKhNMphaDcICHpel/pSzNqO0pzdCn87CAXyN8eN7hM2sFnUH71s
 pHFf3szAo3mKlWMH8mIDs2SrLCAxGEq1iNcFeGxV+TG+RQwcKs1a8Y7gzWoZHh6Z6WMg
 u//pMv/MQGs3JTI2bDd5YurJxJbIHG4xUfI1n5/zHvkUrKCEeuxDnob7wVddPK+kDpxQ
 VVaRFGF/vuq07rqie0OkWgcFJq13OIB+5aZiXXI36h9UFHe+NYsy0CwgGbjhMYr6J4NB
 nwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x7aN04x8oQId+qYbRq/uf3XYmeFkyrCLW6hBSepKaf4=;
 b=c+m9FDj4uJ/9TRq8q72AGjosHMNAQr4bQQesxVj3zbqBphAEGRKJhFZj5sbkSqQPMT
 77j0tPKfvU8xnNaovKHxt7sHG/h2KJf71s1kEAlF4+SMJy25vG8LhIXHO9BGatWcxXnD
 24nJEUpbk0/q8v91YrsytZ5oqvAoP4kZSCSoyWijDNwEDAOnkTnuLQTGPOAx8JHmaXng
 TZ10wi/Y2KXSYvu66HA7tbOrRgu2/OihTNeJwuF+hTD3zSBTBA1xnUp+R/h9g8V7NrGS
 ver8bYHAoKptCyZU1eMSmE1S4MdN4qmQ9shb0ZQJpEg02yaH66bbsvLceAJRL6W2wX/k
 SuVw==
X-Gm-Message-State: APjAAAUr06bPTZIs+10rjEzNKxam1cEEPJMA0unHgg8V95QSc9ZVsEPk
 8xx7nd4DXCvXqHd0cRGkkfSR3kX1wao=
X-Received: by 2002:a1c:7902:: with SMTP id l2mr14509436wme.55.1570290474543; 
 Sat, 05 Oct 2019 08:47:54 -0700 (PDT)
Received: from localhost.localdomain (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id o22sm24542294wra.96.2019.10.05.08.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 08:47:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/sd/sdhci: Add a comment to distinct the i.MX eSDHC
 functions
Date: Sat,  5 Oct 2019 17:47:45 +0200
Message-Id: <20191005154748.21718-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191005154748.21718-1-f4bug@amsat.org>
References: <20191005154748.21718-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Basse?= <contact@fredericb.info>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Evgeny Voevodin <e.voevodin@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Dmitry Solodkiy <d.solodkiy@samsung.com>, Cleber Rosa <crosa@redhat.com>,
 Maksim Kozlov <m.kozlov@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zHeAOYAKmgRf

This file keeps the various QDev blocks separated by comments.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index e08ec3e398..82ec5c1b4a 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1532,6 +1532,8 @@ static const TypeInfo sdhci_bus_info = {
     .class_init = sdhci_bus_class_init,
 };
 
+/* --- qdev i.MX eSDHC --- */
+
 static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 {
     SDHCIState *s = SYSBUS_SDHCI(opaque);
@@ -1734,7 +1736,6 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
     }
 }
 
-
 static const MemoryRegionOps usdhc_mmio_ops = {
     .read = usdhc_read,
     .write = usdhc_write,
-- 
2.20.1

