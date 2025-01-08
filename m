Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp867798njb;
        Wed, 8 Jan 2025 06:09:06 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXkl/wpDuF4X9yelQC21FMx/aLn6KQqSkNuwhE+T7uVCEiX+ho+WXu3hNn0PCjMpgM/O+vHnKXa/MUXxw==@linaro.org
X-Google-Smtp-Source: AGHT+IH9owebZbiormPmiDgFwt1Oh49SzDm3G3obpxK60QAO2h4DWyAfJ1QPw5oCAVNebIvf5uB6
X-Received: by 2002:a05:620a:450d:b0:7b6:d4a2:f126 with SMTP id af79cd13be357-7bcd96fa145mr412114385a.13.1736345346658;
        Wed, 08 Jan 2025 06:09:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736345346; cv=pass;
        d=google.com; s=arc-20240605;
        b=F6diNDyeUbLvVEqWh467nXcCqLvTTW0YAxLvD8tSlW0cBSFSDKLPpH5i0GK/saIOcI
         NTvw1qJxSE429bb+cTJLIbZmCnUhgThg/dg14FcZV69zSknKtFjPqflCUb8HvZ0xLwF5
         IOYvKJ0tnvNlvNnOa26NBR7PE7egiPpp0UGrcGlJymshAgfB4ekN41zEF9w4c8Djragm
         w60fvLn46My6zkwCbHd+EEIeazWqiX+mVN3qY1cYqim43VI5JEhVOw/D264K7OKfECBU
         0t126RxdDq+xFJNSL0TR8d4LvFTehqhNl5P8fxifVVKkHSwKTHwtLlDMwLoYDcjOo74X
         KklA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=dJLKh6BStmfyk9qgrlfwMFE0auc5dkCCY+gzY914BFc=;
        fh=r/xHmYn8OISEEQcKm018E/E0PmPacjMt5Tm+ncNu1KA=;
        b=MjF/T9AY3jXKbS/OhzeVIhBRuxdMOeuHtLzQXOGQruXMSFDPYqwJLCRICguAxOkma5
         2D+2WK6JAs3q6Qq944+s60WOICBDD/tVQmVsefdP//cd1Dxgy/6JATCa5PO317L52xD/
         8fMyti1KxOM7FT8wbyqaAhMrSD4bLnjsMCskQJLUMBAIu7odh1g/e4MTwrvT3v03iNhC
         656mvWWIunbtKZp9vW21Te9xzURVYQ0g/o8s3Hr4Hwe8lfj5ygahLGb3Ul5pPcS42HlC
         Ynm8etzWKDS2khUlYiKSvBmUWHgMqR2j+YTTAAUyObwYi/Xvrz0f7Q6cY8NLgGOmjGA3
         uXkw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XPozFGfJ;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-467856-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-467856-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-467856-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac478befsi330145785a.320.2025.01.08.06.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:09:06 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-467856-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XPozFGfJ;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-467856-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-467856-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F35162953
	for <alex.bennee@linaro.org>; Wed,  8 Jan 2025 14:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6177113BADF;
	Wed,  8 Jan 2025 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XPozFGfJ"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE2019B586
	for <linux-kernel@vger.kernel.org>; Wed,  8 Jan 2025 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345342; cv=none; b=Y/D9ZX1kFVwvmltb1+0xTGBiN4ArFT1ij6emDnsytICxTTVZp6Kye7r4pfTCHjISQL7d1dVxwr7uDABAAj62sIhEotuUNNSNI7hBW4PdeRl7xmCd+opnNjpyHKGujNr0joQ6oxjTkx6L7Mr3EDwZyEukfUlXY612ZyDGfFzqUwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345342; c=relaxed/simple;
	bh=J1P4zlMOECPyHQaK5nI09tbu6Y+p/ApDLrpe+AYScqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nu66Lvf7thMGl0jMKJVZGYhVU36HuuQVNKpvLOkbS6AhslclCXczANyurYr0Bq4lcogmdS85FA/JXBWDODA8ZwdUcan8Ek9gLE/V3APLwujHbxWEJGGlxCQPsdDCMVIxD6wR4q9SuzBQ6BHJ6n06Us/+WO+7s1Aov2EuqHzKvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XPozFGfJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736345339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dJLKh6BStmfyk9qgrlfwMFE0auc5dkCCY+gzY914BFc=;
	b=XPozFGfJj4rkq4c1JRTt2nxbggUeOag2zNOPXV1HzBf15YPeN9spVdTTdS53sfQ49vpWUZ
	JoNXZkxlJqemrRJLkKVLi/RFT18ADDXyOCEy7OwJzI2PtG1QtXSHZxKXn82QIPp7LfnY1O
	wPULbWoZwErMUM6du3ldNJma6Hjypz8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-65qpSiznORaOI6jWijAMvw-1; Wed, 08 Jan 2025 09:08:57 -0500
