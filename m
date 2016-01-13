Received: by 10.25.159.19 with SMTP id i19csp817363lfe;
        Tue, 12 Jan 2016 16:43:43 -0800 (PST)
X-Received: by 10.140.144.10 with SMTP id 10mr168174500qhq.38.1452645823467;
        Tue, 12 Jan 2016 16:43:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l74si3193087qgl.121.2016.01.12.16.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 16:43:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJ9XK-0003Vb-U7
	for alex.bennee@linaro.org; Tue, 12 Jan 2016 19:43:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJ9XI-0003SN-7t
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 19:43:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJ9XG-00015D-T6
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 19:43:40 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:33058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aJ9XE-00014k-0k; Tue, 12 Jan 2016 19:43:36 -0500
Received: by mail-wm0-x244.google.com with SMTP id u188so34033719wmu.0;
	Tue, 12 Jan 2016 16:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cGdGxiHJWW3tK0z5zo+L98Diekyss6kXmzz4d393jDY=;
	b=XryOt0xttbrt9InFhEDTPj+LZ8pdYcA+6qG+DK3HLz+DKbb/9EZdSmeHdYWluCMDiE
	Nfo7+I+NvAoIwnTeHMUHQsHF7ef3CNB3S6+sjhWMGUfQWGGpOGvNz+SiC/eJlr5S4qWK
	xYaIFK/OkW6Gz3k5WXrzHU7rpRja75wE8b1n9VoZCR3ItNO/rbeW11weZj2R4dqvqtKG
	ZXet+9bHC/cDUZjaZRxO7yGDq6M6P4W8AYaa5of5jNIL+Xft/QmhK6/Scs12wstd5vD1
	iqR7lGleEIcfw7E26Z3/ODIWUc+3XBuizWOKYeGYMAaZxOTpK+i3/QldGyieno/W+AZ5
	kC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=cGdGxiHJWW3tK0z5zo+L98Diekyss6kXmzz4d393jDY=;
	b=FM3mehzUaoLlZqawhp7wkCrdYqaNLBwJadwLBulliM0aRsxqsVXQdV/MQjJJxN4I/a
	uNMESAK2c/CV9hoMjNMszKrEhU5U1IRbClzCwk4H+Y6R6ZEcjZPqLd5S5GJBGJoh9Lwt
	LH9ZviiK1iug2Uaiynhb8GOwzMg6OvhPnCM+xCUIV2lAYwAY1DeJq15JbMO5UqAH2NXF
	kVCm5TMl/y+clSsHQXtMDAlwAMHegPQgsDMAXKlFdG/2cPgd8PpgIX0pLfROSE5Xpe0d
	esHzMyNpWvxi3h85esuP/XO52gCEaiNpV+/UdFRKYJKyVLm3jNwjElwipq8SszqiFApN
	d1aA==
X-Gm-Message-State: ALoCoQnTuOsX0NlXNQjMCc6ErfMKBji4onejkwv31kq9qaIqwaPe6jQFINN3PoIDVuRZltRKphGWnA50D/XXWAjWF0VjGZJ5tg==
MIME-Version: 1.0
X-Received: by 10.28.184.136 with SMTP id i130mr21315519wmf.96.1452645815136; 
	Tue, 12 Jan 2016 16:43:35 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Tue, 12 Jan 2016 16:43:35 -0800 (PST)
In-Reply-To: <BLUPR0301MB2034BFDBF9CE361133F26B8E9ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-8-git-send-email-Andrew.Baumann@microsoft.com>
	<20160112035753.GD3308@pcrost-box>
	<BLUPR0301MB2034BFDBF9CE361133F26B8E9ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Tue, 12 Jan 2016 16:43:35 -0800
Message-ID: <CAPokK=o8x9fRw7K-nfdhSVB=8De9bMi9tZiUq54cevvjNSDP2A@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 7/7] raspi: add raspberry pi 2 machine
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
X-TUID: WHCoYUcWNAls

