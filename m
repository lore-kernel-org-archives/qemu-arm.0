Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp498968lfr;
        Thu, 8 Apr 2021 07:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxISd5qDVzLwxqwuEX2grJBOcnorkefCp2nFY8YcQkVv2TmY9yCnzEiS+1f7VAMZV3BG0bR
X-Received: by 2002:a02:94a9:: with SMTP id x38mr9085769jah.50.1617890885691;
        Thu, 08 Apr 2021 07:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617890885; cv=none;
        d=google.com; s=arc-20160816;
        b=VrcakVl2I9joaKgIKxkxklnvZr501ftnblhWoQZRx/PxwA5Kt3x2u3+ytdZdI7lXhU
         GQ/byo9JKTm3Y/BHgtTtdBqTSOUxn542av50eeCXmsOtKseovXIoGLLUtlqibh55rtXg
         nnLH2sMUIlv1W1ikOe2uA9TiBqbYA3SKkdSLIyhkHz2oELfsX01eUJeOjKc9oDnOI3da
         suCxhodo2uf9H6vjK7RkGLNlSiO4k80ruRADMfxG2gPo64/5koSLmeqCBFVdFLvvAHoZ
         Eg9xBi9Yyr6vvD+S1vSUNgO/mWZkFadnhW59/lCjw4XX4TYtXxuB/86x3vdstRVOrh5J
         22XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=zMW8j3HqEoFQk9Sn5hRF9LrKTzGeQ1JHu4WXB4rGWa8=;
        b=WOkU87tYB48dVX+ASum9vkYUlpwTFqswmLRbjXV1+GyowL6xSGNj6ZdUi38baDpEag
         mUQ4X4R7N5Jg/XERKhu/sAjT5XTxdyt0+Mk/HUckTGpbPGldCRV7TBGAUQy6Runo6g0V
         OVHfeNnDhugq0+ZgA/IpHREkcBm+5x56dDHudxwT1vfG0sGTLqH3Xlfxpd8oDKjTg6FD
         x6DJXXScVVcu2XyBPieXVliNfbr0PNTT5j/CoZbiuBJ454VUOQ7URo0hEbcOEzTS8UFC
         IWV8CevA/bqyhRNGdooGkImYwEIpxJwAurJQIrq5s1iLXba5v39i3jepiY+DijPraRmE
         M5OA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si6089995ilt.74.2021.04.08.07.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 07:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUVKG-0003fn-Tg
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 10:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lUVJk-0003c7-0U; Thu, 08 Apr 2021 10:07:32 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lUVJg-0001FD-UN; Thu, 08 Apr 2021 10:07:31 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGNLp00BNzyNj8;
 Thu,  8 Apr 2021 22:05:05 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.184.42) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 22:07:07 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH] vmstate: Constify some VMStateDescriptions
Date: Thu, 8 Apr 2021 22:07:06 +0800
Message-ID: <20210408140706.23412-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 wanghaibin.wang@huawei.com, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DkM8hkxZ6p0L

Constify vmstate_ecc_state and vmstate_x86_cpu.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 hw/block/ecc.c           | 2 +-
 include/hw/block/flash.h | 2 +-
 target/i386/cpu.h        | 2 +-
 target/i386/machine.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/ecc.c b/hw/block/ecc.c
index 1a182367ee..6e0d63842c 100644
--- a/hw/block/ecc.c
+++ b/hw/block/ecc.c
@@ -78,7 +78,7 @@ void ecc_reset(ECCState *s)
 }
 
 /* Save/restore */
-VMStateDescription vmstate_ecc_state = {
+const VMStateDescription vmstate_ecc_state = {
     .name = "ecc-state",
     .version_id = 0,
     .minimum_version_id = 0,
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 7dde0adcee..86d8363bb0 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -74,6 +74,6 @@ typedef struct {
 
 uint8_t ecc_digest(ECCState *s, uint8_t sample);
 void ecc_reset(ECCState *s);
-extern VMStateDescription vmstate_ecc_state;
+extern const VMStateDescription vmstate_ecc_state;
 
 #endif
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878..1bc300ce85 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1786,7 +1786,7 @@ struct X86CPU {
 
 
 #ifndef CONFIG_USER_ONLY
-extern VMStateDescription vmstate_x86_cpu;
+extern const VMStateDescription vmstate_x86_cpu;
 #endif
 
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 137604ddb8..f6f094f1c9 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1396,7 +1396,7 @@ static const VMStateDescription vmstate_msr_tsx_ctrl = {
     }
 };
 
-VMStateDescription vmstate_x86_cpu = {
+const VMStateDescription vmstate_x86_cpu = {
     .name = "cpu",
     .version_id = 12,
     .minimum_version_id = 11,
-- 
2.19.1

