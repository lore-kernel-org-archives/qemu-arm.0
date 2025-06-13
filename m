Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2681363njc;
        Thu, 12 Jun 2025 17:07:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiKBBZQrDOMNkw57qL3D89ki9HDIInlxaT+KoYMGTwGELmH1qSYu2x1MTu4j6O9zQJMtPg1z0uBSq87Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFGn0LsSGwCLTMbYRa2MUshoJYjjmGM2od/PRYHJ5jaJfvpykYrP/+tf3NXzPPHvq3jBD4j
X-Received: by 2002:ad4:5c85:0:b0:6fa:cd35:3db6 with SMTP id 6a1803df08f44-6fb3e638f0fmr14776716d6.18.1749773273407;
        Thu, 12 Jun 2025 17:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749773273; cv=none;
        d=google.com; s=arc-20240605;
        b=WLCZ9CxuTGWgIA7hTBfBIv0ojqBJE5xr926+ifpSvf1N5/h86wZtB/RfTYIhSuPmQ1
         YFInjzONGb7Agl4fkMUm2zSJYFcORh9gIZ6fsUOLhrdyPxMSY1adiicpvqXQpKsVeudK
         BTR8SIQnbsHIOxAhBi/2sfpI6/9mlcH9fLfNWE1Z21d2POcBqT9lEuCQnDgIBAWi/NXv
         RnMFaAXxpfHrTAM8VaKYDsgzcfY4bqAAy+p+IKG/ZH05Oxsajl7Yu0ReNO/M6vk+xLNx
         oZZggL4rf107D0SNmACylaitsuWTfdIdOqjGwP6dYwINVGnIR35MF7x9vbd8jP7KUXyB
         idtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=xIhdIBQOkbJNaFfY3EaNA90ZGsHrJPHBaTmly0mQe8g=;
        fh=jmB336zVDilutUuU09TXLNZ6TFwRas8MQn/v9+Y+T0w=;
        b=QUM8m4fTsz+eRXaoqo1kPv2w/H76m51RcGDD9+TQVKLuu52EnzeytSJ9gdXRHuERgU
         T4/bG0D+8Fb0Od1zbXsF/k1uQUd8FxvqGYF/mYdkWj0sKWZLILzuFTxr3ik00UaLArvL
         SMIdSgXjBH5tujNLIMY9zX8BNJIsbaRZ17wwEqrDDjbm6Bn9JchX0QyGsQFzV5GPTCBZ
         KOdHE0Atap93zHLv1FywZestbZG1UIuNIJMWyDlmHCJ2EpiXutsQleziyNn7cwaaiV2B
         7p/x2BaBKL3Zm9UfBDAQCnWKXYxYq+eOgunlNZfuJ1AaHsQ59iRXgh7i/nphdXs6cQdc
         m3iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=t08rQEbm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b9a5bsi18268041cf.110.2025.06.12.17.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 17:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=t08rQEbm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPrxG-0000uM-Px; Thu, 12 Jun 2025 20:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3F2tLaAcKCmQMQONQFKIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--komlodi.bounces.google.com>)
 id 1uPruk-0005zM-EK
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:05:01 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3F2tLaAcKCmQMQONQFKIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--komlodi.bounces.google.com>)
 id 1uPruc-0000cK-VS
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:53 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-7395d07a3dcso1107232b3a.3
 for <qemu-devel@nongnu.org>; Thu, 12 Jun 2025 17:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749773079; x=1750377879; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xIhdIBQOkbJNaFfY3EaNA90ZGsHrJPHBaTmly0mQe8g=;
 b=t08rQEbmo2wXvXlfPmd1/G7LWpabJ6a3VeaYHHWI5UQFdU27Sht9e1cfrNRgJtETd4
 48nT6y+cfsFgPzOaAAd7HEXLLQw7d1BQj32CyeI3OA6PTKI9K27OyXhrJeDbVTIX6GNY
 OwM9a3mSZ5e6eBBqmt1iGf5wVq405FhYJ3Wd5sa87DZMYUTOLkM+ZM7cvM1cqO6VISBW
 9vu3brmwCgV+WEtrCs8k3Szak+3XzSYAQUqsISb9VL+hXZ84npmpx16H4am6tk+13co/
 VeVGZFmgHdn8KoDn3K4oSLRe6jL9bKdeq0HVl9AMKa1TIfemNHkJhBI8jTTRIMw+VaTu
 j3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749773079; x=1750377879;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xIhdIBQOkbJNaFfY3EaNA90ZGsHrJPHBaTmly0mQe8g=;
 b=hOIHVKlu9lLdl5vgpMNTsgej/CANP1lgQZKKt5Nh+MS62gd4g25O+GFcnR3l07E1g+
 2D4xscHXg6sJTnlOeSSskbK6RZPVW9P6UN7cbRjNDNaP+mJ5jg4jq7crmQ6F+a8l0HC4
 hdINVe7KGWPl0qca6Ojhlp4eiMxIzvO1OGKIEJXBtsFt5vVq0aP6ICyQ9kX+qc7eAk4s
 G8ZQzAiuR6WtqInnFWwwdVykX5DFjHGx0IOVRVwz1mbZlYUisSJY27ucuiTMo+7+wAXY
 WpYFdVtWPXw7NlREEs6RM+mb4KhRr+wILwcBKsvfWd9nlM2nx3LI6SVoeLHtAzKyxzdw
 YvNA==
