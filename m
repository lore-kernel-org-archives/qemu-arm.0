Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3062713lfh;
        Sun, 22 May 2022 11:23:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxfiirPbIV8dUsKbDdRM7stconNHCA0nE/PVATUhZKKVRJVPzCJ1i649vPXbkLsHj27r1z
X-Received: by 2002:a05:620a:2586:b0:680:f846:4708 with SMTP id x6-20020a05620a258600b00680f8464708mr12148163qko.654.1653243805540;
        Sun, 22 May 2022 11:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653243805; cv=none;
        d=google.com; s=arc-20160816;
        b=quLZCjp4cdWXSoxCAVJVT5byTCrv/RYL+1WMIMVaiRj6G6B8XkSUKoAQA378NQ3iWZ
         5q/7wI9xPEvBKfI3k3sBFR0DTR7y1FrcszQij+vx8jarrJDjNhYuuqeedYMm8Xt70aBT
         t9DJAKHRI2sy/XgbTDOSDHv5aHbkmriwwqp0r4jMBuTtmaBRmfYpWr5Ffs8Nl+sb3vrp
         CM9KuQGE8xoZV1EmA2mWAhxyJEdBy5Q4GnLwxHzRGDXo0HSCRUnOl2ojn3nSsTCfDeuo
         1Jk0nKD3+P/UqrFA3/by6BXUO6nj5TzgZFU2piBi6AyPcCPL6snYkoNWAt64RDNWqJAD
         TAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=8Fwx/I/vPtmESsSn7/kCagHh78QfUAB1qwIAGxuaxGA=;
        b=ZZABoQ+L5jBkefVK6r+NjByg1GWlMF3tsHM8BVVM8PDrhiTYkXWa1KPkl+Neb4eFwJ
         lzl4d+oLxm1Gtg675TZeqgmbKe7koDxl6U+ksx0EhH2R2CNuchfReah+sb4Ykq4W5+bz
         cJ99t3c7RGoPgQkqXGJ43yTPU8KoNgvmsCHWlBxu0a+tIpuofyr2iVN6E2ai6OB872Kz
         Ca1nHPBaYd+C5rmKvlJXSxbBJ4eIB8arXuW/FwT2vE4pdVoNXvJV+7kYeOQCM1ydH1My
         qLRbnB0uNESwRVDLn2bOLkPIkww2tNw4/JEb22bDEIHzULZoZjUXVTyuKGbn2wompibc
         s6mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=cTLE71MQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05622a058600b002f932b25a91si870694qtb.631.2022.05.22.11.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=cTLE71MQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqEe-0003oG-1Q
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAq-0006u6-VZ; Sun, 22 May 2022 14:19:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAm-0003Z3-7O; Sun, 22 May 2022 14:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Fwx/I/vPtmESsSn7/kCagHh78QfUAB1qwIAGxuaxGA=; b=cTLE71MQdd7TKJagptoK6mdTih
 tT8WuDy1W1+P/jY/CfHN21kCDhCGgySuS1b1ZhQYL4KXsZhJmZ+pxJiV0LajQ3M49/3rLitmnxOg1
 zjc2vFwEsUqfo6CtrvCfgRe4ftafHzNKBKV9fUhlHwVeVPG4lLZ3lb8+oaGGqQ7ShERSQj3TxWMUN
 SCpaFTg29ppK9WW409e8lApx/4vD/D2v5NDyG47J2mzTLhnPB2JYMLZZjHzOcDdg20QDzDhOIk/ql
 h9bvc6zNqNpCw9wlCbH5LuqxDLKjzzCfV2+zMRtmre/o/+cNSCvFoCrZvcRw5fiHuC2CepEypSpV+
 4Ib9FdbiBM6QJFfmsmrYszBvlCAtoULfO+41m3dhqzYdpB6KGvvSBgcIy3QYaIMyZF/afzuyJYxen
 u4PMxzOacCP6DxPAWFVYylKRGFQ65LqTqnnOkvtZgy3t8s+VluzrB+/tZ8MaDeSz95CvDibtAfPrw
 /W2tOXfgpvLVmNWFicTrVMV/0ULNbrvNJUYkNA2bbbmGpgD6FMaAb00Wttw892yFh6jCx8FZia48X
 1+Zi8/N9FFTiFPYDhy6gugUdjjNbFI8Xvj5onMJEOYfSETI+996DLpLfRaA4mrwGitTsA73Pvlpfh
 j/i0t+YUrL7Kx1/KO6hSHMiCAy4LuoTiK+K//FQV0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9b-0007pH-R1; Sun, 22 May 2022 19:18:16 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:55 +0100
Message-Id: <20220522181836.864-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 09/50] ps2: remove duplicate setting of scancode_set in
 ps2_kbd_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CMOI4idEDcrP

The default value for scancode_set is already set in ps2_reset() so there is no
need to duplicate this in ps2_kbd_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 5990eb6f79..555abb5392 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1227,7 +1227,6 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
     trace_ps2_kbd_init(s);
     ps2->update_irq = update_irq;
     ps2->update_arg = update_arg;
-    s->scancode_set = 2;
     vmstate_register(NULL, 0, &vmstate_ps2_keyboard, s);
     qemu_input_handler_register((DeviceState *)s,
                                 &ps2_keyboard_handler);
-- 
2.20.1

