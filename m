Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1643485ejf;
        Sun, 25 Feb 2024 09:18:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVWPcMl+mhaD1xRg1PIMt3l1pjxN1iK1MPWO7tpLxLc6BDscfIs6LvMMxyn1nwycNyIixXExBLMgkdXpzob4lFCygAarTSD
X-Google-Smtp-Source: AGHT+IHgcBS2D2ge88STmkZaGZ4/uzs066LjqXOl/IxxaxDwqp+ueagHlX5ffYTJvB59XxC/EsAy
X-Received: by 2002:a05:620a:2236:b0:787:8545:80c2 with SMTP id n22-20020a05620a223600b00787854580c2mr5384852qkh.69.1708881488539;
        Sun, 25 Feb 2024 09:18:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708881488; cv=none;
        d=google.com; s=arc-20160816;
        b=O3xqhFzLeP9S/PrZB8qJuV9tHwGazSNrvsLiWHkyUee9tSaa9sj5THkIzz2nksJZ7d
         hg5MTNSDLd+vV8zgYkBbP6t+fBsY3ND/MZIkYRxwEHuUAP6boVRLIFVtgFHGc01afK5+
         120EY3SvoU2oZNyhNyACGEhfTmUPiSeAhgnTwIVD55mlTX54pe+gOpFuN8ntHq/KAJ1s
         9AoAcTP7/55wWy3yVqijRFVkynwiF6kBUSFq9Z0CPiv/Xu3G5nNnXFGJ5axfqHPX9JTa
         ysMaVuzuddxkTVGbiHLtVyc+c8jw6s09zFMmB7c3SncDOq7KaH61U/lK+lqztA/gLAKM
         GtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cwzDlmu7+joT64q6lgoDz20T+b1NRYPG1wt4e7xF0MU=;
        fh=6E2N2cHVRD7NPpqseavCriFyBhBdJ7HJwxSbmNByG5k=;
        b=CgH7kRwP2soDIEZIDKV9nCR3jL47gNEFgvOTwTbp4SVUOtysPDYov6MKvJ8V1nOcQN
         xSsBDntcMuDiGuQUZ2BxgquydPih2+2yTAY4VwsukkMXb7qaWbdcvf4/VJYnfGw1r4kj
         rY0RPBKhfq8MB5Hjyj2SlNtFNadCC5G8bYQz4leQ64+TO5VoZ8P0IyU7lejZRglTjJv1
         fKrFiddvvEFPlE204rCnpjuFFd1ZnbRNN7AxRWg0IflHKfNOivEOOSI0iBYJYR8GUz+Z
         SzZf7UsPJWqndcZxcbcc5vzmkOVg+sIK/woCNIKhZQF8cAT+wZ6lwQmdhZsRKUEexsr0
         F3xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RA5Ff0ns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5-20020a37c245000000b00787bd40a4d3si3239719qkm.644.2024.02.25.09.18.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 09:18:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RA5Ff0ns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reI7P-0001st-22; Sun, 25 Feb 2024 12:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reI7N-0001sH-Ii
 for qemu-arm@nongnu.org; Sun, 25 Feb 2024 12:16:49 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reI7M-0003wP-4I
 for qemu-arm@nongnu.org; Sun, 25 Feb 2024 12:16:49 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412a3eba4dcso3037335e9.2
 for <qemu-arm@nongnu.org>; Sun, 25 Feb 2024 09:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708881407; x=1709486207; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwzDlmu7+joT64q6lgoDz20T+b1NRYPG1wt4e7xF0MU=;
 b=RA5Ff0nswQF68hFCVjnzAqGpfIcCUpWYAfxEh7MIafWZl7bfLl14dGPni7Oe3frnYx
 YBHBN+ptiGyLNnOiUPuO6oHpZFSKo/FGB6Kf+7PEJsKC5SqVrYcGnwdgShX+5d0spDn1
 NojeOS8r5KCc6tqaQXwwvnIQGO7QTrkZwh/4ansm6vhTRW8HEiyQfIT/4v2y/FK6MyzA
 fc4fgkr+3IxUeymk5IEbEFkTpNlIazkK1qipzSZvCmy4b/81UKveri1HnI5zVxUI+5MC
 NO/d14eZZVn9gsmO4kv9cW5kRBRWHOi8h1n8qoeUnb3PmtJAo8K7x/zizenlZgGEXnpU
 rgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708881407; x=1709486207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwzDlmu7+joT64q6lgoDz20T+b1NRYPG1wt4e7xF0MU=;
 b=EvBN4tg+W67MqUoOwb5NAp0LzhZ+S/3eiDKOnX30gB115JmwXYX9kdE+nygYKdnZGl
 daiGNiFfuEvpJiej2/Z2burdW/z5TRHvfiwHVzlwagfsHOdmWmy8Wib0D5sxjrdeMjlM
 leFtbjwNrS2DLa4oZ7/AojSNj6vq9yndFzXxa3bVbf4JdxhkIeC3A3AhOp4fQu+wqjJ/
 1ZA4UHl09Stqli2PoQIHgFr1JIeBuuP2vGORkVUZQvwtMnJkB8++0ng6lB7s297fMxqw
 RnT/MkeGgSZsb9mj+qAHmomFxQiHy1NPyjxk82G8A2qHDfTDJ1oweM8hrNmLamXKU+D7
 ooog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTa2nr6cYMHiX+FBk/x6NmCEBwc4Frck2h8e+RmJrogD98ymMcN3Z1mTimdFR7C7wVsE2RN8KRGRKIVxxZZrR3w6Vx
