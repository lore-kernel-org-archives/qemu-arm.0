Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D01EC145E
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 14:41:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxQui-0001Xx-Vi; Tue, 03 Mar 2026 09:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxQuf-0001WS-Eu
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 09:39:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxQud-0002Bq-VL
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 09:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772548791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2DtoZq5WsfdwG1vuykHjnRxWfUsfapLYRVd8mVgDBo=;
 b=CloOo4CvwhkNb8ZQf14X/1R+IUIES8oYWJOG/UKm6In3fjGZ+zKDgERklyX57mWY6NLjjR
 sW0JdRSVh03Xh3tcXNNKDOXVSW8nNb+QhuKZMh4ZzkO8EEu5SyMM2BZs/M02P9IJlSgiM4
 gWyzJ+9ig3ZqRGKpAwF7T//xQgLXi18=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-yxDFXl-uOBiTgDH5gvuRvA-1; Tue,
 03 Mar 2026 09:39:50 -0500
X-MC-Unique: yxDFXl-uOBiTgDH5gvuRvA-1
X-Mimecast-MFC-AGG-ID: yxDFXl-uOBiTgDH5gvuRvA_1772548788
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ADABD19560B7; Tue,  3 Mar 2026 14:39:48 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.89])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 67AD630001BF; Tue,  3 Mar 2026 14:39:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, cohuck@redhat.com,
 sebott@redhat.com, peterx@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: [PATCH v2 4/7] target/arm/kvm: Tweak print_register_name() for arm64
 system register
Date: Tue,  3 Mar 2026 15:36:36 +0100
Message-ID: <20260303143928.1747116-5-eric.auger@redhat.com>
In-Reply-To: <20260303143928.1747116-1-eric.auger@redhat.com>
References: <20260303143928.1747116-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: jalczlQdSUxqbBFiRx5Q40UbRd17Hx-P7ZIjvkmXN9U_1772548788
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 27
X-Spam_score: 2.7
X-Spam_bar: ++
X-Spam_report: (2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.322,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=1.141, SPF_HELO_PASS=-0.001,
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

As opposed to other register types, arm64 system register decoding
is not introduced by any 'register' mention which can lead to
unfriendly user-facing traces.  Let's add "system register"

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index cfb46015d48..43dab246097 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -921,7 +921,7 @@ char *kvm_print_register_name(uint64_t regidx)
         case KVM_REG_ARM_DEMUX:
             return g_strdup_printf("demuxed reg %"PRIx64, regidx);
         case KVM_REG_ARM64_SYSREG:
-            return g_strdup_printf("op0:%d op1:%d crn:%d crm:%d op2:%d",
+            return g_strdup_printf("system register op0:%d op1:%d crn:%d crm:%d op2:%d",
                                    CP_REG_ARM64_SYSREG_OP(regidx, OP0),
                                    CP_REG_ARM64_SYSREG_OP(regidx, OP1),
                                    CP_REG_ARM64_SYSREG_OP(regidx, CRN),
-- 
2.53.0


