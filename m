Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2840014ejc;
        Wed, 15 Nov 2023 07:14:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1SK0qnnStp9JOP5jaVgPlE9TpLqD6qqK4V9vzrP7fDRbSeUFO1tvH+e0ydPnpST+ZHS7L
X-Received: by 2002:a05:6214:944:b0:66d:bdd3:5d5 with SMTP id dn4-20020a056214094400b0066dbdd305d5mr5167812qvb.0.1700061270291;
        Wed, 15 Nov 2023 07:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700061270; cv=none;
        d=google.com; s=arc-20160816;
        b=G5BjtLc5DY8sOFac08yXdz8AvMV1jrpnfup8lOjbAMi7ogR2X+N7X6eTZ+7q1rRq1h
         uR4Md2SQz7qdGoXSvbjI0jJUGGwMOtta7GYq6gyhDnVbj6IJjpWP/9RezgcRwqGLqIb0
         N0RMTA4i9MCbu65KhSx9uFXoq8oP4DN6zHurJ4QrrIhvL9kaP4JDIkUqVbZibREcyvRY
         hCi4AvdJwxi6ZeEPzoUH9mk3PSPo5X5sBoOeTPFYPahU2VxivwungLlcl3arj5mAd87j
         FVNKhdAafk+WNNuytrp0OH8EFxWTjb9sCfymY745AcFneddJZ//FX+gDrTEcuJxWra8b
         d+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qZ4CNhFWHRMd0kfj3CBOgGWcmCWb3NWGbYDQrf6nfqc=;
        fh=aH4SF+xuSHrUGtnSFxtFTCUyBE4iqqHq5kYhw/wkcgk=;
        b=WuwujsBzvnpgpu0O3f43WBy3obNEm3S5Ee653eC7js8o4fRVepM/bhHV2gFtv0z4Sy
         fiTQq/Nm0/s12gSqpZjwvC+k1ULcU1iXyWhxID/Q7DREr0Ih0r5G2qxKvJ1CFcz1e5Sk
         94B0dHOXc5OQ6ylYFNvN6kfqxMMxCW1FH4FT7emV3jvuplgekli4nQA7h/fzHArJLpbm
         B+cqUCm+i/EMZ791ks8LFdFzu7vPn9i+sdednk3f/yRFwbcuXFxHnzo+Ep73lCaxlhZU
         2opgZ076vDbUDISoT7VglgFljggGKSOlLeIKASjL1XvsLo+tXQtRd/PhUfComDmrtoQa
         hInw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FHPYMay4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id di12-20020ad458ec000000b0063f7d73dd87si9130129qvb.584.2023.11.15.07.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 07:14:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FHPYMay4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3Ha6-00040X-Cr; Wed, 15 Nov 2023 10:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZg-0003uF-UY
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 10:13:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZb-0003GB-U0
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 10:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700061174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZ4CNhFWHRMd0kfj3CBOgGWcmCWb3NWGbYDQrf6nfqc=;
 b=FHPYMay4H/xcDk4wCcnHIwdLoTrDEOr9OkK7L6/PimN8/PVksGQtBQuWPzMF4TuAZ2t9vW
 hqbwcZ5CHuOu5CS3un779SIlENHf4Yizt85qUWdU+GZ8iL0OYrlwobRfcEEUCR4NN9J/Kk
 PKBow2N4UjXyiFfNLD/gNOMT38Jdwfw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-hmXnHOiKN0-b2Msa5KhegA-1; Wed,
 15 Nov 2023 10:12:51 -0500
X-MC-Unique: hmXnHOiKN0-b2Msa5KhegA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C8833810D2F;
 Wed, 15 Nov 2023 15:12:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6261121306;
 Wed, 15 Nov 2023 15:12:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D45B6180AC12; Wed, 15 Nov 2023 16:12:42 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 graf@amazon.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 08/16] hw/uefi: add var-service-policy.c
Date: Wed, 15 Nov 2023 16:12:30 +0100
Message-ID: <20231115151242.184645-9-kraxel@redhat.com>
In-Reply-To: <20231115151242.184645-1-kraxel@redhat.com>
References: <20231115151242.184645-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DCALLBXVqufx

Implement variable policies (Edk2VariablePolicyProtocol).

This protocol allows to define restrictions for variables.
It also allows to lock down variables (disallow write access).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/var-service-policy.c | 390 +++++++++++++++++++++++++++++++++++
 1 file changed, 390 insertions(+)
 create mode 100644 hw/uefi/var-service-policy.c

