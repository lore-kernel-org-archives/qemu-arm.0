Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3451987lfb;
        Thu, 24 Mar 2022 11:23:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCd+nELUIhmkGRMuzBQmeb/6uzKz+hidiV+UPLagc7MtSWTZ9IQF7EI4UNM9YHVLVInIqM
X-Received: by 2002:a81:c40d:0:b0:2ca:287c:6c9b with SMTP id j13-20020a81c40d000000b002ca287c6c9bmr6310741ywi.320.1648146233811;
        Thu, 24 Mar 2022 11:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648146233; cv=none;
        d=google.com; s=arc-20160816;
        b=pUM1KghtYVXQQOw6S9hQUL2v+lz6lOzHRvUFsl81RKNi66y0e47AM4RmI0evu6+dod
         dDur2R2xA9yxQrCyISUnymz+OYNLjp3J7TjjeKXvhWOYGJ3prTpmb2S1mbUEwlZAAttB
         uzpNsGawG+wjYGr6zPcQLlVhWnySgaM83rtKekhgyPVe62xwE0fS64xDPHaXqKyXBHPJ
         jzMtUaSuAw8h5fLMmW4SzyXkTMy3Pdc1NFkyrAGehFNfasQDyz2yRJJssKwKTquf878b
         5L63a6Pz8m7iakauyVtI3xu34ciY0QfYv8N0qWQUZStJok/R4bGxxlnVaT2J6DH9ZT9P
         Kibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dh5aVmO3EARkPNjd2r1sV1+I0MHmPFomuINkwCaVeDs=;
        b=R2WI89fncUydpAt2t9Ew9AOW1xNwYoAMK3JfZE0QJgCg2aJfb3wFE4xD4MdiByLnMV
         7rfBmvZmAYRt7o9IHBY2UDNx3oiUpuzxF1B1Oi41RypvJoTJCobMyzfFpDl8rPHjI7r/
         vrBEttWAOUMhkEg1GmW0rMrUOSPS2wDgQ7X2BKEJDyrKAKCvbJRW9GwKbsMeiUccfjeF
         EIj+S6hr0ouopQSs1WMuWQnpbOG2pgjllhyFfmP6bCl24YcLZm1XlSythlomA/U5sXY/
         /fyywilGQmp6TsyrL4xbnLpDInDY8cMzcIN2Z6M0hRLIYChnBEK7DUh4sWNsPNeYyOEx
         5Zuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b="LP9p4lD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186-20020a2500c3000000b00636b9ad4e88si3353742yba.652.2022.03.24.11.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Mar 2022 11:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b="LP9p4lD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXS7k-00037k-JT
	for alex.bennee@linaro.org; Thu, 24 Mar 2022 14:23:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0P-0005rG-Fq
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 14:16:20 -0400
Received: from [2607:f8b0:4864:20::1031] (port=41757
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0O-00034s-3y
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 14:16:17 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so5926222pjm.0
 for <qemu-arm@nongnu.org>; Thu, 24 Mar 2022 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dh5aVmO3EARkPNjd2r1sV1+I0MHmPFomuINkwCaVeDs=;
 b=LP9p4lD/45bdCY0knp7T1DdLwKKTIDOVTGIsjLBybHdN9cAn2V5JzSJlwBoF7AiILc
 yuUpoYDXQ89tmlVjvtSurxqldbMZL3pMvRHf7IkTg8FoyMRJ5U3PpvR1jU5ituJTj4WJ
 bF1+fdlvOvAIzgN+4Fhz5BuhUI46QY0sa1mpiQS9tv4fiRrlZbXYrZ3NgSBeWDCC+p/K
 1wr9ajXpPN45fOwoCBXjoAMHSpQXs18b36mmtXuOY56Eo4V5r6NfY5lOuQUJCdRrkYFI
 x47juzemxNV5c+S2VRVj5LJRllRoFM/Z2XD3wlO8g9PME0rZmn837jHSZwjB6grmx5xM
 kplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dh5aVmO3EARkPNjd2r1sV1+I0MHmPFomuINkwCaVeDs=;
 b=pAJ3q392FaZ+gSmbm/WC/xalx1iec8nnTwgpc2FMpTzossMbph7htcCNMr0jUWMlZF
 Tn8mgRohChP6jnACAtrnptZDsqsO3evc4+Q0spnMkj73MWwsFxT2nVQMrkxu3nSM4Fbe
 ZNOPQzu/P5ewIqNENHXZOyglTiirmnlX/B+epENiHH4OoTqlrV39P+KIlCqjRBxpJG4F
 ncc0UB9JGQI2kBt0T+TQFoi/0mf+0NQk3zZkKAGIMF12p1eIwRPcXatjJbfXMZIoNCUm
 BUF0D9zCVJ0TH1pWwcpr7SXUW4Nh3FkJLYgdIpEXaQbqsFVjUqrowR4b/o6OJPHRFY2O
 7+SA==
X-Gm-Message-State: AOAM531I2JAz+L2stxy5OzWCuGfEKLNxZ89cqaoXBbpnjp/X2P8rxnZ6
 OJIOwFpCbtZExuZkxgxy9xnCXw==
X-Received: by 2002:a17:902:e5cc:b0:154:57cf:e393 with SMTP id
 u12-20020a170902e5cc00b0015457cfe393mr7364086plf.24.1648145774085; 
 Thu, 24 Mar 2022 11:16:14 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.101])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm3577725pjd.15.2022.03.24.11.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 11:16:13 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/4] hw/arm/stellaris: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Fri, 25 Mar 2022 02:15:55 +0800
Message-Id: <20220324181557.203805-3-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220324181557.203805-1-zongyuan.li@smartx.com>
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 29
X-Spam_score: 2.9
X-Spam_bar: ++
X-Spam_report: (2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jYsrf5QCcsfe

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/stellaris.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index b6c8a5d609..12c673c917 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "hw/core/split-irq.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
@@ -1160,6 +1161,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             DeviceState *ssddev;
             DriveInfo *dinfo;
             DeviceState *carddev;
+            DeviceState *gpio_d_splitter;
             BlockBackend *blk;
 
             /*
@@ -1237,9 +1239,18 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                                    &error_fatal);
 
             ssddev = ssi_create_peripheral(bus, "ssd0323");
-            gpio_out[GPIO_D][0] = qemu_irq_split(
-                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
+
+            gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
+            qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
+            qdev_realize_and_unref(gpio_d_splitter, NULL, &error_fatal);
+            qdev_connect_gpio_out(
+                    gpio_d_splitter, 0,
+                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0));
+            qdev_connect_gpio_out(
+                    gpio_d_splitter, 1,
                     qdev_get_gpio_in_named(ssddev, SSI_GPIO_CS, 0));
+            gpio_out[GPIO_D][0] = qdev_get_gpio_in(gpio_d_splitter, 0);
+
             gpio_out[GPIO_C][7] = qdev_get_gpio_in(ssddev, 0);
 
             /* Make sure the select pin is high.  */
-- 
2.34.0

