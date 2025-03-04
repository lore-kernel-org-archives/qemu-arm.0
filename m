Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp97193njm;
        Tue, 4 Mar 2025 04:50:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX3T7kvA1b8o7y1ygtmZkF2dxakWpHSmO+GY9SQNSeDqLakhKXmyORoYe9jwqzASPQdINnIfCB8RUuTwA==@linaro.org
X-Google-Smtp-Source: AGHT+IFCDyTdRvqPbLRi6GMdKoeVYTTMggses3gWdRWu57VJLZoqcMjEMLkK69eTvm8MqiVT+M4C
X-Received: by 2002:a05:620a:6849:b0:7c3:caf1:daea with SMTP id af79cd13be357-7c3caf1dfb7mr585576285a.27.1741092629456;
        Tue, 04 Mar 2025 04:50:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741092629; cv=none;
        d=google.com; s=arc-20240605;
        b=AmipLFnGMGOkVPZCuX/ziJDaTlMZpuU7cQEfn01ha0BUA8AUGiqymF7Zkg9mtgSCE9
         E4fwpa25YBBAQbS/h7bDkqUKAFY4PSqs8l3OxUCRw7CxbPYeOrHbs804QIP+z+wLQqbJ
         ZLjC7mCvjz5jgT/tUdIXcPgnhUkpArR1jwGkGk7ChhQbCWUJBV4Ohyu2w25EJPHNdNve
         X522NGuJ/5X5ny39qlQwwd3OTloypo4j0J9MdX7YgRLmyJPWkHnI1JaYfxddac6ntDca
         gC3PlgQxaYvHvKvOgGfjZEvf8xTeb4Ieue4b56Gos05Z0xiNadg5M5yPMDqKxncwPRGz
         6CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JIz4TSVObydKkF1nfUUI4YeQIpc7+o66+8nyRGQKqxM=;
        fh=AUxCU78jacJE1vSghMJJha3+F2+VikVKZl38eSKs5/I=;
        b=CNJm09jKgfbAk708ZyXUO4SFEFXD667QKCiwQdX+flraFOQrmphqayx22WyjQQp02q
         clYqs9rUfaf0FmNvzSEzI6Xu4GjEjaPofgBVuhI8pCuclmyP66Hux4Q+EuU+zc2sCVWA
         4+vlqgxo/P7TQxyiF53HgNTayiZnHEPbT5WN8XLLwuLr/HoTQKi8+nLRu8j44wjTS9kg
         CX2cRCSb8r9CPexULzUhE1Dq6I2Z3ZBFyiHZUzCV/P+i323KPqFtsihhQZdcWVuIMBWV
         RMEjXn5AiSkc50sEBklO6C0ofzhXhbjt0qx1eZ2FimcXmPyYHO2erSsBYgq6kcG4LFCc
         wwqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y2Dar/vH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3c3f98b58si291449585a.492.2025.03.04.04.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Mar 2025 04:50:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y2Dar/vH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpRiK-0004wc-8F; Tue, 04 Mar 2025 07:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhb-0004np-J2
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:48:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhY-0006mW-6O
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741092527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIz4TSVObydKkF1nfUUI4YeQIpc7+o66+8nyRGQKqxM=;
 b=Y2Dar/vH1kLd8ZzCU7WyzoIkg+Ed+tZo0DIvvE1c3//lqhkVr3meYMtbhg1Ykl0Q9Kpw9O
 HIA/ht85J3xtkbdNHoZsYtlBxCUrCkmtDl87kkJWUudrjOp/ZDYGBJSsPGqd5pxuwSe7rd
 ZfvDUCY656srgf20E5K37/1SO3m/L4E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-Hql--rErNKCJ3YUK4goscg-1; Tue,
 04 Mar 2025 07:48:38 -0500
X-MC-Unique: Hql--rErNKCJ3YUK4goscg-1
X-Mimecast-MFC-AGG-ID: Hql--rErNKCJ3YUK4goscg_1741092516
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 890A01954B20; Tue,  4 Mar 2025 12:48:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.122])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 16D7E19560A3; Tue,  4 Mar 2025 12:48:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D129018003AD; Tue, 04 Mar 2025 13:48:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 10/24] hw/uefi: add var-service-core.c
Date: Tue,  4 Mar 2025 13:47:58 +0100
Message-ID: <20250304124815.591749-11-kraxel@redhat.com>
In-Reply-To: <20250304124815.591749-1-kraxel@redhat.com>
References: <20250304124815.591749-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EyX6wLQSeOMl

