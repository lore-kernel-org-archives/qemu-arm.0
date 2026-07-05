Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC761C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 14:42:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgNww-0006gl-6d; Sun, 05 Jul 2026 10:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wgNwv-0006Va-3f
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 10:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wgNwt-0001T1-N6
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 10:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783262159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DNcvRMiitysJcmRtUZXzlgXLa0I8VMObuPV+Psg+jNU=;
 b=NSEI0HdKrBErJnH0CmICSZMc7rDV9Qys/ctmUnfLpC70blcuCCuVewTUUSRNnOmE+8yqAg
 c2rRGCBy4ePN+q8fpt/6/EQ96YOBOvW+lDMMds6XebIGRyCM0ogicF+kIyvLpTZr4Hcfhs
 d+Pb3Zd+Et73z+9FlaNRKYGa6JM+dDU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-f7WqUemNOAalq9UyP4vnVg-1; Sun, 05 Jul 2026 10:35:55 -0400
X-MC-Unique: f7WqUemNOAalq9UyP4vnVg-1
X-Mimecast-MFC-AGG-ID: f7WqUemNOAalq9UyP4vnVg_1783262154
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490a767c7dcso16875845e9.2
 for <qemu-arm@nongnu.org>; Sun, 05 Jul 2026 07:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783262154; x=1783866954;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DNcvRMiitysJcmRtUZXzlgXLa0I8VMObuPV+Psg+jNU=;
 b=tOpdubcwexUv9Mdjv4m2zmUoZO4W53PAGeZnfzCgOgo7LD26vmZhX0EBwDOai20pZJ
 Hn8TCs+zVYf0VmnYHDMbSgSJ78bQShwb7PMsTSDCCDb4Pf89qntXHLlAQgbtpJ4LWTTM
 JCMnnj5ir4lNQRIiTYJG1uludezRYoY7Fp24/1rPcHM6eqlf/qSb/ZeSzK84sQPhg2KG
 E4N/DET2Y3drW9Sm1OEUWFiyrF+tw2IgqRvN/n3JbnNku5xntspe13dnESCx3CITvn7d
 p55L+qKCPuoIc2IZ35x1XI08+KU58Rpl31TICx8ScTEgZAoJP9qlmWo0/TcDYskWK4Fl
 GbvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/574H/ZhAShGDhZNtOS83FRNti5a+H3KHhlC1iTGYd5cdxAAbOjAmLGSC1jnS1i0XYgcOsMZl9rQ==@nongnu.org
X-Gm-Message-State: AOJu0YzeRc5pkn7uCs4wfHsUPQp67u98U5hLFnLxmC1z82vTlgVxXvGJ
 U2AQtXbj0LjeLMBqJIBzq/NoCzDxuv5XHZIjHwg1SlC2ZiXVugt2un5Hs/bKIADsbxKV2djQhGB
 La9/EPDJAIuT67/9yVOQkUFCPFrSBM6CS62X0WesqBWPqP6rXuoN3aA==
X-Gm-Gg: AfdE7ckTYg9qPQ2xdRIhgsThm96Rs4sCbKrY1rev6RF8HEVMfyBszMMbjv6IAi5zznZ
 gB8ZWBbKs89CNNsUstPC8YlY3OujcVXTQKFb8d4Ws0ExvLYvpEg5iP/IOCBjKluc0xjQMiEEEro
 r3Xoryyb0Jwy7Eo/leg11QjZMIOBMVVq2OlM4lTRi6Div8zLlLtbDwRx/gofQf/GuzPkEMlU6N2
 rphCQlDWv9PyYs0bUs/DweNDvwJG9nTnhK+I5J909fAFyiqV0HkT2wrJNUfXzq2M6NfQwrDzhMV
 Gs1AtFcdvsZtxp4WTjjNNj1CT64W5Ye4gtxkZnXbhKr92zFSvdXksw8rB/4eDdU0CcDwU23u8MV
 22ZksZ8piq0lmHwdGl4TlUZGLUsNxtDR3
X-Received: by 2002:a05:600c:528c:b0:492:454c:347c with SMTP id
 5b1f17b1804b1-493d11d3bc2mr84590495e9.7.1783262154419; 
 Sun, 05 Jul 2026 07:35:54 -0700 (PDT)
X-Received: by 2002:a05:600c:528c:b0:492:454c:347c with SMTP id
 5b1f17b1804b1-493d11d3bc2mr84590175e9.7.1783262153952; 
 Sun, 05 Jul 2026 07:35:53 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bef183e7sm376987125e9.2.2026.07.05.07.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 07:35:53 -0700 (PDT)
Date: Sun, 5 Jul 2026 10:35:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org
Subject: [PULL 29/44] arm: sbsa_gwdt: rename device type to sbsa-gwdt
Message-ID: <5cb6dfc12d36ede1f79deb58385e324e7dc1cce9.1783261895.git.mst@redhat.com>
References: <cover.1783261895.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1783261895.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JxzNZSajgIcLpI2ET_DGruS-2blEfpIlRj3ZFfCoPdE_1783262154
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Use hyphenated name to follow QEMU device naming convention.
Migration compatibility is preserved since the vmstate name
is already "sbsa-gwdt".

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20260702145856.1539572-4-imammedo@redhat.com>
---
 include/hw/watchdog/sbsa_gwdt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
index 307a4f291a..8941dcff9e 100644
--- a/include/hw/watchdog/sbsa_gwdt.h
+++ b/include/hw/watchdog/sbsa_gwdt.h
@@ -16,7 +16,7 @@
 #include "hw/core/sysbus.h"
 #include "hw/core/irq.h"
 
-#define TYPE_WDT_SBSA "sbsa_gwdt"
+#define TYPE_WDT_SBSA "sbsa-gwdt"
 #define SBSA_GWDT(obj) \
     OBJECT_CHECK(SBSA_GWDTState, (obj), TYPE_WDT_SBSA)
 #define SBSA_GWDT_CLASS(klass) \
-- 
MST


