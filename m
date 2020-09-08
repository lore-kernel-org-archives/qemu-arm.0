Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp553760lfq;
        Tue, 8 Sep 2020 05:21:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI+FKQ4xCibGbYyRtxJkz7QoDia/gmy3ZzZRn1UL/eBJ6eb/tXHfABDHQiu2x15pWfKsNG
X-Received: by 2002:a25:e616:: with SMTP id d22mr19621129ybh.422.1599567684183;
        Tue, 08 Sep 2020 05:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599567684; cv=none;
        d=google.com; s=arc-20160816;
        b=TeJ76a9baiyUlqwG41jQTTgRVv0A9t3G+5CPALw3XIkFi9v4M4yXPw6Lg9xin4gWsm
         iZSDpO5YSg7OLwiQIDy93jW3CizNKeuxmfesZkCQIc9gtUUP7THLDXc23uH94Hdzfa5R
         dCyx+vzY+Ht3l/XQNgwLTqcceEm5ucgiy/LLNu1CtZvXa7JploDArxvMR6ZbVbsT2N6S
         Gf01lEBsNHBNQPkEucSBe74q2tKKz6AimVEjnE0O1cECYTQ79FyfjaBIY9gYMyh2QkhT
         G+HiDYeDRbXYp2f9vY5ubrv6h7/eWASMmhHMYoQ6rxS1IqZeIt8hSWtwZoasPRR4ZjNO
         zucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Mhl8v2yFjMFLKxDLyHc4g/0SExd3T3HmoDrjUE1tIHQ=;
        b=nT5fN5wCGP/5NMquUyeKB3DuM5YlDNpShd0/72KpXIfCuO1/68oppfgh5q+Lq/XXnf
         EZZa+Tp7k7rOvN+jkjyefQU2jLK1MnLL4M67bWyuxb/G1f7tRB7fFjyGLAu8y//Ky+tp
         ULiqJeQ4QDtzDWXXGB5BRYOyltBJiHdo6QAM1MhSAXKLBayPaG0LXuf2+Ts98hdpUIBO
         PgOQqOfZxNA0lrhFjohEQmI+bsJgO1LJkJiUKB9++B5lSUjK7smhY8rcF5TXJ1hsk9xd
         myxnWVq50HnXFWehRU0nIpMXs90tiWgYh9tqAPLBX57m58CLozz0FNVFzuwVn8e9wBZG
         Y+Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VoShtw7h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si19850899ybe.326.2020.09.08.05.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 05:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VoShtw7h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFccl-0006vw-HC
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 08:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcTU-0001hP-N8
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcT0-0005i1-K5
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mhl8v2yFjMFLKxDLyHc4g/0SExd3T3HmoDrjUE1tIHQ=;
 b=VoShtw7h6CqyQVFQkSzymEKICAwj8L88U6ceeskajE/WUwIwrDibv9j7Mi4AOQYPErKJNk
 VH/UzMGAVqr+GFSVrm2vRXhnkzJNn9FnmUIJRR1SsP6Rx/+V8od0y/Y7f+OwOoTL6s68hz
 Gz+L1oe0uqSUPgjFN4os0ARW7rMrUp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-JE-oz8goNJ--gm0lWVmEjg-1; Tue, 08 Sep 2020 08:11:16 -0400
X-MC-Unique: JE-oz8goNJ--gm0lWVmEjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8611912CCE9;
 Tue,  8 Sep 2020 12:11:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E39B7049D;
 Tue,  8 Sep 2020 12:11:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EB3C331E63; Tue,  8 Sep 2020 14:10:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/21] microvm/acpi: use seabios with acpi=on
Date: Tue,  8 Sep 2020 14:10:40 +0200
Message-Id: <20200908121050.1162-12-kraxel@redhat.com>
In-Reply-To: <20200908121050.1162-1-kraxel@redhat.com>
References: <20200908121050.1162-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pPlYq8bSEdMN

With acpi=off continue to use qboot.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
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

