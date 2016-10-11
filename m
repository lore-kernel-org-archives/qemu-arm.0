Received: by 10.80.166.35 with SMTP id d32csp104351edc;
        Tue, 11 Oct 2016 10:12:53 -0700 (PDT)
X-Received: by 10.55.130.7 with SMTP id e7mr5006585qkd.121.1476205973058;
        Tue, 11 Oct 2016 10:12:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q88si1897326qkl.166.2016.10.11.10.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 10:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu0bk-0004py-EC
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 13:12:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bu0Xc-0001DM-0S
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:08:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bu0XZ-00045N-QY
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:08:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bu0XZ-00043i-Jz; Tue, 11 Oct 2016 13:08:33 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bu0XP-000171-D6; Tue, 11 Oct 2016 18:08:23 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Oct 2016 18:08:17 +0100
Message-Id: <1476205699-28857-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v3 5/7] migration/savevm.c: migrate non-default
 page size
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, paolo@archaic.org.uk,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UBj9slsUk3PG

Add a subsection to vmstate_configuration which is present
only if the guest is using a target page size which is
different from the default. This allows us to helpfully
diagnose attempts to migrate between machines which
are using different target page sizes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 migration/savevm.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 33a2911..48a47fb 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -265,6 +265,7 @@ typedef struct SaveState {
     bool skip_configuration;
     uint32_t len;
     const char *name;
+    uint32_t target_page_bits;
 } SaveState;
 
 static SaveState savevm_state = {
@@ -286,6 +287,19 @@ static void configuration_pre_save(void *opaque)
 
     state->len = strlen(current_name);
     state->name = current_name;
+    state->target_page_bits = TARGET_PAGE_BITS;
+}
+
+static int configuration_pre_load(void *opaque)
+{
+    SaveState *state = opaque;
+
+    /* If there is no target-page-bits subsection it means the source
+     * predates the variable-target-page-bits support and is using the
+     * minimum possible value for this CPU.
+     */
+    state->target_page_bits = TARGET_PAGE_BITS_MIN;
+    return 0;
 }
 
 static int configuration_post_load(void *opaque, int version_id)
@@ -298,12 +312,43 @@ static int configuration_post_load(void *opaque, int version_id)
                      (int) state->len, state->name, current_name);
         return -EINVAL;
     }
+
+    if (state->target_page_bits != TARGET_PAGE_BITS) {
+        error_report("Received TARGET_PAGE_BITS is %d but local is %d",
+                     state->target_page_bits, TARGET_PAGE_BITS);
+        return -EINVAL;
+    }
+
     return 0;
 }
 
+/* The target-page-bits subsection is present only if the
+ * target page size is not the same as the default (ie the
+ * minimum page size for a variable-page-size guest CPU).
+ * If it is present then it contains the actual target page
+ * bits for the machine, and migration will fail if the
+ * two ends don't agree about it.
+ */
+static bool vmstate_target_page_bits_needed(void *opaque)
+{
+    return TARGET_PAGE_BITS > TARGET_PAGE_BITS_MIN;
+}
+
+static const VMStateDescription vmstate_target_page_bits = {
+    .name = "configuration/target-page-bits",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vmstate_target_page_bits_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(target_page_bits, SaveState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_configuration = {
     .name = "configuration",
     .version_id = 1,
+    .pre_load = configuration_pre_load,
     .post_load = configuration_post_load,
     .pre_save = configuration_pre_save,
     .fields = (VMStateField[]) {
@@ -311,6 +356,10 @@ static const VMStateDescription vmstate_configuration = {
         VMSTATE_VBUFFER_ALLOC_UINT32(name, SaveState, 0, NULL, 0, len),
         VMSTATE_END_OF_LIST()
     },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_target_page_bits,
+        NULL
+    }
 };
 
 static void dump_vmstate_vmsd(FILE *out_file,
-- 
2.7.4

