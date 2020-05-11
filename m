Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2446127lfb;
        Mon, 11 May 2020 01:19:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ1B96CedIejflwrmfVAJdU/8mTu9NNJg9/VoQOCgEYCoj6LlNLPi1c3ZcbDt+4mxQvZUzn
X-Received: by 2002:a37:b16:: with SMTP id 22mr14317634qkl.464.1589185141664;
        Mon, 11 May 2020 01:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589185141; cv=none;
        d=google.com; s=arc-20160816;
        b=zCeSqClpGdqPTGGic7xURlS7oh6/05yUGiKISl+NkriFWi8oX/NPPx0wxpYhrwfcBW
         azsnXi9CZ2xS1mKnklpRXvXBXt2yostNnj9C0xAbd3Ib7uUjewaSTewF0VdTV3tsaniF
         8PwcJKwKbNcBoGXtCbrs6b768aWyuF8SHtCGSqJ+0Uq3nBe55icGAt0MwKVzKTlm0aoT
         y/oXMluQRPa9k7jr1gAFv7B2GohpDiVhJMZbKAjSfhXEnE2xblKbb/09ipieawhXL2/R
         ukikkxBqy+IP32ccFwhiFrmIvM4hdZfEIg41h1Vrs8V239QPMKZ4jMqSBzscMuA+cX5q
         xpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xHMlh8UQrz25BuiKwyV6jlHVokAyOsVkk8MOKqnQOCE=;
        b=RxqU/wABbliDJXoJECzPYsH4l01RxhCE5UrccUQf3wuzZ4fe3fOWKHyKWIOF0yXil1
         J5Z6niXJzLi+fO6vyJqN0PtdIT69Ypf8OO7fQh3qEK2V8pHOsqS7QmztVkuBEGzXo2v0
         CHoyL/mu6Hua+hqw+XlCKX8T8rwHEY3ITWPPVGjSM+OQlmnO29VCp8/V95idbk1Vg3zj
         XtPWRWOCvbhEZEmDz/0Tqmpfq/jrYA30eqBfT5cswzkFRELNhH1pEvgBzMYGQf66WYeG
         H1eFfaeqSms6Iku25JY0DxSUxKe8LB3jIVrf/PSReOlUf2o020rMp9iaHI3IrKItUXeq
         ngVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MPWhu4px;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u41si5023031qtk.128.2020.05.11.01.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 01:19:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MPWhu4px;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY3eP-00055h-1b
	for alex.bennee@linaro.org; Mon, 11 May 2020 04:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY3d9-0003MG-TI
 for qemu-devel@nongnu.org; Mon, 11 May 2020 04:17:43 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27016
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY3d9-0002oX-3J
 for qemu-devel@nongnu.org; Mon, 11 May 2020 04:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589185062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHMlh8UQrz25BuiKwyV6jlHVokAyOsVkk8MOKqnQOCE=;
 b=MPWhu4pxGDyVXc4/5heCEKihqh83z5Rhfjs7vdDoA0f7QMM/Q8t6AyvqEkFIJndwjo2gaU
 LgVIWLLRjl3mw8/2o6248LncnJbZc9nzMD4NTGhklJFPOIItKP9vXY7XE4/6fp4/C+X5Yv
 1b17sRjhd4yiki1OD8BH30QgMCJoaGc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-aW5X9QA0MTyQBS_Nfpvb3Q-1; Mon, 11 May 2020 04:17:37 -0400
X-MC-Unique: aW5X9QA0MTyQBS_Nfpvb3Q-1
Received: by mail-wr1-f70.google.com with SMTP id 37so1637214wrc.4
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 01:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xHMlh8UQrz25BuiKwyV6jlHVokAyOsVkk8MOKqnQOCE=;
 b=iS2x5JcsOdJ7ypN7N1goFapZNg5IZxwbzK1OheaouXqk4FEOI8TqqwEsSC2NE/YzqK
 EHhxXI37jztGPKwnvxzH7NPqpyrZq6DHxp5oar5ZWOMxar8Pz/tyncr56273aNMUHCgn
 v4HQAaIjxazgzPeW+55d+6FbVhj51UeU8dO4YCcx3E3Xdz9vzkzVS0atPmszLa9M3ZAr
 YdizQPUEiL6quj6yW/64OsGMmqT1p7X1NcSi1bzSubvOTzlBdhFa3d06JM9RVbnMgT5i
 xfop0q7ggZc0POFbVKwsfU9yAuCm6WW/HsrQGxKV6+5NbJQn7vVO6Flv5/f512GsO5Mc
 btjg==
X-Gm-Message-State: AGi0PuZq6DtdEypxr69zWE2x/J9Bv4OL5tWSaf5M9xIehoe98pJoSlex
 OSaALmQvRJSwu0csieh7ytoRX3kIzlhxEffbCLkPfdWdovyyjYHk9zIdTkKhfmqpjZ1utxdCYMt
 a4OMUcj7kv48YifE=
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr30861084wmj.86.1589185056015; 
 Mon, 11 May 2020 01:17:36 -0700 (PDT)
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr30861073wmj.86.1589185055867; 
 Mon, 11 May 2020 01:17:35 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 2sm16244217wre.25.2020.05.11.01.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 01:17:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/block: Let the NVMe emulated device be
 target-agnostic
Date: Mon, 11 May 2020 10:17:18 +0200
Message-Id: <20200511081719.31641-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200511081719.31641-1-philmd@redhat.com>
References: <20200511081719.31641-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 98VUa06yvAOW

Now than the non-target specific memory_region_sync() function
is available, use it to make this device target-agnostic.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/nvme.c        | 6 ++----
 hw/block/Makefile.objs | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9b453423cf..d9d0649540 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -46,8 +46,7 @@
 #include "qapi/visitor.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/block-backend.h"
-#include "exec/ram_addr.h"
-
+#include "exec/memory.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
@@ -1207,8 +1206,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
          */
         if (addr == 0xE08 &&
             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
-            qemu_ram_writeback(n->pmrdev->mr.ram_block,
-                               0, n->pmrdev->size);
+            memory_region_sync(&n->pmrdev->mr, 0, n->pmrdev->size);
         }
         memcpy(&val, ptr + addr, size);
     } else {
diff --git a/hw/block/Makefile.objs b/hw/block/Makefile.objs
index 47960b5f0d..8855c22656 100644
--- a/hw/block/Makefile.objs
+++ b/hw/block/Makefile.objs
@@ -13,6 +13,6 @@ common-obj-$(CONFIG_SH4) += tc58128.o
 
 obj-$(CONFIG_VIRTIO_BLK) += virtio-blk.o
 obj-$(CONFIG_VHOST_USER_BLK) += vhost-user-blk.o
-obj-$(CONFIG_NVME_PCI) += nvme.o
+common-obj-$(CONFIG_NVME_PCI) += nvme.o
 
 obj-y += dataplane/
-- 
2.21.3

