Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp757409lfb;
        Thu, 19 Nov 2020 14:07:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoW/E+dP+ZKm4YcIg3qAvFu4L+5BytTFIqNRme5epyI3L+C4Caxa+K8/WmyttfC9dQUvqR
X-Received: by 2002:a25:558b:: with SMTP id j133mr18505421ybb.224.1605823665742;
        Thu, 19 Nov 2020 14:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823665; cv=none;
        d=google.com; s=arc-20160816;
        b=oiBvpsTake9GkUJdtpJsjCwKp9oZIVbpiSXoVb2X3Se8QhoUMcAMpaGx4h9pr6eG/b
         pCo6g3OS1VBKnMCCkZvAaGWeWNM0Bc6FCs6zwse9LU95URiLyPwHEJXlgVSI7V4RWLQe
         sXmgvelbb7OdW6grFs4crYVGuVteD19+fM/IN9oVZFtt5WokeSKnkDHuIrP6E4rZbmXy
         P3PrwuOP+ONgQwHoZx1cVv0qOUJcXUGAOrHNSzXz9RH67tz5qbOPFoI89FjDY3n7eptN
         SLKOxqG8yk9IWGHh/11V34Y8iKGS3BFeWNaJZgSR5NutXu8zsG8A217NGuLaC8R/9oco
         PFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CsDF4FovkQi5FbhTGn1IjOoZht88RJrc3jvTDPCJ+f4=;
        b=ZUrJhb/bfWtodFTwqbRs9dCE+aXBiHVlREesmcEvn+rTxdKn08Fuzf4xQl0f/wrrL6
         fGrjFh3z2+mtJCV6N7Ug2ePJiXHIFb7bpM/0QKli9SoCZFoUix77P/M55bKeG4cUB/mQ
         YhVcxcQYY6GDaX7v8xGxM0tboTLL7o4okra2pWXo+eWSeysXOPDn27vjeCPt8OMzqnxZ
         niaqQ9a9QNFGx87drGbbgOsJ6kCm0p0SDYKjLoXlVQLKidTCgLsWjDwlISRRZTCJ09Jc
         8bpaC2R3+3egCgmhjJjC49SJyKhNulndS/VvZvV52Wu2G38ULd/JqOhMpoBVCnDFMgal
         mfMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PuyNaGaF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si778130ybk.55.2020.11.19.14.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:07:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PuyNaGaF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs5g-00061a-T6
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvM-0001Ch-IO
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:57:04 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvB-0004HD-SM
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:57:04 -0500
Received: by mail-wr1-x444.google.com with SMTP id k2so8054919wrx.2
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CsDF4FovkQi5FbhTGn1IjOoZht88RJrc3jvTDPCJ+f4=;
 b=PuyNaGaF/liAFUxlvAqlL68JNMTQgeT9qx3MW8WXIeFb/KHkQaF1HIlaCeFvwnPvAd
 NYknIsTIJqoD99La5wvArLw4NBOYHqTV1+XDMFe7o8F1Gvy1DtjNzOyMClWIZLKWa8d8
 sYnYMuul4BOC8/BwQUeK7c1l7ajthde9UFlPgs+wOTUW5MYJp11QlMCWhNjOuFlbJcMh
 7BoXpe6s4sJ6yfiwPIH+2VeFu4nYP2rMlr+fbuDNaaEZFmTW0ldXOwSKnoNHO36u/qXJ
 XvO0XNqSZluFbhKIHN0ESs/gViP55GsAj58GrP8YpUQY98qdrt3J1kfQ1JjVD0OkXT+w
 BFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CsDF4FovkQi5FbhTGn1IjOoZht88RJrc3jvTDPCJ+f4=;
 b=czyHCgDtY5JFnGNePjiN98BUTS4HW7MXuwolbRo8PUY97fVOSjmblps3gGgtmHBPVl
 LKBfLQMuWIfwwjbeJRITpuwGQmlWEP/Ncc5tkMeH//tUkhXSi1NpCGY0e3Vgw2n/J+/o
 dj8+yCSWGp6lzTcLUgfWq9palF6wno01wXfKVGc2T3if/QoY7ADTJRjSsUG9EgCQ89j2
 JqHmrClHthYiGmge9oB/Sk0MXcUUls110f36us+NF4x8DUbbtft7gMmumDsvQeOYDaFm
 +KyH4TAK+KvjIUhnwWYtdE2d6hOY7EoeI6jAxtxte74Ur6m+jeFn58EiUcxbRg1YN+Kx
 GDSg==
X-Gm-Message-State: AOAM531kGPqm5elv4A8I7mqdk3DRqm6cocBY98ebjSv0/dSgCBbCUwK1
 rETROJ8CsG+fQUoo06aCqUzmf7iXlQbqoQ==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr12479025wrs.100.1605823010527; 
 Thu, 19 Nov 2020 13:56:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 27/28] hw/arm/armv7m: Correct typo in QOM object name
Date: Thu, 19 Nov 2020 21:56:16 +0000
Message-Id: <20201119215617.29887-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SVdIp0vbGF1+

Correct a typo in the name we give the NVIC object.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 944f261dd05..8224d4ade9f 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -136,7 +136,7 @@ static void armv7m_instance_init(Object *obj)
 
     memory_region_init(&s->container, obj, "armv7m-container", UINT64_MAX);
 
-    object_initialize_child(obj, "nvnic", &s->nvic, TYPE_NVIC);
+    object_initialize_child(obj, "nvic", &s->nvic, TYPE_NVIC);
     object_property_add_alias(obj, "num-irq",
                               OBJECT(&s->nvic), "num-irq");
 
-- 
2.20.1