X-Gm-Message-State: AOJu0YxhsUGwrq6TU7amn1s5/tM67fIrKVf1z5bkiSe2bEzTxMsQazSm
 4Dvr5dmccLUy2ldheDPX+VhthE/NOR+8VT6hIxhK5MU46ZNQI8t1Q9OuqTNterg=
X-Received: by 2002:a05:600c:41c2:b0:412:9018:74ca with SMTP id
 t2-20020a05600c41c200b00412901874camr3943606wmh.35.1708881406794; 
 Sun, 25 Feb 2024 09:16:46 -0800 (PST)
Received: from m1x-phil.lan ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a1c7906000000b0040fddaf9ff4sm9297419wme.40.2024.02.25.09.16.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 25 Feb 2024 09:16:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/3] hw/arm/sbsa-ref: Do not open-code
 ahci_ide_create_devs()
Date: Sun, 25 Feb 2024 18:16:35 +0100
Message-ID: <20240225171637.4709-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240225171637.4709-1-philmd@linaro.org>
References: <20240225171637.4709-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: dxr65wZFM0UE

Use ahci_ide_create_devs() instead of open-coding it.
Not accessing AHCIDevice internals anymore allows to
remove "hw/ide/ahci_internal.h" (which isn't really a
public header).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 5d3a574664..995c7be23e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -37,7 +37,6 @@
 #include "hw/block/flash.h"
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
-#include "hw/ide/ahci_internal.h"
 #include "hw/ide/ahci-sysbus.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/intc/arm_gicv3_its_common.h"
@@ -572,7 +571,6 @@ static void create_ahci(const SBSAMachineState *sms)
     DriveInfo *hd[NUM_SATA_PORTS];
     SysbusAHCIState *sysahci;
     AHCIState *ahci;
-    int i;
 
     dev = qdev_new("sysbus-ahci");
     qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
@@ -583,12 +581,7 @@ static void create_ahci(const SBSAMachineState *sms)
     sysahci = SYSBUS_AHCI(dev);
     ahci = &sysahci->ahci;
     ide_drive_get(hd, ARRAY_SIZE(hd));
-    for (i = 0; i < ahci->ports; i++) {
-        if (hd[i] == NULL) {
-            continue;
-        }
-        ide_bus_create_drive(&ahci->dev[i].port, 0, hd[i]);
-    }
+    ahci_ide_create_devs(ahci, hd);
 }
 
 static void create_xhci(const SBSAMachineState *sms)
-- 
2.41.0

