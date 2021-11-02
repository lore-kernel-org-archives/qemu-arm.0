Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4025268lfv;
        Tue, 2 Nov 2021 15:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymsqi+lSg/XeH9hYzNdWNfYcr1VWt/m3F4W3bhXlPLGqS+CjviCjuyaN1ZP/R2oWm48I7B
X-Received: by 2002:a05:6808:1910:: with SMTP id bf16mr7500385oib.137.1635893630661;
        Tue, 02 Nov 2021 15:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635893630; cv=none;
        d=google.com; s=arc-20160816;
        b=KSO8cVmfCF5sfplrw9ybL6EmNuUoRmM7zAwYFje2HBY10q+M1zSSPxYS7IsaN7+Dvl
         cwXTSSrAlKNTrXnCtlzbTH20+uuECPgFJvGv5QEhgqZ2UDOyEFTjXUaJ3QlHydGXrAQH
         hcx5O1cGhFMcaF21ZQOI9P+8sw8B6FwnauROeSupIZG5X2ysVJClMp+HvrWwRIQ3QBVl
         E7pn7icfWLZq+PabbTArij8Xo8vp4tk9RneORB05Dh+rx3z54iqmL/JEZqO64c9oeOVv
         2lxDmAJC5lysuuNHVUhau9wK6LOgRwaoJWv0KhOQ780RPiRmccTPBvlikaRq4FsuhvUC
         ilTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=0IMzBe6hGicqZoM4it2xwyLQvbZD1D8UDosriF+DAlY=;
        b=UCz+0EwGRpXuQqlI0VAn0G3P3TH2dsNyxX59Gsb6r6hXQYeEaP761eUujaYTWwWXen
         KqjThc/D7VBHD1qeNvHcVCSfFTwP4Fdy3LcClByHIqHtp1oChFBveKi82yXB4kvm5z/Y
         wp+cqmuU01jxhFeLxdFUB1CEORs58BWOuCwsxLL30zn4KY7Xxwm7IkpK2DT1WxV7NpX1
         BhuTsWMhyfwCAkKCILPSgJX30HjjAxXUnWA3rcUxAEGTPOYpn6Jz6y81wRd7shydr21l
         nG9EbHWBUyIFuIRmMpZagILzKk+uRzBz0/zhTBBaz48O8RUFzo3vN8CCVSaEGtXJLT16
         9dBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RGt85yXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si441231otm.249.2021.11.02.15.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 15:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RGt85yXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi2f7-00072q-UZ
	for alex.bennee@linaro.org; Tue, 02 Nov 2021 18:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gsCBYQgKCB0PNA3HMLA9HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1mi2b9-0000gJ-55
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 18:49:43 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gsCBYQgKCB0PNA3HMLA9HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1mi2b7-0001GS-K0
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 18:49:42 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 r30-20020aa7989e000000b004812fdc343eso291773pfl.9
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 15:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0IMzBe6hGicqZoM4it2xwyLQvbZD1D8UDosriF+DAlY=;
 b=RGt85yXzN0iPCy71vUzI+dnKKkvbJiTnIuJV244xqzd2jqwkVJDTOtgZIeVl/0QK3s
 z20Mb1wbJBKUOkfBO4a32uIPwU7m0Mj6lQotwFHb+TnpBxDwqz19H7D4tYLSA0Q3rui6
 g6cziXlJ9kttDFJYaFmYxoQu7sRskuBAgJsM095YB1YmO9I0YrCI1JzzBTCFFBJAObPd
 JBBsx9epPs+8dxaO3hrFkPNB2F7B7Nml2T3y9DGKNR+mM0Yh0aeqJCGGDkbyJ7mqRumP
 LsWVyb30YvhldXXNaQH14nVCF8CVWcvn733NKMZMXf46ID3lMKCHJxYAB+cKxpOT1mM/
 SKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0IMzBe6hGicqZoM4it2xwyLQvbZD1D8UDosriF+DAlY=;
 b=hE97ajrr/1M+WcTtCXac6z8gTpeanYCYBzMRx5frS7CJ+qAf2lDttnHhYhCLiZNdJa
 ROdeX3OILXSfekn83ri2yEIaJD6sDWAptzanlqi1s8R6I4kgcBpqZF3R32dxv+EBHOjt
 GZ8RFVNfQ8tsatE5CPwwLBMZQhXnaaVbaJIzY5nWqumIg/tiK+dls35v0LJ/KjTN7OQ+
 GoNFjKTPlT788U7P37zssoZi9HfdDcq0+LUa+Ztb9GRiBY8lTEJsTUhhC1VN+l/+DK4o
 3fCj7ButJQV8GYlHiDuRm7VsXXXRI4wLmxONaw4VprMdV4wsmOKLRMs8Fiso/3mtJWaZ
 DV+A==
X-Gm-Message-State: AOAM533+vF8z77gAcaxnP1t/PfM04uMefzWgLnuLL+M3sHzycF/QTEIZ
 41Pa5ph88b4faVmR6BQssshSb3X2WfBT2g==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:903:1207:b0:13d:b9b1:ead7 with SMTP
 id l7-20020a170903120700b0013db9b1ead7mr34479842plh.63.1635893378852; Tue, 02
 Nov 2021 15:49:38 -0700 (PDT)
Date: Tue,  2 Nov 2021 15:49:22 -0700
In-Reply-To: <20211102224924.1244946-1-wuhaotsh@google.com>
Message-Id: <20211102224924.1244946-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211102224924.1244946-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 3/5] hw/arm: Attach MMC to quanta-gbs-bmc
From: Hao Wu <wuhaotsh@google.com>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3gsCBYQgKCB0PNA3HMLA9HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: hLdrostYxKZ1

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index a656169f61..dec7d16ae5 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -27,6 +27,9 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "sysemu/blockdev.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
@@ -81,6 +84,22 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
                              &error_abort);
 }
 
+static void sdhci_attach_drive(SDHCIState *sdhci)
+{
+        DriveInfo *di = drive_get_next(IF_SD);
+        BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
+
+        BusState *bus = qdev_get_child_bus(DEVICE(sdhci), "sd-bus");
+        if (bus == NULL) {
+            error_report("No SD bus found in SOC object");
+            exit(1);
+        }
+
+        DeviceState *carddev = qdev_new(TYPE_SD_CARD);
+        qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
+        qdev_realize_and_unref(carddev, bus, &error_fatal);
+}
+
 static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
@@ -355,6 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
                           drive_get(IF_MTD, 0, 0));
 
     quanta_gbs_i2c_init(soc);
+    sdhci_attach_drive(&soc->mmc.sdhci);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.33.1.1089.g2158813163f-goog

