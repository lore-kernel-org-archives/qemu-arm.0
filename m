Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp487248lfy;
        Fri, 21 Aug 2020 10:31:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoeosOdBKd3mMiXM7cNzkBF1TAst8Lcce2IU5iRelEArVve/Kdb1XIDUdiQwkwhdvOIKzP
X-Received: by 2002:a25:5856:: with SMTP id m83mr5124767ybb.325.1598031118548;
        Fri, 21 Aug 2020 10:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598031118; cv=none;
        d=google.com; s=arc-20160816;
        b=aya95Ncju+Oh+niHfVHcoYu+FyC/ejwNkmN0+CrjjTuye2h290T5pgY0PelBuN4r46
         378Q3XpQWHLKVR1l1Ja/RHiV7fI6PC67prYcE66x2KJxJxRxqtcZDP5P34l5W5tCXg3G
         ygr3BH3VN+kbAQtr/SUPYfd1oKKh7OWxfkYZxqlYO1Cj4M7Sm6MwyseCPCHVqxycfgss
         NLPw2tX2g9Hs8IsVzsJvlm1THvl4fMsLvFypPoQgSxtRKYby+Lz3BadUde8m+V+8tEgz
         8j4MtR0jEhT8qqaC3iADtXqdKyeHnAL++fyTXJTtvPZ5X6ublLSUE6QGLVzt7Do5290g
         3wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l6Svpz1zFgu3rW3hNJEs7xxdWfxftjayMdaBJY3QTHs=;
        b=Jbvx/VUoaT7CLzOeHX4ir6doNaA/8sAR1VLAWyjFOGRG1FZ7HFCqgJU+vBGVPWvjHC
         THIXr82D+hbVoa4O+ngcE40a2+jCGEFu51Fq+jorW45u291V7U/eSVRyLiPXIMcim/3x
         v+kOAKxvYs4zVwaJvbcUHTIRaKW0uI3cS0ub4ecDSsaZ6k4pqfHX1nBD557EPsVQxGtt
         5U9mIODlQ9ZWuddZN6mXuPzBbeWYSoL7+Yay4iNvrC/aHIEHISXiNZ27mbkJHYC9aF/E
         4pSvxNH2X03xpHDcWVd191RDRYBaldqofpSHKtGCN8sm7Cf1cfMr4kfkEyBcezsLLPvL
         PQZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="b/bdVI6B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s91si2806009ybi.418.2020.08.21.10.31.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="b/bdVI6B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9AtR-0005Gp-VA
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArX-0001vT-Bx; Fri, 21 Aug 2020 13:29:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArV-0001H4-14; Fri, 21 Aug 2020 13:29:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id k20so2553034wmi.5;
 Fri, 21 Aug 2020 10:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l6Svpz1zFgu3rW3hNJEs7xxdWfxftjayMdaBJY3QTHs=;
 b=b/bdVI6BmoT9zR6l2THzuwd6jo381NwqczDg7GfTuRvYrwWr4j5s6PDlgurFxwAKu1
 h4KX5KuoOe6CCGkTryy4UDrKPAQPvWCtYmHw9IYCFNJRzfornJce1HMfnjus9us2YM+q
 KBAHWqZVwQ98C5bzfLk+sGlTyXg0T0nNB6czmQV2ygH08Y/07D+bp0KezGBpnXNHDIwS
 nFvaCRwKoio/AFFyMbBltmLC4BiKkUQzNMfFY+tS9xlIXP1NfF6oOVb1/VYNaYdV2X1/
 rVyZzxTUobirV1SStB+YoaJg48PfQfYbJSoU7FNW7YdbG4TwLeM5J0Da2WhisOQu0Btr
 Avtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l6Svpz1zFgu3rW3hNJEs7xxdWfxftjayMdaBJY3QTHs=;
 b=SQXxrk6dYAdejlIMRFYrSY+4au400bb9GG7Dh7whOVmE4xaNFoFyjKjtKMPY/x+Zbw
 /TuozJYjc1aFkkULwAktAc6Ir/49Kb6cBdoNJsqKPPBSglIJ+xEYUVx6/oIMijFyzziM
 d1AtTnFqPLvlG4cWtRd078Ty6UWn8FNJt21r/VRef1LpBW1dp24IlQgXT1ukEtYSrzkr
 nvFmDv7BPTXEzFr20/BKn53YDz9ydGd5lGHiEjOaTsaaa3oVL6yuhw/vEmAXMX5ebWxl
 BpYIQu2dcjdtvif2Hf/uGhGQw9eDlEJD+nGmA0+XbCqRCx9vYxOEcJn4NaA7hBvb67LI
 ykxg==
X-Gm-Message-State: AOAM532V0f466mDNUikHfUUxQx3viHn0VsMXVX67q0y9HXDad7grJhrA
 cBXmyCNo963Cw0al+U+EAwAOEvv8DXU=
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr4208451wmi.19.1598030994911; 
 Fri, 21 Aug 2020 10:29:54 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] hw/sd: Correct the maximum size of a Standard Capacity
 SD Memory Card
Date: Fri, 21 Aug 2020 19:29:16 +0200
Message-Id: <20200821172916.1260954-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: grXfjTcHxivZ

From: Bin Meng <bin.meng@windriver.com>

Per the SD spec, Standard Capacity SD Memory Card (SDSC) supports
capacity up to and including 2 GiB.

Fixes: 2d7adea4fe ("hw/sd: Support SDHC size cards")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Message-Id: <1598021136-49525-2-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 805e21fc883..483c4f17204 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -51,6 +51,8 @@
 
 //#define DEBUG_SD 1
 
+#define SDSC_MAX_CAPACITY   (2 * GiB)
+
 typedef enum {
     sd_r0 = 0,    /* no response */
     sd_r1,        /* normal response command */
@@ -314,7 +316,7 @@ static void sd_ocr_powerup(void *opaque)
     /* card power-up OK */
     sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
 
-    if (sd->size > 1 * GiB) {
+    if (sd->size > SDSC_MAX_CAPACITY) {
         sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
     }
 }
@@ -386,7 +388,7 @@ static void sd_set_csd(SDState *sd, uint64_t size)
     uint32_t sectsize = (1 << (SECTOR_SHIFT + 1)) - 1;
     uint32_t wpsize = (1 << (WPGROUP_SHIFT + 1)) - 1;
 
-    if (size <= 1 * GiB) { /* Standard Capacity SD */
+    if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
         sd->csd[0] = 0x00;	/* CSD structure */
         sd->csd[1] = 0x26;	/* Data read access-time-1 */
         sd->csd[2] = 0x00;	/* Data read access-time-2 */
-- 
2.26.2