diff --git a/hw/uefi/var-service-policy.c b/hw/uefi/var-service-policy.c
new file mode 100644
index 000000000000..f44edb358c8f
--- /dev/null
+++ b/hw/uefi/var-service-policy.c
@@ -0,0 +1,390 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi vars device - VarCheckPolicyLibMmiHandler implementation
+ *
+ * variable policy specs:
+ * https://github.com/tianocore/edk2/blob/master/MdeModulePkg/Library/VariablePolicyLib/ReadMe.md
+ */
+#include "qemu/osdep.h"
+#include "sysemu/dma.h"
+#include "migration/vmstate.h"
+
+#include "hw/uefi/var-service.h"
+#include "hw/uefi/var-service-api.h"
+#include "hw/uefi/var-service-edk2.h"
+
+#include "trace/trace-hw_uefi.h"
+
+static void calc_policy(uefi_var_policy *pol);
+
+static int uefi_var_policy_post_load(void *opaque, int version_id)
+{
+    uefi_var_policy *pol = opaque;
+
+    calc_policy(pol);
+    return 0;
+}
+
+const VMStateDescription vmstate_uefi_var_policy = {
+    .name = "uefi-var-policy",
+    .post_load = uefi_var_policy_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(entry_size, uefi_var_policy),
+        VMSTATE_VBUFFER_ALLOC_UINT32(entry, uefi_var_policy,
+                                     0, NULL, entry_size),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void print_policy_entry(variable_policy_entry *pe)
+{
+    uint16_t *name = (void *)pe + pe->offset_to_name;
+
+    fprintf(stderr, "%s:\n", __func__);
+
+    fprintf(stderr, "    name ´");
+    while (*name) {
+        fprintf(stderr, "%c", *name);
+        name++;
+    }
+    fprintf(stderr, "', version=%d.%d, size=%d\n",
+            pe->version >> 16, pe->version & 0xffff, pe->size);
+
+    if (pe->min_size) {
+        fprintf(stderr, "    size min=%d\n", pe->min_size);
+    }
+    if (pe->max_size != UINT32_MAX) {
+        fprintf(stderr, "    size max=%u\n", pe->max_size);
+    }
+    if (pe->attributes_must_have) {
+        fprintf(stderr, "    attr must=0x%x\n", pe->attributes_must_have);
+    }
+    if (pe->attributes_cant_have) {
+        fprintf(stderr, "    attr cant=0x%x\n", pe->attributes_cant_have);
+    }
+    if (pe->lock_policy_type) {
+        fprintf(stderr, "    lock policy type %d\n", pe->lock_policy_type);
+    }
+}
+
+static gboolean wildcard_strcmp(uefi_var_policy *pol,
+                                uefi_variable *var)
+{
+    size_t pos = 0;
+    size_t plen = pol->name_size / 2;
+    size_t vlen = var->name_size / 2;
+
+    if (plen == 0) {
+        return true;
+    }
+
+    for (;;) {
+        if (pos == plen && pos == vlen) {
+            return true;
+        }
+        if (pos == plen || pos == vlen) {
+            return false;
+        }
+        if (pol->name[pos] == 0 && var->name[pos] == 0) {
+            return true;
+        }
+
+        if (pol->name[pos] == '#') {
+            if (!isxdigit(var->name[pos])) {
+                return false;
+            }
+        } else {
+            if (pol->name[pos] != var->name[pos]) {
+                return false;
+            }
+        }
+
+        pos++;
+    }
+}
+
+static uefi_var_policy *find_policy(uefi_vars_state *uv, QemuUUID guid,
+                                    uint16_t *name, uint64_t name_size)
+{
+    uefi_var_policy *pol;
+
+    QTAILQ_FOREACH(pol, &uv->var_policies, next) {
+        if (!qemu_uuid_is_equal(&pol->entry->namespace, &guid)) {
+            continue;
+        }
+        if (!uefi_str_equal(pol->name, pol->name_size,
+                            name, name_size)) {
+            continue;
+        }
+        return pol;
+    }
+    return NULL;
+}
+
+static uefi_var_policy *wildcard_find_policy(uefi_vars_state *uv,
+                                             uefi_variable *var)
+{
+    uefi_var_policy *pol;
+
+    QTAILQ_FOREACH(pol, &uv->var_policies, next) {
+        if (!qemu_uuid_is_equal(&pol->entry->namespace, &var->guid)) {
+            continue;
+        }
+        if (!wildcard_strcmp(pol, var)) {
+            continue;
+        }
+        return pol;
+    }
+    return NULL;
+}
+
+static void calc_policy(uefi_var_policy *pol)
+{
+    variable_policy_entry *pe = pol->entry;
+    unsigned int i;
+
+    pol->name = (void *)pol->entry + pe->offset_to_name;
+    pol->name_size = pe->size - pe->offset_to_name;
+
+    for (i = 0; i < pol->name_size / 2; i++) {
+        if (pol->name[i] == '#') {
+            pol->hashmarks++;
+        }
+    }
+}
+
+uefi_var_policy *uefi_vars_add_policy(uefi_vars_state *uv,
+                                      variable_policy_entry *pe)
+{
+    uefi_var_policy *pol, *p;
+
+    pol = g_new0(uefi_var_policy, 1);
+    pol->entry = g_malloc(pe->size);
+    memcpy(pol->entry, pe, pe->size);
+    pol->entry_size = pe->size;
+
+    calc_policy(pol);
+
+    /* keep list sorted by priority, add to tail of priority group */
+    QTAILQ_FOREACH(p, &uv->var_policies, next) {
+        if ((p->hashmarks > pol->hashmarks) ||
+            (!p->name_size && pol->name_size)) {
+            QTAILQ_INSERT_BEFORE(p, pol, next);
+            return pol;
+        }
+    }
+
+    QTAILQ_INSERT_TAIL(&uv->var_policies, pol, next);
+    return pol;
+}
+
+efi_status uefi_vars_policy_check(uefi_vars_state *uv,
+                                  uefi_variable *var,
+                                  gboolean is_newvar)
+{
+    uefi_var_policy *pol;
+    variable_policy_entry *pe;
+    variable_lock_on_var_state *lvarstate;
+    uint16_t *lvarname;
+    size_t lvarnamesize;
+    uefi_variable *lvar;
+
+    if (!uv->end_of_dxe) {
+        return EFI_SUCCESS;
+    }
+
+    pol = wildcard_find_policy(uv, var);
+    if (!pol) {
+        return EFI_SUCCESS;
+    }
+    pe = pol->entry;
+
+    uefi_trace_variable(__func__, var->guid, var->name, var->name_size);
+    print_policy_entry(pe);
+
+    if ((var->attributes & pe->attributes_must_have) != pe->attributes_must_have) {
+        trace_uefi_vars_policy_deny("must-have-attr");
+        return EFI_INVALID_PARAMETER;
+    }
+    if ((var->attributes & pe->attributes_cant_have) != 0) {
+        trace_uefi_vars_policy_deny("cant-have-attr");
+        return EFI_INVALID_PARAMETER;
+    }
+
+    if (var->data_size < pe->min_size) {
+        trace_uefi_vars_policy_deny("min-size");
+        return EFI_INVALID_PARAMETER;
+    }
+    if (var->data_size > pe->max_size) {
+        trace_uefi_vars_policy_deny("max-size");
+        return EFI_INVALID_PARAMETER;
+    }
+
+    switch (pe->lock_policy_type) {
+    case VARIABLE_POLICY_TYPE_NO_LOCK:
+        break;
+
+    case VARIABLE_POLICY_TYPE_LOCK_NOW:
+        trace_uefi_vars_policy_deny("lock-now");
+        return EFI_WRITE_PROTECTED;
+
+    case VARIABLE_POLICY_TYPE_LOCK_ON_CREATE:
+        if (!is_newvar) {
+            trace_uefi_vars_policy_deny("lock-on-create");
+            return EFI_WRITE_PROTECTED;
+        }
+        break;
+
+    case VARIABLE_POLICY_TYPE_LOCK_ON_VAR_STATE:
+        lvarstate    = (void *)pol->entry + sizeof(*pe);
+        lvarname     = (void *)pol->entry + sizeof(*pe) + sizeof(*lvarstate);
+        lvarnamesize = pe->offset_to_name - sizeof(*pe) - sizeof(*lvarstate);
+
+        uefi_trace_variable(__func__, lvarstate->namespace,
+                            lvarname, lvarnamesize);
+        lvar = uefi_vars_find_variable(uv, lvarstate->namespace,
+                                          lvarname, lvarnamesize);
+        if (lvar && lvar->data_size == 1) {
+            uint8_t *value = lvar->data;
+            if (lvarstate->value == *value) {
+                return EFI_WRITE_PROTECTED;
+            }
+        }
+        break;
+    }
+
+    return EFI_SUCCESS;
+}
+
+void uefi_vars_policies_clear(uefi_vars_state *uv)
+{
+    uefi_var_policy *pol;
+
+    while (!QTAILQ_EMPTY(&uv->var_policies)) {
+        pol = QTAILQ_FIRST(&uv->var_policies);
+        QTAILQ_REMOVE(&uv->var_policies, pol, next);
+        g_free(pol->entry);
+        g_free(pol);
+    }
+}
+
+static size_t uefi_vars_mm_policy_error(mm_header *mhdr,
+                                        mm_check_policy *mchk,
+                                        uint64_t status)
+{
+    mchk->result = status;
+    return sizeof(*mchk);
+}
+
+static uint32_t uefi_vars_mm_check_policy_is_enabled(uefi_vars_state *uv,
+                                                     mm_header       *mhdr,
+                                                     mm_check_policy *mchk,
+                                                     void            *func)
+{
+    mm_check_policy_is_enabled *mpar = func;
+    size_t length;
+
+    length = sizeof(*mchk) + sizeof(*mpar);
+    if (mhdr->length < length) {
+        return uefi_vars_mm_policy_error(mhdr, mchk, EFI_BAD_BUFFER_SIZE);
+    }
+
+    mpar->state  = TRUE;
+    mchk->result = EFI_SUCCESS;
+    return sizeof(*mchk);
+}
+
+static uint32_t uefi_vars_mm_check_policy_register(uefi_vars_state *uv,
+                                                   mm_header       *mhdr,
+                                                   mm_check_policy *mchk,
+                                                   void            *func)
+{
+    variable_policy_entry *pe = func;
+    uefi_var_policy *pol;
+    size_t length;
+
+    length = sizeof(*mchk) + pe->size;
+    if (mhdr->length < length) {
+        return uefi_vars_mm_policy_error(mhdr, mchk, EFI_BAD_BUFFER_SIZE);
+    }
+    if (pe->size < sizeof(*pe)) {
+        return uefi_vars_mm_policy_error(mhdr, mchk, EFI_BAD_BUFFER_SIZE);
+    }
+    if (pe->offset_to_name < sizeof(*pe)) {
+        return uefi_vars_mm_policy_error(mhdr, mchk, EFI_BAD_BUFFER_SIZE);
+    }
+
+    if (pe->lock_policy_type == VARIABLE_POLICY_TYPE_LOCK_ON_VAR_STATE &&
+        pe->offset_to_name < sizeof(*pe) + sizeof(variable_lock_on_var_state)) {
+        return uefi_vars_mm_policy_error(mhdr, mchk, EFI_BAD_BUFFER_SIZE);
+    }
+
+    /* check space for minimum string length */
+    if (pe->size < (size_t)pe->offset_to_name) {
+        return uefi_vars_mm_policy_error(mhdr, mchk, EFI_BAD_BUFFER_SIZE);
+    }
+
+    pol = find_policy(uv, pe->namespace,
+                      (void *)pe + pe->offset_to_name,
+                      pe->size - pe->offset_to_name);
+    if (pol) {
+        return uefi_vars_mm_policy_error(mhdr, mchk, EFI_ALREADY_STARTED);
+    }
+
+    uefi_vars_add_policy(uv, pe);
+
+    mchk->result = EFI_SUCCESS;
+    return sizeof(*mchk);
+}
+
+uint32_t uefi_vars_mm_check_policy_proto(uefi_vars_state *uv)
+{
+    static const char *fnames[] = {
+        "zero",
+        "disable",
+        "is-enabled",
+        "register",
+        "dump",
+        "lock",
+    };
+    const char      *fname;
+    mm_header       *mhdr = (mm_header *) uv->buffer;
+    mm_check_policy *mchk = (mm_check_policy *) (uv->buffer + sizeof(*mhdr));
+    void            *func = (uv->buffer + sizeof(*mhdr) + sizeof(*mchk));
+
+    if (mhdr->length < sizeof(*mchk)) {
+        return UEFI_VARS_STS_ERR_BAD_BUFFER_SIZE;
+    }
+
+    fname = mchk->command < ARRAY_SIZE(fnames)
+        ? fnames[mchk->command]
+        : "unknown";
+    trace_uefi_vars_policy_cmd(fname);
+
+    switch (mchk->command) {
+    case VAR_CHECK_POLICY_COMMAND_DISABLE:
+        mchk->result = EFI_UNSUPPORTED;
+        break;
+    case VAR_CHECK_POLICY_COMMAND_IS_ENABLED:
+        uefi_vars_mm_check_policy_is_enabled(uv, mhdr, mchk, func);
+        break;
+    case VAR_CHECK_POLICY_COMMAND_REGISTER:
+        if (uv->policy_locked) {
+            mchk->result = EFI_WRITE_PROTECTED;
+        } else {
+            uefi_vars_mm_check_policy_register(uv, mhdr, mchk, func);
+        }
+        break;
+    case VAR_CHECK_POLICY_COMMAND_LOCK:
+        uv->policy_locked = true;
+        mchk->result = EFI_SUCCESS;
+        break;
+    default:
+        mchk->result = EFI_UNSUPPORTED;
+        break;
+    }
+
+    uefi_trace_status(__func__, mchk->result);
+    return UEFI_VARS_STS_SUCCESS;
+}
-- 
2.41.0

