Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2097470njb;
        Sun, 7 Jul 2024 02:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmOYPX/ZzoLhj4c5lffxlnuqrL6k7QLE2MGriQMYj4fi44rtt4QVT+oEOrmMTH9JLjZQPxODjok8FHaP10MncyaFrlwmoh
X-Google-Smtp-Source: AGHT+IF/1uTFB8m7fVEIjnI5yRzt7sxG3UdL36SKr3e+HTX2+pwqlM/l5IhKHg/7fpd5k5w+Fb1S
X-Received: by 2002:a05:622a:1884:b0:446:5d2f:a056 with SMTP id d75a77b69052e-447cbf4872cmr125857341cf.39.1720342829248;
        Sun, 07 Jul 2024 02:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720342829; cv=none;
        d=google.com; s=arc-20160816;
        b=HXDAS/L7xIZi9/AwcfEQ2YJBowJYlLZWkYXwcauDJCBY41EPFfJTdl+DErkkDDTFjL
         wmxEp4LPyaCbu8R9yIuKgR7yFjs2H71f2tQq9ygoIM4OZCzAn4BsxIh/EgBzc52zO+zO
         UGSrAUeG4d6UVkoJoS+5HtYCf8L1nH9TQSWi4RPJxdX/fKlWfJTMZi+X7PFggjWye4+t
         xTizQEmKloZ6sNj++10D0mhxCHMagMzFmdU6VS7fqieLfeiAyhnl2AFVcrDJa91dd0J5
         WbliUBB2b2dJLv9Pdoci3ogZCud+O3TyY2qc88ONLEJOIWLN3i89RuF4h+OUSZYnPU1X
         yE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=vgqKD2QOBi6bFJBvLWo5Afi4a+tq/8QOXwi1I5e8m3k=;
        fh=EsOCAIEOYNyvmbUjxNNCZoMsKfyU91bdyLuUx2SFw3c=;
        b=bgHJBsO3aAay0HM4V0vNKJyBHDAQqgKseIMezGM2M/VkOf/yqy5P9uVsWnzN32e/i9
         8FQuV28X3cJKtZGaZduKKisNCoV8i1nn8OUtfYXbZFyCGo7yK8ky+Nkbkn+8itquNEtR
         z5B+0g5cqQvUOZAyjU58fXDK7k2y8zC4IyIeEKk2W/P6GLaf4vW7ir988zE4ZYFTr076
         zdX5KiId/TCD0UNVUtORhGq1lgPoHpJ0Z9l1w58CJrW1dcPUNt6E5L/olxlGNvGL220p
         OjuenMTP7DiYQKsgUxT8Gfm+XJ519DeXzjRlEn/6vZYiRVao42kDlgCZUwL7XBwr6fx/
         SG3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="BbJ/Ms7/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514c799bsi208057141cf.640.2024.07.07.02.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jul 2024 02:00:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="BbJ/Ms7/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sQNkL-0002eg-UY; Sun, 07 Jul 2024 04:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1sQNkH-0002Zd-Gv; Sun, 07 Jul 2024 04:59:45 -0400
Received: from zproxy4.enst.fr ([137.194.2.223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1sQNkE-0006J6-B0; Sun, 07 Jul 2024 04:59:45 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id B01A22077E;
 Sun,  7 Jul 2024 10:59:37 +0200 (CEST)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id GSbPr4r7irzX; Sun,  7 Jul 2024 10:59:37 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id E8401206F0;
 Sun,  7 Jul 2024 10:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr E8401206F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1720342776;
 bh=vgqKD2QOBi6bFJBvLWo5Afi4a+tq/8QOXwi1I5e8m3k=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=BbJ/Ms7/LmWUqouOOrn9Jz7sA04d1QSUMZ8Uv/WrmteoK9GB7rfQe0xoFvyzpw9Bk
 Q6b5lpzbhOITNSYSmf1BvGKAlsP7rzCGUQfto3IRQZCozsVCsJomdpxjoxSdwAOGWA
 ZIRL5QZ/tTR9bIyeGUDxe1JruEQVNxX+hWEAhdjY=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id TAAXG3tW-j4g; Sun,  7 Jul 2024 10:59:36 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy4.enst.fr (Postfix) with ESMTPSA id 08DD02076A;
 Sun,  7 Jul 2024 10:59:35 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 2/3] hw/misc: In STM32L4x5 EXTI, handle direct interrupts
Date: Sun,  7 Jul 2024 10:58:54 +0200
Message-ID: <20240707085927.122867-3-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240707085927.122867-1-ines.varhol@telecom-paris.fr>
References: <20240707085927.122867-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.223;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy4.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JiTgi6ekDahd

The previous implementation for EXTI interrupts only handled
"configurable" interrupts, like those originating from STM32L4x5 SYSCFG
(the only device currently connected to the EXTI up until now).

In order to connect STM32L4x5 USART to the EXTI, this commit adds
handling for direct interrupts (interrupts without configurable edge).

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/misc/stm32l4x5_exti.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/misc/stm32l4x5_exti.c b/hw/misc/stm32l4x5_exti.c
index b9a69a69f6..e281841dcf 100644
--- a/hw/misc/stm32l4x5_exti.c
+++ b/hw/misc/stm32l4x5_exti.c
@@ -113,6 +113,13 @@ static void stm32l4x5_exti_set_irq(void *opaque, int=
 irq, int level)
         return;
     }
=20
+    /* In case of a direct line interrupt */
+    if (extract32(exti_romask[bank], irq, 1)) {
+        qemu_set_irq(s->irq[oirq], level);
+        return;
+    }
+
+    /* In case of a configurable interrupt */
     if ((level && extract32(s->rtsr[bank], irq, 1)) ||
         (!level && extract32(s->ftsr[bank], irq, 1))) {
=20
--=20
2.43.2