This is the core code for guest <-> host communication.  This accepts
request messages from the guest, dispatches them to the service called,
and sends back the response message.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20250225163031.1409078-11-kraxel@redhat.com>
---
 hw/uefi/var-service-core.c | 321 +++++++++++++++++++++++++++++++++++++
 1 file changed, 321 insertions(+)
 create mode 100644 hw/uefi/var-service-core.c

diff --git a/hw/uefi/var-service-core.c b/hw/uefi/var-service-core.c
new file mode 100644
index 000000000000..8ed8378ab991
--- /dev/null
+++ b/hw/uefi/var-service-core.c
@@ -0,0 +1,321 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi vars device
+ */
+#include "qemu/osdep.h"
+#include "qemu/crc32c.h"
+#include "system/dma.h"
+#include "migration/vmstate.h"
+
+#include "hw/uefi/var-service.h"
+#include "hw/uefi/var-service-api.h"
+#include "hw/uefi/var-service-edk2.h"
+
+#include "trace/trace-hw_uefi.h"
+
+static int uefi_vars_pre_load(void *opaque)
+{
+    uefi_vars_state *uv = opaque;
+
+    uefi_vars_clear_all(uv);
+    uefi_vars_policies_clear(uv);
+    g_free(uv->buffer);
+    return 0;
+}
+
+static int uefi_vars_post_load(void *opaque, int version_id)
+{
+    uefi_vars_state *uv = opaque;
+
+    uefi_vars_update_storage(uv);
+    uv->buffer = g_malloc(uv->buf_size);
+    return 0;
+}
+
+const VMStateDescription vmstate_uefi_vars = {
+    .name = "uefi-vars",
+    .pre_load = uefi_vars_pre_load,
+    .post_load = uefi_vars_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT16(sts, uefi_vars_state),
+        VMSTATE_UINT32(buf_size, uefi_vars_state),
+        VMSTATE_UINT32(buf_addr_lo, uefi_vars_state),
+        VMSTATE_UINT32(buf_addr_hi, uefi_vars_state),
+        VMSTATE_UINT32(pio_xfer_offset, uefi_vars_state),
+        VMSTATE_VBUFFER_ALLOC_UINT32(pio_xfer_buffer, uefi_vars_state,
+                                     0, NULL, buf_size),
+        VMSTATE_BOOL(end_of_dxe, uefi_vars_state),
+        VMSTATE_BOOL(ready_to_boot, uefi_vars_state),
+        VMSTATE_BOOL(exit_boot_service, uefi_vars_state),
+        VMSTATE_BOOL(policy_locked, uefi_vars_state),
+        VMSTATE_UINT64(used_storage, uefi_vars_state),
+        VMSTATE_QTAILQ_V(variables, uefi_vars_state, 0,
+                         vmstate_uefi_variable, uefi_variable, next),
+        VMSTATE_QTAILQ_V(var_policies, uefi_vars_state, 0,
+                         vmstate_uefi_var_policy, uefi_var_policy, next),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static uint32_t uefi_vars_cmd_mm(uefi_vars_state *uv, bool dma_mode)
+{
+    hwaddr    dma;
+    mm_header *mhdr;
+    uint64_t  size;
+    uint32_t  retval;
+
+    dma = uv->buf_addr_lo | ((hwaddr)uv->buf_addr_hi << 32);
+    mhdr = (mm_header *) uv->buffer;
+
+    if (!uv->buffer || uv->buf_size < sizeof(*mhdr)) {
+        return UEFI_VARS_STS_ERR_BAD_BUFFER_SIZE;
+    }
+
+    /* read header */
+    if (dma_mode) {
+        dma_memory_read(&address_space_memory, dma,
+                        uv->buffer, sizeof(*mhdr),
+                        MEMTXATTRS_UNSPECIFIED);
+    } else {
+        memcpy(uv->buffer, uv->pio_xfer_buffer, sizeof(*mhdr));
+    }
+
+    if (uadd64_overflow(sizeof(*mhdr), mhdr->length, &size)) {
+        return UEFI_VARS_STS_ERR_BAD_BUFFER_SIZE;
+    }
+    if (uv->buf_size < size) {
+        return UEFI_VARS_STS_ERR_BAD_BUFFER_SIZE;
+    }
+
+    /* read buffer (excl header) */
+    if (dma_mode) {
+        dma_memory_read(&address_space_memory, dma + sizeof(*mhdr),
+                        uv->buffer + sizeof(*mhdr), mhdr->length,
+                        MEMTXATTRS_UNSPECIFIED);
+    } else {
+        memcpy(uv->buffer + sizeof(*mhdr),
+               uv->pio_xfer_buffer + sizeof(*mhdr),
+               mhdr->length);
+    }
+    memset(uv->buffer + size, 0, uv->buf_size - size);
+
+    /* dispatch */
+    if (qemu_uuid_is_equal(&mhdr->guid, &EfiSmmVariableProtocolGuid)) {
+        retval = uefi_vars_mm_vars_proto(uv);
+
+    } else if (qemu_uuid_is_equal(&mhdr->guid, &VarCheckPolicyLibMmiHandlerGuid)) {
+        retval = uefi_vars_mm_check_policy_proto(uv);
+
+    } else if (qemu_uuid_is_equal(&mhdr->guid, &EfiEndOfDxeEventGroupGuid)) {
+        trace_uefi_event("end-of-dxe");
+        uv->end_of_dxe = true;
+        retval = UEFI_VARS_STS_SUCCESS;
+
+    } else if (qemu_uuid_is_equal(&mhdr->guid, &EfiEventReadyToBootGuid)) {
+        trace_uefi_event("ready-to-boot");
+        uv->ready_to_boot = true;
+        retval = UEFI_VARS_STS_SUCCESS;
+
+    } else if (qemu_uuid_is_equal(&mhdr->guid, &EfiEventExitBootServicesGuid)) {
+        trace_uefi_event("exit-boot-service");
+        uv->exit_boot_service = true;
+        retval = UEFI_VARS_STS_SUCCESS;
+
+    } else {
+        retval = UEFI_VARS_STS_ERR_NOT_SUPPORTED;
+    }
+
+    /* write buffer */
+    if (dma_mode) {
+        dma_memory_write(&address_space_memory, dma,
+                         uv->buffer, sizeof(*mhdr) + mhdr->length,
+                         MEMTXATTRS_UNSPECIFIED);
+    } else {
+        memcpy(uv->pio_xfer_buffer + sizeof(*mhdr),
+               uv->buffer + sizeof(*mhdr),
+               sizeof(*mhdr) + mhdr->length);
+    }
+
+    return retval;
+}
+
+static void uefi_vars_soft_reset(uefi_vars_state *uv)
+{
+    g_free(uv->buffer);
+    uv->buffer = NULL;
+    uv->buf_size = 0;
+    uv->buf_addr_lo = 0;
+    uv->buf_addr_hi = 0;
+}
+
+void uefi_vars_hard_reset(uefi_vars_state *uv)
+{
+    trace_uefi_hard_reset();
+    uefi_vars_soft_reset(uv);
+
+    uv->end_of_dxe        = false;
+    uv->ready_to_boot     = false;
+    uv->exit_boot_service = false;
+    uv->policy_locked     = false;
+
+    uefi_vars_clear_volatile(uv);
+    uefi_vars_policies_clear(uv);
+    uefi_vars_auth_init(uv);
+}
+
+static uint32_t uefi_vars_cmd(uefi_vars_state *uv, uint32_t cmd)
+{
+    switch (cmd) {
+    case UEFI_VARS_CMD_RESET:
+        uefi_vars_soft_reset(uv);
+        return UEFI_VARS_STS_SUCCESS;
+    case UEFI_VARS_CMD_DMA_MM:
+        return uefi_vars_cmd_mm(uv, true);
+    case UEFI_VARS_CMD_PIO_MM:
+        return uefi_vars_cmd_mm(uv, false);
+    case UEFI_VARS_CMD_PIO_ZERO_OFFSET:
+        uv->pio_xfer_offset = 0;
+        return UEFI_VARS_STS_SUCCESS;
+    default:
+        return UEFI_VARS_STS_ERR_NOT_SUPPORTED;
+    }
+}
+
+static uint64_t uefi_vars_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uefi_vars_state *uv = opaque;
+    uint64_t retval = -1;
+    void *xfer_ptr;
+
+    trace_uefi_reg_read(addr, size);
+
+    switch (addr) {
+    case UEFI_VARS_REG_MAGIC:
+        retval = UEFI_VARS_MAGIC_VALUE;
+        break;
+    case UEFI_VARS_REG_CMD_STS:
+        retval = uv->sts;
+        break;
+    case UEFI_VARS_REG_BUFFER_SIZE:
+        retval = uv->buf_size;
+        break;
+    case UEFI_VARS_REG_DMA_BUFFER_ADDR_LO:
+        retval = uv->buf_addr_lo;
+        break;
+    case UEFI_VARS_REG_DMA_BUFFER_ADDR_HI:
+        retval = uv->buf_addr_hi;
+        break;
+    case UEFI_VARS_REG_PIO_BUFFER_TRANSFER:
+        if (uv->pio_xfer_offset + size > uv->buf_size) {
+            retval = 0;
+            break;
+        }
+        xfer_ptr = uv->pio_xfer_buffer + uv->pio_xfer_offset;
+        switch (size) {
+        case 1:
+            retval = *(uint8_t *)xfer_ptr;
+            break;
+        case 2:
+            retval = *(uint16_t *)xfer_ptr;
+            break;
+        case 4:
+            retval = *(uint32_t *)xfer_ptr;
+            break;
+        case 8:
+            retval = *(uint64_t *)xfer_ptr;
+            break;
+        }
+        uv->pio_xfer_offset += size;
+        break;
+    case UEFI_VARS_REG_PIO_BUFFER_CRC32C:
+        retval = crc32c(0xffffffff, uv->pio_xfer_buffer, uv->pio_xfer_offset);
+        break;
+    case UEFI_VARS_REG_FLAGS:
+        retval = 0;
+        if (uv->use_pio) {
+            retval |= UEFI_VARS_FLAG_USE_PIO;
+        }
+    }
+    return retval;
+}
+
+static void uefi_vars_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    uefi_vars_state *uv = opaque;
+    void *xfer_ptr;
+
+    trace_uefi_reg_write(addr, val, size);
+
+    switch (addr) {
+    case UEFI_VARS_REG_CMD_STS:
+        uv->sts = uefi_vars_cmd(uv, val);
+        break;
+    case UEFI_VARS_REG_BUFFER_SIZE:
+        if (val > MAX_BUFFER_SIZE) {
+            val = MAX_BUFFER_SIZE;
+        }
+        uv->buf_size = val;
+        g_free(uv->buffer);
+        g_free(uv->pio_xfer_buffer);
+        uv->buffer = g_malloc(uv->buf_size);
+        uv->pio_xfer_buffer = g_malloc(uv->buf_size);
+        break;
+    case UEFI_VARS_REG_DMA_BUFFER_ADDR_LO:
+        uv->buf_addr_lo = val;
+        break;
+    case UEFI_VARS_REG_DMA_BUFFER_ADDR_HI:
+        uv->buf_addr_hi = val;
+        break;
+    case UEFI_VARS_REG_PIO_BUFFER_TRANSFER:
+        if (uv->pio_xfer_offset + size > uv->buf_size) {
+            break;
+        }
+        xfer_ptr = uv->pio_xfer_buffer + uv->pio_xfer_offset;
+        switch (size) {
+        case 1:
+            *(uint8_t *)xfer_ptr = val;
+            break;
+        case 2:
+            *(uint16_t *)xfer_ptr = val;
+            break;
+        case 4:
+            *(uint32_t *)xfer_ptr = val;
+            break;
+        case 8:
+            *(uint64_t *)xfer_ptr = val;
+            break;
+        }
+        uv->pio_xfer_offset += size;
+        break;
+    case UEFI_VARS_REG_PIO_BUFFER_CRC32C:
+    case UEFI_VARS_REG_FLAGS:
+    default:
+        break;
+    }
+}
+
+static const MemoryRegionOps uefi_vars_ops = {
+    .read = uefi_vars_read,
+    .write = uefi_vars_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 2,
+        .max_access_size = 4,
+    },
+};
+
+void uefi_vars_init(Object *obj, uefi_vars_state *uv)
+{
+    QTAILQ_INIT(&uv->variables);
+    QTAILQ_INIT(&uv->var_policies);
+    uv->jsonfd = -1;
+    memory_region_init_io(&uv->mr, obj, &uefi_vars_ops, uv,
+                          "uefi-vars", UEFI_VARS_REGS_SIZE);
+}
+
+void uefi_vars_realize(uefi_vars_state *uv, Error **errp)
+{
+    uefi_vars_json_init(uv, errp);
+    uefi_vars_json_load(uv, errp);
+}
-- 
2.48.1

