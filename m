Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp486553lfg;
        Thu, 19 Aug 2021 09:36:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/xpsSGuy6Q32A2xmIWb85sd3nQarJl0FjOwtlE8eoixMAiD1LHDO8JxDff8nKwxNisczw
X-Received: by 2002:a1f:ad46:: with SMTP id w67mr4397867vke.16.1629390980098;
        Thu, 19 Aug 2021 09:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629390980; cv=none;
        d=google.com; s=arc-20160816;
        b=kTN2F8CRU3/6zUouKJtkz2RBx+Hn2rpPzZoWesrII3ge+pzxSMnsu4LCMQMAdlxqcY
         GagyaSx5GR2KJyPS5Yc/1iQjlL9BPa/CeH9aIyXTzcHRO8FTe7b1UCfYIPnku26igdmT
         PoV2Tduo9szExLUJ0Taws7BmncVMjUAjwiqGn01tT8dfrXW1DlSANFY2Wz7MWp2U4eqU
         aBH7ihcbNIpKx/DIqQXItGrH712td6p/dO36nq/hK2EHzPOBcWYrmbQP9Cz7uxHplQKn
         IA/Zfb01f4u9SALrstDtG54prRk5+svheIXNe0NJ9OI2w5xH1tlv8mYgXPi8CvI+sW0m
         SdrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=b1BcV5WiBp8LKmmxTl7tfHXLESegIF/jg2cb6jvljSI=;
        b=FRUnz5y37Zar3y0FubH4UtbhdP80Zm67ATSESQEJ3CitFthCrKD4jQLvCIxpYW6418
         grHgzIaJE9DOqD50NI62Fj2WbUhMZxrCBAxUJJaPXXou3TJoIy4DWQzlRFeF37MMP5Bi
         MYZqlyy0qO7IZmelY7OM59/PqnOknluykk1BLTSg0tB0yQ+GsRSQovCgXiRyZtUIh2MX
         QbckS5jDNVdIAttEUWJzowmhD499LuwL4ax6sc2+M3f45xV1468DbYUc555LQK4Cwnnm
         AgUL7O1z+0N3jHTEXbnWPa7dCszzc9euLG96Mv4OEVc6uImEo8OpUjTG/caFCMYg4SHR
         wQsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=brtGoje0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si2076241vsj.277.2021.08.19.09.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 09:36:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=brtGoje0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGl1f-00052E-FC
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 12:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGl03-0002X3-Sn
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGl01-0005wT-Ps
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629390877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b1BcV5WiBp8LKmmxTl7tfHXLESegIF/jg2cb6jvljSI=;
 b=brtGoje0FIOwDdcg59umhP+VLXRJilE764ebDoXI26rhTcFVzM+7SWIiPtRImkRjmvq22/
 36xF0iCZ2X8ZwW6FZBFX3BtpLZ2vLDfcFUkd+RfPUO2fq/sxYSmVpfORawHgoakAqcZUki
 gEEph64jbw43VdtY84HlpScSry1bLqs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-jWHX6ANbP4aLCjWCp65ikw-1; Thu, 19 Aug 2021 12:34:35 -0400
X-MC-Unique: jWHX6ANbP4aLCjWCp65ikw-1
Received: by mail-wm1-f70.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so3679154wmd.7
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b1BcV5WiBp8LKmmxTl7tfHXLESegIF/jg2cb6jvljSI=;
 b=sUQpj9P3fGkH52CZPRDcVashncYX6ZmS2tvs8nzG2T/9JkGXNWRVLhYJnU9mwdAQhv
 /R8J/L4eYZc7cGEeTQAvk6oCWb+C97uB1pC2a6OY+XQj4D+WlGa5CrDsQiHCeg38UF3Z
 yPMbqaYUr1tYQkUg9PcJqhHUH5meoeVT2i1dqnfqrcbXT6UY79rHIje9kYty5LfMgbOe
 /I0MA4HCX8oOPhBPWk506zGQovkQQlRILQdjgaOTQOwYojXEw91ojBKwYxpdlIAKcmCr
 gpjlfQUNhQcvdLqOTvaw0DfIE6wQQxCNdP5DZvxWNTw0qWcRAxnNHszrGWCrU9RauN5y
 Ghow==
X-Gm-Message-State: AOAM533Fe7yPfn1nISez9VqvQf0bGMwVRrfNJsni9oEgluuEFY3n9Vga
 U69NUJZq7AszulaWnMGQ43quNN1O00mWQ4o8RvYCDJm5mqnGAqzUX6cijulJ1m3JIf4GajA9qV0
 IP9HZDEEGqXyNE7ZzSlObi4OLpDfmHVSokwjMFpvGf+ChAXJo9nveGgKHUQ+94iET
X-Received: by 2002:adf:a3c6:: with SMTP id m6mr4852204wrb.32.1629390873950;
 Thu, 19 Aug 2021 09:34:33 -0700 (PDT)
X-Received: by 2002:adf:a3c6:: with SMTP id m6mr4852182wrb.32.1629390873808;
 Thu, 19 Aug 2021 09:34:33 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 o10sm3316911wrq.51.2021.08.19.09.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:34:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/dma/xlnx_csu_dma: Run trivial checks early in
 realize()
Date: Thu, 19 Aug 2021 18:34:20 +0200
Message-Id: <20210819163422.2863447-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819163422.2863447-1-philmd@redhat.com>
References: <20210819163422.2863447-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Q3oJS1W5AW7

If some property are not set, we'll return indicating a failure,
so it is pointless to allocate / initialize some fields too early.
Move the trivial checks earlier in realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/xlnx_csu_dma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 797b4fed8f5..2d19f415ef3 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -626,6 +626,11 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     XlnxCSUDMA *s = XLNX_CSU_DMA(dev);
     RegisterInfoArray *reg_array;
 
+    if (!s->is_dst && !s->tx_dev) {
+        error_setg(errp, "zynqmp.csu-dma: Stream not connected");
+        return;
+    }
+
     reg_array =
         register_init_block32(dev, xlnx_csu_dma_regs_info[!!s->is_dst],
                               XLNX_CSU_DMA_R_MAX,
@@ -640,11 +645,6 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-    if (!s->is_dst && !s->tx_dev) {
-        error_setg(errp, "zynqmp.csu-dma: Stream not connected");
-        return;
-    }
-
     s->src_timer = ptimer_init(xlnx_csu_dma_src_timeout_hit,
                                s, PTIMER_POLICY_DEFAULT);
 
-- 
2.31.1

