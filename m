Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp873548wro;
        Thu, 14 Mar 2019 06:49:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIhkUaKGwt1/gHodjWKoiuY8sZCOirWhUvPCvjzutJ7VPs1D0RcJBL+3W4NwoYoifYjXvg
X-Received: by 2002:a81:ac4f:: with SMTP id z15mr39390665ywj.59.1552571358807;
        Thu, 14 Mar 2019 06:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552571358; cv=none;
        d=google.com; s=arc-20160816;
        b=Nc2lsoty66u6KVcyo4aCXQoMrFXXKasDeELWybsm9rCXicqti/UyjPCc/ACFbRrgLL
         6up8Jn5A7dIiTi8hcXUQ6deLrWI0xtdHdzd09sb+phaNd8TWVuV+G8GHc10yLYf5EyLY
         XN+J+mO2qucQSo5bgs0jk1I4296RcAsu8foI8TottSXNSxedbGasrlt8WeiySruB5NUf
         ODx4+A+TGccLCQi70iFreVQUsh+bbs29wWHheizK9AZwljFRybLCRvAA4CqoZ2aj5vtu
         p2QPGJR0+yL8taBbtRGmSmDmYm81mcaTy1dpVgWL3aGFf6J/vlvvIKcQYkKxxYQGucNX
         oOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A6+2DpVxnCTBFy1a/Tk89/YaLR34OXDvfgdgK8Nsi9Q=;
        b=nZw5biHeUlbIihmK644e+Rg9nh1MiPgfEA5JWR1Ms3xOgXQq8NRUsJHqlhBh6puV70
         C3crAxBKod0vIluUsgdxPcVE/9wtNQgQFtkGa6U+HyJ/ndXQXB0bfwBn5h1NZrvpMTOP
         890EkfxCinRoxM9/MpWSr81DounUvY/4i/cpxjDs4DdrWlndJ/YWtG50Q90V0qoBgNy1
         x2xAdLhoFHVWLKUD2QeuKjnH1wsOHdYTnZl91ORXI8sXM/+0gZ7ATiNB0tgmZCrQQAPT
         JxmcvBl11jq+WepWaHCpTC5itYfHivvxyVAJYGZXNfnD8vmvOC0tnj1ktXCUMHyW6jAc
         oF1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lwq8ToXF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si8890504ywi.194.2019.03.14.06.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 06:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lwq8ToXF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4QjW-0001oh-5P
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 09:49:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4QhS-0000hU-4m
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 09:47:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4QcW-0002Fv-Nx
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 09:42:05 -0400
Received: from mail-it1-x133.google.com ([2607:f8b0:4864:20::133]:38559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4QcV-0002BY-Hz
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 09:42:04 -0400
Received: by mail-it1-x133.google.com with SMTP id k193so4919446ita.3
	for <qemu-devel@nongnu.org>; Thu, 14 Mar 2019 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A6+2DpVxnCTBFy1a/Tk89/YaLR34OXDvfgdgK8Nsi9Q=;
	b=lwq8ToXFbEOmawmjBkDB0San+C8z3Kvo2SNJ0MJj5zoyKGl5CIoUd3W8+m6j2ewwAK
	JcU8lUgSgjVM6ldRDKUlSnN2FOaTGMx+3YO74VlO487BE+MUiqNneYpJ6xVUwtI7ceJK
	J5JC4V+OhUSYOe8cEuf4d7iLmIkeZn/kirT4sKLNBfCm2pzNcbD8BGZYTSqBjjT3ToXq
	1ZLy1jzuHzNLXCSAqlql/argfFDGKCldzgzsC5CadFr+hu6bkiU+B0enrYsNYY9x1Aqj
	C/lpMACpFUrBlvCWoJmFFKPc6He88c+zkAMxlB8FvbAkMssQzru+QHtgyrZNnFqDfdCB
	mR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A6+2DpVxnCTBFy1a/Tk89/YaLR34OXDvfgdgK8Nsi9Q=;
	b=Px7/Fy92Ejq1ePPLOvDCkHpgkPdkgOUV4Nm06Yc8qBXl6ktAKPL/8lanGJ0rNVUVh4
	9efXbZdUYYQM8gAaiU+J63jutzMD5W+la33MLW0jCPKHuqWU6t8JLm1HTb57AhsUTIpd
	eafpXCk7+Wl5kSZtiPU4ttw+VhI3A8ko4eTJbbd/czwFye0m+5wolEg3zlydfo9X/X9e
	/XIF6jRiigfeqcVJgAnd6edQfA+qSWjcxtjb9qLTiwvo5ZlClmle8R7SGYRQclhxKi3n
	bmDIPQDI2BUtBjHHKc2UcppCdd9IRqA14xZMaQ09l0BoO+AvTvLTn3uyiiD7AVkpf+iL
	X6wQ==
X-Gm-Message-State: APjAAAUgK4aakkDvy4avI1b1gKVv+pzmoQK2fOwydkn0x8L5XKyaDFWQ
	1jrMxne/WUJ9by7dqdtMuodozenqM3+O+hDoIGshAQ==
X-Received: by 2002:a02:3216:: with SMTP id j22mr12120738jaa.25.1552570921786; 
	Thu, 14 Mar 2019 06:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190312074953.16671-1-richardw.yang@linux.intel.com>
In-Reply-To: <20190312074953.16671-1-richardw.yang@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 13:41:50 +0000
Message-ID: <CAFEAcA9YKeUpxmfYmkUwL=F6vGc4t0Ec9o2FHT3m1uMo23=HTQ@mail.gmail.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::133
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt-acpi-build: use PCIE_MMCFG_BUS
 to retrieve end_bus_number
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s90UJpveChMp

On Tue, 12 Mar 2019 at 07:51, Wei Yang <richardw.yang@linux.intel.com> wrote:
>
> This is more proper to use PCIE_MMCFG_BUS to retrieve end_bus_number.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  hw/arm/virt-acpi-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d7e2e4885b..57679a89bf 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -560,8 +560,8 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* Only a single allocation so no need to play with segments */
>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>      mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number = (memmap[ecam_id].size
> -                                          / PCIE_MMCFG_SIZE_MIN) - 1;
> +    mcfg->allocation[0].end_bus_number =
> +        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
>
>      build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
>                   "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
> --
> 2.19.1



Applied to target-arm.next, thanks.

-- PMM
