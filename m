Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp411974wrt;
        Tue, 25 Sep 2018 01:54:37 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62zUmk+8ADmyq8iiu2kAxu4W3u8oo9weZTHwCuKHq3E9KIXcy+QqjGHi6Lhf8VAmG2MztES
X-Received: by 2002:a37:4453:: with SMTP id r80-v6mr11848qka.79.1537865677707;
        Tue, 25 Sep 2018 01:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537865677; cv=none;
        d=google.com; s=arc-20160816;
        b=Ugyn+6pfSnUyYG2yF734M3Z+teCRaZ0IrmUY0YPLcvUsyepZcHJYVeWGhcPhizkTVg
         8F6xCMVt3UWF9NAx38ob6zwc4YOvLv+1eakAcShFpgtKjAzq2Abl3nkXmajk7YaSOsUr
         kEFpBUdtczjPUWuaqoNuibJpvHXHIrg4RkF7PuwrcHvvaKGN7l/6OgNK0JX8SU6PYdHy
         9J854G7SsXBrRxdXsfNxMxCPrNVmmHK0ZJzImNG2CexlyXY3uI83sI51rx+zK1AesXuu
         OrsVIeBxFagUQ9Y03D00p+zFpETXKZWySM8zH+/1h5ObPnhrDm/Ui9qD4xtXUPX8Wq+m
         0FSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=KXdJ79ak7KbfLEkKaFTyE28OuiBz39t3wgrZ9aGQbQ8=;
        b=0GOW3HOpaBj7pYU+4K0l4nKq7aa2gtMlKwG0L2uexK9D2JPFO/4odBzkJsFi/ZaMhK
         FR493VgGSxYYAHoMFR92jymgzZ/p30ftmDXyctjvEp+OhH1XZOK+fQyewtyJVFBI7eTx
         wRwsn+FhHMqVzWLOenx14ubVQoi4IMghUXdPNX++/kxsfdjtmfl0T6stpe0oa7qMkFxG
         cz3ohy5u3VQf9fNJ7itmYBxSeFu3wwr2O9bzAHZrlrM+zSzKQzcEzZPYwwm+lstLars+
         92mjQeSePjgtTyVkK5Vwy3i63lLKl0BDK4LH7GL60TsUkUCNBIxj8F9Wa3FwKMD4ALo3
         klqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TwAbFoWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z64-v6si1348378qkc.44.2018.09.25.01.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 01:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TwAbFoWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4j77-0002kP-Ar
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 04:54:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4j6v-0002jf-8U
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 04:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4j6u-0008H8-FZ
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 04:54:25 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4j6u-0008Ek-9z
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 04:54:24 -0400
Received: by mail-oi1-x242.google.com with SMTP id n1-v6so829546oic.4
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 01:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KXdJ79ak7KbfLEkKaFTyE28OuiBz39t3wgrZ9aGQbQ8=;
	b=TwAbFoWuCzQtFMGrD/NVdb9HCkB+ZdRCEbZzLWmhraD/6TEo1w1F0qYpCKS9VbVGn4
	duo8iGtebMLo7GmMmF/ggHMsBvTbH3mHNrhpANXMJClzV1fspTNI/ncu75ozI9nhF9Td
	oN7VKnEFdDJgHrLXMKvEuVkvt+oLPHQf6UdgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KXdJ79ak7KbfLEkKaFTyE28OuiBz39t3wgrZ9aGQbQ8=;
	b=eIcG5pna0DN1phxFHT1pYwHNrCZDQK3ZGOpGNHBpFpMV7QhlPv2DmRzqBY3FnxM1gl
	lVYh7AJ0O+aprX3HeP2lf3rBnq2zuYBfi2s9Qyof7D4hleNYBQMqd71YeOEUhE4y56RM
	nlUKUWlH/3mjdXxa/HCyHUzrRyTkEsq/Du+m8ismINjnE8b6di23PrOV7c7tXTBqkW3A
	M0eGMh2/xMwT7C8W5TWsBle1dR3vUEBywu1dGLwEmH7Sk4QeGRQMqCgKTPFe0eBjgvRU
	OME6PvlnFfGq2/78qcdYqy92ub924WZ9SFO+tQgSBli0LR74376D/snNyulEd7Od+isJ
	YPTQ==
X-Gm-Message-State: ABuFfogKxdo1WEZLeeigxPRfZzoQgwfRz4Wvwclr4Whit2n3NhtjV5VC
	6f7bakm8MbEoYt9hT6im/E2rV12z47jii+G2zeL3kA==
X-Received: by 2002:aca:5412:: with SMTP id
	i18-v6mr274328oib.187.1537865663416; 
	Tue, 25 Sep 2018 01:54:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 01:54:03
	-0700 (PDT)
In-Reply-To: <20180911112643.19296-1-shenglong.zsl@alibaba-inc.com>
References: <20180911112643.19296-1-shenglong.zsl@alibaba-inc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 09:54:03 +0100
Message-ID: <CAFEAcA85C1JpsfkU6QsM+G18V=VX9MnCCxbEfUT6Uy6YoeZzoA@mail.gmail.com>
To: Shannon Zhao <shannon.zhaosl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt-acpi-build: Add a
 check for memory-less NUMA nodes
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QaTUElJUKYhS

On 11 September 2018 at 12:26, Shannon Zhao <shannon.zhaosl@gmail.com> wrote:
> From: Shannon Zhao <shannon.zhaosl@gmail.com>
>
> Like commit 16b4226(hw/acpi-build: Add a check for memory-less NUMA node
> ), it also needs to check memory length for NUMA nodes on ARM.
>
> Signed-off-by: Shannon Zhao <shannon.zhaosl@gmail.com>
> ---
>  hw/arm/virt-acpi-build.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ce31abd..5785fb6 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -562,10 +562,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>
>      mem_base = vms->memmap[VIRT_MEM].base;
>      for (i = 0; i < nb_numa_nodes; ++i) {
> -        numamem = acpi_data_push(table_data, sizeof(*numamem));
> -        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
> -                          MEM_AFFINITY_ENABLED);
> -        mem_base += numa_info[i].node_mem;
> +        if (numa_info[i].node_mem > 0) {
> +            numamem = acpi_data_push(table_data, sizeof(*numamem));
> +            build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
> +                              MEM_AFFINITY_ENABLED);
> +            mem_base += numa_info[i].node_mem;
> +        }
>      }
>
>      build_header(linker, table_data, (void *)(table_data->data + srat_start),
> --
> 2.9.3.windows.1



Applied to target-arm.next, thanks.

-- PMM
