Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4523881lfp;
        Sun, 16 Feb 2020 17:25:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdlgkWLEvWPVVz87n5WxcORF8mBvkhaAI3rhp2Rs5ScLPImWtf9HlvlYB9A2Bl07CmbzST
X-Received: by 2002:aca:554d:: with SMTP id j74mr8815441oib.92.1581902727750;
        Sun, 16 Feb 2020 17:25:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581902727; cv=none;
        d=google.com; s=arc-20160816;
        b=lmv5j4JH3QZLjRfy7a2UNumBjzVVcF2mEelVtaLz6514RXoOeBr06ih0tOz2iYtg2j
         FhQdjzkxBRqtMoxHzvFqfwH+B3mSi9f2ujG3liwOzfZjGB2bzDreN9gk9UBSRwVrUnie
         D8G/IroLHXGdlZnCWxDanhUfqmICPGKfE89SxRQZGuAWDZ0bJtjGU+ur47FSDuuh6yJi
         8sq9lzu7mHlbWJwoC1uuwnID/SeW48t/KlO8y6/30NQB8bT/f1GBGq4JmVm1tbelm2oN
         d5djPUdtefLHkyMs9aETJVDulpyW8+YhNfusIhqB22UWbUxDi9GuWouyW4W2P+GkpPg9
         6ykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=l4Wm86eOYTUyxbo20YvBJuytJaMnkjwkRZM0qqMmTPw=;
        b=c1hvpjUAqaBVvhDEqA7xEyL44eX1eM2H5ci9K3/dwK7ZYeEcQrNMZ7CpAyInnY6Y8p
         JYC9ANn2Kgemw6DtY1r4lv0912M6hxWiY6RXI7nc7TXnIHDUGnGOHTZHCI3etMPaqNiP
         MST8jFaKYaEkna+wr58aZQSijSbEfJRxqTdSlj/gG3f5FRLbIWCnIAo97BzXmRvU5Gej
         DNRFJbj9TmRzVjORwfPN0w29J8hud+mGvsdEo0FLyNuItPGKXyg+Fkuxe6Jj3pN/+11u
         vxum5/5cERmCZrDCs8z46iaNkCFyyNCrAZGIbTlwRY+7ThKdjDhbovhiEidrgZU3Hj4w
         IVcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z14si5843662oth.15.2020.02.16.17.25.27;
        Sun, 16 Feb 2020 17:25:27 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgBQBZZ (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Sun, 16 Feb 2020 20:25:25 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:37282 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726183AbgBQBZY (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 16 Feb 2020 20:25:24 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id DBF56E9DBFF1A9862BA4;
        Mon, 17 Feb 2020 09:25:22 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 09:25:16 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <mst@redhat.com>, <imammedo@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <shannon.zhaosl@gmail.com>,
        <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>,
        <james.morse@arm.com>, <lersek@redhat.com>,
        <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>
Subject: [PATCH RESEND v23 01/10] acpi: nvdimm: change NVDIMM_UUID_LE to a common macro
Date:   Mon, 17 Feb 2020 09:27:28 +0800
Message-ID: <20200217012737.30231-2-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200217012737.30231-1-gengdongjiu@huawei.com>
References: <20200217012737.30231-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: jAE6R1reMos3

The little end UUID is used in many places, so make
NVDIMM_UUID_LE to a common macro to convert the UUID
to a little end array.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Reviewed-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 hw/acpi/nvdimm.c    | 8 ++------
 include/qemu/uuid.h | 5 +++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 9fdad6d..232b701 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -27,6 +27,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/uuid.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
@@ -60,17 +61,12 @@ static GSList *nvdimm_get_device_list(void)
     return list;
 }
 
-#define NVDIMM_UUID_LE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)             \
-   { (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
-     (b) & 0xff, ((b) >> 8) & 0xff, (c) & 0xff, ((c) >> 8) & 0xff,          \
-     (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }
-
 /*
  * define Byte Addressable Persistent Memory (PM) Region according to
  * ACPI 6.0: 5.2.25.1 System Physical Address Range Structure.
  */
 static const uint8_t nvdimm_nfit_spa_uuid[] =
-      NVDIMM_UUID_LE(0x66f0d379, 0xb4f3, 0x4074, 0xac, 0x43, 0x0d, 0x33,
+      UUID_LE(0x66f0d379, 0xb4f3, 0x4074, 0xac, 0x43, 0x0d, 0x33,
                      0x18, 0xb7, 0x8c, 0xdb);
 
 /*
diff --git a/include/qemu/uuid.h b/include/qemu/uuid.h
index 129c45f..bd38af5 100644
--- a/include/qemu/uuid.h
+++ b/include/qemu/uuid.h
@@ -34,6 +34,11 @@ typedef struct {
     };
 } QemuUUID;
 
+#define UUID_LE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)             \
+  { (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
+     (b) & 0xff, ((b) >> 8) & 0xff, (c) & 0xff, ((c) >> 8) & 0xff,          \
+     (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }
+
 #define UUID_FMT "%02hhx%02hhx%02hhx%02hhx-" \
                  "%02hhx%02hhx-%02hhx%02hhx-" \
                  "%02hhx%02hhx-" \
-- 
1.8.3.1
