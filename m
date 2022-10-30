Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp614288ejc;
        Sun, 30 Oct 2022 19:17:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pimN6eHeg31xZ5yQWnF4Q5JNsVZja7xIjWdsVE7ZHTzM7uvdgJmiv9IQhweO7AckL5p7E
X-Received: by 2002:ac8:5f89:0:b0:39c:e5a2:6db9 with SMTP id j9-20020ac85f89000000b0039ce5a26db9mr8800240qta.138.1667182662328;
        Sun, 30 Oct 2022 19:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182662; cv=none;
        d=google.com; s=arc-20160816;
        b=OeC82CsqBYBbne3G19BA7NDN91b988RqacAoKqP7SITahopt2Rob7XoITsicNSHEoJ
         MkqdNhAe34J5hOQsGog1MlA9a4WBrF8/ka6DMtWiwLVQZNEvJemx+M5UFKRZkcncgKpi
         seDLmJ+dMlKI/6Srqc40hyLHqRfsuDb8pBsg9IDOVedYX/ySYf7GX+Yff/iJvvw1Subv
         oymnJCI7p5bk3IdifofmNDKPUtit755sL5pSx+3iUNtDRc9y1M5JhdQw5fqXuAdlp43M
         SvZc271MX408c608Ci515bzqDr5cYysMfHv2bQijXaxvUhjfdElDeXY+hVlGSN7J1J1C
         irJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=lCIyTB8LnbCMSpIA7qC89JDS8sT3lbQ8DHBbStjplNI=;
        b=YXVY/q8GtbV7eFvWn7dsDrQsI/z15AdNNbMW3HFIrsPxohcQBS6EPsdUPTWhfA6SGg
         /GzCHs/4Bvxq7ByRndiHPRIhzI3BfxZ+QPS875aoAfzTjkJzb2Pxz02g2idHYjIVFczs
         3ci8itnZWnZTCova2LwD+WGNY6RptS0ZWD+ssRoeONbus8Z/3WIaITg1goMHXXUVcbmq
         C2CWWXVY+e8lh2K2/0SDGdy/2J+upNpk04GObNYVf9XnhXX8aYxFYr5MkCRUA0C0zjCe
         xvhZwfr219rRWulOj5KeIsJbZA+W8KSlxuzuWAim7iLBm0dTEAvDkDOql7A+fYuo0sLi
         UFfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020ac8468d000000b0039a71c2f6f1si2962249qto.264.2022.10.30.19.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opKLa-0001GI-Kp; Sun, 30 Oct 2022 22:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKLA-00016g-4W; Sun, 30 Oct 2022 22:15:52 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL8-00036q-Pd; Sun, 30 Oct 2022 22:15:51 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id CD64E11F296;
 Mon, 31 Oct 2022 02:15:46 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 31 Oct 2022 00:59:29 +0100
Subject: [PATCH qemu.git 09/11] hw/timer/imx_epit: cleanup CR defines
Message-ID: <166718254546.5893.5075929684621857903-9@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166718254546.5893.5075929684621857903-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ulFXjK57/ZUk

From: Axel Heider <axel.heider@hensoldt.net>

remove unused defines, add needed defines

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c         | 4 ++--
 include/hw/timer/imx_epit.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 5915d4b3d4..196fc67c30 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -71,8 +71,8 @@ static uint32_t imx_epit_set_freq(IMXEPITState *s)
     uint32_t prescaler;
     uint32_t freq;
 
-    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, 2);
-    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, 12);
+    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
+    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
 
     freq = imx_ccm_get_clock_frequency(s->ccm,
                                 imx_epit_clocks[clksrc]) / prescaler;
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 2219a426ab..f6d41be7e1 100644
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

