Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1087860ejc;
        Fri, 20 Jan 2023 05:43:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXviTO2wcPe8c2iMz2UbQAbDuExNeA8qTnU9tErUyBee6e7eUc0wBep/qkZhP8tlBkNZMI8n
X-Received: by 2002:ac8:6045:0:b0:3b2:8972:d541 with SMTP id k5-20020ac86045000000b003b28972d541mr16806535qtm.22.1674222239412;
        Fri, 20 Jan 2023 05:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674222239; cv=none;
        d=google.com; s=arc-20160816;
        b=oQ8Mz0cttCzzDBaPHRjMFkJg2mWJVVQzQItgNrrh11dH8iGoFW99CHjuT7RzH1Orpd
         ZcMnL2J3VQzsYEei93wzq2YhqkNHok2LYr8JFCj8rhlRqAC2lYleIJu6KhShiaD1Hfb1
         qTdw+VgPV9CSvHPl7ZydqCSvDHHSr5uZPQrwSOYoztXGSyugJo8GxbgBZNKHkd15xh2R
         S29hHvaHMcO2TH/vCvUIIdQWQhWRsreUhhOxtIl9TjMBOfwwVGog17sVBpM/LDpWU4/X
         0h+u53mitRSGqAq8j6hlkWi39U0Ih+wLY+u7CMFqYmosjY/YUDQLgTDN+Ibe1Zor8Ldl
         TxQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=s8GtNAPgyhpBwG+7nq0uxfOe9enuDqptYaOVvOfM+co=;
        b=OOtCn7sZfRBqVDOHAfHPasb9jP7kH2kk724ogW4kslz6Ak8qBtLWpJGWX8lUmA/m8Z
         KHrmfjteM/A5KbfkdqhimqxkodBmqMSrGQBtQyPceWBNKzjToU2/DL44o73gkNIq5G7A
         lQqQq9DLj7l0OQsoYyrZzKUOHViWOpNm9XB2Ya4gixibwKLDGnDAKAh5NCuTL0c9xBWr
         EagJxJXrUXdFLEDnCYPsnA7JCI7FKjkYbYoCO+RP1FESyLRS2mi5KPAk1IHhwBfOq7E6
         psjcIIL5wbbmFcCUxuyf8wkpvA0S2Mmxf+8dOG5DuKtyzFIvbfUqjP+G5Bwxj4RWrdmy
         vnRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lEIwHB3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020ac84a91000000b003b62f71a02esi9539767qtq.332.2023.01.20.05.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 05:43:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lEIwHB3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIrg2-00018V-Ht; Fri, 20 Jan 2023 08:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIrg1-00017z-Ce
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 08:43:29 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIrfz-0007Xg-Hm
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 08:43:29 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso3711660wmq.5
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 05:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8GtNAPgyhpBwG+7nq0uxfOe9enuDqptYaOVvOfM+co=;
 b=lEIwHB3ugGTDTf+OxmLQetvIr4Mxakn7v4LQiSj/5uSRIZwt70Vk15vF7j5NAyfRJv
 M213FplsS8AHESMJhfkbsRAxkEeJhVPrVC9JhmcSx+dpDUnb2CiIj8YitCRIZbZuFM27
 HJqQP3KbkO86q5iT2N6QPRwCM5DQSqCBqoqVfOKhxH+k99IqIii3WfPNFBkegQgR634V
 0iJF1ba16Lkpf7yuxW9WgAT4MZOXgclsTZ44w1jqsGtHebVZ6W7KxBa4cx/VaKw1y5iV
 EN75CKJceupP/YAHE5jzyzBEPS2HVqpZmmFBOBmArJK09/gatJPfPZRPbE3gZK3SDCso
 fKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8GtNAPgyhpBwG+7nq0uxfOe9enuDqptYaOVvOfM+co=;
 b=F3nHec979h7gjrHA2E66UZVfCo3BMDzE8eWvNNtSdFyLXZmxVSMhBAAvGiNWSdg/vQ
 DuVhYmgdeDa80UCjjtfneJBOFycQ1WvQaZxNyXqUtFZdpA+hlhJUX1UonJd04mYU6s/E
 QH5Gfn/sQLOOh/5YtHFCGMX146GRyIhxWksksJw4oYSh1m940OIBTs0lMf91Zm9bfyzC
 H+hptacefGtHq6UtrXDkmGv3MM3GvJs+oV52Gt7cuH5ilQ+uAGTmq7QzOLENo8QGEFtE
 tAGtTRSw3oiBDcq/eZgRYEfEEM9vNpcdpSIpeAq9e/M4utbSEOK+pdciTHyzu8FmZodl
 /R6A==
X-Gm-Message-State: AFqh2kq/D5Ko2+CbVTwN6f6tD8z+HeR8XSRnQUpkXzrqI0mg2XPFyoot
 51r0Ye4wRwGTo4KJIyr2CTIpCQ==
X-Received: by 2002:a05:600c:540d:b0:3d9:fb59:c16b with SMTP id
 he13-20020a05600c540d00b003d9fb59c16bmr10559299wmb.36.1674222206112; 
 Fri, 20 Jan 2023 05:43:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b003d35acb0fd7sm2344031wmb.34.2023.01.20.05.43.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 05:43:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Subject: [PATCH v2 2/2] tests/avocado: Truncate M2S-FG484 SOM SPI flash to
 16MiB
Date: Fri, 20 Jan 2023 14:43:14 +0100
Message-Id: <20230120134314.81956-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120134314.81956-1-philmd@linaro.org>
References: <20230120134314.81956-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: G1HmCTAIhCEo

The M2S-FG484 SOM uses a 16 MiB SPI flash (Spansion
S25FL128SDPBHICO).  Since the test asset is bigger,
truncate it to the correct size to avoid when running
the test_arm_emcraft_sf2 test:

  qemu-system-arm: device requires 16777216 bytes, block backend provides 67108864 bytes

Add comment regarding the M2S-FG484 SOM hardware in
hw/arm/msf2-som.c.

Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/msf2-som.c                   | 5 ++++-
 tests/avocado/boot_linux_console.py | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index a6df473ec9..7b3106c790 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -1,6 +1,9 @@
 /*
  * SmartFusion2 SOM starter kit(from Emcraft) emulation.
  *
+ * M2S-FG484 SOM hardware architecture specification:
+ *   https://www.emcraft.com/jdownloads/som/m2s/m2s-som-ha.pdf
+ *
  * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
@@ -87,7 +90,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
 
     /* Attach SPI flash to SPI0 controller */
     spi_bus = qdev_get_child_bus(dev, "spi0");
-    spi_flash = qdev_new("s25sl12801");
+    spi_flash = qdev_new("s25sl12801"); /* Spansion S25FL128SDPBHICO */
     qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
     if (dinfo) {
         qdev_prop_set_drive_err(spi_flash, "drive",
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 8a598be966..9f5077c791 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -396,6 +396,8 @@ def test_arm_emcraft_sf2(self):
         spi_hash = '65523a1835949b6f4553be96dec1b6a38fb05501'
         spi_path = self.fetch_asset(spi_url, asset_hash=spi_hash)
 
+        file_truncate(spi_path, 16 << 20) # Spansion S25FL128SDPBHICO is 16 MiB
+
         self.vm.set_console()
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE
         self.vm.add_args('-kernel', uboot_path,
-- 
2.38.1

