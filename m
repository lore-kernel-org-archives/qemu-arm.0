Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1917925njb;
        Mon, 7 Oct 2024 06:00:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDCwVr5mm9xAGhCohgQe9zY/3vKmy1FZravlx317gvMsEtUf5/92uZx7TnM8Y/p8ttNuZU0a2S6X8tLg==@linaro.org
X-Google-Smtp-Source: AGHT+IFd4H1RVcE0cijnqSuvYtM0s4iUdBQpf4nS64aeIjvtLsVLxRpZI/f5aers+3GhbIWMB0z1
X-Received: by 2002:ac8:7d4a:0:b0:45c:9164:b51 with SMTP id d75a77b69052e-45d9bb12d78mr192198551cf.56.1728306042867;
        Mon, 07 Oct 2024 06:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728306042; cv=none;
        d=google.com; s=arc-20240605;
        b=fAI+xH0qXPMbKO8nmBztjioi+nITH/NhH4Od9pgwcReiOTne6Dz4OjKIn3Rz9x1Dh9
         DKUsWFagel6cpauD4kLWTEjlQRRxWy8uz8gOEUZBYeItan1APRHZWUgx+xyEdrrGVhet
         givdSpPHd7B4F+Q2L0NtCLQL+QZCzjEq/xMgnRtHeAXqSL2nsWBShNI4PgAMF+tCx/B9
         ffggkv/fMwA7nGd9l+x/jLGx9abV6KcMXc2884br0+uHoRbvRrOv0MrKrB0G4M//B1iD
         Zj2wsRfoGaUMuQ++41u0Be+lWllDvcDV0e0EU87XBynpCe8rtMwjVDZwfODOgdbsgnvK
         NFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=lH3FVvekpqnjNxrrKTGLoKx1238o4ywoFvMB1Gr16gc=;
        fh=+bEiewkmFa2kHHPcJylkR2UZug/S8qZg1dlOYn/WBNg=;
        b=GwMunE9ZS1c/OcXJm43FaKZ20VgzToeXC/KUVubqJkieCnL+jBxEWucccmDe/y3Fxr
         P1FgBmYAhaGl7Um+/OgpmGRP8A26APff4RgrM3dxjLh/JO9/jVTJiTBkfj9PVpeKshEm
         1K1zoLPqr/nkWRXnhBlfp250LoqYLdK2Vfo39C/pAzaK534S4ne0uixNNNQajbsrl8xn
         06vkt5nWI1/JD7/WZU4AEYdAE3s26+uCJ6pxQGfWX8u59bY0DMQzECdurN8as/kHJicU
         osjF0bUt9OLWoNKUNDJ+MmRV5Y1FVS8VyMIhNGhd2SpwyUdx7srwnps3iVnlXj0V3dbZ
         FFIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N3wthmfD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da75df6f9si62942581cf.390.2024.10.07.06.00.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 06:00:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N3wthmfD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxnLX-0005O5-6a; Mon, 07 Oct 2024 09:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sxnLF-0005Gx-72
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 09:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sxnLB-0006rg-QC
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 09:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728305995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lH3FVvekpqnjNxrrKTGLoKx1238o4ywoFvMB1Gr16gc=;
 b=N3wthmfDEemHwVqieXS2ZyOE4UhgbqtwCOK04Yu4MYPrBeZW3NHvuCDySP7nUzbwIBEHTk
 bPOzuZvpN8hs9E8hxfISdFo0rOrCH7CSdNvtR/LOvvWczVmJ+o71bNTmfuAV+UU9vyPz1W
 QLjV1EV0c1l44rBm9vuPCWj1xK9p8MI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-z80cpmPVPqSk6bDjEiZTXQ-1; Mon, 07 Oct 2024 08:59:54 -0400
