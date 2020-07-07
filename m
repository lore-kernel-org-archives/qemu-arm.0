Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp917723lfm;
        Tue, 7 Jul 2020 06:03:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMARPyyjJ1HMsDfbcWGB4nAGjijj5e7FHmUarhLO5v8JysZzH6ASFZPDVe+j+HNBnX/LyE
X-Received: by 2002:a1f:bf85:: with SMTP id p127mr28467672vkf.70.1594127023331;
        Tue, 07 Jul 2020 06:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594127023; cv=none;
        d=google.com; s=arc-20160816;
        b=I+rbiV4rqkSwqbrkIlRAYCBiHPgrxZwyHyvY6SjlZdSpELnPPM7Z98DtnYluop9PzJ
         m1d3Ur+ocI5B6KCbOavE/pm9CNPQHFfEcjN+6x9zGkuIOF4D+a/4pyBLLbHKo4HOl1IH
         bl3/yYP4CU0DQrGsiw15TR15DDVkJE1IKxA6n+2GfDZ0falnGWKIegDpi8JavggFTD1b
         nY1zoc+/TVaDxN7YW6pKfQbiJYFvj2OxuzuZtfGm+1gDCjr+U2UI9YdTPEO6y7LmMaCu
         8UmhxiT22OqApfWFse+ankCuiOPNekgxGm4fGqs6o8f0EdrVGPZq14gKaxHKm18Lqe07
         vU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=WRQFF1Ean5S7aC9TWsKn+9OiHTseT6Iuu52pMwLAYM4=;
        b=B+2ObwOTYsojFRDivjS8kPaXIRccwMp9ATJnI8NsLhHfNr7czW+fznPrGg2wlyjU8C
         Men6o4JtmqDwlMXumIegbG92xvcG1A+84ADLhVG7cV44dGokl2w7e9hrid/qN1S7PLmG
         Wt4WcdOhsN980FcTHnwSMuA/wmj4uuQ/iyt63D+rAbSrCf8foNyA+mcZOsBDzRl8b3dp
         cECzBZ2nXq/IxDRI8kX+3f7yptz6sc1xEXzImrQDV5ROkYaS7ImxU6FIY1nBQb6GffjL
         bdYxg34Q0VS0nhgw00V/qDW3g8RDmQmlhEddBwI/kVSV4ivTelZ7Etk+nfpoOtxSRYej
         BkPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UsLVdLHy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si3204755uag.101.2020.07.07.06.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 06:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UsLVdLHy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsnGA-000514-L3
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 09:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7l-0008Fa-5S
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 08:55:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24998
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7j-0004t8-G3
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 08:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594126498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=WRQFF1Ean5S7aC9TWsKn+9OiHTseT6Iuu52pMwLAYM4=;
 b=UsLVdLHyWMoqvETHcUjACbaGwmKgwfBKeGPW8wPA0NC4cbP0pVzPV2fsMlt1FGmB6j1ZGd
 +HeF6JDoPpdCcR841TyB1FXPbkC7HN/dQUWrkcvx41Hf4s+wUmngS8p3WVPhWaGZYAQY0f
 vW8Ke0Zk/cLKZ7yBCEpDGQf72tDOEsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326--hNBxjIjN2mYDxfU9a2fxA-1; Tue, 07 Jul 2020 08:54:57 -0400
X-MC-Unique: -hNBxjIjN2mYDxfU9a2fxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F3AD193F56E;
 Tue,  7 Jul 2020 12:54:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF26861780;
 Tue,  7 Jul 2020 12:54:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 63F9D31F63; Tue,  7 Jul 2020 14:53:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/20] microvm/acpi: use seabios with acpi=on
Date: Tue,  7 Jul 2020 14:53:47 +0200
Message-Id: <20200707125356.32450-12-kraxel@redhat.com>
In-Reply-To: <20200707125356.32450-1-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 06:04:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8lcVbedLhZ3+

With acpi=off continue to use qboot.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/microvm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 1bcd57a6fd80..ac605d92b984 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -52,6 +52,7 @@
 #include "hw/xen/start_info.h"
 
 #define MICROVM_QBOOT_FILENAME "qboot.rom"
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