On Tue, Jan 12, 2016 at 3:53 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Monday, 11 January 2016 19:58
> [...]
>> > +static void write_board_setup(ARMCPU *cpu, const struct arm_boot_info
>> *info)
>>
>> This is almost identical to Highbank, I'm guessing you are stubbing monitor
>> firmware where you get away with nopping all the SMCs? Maybe we should
>> split
>> Highbanks version off to common code, and parameterise the few
>> differences.
>>
>> write_board_setup_dummy_monitior(ARMCPU *cpu ..., uint32_t scr_flags);
>>
>> or something like it. Makes sense to be in arm/boot.c .
>
> Actually, I added this only to make Linux happy (and yes, it was derived from highbank). Without it, I was seeing complaints about:
> Ignoring attempt to switch CPSR_A flag from non-secure world with SCR.AW bit clear
> Ignoring attempt to switch CPSR_F flag from non-secure world with SCR.FW bit clear
>
> I don't believe anything actually uses the SMC handler after boot. I think it's just an architectural requirement to flush the change to non-secure mode.
>
> I would prefer not to touch highbank, because I don't know how to test it. Is it better to submit this patch without the board setup?
>

I can test Highbank for you, or you can use this project:

https://lists.gnu.org/archive/html/qemu-devel/2015-10/msg00755.html

The build takes a while and costs about 50GB of disk space, but the
amount of setup needed should be pretty low.

FWIW, that was the test system that found the need for this FW in HB.

>>
>> > +{
>> > +    static const uint32_t board_setup[] = {
>> > +        /* MVBAR_ADDR: secure monitor vectors */
>> > +        0xEAFFFFFE, /* (spin) */
>> > +        0xEAFFFFFE, /* (spin) */
>> > +        0xE1B0F00E, /* movs pc, lr ;SMC exception return */
>> > +        0xEAFFFFFE, /* (spin) */
>> > +        0xEAFFFFFE, /* (spin) */
>> > +        0xEAFFFFFE, /* (spin) */
>> > +        0xEAFFFFFE, /* (spin) */
>> > +        0xEAFFFFFE, /* (spin) */
>> > +        /* BOARDSETUP_ADDR */
>> > +        0xE3A00B01, /* mov     r0, #0x400             ;MVBAR_ADDR */
>> > +        0xEE0C0F30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
>> > +        0xE3A00031, /* mov     r0, #0x31              ;enable AW, FW, NS */
>> > +        0xEE010F11, /* mcr     p15, 0, r0, c1, c1, 0  ;write SCR */
>>
>> If combining with HB, could you do this as read-modify-write?
>>
>> > +        0xE1A0100E, /* mov     r1, lr                 ;save LR across SMC */
>> > +        0xE1600070, /* smc     #0                     ;monitor call */
>> > +        0xE1A0F001, /* mov     pc, r1                 ;return */
>>
>> I'm looking at the Highbank version which doesn't save lr across the SMC and
>> wondering why it doesn't. Is this banked by CPU mode and do you get from
>> already-in-monitor-mode? Or simply, that Highbank code may have a bug?
>
> I think it's needed because I call the board setup blob on each core (from the smpboot blob), but highbank doesn't. I found that I needed to do this to avoid the above warnings on an SMP boot; I don't know why highbank doesn't.
>
> [...]
>> > +    /* Allocate and map RAM */
>> > +    memory_region_allocate_system_memory(&s->ram,
>> OBJECT(machine), "ram",
>> > +                                         machine->ram_size);
>> > +    memory_region_add_subregion_overlap(get_system_memory(), 0,
>> &s->ram, 0);
>>
>> I thought the SoC handled this now? Why do you need to add to
>> system_memory?
>
> If I don't map it here, how do RAM accesses from the CPUs work?
>

Do the CPUs not have their AS'es connected to your custom ASes by the SoC layer?

> Or are you saying that I should still do this, but do it in the SoC not the board level?
>

I was hoping we could get away with 0 use of system_memory.

Regards,
Peter

> [...]
>> > +static void raspi2_machine_init(MachineClass *mc)
>> > +{
>> > +    mc->desc = "Raspberry Pi 2";
>> > +    mc->init = raspi2_init;
>> > +    mc->block_default_type = IF_SD;
>>
>> > +    mc->no_parallel = 1;
>> > +    mc->no_floppy = 1;
>> > +    mc->no_cdrom = 1;
>>
>> Curious, what do these do from a user-visible point of view? Maybe we
>> should
>> add them to more ARM boards as they certainly make sense.
>
> I think they turn off some redundant stuff in the UI (e.g., there's no View->Parallel menu option). I'm guessing they also disable the -cdrom and  -fd* options, but didn't test that.
>
> Cheers,
> Andrew
