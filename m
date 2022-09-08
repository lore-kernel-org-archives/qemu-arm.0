Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp419802ejh;
        Thu, 8 Sep 2022 09:16:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4b57QEbao8IF+HN1x6RZe20BsNswjtbgmPqT4WWcku/T18nKXUEVyShVUgudKIyNRkQ5oU
X-Received: by 2002:a05:620a:2618:b0:6bc:6de2:2d71 with SMTP id z24-20020a05620a261800b006bc6de22d71mr7188406qko.85.1662653767135;
        Thu, 08 Sep 2022 09:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662653767; cv=none;
        d=google.com; s=arc-20160816;
        b=Jo3aP108wP1r7XrInBe87dAzfNqaslm2pojAmzedWvkjXD9yjHM12syPb5fCq21my1
         msjJuX++EftdtX3DDnRjKUV9md4OEe4HgRfhM8QQ7rZihLpl7tk7xzAroK7ej8YUeWQ3
         zLYRqbpD6N5bOrsdUu1Ue6S4iQ2CfrJfkQw9NXw5NUlQEADV8RttuIBOHH9Oftoehk0F
         XXbWR37pMampR/a7eUcL2QQbQbeijExbRfMkiI9B1prCiSvPFE6HbLjWGmA2nehnY0mH
         woALcPcClBorbijPrw62krxXt1sR529ugel1YjwYVq7Iy69WD+lOL1T+eHfQlIK7157D
         pg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=rYivBCd425ckUTxymH2fOULLCz+ZVDlcjGwjqv6ag5I=;
        b=W2Z7WDdSkuDgB36gcIIv9MUbmgdKbkNK7NC4lx5clYSXTjR9hflY3GpCqbEIlPdPTa
         lHug0ZR2lGFG99sh7jMICkP80kGS+rYjPaXEcbyp/t4E/9jzi1dbgrSBhWDs58UbHZ42
         1Qf4ykMl/TIm+w14PXZ+BaiEm8bNcLJ7iln9XFzeVTonmipsmsaOYlCqCySzQhdC8b0E
         TjjRQNbhxRfsbpv0TdiwdBsnHHFt7+b4yLihqkGf3BQ7zPyb1c4ssVDuUSKnzoxuz9nO
         UORemVKe5JIvomHAtFdiH7ZEjX9neR/9hpEh8+fLk1p7vHsbsVTdDZPA002DxfA/Y9Ey
         7csQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb4-20020a05622a1b0400b0034456956abdsi11172270qtb.292.2022.09.08.09.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Sep 2022 09:16:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oWKCE-0000NN-Ji
	for alex.bennee@linaro.org; Thu, 08 Sep 2022 12:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1oWK1o-0001yv-LZ; Thu, 08 Sep 2022 12:05:21 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1oWK1j-0004ig-Pq; Thu, 08 Sep 2022 12:05:18 -0400
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MNkPH01KWz688pj;
 Fri,  9 Sep 2022 00:00:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 18:04:58 +0200
Received: from A2006125610.china.huawei.com (10.48.154.32) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 17:04:53 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <imammedo@redhat.com>, <peter.maydell@linaro.org>, <lersek@redhat.com>,
 <linuxarm@huawei.com>, <chenxiang66@hisilicon.com>, <lk@c--e.de>,
 <kraxel@redhat.com>
Subject: [PATCH v2] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
Date: Thu, 8 Sep 2022 17:03:54 +0100
Message-ID: <20220908160354.2023-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.154.32]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) AC_FROM_MANY_DOTS=2.999, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
X-TUID: 9iNqSdrRE/Pd

On arm/virt platform, Chen Xiang reported a Guest crash while
attempting the below steps,

1. Launch the Guest with nvdimm=on
2. Hot-add a NVDIMM dev
3. Reboot
4. Guest boots fine.
5. Reboot again.
6. Guest boot fails.

QEMU_EFI reports the below error:
ProcessCmdAddPointer: invalid pointer value in "etc/acpi/tables"
OnRootBridgesConnected: InstallAcpiTables: Protocol Error

Debugging shows that on first reboot(after hot adding NVDIMM),
Qemu updates the etc/table-loader len,

qemu_ram_resize()
  fw_cfg_modify_file()
     fw_cfg_modify_bytes_read()

And in fw_cfg_modify_bytes_read() we set the "callback_opaque" for
the key entry to NULL. Because of this, on the second reboot,
virt_acpi_build_update() is called with a NULL "build_state" and
returns without updating the ACPI tables. This seems to be
upsetting the firmware.

To fix this, don't change the callback_opaque in fw_cfg_modify_bytes_read().

Fixes: bdbb5b1706d165 ("fw_cfg: add fw_cfg_machine_reset function")
Reported-by: chenxiang <chenxiang66@hisilicon.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
v1 --> v2
  -Added Fixes tag as pointed out by Igor
  -Added Ack-by tags
v1:
 https://lore.kernel.org/all/20220825161842.841-1-shameerali.kolothum.thodi@huawei.com/
---
 hw/nvram/fw_cfg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index d605f3f45a..dfe8404c01 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -728,7 +728,6 @@ static void *fw_cfg_modify_bytes_read(FWCfgState *s, uint16_t key,
     ptr = s->entries[arch][key].data;
     s->entries[arch][key].data = data;
     s->entries[arch][key].len = len;
-    s->entries[arch][key].callback_opaque = NULL;
     s->entries[arch][key].allow_write = false;
 
     return ptr;
-- 
2.17.1

