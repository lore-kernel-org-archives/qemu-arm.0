Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp521063ejh;
        Thu, 8 Sep 2022 12:41:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4uMr2KMRP776HwbcExy7z/nxcZ/tbraplP2WwsttOpoia9RDDGQ1u6MRRF2c3wTZT6iaBM
X-Received: by 2002:a05:622a:1aaa:b0:343:6d4e:25d1 with SMTP id s42-20020a05622a1aaa00b003436d4e25d1mr9659564qtc.385.1662666084414;
        Thu, 08 Sep 2022 12:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662666084; cv=none;
        d=google.com; s=arc-20160816;
        b=QFj9JnMCdjOY9kG2IQjjUQmx3/5uXF5sB3uWEAtcWZ/2vsiZPZuISJaGfTa4zw9M1A
         9Fk16AFd/NSuVN4OFVqnRivFT8VLhoUDmsGkJZVNUIuEQfbAnYwkbROyTIi/YfOw7JLl
         RpAncQZ5cI1fuazyAfRpy25PG+3OtBe4xPrwgZsTdcNs6Wcw5dnf9u9IcRUkAdSO8WV3
         Qhum/A9hNzyaVm7RXFU5d11A/gEcWuIoZB+rlol/I3fHUowiQUlDXjXGVZwz9qp/q3b2
         PTY3Msxry8q8BVDjwj8xoh3df25N6g4AFjundezXQpS0LRvv3bPrwxl6fpisH+DdAua3
         BeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HovcpPksbyRH4MetLfjOHLX26QOG2cA8NngwzZBGLTg=;
        b=mW1tE6Eq7W21G3xKl8sJYyREPK+tXntpMzZl7rLoFXJU7C4ubg24kc52hpoTbW71xP
         pTBeMpE5WwJMIJbGwhoE+6bOjIdzHg4aftHwzVWPE/qYHH2rNvHG0QMjk3NnDACucF7G
         3eX+6D6hCuVogW1PVe6dIlcnwRV4GapFlU3mQZ05qgFNhJMMeZw4cx2rFQm1Md6xLjdf
         X9Xg+BXLzEv/VHe6Z1VOZpKBgrvZaBxU0JEhI5n6Xlbbxl8ERGdrpXq2j9TkatO2HT9H
         lNF+RgNHuYFAoHSIwgvFLSZzVp4SrAoUByUfJ8OLD02zeisVlCNH6xuBkDdt37T3bQ6O
         uqnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=o8unxzl3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020a05620a2a0100b006bbb0a2eb34si14366464qkp.85.2022.09.08.12.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Sep 2022 12:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=o8unxzl3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oWNOs-0004zP-Tw
	for alex.bennee@linaro.org; Thu, 08 Sep 2022 15:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOO-0004Hx-5W; Thu, 08 Sep 2022 15:40:52 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:44559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOM-0007BA-EU; Thu, 08 Sep 2022 15:40:51 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 t11-20020a05683014cb00b0063734a2a786so13001973otq.11; 
 Thu, 08 Sep 2022 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HovcpPksbyRH4MetLfjOHLX26QOG2cA8NngwzZBGLTg=;
 b=o8unxzl36NDzNTN6PCA6whfSPbdTD1zMYiOe0Zqn27z2Oke0Wu322i5IDympBwsd+X
 IUKtq/bdiujbW0k4n/3rKhxdkUdDmkYgzuLAEqJzAnNH4UP5LvDi7c8mTSuuXBqMYjhZ
 KskDjkSAP99v5ZTA7SJqpCocXvQ3oE9UtHMNWNZXahtdOB2mGD3j0xnh2Rb7hg+NNt/J
 2mq3usyUBig6PzDZ+srxX/nyd8F5yXxdB2BoS0JcF1ysJ72rXSAVLT9X4LBTmizRXh9W
 lM2ruQ2F4NkCvlINYXTDaauPMfL+vYOAdY3VNrrM0xvI2svt47rQuq8R4yMsc4hOnWbH
 v1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HovcpPksbyRH4MetLfjOHLX26QOG2cA8NngwzZBGLTg=;
 b=ha/iek1fpqkT9IqLlf6GyZBOTxFSNnI9Y/ziPZzn9P8UdYHoz4k+ixpaTbjUtsU3qh
 Z8xF9tm6AdTt9dSR4Nw4ofJo/6D75HsIkbzGame6z4K5qXN4M9xsfLHYwbrFflP2mhGL
 4uOV4zesYM1kRiUSZMiKReH70b/AYG20DPYq55FR8srigul2ZPY5kmvfhegATWCDdOz3
 JZRGVOwMSlAVJT6EamfiDkOB1oHcQK4SVT3W+TiVpXDUm8fUpAWTa7l3FYCBNDMqZ0vL
 s7Hfmr4I8y0y+gwrqHCsP+2gAPNaKU3dUI/oN1xepmy+73WfG3JP0wQML6DxsrLsffWM
 copQ==
X-Gm-Message-State: ACgBeo3jweqGfSE9sTB1+ZVjj7fIpfbJWYX6YOJkN4TAw7m5Oee6aC8s
 /lIuJ8QpeHf7DwCSQpsiuDQu4l3xUPbIXw==
X-Received: by 2002:a05:6830:43a0:b0:638:f637:e2c3 with SMTP id
 s32-20020a05683043a000b00638f637e2c3mr3954644otv.379.1662666048643; 
 Thu, 08 Sep 2022 12:40:48 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:40:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v7 01/14] hw/arm: do not free machine->fdt in arm_load_dtb()
Date: Thu,  8 Sep 2022 16:40:27 -0300
Message-Id: <20220908194040.518400-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iJJVcticSIpO

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

This is not an issue right now because there's no code that access
machine->fdt after arm_load_dtb(), but we're going to add a QMP/HMP
FDT command that will rely on machine->fdt being valid.

Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
machine->fdt. This will allow the FDT of ARM machines that relies on
arm_load_dtb() to be accessed later on.

Since all ARM machines allocates the FDT only once, we don't need to
worry about leaking the existing FDT during a machine reset (which is
something that other machines have to look after, e.g. the ppc64 pSeries
machine).

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..60bbfba37f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -684,7 +684,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
 
-    g_free(fdt);
+    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
+    ms->fdt = fdt;
 
     return size;
 
-- 
2.37.2

