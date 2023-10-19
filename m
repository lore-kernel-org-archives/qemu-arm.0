Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp802078ejb;
        Thu, 19 Oct 2023 14:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVxk98W8aH1MceyTZ7iQ8I74M6UlqdPmLnsxprnuBI7moQYECz+HXtxlq/9YVjtAC4Igwx
X-Received: by 2002:a05:620a:199e:b0:775:6f44:5c1c with SMTP id bm30-20020a05620a199e00b007756f445c1cmr3592551qkb.60.1697750624020;
        Thu, 19 Oct 2023 14:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750624; cv=none;
        d=google.com; s=arc-20160816;
        b=ipC/HCSCSqozVeHLRuZWO1iFpl/jXOxY7UnGpRGklAxwaWi7KU4k+zv4j33C7lMfFO
         blWsoBqRC++1cCmmJf8GXyfdDQs4gMindvsU+0DnSCVfpDnOR8sWdIGNJKLgRMIMf0TQ
         9oCXhSDJ3HcsmP07WwPEc2IMxYy0KYUDx6aX7bJe4WhnjtDQrYu3JvRy5VOW1Dft3x2L
         Gue+m46G5cJ/MPYQoZ7r44K3UzpTyHqmU0pt55LYzGkeMkimbZnnlY5sJI5VWkP0iKfI
         RPIWb6RJT4YhGSZtELsB8QuHQpTTifBSwwj6EG6RLEwhFqWa2tAMSIqHGrPsuAvlveL7
         lLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kG3m+UrB+1tXa81IHczK7QBkGPM1a1yV1vD8kixZHhU=;
        fh=AVBhj4Fy+QyIIwcX4VOy9V2m7/XoySUoeqZjVcC7SWY=;
        b=mT5xyckxKCDzSe3zqGDvXJq+oiAdBPH7tQylrxc/vX/vn1+EYutz/MyMe5CUnXjwOE
         /4u8X7mhNce8dXsX4h85qLGCTGWlJMDAryhQPHXErCjiJcrlanu3xGrfRJWoL1hbAKbC
         ADTZu/vpzmUWt6WFcg04a3rB7uCdmcVsFI4YF4ETkb8wnLblpCEvsoP79LeoFFqxjfHj
         5FCTT5+6c1HiMvMSfoWrSRgd5gHVU1RQyGpNkOa5sG9D/LJCSq2z1h/p5/w1fzQ4Yyep
         NkQjgIZZ3Lge5HvWy45f7ZI5O2L3oabwEJiI0t7+PSN6qNglcR04QoHhqWGmjPGfWXT2
         aPrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxWNbtDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de42-20020a05620a372a00b0076f17d9dc1asi271093qkb.493.2023.10.19.14.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxWNbtDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaRq-0000vO-Pl; Thu, 19 Oct 2023 17:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRp-0000uU-FF
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:20:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRn-0005da-06
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:20:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40839652b97so925045e9.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750449; x=1698355249; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kG3m+UrB+1tXa81IHczK7QBkGPM1a1yV1vD8kixZHhU=;
 b=zxWNbtDBgcvI2l+R/7m3HyIXyXO79WWJGiO70Tyg+MJ+nj4ReWReEiuTC1eqjddfMj
 HsUdd//q6a7Wmo5tQ3GALNuYLw6lIJ0nhGcQAuvcsFVFz4oXBmDLkylxG+KrQcXNByI/
 iUPFyXjV3JlcqYqIsHA8/1Up6YX0p4dtQqxgnIQ3/XHlt0/NdoV1Vrdu+oFSPFQrZpXg
 rK7st6hyZZciHqj02XZ10a+1OIuBIXcZNNl1cZTLY27kZJBG/QKiXjsXkCTCG399dUtD
 sO8sgTGnH+N+W5B6brwukB+0RlOk0A3WgYpeYx+vxz2tmc9+3PX+cv6ZUSts9wead9l8
 HE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750449; x=1698355249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kG3m+UrB+1tXa81IHczK7QBkGPM1a1yV1vD8kixZHhU=;
 b=t3f+OiKZfe04Q3bB9wNdVHKBiRfmcpzervLUka4IM615KSKkVYXk7jLFTCFfJqzb4o
 FAeDSkB/vrWvUfonS8dh/oc3MnJsDgfqC9icUEzf9VrAKiIO4p0cbbQ1jAxIy2b6mmxL
 Ri830GfuPrBhYazQvHQsifTAVmSMyPaY5POeIupUAMPihymKdR8pavviA5gFVK3AlFjy
 EHC8qmKBedWum1cBH03znTTBOpafoD3e4PpuRNdvVnQewlk/BGVuxVoZ4WBFF+G9Vjc2
 C4evreyMztcGiaXBDlFWlbkrutk8K29CiavJ5bFn5DkACMnnX5qjWyrMAOtvpwoX3mkq
 TZfA==
X-Gm-Message-State: AOJu0Yx11duiqtDt5nfz0bgydL17o+T2xvdubOaeby1PVMGNel6+uws3
 QidkVhMh6U+eMTM79ixfrAw9HQ==
X-Received: by 2002:a05:600c:1d25:b0:408:3eaa:aea6 with SMTP id
 l37-20020a05600c1d2500b004083eaaaea6mr69227wms.7.1697750449130; 
 Thu, 19 Oct 2023 14:20:49 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b0040535648639sm515316wmo.36.2023.10.19.14.20.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:20:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PULL 23/46] hw/ppc/spapr_vio: Realize SPAPR_VIO_BRIDGE device before
 accessing it
Date: Thu, 19 Oct 2023 23:17:48 +0200
Message-ID: <20231019211814.30576-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AOXxEs6RfltA

qbus_new() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231019131647.19690-2-philmd@linaro.org>
---
 hw/ppc/spapr_vio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index 9d4fec2c04..f8ef2b6fa8 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -574,13 +574,14 @@ SpaprVioBus *spapr_vio_bus_init(void)
 
     /* Create bridge device */
     dev = qdev_new(TYPE_SPAPR_VIO_BRIDGE);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Create bus on bridge device */
     qbus = qbus_new(TYPE_SPAPR_VIO_BUS, dev, "spapr-vio");
     bus = SPAPR_VIO_BUS(qbus);
     bus->next_reg = SPAPR_VIO_REG_BASE;
 
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
     /* hcall-vio */
     spapr_register_hypercall(H_VIO_SIGNAL, h_vio_signal);
 
-- 
2.41.0

