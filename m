Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1463222ejb;
        Fri, 3 Feb 2023 06:57:40 -0800 (PST)
X-Google-Smtp-Source: AK7set8xWNnx/YNNaXJGudOa2LjeTOuNePu7uTDAu0DxdxA2RuMBNAv33GLFxGtgoNWB3UO1GhgR
X-Received: by 2002:a0c:ec4b:0:b0:532:1fc2:9ad5 with SMTP id n11-20020a0cec4b000000b005321fc29ad5mr7263955qvq.0.1675436260521;
        Fri, 03 Feb 2023 06:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675436260; cv=none;
        d=google.com; s=arc-20160816;
        b=xS3+teVMH7MtuSP4bgOwm3uF7BccsEPhu1wBt4YwmTXKqfa3ltAKD/vXQYfk2GDo1o
         rrKI5nqiMblo/JLaeeOYv0n4j0swsjnZEmdEGltchJNa91YrcgU89eE6C9SRIvk81qqq
         zzSchsj5fICEvC2Sh5/MnNMhz4UAf7zWgvWC9PHwUbftUcWkoDIX0Q/oGgub2TfQq/vp
         GQcMPuG06fi5poUDDcJYWQrvhFBnE1kqOdWAPW/cOGDFvh+4vY6ZDXFT3sIjZccvzrkG
         a9WeW6eLs/nUiutkcypDQZsoO9QyjnPoSLtAKc/+UlbpPjVxI04ksbIgx+iAAPmwY9Y2
         6HXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Tt1uD8O6Jt66Hf82NoAJiGFntdTbEbmQb2viJlepOPw=;
        b=YjrDYkMx/iJcPt6hVET6+PQMQ8sbHNHbC3Vpc4LormNz87qcadZD1J5s7WBSmFwj6E
         C0bZYddZ3GkGKPS5gHI+xU2x2mVsfUUjwhykLFKpEavjgYJc3jVxHMCt0lDIcx3PP7Bq
         xMtACyOeFBQesyP9+RIzpthRqH/+UCCf85Wm43viGzT5Lh1dPKgKnbmCeEOci1YcYb3H
         am67nvy+Lh3wSYwSi9IqU/Cy0hazmQmnZ9ia7iWJbNtF6O14YvmQqX+ltfRUPEtZplHX
         uD1ArgA9irH/wcJPFPeToLJffEbLSjtjn9+8kETuIm8FRNGbNulNd6XXdQ5mYZGG25p/
         ISvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kgPcfaIR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020a05622a190e00b003b86abe419bsi2053521qtc.307.2023.02.03.06.57.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 06:57:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kgPcfaIR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNxUK-0002z7-7x; Fri, 03 Feb 2023 09:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUI-0002sz-Tq
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:26 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUG-0005ux-Ul
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:26 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso4047654wms.4
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 06:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tt1uD8O6Jt66Hf82NoAJiGFntdTbEbmQb2viJlepOPw=;
 b=kgPcfaIRM1Z0jwoP9KgR3Gps5Yb0WSkoc3jGN/Wq7MS0k2g3zoGLbP2bbL6kxEseNI
 eKYee2vG7kVadu96kswhvzz3FoY0JTDxHVjPNxSC2KFmc4jyAK8EtujmILOqnUFkyBbg
 yWBQOFkudUIr2lxT24987h34X4X7YzfO/Js1ujK1WqKePq0kbJFHlZYe3mZHrzRkxtxz
 Q4paVYSefBUQjYKfYe/5c0QIcx0BAM/WJHWX4LUZY9g5AeFG2g2iXBgrBvE3RMrkepyM
 njpgmTmgeX7rPXRI8F7Xbuh2c5/mdbCZ2sSKxjlFTvVtJucvIWUbCRbuWnd2F261lBXi
 IEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tt1uD8O6Jt66Hf82NoAJiGFntdTbEbmQb2viJlepOPw=;
 b=n3pl8/LHg6c/lmDdFWlvSk7/lYGdX6Tw9hhjXFuv2SpboZi/8/y5jynEDxQpFrkROv
 aAJdw8D+oeDxY0kJ0ipmcqPoFX3mOa6KHG2msgU4L3pKtx/XCOaVPzgP5OP2vm44pNJ2
 oNQA4iJQ2FbMxmc2cT3GJmLXv020Wj0Pzyi8d71zRTLQnWL1fJlXhoqP++3LHIs6dRs4
 budsjLc6Zs5snAHBoZ+6ZB6NGjLe4OmbefURataj3Pd5xHvU3/UbX3Qoc3AltY3P0sT2
 gQGyrKxHPmXbUSq93fYXjCFvIaDzx1z+3DXiPPXJPKsJdJqp0IiW8xXgPeuRJcwZwddB
 D1MQ==
X-Gm-Message-State: AO0yUKXlmI+N7d1dt47NUDVp0RKo5XuWUgAALj8IVfFmYNmc7htOrfV3
 C83LiQ5t2MmHnmtJIJw1+9xDyAoNCnNZhcF2
X-Received: by 2002:a05:600c:16c4:b0:3dc:16d2:ae5e with SMTP id
 l4-20020a05600c16c400b003dc16d2ae5emr9981488wmn.32.1675436184316; 
 Fri, 03 Feb 2023 06:56:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b003dfe8c4c497sm1995876wms.39.2023.02.03.06.56.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 09/15] hw/usb/hcd-ohci: Include missing 'sysbus.h' header
Date: Fri,  3 Feb 2023 15:55:30 +0100
Message-Id: <20230203145536.17585-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: g+rfiMnjsoQ5

Avoid when including "hw/usb/hcd-ohci.h":

  hw/usb/hcd-ohci.h:100:5: error: unknown type name 'SysBusDevice'
      SysBusDevice parent_obj;
      ^

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 11ac57058d..e5e6b434fd 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -21,6 +21,7 @@
 #ifndef HCD_OHCI_H
 #define HCD_OHCI_H
 
+#include "hw/sysbus.h"
 #include "sysemu/dma.h"
 #include "hw/usb.h"
 #include "qom/object.h"
-- 
2.38.1

