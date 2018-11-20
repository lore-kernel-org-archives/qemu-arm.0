Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp661148wrt;
        Tue, 20 Nov 2018 07:00:55 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XfzNYzF2PBPSCRmcrg+HcpU1OmBWuoKcT9DaI6lQ67kIFr0aFb+mbHTs2Mc4qZ/zss2q14
X-Received: by 2002:a17:902:8214:: with SMTP id x20-v6mr2473001pln.224.1542726055617;
        Tue, 20 Nov 2018 07:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542726055; cv=none;
        d=google.com; s=arc-20160816;
        b=p7MimOnQL24+4I3BU+2d4FMbbC37EfRaxZr3GuKqsK0gRLdSlhhsHkvGZEGZY7otBV
         4o23agoc6DwCtHuu4g/x9hbDn5+f+ZlrsRKIqIKX4khkQfCuJzuDZKCe/YXt7HF/x8On
         MCxixGeYHmJdHTuWf811Yylnyo4NW+nzAdxrPoKt5jx92LNejDcZiabrtua26rk59j8P
         HvYBlmN8i7Uhd6zVVIaZoRgFEslGUb9fm2I7dAa9OtzuLv32Bx5VO7Av5kLWRXKSGulV
         hD5tu57w+HUe0FWVcelgfDyvB10swF2csjuiKphrVwv9jzAIVEpW2PSkz3XJFqN8PeMr
         gY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=trYYq8CANwmLq539e+wtu4St1L2KJ5TUfKBq1nnQvIk=;
        b=DvmPlAjjz5TMo0+PHj4jGK9SWczF7nGRD5W5E+U0Sc9hD5H4aPCojs98F4UGQZQL7Q
         P3TswSSUBTB6CZCGcVybrESquZlHRZjdefoVv2Swrfbp/Pa9etTZ50n+EclQ4Azc9h7/
         654+4DZzGb/1im4nlogNGvaLloheb6cCuYh3ygjztiVaWoCwmbrNuHUDz+7TGBR3QwBq
         eV/84bKOPv1ejBEo7ZTPqe0Ipoivvxi+tpmTH5p9wLwRlmqEmy4l119BCSuno/Tk0cN6
         jO7qJ739Je11susITwi48yd5Xk9CQUt5jXZ69HxpeyUR5JbJc/OPm0XWzp7ctNmxb8Et
         0VCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WzGzpp1C;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id i23si37412498pgb.116.2018.11.20.07.00.55;
        Tue, 20 Nov 2018 07:00:55 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WzGzpp1C;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbeKUBa1 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 20 Nov 2018 20:30:27 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41395 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbeKUBa1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 20 Nov 2018 20:30:27 -0500
Received: by mail-ot1-f65.google.com with SMTP id u16so1896087otk.8
        for <kvm@vger.kernel.org>; Tue, 20 Nov 2018 07:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=trYYq8CANwmLq539e+wtu4St1L2KJ5TUfKBq1nnQvIk=;
        b=WzGzpp1CQJHHW5z0BQA0rEfdOCe2YKwqxlZ5lz+qDbkLljx5rQl/8rM8B1I2/9QD98
         xM5pTlrH8VTXmqHWxjcved//MOgN26nvcA7nIkfXPPQFW40U4vvFexJJ9/O9abuwEeG5
         ko9d6PrGZqfRWRkDF0Ca/55w0qhVy7yN8u53c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=trYYq8CANwmLq539e+wtu4St1L2KJ5TUfKBq1nnQvIk=;
        b=rP/UhK2ntCKB5uzB/6fDyeBb8CeWeP2iUuQIpMk7BBU3U2b93jPlRvX481mSytOm3c
         etKREjGWcjz3/Locw1AW5QuQnsGClhiZVZ4S2oIZsveLR9NTLSARzen37InnynNplKZI
         U0rjGD7lpWCiQTlcZf58GXtCWIhqAs8XK4AezXabQ5JuhLvPCukWHk4ftBId18DYwqVI
         1alcFFF6U13uDSuUAeP5N+ZDhEFr+Lwe4ULhB9+ej6vz6eEo2TMALDbTZD6M9tGv5yoK
         UBOoBK+cNzsjDeJEouQYDlTJsKryuhGaNnC/OdWpO0RodS0Z5t8yPTmCoq2+Ko0nHUn3
         /k8w==
