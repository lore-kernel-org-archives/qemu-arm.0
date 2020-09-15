Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3112431lfq;
        Tue, 15 Sep 2020 05:12:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdfmrT/v/7oy8qH+kfqxdpuo2aCgswZzR4mLvIGb2qNrImUF+i6JmxzMgiMN4TmXr05Jfn
X-Received: by 2002:a25:2611:: with SMTP id m17mr28136010ybm.442.1600171973074;
        Tue, 15 Sep 2020 05:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600171973; cv=none;
        d=google.com; s=arc-20160816;
        b=tqgdsTiBbrf8A2/GeO/TTLarcS+xtrTZLz1l6Qxi6KrJMyVWss59ena7fXIpwjEvLC
         7zyAoI15qznFNdPbx8jeul8TtS58JBAlh2jIjZKh3K3NdBjmvPg0pNH7lx8ga1/S2mnq
         B+BL+8K88md2xxgM4oPNNQQhLvia/3aJgymGN7X+Y9/cdKP/uTQ/YSdapYHofciY8U7T
         vKqqBBO5dk/ICC2EH9shttpbrQRZn5nAYAyrr3PKlQ3v3P0C6T64d0QZHQIS3CbmZi/u
         pAxbQjXvgiMwuV0h3NOmDtqnrDRp9DV+jq5wlIM8sGr5a1m91fyjyhZIF3bGFN4zijhV
         VAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TGos9Q6BbkzS4hgAU4ify92YUlJ0vxyK/3DZMvE0+9Q=;
        b=Gbz0bGLlu8uXV/zjSHq+9lz/PaBVJRNcGfKD+5LBF64fvyvAdDijZdmHjaCJQwPmfu
         R3FVo9qtFquozxhKuIQkWsxdb+FTLVJt9hw3FGt5LRqUUdooi0TdPNW5SYl6SR+pdG/A
         tTpqdF7reDAY8HKZtN1+1EcfsdwRTrwGPrt3AfVVnktn2wxAjL0E/eXJj1Hxaan3oXUB
         kfKwbgRfWb5tY2u0ZZ8i0iatXHdFgMb684+WgoLXzIFVyUwh6t2W9G8Dh2s96xyTluCt
         2OS1LN6bWk03tBx1vpAge2OPPgBIHOc8A4rGmiaklFNWXpqhROyZzJAhmbKwVddnjP9P
         IedQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aJx1tXGI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si12801975ybk.472.2020.09.15.05.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aJx1tXGI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI9pM-0006to-Ed
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nE-0004np-3w
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 08:10:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30553
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nB-0007gt-4o
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 08:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGos9Q6BbkzS4hgAU4ify92YUlJ0vxyK/3DZMvE0+9Q=;
 b=aJx1tXGIeqJO1otJcwCmgkoQkHQ0Nq6tRHA/Sid1HGsUxDfnVASo8Yx2bWdjR4/7zJZYY8
 6J1hlSHeN3O2+7sSAxc7skOD4ruZkOxFT1nqd3O0fYIEJqB4UpsIc18NZr3K+KOx9A0ZKz
 92KImgBbe8Sden7VjBS8/bKA/bZb08s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-zwa08wHdMRuRVpWJ_eAiKg-1; Tue, 15 Sep 2020 08:09:27 -0400
X-MC-Unique: zwa08wHdMRuRVpWJ_eAiKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76D1A64086;
 Tue, 15 Sep 2020 12:09:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E9F87512A;
 Tue, 15 Sep 2020 12:09:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6EBD940C07; Tue, 15 Sep 2020 14:09:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 21/21] microvm: enable ramfb
Date: Tue, 15 Sep 2020 14:09:09 +0200
Message-Id: <20200915120909.20838-22-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:11:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GQFtKLouZJs8

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 8de8ca864963..60d32722301f 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -39,6 +39,7 @@
 #include "hw/timer/i8254.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/char/serial.h"
+#include "hw/display/ramfb.h"
 #include "hw/i386/topology.h"
 #include "hw/i386/e820_memory_layout.h"
 #include "hw/i386/fw_cfg.h"
@@ -604,6 +605,8 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc,
         MICROVM_MACHINE_AUTO_KERNEL_CMDLINE,
         "Set off to disable adding virtio-mmio devices to the kernel cmdline");
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 }
 
 static const TypeInfo microvm_machine_info = {
-- 
2.27.0

