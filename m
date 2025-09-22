Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEC4CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 12:43:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0fsa-0002zX-RX; Mon, 22 Sep 2025 08:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v0fsW-0002xV-E8
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 08:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v0fsS-0006wx-3v
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 08:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758544961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fe91+EOYyaLY+vFu1TWoznWYYazoLnnVetoNocTbs5Y=;
 b=ahBB+fVEKpx6cPfCXfP+qLIB990o8aPD3U0XHgHMkDYbXhryqPJazT0cFFkaCeeP7Co/5J
 TIWBnuC6bSkJHIQyxznSVKrfsCAmmDdB3uOywErkUztC8XRxoh7dRLA/L+pS3nIMHcRXeG
 ImunoOQDid0bN4S4naTf10EKjSIPC1k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672--F-Ci1YFMZaAfKyDvyspdQ-1; Mon, 22 Sep 2025 08:42:34 -0400
X-MC-Unique: -F-Ci1YFMZaAfKyDvyspdQ-1
X-Mimecast-MFC-AGG-ID: -F-Ci1YFMZaAfKyDvyspdQ_1758544953
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45dd66e1971so35422055e9.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 05:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758544953; x=1759149753;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fe91+EOYyaLY+vFu1TWoznWYYazoLnnVetoNocTbs5Y=;
 b=TZYRvk5mOIt8n00h7T1T61yleH4KoKNHVj2Vj6RzMu6syv8mUJFhZMZihIk4xRy3sJ
 NRBPzsh+EYGDUHGQiPb53BPwlgRZZoOBXrtGSa3YAbRxLnFnyVbB7dUQ9XunVb2e+1W2
 OWwqaguszloPtOQY8UC1vYHQbLumW6vKePYggkGlKErE2rQpVUMPY3HbHW0CeT2GFgSQ
 pVSp8QdpVn0OaB3KL+9D/6G+HCy4rSpnVwBWFnLWl22e9Bu7Ygo1BrwvI8T6iTHGQ04B
 hVPwxHoDnHgEc1cTvFQNej26kXLBZ7vvDZ3YygiFR7VnRm/aCm/crCdgsxfenO0tIuuv
 gPqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDjuZuD9WScaLMQNNmQLMnvnW0t+lADX39iDVIDsm5+GYKRs1qGRxHWusThoEvySKgjwwt9akY1g==@nongnu.org
X-Gm-Message-State: AOJu0Yz1T2E+6syZhwMUlrgxsy8v0vFXaayW5bw2bTK9phdhlD5oqWt3
 Hd+uOLXUyG2sdvaNLPEfTxDRDOZbSaRRL+x0WX3T7OemkAVhuzXhyRg2Q8/yDQotLIiLQbQBvSt
 yf8RxNXp2Dii0e3wamHDD7fpYrqx+v2Mst3cWXaK2VoWOQX6aWoZSig==
X-Gm-Gg: ASbGnctBnkT0+HthW5+rrUz/y4dzbDVi3IKRCvzlqlFoq0NkNI1gPBM+qoVbcP/s8z7
 fgqn8ANoYa8Pk2fZeAARQ5QQVZx/QH0RDObfdlLTl86SmuU/t4qHyXfU4wtm4Eptva8/BdgyXjH
 YjlliO7FYD3jwSy0saFm63+J8kRcHckJM9ssOm7corfB8TxtkvMCl/1WpeXTsM2C6orh/l+VVfe
 wa6yRgpyguDe4534cam3W9ICoYW8T08X1Z/Pq3m/7KzoUL//4rdFPIVPViNeKQJGm5yMoPkOFME
 WXKpTrvpo2z2baNuEqVmHMAWMn4zhHHM03Q=
X-Received: by 2002:a05:600c:5248:b0:46d:3576:2895 with SMTP id
 5b1f17b1804b1-46d35762b25mr35996565e9.24.1758544952932; 
 Mon, 22 Sep 2025 05:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcAZtyDmG+nYQ4fgu8WZbfYa9uYijInMzWx9IixL/Jrg1dCn1NuGA/FyypC5GR1Q5vqtdk0w==
X-Received: by 2002:a05:600c:5248:b0:46d:3576:2895 with SMTP id
 5b1f17b1804b1-46d35762b25mr35995965e9.24.1758544952286; 
 Mon, 22 Sep 2025 05:42:32 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73ea:f900:52ee:df2b:4811:77e0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-467fc818e00sm163413815e9.0.2025.09.22.05.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 05:42:31 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:42:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: Re: [PATCH v11 13/17] qapi/acpi-hest: add an interface to do generic
 CPER error injection
