Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6203884wrt;
        Wed, 3 Oct 2018 04:45:37 -0700 (PDT)
X-Google-Smtp-Source: ACcGV617MMGGyJ/3BMeWtzYRCGsLFapjK1MCMzgNr6G2HIbeCDIOzRGkd5AeFf28kNvwPIf3JReB
X-Received: by 2002:ac8:373a:: with SMTP id o55-v6mr788862qtb.224.1538567137516;
        Wed, 03 Oct 2018 04:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538567137; cv=none;
        d=google.com; s=arc-20160816;
        b=QfkkpsByWJE5yZt/z5mlvFM+Icmgjgk9Z/zLH14/PjG5qBu+zWBMNMgfkXpqU5FJZ6
         cpKfkeDw2KmkyQ5MVQY13O06tmaPW6Pm+d8YTax/hUrHyybI8QQevwl80Gmk3+hObIze
         77EGSlVfJHmZUDaOzgrKYas+nRWvRYknftwbrBzX3fF5SX5lgxyDpDTBnZ6GNX5THsIu
         i0/LaJjwQSHVl7rIpe+u2pV4i7vxWrpFvxAN+MPDhR4Xr+3kN4jKcBElzenJa7Kv4VP2
         x1T2aLaXmPQaqRoBXzOWA5wfIaU54rABctWunI4d2YxYAUjApMBhSBvmy2TL9vbKQ7M/
         Xmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=7r5h/LXtVAIkjfykZlDjcV+Ri5iyUATfsj8owlngyAo=;
        b=peSimVzDBBwnDyKQAujDoEwyJ1HFbaxCSmqnyVTuBy98gwkoVDUAZ8k7+4BHbAUqJJ
         3vxixO9zDU3fPLaXByjBCvldtnHLCoJ2OolzoRPj4svw/l/Php8HBsDvj73dgDlxTYMo
         7FFiij+KJYKHhRmGrsVKk5odAnmKGmbw+OM5cLsUKZqAbtI7OVCxASOVRMMVSsUiw1dv
         HDle+tI+n3JB7CeQR8Eyp9G2o+jBAkQs7OtwFcdIibcKXlsiKiBVvsxuSXfAGVYLj+52
         3rUEdsR5zQ4CWfxsD5YTRLzSe1OgZN+QW0W1ZFLLQUuektAu5Te7wM0W6A3d0Xc+L021
         KCZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=YQIPbRSR;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wDP4mvM4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wDP4mvM4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13-v6si707816qtk.178.2018.10.03.04.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 04:45:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=YQIPbRSR;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wDP4mvM4;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wDP4mvM4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7faz-0004sG-0v
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 07:45:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g7fac-0004r4-7s
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 07:45:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g7faX-0007jg-4J
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 07:45:13 -0400
Received: from greensocs.com ([193.104.36.180]:32785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g7faW-0007iC-Jp; Wed, 03 Oct 2018 07:45:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 585CC5BCE66;
	Wed,  3 Oct 2018 13:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538567098;
	bh=Q+ElO+3M4GnztEPptKklp5P1+4P/emthFmhAudvFoC8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=YQIPbRSRCO3ec9ddbKWwioUv2laJ2p103oflAip4Zno4BBONXGhaTpxHj3R51yYP/
	cmhFqswjOZ3qb9I6V/ujrJqew9CPUbHWYtaG2gcW9QT0iHznNCH/7A17kssxgZeMT0
	CmZD5T0kfDfEMZ1UZKbWyZpAuaIpq/ZjY5mzFLX8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wDP4mvM4;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wDP4mvM4
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPubt9Or2UlA; Wed,  3 Oct 2018 13:44:57 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 8A62C5BCE68; Wed,  3 Oct 2018 13:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538567097;
	bh=Q+ElO+3M4GnztEPptKklp5P1+4P/emthFmhAudvFoC8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=wDP4mvM4ZQOcVowfz11/jAtxNLRt9WLOn4tpWxZphbbQ/04Gs90u7aldlRyiowOG4
	rNkh4DQLUcFUb8SuzkpgJJLfrPGR84caxSs/ObuzCSj5vKeEHts9P59ZqeozIFEN10
	JdUVwk79PGpdwAvQLDy14vwjvehMKR2xpbdtpxCE=
Received: from [192.168.61.102] (LFbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D142B5BCE66;
	Wed,  3 Oct 2018 13:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538567097;
	bh=Q+ElO+3M4GnztEPptKklp5P1+4P/emthFmhAudvFoC8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=wDP4mvM4ZQOcVowfz11/jAtxNLRt9WLOn4tpWxZphbbQ/04Gs90u7aldlRyiowOG4
	rNkh4DQLUcFUb8SuzkpgJJLfrPGR84caxSs/ObuzCSj5vKeEHts9P59ZqeozIFEN10
	JdUVwk79PGpdwAvQLDy14vwjvehMKR2xpbdtpxCE=
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-16-luc.michel@greensocs.com>
	<35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
	<CAFEAcA9vHi=qrV-Aj5ptgBQntafLGwL6VezxnmOuuR=6=Pr8cA@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <33c3ea72-652a-53b2-4865-830f3d7f2c3a@greensocs.com>
Date: Wed, 3 Oct 2018 13:44:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vHi=qrV-Aj5ptgBQntafLGwL6VezxnmOuuR=6=Pr8cA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put
 APUs and RPUs in separate GDB groups
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KpHGanWDZz2H



On 10/2/18 1:58 PM, Peter Maydell wrote:
> On 2 October 2018 at 12:33, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>> Cc'ing more QOM involved people.
>>
>> On 01/10/2018 13:57, Luc Michel wrote:
>>> Create two separate QOM containers for APUs and RPUs to indicate to t=
he
>>> GDB stub that those CPUs should be put in different processes.
>>>
>>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>>> ---
>>>  hw/arm/xlnx-zynqmp.c | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>>> index c195040350..5e92adbc71 100644
>>> --- a/hw/arm/xlnx-zynqmp.c
>>> +++ b/hw/arm/xlnx-zynqmp.c
>>> @@ -22,10 +22,11 @@
>>>  #include "hw/arm/xlnx-zynqmp.h"
>>>  #include "hw/intc/arm_gic_common.h"
>>>  #include "exec/address-spaces.h"
>>>  #include "sysemu/kvm.h"
>>>  #include "kvm_arm.h"
>>> +#include "exec/gdbstub.h"
>>>
>>>  #define GIC_NUM_SPI_INTR 160
>>>
>>>  #define ARM_PHYS_TIMER_PPI  30
>>>  #define ARM_VIRT_TIMER_PPI  27
>>> @@ -175,17 +176,18 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPSt=
ate *s, const char *boot_cpu,
>>>                                     Error **errp)
>>>  {
>>>      Error *err =3D NULL;
>>>      int i;
>>>      int num_rpus =3D MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_Z=
YNQMP_NUM_RPU_CPUS);
>>> +    Object *rpu_group =3D gdb_cpu_group_container_get(OBJECT(s));
>>
>> I'd rather keep this generic: not involve 'gdb' container name.
>=20
> Yes, I agree. We should structure how we construct our
> model to follow what the hardware has (two CPU clusters
> with 4 cores each), and then the gdb code should introspect
> the system later to decide how it exposes things to the gdb
> user. GDB specifics should (as far as possible) be kept out
> of the board code.
>=20
> The fact that there are two clusters here also
> affects other things, like whether they have the
> same view of memory, whether they can share translated
> code (they shouldn't but do at the moment), and so on --
> it's not just a GDB-relevant distinction. So we should
> be modelling it somehow, definitely. I don't have a clear
> view how just yet.

So for now, maybe it's better to rely on an heuristic such as the one
suggested by Philippe in the gdb code to group the CPUs. Once QEMU gains
more supports for such heterogeneous architectures, we can remove the
heuristic and put the proper QOM introspection code instead.

Luc

>=20
> This probably ties into the stuff I have somewhere on
> my todo list about supporting multiple heterogenous
> systems. The problem with this xilinx board is that it
> is trying to model that kind of system but we don't actually
> properly support that in QEMU yet.
>=20
> thanks
> -- PMM
>=20
