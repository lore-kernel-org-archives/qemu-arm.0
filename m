Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp368102lfg;
        Thu, 19 Aug 2021 07:15:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq1VkM4QjkmGGI/ZAgeu54Drja4BmFPGzC30txP5e9v57Z2OuSwJoQ5e76HhFCWCKcp1Ms
X-Received: by 2002:a5d:6451:: with SMTP id d17mr4222759wrw.154.1629382547453;
        Thu, 19 Aug 2021 07:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629382547; cv=none;
        d=google.com; s=arc-20160816;
        b=nkJpqLv9TR0EG3+5gxGzalr59bWr61JFz3WsabDH1rB1zXj7q8bTO8vvP5ca+GhsSO
         X9Nct0zKs5+WESMGRMemRT85WEH9822RYPMOtK9u/o+OPNnTnWBoUpXsaF9xYBE8zUE+
         N39yo9lliRCDaWko6vSvXoWFYUECdjdYTUhwuq0UjD/1tM5PipryiFaFEAhLRzf0FMeJ
         kgdaYs5cbPSgDLaJ/eArb8sdJKRry+E1Hc2Zrf4T0S3CkolEbBiS5ssrECCNHWyssvG0
         0U0tcwv44hljURCpYNnUjd7MuUp/7TuUSMKdG6DWijOzJMXEVV1OZ3EIeoibD8Faa7UC
         yOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=urxwvqXr9zIlOigll43mLC+EktS4CGbb0Pw2LonzhBc=;
        b=vUc4LY6uK7IilWsvT7yFfU7AUcon39Bl5A7H1A6pmN4Nsq8uZ+tyaRCJ/JONMqhjmF
         KDAsgjTnUUuC7oOCBKgUuoZXaJ2CZAKE3JghBUuNdrSuIMGHQ7aS5vi6f6kLcn0E6Ru3
         0YSDLh+IHxJzZv042GcAB4XyV+JExTRWYvUgW2AEb4u7e+qSQJKOagKkVjCUOA6xTehX
         mlWl4YWvowDxhiwnmtPdDqSwJVdYKgEF+3AkyJuCK52cI8dT1TRFxbx5rz9jPqZrdIqF
         KQIeA4+/fQVQnWQ2zCSLeYA6UVtmcitcl9grbjLwsbvvtvC19K682OqSfRGqot2lHulb
         T4LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=foQyGI7w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si11678167wmq.15.2021.08.19.07.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=foQyGI7w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGipe-0007I6-J8
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGipW-0007Hl-Fj
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGipT-0001qL-2w
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=urxwvqXr9zIlOigll43mLC+EktS4CGbb0Pw2LonzhBc=;
 b=foQyGI7ww4yv7KkZ6RPvTAraT6eYIW0X5q7XSQsdvr1zMaYh2yfRsVjNOSg20jQH9ZeJ7K
 ii+D7b+HfvjR6UpOqWc+vN5fex8/DtkQzyWIg+L7pbwzEfGZ2wSHQoanwoKnXtZ2S7JbGz
 HuYOMfe/f8ALKOZ91+gxp2tP1XdIDjU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-EvRFQmwoMLmLIiJlUeDzbw-1; Thu, 19 Aug 2021 10:15:30 -0400
X-MC-Unique: EvRFQmwoMLmLIiJlUeDzbw-1
Received: by mail-wm1-f70.google.com with SMTP id
 e12-20020a05600c218cb02902e6bbacdcd1so1591197wme.4
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=urxwvqXr9zIlOigll43mLC+EktS4CGbb0Pw2LonzhBc=;
 b=e5K8BRLnS/Kar37+em26vgpiQS4VhWu+szeAMD+jBvNWaypK3qIs4x4wM6XhJWZt1M
 f5szOuE656ORDubF/K9Osw4yZHnT+XarLbxCCR/HhfgxEMT+TeGsgL3WLMFvwmJLnZLX
 oXRTii9mYtG96udDfNQVB8YvAjlgj/MKHlJMUD08GZf5F9hoKkll+FVDrXGz5GpRBU7W
 G1qkq2iPAWxXDzNaLzFiSWNR0TcjPB4i1gC5vOZNDcrmPO/R91DP8xs8Ha6rTGT8606+
 m9G/kf9OaIDNe/xQ2dPWky6XmOA7TAl4Qh5JVhqV9h0zFv5VxJWZku/fwwbeTv3sk5g3
 jtjw==
X-Gm-Message-State: AOAM531+he79AgG0GizE2DDChTeJCN6IVqyy3XzYStPo7vdoTNYU8GUP
 DI78+pcsEr57oWYE37kNmTXGucL3yI8BaiY1TTv3rgNbQn7nJ+Ex4xMwcoBSOrHKrP3EANjvYGr
 tAqhIkD7AoI7W
X-Received: by 2002:a5d:58cd:: with SMTP id o13mr4178764wrf.421.1629382528872; 
 Thu, 19 Aug 2021 07:15:28 -0700 (PDT)
X-Received: by 2002:a5d:58cd:: with SMTP id o13mr4178734wrf.421.1629382528688; 
 Thu, 19 Aug 2021 07:15:28 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c2sm3048262wrs.60.2021.08.19.07.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:15:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/dma/xlnx_csu_dma: Fix ptimer resource leak
Date: Thu, 19 Aug 2021 16:15:27 +0200
Message-Id: <20210819141527.2821842-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zQRPotLt0nng

Fixes: 35593573b25 ("hw/dma: Implement a Xilinx CSU DMA model")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/xlnx_csu_dma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 797b4fed8f5..0c1c19cab5a 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -660,6 +660,13 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     s->r_size_last_word = 0;
 }
 
+static void xlnx_csu_dma_unrealize(DeviceState *dev)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(dev);
+
+    ptimer_free(s->src_timer);
+}
+
 static const VMStateDescription vmstate_xlnx_csu_dma = {
     .name = TYPE_XLNX_CSU_DMA,
     .version_id = 0,
@@ -700,6 +707,7 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 
     dc->reset = xlnx_csu_dma_reset;
     dc->realize = xlnx_csu_dma_realize;
+    dc->unrealize = xlnx_csu_dma_unrealize;
     dc->vmsd = &vmstate_xlnx_csu_dma;
     device_class_set_props(dc, xlnx_csu_dma_properties);
 
-- 
2.31.1

