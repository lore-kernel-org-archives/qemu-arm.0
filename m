Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp548809lfq;
        Tue, 8 Sep 2020 05:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIINiuRC8AblA0EqcWK1+BoBDU/6QzX4+v1QXhyS3wEh2XA1A4WvnvNX3vfqZ1fJeARqY1
X-Received: by 2002:a25:8311:: with SMTP id s17mr38096163ybk.100.1599567295562;
        Tue, 08 Sep 2020 05:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599567295; cv=none;
        d=google.com; s=arc-20160816;
        b=KN8hxYMd+XGAUWsVJmreLV3CNMsQYqocaz2n2hgFtrDhTycNoCd6ZyZDuQFXIUgrjF
         gyL7jQW01PC46CBxY//1BgoguTl3ilkdL/3DzrdrNDIVRwCjmwcK7Q1ps2gbpdJ4MgE3
         2y8BNdM7hc/h2zmW1ZHxJv9SBlw6BqJ11BluS7KP5gUN1i5uOvYScUhf7s46SeoF9x42
         Ne2hylSFKBCpPJybTE8j5cho/xf5kbrZD/1zjRX5Xc9ZUGrZ0W0xLU3JyCFQpJFoORfD
         NQanzKcuObCtw3rxHD8ZvzRLxLuUfhEMOqYTo2aeftCZToC/NQrgjcXLknU9TVatiDlx
         irZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=f7gcGwGKvQs66zPNjI3Utr4hWVSraR8+eNzLSiL1B7A=;
        b=d4DJDJmmjhuxzhN/new/w2kEKllU/b1xPIcrkjIlgSvDQfX0Ugd/kfVQhIffjz67CT
         sd910egWGizqGYokZEpKKA84DmrzbhMt7rsJx8+6eZg48TyUoD5PXwbGCliZl8B/uAOb
         0SDi5za90ZK2psd0dL61B4CLi4/8LTXmzUua7qBNhDd+yF1jxZ+TiVQfYoCEjymOPN52
         5Z1lt77AMkSBbTyYBkTcIIYvJgm8+CQbxP5t4tZ4ngCaQMxEvUlZsj8JBDC/2jMwAWJd
         jbDG0I8FGZJ6Ne25EVxTws9DR63wmp3zyWh4LJhfDSW4xKIAXsQNhELHwNCm1bkkF3R7
         hLGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O+stA4cf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si17779914ybj.183.2020.09.08.05.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 05:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O+stA4cf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFcWU-0006Xa-SP
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 08:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcT9-000146-1v
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcSy-0005gq-H3
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7gcGwGKvQs66zPNjI3Utr4hWVSraR8+eNzLSiL1B7A=;
 b=O+stA4cf4lTMQ4x9XFs6iAZi9GKPHW4NrDqoBknQg7uKzY2Z9vBMIpxLv0E57B3/cDXiKm
 NbjiEyGPpzFBPLSLLBhx1pUwX9LRA3DCsJDyk9VJnCNtGG72V4KlcgmFgdMK+vk/i/Blko
 p0PrTbbeQUjLKZbsgT0TIcqw3pCTdJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-fTTgz4cUNculkobHvh-nYQ-1; Tue, 08 Sep 2020 08:11:06 -0400
X-MC-Unique: fTTgz4cUNculkobHvh-nYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347EC18B9EC8;
 Tue,  8 Sep 2020 12:11:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B01FB5C3E0;
 Tue,  8 Sep 2020 12:11:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E20D631E58; Tue,  8 Sep 2020 14:10:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/21] microvm/acpi: use GSI 16-23 for virtio
Date: Tue,  8 Sep 2020 14:10:39 +0200
Message-Id: <20200908121050.1162-11-kraxel@redhat.com>
In-Reply-To: <20200908121050.1162-1-kraxel@redhat.com>
References: <20200908121050.1162-1-kraxel@redhat.com>
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
X-TUID: R4CHVUId+pbl

With ACPI enabled and IO-APIC being properly declared in the ACPI tables
we can use interrupt lines 16-23 for virtio and avoid shared interrupts.

With acpi disabled we continue to use lines 5-12.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/microvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index e1b86da8a92e..ca0c9983f137 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -125,7 +125,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
 
     kvmclock_create();
 
-    mms->virtio_irq_base = 5;
+    mms->virtio_irq_base = x86_machine_is_acpi_enabled(x86ms) ? 16 : 5;
     for (i = 0; i < VIRTIO_NUM_TRANSPORTS; i++) {
         sysbus_create_simple("virtio-mmio",
                              VIRTIO_MMIO_BASE + i * 512,
-- 
2.27.0

