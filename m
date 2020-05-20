Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp576715lfb;
        Wed, 20 May 2020 06:24:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxj33N3iHFlLw89dPLuKPZMVQQofQ+Ap61WtsJ5e7TzRHoE2rDykZUQIxC9X8JjmsKTMiG
X-Received: by 2002:a37:64d6:: with SMTP id y205mr4531310qkb.95.1589981083858;
        Wed, 20 May 2020 06:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981083; cv=none;
        d=google.com; s=arc-20160816;
        b=lU9k2zzkFPpr3G0A2eIhRjaG0qEMRdSp9XzoaJH1Aiua/Hf5ZRsrNoMHMUViuc2PV2
         ajag93YnpCFVzC+yVVTsMtJ43ruW9qLr6xtaKukvc23812inNZXPbOfBxPvuZzXgpOy4
         uC07ahKq632pFDpmMOq0W6iMcVXGtV/lpnXQ69qSOiZxRs9TtzcapHVZ3H3e4HVztMLK
         v8MGmYmzkeWRo2D3SfRu0AKwXLV6W8ZvfcD/t20lL9GHWLXutoiChEfCHYn3nzcvyAUu
         KpbM48gJ6APqeFUjzJFUlzlo0hYREf3tSnQOYN3G0n3WlmMukukG+xaZdsEXauKR0Y6z
         BbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=5/bLq9KGCPysYPYe9QiKsWgS2E2AvDpIpEzAaMPZmiE=;
        b=k70sHWM4Ix1ReGI4K1FxGsnL2dQ3duBPg4ABbYbWjUfZQAoPSxQWlRF9W6lwLnlIm9
         XdlMtY51Cny8BT7yc32VnMIK4ALA6Z2gLOUXtlv1CZe4Dm6ewaLhbSJmHbqDpSrKfh/6
         r7gSu/DqGU0Hb/3TRkKRmIPzh2+Ad4e2ZJGx2ljfMtTQC+YNxSbd58kOiVfS26gtLGpZ
         y6LL/73Ns0lYPrudoKGwNkEvHHXVIV54rNUzj/q+f1CdZ+qSKwruit4+B25A4dgVGkx0
         RKrMW9fBLkCmf3xDRBLExYHAmNNaBPTMzmDchs60AgZisF2GPUEi0STMjz7HrhzDLMt1
         nUVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fCY1FjWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z28si1457384qtv.288.2020.05.20.06.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fCY1FjWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOiB-0002dk-1t
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe6-0001ua-QV
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:30 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25420
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe3-0000FF-RP
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=5/bLq9KGCPysYPYe9QiKsWgS2E2AvDpIpEzAaMPZmiE=;
 b=fCY1FjWjOy231gNzlCygMRUZ+tA21mUHvMxV/CYnhiKSe11r7dODwZSiPLOXhQjL9DzeYE
 vZhmwPNae5l5t65nJtMEbEIhQ6tIpk6Cjo47u02WxKbVD58RrHMzcCRt8Rl5xySECdsgbW
 4202uriANNaaCJKWlvYuecgdUTlNxL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-d0NoXSp3PZudtJrC8OAcrg-1; Wed, 20 May 2020 09:20:25 -0400
X-MC-Unique: d0NoXSp3PZudtJrC8OAcrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3390A100CCCB;
 Wed, 20 May 2020 13:20:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD3682E170;
 Wed, 20 May 2020 13:20:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 668A49D71; Wed, 20 May 2020 15:20:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/22] microvm/acpi: use seabios with acpi=on
Date: Wed, 20 May 2020 15:20:00 +0200
Message-Id: <20200520132003.9492-20-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 04:09:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KfhqqgHk1C9m

With acpi=off continue to use qboot.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 7d8174809ae1..ddb8570a2915 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -52,6 +52,7 @@
 #include "hw/xen/start_info.h"
 
 #define MICROVM_QBOOT_FILENAME "qboot.bin"
+#define MICROVM_BIOS_FILENAME  "bios-microvm.bin"
 
 static void microvm_set_rtc(MicrovmMachineState *mms, ISADevice *s)
 {
@@ -174,7 +175,9 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     }
 
     if (bios_name == NULL) {
-        bios_name = MICROVM_QBOOT_FILENAME;
+        bios_name = x86_machine_is_acpi_enabled(x86ms)
+            ? MICROVM_BIOS_FILENAME
+            : MICROVM_QBOOT_FILENAME;
     }
     x86_bios_rom_init(get_system_memory(), true);
 }
-- 
2.18.4

