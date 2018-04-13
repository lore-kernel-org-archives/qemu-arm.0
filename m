Received: by 10.28.71.155 with SMTP id m27csp802237wmi;
        Fri, 13 Apr 2018 07:09:47 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/Zbr9i4bco6j/whlzGPDhaSwKH+RYYrVfQjEkS2puE5i9dM3EGVeQgrOApfI1ROzf+/+8m
X-Received: by 10.55.77.66 with SMTP id a63mr4569103qkb.93.1523628587062;
        Fri, 13 Apr 2018 07:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523628587; cv=none;
        d=google.com; s=arc-20160816;
        b=mfzfAXPZLWeehT6thSaq4mqhNI+4mkEe4INR3Y8JCN/ZqM03UslCTCBCav3ov5CRqB
         ngBFq7i2GZZVybZ2bFr30wkQcrz7rHmsq1Q4m3wfJHPdB0RqTO+Do5di7PMfHuvYInrI
         y8GZ13oDeKnCJvo/jA4Ph/AkmhH7wPQdKPdjBtljWHAxCIccwbXWUA2a+8XJMBqew+vy
         k3a20BH3XdMTTr9rCSj6Q5Ac6cARQB2LhTHuKZGgqezfetSCdAaNcpIi81lX3rkG6k5G
         JEzYBZ7QMsHl/cvDeyxE3DBcwkIMJKWC3VQiL0VmKHXLPRhEUPuHiDiYuEjJgNa6uKPV
         snww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gqY1zGrz6opzBxDmHQMMe/R8wPROX1q3x6k/+bjK6C4=;
        b=V1Kbvj/Gy2+RCul6wdnAqSzz8pOo9iMmoE/cduJBhxCJEtR/OWqsbRY0eW1f9tYj55
         EHipg064W9qJIx9DeRQX/HnbIFsECPy20bD8Hmtf0//w0V+7DUOBJ6PsfmFtZyO/TN/M
         y3OC3LauNe0HB07IcPzFCBm1IF7jysFwenmy+gqpPTnPJu7d7/7Auk9ltO6ziLqMGujJ
         Tt/m9DwEvFWR+8B/D1MwpevXORlv+qc798Ob0uVGEWaG/z6DcL/iiplBp88xpMPTCtv4
         1XCOC6lg96YtvOC8eDCnQRORzGiikTMdiovltEq41eEEmBul7x0CUUxe9RI6SItNuU79
         4PoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D9ZqCcQM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1si5805731qta.157.2018.04.13.07.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 07:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D9ZqCcQM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6zOc-0007QK-E5
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 10:09:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6zM4-00065y-5z
	for qemu-devel@nongnu.org; Fri, 13 Apr 2018 10:07:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6zM3-0003Ag-Du
	for qemu-devel@nongnu.org; Fri, 13 Apr 2018 10:07:08 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:43389)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6zM3-0003AF-7v
	for qemu-devel@nongnu.org; Fri, 13 Apr 2018 10:07:07 -0400
Received: by mail-ot0-x243.google.com with SMTP id d9-v6so9976186oth.10
	for <qemu-devel@nongnu.org>; Fri, 13 Apr 2018 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gqY1zGrz6opzBxDmHQMMe/R8wPROX1q3x6k/+bjK6C4=;
	b=D9ZqCcQMkrH2jYITNIoQJrYGEMn8pG/Hm2CeKKqTsRPo7ntsLqk6813JuvfXJ8uw5l
	J+cbaExXtAnLJFYpOQlhwo4P9SBsSvaUOsbs5LcHk33OpG3lECzswtRLyHT0WeP3q+cY
	P4/d8dUcGKKixZ3LclhTTsk5nswVHLriO4eKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gqY1zGrz6opzBxDmHQMMe/R8wPROX1q3x6k/+bjK6C4=;
	b=s4xF8q2Laj29cdmIW932uh7EynRtXpmXO8qgkhUOLv3NCZ61PJWUKRJujqeC1arXbX
	RCJXAUsNPMAMgjmb5guVLR6ihHZ+PREg6UWWCvnp/4zI1EobCbcaof0xriZdRuRBpaUp
	0lxgsJyBfva+wQnDRYTrEV94XOxmoL4vrnuZBArH7NsUITQijBgtL6NXzaz7r3CAWI2E
	7mbmAVVUop6eZMrd6Swju2Bw+cGNnulQ4w2kC+k8LBiPY31IotuAP+J3r35W5eWmb1hc
	Mprr5A2SG3vp5J5L0Q6mK6yAV+kx6kzAkjEJvMuK6Xf8uUaoR4gbAbfH3kTkEQG4R9Vv
	WaNg==
X-Gm-Message-State: ALQs6tCVklVO9GYB84xxubcX86QSNsL9ZPpHkzOOTsokS8oZA49K78mY
	3fafkzb+5NvmYbiGapu5VXSXqhmYOaAghPF43SBmHA==
X-Received: by 2002:a9d:2ff2:: with SMTP id
	b47-v6mr3944021otd.316.1523628426531; 
	Fri, 13 Apr 2018 07:07:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 13 Apr 2018 07:06:46
	-0700 (PDT)
In-Reply-To: <57b01152-1179-9735-eb6a-a9dbfc933a6c@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-9-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_O3QK0t5DHfnAFEOHv_yyxvL9HZX+0geHs0ibVVwTbNQ@mail.gmail.com>
	<57b01152-1179-9735-eb6a-a9dbfc933a6c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Apr 2018 15:06:46 +0100
Message-ID: <CAFEAcA-wT8vERbkjq_HoROi1ymPauAe+y3oc16zoCJXsHKqBoQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [RFC 8/8] hw/arm/virt: Allow up to 512 vcpus along
 with KVM VGICv3
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
Cc: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Christoffer Dall <cdall@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C6mjM0goO2HO

On 13 April 2018 at 15:01, Auger Eric <eric.auger@redhat.com> wrote:
> On 13/04/18 15:41, Peter Maydell wrote:
>> I think it would be better to explicitly check "do we have
>> support for split redistributors" rather than looking at
>> KVM_MAX_VCPUS. It's not impossible that a distro kernel
>> might have chosen to backport support for one but not the
>> other.
>
> The issue is we have race here:
> to check whether the new ATTR is supported I need to query the GICV3 KVM
> device. This later is created in the GICv3 initialize. But to initialize
> the VGIC I need the VCPUs to be created. And to create the VCPUs I need
> to check their max number. Or do I miss somethinh?
>
> The KVM device create dry-run mode cannot be used here. I would need to
> really create the KVM device and then delete it. The issue is there is
> no kvm device DELETE ioctl at kernel level since KVM devices are deleted
> on VM deletion if I understand correctly. Adding a KVM device delete at
> kernel level may not be straightforward as I suspect some
> simplifications could be made in KVM device deletion knowing the VM was
> under deletion.

Two possibilities:

(1) do like we do in kvm_arm_get_host_cpu_features() where we
create a scratch VM to interrogate it and then throw it away
when we have the info we need

(2) add an API to the kernel to make it easier to query it
for this sort of feature

thanks
-- PMM