Message-ID: <20250922083810-mutt-send-email-mst@kernel.org>
References: <cover.1757084668.git.mchehab+huawei@kernel.org>
 <e9a1277fd306a30c9e6f1582a83944a3f4a4aeff.1757084668.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <e9a1277fd306a30c9e6f1582a83944a3f4a4aeff.1757084668.git.mchehab+huawei@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8etQO0svCFfZ1U7jyPL4N8FHqX4dJyr8DaUObEYyNgQ_1758544953
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Fri, Sep 05, 2025 at 05:09:20PM +0200, Mauro Carvalho Chehab wrote:
> Creates a QMP command


should be "Create" - imperative mood for commit log

> to be used for generic ACPI APEI hardware error
> injection (HEST) via GHESv2, and add support for it for ARM guests.
> 
> Error injection uses ACPI_HEST_SRC_ID_QMP source ID to be platform
> independent. This is mapped at arch virt bindings, depending on the
> types supported by QEMU and by the BIOS. So, on ARM, this is supported
> via ACPI_GHES_NOTIFY_GPIO notification type.
> 
> This patch is co-authored:

was, I guess

>     - original ghes logic to inject a simple ARM record by Shiju Jose;
>     - generic logic to handle block addresses by Jonathan Cameron;
>     - generic GHESv2 error inject by Mauro Carvalho Chehab;
> 
> Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Co-authored-by: Shiju Jose <shiju.jose@huawei.com>
> Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> ---
>  MAINTAINERS              |  7 +++++++
>  hw/acpi/Kconfig          |  5 +++++
>  hw/acpi/ghes.c           |  2 +-
>  hw/acpi/ghes_cper.c      | 39 +++++++++++++++++++++++++++++++++++++++
>  hw/acpi/ghes_cper_stub.c | 20 ++++++++++++++++++++
>  hw/acpi/meson.build      |  2 ++
>  hw/arm/virt-acpi-build.c |  1 +
>  hw/arm/virt.c            |  7 +++++++
>  include/hw/acpi/ghes.h   |  1 +
>  include/hw/arm/virt.h    |  1 +
>  qapi/acpi-hest.json      | 36 ++++++++++++++++++++++++++++++++++++
>  qapi/meson.build         |  1 +
>  qapi/qapi-schema.json    |  1 +
>  13 files changed, 122 insertions(+), 1 deletion(-)
>  create mode 100644 hw/acpi/ghes_cper.c
>  create mode 100644 hw/acpi/ghes_cper_stub.c
>  create mode 100644 qapi/acpi-hest.json
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1ae28e880424..e609678ba9d6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2165,6 +2165,13 @@ F: hw/acpi/ghes.c
>  F: include/hw/acpi/ghes.h
>  F: docs/specs/acpi_hest_ghes.rst
>  
> +ACPI/HEST/GHES/ARM processor CPER
> +R: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +S: Maintained
> +F: hw/arm/ghes_cper.c
> +F: hw/acpi/ghes_cper_stub.c
> +F: qapi/acpi-hest.json
> +
>  ppc4xx
>  L: qemu-ppc@nongnu.org
>  S: Orphan
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 1d4e9f0845c0..daabbe6cd11e 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -51,6 +51,11 @@ config ACPI_APEI
>      bool
>      depends on ACPI
>  
> +config GHES_CPER
> +    bool
> +    depends on ACPI_APEI
> +    default y
> +
>  config ACPI_PCI
>      bool
>      depends on ACPI && PCI
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 0135ac844bcf..1d02ef6dcb70 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -553,7 +553,7 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>      /* Write the generic error data entry into guest memory */
>      cpu_physical_memory_write(cper_addr, cper, len);
>  
> -    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
> +    notifier_list_notify(&acpi_generic_error_notifiers, &source_id);
>  }
>  
>  int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c
> new file mode 100644
> index 000000000000..1a391d85fc61
> --- /dev/null
> +++ b/hw/acpi/ghes_cper.c
> @@ -0,0 +1,39 @@
> +/*
> + * CPER payload parser for error injection
> + *
> + * Copyright(C) 2024-2025 Huawei LTD.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qemu/base64.h"
> +#include "qemu/error-report.h"
> +#include "qemu/uuid.h"
> +#include "qapi/qapi-commands-acpi-hest.h"
> +#include "hw/acpi/ghes.h"
> +
> +void qmp_inject_ghes_v2_error(const char *qmp_cper, Error **errp)
> +{
> +    AcpiGhesState *ags;
> +
> +    ags = acpi_ghes_get_state();
> +    if (!ags) {
> +        return;
> +    }
> +
> +    uint8_t *cper;
> +    size_t  len;
> +


Coding style violation - declarations at the beginning of the block.


> +    cper = qbase64_decode(qmp_cper, -1, &len, errp);

cper allocated here ...

> +    if (!cper) {
> +        error_setg(errp, "missing GHES CPER payload");
> +        return;
> +    }
> +
> +    ghes_record_cper_errors(ags, cper, len, ACPI_HEST_SRC_ID_QMP, errp);

used here but never freed - ghes_record_cper_errors gets cper as a const
pointer.

this will leak memory.


> +}
> diff --git a/hw/acpi/ghes_cper_stub.c b/hw/acpi/ghes_cper_stub.c
> new file mode 100644
> index 000000000000..b16be73502db
> --- /dev/null
> +++ b/hw/acpi/ghes_cper_stub.c
> @@ -0,0 +1,20 @@
> +/*
> + * Stub interface for CPER payload parser for error injection
> + *
> + * Copyright(C) 2024-2025 Huawei LTD.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-acpi-hest.h"
> +#include "hw/acpi/ghes.h"
> +
> +void qmp_inject_ghes_v2_error(const char *cper, Error **errp)
> +{
> +    error_setg(errp, "GHES QMP error inject is not compiled in");
> +}
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index 73f02b96912b..56b5d1ec9691 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -34,4 +34,6 @@ endif
>  system_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))
>  system_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_false: files('pci-bridge-stub.c'))
>  system_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
> +system_ss.add(when: 'CONFIG_GHES_CPER', if_true: files('ghes_cper.c'))
> +system_ss.add(when: 'CONFIG_GHES_CPER', if_false: files('ghes_cper_stub.c'))
>  system_ss.add(files('acpi-qmp-cmds.c'))
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 2080d535c476..47a49d4e01b3 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -1017,6 +1017,7 @@ static void acpi_align_size(GArray *blob, unsigned align)
>  
>  static const AcpiNotificationSourceId hest_ghes_notify[] = {
>      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> +    { ACPI_HEST_SRC_ID_QMP, ACPI_GHES_NOTIFY_GPIO },
>  };
>  
>  static const AcpiNotificationSourceId hest_ghes_notify_10_0[] = {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index dc6634a6a6c5..1e904432be3b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1050,6 +1050,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>  
>  static void virt_generic_error_req(Notifier *n, void *opaque)
>  {
> +    uint16_t *source_id = opaque;
> +
> +    /* Currently, only QMP source ID is async */
> +    if (*source_id != ACPI_HEST_SRC_ID_QMP) {
> +        return;
> +    }
> +
>      VirtMachineState *s = container_of(n, VirtMachineState, generic_error_notifier);
>  
>      acpi_send_event(s->acpi_dev, ACPI_GENERIC_ERROR);
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 390943e46d99..df2ecbf6e4a9 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -65,6 +65,7 @@ enum AcpiGhesNotifyType {
>   */
>  enum AcpiGhesSourceID {
>      ACPI_HEST_SRC_ID_SYNC,
> +    ACPI_HEST_SRC_ID_QMP,       /* Use it only for QMP injected errors */
>  };
>  
>  typedef struct AcpiNotificationSourceId {
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 91e2ac7e3e80..67fa2cdf408d 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -33,6 +33,7 @@
>  #include "exec/hwaddr.h"
>  #include "qemu/notify.h"
>  #include "hw/boards.h"
> +#include "hw/acpi/ghes.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/bsa.h"
>  #include "hw/block/flash.h"
> diff --git a/qapi/acpi-hest.json b/qapi/acpi-hest.json
> new file mode 100644
> index 000000000000..2e1cdf34847d
> --- /dev/null
> +++ b/qapi/acpi-hest.json
> @@ -0,0 +1,36 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +##
> +# == GHESv2 CPER Error Injection
> +#
> +# Defined since ACPI Specification 6.1,
> +# section 18.3.2.8 Generic Hardware Error Source version 2. See:
> +#
> +# https://uefi.org/sites/default/files/resources/ACPI_6_1.pdf
> +##
> +
> +
> +##
> +# @inject-ghes-v2-error:
> +#
> +# Inject an error with additional ACPI 6.1 GHESv2 error information
> +#
> +# @cper: contains a base64 encoded string with raw data for a single
> +#     CPER record with Generic Error Status Block, Generic Error Data
> +#     Entry and generic error data payload, as described at
> +#     https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#format
> +#
> +# Features:
> +#
> +# @unstable: This command is experimental.
> +#
> +# Since: 10.0

Needs an update?


> +##
> +{ 'command': 'inject-ghes-v2-error',
> +  'data': {
> +    'cper': 'str'
> +  },
> +  'features': [ 'unstable' ]
> +}
> diff --git a/qapi/meson.build b/qapi/meson.build
> index ca6b61a608d0..a46269b5a0c9 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -59,6 +59,7 @@ if have_system
>    qapi_all_modules += [
>      'accelerator',
>      'acpi',
> +    'acpi-hest',
>      'audio',
>      'cryptodev',
>      'qdev',
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 82f111ba063c..b93dd68d94c6 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -68,6 +68,7 @@
>  { 'include': 'misc-i386.json' }
>  { 'include': 'audio.json' }
>  { 'include': 'acpi.json' }
> +{ 'include': 'acpi-hest.json' }
>  { 'include': 'pci.json' }
>  { 'include': 'stats.json' }
>  { 'include': 'virtio.json' }
> -- 
> 2.51.0