X-MC-Unique: z80cpmPVPqSk6bDjEiZTXQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cdeac2da6so39389255e9.2
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 05:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728305993; x=1728910793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lH3FVvekpqnjNxrrKTGLoKx1238o4ywoFvMB1Gr16gc=;
 b=YuFwx/y6hchNUkxKGee16UhDEw7HFBGpFYSkqiHBIq+3CytJSVlukHUJPyh7IAsn1I
 sW7SMiTLjGGl9EOyq0ApxCZ39qL5JtTQgRwn3DCY9umGqaE/g9AaUqpWGo5q4oeW6yCW
 M8GtBx2E9EmXtauyy0jMbKzhK4EFiTGkc297Vm7p4zAMrhWadk1VFxZZYJIqhLYmPOy/
 3yIh+nh3lHMyUMvNr3/hcQun4TAM1sUB5BXF5oK3a9jOxns3NUIjdnVdQKCZByaTtPty
 YjNL9Yf/cbw6eELcuVRkoPGNQfS2p/yeLDcIavkuarG4WjOmIye+F4BvW5nzaudihdmX
 3ufg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPHgGbuHAqyJCu3rPXr72RrwDs4/UsVdDzyCs/h+39KTgKGtNKeO0SFQbKtZWbhrNrCEMix8pUhQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywa+Udn8C99IiRmlDzGo9jwJdIkQg5NrDQLOAG/SJCaR+kpVZvp
 /9oU/Pt4f2OeKq6TGtEGCARutnAvUiqGpQSNcZkLRIkcXzc2ZGzvU+pLviPUxEH3AtnUEcQWXJN
 h1EfyPMoqtdoaFO+wIggP6bl6xk64raYGkLUQti0hO1K1T++AqA==
X-Received: by 2002:a05:600c:511d:b0:42c:e0da:f13e with SMTP id
 5b1f17b1804b1-42f85ab7b98mr85273315e9.18.1728305993442; 
 Mon, 07 Oct 2024 05:59:53 -0700 (PDT)
X-Received: by 2002:a05:600c:511d:b0:42c:e0da:f13e with SMTP id
 5b1f17b1804b1-42f85ab7b98mr85272535e9.18.1728305992193; 
 Mon, 07 Oct 2024 05:59:52 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f89e89b42sm73389795e9.13.2024.10.07.05.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 05:59:51 -0700 (PDT)
Date: Mon, 7 Oct 2024 14:59:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Annie Li <annie.li@oracle.com>
Cc: miguel.luis@oracle.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 dave@treblig.org, mst@redhat.com, anisinha@redhat.com,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 zhao1.liu@intel.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 eblake@redhat.com, armbru@redhat.com
Subject: Re: [RFC V2 PATCH 02/11] acpi: Implement control method sleep button
Message-ID: <20241007145950.0e53023c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240927183906.1248-3-annie.li@oracle.com>
References: <20240927183906.1248-1-annie.li@oracle.com>
 <20240927183906.1248-3-annie.li@oracle.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.153,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: vnFEIiYslkWD

On Fri, 27 Sep 2024 14:38:57 -0400
Annie Li <annie.li@oracle.com> wrote:

