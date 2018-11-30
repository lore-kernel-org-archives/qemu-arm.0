Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3728631wrt;
        Fri, 30 Nov 2018 07:51:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XuKyb1TJhyscssAGE0pw/oCHPs5tOGJNTINCHaeiBItobbMmqQmy/QFMVQvKOJmoaoG3c7
X-Received: by 2002:a25:5a0b:: with SMTP id o11-v6mr6047634ybb.52.1543593113576;
        Fri, 30 Nov 2018 07:51:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543593113; cv=none;
        d=google.com; s=arc-20160816;
        b=ttjBH1cyU5mNyj3rL3sE/VUoWfLjnJHEtYXKMHmCixrJMtdCGY0q4/p/EFsmtkptHQ
         gOJfFivpqxCB+/DfcOxYWfzivgXe0c/t3e6l4O9zZev5Xlc2ucHApSo6yzAFpU2/dzID
         JLr6GsJENP6tXRmMq2vhuZlk+mtlhxuEFYR2oxbuBchSflycyn+C+G+7Xy0bCDtiBpDo
         9LRzn0A48HihQ73NH7305wdv66WWlauYSZRHXjfy1jTzEGb64qlcl0a+/rhAb/c3PMas
         9ZU8JmcaLV2Vr6NFrUi9nKpR6j068flZYoZEXAkRrKKaARV4d3++qM9wNWZ+EK8nR4lK
         ZV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pzHTXg1zBHih6DA7EudvDcfoqFZ4tw3oKKcI7yvarJk=;
        b=iAydEAUjNCAsjbEjwbx9uLLYyJF1RDlBORInhM0DzrVAKLOzZ5ScG8lWaU3NDAMSji
         7pi0CbnEzZI20UB2XB9GhdMt0uzxK0Vzxa8v1lH8G5RVYss04F3es8JKI0r/cJJTTVE/
         JRGfT19Q+2/87W0lXOEpI1jjtHJQj2pIWVTyeaCcg1pDHCjryrBcyVkXawTYzOFA+dYl
         3PO3p/mzVAPrhqYPGOum6TE3jS2hza0PNeCsc3HAm9jkgByWdV6K2X23ilicyRlASci2
         Zi4iepXzUFmXzyziniAHnKW2v2PXyGc+4P1Ndwf2wEV3tu4sCQGwslZ9Bc5jEOLyT0qe
         xPJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S+pxTDnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10-v6si3157556yww.167.2018.11.30.07.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 07:51:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S+pxTDnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSl56-0005dH-IY
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 10:51:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSl4r-0005bh-CX
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:51:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSl4q-0005YR-Jq
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:51:37 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSl4q-0005Y7-E1
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:51:36 -0500
Received: by mail-ot1-x344.google.com with SMTP id v23so5471699otk.9
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 07:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pzHTXg1zBHih6DA7EudvDcfoqFZ4tw3oKKcI7yvarJk=;
	b=S+pxTDnwBnH8IIFOe0700kgsZt4IUutiRGc+igMAPuXhSjJNrBNUzO5Khn4QsAeBa0
	bZSaVtk4smgcPUbb+XKa9z5XqPlQO+VJ0o/yvDN0whLW2X5A6ZIo/rGBqnMSe/LfJWrk
	LaQFY613uR1wakr4nyRg5sTDdrLnn1LH4OPcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pzHTXg1zBHih6DA7EudvDcfoqFZ4tw3oKKcI7yvarJk=;
	b=OAWeKiU1fi42vw0VHI6n3gl4d9plSnVfmxZTEOU7zOBdSD/20jPfPYZDSA/oqYXIPy
	Q/BIIKuTlybiUZ90KtxU49fuKtF9sGuyleyWaWnKI16M4hj/faPXdx0RSIQvHkxDYr2N
	Fle9vXnvER/RFv+utFHkHxEBt70YbP70FumkS/H3WehfzSZS6sX83KYptjLul45ILeSM
	kwou3CA4WxyZakyiB8PoLyVOYwGuCygJUJMUdaDw77v5ydFgaDH45xVtZ/R0opmGMdwd
	MtJtKzoIlDNwRv9HuY7xHA6IfkdBCooUz/h3BzZ04pMzR6mXRcgfXIi3DSBNo0ttqn3Z
	OJKw==
X-Gm-Message-State: AA+aEWbFMGuYWGqkdJ7HXBa1kdjNYwQ6aleKfuAwwT4rbaR77cQuux48
	kUq7/w7tHIoafcsjkv+ZXBD3F5tBeujd8nFIHzeKWg==
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr3991759oth.201.1543593095833; 
	Fri, 30 Nov 2018 07:51:35 -0800 (PST)
MIME-Version: 1.0
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-6-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1543407172-16175-6-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 15:51:24 +0000
Message-ID: <CAFEAcA_+JB43Q=O2jVZ6Rr1brawaH1QcmFWWQ2UXevdqr173fg@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH V10 5/9] hw/arm/virt: add pvpanic device in
 virt acpi table
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t8uK0fbX6DqI

On Wed, 28 Nov 2018 at 03:50, Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> Add pvpanic device in virt acpi table, so when kenrel command line

typo: "kernel". I'll leave it to the ACPI experts to review the
meat of this patch.

> uses acpi=force, kernel can get info from acpi table.
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  hw/arm/virt-acpi-build.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5785fb6..2adba60 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -84,6 +84,20 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>      aml_append(scope, dev);
>  }
>
> +static void acpi_dsdt_add_pvpanic(Aml *scope, const MemMapEntry *pvpanic_memmap)
> +{
> +    Aml *dev = aml_device("PEVT");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(pvpanic_memmap->base,
> +                                       pvpanic_memmap->size, AML_READ_WRITE));
> +
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>  static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
>  {
>      Aml *dev = aml_device("FWCF");
> @@ -771,6 +785,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> +    acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
>      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
> --
> 1.8.3.1
>

thanks
-- PMM
