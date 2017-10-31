Received: by 10.223.161.27 with SMTP id o27csp4696wro;
        Tue, 31 Oct 2017 12:24:56 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+S2NlwECEs5upB/tOpMQXuaX2xABm81DTO8h1ATTCYw6Qd+vmbVgK0yh249TSkjklzA67pr
X-Received: by 10.129.67.22 with SMTP id q22mr1914446ywa.439.1509477896181;
        Tue, 31 Oct 2017 12:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509477896; cv=none;
        d=google.com; s=arc-20160816;
        b=AcKUIOqHBm7EdMpAD+lW8z9NqDja8FsK4XUVFx8T0DC4plcuP2bIbXFtM4fQIMcW9W
         d2eqa2UlwncgvaFKDfgYgjwuHX89FNnb0Juo7WMf34FjhA4jePf5Nt5nu4tLQ2qnA93p
         2jhwqPKxHs6a94LjYdjce1NH6yKR4h2fiWqO+MdVt9QxZ+lTP/LrrcOL0m7pGwGjPIML
         NHLYzeXn8TN/WIFgPbB+eYbCrSGJ0qw97P2BBO16Np4NMWF+PsA1iVgsW1LX2TRyqJAo
         e3Epl60sT2vJd3PmiZZgCHHiWNAWU9T9/3CJ+T8Qa6EFDPuMrExrrJoNDBAtQCGAsBC4
         0+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=H9YqvoCIrFQWgXuDMADFYRVq06vNLL6fPii8YRctAKc=;
        b=dwk9wCSZgPoIpkUR1WDLps8WRPZ9aregjH5nlCydzcqubEQyME0+qehD79kcIuuCSD
         QXOacKPYP8T9MEHNm0VTZ3vv1GytQGoRSdBL9cZlEuTZBn4nkpgaVsOV0z4mcC7XffSQ
         XjOJQAVabytupT+cazgc0EtP8e+Sh7I/WCKVot7iyW5kLUKglutA6RrQ+kqK6LoeI8vU
         0fyfO8e47inG8dlOKkvO9WkTCp00AaGiSS60Aq458h9stdcn4SvHx41/VX1hVi4qncMC
         BDZU2L/iw2x4ioL9S15cIhgLTh2w01GsfP4HJMmqMabkMw2p+AcwYM+xCDU3GbVRmulR
         41Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TjELIJpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q13si358318ybd.531.2017.10.31.12.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 12:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TjELIJpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9c9f-0002xV-LH
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 15:24:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9c9W-0002wO-Cl
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 15:24:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9c9S-000346-Hl
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 15:24:46 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:46714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9c9S-00033c-AM
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 15:24:42 -0400
Received: by mail-wm0-x22b.google.com with SMTP id m72so962777wmc.1
	for <qemu-arm@nongnu.org>; Tue, 31 Oct 2017 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H9YqvoCIrFQWgXuDMADFYRVq06vNLL6fPii8YRctAKc=;
	b=TjELIJpyfZaA21PZ2k0R5edmeijdgkSlfjhctr9j5CC+0ADihsGcmxyv5opmbZF9PR
	txp4sHQlg0hDEHfitlI9+rbit6gRn8uaKzBL7vRoh0I13jKNTdrDvdKpGtzNXB1sGnU1
	ll4JCE9n0CclU7Pclz+CVAJ63BAzeRYV/NZN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H9YqvoCIrFQWgXuDMADFYRVq06vNLL6fPii8YRctAKc=;
	b=YxAGNujddI4Ca7tI+wa4xZ/G7Kmd6FxUNa4oAqqxYIeJfoDkEt6WgMLIJ0qMUFYoan
	NVLcpjEjevn2rihkNl/R74WGXSeYdArBiRy7vasVOM7J5/Zq4/4ddDdUcobgWjF5GzjN
	DtdjaCTIj9ghasoXcGGTaCkCv+8ck4yx0h0pNGKZ3MS3S5/Bcg+W2pi5bM0xgJ7/86T1
	4wqzjyPj78JDaBG4Fe47UQ2t5T7Nqvjso8/10WvFun8JNhLd3WeSfQeyUTYkNDE7T/kU
	mAAcOwPiwse1cSU3NcAEMRy8QxJvhvZg5zcvWMOl971XHBefKuk3M3NheU71J0QPpjbH
	v5RQ==
X-Gm-Message-State: AMCzsaW//BzssYUj52URiPTDPPDZF995KCSDca2J2W/n2y2VfGCnk7RG
	Gy/UA1Q01Y6xhJP622+NA7eWRkCpCbe8hHuFXkqjOw==
X-Received: by 10.28.14.195 with SMTP id 186mr2721486wmo.56.1509477881133;
	Tue, 31 Oct 2017 12:24:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 31 Oct 2017 12:24:20 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710311147570.13766@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710171708130.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA9zXAmNPL8TsLKSPbm8Er_KLK8Ubwth6=nL6WD87OmBQw@mail.gmail.com>
	<CAFEAcA8jwN81ZBCLA8HW=q5GAWKmZ=kAZAP9vGNN8RYkzYe=Pw@mail.gmail.com>
	<alpine.DEB.2.10.1710310959490.13766@sstabellini-ThinkPad-X260>
	<CAFEAcA_8cimWtic=2OdvCmAN-mJ5MGGnVzDGYA5VgXGJG-fKhw@mail.gmail.com>
	<alpine.DEB.2.10.1710311147570.13766@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 19:24:20 +0000
Message-ID: <CAFEAcA_rOYq8NuhrbnJc4D7M+EenXPkPeqTBBJJzoBnAPxVLnw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [PATCH] aarch64: advertise the GIC system register
 interface
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
Cc: julien.grall@arm.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F0s/xBaoWtM5

On 31 October 2017 at 18:51, Stefano Stabellini <sstabellini@kernel.org> wrote:
> On Tue, 31 Oct 2017, Peter Maydell wrote:
>> On 31 October 2017 at 17:01, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> > Fixing QEMU is harder than I expected. Would it be possible to update
>> > id_aa64pfr0 at CPU reset time? Like cpu->id_aa64pfr0 |= 0x01000000; ?
>>
>> At that point we've already called register_cp_regs_for_features(),
>> which is where we read cpu->id_aa64pfr0 when we're creating the
>> cpreg. So if you change it after that it's too late. But that
>> function is called at CPU realize time, which is before we've
>> created the GIC object...
>
> What about something along the lines of
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9e18b41..0851071 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1401,6 +1400,10 @@ static void machvirt_init(MachineState *machine)
>              object_property_set_link(cpuobj, OBJECT(secure_sysmem),
>                                       "secure-memory", &error_abort);
>          }
> +        if (vms->gic_version == 3) {
> +            ARMCPU *cpu = ARM_CPU(cpuobj);
> +            cpu->id_aa64pfr0 |= 0x01000000;
> +        }
>
>          object_property_set_bool(cpuobj, true, "realized", NULL);
>          object_unref(cpuobj);

Definitely not -- the virt board should not be poking about inside the
internals of the CPU object.

The slightly cleaned up version of this idea is that you give the
CPU an object property for "claim the GICv3 registers exist in the
ID registers" and have virt.c set it. That feels like an ugly
workaround for something we really ought not to have to tell the
board about at all, though.

thanks
-- PMM
