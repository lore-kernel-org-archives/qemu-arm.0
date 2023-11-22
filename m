Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp280242ejx;
        Wed, 22 Nov 2023 04:26:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuiqFYw+BJ237rjmYODOTTKsbab0kV5UK9gkbaLezGQdYHVa7OHYEdeHaamPq2eEId32L1
X-Received: by 2002:a05:6102:10d1:b0:462:8cc2:d6d7 with SMTP id t17-20020a05610210d100b004628cc2d6d7mr2297169vsr.23.1700655970526;
        Wed, 22 Nov 2023 04:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700655970; cv=none;
        d=google.com; s=arc-20160816;
        b=VTDxw/Xu61bZWZW+Gqu5Ublqi+I3IMvo2F/xxHTJkbIP/UaczHk3uA/NDfezZvcX56
         kgqwfeg8Neec6bLP8mgBP06CCie0EGHc0tpQ3ZCOaIkG/9iuJ/lebx8umJBEBqz5dRX6
         xSUSHdmq5UXiG0/vbPSASpNl69KwJFFay3VSIjb+b3Kv0ejxbG6GwgxzLa0qItkpUfgw
         Pb4+SyJiSWeCjRIPdtza50nehBjPCmfEOBPPMHv6lJwoftgZlK/WOvzGTkE1IKKx5nuB
         fwHpipcBYiqNZQlLyt8UJlavfy+y++48THYQdk4i1M0x8J8DIdpx89OKYo8SlOSo9sbV
         fZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :mime-version:date:message-id:dkim-signature;
        bh=4GgomoaDQQyYk/98Od/nGze8yOG261wp+aYTIv5QGKM=;
        fh=WaOdKrDWYJFCjpd9XuplKfhY5PHSKebwZLQ9Fcuj1Yw=;
        b=MCq1vihcVqbMXqCHhu9HIHswNONBdDNEV2sPMurfagE6sNvMC+HGtdlOvTX6WGQz2r
         KoeAVhwkuptl0cgCcaiFpyIGegvbPg0+MkxRaQbQcgKMSbJUDb7RUwBlEoxD7y9gG07R
         Snis3s0cj5BdfpdMK9uAfOb9BNbrGTAOlJhvoDYoSN90pnKfCQpnKF9SMHQKti4asHEi
         yJTAg3LSqH6E3eiUuFKxCQS7CXYE1XfnH0lS92NNxmZLIjW2V/9Jij2Pxm0LcVtkiyOb
         U5UvPNMtlQhbNCUMVteSEbkDxb5HhY6UJWs67VgorgUvwbQF4jtSkCWuRr358V3/21mU
         lZaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fu6qaUE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ch3-20020a05622a40c300b0042378b49fcasi1798523qtb.432.2023.11.22.04.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 04:26:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fu6qaUE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5mIm-0005Zj-Th; Wed, 22 Nov 2023 07:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1r5mIl-0005ZZ-On
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 07:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1r5mIj-0000Sz-8k
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 07:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700655952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GgomoaDQQyYk/98Od/nGze8yOG261wp+aYTIv5QGKM=;
 b=fu6qaUE6l+xF5oogsWEG5pkROIOVT6Od8yiPvCXKLCQB8gsNaWUPHL1eRMtEb5WA65TrAn
 g9LwckzC1MrneSF5oJOeSGkZzn/jH4LPhutXCe3VI4NuP6TH8eE9S+e/maMEPo360cB+2/
 a0QETQlOAw1KiyWCynoi0V3lMqozz3g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-9UeFvhiiOeigRi2mkSlF9Q-1; Wed, 22 Nov 2023 07:25:50 -0500
X-MC-Unique: 9UeFvhiiOeigRi2mkSlF9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6686B80C344;
 Wed, 22 Nov 2023 12:25:50 +0000 (UTC)
