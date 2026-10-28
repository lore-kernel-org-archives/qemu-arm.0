Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787E8606A324
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 17:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IKAMUPnk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM7HW-0003yf-KF; Wed, 28 Oct 2026 13:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xM7GS-00018q-Kb
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 13:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xM7GK-0003uE-M9
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 13:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793207791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+GuvKRsV+a6+GbEa+CNhmAoLlvqUeipOH4q8uieDCU=;
 b=IKAMUPnkgPiepu4xOGc230gIldzfLleUlB+ThukMo5AFOIQ7cVxDA+cNH3EhXHo2BTJKAk
 +5r77Mn4cXXLgMXE2FFLsfamgkMxr9SnbUcPzSs9eIfLWvoDUubfZ6S3vRciKSXsUpKcxs
 6PkmoqVTUMD7yPMmVdFbbC6gh8Ae6Ms=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-HVYiMtMBNA-5TrhATLWVuQ-1; Wed, 28 Oct 2026 13:16:27 -0400
X-MC-Unique: HVYiMtMBNA-5TrhATLWVuQ-1
X-Mimecast-MFC-AGG-ID: HVYiMtMBNA-5TrhATLWVuQ_1793207786
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-48e0c896d05so1008688f8f.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 10:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793207786; x=1793812586;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=l+GuvKRsV+a6+GbEa+CNhmAoLlvqUeipOH4q8uieDCU=;
 b=cKGgn9sMTDkURDwR/VqaU2zSuqUkH7fIUp8/tU5JpnQcrY9DJHvIq49dwxUnXbRj3y
 qw0+bHwXxmSy/uu7nMrkDqbMDtqxStuw+Qnt3wSrbTqZ5WFAgPQwHz5VCSR2R1dLl9Dn
 K/98UR4uRYENLEOm/07qTbADqyWh3V8f3GqrXpQAaRnjNTTAohzPQ2zGlgNbnsH4lxpO
 bTSo+VuQX0i4myiiqhkHmsD2Tv6ruP7Rq6ZgFH9kRV5sl1ctjNq6MbrzkNh3JoMRWUnb
 vTXk+IgVv/rW6h65VJIVdqT7CHd4MSVCNOTE+saEYlDATOL5GTcBtg/UKtLa2RtJSG5X
 uVvg==
X-Forwarded-Encrypted: i=1;
 AKwUvByHmYoskBgLS0EF8SNKGjraW+82Bmz33lgZkwkPl1wjrE7I9a5dtRfTl/XZidI6GLCTjnbJXf3FxQ==@nongnu.org
X-Gm-Message-State: AFq9FYLbA7d3vbIFp9yWnSnXnOAjqhpmT0I7okXwyRbOqRbV69x6UwBi
 suK9T4t3JwFg3bnyreJM8LccKU6m+NwQZDcogO3+pizmyl/4bGCYmrnQcLzTlJQJNoDAwHh6a4h
 iMrzg/wBg+NKQCzAcZEQA4fQiMg1wQpnIOcZQjrskcrp0jjitlCiFqRgQj/jT3A==
X-Gm-Gg: AYBFou3l106Q9u/BSgHI6HvVzG+5L0PbUxvLp1t7m3aLcOCVOka5IReGA6fpfgYVpwN
 eCL4j2RULxopSJd78UHUXvY/D7pV3glGYUHAMeq0M2ZHiEc0hTIapR9KWk3ycXBGyzLchb0HYpj
 nIbwsS9+BNESBrIBdhO0bBwYjmCUFLsyPA7Jj0U5muR1oLSa1ITA4v83sUCqJf7XQDnpjWj49P2
 v5+JtLxe0iKqU7o44d2SGg2VxXP/3Tcw9GeU4Kr3NFqLXwNu4OHO6NwHAVZPZP3Kephe4WP2mdn
 fHHDj+5tOOgF0rE4sV8kIXMLKMNDpUC4QZ/BrBs98aoyVDgweAEVdAnBsnt5nSZXuaKlGUJAeqI
 ges+5ldzw4gXdZqdAMFw7zJGExSaMpf5xMoIn4LQE
X-Received: by 2002:a5d:5f85:0:b0:48e:bf0:35c with SMTP id
 ffacd0b85a97d-48e5d2e749cmr8031907f8f.13.1793207785409; 
 Wed, 28 Oct 2026 10:16:25 -0700 (PDT)
X-Received: by 2002:a5d:5f85:0:b0:48e:bf0:35c with SMTP id
 ffacd0b85a97d-48e5d2e749cmr8031790f8f.13.1793207784676; 
 Wed, 28 Oct 2026 10:16:24 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb99esm28759276f8f.23.2026.10.28.10.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 10:16:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:16:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PULL 55/78] hw/arm: remove pci-bridge/pci_expander_bridge.h from
 virt.c
Message-ID: <2011fb7a587da19e6e9f64e39ce0647698985f64.1793207602.git.mst@redhat.com>
References: <cover.1793207602.git.mst@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1793207602.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PIMYmupsD4JhyyatoK1GMHNapu8sjP263RM0z1uA-1s_1793207786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel P. Berrangé <berrange@redhat.com>

This include is redundant as the function is declares is not
referenced.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20260928095646.3555447-2-berrange@redhat.com>
---
 hw/arm/virt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0d56197dac..3ab3ad8c3b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -58,7 +58,6 @@
 #include "qemu/module.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/gpex.h"
-#include "hw/pci-bridge/pci_expander_bridge.h"
 #include "hw/virtio/virtio-pci.h"
 #include "hw/core/sysbus-fdt.h"
 #include "hw/core/platform-bus.h"
-- 
MST


