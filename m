Received: by 10.25.77.65 with SMTP id a62csp369116lfb;
        Fri, 27 Jan 2017 10:31:51 -0800 (PST)
X-Received: by 10.200.58.101 with SMTP id w92mr8982182qte.160.1485541911659;
        Fri, 27 Jan 2017 10:31:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p102si4093447qkp.108.2017.01.27.10.31.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jan 2017 10:31:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cXBJM-0003X2-TI
	for alex.bennee@linaro.org; Fri, 27 Jan 2017 13:31:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cXBJD-0003U7-Ds
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 13:31:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cXBJC-0005Ii-E3
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 13:31:39 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:33095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cXBJ8-0005HX-1H; Fri, 27 Jan 2017 13:31:34 -0500
Received: by mail-ot0-x243.google.com with SMTP id f9so31889353otd.0;
	Fri, 27 Jan 2017 10:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=OfFyIUD/k/1kyqiuj9ZrbixJseNgZKbGbmo8djQC2CM=;
	b=ZP1LJokfKHIN1VU6NlMAwX3Q5EfhQDeKveYseThr8rcyLGOKu0lCnpfystXXohQyY3
	Pcsg+xeMzs81VMxk/UeWuEuh/hROSouhdq33laESCaw3sFv78fK2M9uT8LHTs3uX2ahl
	T7QyOkcOPWcpS6tokcdy68LjNk6ev/uTeCnwZl2CHVksdCNrVK4erfLDOGAIo7qUs2DP
	vj1kmi5dzwe0CHKqL1H6z8BTW1+yeISEAs4xYhPl8yTpCXTZV0FeD24g+nj9xDEPGuKJ
	cACczuJtI9Esf2v4s8Dk9FYFF9WfJVIMQgzirSPfIhHFFcWPH7dmeXjG6CW4BDWTcmsb
	Dpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=OfFyIUD/k/1kyqiuj9ZrbixJseNgZKbGbmo8djQC2CM=;
	b=d1ac0JCx4Gz05v6dIhXn9TfsMdv1tKEBncXx2mzYvurv7Dt1RMgKawB02WvDhpB2if
	e6kZZ6361dyAp5TqHFL3fSI/8xR1tIKLmEDjqeZDNy2DzNVHz2IVbfWdxNHjhhUQoI9R
	i7elVrC9x4nwJtfeeiUr14/cqh8SaJU/K1tNteBlacuFYzK7JusuBoIj2SSAQ8AkuRMf
	ZHmL7RE10G1OuRJi+JOPLRA31X9VSPGxNgiryNzvwA9hGRNr409ORtup4KmBc7piJGle
	w6oPrN1iyM2JETEJojjR4vL/1bIYh0yzYsntIDVka0mrlCJ5CvJbOEHtYFW28DtSEB6m
	hLfg==
X-Gm-Message-State: AIkVDXKn6b5arDAXDtJb/fHRFYitE8//sIhaqCNV285o0YYWWHVyL458ZmJxuzQj8/w8FNZc+iBWXtajnz9oHw==
X-Received: by 10.157.10.42 with SMTP id 39mr4862105otg.276.1485541893261;
	Fri, 27 Jan 2017 10:31:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.98.133 with HTTP; Fri, 27 Jan 2017 10:31:02 -0800 (PST)
In-Reply-To: <a3509663-3b80-3eab-73ac-f31027d68c87@redhat.com>
References: <1485443388-27253-1-git-send-email-armbru@redhat.com>
	<1485443388-27253-5-git-send-email-armbru@redhat.com>
	<a3509663-3b80-3eab-73ac-f31027d68c87@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 27 Jan 2017 10:31:02 -0800
X-Google-Sender-Auth: HgC7GAxPQuKGHXZAzvAMPaADfrs
Message-ID: <CAKmqyKO5AVnTe0tSQzx_j6wa46spbYD_HVbmqJJxeEQsJRbFWg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/8] hw: Default -drive to
 if=none instead of scsi when scsi cannot work
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kQd9Ecbohxax

On Thu, Jan 26, 2017 at 9:59 AM, Thomas Huth <thuth@redhat.com> wrote:
> On 26.01.2017 16:09, Markus Armbruster wrote:
>> Block backends defined with -drive if=scsi are meant to be picked up
>> by machine initialization code: a suitable frontend gets created and
>> wired up automatically.
>>
>> if=scsi drives not picked up that way can still be used with -device
>> as if they had if=none, but that's unclean and best avoided.  Unused
>> ones produce an "Orphaned drive without device" warning.
>>
>> A few machine types default to if=scsi, even though they don't
>> actually have a SCSI HBA.  This makes no sense.  Change their default
>> to if=none.  Affected machines:
>>
>> * aarch64/arm: realview-pbx-a9 vexpress-a9 vexpress-a15 xilinx-zynq-a9
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
>> Cc: Alistair Francis <alistair.francis@xilinx.com>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/arm/realview.c    | 1 -
>>  hw/arm/vexpress.c    | 1 -
>>  hw/arm/xilinx_zynq.c | 1 -
>>  3 files changed, 3 deletions(-)
>>
>> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
>> index 8eafcca..8c11c7a 100644
>> --- a/hw/arm/realview.c
>> +++ b/hw/arm/realview.c
>> @@ -443,7 +443,6 @@ static void realview_pbx_a9_class_init(ObjectClass *oc, void *data)
>>
>>      mc->desc = "ARM RealView Platform Baseboard Explore for Cortex-A9";
>>      mc->init = realview_pbx_a9_init;
>> -    mc->block_default_type = IF_SCSI;
>>      mc->max_cpus = 4;
>>  }
>>
>> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
>> index 58760f4..5756470 100644
>> --- a/hw/arm/vexpress.c
>> +++ b/hw/arm/vexpress.c
>> @@ -751,7 +751,6 @@ static void vexpress_class_init(ObjectClass *oc, void *data)
>>
>>      mc->desc = "ARM Versatile Express";
>>      mc->init = vexpress_common_init;
>> -    mc->block_default_type = IF_SCSI;
>>      mc->max_cpus = 4;
>>  }
>>
>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>> index 7dac20d..3985356 100644
>> --- a/hw/arm/xilinx_zynq.c
>> +++ b/hw/arm/xilinx_zynq.c
>> @@ -323,7 +323,6 @@ static void zynq_machine_init(MachineClass *mc)
>>  {
>>      mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
>>      mc->init = zynq_init;
>> -    mc->block_default_type = IF_SCSI;
>>      mc->max_cpus = 1;
>>      mc->no_sdcard = 1;
>>  }
>
> Right, that looks like old copy-n-paste bugs from other machine types.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Yeah, I agree. This looks good to me.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

>
>
