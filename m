Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33E4C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 09:13:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weqzm-0000tv-U4; Wed, 01 Jul 2026 05:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1weqzZ-0000p5-6W
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 05:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1weqzX-0007I6-Qn
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 05:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782897141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KLpn+m9YMeodSm25nI4+qu+m+vFGX6NqaERkuGOrTnw=;
 b=jHsbYPwDSulAJMHZ2k8Xl51hrs701d5mc/v7WB6CldcR5x7v8a6qYegAnRSgg65yZ8iOqs
 GowHGIVlaeGcdZK5u3/H1MJgUJm5WkviKvOyUbVzV0R2Lt0uyXUsl/Gx6GYSk2Sf9GTCGF
 YgM5t8OeWI5tBAAS+vw9z4NdpuoH2aA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-313-M3kvCUqzM42NyXYvoOSNrQ-1; Wed,
 01 Jul 2026 05:12:18 -0400
X-MC-Unique: M3kvCUqzM42NyXYvoOSNrQ-1
X-Mimecast-MFC-AGG-ID: M3kvCUqzM42NyXYvoOSNrQ_1782897137
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 044F11933F88; Wed,  1 Jul 2026 09:12:17 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.33.117])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 45D91180060E; Wed,  1 Jul 2026 09:12:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, berrange@redhat.com,
 skolothumtho@nvidia.com, nicolinc@nvidia.com, nathanc@nvidia.com
Subject: [PATCH v2 0/5] SMMUV3: STE lookup fixes
Date: Wed,  1 Jul 2026 11:11:37 +0200
Message-ID: <20260701091209.2860306-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: dBPkmWHijLRZVBbrAuOPiOSchw3xXXxtLM5HTV0wSac_1782897137
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The current code fails to sanitize SMMU_S_STRTAB_BASE_CFG
LOG2SIZE and SPLIT which are used in the STE lookup. This
could potentially lead to wrong shifts/masks in
smmu_find_ste() and does not fully comply with the spec.

Also the series fixes different issues related to strtab base
address alignment computations: off-by-one mask, unchecked span,
missing L2ptr base address alignment. Those issues
were not visible because the guest kernel does what it should
but better comply with the spec.

Best Regards

Eric

Eric Auger (5):
  hw/arm/smmuv3: Fix off-by-one bug in alignment strtab mask
  hw/arm/smmuv3: Sanitize SMMU_S_STRTAB_BASE_CFG.SPLIT
  hw/arm/smmuv3: Sanitize SMMU_S_STRTAB_BASE_CFG.LOG2SIZE
  hw/arm/smmuv3: Check L1STD.SPAN
  hw/arm/smmuv3: Enforce alignment of L2Ptr according to the span

 hw/arm/smmuv3.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

-- 
2.53.0


