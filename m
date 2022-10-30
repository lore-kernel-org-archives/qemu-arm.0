Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp531881ejx;
        Thu, 1 Dec 2022 07:43:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5kAQVz070wAgiEnSaIBsIIjKp/nt+CxxxZXgWe7KWFjXvdFszBB9EIdrdTJXtE06HIHlnz
X-Received: by 2002:a05:622a:5c0e:b0:3a5:4086:a5d with SMTP id gd14-20020a05622a5c0e00b003a540860a5dmr46608008qtb.76.1669909439375;
        Thu, 01 Dec 2022 07:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669909439; cv=none;
        d=google.com; s=arc-20160816;
        b=SLdzNpR262PINY9LIzwxm3w74Eb9h08VW+I1x1KD7ZCtNZFZ7yIrMiiKq/VKnUVLwL
         FmzBMPifWbNuocd8pA7x7h/ahrzhgUfHlv3eh1hh6wdjvueLVaEKqQKm8tfGYbe7uPDa
         P5K2qUkFKM4tF0YbkLdkU5B3vbgWNQReK7CylODNcKPiA+jrlu0CiGOaTa1pVokOzCsx
         j170vHLimyCZhYj9Sk2jTQDLf2iT3PQUVlko8IeYV5gfH6D3cJ5Bu1xBQTOBZ/grOCiI
         S2Myw9kp1vsW0JYg4kRtLy+o2yn9d9scdz4kDSSA4j4XXe9lls2gfqORTzQr5tdeNNT5
         C0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=viAIq0xNlfz8P8lujkRaoK76PZDIQ8xuD9mVTf707rY=;
        b=RA/LJC2WlNR67HLG4x0W0Cp3bvnVRuq33vCmp1bYHpRol9MwjMJBW/qSxyjDOJeH/u
         LjRAUTRwygxKBJXnLcfPA0JDxvsLmDriyEUAL1D6r2t29LV7/s/N7UKp1iY1hNxtkeXM
         caRq1VnPpDIyeuZx6Tmbdrw0UAya4FEkirnu7es61/hB6t8zckXHzEp//NLbla/5fscP
         2tbnDIT5KRkpHTwfCFKVwKje/nZZOQOtuCjnYUEv/J3FTbh75e1cbINpWSR1VoSnu7bw
         frpcAUC4plF1nEu+hDClPoKCCoYqLQcu5cRgdvshxyFfBkHVt7PbmVhF73gmXT9TGTTF
         SsWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19-20020a05620a0c5300b006fc9552c034si2765200qki.312.2022.12.01.07.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 07:43:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0lhQ-0005H1-GM; Thu, 01 Dec 2022 10:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhN-0005En-9Y; Thu, 01 Dec 2022 10:42:05 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhK-0004vz-HY; Thu, 01 Dec 2022 10:42:05 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 24FEC11F994;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 31 Oct 2022 00:59:29 +0100
Subject: [PATCH qemu.git v3 2/8] hw/timer/imx_epit: cleanup CR defines
Message-ID: <166990932074.29941.8709118178538288040-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166990932074.29941.8709118178538288040-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MZYG4SGRyCqz

From: Axel Heider <axel.heider@hensoldt.net>

remove unused defines, add needed defines

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c         | 4 ++--
 include/hw/timer/imx_epit.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 2841fbaa1c..661e9158e3 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -82,8 +82,8 @@ static void imx_epit_set_freq(IMXEPITState *s)
     uint32_t clksrc;
     uint32_t prescaler;
 
-    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, 2);
-    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, 12);
+    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
+    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
 
     s->freq = imx_ccm_get_clock_frequency(s->ccm,
                                 imx_epit_clocks[clksrc]) / prescaler;
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 2acc41e982..e2cb96229b 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -43,7 +43,7 @@
 #define CR_OCIEN    (1 << 2)
 #define CR_RLD      (1 << 3)
 #define CR_PRESCALE_SHIFT (4)
-#define CR_PRESCALE_MASK  (0xfff)
+#define CR_PRESCALE_BITS  (12)
 #define CR_SWR      (1 << 16)
 #define CR_IOVW     (1 << 17)
 #define CR_DBGEN    (1 << 18)
@@ -51,7 +51,7 @@
 #define CR_DOZEN    (1 << 20)
 #define CR_STOPEN   (1 << 21)
 #define CR_CLKSRC_SHIFT (24)
-#define CR_CLKSRC_MASK  (0x3 << CR_CLKSRC_SHIFT)
+#define CR_CLKSRC_BITS  (2)
 
 #define EPIT_TIMER_MAX  0XFFFFFFFFUL
 
-- 
2.34.5