X-Gm-Message-State: AA+aEWaFo8MxRxl4uHMgtkSd3HvyTNROO3wbqbcTsxQRrBakAskf6wdw
        ykvjg4Xp6a13ZcnHLSpsIGR69yV/Zn13Xvaz3HsdBA==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr1404482oth.238.1542726053032;
 Tue, 20 Nov 2018 07:00:53 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 07:00:32
 -0800 (PST)
In-Reply-To: <1541672989-15967-10-git-send-email-gengdongjiu@huawei.com>
References: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com> <1541672989-15967-10-git-send-email-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 20 Nov 2018 15:00:32 +0000
Message-ID: <CAFEAcA_qpWcLULXza_cgB2_vKSBtP1bCwYEhFL0fydkvZ82EmA@mail.gmail.com>
Subject: Re: [PATCH RESEND v15 09/10] hw/arm/virt: Add RAS platform version
 for migration
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: jFO1NyZnL+tk

On 8 November 2018 at 10:29, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> Support this feature since version 2.12, disable it by
> default in the old version.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> Address Shannon's comments to add platform version in [1].
>
> [1]: https://lkml.org/lkml/2017/8/25/821
> ---
>  hw/arm/virt-acpi-build.c | 14 +++++++++-----
>  hw/arm/virt.c            |  4 ++++
>  include/hw/arm/virt.h    |  1 +
>  3 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 19c1b7e..6f50a29 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -836,10 +836,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>
> -    acpi_add_table(table_offsets, tables_blob);
> -    build_hardware_error_table(tables->hardware_errors, tables->linker);
> -    build_apei_hest(tables_blob, tables->hardware_errors, tables->linker);
> -
> +    if (!vmc->no_ras) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_hardware_error_table(tables->hardware_errors, tables->linker);
> +        build_apei_hest(tables_blob, tables->hardware_errors, tables->linker);
> +    }

This looks odd. If we need to gate the addition of the table
on whether the machine type asks for it, then we need the
patch which adds the no_ras flag to come first. Otherwise
there's a point in the commit history where we add the tables
even for the older machine types.

>      if (nb_numa_nodes > 0) {
>          acpi_add_table(table_offsets, tables_blob);
> @@ -926,6 +927,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
>
>  void virt_acpi_setup(VirtMachineState *vms)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      AcpiBuildTables tables;
>      AcpiBuildState *build_state;
>
> @@ -957,7 +959,9 @@ void virt_acpi_setup(VirtMachineState *vms)
>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>                      acpi_data_len(tables.tcpalog));
>
> -    ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
> +    if (!vmc->no_ras) {
> +        ghes_add_fw_cfg(vms->fw_cfg, tables.hardware_errors);
> +    }
>
>      build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
>                                                ACPI_BUILD_RSDP_FILE, 0);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a2b8d8f..367306b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1920,6 +1920,10 @@ static void virt_machine_2_11_options(MachineClass *mc)
>      virt_machine_2_12_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
>      vmc->smbios_old_sys_ver = true;
> +    /* Disable memory recovery feature for 2.11 as RAS support was
> +     * introduced with 2.12.
> +     */
> +    vmc->no_ras = true;

RAS support wasn't introduced with QEMU 2.12, or even with 3.0 or
3.1. The earliest this will be added will be 4.0, so we need to
update this code accordingly.

>  }
>  DEFINE_VIRT_MACHINE(2, 11)
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 4cc57a7..a4490dd 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -98,6 +98,7 @@ typedef struct {
>      bool disallow_affinity_adjustment;
>      bool no_its;
>      bool no_pmu;
> +    bool no_ras;
>      bool claim_edge_triggered_timers;
>      bool smbios_old_sys_ver;
>      bool no_highmem_ecam;
> --
> 1.8.3.1
>

thanks
-- PMM