X-MC-Unique: 65qpSiznORaOI6jWijAMvw-1
X-Mimecast-MFC-AGG-ID: 65qpSiznORaOI6jWijAMvw
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa6a831f93cso512174966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 08 Jan 2025 06:08:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345336; x=1736950136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJLKh6BStmfyk9qgrlfwMFE0auc5dkCCY+gzY914BFc=;
        b=MmlAP7mpE4oHFXYgieNG3FjsV3zNaJpooqoU2Jlgwir+oq/3LN+AZCvCU8mDAtVNB6
         nTos9padHdAEyReTsl93VU7QPFnS8VlJLiTX2ukcYKdF5RHOtwZgjkGeyjC9ktZK1fkS
         oyCSFhxsybUm+DxK5RolUtJNfn3HQGcCzpgMEDqrQXSfqZxYkDfYk7NBOGcr8tITwpWd
         kOKBUXNcK9FHgHk9CjiTTFHoJeKXANJmtpHcV57f+mcQ1jWnvKxKeZ/1F3YHlC59pIdJ
         5hFjoKo2LAlHd/RmB7CiOUUKgnToCW4EftkOcinxH15+oZc1t3FwzJgAi7oyqMhMfGl4
         BQJA==
X-Forwarded-Encrypted: i=1; AJvYcCVARD1deHaG6CRwxiYn99zDX6Siqet0E4EHBLvqZG2hU1PcPTE0JwPFFMSHcYv/1tqgRWfQGMu87BSIn6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjbU3M9Vp9yIMEkgaCRXYiiql3osFRkctYyRPLAD7rfz9PBE3q
	sO9mjpOlsNQubt2GpPglv7fCumKCTtfmtzicI+GCHIgSgEPpYdRRtm/uGED2pPWhmbAsmJwhxNb
	P3PppPDcGpllE36hIsGJSUKS2AWQG66OqHaVzZoM/vA2anPuROvStnTkmq6dAaA==
X-Gm-Gg: ASbGncvDyVBX12iRquIbPKNQ+8lo7/STVcObOiPh0YCKxLQf4l+q8p5NLhfI8DccLw7
	DbR2R0iBQ9vjBJyVWI7FmrzLy8cbxZVZWbgvqMikxJ3ntibd6P5urQmIFincbNdrQTegc0i3E8G
	aQoNX5B7zPbzvuSr/CwUOAJUps6W6e1iE3xA8zxJOFKyBbWlGPk0ZdPrGDKI+KC+iYoVnTh8rj/
	qn0h0Tw5pUhE/Z67MnHi/alBpaDgI5zZ5oVz79D8R9jAFZC8AY=
X-Received: by 2002:a17:907:980f:b0:aa6:993a:259f with SMTP id a640c23a62f3a-ab2abcac230mr229669566b.40.1736345336488;
        Wed, 08 Jan 2025 06:08:56 -0800 (PST)
X-Received: by 2002:a17:907:980f:b0:aa6:993a:259f with SMTP id a640c23a62f3a-ab2abcac230mr229666366b.40.1736345336022;
        Wed, 08 Jan 2025 06:08:56 -0800 (PST)