Received: from [10.39.193.187] (unknown [10.39.193.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 521351121306;
 Wed, 22 Nov 2023 12:25:48 +0000 (UTC)
Message-ID: <f3794048-d8b9-7f53-d191-3ffbe75cee82@redhat.com>
Date: Wed, 22 Nov 2023 13:25:47 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 05/16] hw/uefi: add var-service-core.c
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, graf@amazon.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20231115151242.184645-1-kraxel@redhat.com>
 <20231115151242.184645-6-kraxel@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20231115151242.184645-6-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.058,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: FU4Mjvav46/I

On 11/15/23 16:12, Gerd Hoffmann wrote:
> This is the core code for guest <-> host communication.  This accepts
> request messages from the guest, dispatches them to the service called,
> and sends back the response message.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/uefi/var-service-core.c | 350 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 350 insertions(+)
>  create mode 100644 hw/uefi/var-service-core.c

If other reviewers don't object, I'd like to request a respin (of the
series) at this point, and I'll stop reviewing this version here:

- This patch is too large for me. It does migration, UCS2 string
utilities, tracing and device code all in one. I think it should be
split in at least three patches (the changes can go in the same "core" C
source file, but in smaller building blocks).

- in general, we should filter out surrogate code points, for any use.
any UCS2 string from the guest that contains a surrogate code point
should be considered invalid, and the request should be rejected based
just on that.

- after splitting, the resultant parts of this patch should be moved
near the end of the series. It references a bunch of helper functions
(which is fine), but for mentally resolving those, in particular for
understanding the life cycles of the various "uefi_vars_state" fields
*here*, I first need to see the internals of the helper functions. If I
jump back and forth between the patches, that's unwieldy for
interrupting the review one day & resuming it another day. The patches
should be included in "topological order" (dependency order) in the
series. The series already follows this idea roughly, AFAICT, but the
placement of this particular patch seems to stick out.

- life cycle comments on the "uefi_vars_state" fields would be
appreciated in the header file, too.

- a tidbit: "uefi_vars_policies_clear" should be spelled
"uefi_var_policies_clear" (i.e., "var" in singular), for consistency
with the field "var_policies" (it's not called "vars_policies").

Thanks,
Laszlo

> 
> diff --git a/hw/uefi/var-service-core.c b/hw/uefi/var-service-core.c
> new file mode 100644
> index 000000000000..b37f5c403d2f
> --- /dev/null
> +++ b/hw/uefi/var-service-core.c
> @@ -0,0 +1,350 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * uefi vars device
> + */
> +#include "qemu/osdep.h"
> +#include "sysemu/dma.h"
> +#include "migration/vmstate.h"
> +
> +#include "hw/uefi/var-service.h"
> +#include "hw/uefi/var-service-api.h"
> +#include "hw/uefi/var-service-edk2.h"
> +
> +#include "trace/trace-hw_uefi.h"
> +
> +static int uefi_vars_pre_load(void *opaque)
> +{
> +    uefi_vars_state *uv = opaque;
> +
> +    uefi_vars_clear_all(uv);
> +    uefi_vars_policies_clear(uv);
> +    g_free(uv->buffer);
> +    return 0;
> +}
> +
> +static int uefi_vars_post_load(void *opaque, int version_id)
> +{
> +    uefi_vars_state *uv = opaque;
> +
> +    uefi_vars_update_storage(uv);
> +    uv->buffer = g_malloc(uv->buf_size);
> +    return 0;
> +}
> +
> +const VMStateDescription vmstate_uefi_vars = {
> +    .name = "uefi-vars",
> +    .pre_load = uefi_vars_pre_load,
> +    .post_load = uefi_vars_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT16(sts, uefi_vars_state),
> +        VMSTATE_UINT32(buf_size, uefi_vars_state),
> +        VMSTATE_UINT32(buf_addr_lo, uefi_vars_state),
> +        VMSTATE_UINT32(buf_addr_hi, uefi_vars_state),
> +        VMSTATE_BOOL(end_of_dxe, uefi_vars_state),
> +        VMSTATE_BOOL(ready_to_boot, uefi_vars_state),
> +        VMSTATE_BOOL(exit_boot_service, uefi_vars_state),
> +        VMSTATE_BOOL(policy_locked, uefi_vars_state),
> +        VMSTATE_UINT64(used_storage, uefi_vars_state),
> +        VMSTATE_QTAILQ_V(variables, uefi_vars_state, 0,
> +                         vmstate_uefi_variable, uefi_variable, next),
> +        VMSTATE_QTAILQ_V(var_policies, uefi_vars_state, 0,
> +                         vmstate_uefi_var_policy, uefi_var_policy, next),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +size_t uefi_strlen(const uint16_t *str, size_t len)
> +{
> +    size_t pos = 0;
> +
> +    for (;;) {
> +        if (pos == len) {
> +            return pos;
> +        }
> +        if (str[pos] == 0) {
> +            return pos;
> +        }
> +        pos++;
> +    }
> +}
> +
> +gboolean uefi_str_equal(const uint16_t *a, size_t alen,
> +                        const uint16_t *b, size_t blen)
> +{
> +    size_t pos = 0;
> +
> +    alen = alen / 2;
> +    blen = blen / 2;
> +    for (;;) {
> +        if (pos == alen && pos == blen) {
> +            return true;
> +        }
> +        if (pos == alen && b[pos] == 0) {
> +            return true;
> +        }
> +        if (pos == blen && a[pos] == 0) {
> +            return true;
> +        }
> +        if (pos == alen || pos == blen) {
> +            return false;
> +        }
> +        if (a[pos] == 0 && b[pos] == 0) {
> +            return true;
> +        }
> +        if (a[pos] != b[pos]) {
> +            return false;
> +        }
> +        pos++;
> +    }
> +}
> +
> +char *uefi_ucs2_to_ascii(const uint16_t *ucs2, uint64_t ucs2_size)
> +{
> +    char *str = g_malloc0(ucs2_size / 2 + 1);
> +    int i;
> +
> +    for (i = 0; i * 2 < ucs2_size; i++) {
> +        if (ucs2[i] == 0) {
> +            break;
> +        }
> +        if (ucs2[i] < 128) {
> +            str[i] = ucs2[i];
> +        } else {
> +            str[i] = '?';
> +        }
> +    }
> +    str[i] = 0;
> +    return str;
> +}
> +
> +void uefi_trace_variable(const char *action, QemuUUID guid,
> +                         const uint16_t *name, uint64_t name_size)
> +{
> +    QemuUUID be = qemu_uuid_bswap(guid);
> +    char *str_uuid = qemu_uuid_unparse_strdup(&be);
> +    char *str_name = uefi_ucs2_to_ascii(name, name_size);
> +
> +    trace_uefi_variable(action, str_name, name_size, str_uuid);
> +
> +    g_free(str_name);
> +    g_free(str_uuid);
> +}
> +
> +void uefi_trace_status(const char *action, efi_status status)
> +{
> +    switch (status) {
> +    case EFI_SUCCESS:
> +        trace_uefi_status(action, "success");
> +        break;
> +    case EFI_INVALID_PARAMETER:
> +        trace_uefi_status(action, "invalid parameter");
> +        break;
> +    case EFI_UNSUPPORTED:
> +        trace_uefi_status(action, "unsupported");
> +        break;
> +    case EFI_BAD_BUFFER_SIZE:
> +        trace_uefi_status(action, "bad buffer size");
> +        break;
> +    case EFI_BUFFER_TOO_SMALL:
> +        trace_uefi_status(action, "buffer too small");
> +        break;
> +    case EFI_WRITE_PROTECTED:
> +        trace_uefi_status(action, "write protected");
> +        break;
> +    case EFI_OUT_OF_RESOURCES:
> +        trace_uefi_status(action, "out of resources");
> +        break;
> +    case EFI_NOT_FOUND:
> +        trace_uefi_status(action, "not found");
> +        break;
> +    case EFI_ACCESS_DENIED:
> +        trace_uefi_status(action, "access denied");
> +        break;
> +    case EFI_ALREADY_STARTED:
> +        trace_uefi_status(action, "already started");
> +        break;
> +    default:
> +        trace_uefi_status(action, "unknown error");
> +        break;
> +    }
> +}
> +
> +static uint32_t uefi_vars_cmd_mm(uefi_vars_state *uv)
> +{
> +    hwaddr    dma;
> +    mm_header *mhdr;
> +    uint32_t  size, retval;
> +
> +    dma = uv->buf_addr_lo | ((hwaddr)uv->buf_addr_hi << 32);
> +    mhdr = (mm_header *) uv->buffer;
> +
> +    if (!uv->buffer || uv->buf_size < sizeof(*mhdr)) {
> +        return UEFI_VARS_STS_ERR_BAD_BUFFER_SIZE;
> +    }
> +
> +    /* read header */
> +    dma_memory_read(&address_space_memory, dma,
> +                    uv->buffer, sizeof(*mhdr),
> +                    MEMTXATTRS_UNSPECIFIED);
> +
> +    size = sizeof(*mhdr) + mhdr->length;
> +    if (uv->buf_size < size) {
> +        return UEFI_VARS_STS_ERR_BAD_BUFFER_SIZE;
> +    }
> +
> +    /* read buffer (excl header) */
> +    dma_memory_read(&address_space_memory, dma + sizeof(*mhdr),
> +                    uv->buffer + sizeof(*mhdr), mhdr->length,
> +                    MEMTXATTRS_UNSPECIFIED);
> +    memset(uv->buffer + size, 0, uv->buf_size - size);
> +
> +    /* dispatch */
> +    if (qemu_uuid_is_equal(&mhdr->guid, &EfiSmmVariableProtocolGuid)) {
> +        retval = uefi_vars_mm_vars_proto(uv);
> +
> +    } else if (qemu_uuid_is_equal(&mhdr->guid, &VarCheckPolicyLibMmiHandlerGuid)) {
> +        retval = uefi_vars_mm_check_policy_proto(uv);
> +
> +    } else if (qemu_uuid_is_equal(&mhdr->guid, &EfiEndOfDxeEventGroupGuid)) {
> +        trace_uefi_event("end-of-dxe");
> +        uv->end_of_dxe = true;
> +        retval = UEFI_VARS_STS_SUCCESS;
> +
> +    } else if (qemu_uuid_is_equal(&mhdr->guid, &EfiEventReadyToBootGuid)) {
> +        trace_uefi_event("ready-to-boot");
> +        uv->ready_to_boot = true;
> +        retval = UEFI_VARS_STS_SUCCESS;
> +
> +    } else if (qemu_uuid_is_equal(&mhdr->guid, &EfiEventExitBootServicesGuid)) {
> +        trace_uefi_event("exit-boot-service");
> +        uv->exit_boot_service = true;
> +        retval = UEFI_VARS_STS_SUCCESS;
> +
> +    } else {
> +        retval = UEFI_VARS_STS_ERR_NOT_SUPPORTED;
> +    }
> +
> +    /* write buffer */
> +    dma_memory_write(&address_space_memory, dma,
> +                     uv->buffer, sizeof(*mhdr) + mhdr->length,
> +                     MEMTXATTRS_UNSPECIFIED);
> +
> +    return retval;
> +}
> +
> +static void uefi_vars_soft_reset(uefi_vars_state *uv)
> +{
> +    g_free(uv->buffer);
> +    uv->buffer = NULL;
> +    uv->buf_size = 0;
> +    uv->buf_addr_lo = 0;
> +    uv->buf_addr_hi = 0;
> +}
> +
> +void uefi_vars_hard_reset(uefi_vars_state *uv)
> +{
> +    trace_uefi_hard_reset();
> +    uefi_vars_soft_reset(uv);
> +
> +    uv->end_of_dxe        = false;
> +    uv->ready_to_boot     = false;
> +    uv->exit_boot_service = false;
> +    uv->policy_locked     = false;
> +
> +    uefi_vars_clear_volatile(uv);
> +    uefi_vars_policies_clear(uv);
> +    uefi_vars_auth_init(uv);
> +}
> +
> +static uint32_t uefi_vars_cmd(uefi_vars_state *uv, uint32_t cmd)
> +{
> +    switch (cmd) {
> +    case UEFI_VARS_CMD_RESET:
> +        uefi_vars_soft_reset(uv);
> +        return UEFI_VARS_STS_SUCCESS;
> +    case UEFI_VARS_CMD_MM:
> +        return uefi_vars_cmd_mm(uv);
> +    default:
> +        return UEFI_VARS_STS_ERR_NOT_SUPPORTED;
> +    }
> +}
> +
> +static uint64_t uefi_vars_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    uefi_vars_state *uv = opaque;
> +    uint64_t retval = -1;
> +
> +    trace_uefi_reg_read(addr, size);
> +
> +    switch (addr) {
> +    case UEFI_VARS_REG_MAGIC:
> +        retval = UEFI_VARS_MAGIC_VALUE;
> +        break;
> +    case UEFI_VARS_REG_CMD_STS:
> +        retval = uv->sts;
> +        break;
> +    case UEFI_VARS_REG_BUFFER_SIZE:
> +        retval = uv->buf_size;
> +        break;
> +    case UEFI_VARS_REG_BUFFER_ADDR_LO:
> +        retval = uv->buf_addr_lo;
> +        break;
> +    case UEFI_VARS_REG_BUFFER_ADDR_HI:
> +        retval = uv->buf_addr_hi;
> +        break;
> +    }
> +    return retval;
> +}
> +
> +static void uefi_vars_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
> +{
> +    uefi_vars_state *uv = opaque;
> +
> +    trace_uefi_reg_write(addr, val, size);
> +
> +    switch (addr) {
> +    case UEFI_VARS_REG_CMD_STS:
> +        uv->sts = uefi_vars_cmd(uv, val);
> +        break;
> +    case UEFI_VARS_REG_BUFFER_SIZE:
> +        if (val > MAX_BUFFER_SIZE) {
> +            val = MAX_BUFFER_SIZE;
> +        }
> +        uv->buf_size = val;
> +        g_free(uv->buffer);
> +        uv->buffer = g_malloc(uv->buf_size);
> +        break;
> +    case UEFI_VARS_REG_BUFFER_ADDR_LO:
> +        uv->buf_addr_lo = val;
> +        break;
> +    case UEFI_VARS_REG_BUFFER_ADDR_HI:
> +        uv->buf_addr_hi = val;
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps uefi_vars_ops = {
> +    .read = uefi_vars_read,
> +    .write = uefi_vars_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 2,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +void uefi_vars_init(Object *obj, uefi_vars_state *uv)
> +{
> +    QTAILQ_INIT(&uv->variables);
> +    QTAILQ_INIT(&uv->var_policies);
> +    uv->jsonfd = -1;
> +    memory_region_init_io(&uv->mr, obj, &uefi_vars_ops, uv,
> +                          "uefi-vars", UEFI_VARS_REGS_SIZE);
> +}
> +
> +void uefi_vars_realize(uefi_vars_state *uv, Error **errp)
> +{
> +    uefi_vars_json_init(uv, errp);
> +    uefi_vars_json_load(uv, errp);
> +}

