Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1991662ejq;
        Mon, 8 May 2023 05:04:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4G2rl893Xn8l5MBvJd+NJWxk2Lz2daAOPjdh7UWvUhzarjeOUSkxFgBPUqgKb8+z8YuR2S
X-Received: by 2002:a05:6214:2421:b0:5a2:abf1:7d33 with SMTP id gy1-20020a056214242100b005a2abf17d33mr15234398qvb.50.1683547445269;
        Mon, 08 May 2023 05:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683547445; cv=none;
        d=google.com; s=arc-20160816;
        b=NQaP6arrcgl+XNnQPJu6FsSuVQj5+xR6JrKRu7dzSO/CVZA/P/7e5orjzIGi4iHvkk
         V8mU1aFGmlWZmNOeTFVPOyTidyMgoEnjmcl6h++PDSAap9YL+7uiQfljJWIii10YiLu7
         XDAzOZvjtZ4JrDU1kWTQ9ytJ6cmBoatOE5q4GXd+waLIj9+3xj+oJ8AFVtwS3u3Sk+H+
         irxdn94nDoGW/+o20vCgUfG04g4Mou2bgSmyopfCPRoT1Ch4V5iml0/M+JMs2EtVscj3
         D5e/Cx/XJoGXa8vBsjzKnZw8PEwS+paFb6P65u8+eTytpq6NWLL0qLHmcw9YhfX/1g4c
         8CsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q5ILRHrMmCfKsgRxnJL6cqWZzJuLqnLejCVQtrE6ims=;
        b=lP5Yvf6JgEQHanP+irr553j9L8e+xKlcuegITpM7+iL2TG6d42Jk1pg9Ry5wXnvqUt
         e0Z0TkDDtrYwDUo4k+VMsfwcASqhSBtTf5P4DsQWsoSDEo6tJWstyVl2qesNGTCSzYX5
         0YkQpTL/WVJFTMQK1waDcbWGnND/Cr2JZsNJRITu5lT5Z8AuLA/O4sfeEtbCeD0bpvSZ
         pqMwfadMD3QNu6FWV1gVe7yIMy/nO3/sjPxoDkQ0pfrt6zac3mI8qfTXtjtiY+W4SROE
         tIScILB4HrnV5B6cOse5Og6kw6wRSpwIx5sqENSilRNDxrFmF9CKjENy2vsI7B3ONdiv
         kLnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SEy5U4wf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020a05620a071200b0074ace3fa4aasi1573849qkc.646.2023.05.08.05.04.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 05:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SEy5U4wf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvzaZ-0005RR-UA; Mon, 08 May 2023 08:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pvzaQ-0005LI-3P
 for qemu-arm@nongnu.org; Mon, 08 May 2023 08:03:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pvzaM-0005Kl-57
 for qemu-arm@nongnu.org; Mon, 08 May 2023 08:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683547400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q5ILRHrMmCfKsgRxnJL6cqWZzJuLqnLejCVQtrE6ims=;
 b=SEy5U4wfacg5SUod6tb6a56KwkC548+75GzR15RR7xFjJDlH3tM/u0UczyasbdFwm/NByF
 NkjnD7aYSK3KnczTbWsj2Alb/Hzn5r52V1Q/IO5gyD1KDQzjxpqjt4UYs7dV9G/gP04gJf
 HOrLUQw+wxNVpqt3s2igROm/35aSTg4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-Q3TDGavWP5GwVqRiWRh6fA-1; Mon, 08 May 2023 08:03:17 -0400
X-MC-Unique: Q3TDGavWP5GwVqRiWRh6fA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CE112999B28;
 Mon,  8 May 2023 12:03:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF02EC164E8;
 Mon,  8 May 2023 12:03:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/net: Move xilinx_ethlite.c to the target-independent
 source set
Date: Mon,  8 May 2023 14:03:14 +0200
Message-Id: <20230508120314.59274-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BwPZqOeyyOEP

Now that the tswap() functions are available for target-independent
code, too, we can move xilinx_ethlite.c from specific_ss to softmmu_ss
to avoid that we have to compile this file multiple times.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/xilinx_ethlite.c | 2 +-
 hw/net/meson.build      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 99c22819ea..89f4f3b254 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qom/object.h"
-#include "cpu.h" /* FIXME should not use tswap* */
+#include "exec/tswap.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/net/meson.build b/hw/net/meson.build
index e2be0654a1..a7860c5efe 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -43,7 +43,7 @@ softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_emc.c'))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_eth.c'))
 softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_fec.c'))
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_llan.c'))
-specific_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'))
+softmmu_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'))
 
 softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c'))
 specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
-- 
2.31.1

