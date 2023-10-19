Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801951ejb;
        Thu, 19 Oct 2023 14:23:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4j+lxBicqsZm/xrwSUZTscCftmG8NC0Y3n8/pY9LXb2mDm9FthxNRAGwR105RTdzUX7B7
X-Received: by 2002:a05:6902:1243:b0:d9c:aa4e:47e9 with SMTP id t3-20020a056902124300b00d9caa4e47e9mr29896ybu.8.1697750609233;
        Thu, 19 Oct 2023 14:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750609; cv=none;
        d=google.com; s=arc-20160816;
        b=NWvoKlk8mEyEA6Y7Gx8ZjNWcI9Opomc0VdVAyMKkawOL7z9WvZV/WSlGQjsXj6ni25
         BZpq+/fVuHiuk7eWTG+Z49MPbAh7MRY7CV2J2TLSz3Hun1JJkTHT1eyxOAAMwdY8aVAC
         ttvDtfKFGwhj5axdlAtpcKxT3TGnhyoLbNKuKps7Og7Bu6VZU3bZbYDS43iLvqbDItJc
         F7GgTxgjk2GrSENeyvPdJvSJS1BaSDmNt8hZcWgk9fZRV415c6NPquXI/CdM6H6MmAM0
         AQuYZVggcALwavk5JI74TKBXj4O2JSHLG4FHEg/sa9R0cvjWhLE8KtPsL72XFztmGawm
         5log==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v2FEPKvYUQPXlVYljpSlyvIweR9xsIaSQUX0X9ROFrQ=;
        fh=2q5eMg19MBJX4UJEslUyHr343qyfN+8GSNgdOvlNCm8=;
        b=qahhQZ+CyDPtJ0QR9QcvxHNbj04GonSu8zyyx/fJ3EhKCyYhAtMzwGx5td4mxkcHJr
         GorslR8+VdzKokDnIjRvOkX/pVt3/NQqsqnoIccKX7FkNF7yjDS4RaZmACQlRmSdRapv
         HsVnH1a41hF3VdWUodmEZM0lz8+xVTJg74JlOh+LUIPanw/KwTqzqT+aoXv7J4l8NYir
         YPf0zvqsimXUz5otOzPrgAMuAkBOscJ5yay6+hmyOIFwSFvhe6Iu9k1KARCA406AoQBD
         K08/N0Q27ernWuPsFSJmFjhKzAx9KBYhus5VDluZY3HAswzNOynsihq/H0hQVhDVHyHU
         Gpaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Io5dx2HJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oo28-20020a056214451c00b0065653e5170asi374747qvb.451.2023.10.19.14.23.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:23:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Io5dx2HJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaSW-0001Q4-8F; Thu, 19 Oct 2023 17:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSU-0001P2-Oi
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:21:34 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSS-00079G-Sv
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:21:34 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so1129685e9.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750491; x=1698355291; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2FEPKvYUQPXlVYljpSlyvIweR9xsIaSQUX0X9ROFrQ=;
 b=Io5dx2HJ2QF9qta9RzXxG3iuyp9hpO5BOPfXcB1LF53zd1w/nhHjJgkR+A8T8EG6+I
 XKTLdNPfTil217slE+Hv2tpAo4KJSvRgxGXfLLHWiJiPOVzo6rjx9Ej2q3cAf0dtNXJ3
 jxi+hCc8torXPMqCH3GIAqFaVEWzpKLrrtgfxwXW2YpkCg+VWWjxsBGNo7B3tPbOrd1v
 ejgaMICIsxyB3noRUtIEev9HUt4KHyRLOXlVT+HPvwRpGh+xZcH0rnrISRnaYzWtjvpW
 qp9wjq7TCghj0L7gfqeZa0sy9np6FO5EvGdbZ+IEZAlEFlW5htfJBCOGcn53bqCnNy01
 vlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750491; x=1698355291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2FEPKvYUQPXlVYljpSlyvIweR9xsIaSQUX0X9ROFrQ=;
 b=drcqpEVW/CBW/d0Sn01vaDMUpbNSMqT7DkRGgpH8h/5VLxQ+jnMTKWaexOAlINPwxb
 FDTZCfgA6hANNEVw3bDmd4+x7H+hQXwZDkV0y8sX3Hxc5MAhIzBSX4MqTUrQxwk/Dg4t
 pieclaX7DJHYUwlleSKupD9ok6cQzIUNga+hzM1kN58njvcvoMWC3CEbrkbeH53BA3Ns
 AFHS4pNmGUtO4j05GBMgJQs/BoWMoO34ORu3BfLPf0sgvVJZheB2+sbHEhR6J03IXTDh
 YUuBYKiIik9F+ciA8bl0g97DudF//DrccUOe38Gj5WK4WBNOjCzJnyTgFlWdx6hCW5T3
 P4Tw==
X-Gm-Message-State: AOJu0YzAZIcF3U53UaF4pEhAxAPcpolS0C3wiK5pYfjBA4XSRloFnkk8
 5obMuenMQaoXRmhBeBzgmDllsQ==
X-Received: by 2002:a05:600c:1c8d:b0:402:ea83:45cf with SMTP id
 k13-20020a05600c1c8d00b00402ea8345cfmr38255wms.2.1697750491527; 
 Thu, 19 Oct 2023 14:21:31 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c220600b0040684abb623sm5244918wml.24.2023.10.19.14.21.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:21:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>
Subject: [PULL 29/46] hw/intc/spapr_xive: Do not use SysBus API to map local
 MMIO region
Date: Thu, 19 Oct 2023 23:17:54 +0200
Message-ID: <20231019211814.30576-30-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uHdeUyWAxs6N

There is no point in exposing an internal MMIO region via
SysBus and directly mapping it in the very same device.

Just map it without using the SysBus API.

Transformation done using the following coccinelle script:

  @@
  expression sbdev;
  expression index;
  expression addr;
  expression subregion;
  @@
  -    sysbus_init_mmio(sbdev, subregion);
       ... when != sbdev
  -    sysbus_mmio_map(sbdev, index, addr);
  +    memory_region_add_subregion(get_system_memory(), addr, subregion);

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231019131647.19690-8-philmd@linaro.org>
---
 hw/intc/spapr_xive.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 12057ffe5b..199c261b07 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -350,12 +350,12 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
      * Map all regions. These will be enabled or disabled at reset and
      * can also be overridden by KVM memory regions if active
      */
-    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xsrc->esb_mmio);
-    sysbus_mmio_map(SYS_BUS_DEVICE(xive), 0, xive->vc_base);
-    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &end_xsrc->esb_mmio);
-    sysbus_mmio_map(SYS_BUS_DEVICE(xive), 1, xive->end_base);
-    sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xive->tm_mmio);
-    sysbus_mmio_map(SYS_BUS_DEVICE(xive), 2, xive->tm_base);
+    memory_region_add_subregion(get_system_memory(), xive->vc_base,
+                                &xsrc->esb_mmio);
+    memory_region_add_subregion(get_system_memory(), xive->end_base,
+                                &end_xsrc->esb_mmio);
+    memory_region_add_subregion(get_system_memory(), xive->tm_base,
+                                &xive->tm_mmio);
 }
 
 static int spapr_xive_get_eas(XiveRouter *xrtr, uint8_t eas_blk,
-- 
2.41.0