Received: from redhat.com ([2a02:14f:175:d62d:93ef:d7e2:e7da:ed72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015ad6sm2481125066b.166.2025.01.08.06.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:08:55 -0800 (PST)
Date: Wed, 8 Jan 2025 09:08:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/5] Change ghes driver to use HEST-based offsets
Message-ID: <20250108090815-mutt-send-email-mst@kernel.org>
References: <cover.1733327276.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1733327276.git.mchehab+huawei@kernel.org>
X-TUID: 1FuhA1e0nIvm

On Wed, Dec 04, 2024 at 04:57:54PM +0100, Mauro Carvalho Chehab wrote:
> This  series was part of the previous PR to add generic error injection
> support on GHES. It depends on a cleanup patch series sent earlier
> today:
> 
>     https://lore.kernel.org/qemu-devel/cover.1733297707.git.mchehab+huawei@kernel.org/T/#t
> 
> It contains the changes of the math used to calculate offsets at HEST table 
> and hardware_error firmware file. It prepares for the addition of GHES
> error injection.
> 
> The first patch was previously at the cleanup series. It prepares
> the logic to support multiple sources.
> 
> The second patch adds a new firmware file to store HEST address.
> 
> The third patch use the new firmware to calculate offsets using
> HEST table.
> 
> Patches 4 and 5 add migration support. They assume that this
> series will be merged for qemu 9.2 (maybe it is too late for that,
> as QEMU is now on soft freeze). 
> 
> I tested migration using both virt-9.1 and virt-9.2 machines
> on qemu 9.2.

So this needs a rebase to the next release. Thanks!


> I also tested migration with:
> 
> 	qemu-9.1 -M virt-9.1 -cpu cortex-a57 => qemu-9.2 -M virt-9.1 -cpu cortex-a57
> 	qemu-9.2 -M virt-9.1 -cpu cortex-a57 => qemu-9.1 -M virt-9.1 -cpu cortex-a57 
> 
> The full qemu command when test backward-compatibility when running virt-9.1 is:
> 
> 
> ~/qemu/build/qemu-system-aarch64 \
> -m 4g,maxmem=8G,slots=8 -monitor stdio -no-reboot -bios ~/emulator/QEMU_EFI-silent.fd -kernel~/kernel/arm64_build/arch/arm64/boot/Image.gz -device pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device virtio-net-pci,netdev=mynet,id=bob -drive if=none,file=~/emulator/debian.qcow2,format=qcow2,id=hd -object memory-backend-ram,size=4G,id=mem0 -netdev type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp tcp:localhost:4445,server=on,wait=off -M virt-9.1,nvdimm=on,gic-version=3,ras=on -cpu max -smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -append 'earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4'
> 
> (I actually call it from two different directories, one with qemu-9.1 and the other one with qemu-9.2.
> 
> For tests on qemu-9.2 with virt-9.2, I used a similar command:
> 
> ~/qemu/build/qemu-system-aarch64 -m 4g,maxmem=8G,slots=8 -monitor stdio -no-reboot -bios ~/emulator/QEMU_EFI-silent.fd -kernel ~/kernel/arm64_build/arch/arm64/boot/Image.gz -device pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device virtio-net-pci,netdev=mynet,id=bob -drive if=none,file=~/emulator/debian.qcow2,format=qcow2,id=hd -object memory-backend-ram,size=4G,id=mem0 -netdev type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp tcp:localhost:4445,server=on,wait=off -M virt-9.2,nvdimm=on,gic-version=3,ras=on -cpu max -smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -append 'earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4'
> 
> ---
> 
> v3: did some minor cleanups at the code, as suggested by Jonathan Cameron.
> 
> v2:
>   - some whitespace and comment changes
>   - patch 3/6 (acpi/ghes: rename the function which gets hw error offsets)
>     was merged on the cleanup series.
> 
> Mauro Carvalho Chehab (5):
>   acpi/ghes: Prepare to support multiple sources on ghes
>   acpi/ghes: add a firmware file with HEST address
>   acpi/ghes: Use HEST table offsets when preparing GHES records
>   acpi/generic_event_device: Update GHES migration to cover hest addr
>   acpi/generic_event_device: add logic to detect if HEST addr is
>     available
> 
>  hw/acpi/generic_event_device.c |  30 +++++++
>  hw/acpi/ghes.c                 | 160 +++++++++++++++++++++++++++++----
>  hw/arm/virt-acpi-build.c       |  33 ++++++-
>  hw/core/machine.c              |   2 +
>  include/hw/acpi/ghes.h         |  23 +++--
>  5 files changed, 220 insertions(+), 28 deletions(-)
> 
> -- 
> 2.47.1
> 

