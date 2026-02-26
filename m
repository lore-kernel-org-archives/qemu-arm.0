Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D6FFC591C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 10:03:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvYD0-0003Y6-Bl; Thu, 26 Feb 2026 05:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vvYCs-0003WU-Vk
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:02:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vvYCr-0000YP-HY
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772100172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UERnRow78tNXZH3PM/1r8gyTmTmba5HczdNX9vA7D/s=;
 b=IMdjZEcc/+xw21Z+BsBKk3h1mxe70njXIFu0KawGFKshCz+4ltXLpxb1XOjEQWcuD2q4BG
 0pHCJorvR3G8WAUKpGFoaCmA2CGltH57dry4dRWRigXW/8wd5OpybVOPS2aaO5lVnJAlbW
 lfWYKCb4vydKgoYGbdwIUHRAED+jr9I=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-hsHYZnoTMDq2kcVx44mL_w-1; Thu,
 26 Feb 2026 05:02:51 -0500
X-MC-Unique: hsHYZnoTMDq2kcVx44mL_w-1
X-Mimecast-MFC-AGG-ID: hsHYZnoTMDq2kcVx44mL_w_1772100170
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 183A718003F5; Thu, 26 Feb 2026 10:02:50 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.35.26])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0C8FE1800677; Thu, 26 Feb 2026 10:02:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, cohuck@redhat.com,
 sebott@redhat.com, peterx@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: [PATCH 3/5] target/arm/kvm: Export kvm_print_register_name()
Date: Thu, 26 Feb 2026 11:01:31 +0100
Message-ID: <20260226100232.500781-4-eric.auger@redhat.com>
In-Reply-To: <20260226100232.500781-1-eric.auger@redhat.com>
References: <20260226100232.500781-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: kzEA-fPVKbZXDiJr-9p1XKjGxF6jJ11PSFSazyM77XA_1772100170
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.734, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.78,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

We want to use kvm_print_register_name() in machine.c so
let's export the helper and implement a stub when kvm
is not enabled.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/kvm_arm.h  | 2 ++
 target/arm/kvm-stub.c | 6 ++++++
 target/arm/kvm.c      | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index cc0b374254e..b6980e4957a 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -266,4 +266,6 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level);
 
 void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3);
 
+gchar *kvm_print_register_name(uint64_t regidx);
+
 #endif
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index ea67deea520..b13bb055e0e 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -129,3 +129,9 @@ void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
 {
     g_assert_not_reached();
 }
+
+gchar *kvm_print_register_name(uint64_t regidx)
+{
+    g_assert_not_reached();
+    return NULL;
+}
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 12a75f42e07..69efa3e8137 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -913,7 +913,7 @@ static gchar *kvm_print_sve_register_name(uint64_t regidx)
     }
 }
 
-static gchar *kvm_print_register_name(uint64_t regidx)
+gchar *kvm_print_register_name(uint64_t regidx)
 {
         switch ((regidx & KVM_REG_ARM_COPROC_MASK)) {
         case KVM_REG_ARM_CORE:
-- 
2.53.0


