Received: by 10.223.159.74 with SMTP id f10csp3437613wrg;
        Mon, 11 Dec 2017 21:55:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBouT/khacvqcNtB1ZHk6ddXDWbWHroMj5OW3CmmPYMo6Ku43HKm7bayRld/fVit6RUW/TpjJ
X-Received: by 10.129.124.70 with SMTP id x67mr2023998ywc.266.1513058157897;
        Mon, 11 Dec 2017 21:55:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513058157; cv=none;
        d=google.com; s=arc-20160816;
        b=HZx600flTwV/yiiJHafc98h6DhgGlvYXoI5SzfnOigCm2wjsw4n9k0LA0g+JqBgrUT
         /HxdDIvaoRwkDEPsx67NVYbskfj1bBqTqFZbpMhx07E5c9fHSAdmoi/b/1Mjcj1uNjjo
         UQ9g7qHnwITmhCMhN5TEMEuMVzN4/1XPCFws2CiUy/B+ojSM9f2HqWP8Fs0t7C7yOwc6
         Uo4PAEF8g25RF5v40oTy3eWpDofHjLXgsMitihW7jUCz2djDrPhMcW1gewTMBfSLzeAU
         A5DmHNpk/fPqIm/lV4S/odHQEkXytjPHQ86kFZObKJiqMND0EWesT93AcYWIHJF3Zgf7
         WV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=XUUZdJVF2fgUsbQNvWogKkxwhtUSE011njS0p8/VgKs=;
        b=iiaA6NIQY6nI5B9OjRXO64QqKlMyAY0ec3wIH7yXrQZ5uS5Re5j6IoBJwwcehen04i
         pN/Ixo0Zv3pw5mIoj7Mutb0U3WSHV0pxKNXUwR7d+JBN5fRYa2M8aLWHxkActEog1foB
         93xQ6yE7r+1N+vVkvidOFttogdjZHkYvvXEeby0aM3Jswf7LDFSwaNV9883CUpRvIn2c
         i3MpgvElb7BxoAHCRQc1+1mt1HP0BskPlGCEhl6SUJo1eSJlk1IVRnQ8hPy1kIZu1jOf
         yoRCzfbCJbZbl/UGsYnCjZHjciCXK0H5jCKssoqYAAPg6bKXbDsZRUkTI+6fdHNL04+S
         qDIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n8si3325937ywc.335.2017.12.11.21.55.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 21:55:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOdXp-0006eb-Ck
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 00:55:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eOdWN-0005xs-Sv
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 00:54:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eOdWJ-00058L-OJ
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 00:54:27 -0500
Received: from [45.249.212.32] (port=51618 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eOdWJ-000561-DK
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 00:54:23 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 211DA4CD6E325;
	Tue, 12 Dec 2017 13:54:06 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.361.1; Tue, 12 Dec 2017
	13:53:56 +0800
Message-ID: <5A2F6ED9.5030605@huawei.com>
Date: Tue, 12 Dec 2017 13:53:29 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add second
 UART to ACPI tables
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DLQ303zzrgPB



On 2017/12/8 23:02, Peter Maydell wrote:
> Add the second UART to the ACPI tables.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Pure guesswork, as I don't have a UEFI setup to hand and
> am not familiar with ACPI table formats either...
> ---
>  hw/arm/virt-acpi-build.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3d78ff6..a38287b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -689,6 +689,7 @@ static void build_fadt(GArray *table_data, BIOSLinker *linker,
>  static void
>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      Aml *scope, *dsdt;
>      const MemMapEntry *memmap = vms->memmap;
>      const int *irqmap = vms->irqmap;
> @@ -706,6 +707,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> +    if (!vmc->no_second_uart) {
> +        acpi_dsdt_add_uart(scope, &memmap[VIRT_UART_2],
> +                           (irqmap[VIRT_UART_2] + ARM_SPI_BASE));
> +    }
>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> 
Reviewed-by: Shannon Zhao <zhaoshenglong@huawei.com>

-- 
Shannon

