Received: by 10.182.158.201 with SMTP id ww9csp2323344obb;
        Tue, 1 Dec 2015 05:50:07 -0800 (PST)
X-Received: by 10.55.81.139 with SMTP id f133mr44885721qkb.54.1448977807029;
        Tue, 01 Dec 2015 05:50:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 89si50327602qgi.63.2015.12.01.05.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 05:50:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:52742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3lJm-0007HO-NR
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 08:50:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a3lJY-0006rw-1N
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 08:49:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a3lJX-0001Cs-5t
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 08:49:51 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a3lJX-0001Cf-1p
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 08:49:51 -0500
Received: by vkha189 with SMTP id a189so3883577vkh.2
	for <qemu-arm@nongnu.org>; Tue, 01 Dec 2015 05:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zcCRav/ZL+mMt0bizviNSprLIQUqow0lQKCZKBLDKus=;
	b=dGfMSwcAJgN7s7rHtNtu51T/GrIEfGPitBs2axzeaVQKMx9h8G+3SoKkQrIuuHDwSz
	yZq42wyi3EyPGvkfZmgg+MtaZB+JFZ6cJ3DqbnGZ9/Gex2+BNAq4apa6/2VqHp8qiM1k
	sAQxLcDMNmQ4Sj976qbVJV1qq20i0Xj1sSTlpcs6HsquJGyJwK2AFDS68hlJDDC4gMJQ
	0pKmZ/9i5dfl3ZXhkqXLRg8wN8hLlNqIiDfMdGEqd/P1EZ+aSr9qZvu5GWbNGDixFk6S
	8J+OfR7wRRQD+3JrQFbIgNiXn9WLOHRgAq3a90T1CofeWoEcBP4Xta+O78G8Ct7hRQzG
	V/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zcCRav/ZL+mMt0bizviNSprLIQUqow0lQKCZKBLDKus=;
	b=I7NCyl72rQxF9nw2tYV6CtElZu0DHjd5zNPsK7k/PNKasUM6xXbjvSk6CB7y/7hVsq
	YTqDTRJKimxWUBXtCxBfyiDmxS2o3PSmaFDq4biCqe0rV/nEd3WH5yO1xoHjDch+3RFb
	MK2bgfsoqPPfaJdOirw/Zg5rDjCzxo9evDBjNJtHFgqEG28KOWCUAW6r+nQ8RYXCIuDC
	prHHR/4I73RlQmeoSRSVDjjmBfdoZG8YKUhfXwRwwqlYwgFtUEQRHXMNkNetLdDSF49c
	fb4aG6Hg3zjWlqACFZsdj3UBTMePebgtPKVpGsb70UKVK5JCTHtYM2K8aoJGtTmgN6qT
	M4rg==
X-Gm-Message-State: ALoCoQkEP8ZsOf53TSQoRnaq06ovyPXvjRHjrYtI5Ljc92v1og+0s0+85a6uIfZys+shtHtp79Jm
X-Received: by 10.31.52.211 with SMTP id b202mr56515811vka.82.1448977790710;
	Tue, 01 Dec 2015 05:49:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 1 Dec 2015 05:49:31 -0800 (PST)
In-Reply-To: <20151201142146.2bcda69f@nial.brq.redhat.com>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-2-git-send-email-shannon.zhao@linaro.org>
	<20151201142146.2bcda69f@nial.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2015 13:49:31 +0000
Message-ID: <CAFEAcA9Mkc31fkr1F-Q3_B4at0kHFZTG7fM3NfJ-FU0VqTbuxQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 1/8] hw/arm/virt: Add a GPIO
	controller
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
X-TUID: K2Jd6mQxj2Ns

On 1 December 2015 at 13:21, Igor Mammedov <imammedo@redhat.com> wrote:
> On Mon, 16 Nov 2015 21:23:02 +0800
> shannon.zhao@linaro.org wrote:
>
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> ACPI 5.0 supports GPIO-signaled ACPI Events. This can be used for
>> powerdown, hotplug evnets. Add a GPIO controller in machine virt,
> s/evnets/events/
>
>> to support powerdown, maybe can be used for cpu hotplug. And
>> here we use pl061.
>>


> vvvvv
>> +    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
>> +    qemu_fdt_add_subnode(vbi->fdt, nodename);
>> +    qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
>> +                                 2, base, 2, size);
>> +    qemu_fdt_setprop(vbi->fdt, nodename, "compatible", compat, sizeof(compat));
>> +    qemu_fdt_setprop_cell(vbi->fdt, nodename, "#gpio-cells", 2);
>> +    qemu_fdt_setprop(vbi->fdt, nodename, "gpio-controller", NULL, 0);
>> +    qemu_fdt_setprop_cells(vbi->fdt, nodename, "interrupts",
>> +                           GIC_FDT_IRQ_TYPE_SPI, irq,
>> +                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>> +    qemu_fdt_setprop_cell(vbi->fdt, nodename, "clocks", vbi->clock_phandle);
>> +    qemu_fdt_setprop_string(vbi->fdt, nodename, "clock-names", "apb_pclk");
>> +
>> +    g_free(nodename);
> could you split off DT parts into a separate patch pls.

I think they belong in this patch. We should never add a device
to the 'virt' board without having the DT binding for it too.

thanks
-- PMM
