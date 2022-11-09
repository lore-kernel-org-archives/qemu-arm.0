Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp383227ejx;
        Wed, 9 Nov 2022 08:15:25 -0800 (PST)
X-Google-Smtp-Source: AMsMyM487Y+XzjutbiYWvgIqROzXOZMX88FAGabEGl4dbN83AWNW/DAg4tExS7ueuNNtafNrbQH9
X-Received: by 2002:a05:6214:1d2e:b0:4bc:d83:2371 with SMTP id f14-20020a0562141d2e00b004bc0d832371mr44652877qvd.46.1668010525494;
        Wed, 09 Nov 2022 08:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668010525; cv=none;
        d=google.com; s=arc-20160816;
        b=pEBJzDiEKrm3JbwBRD9bDcBn/ymlTs9euKMH1STJoQ2uk1YN7Us8cosnyhXbpC3i2E
         JPK7ExQW2qIoZV3K288iVa7r2S9lSN2tDutC6ehA1uuRsJERpOL1X/TIQnUZgUWKiWUk
         QrKbmg17znHaG2CnoblmuWBQWmkHqIwQOpTBC1Y140kuleJ7EhEed+BhDcvD5MfqTGsD
         cd/0OnvKfu1GenVttuR3EJZ7sK8GMmV6ADwL93mWW+soAyTr5qTLknHGg57Of08Oa/7S
         WWguaPeKCfiaS/zqBfUUyI9BJwt/4G1mk7ZNYMANHZogXXspDYVDhvwG5qLCdXLudyyS
         Ljew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LQMjmXDjci7tzxnXSukseV+1Ik+M+TaUYDCQHT998tw=;
        b=Cr+es4oKE2yBqWSuf/v3cLDmLXmDQjYbuirp6CHSR9GfSJmBcRtWwon3l0okIpGyOq
         YoRKSecoa3S3Yg8cOApVnO6FjnQOWYmJ7QMaZ0mgxjXKj7J4xi4jMe19dtABJ73l1AVX
         1hc75yk+2kXv5/QH5quua1zOTympgxIp67ah+K9ecdHfN2nSHySeTS00gagSorgwNwuJ
         F5TWkmSzqiYwLD2HD3f0+2g2DH3OuKKm2SZYBNCpwSFADDb0aPp4gBw2YxBaB+EYHDU9
         n3ZyiATE/Yzcw5ShzZIm9/FmZ7QKHoz3NyXiEdbCRtcCBJ/0Cl0/I9cfAXqfz2Jzn/dp
         I98w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkvovwRj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br11-20020a05622a1e0b00b0039ce9587debsi8751388qtb.95.2022.11.09.08.15.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 08:15:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkvovwRj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnj9-00018X-Sh; Wed, 09 Nov 2022 11:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj7-00017A-Q5
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:57 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj2-0007cR-C6
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:57 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bk15so26441116wrb.13
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LQMjmXDjci7tzxnXSukseV+1Ik+M+TaUYDCQHT998tw=;
 b=fkvovwRjmF/k+CvVDD3HUCUo3CWQtjuQw8c+/DEkDQxt/YPbmzi9GvCsSYJxeKQ+BF
 jFZ98YTeZcuQu/seeca+Y26qQJ54bMu1lwrNhPRgYoIW6Sw1TEdcqX7MhK00A8ARqyZk
 Q5ko2qzbB3G3SkgGZXQTEDMTAR3Z+Ca3xQW3KEmLAh1Y6atibd3NwY/fwNu9q8l4PJK1
 vUQGkdrJ1Q4U9XWEz76TGJl5p0XHudhCcu2PQGq4gW0IIvz69l2GUvq6JSl4tNYggv/D
 e6ieW4lIuo8MA68UB4vpBtCyQ+75godiKnASFQw43oTYiWweaBlKU2P7I3wAj5YxHdZs
 5aoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQMjmXDjci7tzxnXSukseV+1Ik+M+TaUYDCQHT998tw=;
 b=JOs8ClfIPmKKj0k/UwAINgoyrF7+dhPBBsbFdEYBwpRcQHfp/c14266GzvgF2Y7Jph
 05NRb6zagKRnCQ+Gp2DZacaQkKfgB4GsZnuF+1OOitvlqUNBWH2/BAcwwbQ4Ho0L1TeV
 vqk0rpM98Py2a9f2HYuepMxASpdr2r7GgNm0QR8UAEcTDDuhP6Qv56+GLt2bRMi8onxA
 M7CZKtqErzAldu52n1A1vbVOQ7P2aP1ePybQy9WsNgo3v0cHDVCbZ9XAtdgGcE5/p8Pf
 +W42/m0RbRCkKGjKOnZ3TAvszYTW0mxB9b1xVN3qqXHkgH/NrSGYt/g29x30/Gfq6poS
 QfIQ==
X-Gm-Message-State: ACrzQf2xIKYEws6bJhm3ygBm9G6pOQ9SxdXe/xsocvO9C6PzXVZgCRzT
 L8HcvQGIS5f1WPKt+R2r4btBXpE+l4ttQg==
X-Received: by 2002:adf:f8c3:0:b0:236:9c97:6f6b with SMTP id
 f3-20020adff8c3000000b002369c976f6bmr37899421wrq.548.1668010491583; 
 Wed, 09 Nov 2022 08:14:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 5/9] hw/intc: Convert TYPE_ARM_GICV3_COMMON to 3-phase
 reset
Date: Wed,  9 Nov 2022 16:14:40 +0000
Message-Id: <20221109161444.3397405-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: anz5GZAGGf4B

Convert the TYPE_ARM_GICV3_COMMON parent class to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 351843db4aa..642a8243ed4 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -450,9 +450,9 @@ static void arm_gicv3_finalize(Object *obj)
     g_free(s->redist_region_count);
 }
 
-static void arm_gicv3_common_reset(DeviceState *dev)
+static void arm_gicv3_common_reset_hold(Object *obj)
 {
-    GICv3State *s = ARM_GICV3_COMMON(dev);
+    GICv3State *s = ARM_GICV3_COMMON(obj);
     int i;
 
     for (i = 0; i < s->num_cpu; i++) {
@@ -578,9 +578,10 @@ static Property arm_gicv3_common_properties[] = {
 static void arm_gicv3_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ARMLinuxBootIfClass *albifc = ARM_LINUX_BOOT_IF_CLASS(klass);
 
-    dc->reset = arm_gicv3_common_reset;
+    rc->phases.hold = arm_gicv3_common_reset_hold;
     dc->realize = arm_gicv3_common_realize;
     device_class_set_props(dc, arm_gicv3_common_properties);
     dc->vmsd = &vmstate_gicv3;
-- 
2.25.1

