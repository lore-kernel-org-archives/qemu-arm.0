Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3850CEC1459
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 14:40:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxQuq-0001ex-L4; Tue, 03 Mar 2026 09:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxQup-0001ec-OA
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 09:40:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxQuo-0002Dl-6M
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 09:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772548800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oJHnFlbisgEtfr+pa9NG0vrx4X448WVIRora0FKjQFI=;
 b=VlPCLNu5eh1hb25a/TG8zzlZ60r4FdwsRs1NQMAyj9eR6M1APNm1R5eh8DvJuiTbhKHTj0
 dPocizXHs2N+cWvtRBIcLtHC7MIN/MDQMeQhBBhiV6PF7aJVpcO9n0BPQYSYJeGTzOc2oa
 EJytNMp8Z+2fXIu/N3GN8KHwwZ6Q1g0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-34-GA67AYOvPyCz0FgmPNKzlg-1; Tue,
 03 Mar 2026 09:39:57 -0500
X-MC-Unique: GA67AYOvPyCz0FgmPNKzlg-1
X-Mimecast-MFC-AGG-ID: GA67AYOvPyCz0FgmPNKzlg_1772548796
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 49BFC1956055; Tue,  3 Mar 2026 14:39:56 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.89])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4543930001B9; Tue,  3 Mar 2026 14:39:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, cohuck@redhat.com,
 sebott@redhat.com, peterx@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: [PATCH v2 6/7] target/arm/machine: Trace all register mismatches
Date: Tue,  3 Mar 2026 15:36:38 +0100
Message-ID: <20260303143928.1747116-7-eric.auger@redhat.com>
In-Reply-To: <20260303143928.1747116-1-eric.auger@redhat.com>
References: <20260303143928.1747116-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 9QHZlRP1gjXIftvi1j5VtfQUnOH-sgTf82L3OFGWx8A_1772548796
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 27
X-Spam_score: 2.7
X-Spam_bar: ++
X-Spam_report: (2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

At the moment, cpu_post_load() exists with error on the first
catch of unexpected register in the incoming stream. Let the code
go further and trace all the issues before exiting.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/machine.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 7dd649e8f64..13f3955be67 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -1058,6 +1058,7 @@ static int cpu_post_load(void *opaque, int version_id)
 {
     ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
+    bool fail = false;
     int i, v;
 
     trace_cpu_post_load(cpu->cpreg_vmstate_array_len,
@@ -1090,13 +1091,14 @@ static int cpu_post_load(void *opaque, int version_id)
      */
 
     for (i = 0, v = 0; i < cpu->cpreg_array_len
-             && v < cpu->cpreg_vmstate_array_len; i++) {
+             && v < cpu->cpreg_vmstate_array_len;) {
         if (cpu->cpreg_vmstate_indexes[v] > cpu->cpreg_indexes[i]) {
             g_autofree gchar *name = print_register_name(cpu->cpreg_indexes[i]);
 
             warn_report("%s: %s "
                         "expected by the destination but not in the incoming stream: "
                         "skip it", __func__, name);
+            i++;
             continue;
         }
         if (cpu->cpreg_vmstate_indexes[v] < cpu->cpreg_indexes[i]) {
@@ -1104,12 +1106,18 @@ static int cpu_post_load(void *opaque, int version_id)
 
             error_report("%s: %s in the incoming stream but unknown on the destination: "
                          "fail migration", __func__, name);
-            return -1;
+            v++;
+            fail = true;
+            continue;
         }
         /* matching register, copy the value over */
         cpu->cpreg_values[i] = cpu->cpreg_vmstate_values[v];
+        i++;
         v++;
     }
+    if (fail) {
+        return -1;
+    }
 
     if (kvm_enabled()) {
         if (!kvm_arm_cpu_post_load(cpu)) {
-- 
2.53.0


