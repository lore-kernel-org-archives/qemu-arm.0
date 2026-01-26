Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F2DD19503
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 16:56:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkPsE-0000Eh-SN; Mon, 26 Jan 2026 11:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkPs9-00008G-Lk
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 11:55:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkPs8-0007Ph-6d
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 11:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769446527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWJn6YJlLEGl2ks33lv2Ly3uF4Vrqu/Pt1MV9VqjSUM=;
 b=dvxEUyGD0cLxnwEqZKYQmT2MCwhCLNm7WhKEHa5RPFuvGv1lWxGHTFpurnoG1/xtj8nVs+
 jXpIxYqzD1N2B5gVkpHVDuYXWN38Fwd4eM6K7Rw+mwWwt8RjyMb/hpz7b2BUErJuV6P6lp
 Cyy+//SFya118hNo4tTrVBFKHk3fYUQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-AxE59CWwPZKEV63BzAps5w-1; Mon,
 26 Jan 2026 11:55:23 -0500
X-MC-Unique: AxE59CWwPZKEV63BzAps5w-1
X-Mimecast-MFC-AGG-ID: AxE59CWwPZKEV63BzAps5w_1769446522
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7DCE619775B0; Mon, 26 Jan 2026 16:55:22 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.18])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6D508180066A; Mon, 26 Jan 2026 16:55:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, cohuck@redhat.com,
 maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com,
 gshan@redhat.com, ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: [PATCH v6 06/11] target/arm/cpu: Implement hide_reg callback()
Date: Mon, 26 Jan 2026 17:53:05 +0100
Message-ID: <20260126165445.3033335-7-eric.auger@redhat.com>
In-Reply-To: <20260126165445.3033335-1-eric.auger@redhat.com>
References: <20260126165445.3033335-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Check if the register is hidden.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Sebastian Ott <sebott@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6e1cbf3d614..76d013e6c4b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2360,6 +2360,11 @@ static const TCGCPUOps arm_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+static inline bool arm_cpu_hide_reg(CPUState *s, uint64_t regidx)
+{
+    return arm_cpu_hidden_reg(ARM_CPU(s), regidx);
+}
+
 static void arm_cpu_class_init(ObjectClass *oc, const void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
@@ -2389,6 +2394,7 @@ static void arm_cpu_class_init(ObjectClass *oc, const void *data)
     cc->gdb_get_core_xml_file = arm_gdb_get_core_xml_file;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
+    cc->hide_reg = arm_cpu_hide_reg;
 
 #ifdef CONFIG_TCG
     cc->tcg_ops = &arm_tcg_ops;
-- 
2.52.0


