Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5038939lfm;
        Tue, 21 Apr 2020 05:31:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypKpf8CfWh+iFiLEbJf+dtDTmGlGmpVmShP56mRCN6V4YmHa3QW6zpQsScHVfa+9bJY7lMwQ
X-Received: by 2002:a05:620a:1009:: with SMTP id z9mr20520193qkj.270.1587472318559;
        Tue, 21 Apr 2020 05:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587472318; cv=none;
        d=google.com; s=arc-20160816;
        b=nGeve7pRtIpBmec1q/DUE/LX3eYZ2FZ4pWhjeKSKrmEG0YHmQ8fdwFNKrmNtGQ5WEa
         CBDpKddHydWYdDIeD4gEv+M66GXE4abBM+ieihYQiAFp3fsHpBrSv5POuCFN2Pix2O5T
         E5Z4uXyM/HjUx5T734EwHKBluITEhrA+RsS/tp+eGrqirW7DramrO85ggnJPsymY1K0o
         TqF57YXrLJDe77GXuIps2gDVl4cWxNfKKGA3ETyQKZ6+F68XVQiLgxXiCvJpG40qP8MN
         gxZoGoOi/lYlc+n4hfTAplRKTl1v3R+KAoxro9P97YhMSrh6sUiS0aRv1UvP6Tv1dNBF
         aE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v/VKNfTk/p6cUWVFeTBWVu5kpM3OkAcXwfifz7UuQ5M=;
        b=YpVXVbCAaUxZ65jxIw8uhJ/FTw9hWCgy29iPbqU4HnJJIGPnSfAah/oXKmILe51NtF
         sprezfCYlEzLaWmPtCzW6I8li1TM/iGR/tb9KY4ylEif+NlGX7kcsDx+pC+by6VXvTVL
         Ut6TvsWqmwwJUl+j9qhp9XU0hA5TkSuVVuS8MsHTOuJFw11w2q/N1WoMzZOgwCX06jtK
         kGPqhEAnPowt/Hcl26wD/dVXhtspM0bUSIeCk6ujgNKeO1+M64CZpK1gd7Htoz98BHVk
         Wiudg8C5lzEMEkcTukggCrTOpb+J8sHFOxW4WXy/EKKvczjcdzdKuAnDuBQaaUW4huzh
         Pxcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YouLP0jX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si1465857qka.67.2020.04.21.05.31.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 05:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YouLP0jX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQs4D-0004Go-WA
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 08:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpz-00066W-Fp
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 08:17:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpz-0007DN-2t
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 08:17:15 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpn-0006tX-1C; Tue, 21 Apr 2020 08:17:03 -0400
Received: by mail-wm1-x343.google.com with SMTP id e26so3291642wmk.5;
 Tue, 21 Apr 2020 05:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/VKNfTk/p6cUWVFeTBWVu5kpM3OkAcXwfifz7UuQ5M=;
 b=YouLP0jXEAwMPe2IYglMiWmL9ZNdMl1jFFNZvPxXV7HCv4BEqup6xWUhJoKEYVUydY
 5WYdzdNS/qEFld2XJsV4xkR02HPF9WCTRUAljClMYnGrfnJQEHzt8OFkeQLqWAe0bGf8
 IX2/pab2ZiLgwWCMLXP0pkyWKqciysHH0BCeraxfvqZ4aycioXFhQjlxtZ1z4Y+XGT/+
 cMHbZGH2ichhFCbf7qNQxIzqI2LtocnYz7nHRBcEtBbg95d91u4Qr4pPB8dJsfzZ6rfM
 l0SE27oWnH3BUrymC7oX+5lGbcH/APYcNt75c82TwkmgiSjuw6bKBdHO566J8woXg5It
 8+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v/VKNfTk/p6cUWVFeTBWVu5kpM3OkAcXwfifz7UuQ5M=;
 b=rVEEEznTW0gPOFE/upSYQz6BvkbwjQYO1Bli1efFQrFHS5rG+Hg/mGJ5Mk/NeKveM4
 FXn2Q7epHWFHfWZPB2G/U9Ns1lh4LKB10Ju6I+Jnzpxu1F8lbUit7ZtmOK6U0T6CNrbT
 opdm34NqawjYR+CXLUYGRrS8s0rHaLmJrFgEGCbEbMYb8SQYY7m0+3UZX+3lz75LSxjF
 v3FbOW/tjX/poI+X8LPPTe/VmtR18ZJ9d6qzfUUJDC3OaYkJ+Pn0dWQJedbB7ILW18dR
 Tz3utcaqPAzS0AbKiO031yhwvDoCuB0L6hNlcEqHVXtbRxof95MbAVnGia/82kuWCSv1
 4DAA==
X-Gm-Message-State: AGi0PuYLDknkLcA/eMs5bFmTGbqSbGRaPZMdbRPF/nWmNHpZ2A/xbi49
 m/hG1EUnL0xV6SVbo7WnPoykZVeZRZw=
X-Received: by 2002:a1c:f416:: with SMTP id z22mr4666667wma.32.1587471419716; 
 Tue, 21 Apr 2020 05:16:59 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id z76sm3761140wmc.9.2020.04.21.05.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:16:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 16/17] hw/misc/imx6ul_ccm: Implement the
 'temperature-sensor' qdev interface
Date: Tue, 21 Apr 2020 14:16:25 +0200
Message-Id: <20200421121626.23791-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421121626.23791-1-f4bug@amsat.org>
References: <20200421121626.23791-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hCejU4QWpcyI

The IMX6UL Clock Control Module can report few temperatures.
While the model doesn't implement it, we can still let it
implement the 'temperature-sensor' interface.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/imx6ul_ccm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
index a2fc1d0364..2711cdaf09 100644
--- a/hw/misc/imx6ul_ccm.c
+++ b/hw/misc/imx6ul_ccm.c
@@ -16,6 +16,7 @@
 #include "hw/misc/imx6ul_ccm.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "hw/misc/temp-sensor.h"
 
 #include "trace.h"
 
@@ -864,12 +865,14 @@ static void imx6ul_ccm_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     IMXCCMClass *ccm = IMX_CCM_CLASS(klass);
+    TempSensorClass *tc = TEMPSENSOR_INTERFACE_CLASS(klass);
 
     dc->reset = imx6ul_ccm_reset;
     dc->vmsd = &vmstate_imx6ul_ccm;
     dc->desc = "i.MX6UL Clock Control Module";
 
     ccm->get_clock_frequency = imx6ul_ccm_get_clock_frequency;
+    tc->sensor_count = 3;
 }
 
 static const TypeInfo imx6ul_ccm_info = {
@@ -878,6 +881,10 @@ static const TypeInfo imx6ul_ccm_info = {
     .instance_size = sizeof(IMX6ULCCMState),
     .instance_init = imx6ul_ccm_init,
     .class_init    = imx6ul_ccm_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_TEMPSENSOR_INTERFACE },
+        { }
+    },
 };
 
 static void imx6ul_ccm_register_types(void)
-- 
2.21.1

