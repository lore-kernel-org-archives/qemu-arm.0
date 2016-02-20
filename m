Received: by 10.25.208.211 with SMTP id h202csp322060lfg;
        Sat, 20 Feb 2016 05:02:35 -0800 (PST)
X-Received: by 10.140.239.66 with SMTP id k63mr24385337qhc.11.1455973355574;
        Sat, 20 Feb 2016 05:02:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e204si18107965qkb.127.2016.02.20.05.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 20 Feb 2016 05:02:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aX7BC-0002HA-TI
	for alex.bennee@linaro.org; Sat, 20 Feb 2016 08:02:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aX7B9-0002Ft-Ug
	for qemu-arm@nongnu.org; Sat, 20 Feb 2016 08:02:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aX7B5-0004or-9I
	for qemu-arm@nongnu.org; Sat, 20 Feb 2016 08:02:31 -0500
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:33724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aX7B4-0004od-UM
	for qemu-arm@nongnu.org; Sat, 20 Feb 2016 08:02:27 -0500
Received: by mail-pa0-x230.google.com with SMTP id fl4so65523464pad.0
	for <qemu-arm@nongnu.org>; Sat, 20 Feb 2016 05:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=GuNSTU//HFqxP5k9WbDZHf0Ufnuepf+R9TZEsY32kqM=;
	b=KXdEZfCDmxqQSufxfGojfKC9l9aRPJjAnD+JNvQ/AC/FsKJjW6SMdZRrjYAemxS/mr
	QBHwTM2mmOlyxcwzdC3ojhioDGUiiLCFds1/x3PihTtl+kq4KYU3c01EQJMWgpBeqCni
	QuwxgLEO17NpLh/4oGjzozyL/WvPWYZlM7e/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=GuNSTU//HFqxP5k9WbDZHf0Ufnuepf+R9TZEsY32kqM=;
	b=XHSV8Qbvvz7zAeSzSwHJp+CzVAE11qtmccmUPqlF8WM9cI7Ah5297fWYE9om0l986c
	uTEXDmpmcHkQ/IBhz/aOTF0fWtLnGiGissJuryT9+PkqQzGqq+tbaitTh/TOzRhGB+w7
	GrMr2BiohpksK7CHcR4AYKVPd6ygpxBMT0btunkS1e8slLMSlFBVrtzEURpnh0Wzc3MN
	k2ZSZ/6VXqRRu7kDamd+zqOLCb/Tdewyy0PkOs9KzEuA2l2A+n4Hv69iLJ6IesQ9ysk+
	vt9YUp9ArkiCEQw0v/8jDrDd14YNBFzA3lqiZ/BODvfHweoCId/E5SxdPtvl02PrTTwi
	5vDw==
X-Gm-Message-State: AG10YORFaqH9jJskyniitYMdv1Y1ub5s7XdQ13d+kbQ8eGlMDE9iIwgWEm+1n1du/QApZSgK
X-Received: by 10.66.157.161 with SMTP id wn1mr25393311pab.146.1455973344407; 
	Sat, 20 Feb 2016 05:02:24 -0800 (PST)
Received: from [10.10.2.154] ([104.238.45.44])
	by smtp.googlemail.com with ESMTPSA id
	1sm24633905pfm.10.2016.02.20.05.02.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 20 Feb 2016 05:02:23 -0800 (PST)
Message-ID: <56C863D8.7060400@linaro.org>
Date: Sat, 20 Feb 2016 21:02:16 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Gabriel L. Somlo" <somlo@cmu.edu>, qemu-devel@nongnu.org
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<1455906029-25565-5-git-send-email-somlo@cmu.edu>
In-Reply-To: <1455906029-25565-5-git-send-email-somlo@cmu.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::230
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, ard.biesheuvel@linaro.org,
	matt@codeblueprint.co.uk, stefanha@gmail.com, mst@redhat.com,
	leif.lindholm@linaro.org, luto@amacapital.net,
	qemu-arm@nongnu.org, kraxel@redhat.com, imammedo@redhat.com,
	pbonzini@redhat.com, lersek@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 4/5] acpi: arm: add fw_cfg
 device node to dsdt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fu9yTn7nOvkY



On 2016/2/20 2:20, Gabriel L. Somlo wrote:
> Add a fw_cfg device node to the ACPI DSDT. This is mostly
> informational, as the authoritative fw_cfg MMIO region(s)
> are listed in the Device Tree. However, since we are building
> ACPI tables, we might as well be thorough while at it...
>
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Tested-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Marc Marí <markmb@redhat.com>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>   hw/arm/virt-acpi-build.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 8cf9a21..7d7998b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -81,6 +81,20 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>       aml_append(scope, dev);
>   }
>
> +static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> +{
> +    Aml *dev = aml_device("FWCF");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> +    /* device present, functioning, decoding, not shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> +                                       fw_cfg_memmap->size, AML_READ_WRITE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>   static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
>   {
>       Aml *dev, *crs;
> @@ -548,6 +562,7 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>       acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                          (irqmap[VIRT_UART] + ARM_SPI_BASE));
>       acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> +    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
>       acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                       (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>       acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
>

-- 
Shannon