X-Gm-Message-State: AOJu0Yzj1HcVN8u0ID7maxHuegnJdpo8fnYta3kmFjkOOg62laHjvP4F
 u4JAkf2smUgm/2QTsBO/vF+vsK76VuqD0cft7iDnnCTsqBQdylQaBx0KBCBoBupFBi1uOraCagz
 oUvAxHO2Vgzz72Q8zdDwS5hDQv0/3Qp1CF4xQxtLPOOJ5S+pv46kwkWHDDzrZsVmzHPUnegfVrL
 D+klSOpnpSkzJUNbBbfdYGPrO8DgQgueExPrzhH+jo
X-Received: from pgbdm4.prod.google.com ([2002:a05:6a02:d84:b0:b2f:56fa:ef1d])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4312:b0:1ee:a914:1d67
 with SMTP id adf61e73a8af0-21fac851b5cmr1298718637.2.1749773079320; Thu, 12
 Jun 2025 17:04:39 -0700 (PDT)
Date: Fri, 13 Jun 2025 00:04:11 +0000
In-Reply-To: <20250613000411.1516521-1-komlodi@google.com>
Mime-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613000411.1516521-20-komlodi@google.com>
Subject: [PATCH 19/19] hw/i3c: Add hotplug support
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3F2tLaAcKCmQMQONQFKIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--komlodi.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: +Wm4XGBRg90L

This adds support for hotplugging in I3C.
Conceptually this can be thought of as an I3C target being physically
socketed onto a board.
It is then the target's responsibility to go through the hot-join and
DAA process so it can participate on the bus.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/i3c/core.c b/hw/i3c/core.c
index 117d9da7ac..1b62ee7a43 100644
--- a/hw/i3c/core.c
+++ b/hw/i3c/core.c
@@ -11,6 +11,7 @@
 #include "qapi/error.h"
 #include "trace.h"
 #include "hw/i3c/i3c.h"
+#include "hw/hotplug.h"
 #include "hw/qdev-properties.h"
 
 /*
@@ -26,11 +27,27 @@ static const Property i3c_props[] = {
     DEFINE_PROP_UINT64("pid", struct I3CTarget, pid, 0),
 };
 
+static void i3c_realize(BusState *bus, Error **errp)
+{
+    qbus_set_bus_hotplug_handler(bus);
+}
+
+static void i3c_class_init(ObjectClass *klass, const void *data)
+{
+    BusClass *k = BUS_CLASS(klass);
+    k->realize = i3c_realize;
+}
+
 static const TypeInfo i3c_bus_info = {
     .name = TYPE_I3C_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(I3CBus),
     .class_size = sizeof(I3CBusClass),
+    .class_init = i3c_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
 };
 
 I3CBus *i3c_init_bus(DeviceState *parent, const char *name)
-- 
2.50.0.rc1.591.g9c95f17f64-goog

