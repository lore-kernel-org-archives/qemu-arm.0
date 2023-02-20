Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2198218ejb;
        Mon, 20 Feb 2023 03:52:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+5whQG231+qu2HO0/NuwllB3cB1cu4V2EEhkJdyHGumA1H8ntEzaeWMj6oKkpWhhyJCFf3
X-Received: by 2002:ad4:5deb:0:b0:56e:b16d:ec9b with SMTP id jn11-20020ad45deb000000b0056eb16dec9bmr853461qvb.21.1676893945428;
        Mon, 20 Feb 2023 03:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676893945; cv=none;
        d=google.com; s=arc-20160816;
        b=N8W/DxdnF2LW94wcq7Rg++7g72ie12OQyWtQWOYHpmHAqpbiUdGCiBHBdeYYExMol8
         CmkPysedIJ500EVtT2A0uw8v1IoEOPQesrwf7cuuGmkqUGVe7LYCt4zo4ShKsKZ0OQhd
         QM/JV/qufpM1+ZNLU8AFCmUq23s2KHF+R71JA3dRA0FwdUvjaWhZf9m3+u13sX2a4k9M
         N43l8ExEK9FQUxKgeUit2rsQlFopKLNNYB9bghDrqKGZa6CO3Ns2krOw3FNGBIXVCl7T
         Kyzl1nCn3O86hV5ZNG+7qFQNGNsWzSQ9lpU0zKyomNitvWXNqTOccU7f5Kzs9fKEElnY
         KgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=czXwdqthQ5iacnX5do69zMxtKzZ1dl3WlnS0e9zwEDE=;
        b=N4Phr6d1cPdfqJ9narzgty2/iVCpLuEyQDdKtyoOselI73WjaKlGSndW5aU13xuILG
         h2/gIX85Nyp9nLQtIybldlVzIbEiDKGCEZw7KCpdCiDsJ6kBN9gThkw9jBtVgUQ016by
         3VrLUiiG11upbexsjcWuF6+D2X28ntGN1jF/ZAiXWBUt+dXNzvN4e+JjrSeXOsd8k8be
         NotzHb5zXEMFPX1P9YIjBR0lLhKBTfL0jWrmsdCrSQvecAojoR8QZUTR21Ejl/qPTKrT
         bYNiQTpwe8WO6XjdqOqkuJAjz4qWPlRIuzsBEcHcGhNGvUMO+GwBOaBjfsaAwXj9iv0j
         TtHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b2DjAQfn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17-20020a0ca991000000b0056ea207142asi1174395qvb.439.2023.02.20.03.52.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 03:52:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b2DjAQfn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU4hp-0001kR-7g; Mon, 20 Feb 2023 06:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hn-0001jf-NJ
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 06:51:39 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hm-00056s-5Y
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 06:51:39 -0500
Received: by mail-wr1-x432.google.com with SMTP id r7so693104wrz.6
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czXwdqthQ5iacnX5do69zMxtKzZ1dl3WlnS0e9zwEDE=;
 b=b2DjAQfnxzKe3h+ZHHA22LUFtI9mytzQYQysG0K7h+w9xmboePDKh2M9B1k2BOzEO0
 YkSfC5cqUvU9v7E2F4BgcyG44uXVe+ZXvG4vVkZeB45t6fh19w9UXjevYSD8FIXZpfPY
 78D22PzQQtESoOKHkIGF07q/UGkIzXrm86eB7k60m/4rJ8Td7esoRBHZ3ggtfUD//Tv3
 n4B9evQhpc+NVdS70Wpyj4kcEiz+8nZspxzs3ZlaXbQL4AvkwP0onVIDGjtHJZInsMwO
 N0SOMAauxRXy9WUW5oEb2fxoJDiqjX+fXdpdFUTL92By/3RPk0pN63YJ2SzOPgesXs5T
 /SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czXwdqthQ5iacnX5do69zMxtKzZ1dl3WlnS0e9zwEDE=;
 b=DNU5PSz8gcQTm0QsCLUMmYzKSSgjwGusArd2st0kEXbaPvoj9qUzfhWAIrECxVcJ7y
 dK1lmbW86yKuIC7m/I5195riMTfcYNa3Bn30vLblCWdUbtW5SWUWuvy+VT5UhOqV8us2
 oEEYzMA3etC+cXIkSY5mD88fSwT7TtDuxF31ipI9EPDWiftAclu55occ8khGEXikmP4T
 rxDT2EhYDh13BnXj4Ru9oS/g9+OHa7zYr29mGxOVh49ZSxOLdSr7Ieccukqf+BdUFptb
 lyZiaWp9RWSwFzCrPjqzdMK/nhd+u10QRtPOihKvC0y6XOx3KZLbOIfiDpG4Y2MVXBWa
 iDTw==
X-Gm-Message-State: AO0yUKX49YjrFVHGFmQsx4VjWlSt/RJOcOni4ncAn/9KoQpSRt/g0L+E
 sM4D+InWXcwBB0MWhclickQWrsIsBkksEgFX
X-Received: by 2002:a05:6000:1c5:b0:2c5:941d:26b8 with SMTP id
 t5-20020a05600001c500b002c5941d26b8mr431674wrx.15.1676893896874; 
 Mon, 20 Feb 2023 03:51:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l18-20020adfe9d2000000b002bfe08c566fsm2001141wrn.106.2023.02.20.03.51.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/8] hw/char/xilinx_uartlite: Expose XILINX_UARTLITE QOM type
Date: Mon, 20 Feb 2023 12:51:10 +0100
Message-Id: <20230220115114.25237-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: DOcJSqazfKQu

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/xilinx_uartlite.c         | 4 +---
 include/hw/char/xilinx_uartlite.h | 6 +++++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 99b9a6f851..180bb97202 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "hw/char/xilinx_uartlite.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
@@ -53,9 +54,6 @@
 #define CONTROL_RST_RX    0x02
 #define CONTROL_IE        0x10
 
-#define TYPE_XILINX_UARTLITE "xlnx.xps-uartlite"
-OBJECT_DECLARE_SIMPLE_TYPE(XilinxUARTLite, XILINX_UARTLITE)
-
 struct XilinxUARTLite {
     SysBusDevice parent_obj;
 
diff --git a/include/hw/char/xilinx_uartlite.h b/include/hw/char/xilinx_uartlite.h
index dd09c06801..753d3a453e 100644
--- a/include/hw/char/xilinx_uartlite.h
+++ b/include/hw/char/xilinx_uartlite.h
@@ -18,6 +18,10 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qapi/error.h"
+#include "qom/object.h"
+
+#define TYPE_XILINX_UARTLITE "xlnx.xps-uartlite"
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxUARTLite, XILINX_UARTLITE)
 
 static inline DeviceState *xilinx_uartlite_create(hwaddr addr,
                                         qemu_irq irq,
@@ -26,7 +30,7 @@ static inline DeviceState *xilinx_uartlite_create(hwaddr addr,
     DeviceState *dev;
     SysBusDevice *s;
 
-    dev = qdev_new("xlnx.xps-uartlite");
+    dev = qdev_new(TYPE_XILINX_UARTLITE);
     s = SYS_BUS_DEVICE(dev);
     qdev_prop_set_chr(dev, "chardev", chr);
     sysbus_realize_and_unref(s, &error_fatal);
-- 
2.38.1

