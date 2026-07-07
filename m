Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5A7C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 08:52:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh1W6-0007ij-Id; Tue, 07 Jul 2026 04:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wh1W0-0007hK-MV
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 04:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wh1Vz-0008Gm-3Y
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 04:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783414250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8pXUedqGaqjSdjg6vALRkYIP0FPwPiBAZc5IUMI6tOI=;
 b=RAghyDtVLUQXpXmzHasN5/4KK0CdpYXGIesm2PtUHGHaqTjSJLvOFj80MMLPOuYRQl2XYh
 Sd9BKJhMraLtf4WoD/0+EwvL6UlDXNgsWKTqFXLGgsbDizqtrLnQ3/GsGUwKExSR4iKcFq
 a2l/iS1i+9Zw+pxdzgG0ql8VdxpYaTU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-mWhgRZGOPbCuRBNiSeC0QQ-1; Tue,
 07 Jul 2026 04:50:49 -0400
X-MC-Unique: mWhgRZGOPbCuRBNiSeC0QQ-1
X-Mimecast-MFC-AGG-ID: mWhgRZGOPbCuRBNiSeC0QQ_1783414247
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 87FEF1801326; Tue,  7 Jul 2026 08:50:47 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.50.66])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 538DA1955F71; Tue,  7 Jul 2026 08:50:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, berrange@redhat.com,
 skolothumtho@nvidia.com, nicolinc@nvidia.com, nathanc@nvidia.com,
 philmd@oss.qualcomm.com
Subject: [PATCH v3 2/5] hw/arm/smmuv3: Sanitize SMMU_S_STRTAB_BASE_CFG.SPLIT
Date: Tue,  7 Jul 2026 10:49:34 +0200
Message-ID: <20260707085028.165557-3-eric.auger@redhat.com>
In-Reply-To: <20260707085028.165557-1-eric.auger@redhat.com>
References: <20260707085028.165557-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: aeHUFE35K8Rt9zr3wrn2jYg0Co8ct7h_zns25jK22cI_1783414247
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Currently the guest value for the SPLIT field is not checked.
Also the spec says that values different from 6, 8, 10, respectively
meaning 4KB, 16kB and 64kB leaf tables are reserved and behave as 6.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3632
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Shameer Kolothum <skolothumtho@nvidia.com>
---
 hw/arm/smmuv3.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 10c67645a57..c2946d8d23c 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1688,6 +1688,13 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
         s->strtab_base_cfg = data;
         if (FIELD_EX32(data, STRTAB_BASE_CFG, FMT) == 1) {
             s->sid_split = FIELD_EX32(data, STRTAB_BASE_CFG, SPLIT);
+            if (s->sid_split != 6 && s->sid_split != 8 && s->sid_split != 10) {
+                /* Other values are reserved, behave as 6 */
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Invalid STRTAB_BASE_CFG.SPLIT=%u, use 6 instead\n",
+                              s->sid_split);
+                s->sid_split = 6;
+            }
             s->features |= SMMU_FEATURE_2LVL_STE;
         }
         break;
-- 
2.53.0


