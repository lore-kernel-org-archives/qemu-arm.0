Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp549934lfq;
        Tue, 8 Sep 2020 05:16:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL7vRGLj1W++KpqOVA3TAobZ5YYLlgRqomD4BrzLHgs1e/6RpDTL0ALJUU5HM2AGRZfp5C
X-Received: by 2002:a25:8149:: with SMTP id j9mr36244022ybm.214.1599567382831;
        Tue, 08 Sep 2020 05:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599567382; cv=none;
        d=google.com; s=arc-20160816;
        b=cutWNv1dunOiKnGnoK7jAoZWL3WFA5F/UZm4LK8ct5zbtLHrOTYuSJ7BaPleLzacZy
         Pxrktl6d9AGNDUODjm51eFUOxLWCaIU16+BLuej3uEeMKPjgME4mRIkG+gEu9cWjr5GH
         ttd3Yvjz+CONyCNjWUhaOfGqgE3cw3VDhBErASygVx/WD7bZZHW8oiQR4WkbCCtr/INu
         WJmhbuOpw8m9Lsg3HdhLNK4liPzx/iqqfikdmW3SElfzFV2T5BbPyVfEarCeiD+LTafU
         Mrqn5zwEeOwysHYYWsCeybMo6e/wdJgNGrlO2jAmAU/qX3fC/+cudg0AKZDTeCtyj7WH
         CUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TGos9Q6BbkzS4hgAU4ify92YUlJ0vxyK/3DZMvE0+9Q=;
        b=WESzWXJ5rIR//w77RpOKnRt3J0ndN/+AhL32+qyXRi7WJgBYGTRNDg/36GjXf74pzh
         o0DGocC8sHFOC3S5ZCf50OrcBmx1mIsQbN5t32Ok5o8Q63Kzc1yPaXBbzbK7/lhSTnp7
         HBP77jpCVZcQxylKyp5Dki08pUoAQWx+wcKOUs6AQESPIcNyQJnrF4CTaXIa5CJIPDaO
         bF6eB4XnABA8MJIwnDlHI3YSBk9xJLkZCVKR5rnDdETF7lNdjFKyv9cbTv0HDRvvdaQE
         JfHz4jXExc/83bNJlHsEX1KjlQg1MvONvmy6Txa/HV5PEdeZz1BZd6u9XiUTd65c4nbh
         lymA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SRKFM8fY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si17516023ybg.476.2020.09.08.05.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 05:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SRKFM8fY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFcXu-0008OI-5Z
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 08:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcTH-00016P-DM
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:11:35 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26359
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcSy-0005gz-R9
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGos9Q6BbkzS4hgAU4ify92YUlJ0vxyK/3DZMvE0+9Q=;
 b=SRKFM8fYv1l9AKDv+AKwM28/fBC2YDevoZ9YqxZgwVvHiB3+ntRnzuaRxpUBdaHqkAOZO8
 L7ucf22jABYjNMAI3bOjhz5b8Pr/gKfOsVeO5ERUKxMXcYg6zaCwUVxTb9gUqDOcTcduka
 8tThn4BX4CrBjx6Q7IOu+ijFqDFyn6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-mvcsfWvhPeW1Kq7dGhGexQ-1; Tue, 08 Sep 2020 08:11:10 -0400
X-MC-Unique: mvcsfWvhPeW1Kq7dGhGexQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC551107B26B;
 Tue,  8 Sep 2020 12:11:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A83FF5C230;
 Tue,  8 Sep 2020 12:11:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6737031FC7; Tue,  8 Sep 2020 14:10:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/21] microvm: enable ramfb
Date: Tue,  8 Sep 2020 14:10:50 +0200
Message-Id: <20200908121050.1162-22-kraxel@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 00Mq4Gdp8TPk

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

