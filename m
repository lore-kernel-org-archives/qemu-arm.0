Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4628778ejc;
        Wed, 18 Oct 2023 06:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDmWoDKUsO88bRxs14gCgVSheqgYJFTSMwjGxOCwXI9J4LzpsIlm4VcUJ5sCmSoJZ1noLo
X-Received: by 2002:a9d:62d2:0:b0:6c4:cda6:ff3e with SMTP id z18-20020a9d62d2000000b006c4cda6ff3emr5170549otk.18.1697634902244;
        Wed, 18 Oct 2023 06:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697634902; cv=none;
        d=google.com; s=arc-20160816;
        b=myAJShYQUrRM8qRfzMLifDPB/M0qea6FJ0k8Eirfo0xPuLf64GYp7X7ISePXIa8Ybh
         CezJqo1fVaPNjghq9ZsSWa1OWrEFf2xTd2fr4pNMKo4QCYeq1rtzBwDnmqyGntEd7sHg
         RfUDl4zEt2g7Jhm7TJ8ZFNnHKIc37LjuPfb4Oa9JjxizH2LDn4Qs7irf0tOn8TFyYd3M
         gBIICd9fggcrE3ZZBmbV5QpZLmN/RXUmeM5LJtG92HWB735RLWX8NuyA6r10GBdXtZv9
         vMS/C7tB32kmeWnQvaP1S0VPyNNLQg8jjJnOGjmOMTgHNHcz5ZUBXKT/3l7Wb0c9gT/S
         9mGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LSmy0AQ2ctzt4sBy/4+sAM4ntN11b2Cq/iHR2Msv118=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=r73tSvrIFcBFy/ZuFSo927qVEt1p1CTvrc0vfVgghhRkXN5M3CcC3fleVL1Pg9I3v+
         NLBhj9Iwk0N3BRueQ1bhZ0eVua6iL/UK3YT17pR0+wyE1mmE4jZjlE5/aVYRoHsgJGt2
         xgWulH+kLFdDZ3/L1J7CbajEtj/MW8m5i1EsnxS4Oo7tYqlAkl0F7K53ptP8CWGElpYy
         HltBqav83AMkg3m9OOY9+zS8hGxCTj3oduk9i5JFqwAG2TU6jEffUO8RgYF93rEnXnY6
         ZgCacx6ouv+HBupiccJiYIARJKaovZEe7vFUQaMQx6zHb0vliwhuNFV+sEGSf56ScX6H
         yEvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iDpXstlN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20-20020a05622a025400b004180cd5acadsi2892311qtx.454.2023.10.18.06.15.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:15:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iDpXstlN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt6Mf-00084k-GR; Wed, 18 Oct 2023 09:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6ME-0007US-TD
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:13:08 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6MC-0000nZ-MH
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:13:06 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9be7e3fa1daso717471066b.3
 for <qemu-devel@nongnu.org>; Wed, 18 Oct 2023 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634779; x=1698239579; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LSmy0AQ2ctzt4sBy/4+sAM4ntN11b2Cq/iHR2Msv118=;
 b=iDpXstlN666ZVOTwhvyAupBsi3yQxTf7owBAhUvQTDKr3KsmvN3d+t/QmmHu2a7hRK
 BvL4yfzQmrG+3lVvk0uhUCSn7JXe58L7axP6CWmi/GYkdeSgaZ4UJ7I1a54glYX221Lb
 HajR2VLAhO/EmLoqiBRYxALlHbiekQtl1ZbwFBf7I7TM7tq3hWazlu68XMIxQGy7wri9
 02RseXHLlnpF088A8uQ4CU+rRP9d7eja94aU0U1PuKgyYOaLBFVxJAhRCP54MMErv6cc
 eDH44f4npliktk5mFJcPhMS7IUeYtp05caueLDj4rH/c+DbjfZJEu/ExJNlzOFHfpb6n
 7k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634779; x=1698239579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LSmy0AQ2ctzt4sBy/4+sAM4ntN11b2Cq/iHR2Msv118=;
 b=RcDLKY7ps0nFNxOCNEtCoUNTDsyowfxCeuQ7VigLSCJeVjIXCZc9VJ+ZkZBvYWQgCk
 bfyjzIYW6VqRMWo9HEq3q12DEr4c2ZeNUvOs8fZlfIwZGdXvlSwcaVcwpEdb8rB/En6W
 qRBdoD7no3mvroLBYWMrWcIXFADlssMwoxU7i8HDwGaUoJ6Sk9SxK39edzrZ2xIWdjAZ
 4Lsw5fAPqrsKLp7w7Dspe427uFIjAMZvyeXh1QWyQupq0MX7h36medcRi4BIIv0VPd7g
 SWyx2D6kKN4+rTAUGvd/Fz6nu+jznKDe8ZFALx15NYHLoqwqs8MfmRwuW/CDFuUliUCr
 N9PQ==
X-Gm-Message-State: AOJu0YzirK7g+u6TGqsEht/OK5Bmlt8pCyXQZfuDNbaTNln8WGZlph5p
 LbBEpdBxrokxVyvMq0G4HT8V8vtYpYvy5Q1zftA=
X-Received: by 2002:a17:906:db04:b0:9a1:f21e:cdff with SMTP id
 xj4-20020a170906db0400b009a1f21ecdffmr3882712ejb.23.1697634778895; 
 Wed, 18 Oct 2023 06:12:58 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 k13-20020a170906680d00b009ae69c303aasm1644229ejr.137.2023.10.18.06.12.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 06:12:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/8] hw/intc/pxa2xx: Convert to Resettable interface
Date: Wed, 18 Oct 2023 15:12:18 +0200
Message-ID: <20231018131220.84380-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018131220.84380-1-philmd@linaro.org>
References: <20231018131220.84380-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: joymn/lr6pOa

Factor reset code out of the DeviceRealize() handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/pxa2xx_pic.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 47132ab982..2eb869a605 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -271,12 +271,9 @@ static int pxa2xx_pic_post_load(void *opaque, int version_id)
     return 0;
 }
 
-DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
+static void pxa2xx_pic_reset_hold(Object *obj)
 {
-    DeviceState *dev = qdev_new(TYPE_PXA2XX_PIC);
-    PXA2xxPICState *s = PXA2XX_PIC(dev);
-
-    s->cpu = cpu;
+    PXA2xxPICState *s = PXA2XX_PIC(obj);
 
     s->int_pending[0] = 0;
     s->int_pending[1] = 0;
@@ -284,6 +281,14 @@ DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
     s->int_enabled[1] = 0;
     s->is_fiq[0] = 0;
     s->is_fiq[1] = 0;
+}
+
+DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
+{
+    DeviceState *dev = qdev_new(TYPE_PXA2XX_PIC);
+    PXA2xxPICState *s = PXA2XX_PIC(dev);
+
+    s->cpu = cpu;
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -319,9 +324,11 @@ static const VMStateDescription vmstate_pxa2xx_pic_regs = {
 static void pxa2xx_pic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->desc = "PXA2xx PIC";
     dc->vmsd = &vmstate_pxa2xx_pic_regs;
+    rc->phases.hold = pxa2xx_pic_reset_hold;
 }
 
 static const TypeInfo pxa2xx_pic_info = {
-- 
2.41.0

