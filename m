Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3157225ejx;
        Mon, 7 Nov 2022 08:42:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6P2YCCqhUOXuWZaqO7e802XjCTXvPg2jY8ETLIZ0BgbCIufD21/xUCXDj4OKBZelsVXiMa
X-Received: by 2002:ac8:5a43:0:b0:3a5:976e:c437 with SMTP id o3-20020ac85a43000000b003a5976ec437mr1764825qta.134.1667839354764;
        Mon, 07 Nov 2022 08:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667839354; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgedrnKu8uAAouY/1ZryUeT5AZ3Vs/Jx2sP83ZlXoLEqx2cCTqU+HWh1c33N7KmR0I
         dHCtN4/Srjb1LFLZLcfaG1fR53ck6enOkyaNwrZ5hesIH5IPdRMMTKKNxjV6bULoDhVh
         fs0+egKZ4kjUONzkrQF2f7JHeIw/ga8Na0tmKlR75h4J6/G0iR8ZvDbQER/BFuhpGgHT
         A3n8uRTXWmtxSZC9TaOZBrIGASubcOsOG8VU4Phx4i1vlxj6dkeWYo3ko6+r2xDik7Qg
         suZHgW8hMzseV5zgERfrUpz1ceEEpcr0OU8/BzNeG/R+BGFp19p9j5Efg87+A059mAEO
         hyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=zVvA9Ylq0+g/JW8FLCpakK2bJbJauWJIiUY4QS++sHo=;
        b=u7M6kCN0o0fb8IqmvwgavYsG5mrUzkQUqbY7bqwk/aB8Tbg14ouDzeLKifzLqk61mr
         5NLDCGbjoFJX6r2n/M68ujbKzZXCjS61+V6w/mkwe+ufiMdzJiLYDRho+YtlB0UXhk/T
         Xg/zgx+mIsVS3vm3S5JMCYnLGDgk1UqCd7lHFXJEZEGmNYpxDpd9uArGqmTRv86XYARe
         FqJkaLTHfV/7erPYBY+VTheS+LXv6cmsWoKRjB3hCZ+Kt4nz/iyVgisYtunQfv7o6CGy
         OENeqiOyoKcrrrR9JIf7nh8FT4sAfCD1erpOdjWPvfxLELTzCm+rkXaM9ZlOGFukJxCE
         XMUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke20-20020a056214301400b004b1d9e1230asi4672174qvb.290.2022.11.07.08.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 08:42:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1os5Cj-0002DP-1G; Mon, 07 Nov 2022 11:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CO-00025F-8y; Mon, 07 Nov 2022 11:42:12 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CI-0004oZ-Kt; Mon, 07 Nov 2022 11:42:10 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 80A3E11F30B;
 Mon,  7 Nov 2022 16:42:04 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 31 Oct 2022 00:59:29 +0100
Subject: [PATCH qemu.git v2 2/9] hw/timer/imx_epit: cleanup CR defines
Message-ID: <166783932395.3279.1096141058484230644-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166783932395.3279.1096141058484230644-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
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
X-TUID: nulx9BAm96AI

From: Axel Heider <axel.heider@hensoldt.net>

remove unused defines, add needed defines

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c         | 4 ++--
 include/hw/timer/imx_epit.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 4af730593f..8ec770f674 100644
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