> The control method sleep button is added, as well as its GPE event
> handler.
> 
> Co-developed-by: Miguel Luis <miguel.luis@oracle.com>
> Signed-off-by: Annie Li <annie.li@oracle.com>
> ---
>  hw/acpi/control_method_device.c         | 54 +++++++++++++++++++++++++
>  hw/acpi/meson.build                     |  1 +
>  include/hw/acpi/control_method_device.h | 25 ++++++++++++
>  3 files changed, 80 insertions(+)
> 
> diff --git a/hw/acpi/control_method_device.c b/hw/acpi/control_method_device.c
> new file mode 100644
> index 0000000000..f52c190352
> --- /dev/null
> +++ b/hw/acpi/control_method_device.c
> @@ -0,0 +1,54 @@
> +/*
> + * Control method devices
> + *
> + * Copyright (c) 2023 Oracle and/or its affiliates.
> + *
> + *
> + * Authors:
> + *     Annie Li <annie.li@oracle.com>
> + *
> + *

> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.

replace it with SPDX-License-Identifier like it's done elsewhere

> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/control_method_device.h"
> +#include "hw/mem/nvdimm.h"
> +
> +void acpi_dsdt_add_sleep_button(Aml *scope)
> +{
> +    Aml *dev = aml_device("\\_SB."ACPI_SLEEP_BUTTON_DEVICE);

drop "\\_SB." here and below as well, 

> +    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C0E")));
> +    Aml *pkg = aml_package(2);
> +    aml_append(pkg, aml_int(0x01));
> +    aml_append(pkg, aml_int(0x04));
> +    aml_append(dev, aml_name_decl("_PRW", pkg));
> +    aml_append(dev, aml_operation_region("\\Boo", AML_SYSTEM_IO,
use some sensible name for opreg

> +                                         aml_int(0x201), 0x1));
> +    Aml *field = aml_field("\\Boo", AML_BYTE_ACC, AML_NOLOCK,
> +                           AML_WRITE_AS_ZEROS);
> +    aml_append(field, aml_named_field("SBP", 1));
> +    aml_append(field, aml_named_field("SBW", 1));
> +    aml_append(dev, field);
> +    aml_append(scope, dev);
> +}

also above and below lacks any documentation,
add comments for relevant spec references, like we do with other ACPI
functions. Also perhaps, it's out of order, reviewer has not clue
where from above registers come and how it is supposed to work.

if you invented those registers, there should be a preceding doc patch
that documents them.

Suggest to reorder after patch that implements above registers in hw,
and also comment here where to look for them.

> +
> +void acpi_dsdt_add_sleep_gpe_event_handler(Aml *scope)
> +{
> +     Aml *method = aml_method("_L07", 0, AML_NOTSERIALIZED);
> +     Aml *condition = aml_if(aml_name("\\_SB.SLPB.SBP"));
> +     aml_append(condition, aml_store(aml_int(1), aml_name("\\_SB.SLPB.SBP")));
> +     aml_append(condition,
> +                aml_notify(aml_name("\\_SB."ACPI_SLEEP_BUTTON_DEVICE),
> +                                    aml_int(0x80)));
> +     aml_append(method, condition);
> +     condition = aml_if(aml_name("\\_SB.SLPB.SBW"));
> +     aml_append(condition, aml_store(aml_int(1), aml_name("\\_SB.SLPB.SBW")));
> +     aml_append(condition,
> +                aml_notify(aml_name("\\_SB."ACPI_SLEEP_BUTTON_DEVICE),
> +                                    aml_int(0x2)));
> +     aml_append(method, condition);
> +     aml_append(scope, method);
> +}
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index fa5c07db90..0b4f1b432d 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -17,6 +17,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_CXL', if_true: files('cxl.c'), if_false: files('cxl-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('control_method_device.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
> diff --git a/include/hw/acpi/control_method_device.h b/include/hw/acpi/control_method_device.h
> new file mode 100644
> index 0000000000..87f8d6fd59
> --- /dev/null
> +++ b/include/hw/acpi/control_method_device.h
> @@ -0,0 +1,25 @@
> +/*
> + * Control method devices
> + *
> + * Copyright (c) 2023 Oracle and/or its affiliates.
> + *
> + *
> + * Authors:
> + *     Annie Li <annie.li@oracle.com>
> + *
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +
> +#ifndef HW_ACPI_CONTROL_METHOD_DEVICE_H
> +#define HW_ACPI_CONTROL_NETHOD_DEVICE_H
> +
> +#define ACPI_SLEEP_BUTTON_DEVICE "SLPB"
> +
> +void acpi_dsdt_add_sleep_button(Aml *scope);
> +void acpi_dsdt_add_sleep_gpe_event_handler(Aml *scope);
> +
> +#endif

