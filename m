Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp741161ejb;
        Thu, 15 Feb 2024 10:06:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVdxl7ipBb06vWmLJTsMyhCsQt0Uta84XoiL0Q2M3BbqIUIIi8BCFKZlc1IQrJqQhEQQF7yMWLQTe57/NmhfPgl/EHVMbsl
X-Google-Smtp-Source: AGHT+IE+4mXcccpbm2bf+ZuK1METIlxZ7cpn0Pb5K7Wa/guGU87gI2RlZHxQTySULUEb8IogRrK6
X-Received: by 2002:a05:6870:ac12:b0:214:44cf:a824 with SMTP id kw18-20020a056870ac1200b0021444cfa824mr2995354oab.32.1708020384569;
        Thu, 15 Feb 2024 10:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020384; cv=none;
        d=google.com; s=arc-20160816;
        b=wm2IXiElmFWCwJcrU/Hoi3Kc8T/3Bo1jntdm1Xyi/0UBLvAu1mUTr4+HbkhU13GHsP
         YsP4PaV9tML059HDHMtbHJlfvVozMwTkgI1SFlafjkY1RSbGqVq/VA4dNDjW93LX+7vJ
         GJEf5gHiWezhSZu2iY8lKuUWu2W11CPMSG68IIO/o6gO+uf9pKKf2dKqrjew2D77LBGB
         aDCreJPpE7ncjqoK1eNiegV9zd4mb1aGC9/qov+5afjZRIx8CvMSpAIaghRN8Tmd4Lmz
         fTtSymORjd9/aXTrVw87cQA9tPi0jK3F1bWHxbiL/uo9OvP0xvxM4AxbUjnNGMyltG1+
         yNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BXfzEOj0hY/4x5MiiqGGaWqtsIu6euoUBioh29pYX9I=;
        fh=8VeYEyiGru8DTIVuSbXq0DHZvu7muUI5BkGtr2iAYjY=;
        b=Mm5k6JSY1jX2SxmfahFUJGOTZYEVdXNtdVuHUWKfkyunB4CJdR30nmG2e5DwMkUCpT
         HM6JiKIGG8kQk7MjjlyPl972xgQMS3BGFAUqo8gY8oxCzYAW2PN3ldWIVwrT8FxCCUn5
         nUs9TrgQxfKbLf5Eu/gHkddS/EIEMX3wnntQ11ao6UsSQauPLqEmYGKA52IOTb6Ys/20
         BKrnWgYEwjSfK9fH9akNi6wpVJREk5eGYPTWUJljvp2c3EZ4+E3GrtbTs9q/6j4g8hQL
         LQbOJsd/Qzsy5gkIY/eUvJ1igp6x7OmCEStWxjB/qbu/RbP3aXxysW5Qqjre13noNNhL
         EQJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xHbrDOkq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq22-20020a0561223a9600b004c063844233si379733vkb.127.2024.02.15.10.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:06:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xHbrDOkq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag2R-0000sz-BC; Thu, 15 Feb 2024 13:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2J-00006N-45
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:41 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2F-0002IL-I8
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:37 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5600c43caddso1403481a12.2
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020034; x=1708624834; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXfzEOj0hY/4x5MiiqGGaWqtsIu6euoUBioh29pYX9I=;
 b=xHbrDOkqODeWueV0VkFu97pTrV6wGWnI+WNPWo64qHXEcDBlG8mxeTKsixoglCKYld
 IIYLiaQAgXwSRYIrWLNHdtEaTTcyjlN/ZYEaMzC5dh7LCJEBn5csR3gULM9o00K5cB9B
 wcp1OlyACoAwOj3MUS54PZUhUzzMLYIJUnCADp8hdPq4cc1Wb3Ag4X3/6pNYpSDHIbm+
 lnGCfKSP+pZBOhfP7KnWy5RfOc5DhLJt43Z1MuM8X8Jmfx16OrlC8X6o5s//9/l4aoGv
 paoprbcHKLiX+sfC8g0o34r/AszSCv4ZUdEv0lKIwBU7EddD5U1b985PphsSq0DXmEma
 FFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020034; x=1708624834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BXfzEOj0hY/4x5MiiqGGaWqtsIu6euoUBioh29pYX9I=;
 b=JYwg+34SV/skc5giLmoNsJg3/aJShC30pRMCiHjZ+XfGcJx7JFoV5BDbZz3azClGa0
 0nwqJGTQ8udQIT4BsRo70EmvrMEVu/SUchHh1I/rFnUvmGHHzxWiP8FbdlH7HKeLqZmY
 nhQuKbFHNMPLaRVNJtxnyBfFFAAfM8wywj0Kjh91itR+RDGWyvGLrq2NzcX0Chj/KTDy
 IbB1zafBrrOjAqaivtFYYQEos+13Ony6nkpb7NhwWW9y6yzlmk+vQlQha0YVG4ZToylC
 a74Vq2ionTIWXfa4fkS933qExlntwqMp+pxpcRzwAFeBS6DolEBu94zgKELf2fvOcayH
 pRgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD1ZGrhip2PaL40+WPNALkNYNd6tUkEEOaB+XuaJdpoa7heZ+pq4wr83yibjO7zJQZ0tfUYVNbNGw4TaNiVE5qnE6K
X-Gm-Message-State: AOJu0Yz/mAjHahSYbXO+LX5Fgb4zt6KUHDorGPkGFXu8cc1MghpB70Wb
 8U2ewhQbwhnMXbbxef91rlJ4lNHi6ZbyA+WL5WDtPmw1w1eYuZAHHD0i8MGYeC8=
X-Received: by 2002:a17:906:b0d9:b0:a3d:2243:29da with SMTP id
 bk25-20020a170906b0d900b00a3d224329damr1812382ejb.36.1708020033980; 
 Thu, 15 Feb 2024 10:00:33 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a170906670700b00a3d2d81daafsm791088ejp.172.2024.02.15.10.00.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:00:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 24/56] hw/misc/macio: Realize IDE controller before accessing it
Date: Thu, 15 Feb 2024 18:57:18 +0100
Message-ID: <20240215175752.82828-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: R+BGhJJOaQEs

We should not wire IRQs on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213130341.1793-7-philmd@linaro.org>
---
 hw/misc/macio/macio.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index c9f22f8515..3f449f91c0 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -123,14 +123,17 @@ static bool macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(ide);
 
-    sysbus_connect_irq(sbd, 0, irq0);
-    sysbus_connect_irq(sbd, 1, irq1);
     qdev_prop_set_uint32(DEVICE(ide), "channel", dmaid);
     object_property_set_link(OBJECT(ide), "dbdma", OBJECT(&s->dbdma),
                              &error_abort);
     macio_ide_register_dma(ide);
+    if (!qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp)) {
+        return false;
+    }
+    sysbus_connect_irq(sbd, 0, irq0);
+    sysbus_connect_irq(sbd, 1, irq1);
 
-    return qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
+    return true;
 }
 
 static void macio_oldworld_realize(PCIDevice *d, Error **errp)
-- 
2.41.0

