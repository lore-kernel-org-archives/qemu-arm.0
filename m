Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0475FCC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:33:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIdm-0000gO-Iw; Thu, 15 Oct 2026 06:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdd-0000Zz-EE
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:24:41 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdZ-0003Ev-DQ
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:24:39 -0400
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4956869750eso33947265e9.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059875; x=1792664675;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wyuy2rktXggsAmL76/K7kLk/zQD6P6G+cIxBCgNKHGg=;
 b=lEceEAu+KIPypZaVzVgJPLR7vF8x39ALLirfByu6OT9cvPNlVCYhEbXFfrGTUD3qVz
 Q3YHwKJ82Yrhs4lGVuiIf8jKj5u2IwNKeeUixkSlILj80IquShprDo3Sw0lAsYfYd2mS
 jKjTjqnKEDj/qgprgg5o/6zU0svC85bhsuC5PJB6kyRQUons+jSfPq30OuLULeraHTFc
 WeHBjpLcFOTarkJ4amdD8cWOYG3LPgT/0ahEAvvP879/EPZp4FdSfptft2t2V7BFF29L
 r9SipM3j21EgYdEZIFJSmPpxJpJ7451GblmnWKT/DIsBlo3Wlg0wl9z+mndkYbnc2Rrt
 PHyA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3PMV5wvyLlrFAkS2E1VJeYGX2IMW1yIttM/vz35nsDjiTMtsZIlgoU1/wqcHWjFRqnbHxFwwV+Q==@nongnu.org
X-Gm-Message-State: AFq9FYIWX+wXMR1pjC8KETkziEVNXe3QUp2zm4kG1C4CxmcKq3my6SJa
 0/o4voJi+pn64ksga+3snbxBhjS6iINgD2sjaxis+pNOaCCG1jlrrSrS
X-Gm-Gg: AYBFou0x3jrJg1v4AbTbc+CiVUO04lPihl6qoezxbCn+pfJtTbySKNQRTjuO5v+EicL
 rIHYm+h8J8PMuloUSfb+/XT1KxTuSIwNowWacknxzWfIz3DfKvpQmWJnrjciSeWkfl0gs8HDjad
 4k/tkueWSVX4d2vGIguOvGmL6BvsD5xcOTXUB393J7HeRCXyewRs03hRRGUz98gY94sk8XE3YrX
 zg7hT05TkeJBbDfDP8bUpHXygkyoENMP/l7t9/0tao/G7zzgd1vWX3vUzsxFxCgelQkXGI8MHNZ
 +PVFzcP8n/2aLKIUgWn9ic/LAelsSYkzxU76S0FqVXfgAJnP1OY+iwuWT9NIPDwqntSpygTjhbi
 boi2eVNGMEl0GKIPmAmtbrCECCc0pI7MDyNLrg195jwF37utnEVYhR+WIzOvIOkLPhD5jChBWI+
 S1URJgLlZBA3R0W1j3UoviAPBVn1EtZV0knieJ4ho5QXhIfV3jmJsfJJG38yNtTTBTCGzNFHnwF
 +0lODA6GWvtSb0DY1djBnVekKJiNzux1HAuTFuUEbUc3A==
X-Received: by 2002:a05:600c:3e83:b0:4a1:6d35:779a with SMTP id
 5b1f17b1804b1-4a18e446880mr341688695e9.3.1792059874580; 
 Thu, 15 Oct 2026 03:24:34 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd66ab3dsm56129535e9.2.2026.10.15.03.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:24:33 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:51 +0200
Subject: [PATCH v3 04/50] hw/i2c: pca954x: drop unused header inclusions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-4-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056474; l=892;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=GLj3AqYRa9mINpG5YoTmBh1sQwRVDiaGrNDDg2Hh/b0=;
 b=ZY5YmJ/6jWLNSEgZHRfp0lhNgeO69qtpIB0iK7KytOQABfNNQ94S50cQDVhgqbbeFgyP+4sbN
 cmxVIJjz6hZAAmOe26SjjoBtMCL+btJbha9Yvlrh/tcT6vz8yJo0eF1
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f42.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The qapi/error.h, hw/core/sysbus.h and qemu/module.h headers are
included but not used by i2c_mux_pca954x.c. Remove them.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/i2c/i2c_mux_pca954x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index c603446028..c8e75da8b2 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -15,15 +15,12 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
 #include "hw/i2c/i2c.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_slave.h"
 #include "hw/core/qdev.h"
 #include "hw/core/qdev-properties.h"
-#include "hw/core/sysbus.h"
 #include "qemu/log.h"
-#include "qemu/module.h"
 #include "qemu/queue.h"
 #include "qom/object.h"
 #include "trace.h"

-- 
2.53.0-Meta


