Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EFCCA601E
	for <qemu-arm@archiver.kernel.org>; Fri,  9 Oct 2026 12:16:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xF9W7-0001q8-TY; Fri, 09 Oct 2026 08:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xF9W6-0001pu-5n
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 08:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xF9W4-0004G9-4g
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 08:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791548158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TgQGJQjoymALL3FlcbtW3uZTm+e1krOx3xnShKHw5YA=;
 b=OlSOVmusrMLvDU525uUEJR1tQi4irkxEbWAviuqQ/b9Ymg3ZbChcqmRuIDOFmN5wq+Bw6p
 iUJ9vFspqBCtrtNtbVFdupi+3CzcuYQjaoVLf8nW0xnLHkkO7AiGVTeY4y2RAv1IrmQXue
 cBZ5Ss/m8SgwBp0EuQteupzmS7kdfd0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-JhGBji1VPU-1FPqxRraLLg-1; Fri, 9 Oct 2026 12:15:57 +0000
X-MC-Unique: JhGBji1VPU-1FPqxRraLLg-1
X-Mimecast-MFC-AGG-ID: JhGBji1VPU-1FPqxRraLLg_1791548156
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a17c024b89so36387625e9.1
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2026 05:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791548156; x=1792152956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=TgQGJQjoymALL3FlcbtW3uZTm+e1krOx3xnShKHw5YA=;
 b=P9N5yQuQmCjUwAM74ytsX58jpWTjT1hbvtYrJBe/18kSOnnxhrj6EC9rr6k5Puj6M7
 tmSS4XMWKfg8NmdxOQJQmfKtjFjeKCM/9uNsvLapg39pHxReqyURwUko6jCMzjhLge3G
 ZgldRZVPQIHvHPnBVDxjCt2drYQcsxytWgj0+EVaXmHjOts4DEHCeUa+BJH6Wbx7Ez+3
 oa3Xqoszzt4SnmO8cKD4sDttmo/ZAXJtscqrmH3jhpQlaIYUtFiwR1QFtVw5PYkrRnhi
 yoGm1kduM9tSu0xkjhe0jSn7hmEF+PcqCWWqjXtjtIsk4nagwwKAtNbswZSTN4K1LFvR
 nksw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw0rTmHn3wqYHXG9B/HZ2W6GpqPzV/Dg4QUdKJ5ak5gNqVh2dv+N+zuZ32B4jTzibXIvuC2neMrkg==@nongnu.org
X-Gm-Message-State: AFuF++mAHG9RPNfaq5wu4g4AZ4CLjSQ15/OqyY8cYLwKI3wWYuCBNc8R
 GYzeMbLoIh+ttOuwcWufRHB4slquy33+inlicS4FRSP45gIGngu7aZv/+DZdPDs6tvWsk28n/A7
 P6wMBphC6qFtxirBKi41ABC8wCr3GlAdpDwbBedr5NAPvDoPBHgmBpQ==
X-Gm-Gg: AYBFou1wkYrl5NiqGlkosExK0TGYRd+VkRBRh9R/BJpLsBJYY+VPRbQa715WQPu4VA6
 WMnDLEWKjZnflVlqMDJhSbNNAyyW3YneXpD/kOOSj1G6XQBPIbkwwWm36cKL6VBjSAnfKGpLMba
 qV62/tT1wRrNZVl999WMo8ZFhuO92ELo2se8YYe93w7hayUKHrumdoXARdFI6fG6Yab2C+ZwCNp
 iTCoU/VoRyuKAFPYC6+4U08PnocswdodhzRfNTmXwL6VS58EkTjheMcvluTuZLszuZ7X8yd0DVw
 QfMnF7LPf6D/Iu9qqevQJUptYhT+u7EgfUJeMI16CAg9bNsZ5mGDBqFdCTo6uBf7ho6ss0clpw=
 =
X-Received: by 2002:a05:600c:5489:b0:4a0:1c94:7042 with SMTP id
 5b1f17b1804b1-4a18e4a5244mr33306605e9.8.1791548155891; 
 Fri, 09 Oct 2026 05:15:55 -0700 (PDT)
X-Received: by 2002:a05:600c:5489:b0:4a0:1c94:7042 with SMTP id
 5b1f17b1804b1-4a18e4a5244mr33306275e9.8.1791548155506; 
 Fri, 09 Oct 2026 05:15:55 -0700 (PDT)
Received: from x1.redhat.com ([151.41.232.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db94e4018sm3687140f8f.11.2026.10.09.05.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 05:15:53 -0700 (PDT)
From: Gustavo Romero <gromero@redhat.com>
To: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/virt: Use TAG_GRANULE when creating tag memory
Date: Fri,  9 Oct 2026 14:15:45 +0200
Message-ID: <20261009121545.241772-1-gromero@redhat.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -dY2Ez5GZ0bU4bCM4dKjMk_vkzOruaU9qHn2XkRQk5M_1791548156
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use TAG_GRANULE definition when creating the memory region where the
FEAT_MTE tags are stored.

Signed-off-by: Gustavo Romero <gromero@redhat.com>
---
 hw/arm/virt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9d192515d8..0d56197dac 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2308,8 +2308,10 @@ static void create_tag_ram(MemoryRegion *tag_sysmem,
 {
     MemoryRegion *tagram = g_new(MemoryRegion, 1);
 
-    memory_region_init_ram(tagram, NULL, name, size / 32, &error_fatal);
-    memory_region_add_subregion(tag_sysmem, base / 32, tagram);
+    /* We store 2 granules in 1 byte. */
+    memory_region_init_ram(tagram, NULL, name, size / (2 * TAG_GRANULE),
+                           &error_fatal);
+    memory_region_add_subregion(tag_sysmem, base / (2 * TAG_GRANULE), tagram);
 }
 
 static void create_secure_ram(VirtMachineState *vms,
-- 
2.47.3


