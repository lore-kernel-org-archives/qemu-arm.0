Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp645378lfc;
        Wed, 26 Aug 2020 04:00:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY82PIJo2DnfakIOgxyT5JyGNhz0ukrp2O1Ug8i9kz98hoR8XcnhSwmOSXRGnsWH9Mn77V
X-Received: by 2002:a05:6902:4af:: with SMTP id r15mr19702588ybs.32.1598439602985;
        Wed, 26 Aug 2020 04:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598439602; cv=none;
        d=google.com; s=arc-20160816;
        b=Kr3kyvb2Q5kGF/bjqACY9rElLMxzcbaz8MjjvBVZ0UZnBnEtpPAJyEAJPOw/35INUo
         YNC+5R9WpOzc1No2NFEKRs0l35ZKhNz9yWvoCbtPePTIzmWYUJ7OJHcepeZQn6kfNR9V
         roX4MKtUVpnDb1fy0FbngGWWzdTpquIB9BS2t1zwjqURaw3/zT9my3Ul9tTrs4ZjYtoh
         zRK0qXf/NQObB5rHzS0Wk3v0YWAWwwh1N9PCJTuuwDOr1Tv4tzpoP8EEX7lTV7vXj0+F
         tp3+m+HoKMXAHzvxr3qnN3xseGuHdVx0RqLwLvDAz8TElmawJwHsSn8/Tidw1sX07a5U
         VHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3oE6jZipdDk0METVeCLVyc8aV6ZhNb6/y6HHqyX62vU=;
        b=BVLNNZtkfkv5ood1KL2PghPrpjyXVBoaWULcEG6BmHk6hUaitskG7Zf5q26wpE1oOh
         hJ2kUipoQY0mqhGcGrs3/qiHhS3XVgUdozCnTX7+XADOBCGplUn8B9BN9UY7bWkW/StQ
         OKU/zqUI1p77+mh1Vg0sllqk7z0moQPrFuD+Jyy94qF/ZLXJ6wwdvUZECYIkW0lGLdPa
         ul9judM/qPyqQ3H8rHwHAs9ytlNp/41johltIWcq26AgQI8rt0ltJSm53rTlblbeXSNR
         eRskkemefNtxJj7eJWGcJyE5zEq9OBKjysAA8aRk1ODPKHom2oMwATtfk1uUqteQVH7u
         5S1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X3hGVU4F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si1821564ybt.466.2020.08.26.04.00.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 04:00:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X3hGVU4F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAt9u-0002BR-2h
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 07:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3a-0006Wb-Uw
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:53:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3P-0001ZO-M4
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598439198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3oE6jZipdDk0METVeCLVyc8aV6ZhNb6/y6HHqyX62vU=;
 b=X3hGVU4FMxj8Oabm6akeZUGapk7n8lbSnLzxyWQJ5S4vLxBes+DJDQStjk3w6YPX/dtau3
 SSwxuPYIMzSTrbB4qwIeiPSeRhiu4sdBk2PlMTLsMA+o0dJsoXno4QCPDXopyvuA2b6HZd
 YJuJDoxqbWwqy7lQ9xMacnTZ9X9o9LE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-7Po-9udqMVq_4d8KxviIEg-1; Wed, 26 Aug 2020 06:53:15 -0400
X-MC-Unique: 7Po-9udqMVq_4d8KxviIEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA4F0807330;
 Wed, 26 Aug 2020 10:53:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF5E65C1BB;
 Wed, 26 Aug 2020 10:53:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9443031F50; Wed, 26 Aug 2020 12:52:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/20] microvm/acpi: use seabios with acpi=on
Date: Wed, 26 Aug 2020 12:52:45 +0200
Message-Id: <20200826105254.28496-12-kraxel@redhat.com>
In-Reply-To: <20200826105254.28496-1-kraxel@redhat.com>
References: <20200826105254.28496-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 23:30:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: qnltnT2kkq/D

With acpi=off continue to use qboot.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/microvm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index ca0c9983f137..54510a03f754 100644
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
2.27.0

