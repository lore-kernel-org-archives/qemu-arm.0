Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp846760lfb;
        Thu, 26 Aug 2021 11:07:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoXmMvXLMhLhz2qMIWpK8Wd6zg1nd+4igIUeKxqd4B6yCaHWUsNk7AVflKkTDiwTYKwxFU
X-Received: by 2002:a7b:c933:: with SMTP id h19mr3653064wml.120.1630001251063;
        Thu, 26 Aug 2021 11:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630001251; cv=none;
        d=google.com; s=arc-20160816;
        b=usOwN+lLMFsFyWyt7PQw5eH3Qp9egG0+c+wELaVKAMF6evV+voxc1n4oykuFK6uuGB
         ZcYIcecBsn1skYlBzSkp0H8Bu6B2ttXNIGhs0OPs4Di9lDavYBVdpDmpvg0eV7IMt0n3
         13ZJIZhfXLECxIhmt+c1wFmEMFd6EuwF+wNy4l1oF37+n2UBN9NZiPETAgtsoXk9V1sY
         msZV5ZdQc8w5xNsrU/8+oTwLT0z/64VlLSdaBXn8Wht4tsoHZYOrOUx2ARxZc8Ogg2qY
         yUqG2hNZ2/8x59521Jr1KAkO+Lhpx/9+719dtrJiRCQomc2KXVlB99mBFkqPsTDJZ9Wm
         GjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6hV9/zziKNEk7s6VzPpMvb9Nml78ruzqt2otDpuWxAs=;
        b=tK4MpJYbLBjmIPUY01qJLn+yYHFQ7RvFtloSVNxH+MAGrIJBZdcsQo8wt3BBltebUp
         nG25c2eas9jQHM5RMZ+WtSN7LIJuEczv0ifiSfMMHB43AEyCSZqRlfIqyLn7y0DMSjtq
         dmTCirCxLZ2bK/Nu6oM24/eb06WbxvSHaYSQesOB9UryUFuupqDT1VYIW7KJXi2h/L0/
         h8AL8pcWiDlRdffkMJ4rTJ2tWNiyJ5LFDlaRtfQb/Q5I414n/t139+n2/ZEgg+CcJL7B
         rqFZEFPDe0KHmODzU7fiKQ5r0Cf18niaLhWwdYgRK+3IWkUIqJAybY8G9M5TpRfn8Xy5
         p/3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D0vQdyuS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si3470967wrm.301.2021.08.26.11.07.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 11:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D0vQdyuS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJJmk-0003Iy-2o
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 14:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJmV-0003El-I1
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 14:07:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJmT-0000Oy-T6
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 14:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630001233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hV9/zziKNEk7s6VzPpMvb9Nml78ruzqt2otDpuWxAs=;
 b=D0vQdyuSj0gwyrGHl6xo77BF8X/fSBudiLMYGjVDv3UnMX929hRpIaTfnOYeIywMS+Sb0R
 S4o74wRdpof3JW3QVFzHgOJPUrsjcxZJ0fTGgKg0HFr8P0D5dxcH0d11FwSdBnFwtlKXfz
 8cbxcHRqzdLs4ml7/fCbkawVBsM+lc0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-71n5HhuYNbymnNzm_10RHA-1; Thu, 26 Aug 2021 14:07:11 -0400
X-MC-Unique: 71n5HhuYNbymnNzm_10RHA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so1104917wri.17
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 11:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6hV9/zziKNEk7s6VzPpMvb9Nml78ruzqt2otDpuWxAs=;
 b=jDE3t73Jww6m7nUg3iLKL/qhuOTfaabWDTdunVgDqRm/seDQdDQ0UsDGdz/XXoqW98
 0Wma3EVl18pNb3XcND9zmZsSRdDue+6vz2D2bBJ2EXxrvBzwd1hHbkqMSKUyRMWbE5LK
 E8ZwQv7beAde8y0B9fnaolMo7h14XhHNlGC2uLM2kmjkr3jp8F2NW2N7O/aKzH8aowif
 YkGD9xw9MUbBJi18ttAYDSoLDfkN4HC3wCoLfH3Qjl5ruOWLs9d3ytf32TMxuGyccwWT
 C1gA9dUV9z0yJyf24QSe9Q6xybbBkiOgFIbfLF9bkPsb7JdaNhsgRSAPW3u/z4EgAcYW
 cTlA==
X-Gm-Message-State: AOAM531/d/OYy3Ws4ZLetZRLGTdDwsUEjH7aWL1My5O46TnVhZnfE/OE
 9zisuJajnNVIZ9hR+H2vIbiWpU2QDOLlWpGTMBqZDVFMQZbVMAyL4pGQcJZv2A7gQ+MakKJcecW
 4R6Sgtzg/UVy9
X-Received: by 2002:a05:6000:9:: with SMTP id h9mr5812795wrx.396.1630001230336; 
 Thu, 26 Aug 2021 11:07:10 -0700 (PDT)
X-Received: by 2002:a05:6000:9:: with SMTP id h9mr5812774wrx.396.1630001230156; 
 Thu, 26 Aug 2021 11:07:10 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d4sm3934597wrz.35.2021.08.26.11.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 11:07:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/intc/arm_gicv3_dist: Rename 64-bit accessors with 'q'
 suffix
Date: Thu, 26 Aug 2021 20:07:03 +0200
Message-Id: <20210826180704.2131949-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826180704.2131949-1-philmd@redhat.com>
References: <20210826180704.2131949-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QUcZKNtmDoYO

QEMU load/store API (docs/devel/loads-stores.rst) uses the 'q'
suffix for 64-bit accesses. Rename the current 'll' suffix to
have the GIC dist accessors better match the rest of the codebase.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/arm_gicv3_dist.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f9035..7e9b393d9ab 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -763,8 +763,8 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
     }
 }
 
-static MemTxResult gicd_writell(GICv3State *s, hwaddr offset,
-                                uint64_t value, MemTxAttrs attrs)
+static MemTxResult gicd_writeq(GICv3State *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
 {
     /* Our only 64-bit registers are GICD_IROUTER<n> */
     int irq;
@@ -779,8 +779,8 @@ static MemTxResult gicd_writell(GICv3State *s, hwaddr offset,
     }
 }
 
-static MemTxResult gicd_readll(GICv3State *s, hwaddr offset,
-                               uint64_t *data, MemTxAttrs attrs)
+static MemTxResult gicd_readq(GICv3State *s, hwaddr offset,
+                              uint64_t *data, MemTxAttrs attrs)
 {
     /* Our only 64-bit registers are GICD_IROUTER<n> */
     int irq;
@@ -812,7 +812,7 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
         r = gicd_readl(s, offset, data, attrs);
         break;
     case 8:
-        r = gicd_readll(s, offset, data, attrs);
+        r = gicd_readq(s, offset, data, attrs);
         break;
     default:
         r = MEMTX_ERROR;
@@ -854,7 +854,7 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
         r = gicd_writel(s, offset, data, attrs);
         break;
     case 8:
-        r = gicd_writell(s, offset, data, attrs);
+        r = gicd_writeq(s, offset, data, attrs);
         break;
     default:
         r = MEMTX_ERROR;
-- 
2.31.1

