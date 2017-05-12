Received: by 10.25.0.6 with SMTP id 6csp72448lfa;
        Thu, 11 May 2017 22:16:52 -0700 (PDT)
X-Received: by 10.237.42.102 with SMTP id k35mr2244187qtf.58.1494566211952;
        Thu, 11 May 2017 22:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494566211; cv=none;
        d=google.com; s=arc-20160816;
        b=apva/LZ9YECnvJG9H+6O02lJ1IhuaYca2Q2335ZYr9OOf0QHIVqnToCy0p7fAqf7A0
         jCX/tkbCkM4ix9g9U+U1Z8spKbV0MMMO8/ue8KY8lT7AR3gwES1T+1OaMfhR94CMR9Ky
         Y6Wgk8W2/AQi0H/Q9mYZHZiYAzFP955bvDMDgDYeJu3Pz9ill5uCYsHymmL03ieKJywE
         icQpD/ZilovNKJKiSF3ZSpzA+1m2uWtGQPniSnZuo3dqKdf7EkYSwpQf6bA/fIk6c75R
         VMPSUUqi2fY1/e6zHXijaeuC31Kc0vAyAi2K//n/j2NoEuSXRG+OJ/luARpEIxdfzeOw
         qnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=goGOTcw5rQtWZWQfpAfFQ/xLW0aisovaLD97AEzHo38=;
        b=PJJbcaZvkLr5nDa2UM2j2H38RAlh0QhaNW1gftds3/kB4/12qpCTG9dBv/8Upj+MI9
         3lfknRVENGyUP/4WLeDNOynNWoz8d0YIqM5bKn1y7gEUqFYci1/F9wYiu5oOPrYWzGjL
         5sbkcKhQNXvSOKr2P6pizyY2OcMaunsV+wB+snSj9wCw1fCTD5jPLagErLFmR40KxS4w
         S+dWbt4yixK2Hr9O00BbYf5SOykT7Uw2Nyg3o09TmW5RFvaJ8JTFjGWVq8ehvYPiDxet
         gw2Dhm3CNjXpngjjAbGkM7362AuYUJ1Y9BKSvpC42WxqZ3pfk+U2P+i6b5JUVUyJOBUa
         AArw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m184si2367472qkf.307.2017.05.11.22.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 22:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d92wd-0000a3-CT
	for alex.bennee@linaro.org; Fri, 12 May 2017 01:16:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d92wU-0000YG-Rw
	for qemu-arm@nongnu.org; Fri, 12 May 2017 01:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d92wS-0008H7-U1
	for qemu-arm@nongnu.org; Fri, 12 May 2017 01:16:42 -0400
Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243]:34900)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d92wO-0008Dc-N8; Fri, 12 May 2017 01:16:36 -0400
Received: by mail-yw0-x243.google.com with SMTP id p144so888682ywp.2;
	Thu, 11 May 2017 22:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=goGOTcw5rQtWZWQfpAfFQ/xLW0aisovaLD97AEzHo38=;
	b=nmZQR3+TfS5wLU/s0Jho/iKpUR3745xK4Hl4gtv0vc5ax9Lz+5ZmqCrUrVGG2exyQ0
	0fj+H0eos1k4oosef/8Ag55dKmcPk5I5RHSdEkfDgtHPpxgAG6aQSZ5y9juilo6oVnFr
	CSnppmaxJRmXf5JDLZFCYSGmEqluWkks8vpfIRTFjXa0wuyCc/lsIMlsEp1CkOqXLe8i
	FaMuwR10sWS+iwsC45xpB4mBGjCIeazKZa7YPETHYAnqhRGoB+4BEAejFBJcYjQIvyrc
	9mhyze368Xxycv9hs3GeKKRudD7jRjMuIZRxXMul+BBnO+YbHqrt0zagU1rcSo2wu6xS
	27QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=goGOTcw5rQtWZWQfpAfFQ/xLW0aisovaLD97AEzHo38=;
	b=PKoec37uGXuwlvLxayCSvb/yOVLBVdWFmYsJ666PqiA9vSIGVb1zGXPKBXFtctqZ+K
	JiZP+pxb3VX4C7Ip3po+WDUA8Npl6sE6QoCUhkbV0w5DZYrsNLk58KLOGqOyh79m06t5
	ico91Ry2PaCgzx8xD/tnXS//Tdnw9Kdsuu5w8wYR5AZY6XZ+/CPQQmsSwOJIJ4v/VCl/
	bZcv4Og987bKtaG25YMKBBtbzMdgItTttT0LgVbgMR8FhcHrj8bdX6nkxBUWOIqIwMmu
	s8jRwIIDOalCQyz+aQBIAvqQlT/V90dxZxBdIeGdceQIHiSJt0G2ZET0wPN20xtjRTW2
	NL7w==
X-Gm-Message-State: AODbwcANceFUS88OTCU8J6sj0prg4Ir/Uo/U61lExEaTz0H0sHP49jFB
	8wSH37EVthmmZcqT1yPe+qfqb3OTwA==
X-Received: by 10.129.90.65 with SMTP id o62mr1844909ywb.61.1494566195919;
	Thu, 11 May 2017 22:16:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Thu, 11 May 2017 22:16:35 -0700 (PDT)
In-Reply-To: <1dc2ee8a-be60-c276-5529-a666223bfc2b@amsat.org>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-2-git-send-email-sundeep.lkml@gmail.com>
	<e87597ba-4759-76a5-7b0d-3297d2eb8f79@amsat.org>
	<CALHRZuqfqjEWszkvVQSWAKR5zVbhD36=+Qt_DsVykk41cihO1Q@mail.gmail.com>
	<1dc2ee8a-be60-c276-5529-a666223bfc2b@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 12 May 2017 10:46:35 +0530
Message-ID: <CALHRZuq8q0Y2-PoNgV9kupP8C+aMMFyeKbYQPojJqkPjhuoQYA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a11492210339d63054f4ccfaa"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::243
Subject: Re: [Qemu-arm] [Qemu-devel PATCH 1/5] msf2: Add Smartfusion2 System
 timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KuP1fALliCtT

--001a11492210339d63054f4ccfaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Fri, May 12, 2017 at 10:08 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
wrote:

> On 05/10/2017 09:37 AM, sundeep subbaraya wrote:
>
>> Hi Phil,
>>
>> On Wed, May 10, 2017 at 3:11 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org
>> <mailto:f4bug@amsat.org>> wrote:
>>
>>> Hi Subbaraya, nice work!
>>>
>>> The timer you are modeling is the mss_timer, which is in particular
>>>
>> used in
>>
>>> the smartfusion2, I'd rather name it mss_timer.c so it can be reused by
>>> other SoC models.
>>>
>>> Ok I will change all other file names also to mss. Do I need to change
>> type names
>> also to mss?
>>
>
> As you wish :) Actel/Microsemi keep changing how they name it, MSS, M2S..=
.
> What I mean is this timer is valid for a Actel SmartFusion and for the
> MicroSemi SmartFusion2, naming it "msf2-timer" seems to restrict it to th=
e
> SF2 only.
>
> Hmm. OK I will change to mss except for SoC model,file and SOM file.

> I added few comments.
>>>
>>>
>>> On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
>>>
>>>>
>>>> Modelled System Timer in Microsemi's Smartfusion2 Soc.
>>>> Timer has two 32bit down counters and two interrupts.
>>>>
>>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com
>>>>
>>> <mailto:sundeep.lkml@gmail.com>>
>>
>>> ---
>>>>  hw/timer/Makefile.objs        |   1 +
>>>>  hw/timer/msf2-timer.c         | 252
>>>> ++++++++++++++++++++++++++++++++++++++++++
>>>>  include/hw/timer/msf2-timer.h |  85 ++++++++++++++
>>>>  3 files changed, 338 insertions(+)
>>>>  create mode 100644 hw/timer/msf2-timer.c
>>>>  create mode 100644 include/hw/timer/msf2-timer.h
>>>>
>>>> [...]
>
>> +        if (addr < ARRAY_SIZE(st->regs)) {
>>>> +            st->regs[addr] =3D value;
>>>> +        } else {
>>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>>> +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n",
>>>>
>>> __func__,
>>
>>> +                         addr * 4);
>>>> +        }
>>>> +        break;
>>>> +    }
>>>> +    timer_update_irq(st);
>>>>
>>>
>>>
>>> Here if addr >=3D (NUM_TIMERS * R_TIM1_MAX) you still update Timer1 IRQ=
,
>>>
>> while
>>
>>> this is unharmful right now this is likely to be break later.
>>>
>>> As long as Interrupt status register and Interrupt enable register are
>> not
>> modified calling timer_update_irq will not harm. Am I missing something
>> here?
>>
>
> Indeed, this is unharmful. It just surprised me when I follow the control
> flow.

Ok I will change it.

>
>
> +}
>>>> +
>>>> +static const MemoryRegionOps timer_ops =3D {
>>>> +    .read =3D timer_read,
>>>> +    .write =3D timer_write,
>>>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>>>> +    .valid =3D {
>>>> +        .min_access_size =3D 4,
>>>>
>>>
>>>
>>> I believe min_access_size =3D 1 is valid for any APB device.
>>>
>>>
>>> Ok. I followed Xilinx soft IP models while writing this. I am really no=
t
>> sure it is mandatory to put access_size. Can i remove it?
>>
>
> checking the datasheet "UG0331: SmartFusion2 Microcontroller Subsystem":
>
> '''
> CMSIS Data types:
>
> The [Cortex-M3] processor:
> * supports the following data types:
> - 32-bit words
> - 16-bit halfwords
> - 8-bit bytes.
> * manages all data memory accesses as little-endian or big-endian.
> Instruction memory and Private Peripheral Bus (PPB) accesses are always
> performed as little-endian. The Cortex-M3 processor configured for
> SmartFusion2 SoC FPGA MSS uses only little-endian.
> '''
>
> So Yes, ".min_access_size =3D 1" is correct for this Cortex-M3.
>
> If you remove it memory_region_access_valid() will do:
>
>     access_size_min =3D mr->ops->valid.min_access_size;
>     if (!mr->ops->valid.min_access_size) {
>         access_size_min =3D 1;
>     }
>
> So that is the same, personally I prefer it to be explicit (not removed).
>
> Ok will change to 1.

> +        .max_access_size =3D 4
>>>> +    }
>>>> +};
>>>> +
>>>> +static void timer_hit(void *opaque)
>>>> +{
>>>> +    struct Msf2Timer *st =3D opaque;
>>>> +
>>>> +    st->regs[R_TIM_RIS] |=3D TIMER_RIS_ACK;
>>>> +
>>>> +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ONESHOT)) {
>>>> +        timer_update(st);
>>>> +    }
>>>> +    timer_update_irq(st);
>>>> +}
>>>>
>>> [...]
>
>> +/*
>>>> + * There are two 32-bit down counting timers.
>>>> + * Timers 1 and 2 can be concatenated into a single 64-bit Timer
>>>> + * that operates either in Periodic mode or in One-shot mode.
>>>> + * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-b=
it
>>>> mode.
>>>> + * In 64-bit mode, writing to the 32-bit registers has no effect.
>>>> + * Similarly, in 32-bit mode, writing to the 64-bit mode registers
>>>> + * has no effect. Only two 32-bit timers are supported currently.
>>>> + */
>>>> +#define NUM_TIMERS        2
>>>> +
>>>> +#define MSF2_TIMER_FREQ   (83 * 1000000)
>>>>
>>>
>>>
>>> I can not find this value, can you point me to the datasheet? It seems
>>> SoC
>>> specific to me.
>>>
>>> It is configured in Microsemi Libero. The SOM kit from Emcraft comes
>> with this default setting.
>> I guess this property should be set and passed from board file and not
>> from SoC.
>> Am I correct?
>>
>
> It seems an option configurable in Libero before synthesizing, so that
> would be SoM/bitfile specific?
>
> What I mean here is I don't think this is a fixed value for a mss_timer
> and I'd rather have it configurable (but ok to default 83MHz in your SoM)=
.
>
> Yeah. Same like hw/microblaze/petalogix_ml605_mmu.c where one design was
chosen for FPGA.
I have chosen the one which comes preloaded with Emcraft SOM kit.

> > Can I attach the datasheet to this thread?
>
> Isn't this datasheet publicly available?
>
> We need to download instead of direct google link. I dont know why.

Eventually can you upload a binary (like your Linux patches) somewhere? So
> it would be easier to test this patchset.
>

Sure I will put the source code and binaries in github.

>
> Thank you,
>> Sundeep
>>
>
> Good luck!
>
> Phil.
>

Thanks for taking your time to review.

Sundeep

--001a11492210339d63054f4ccfaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Fri, May 12, 2017 at 10:08 AM, Philippe Mathieu-Daud=C3=
=A9 <span dir=3D"ltr">&lt;<a target=3D"_blank" href=3D"mailto:f4bug@amsat.o=
rg">f4bug@amsat.org</a>&gt;</span> wrote:<br><blockquote style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" cl=
ass=3D"gmail_quote"><span class=3D"gmail-">On 05/10/2017 09:37 AM, sundeep =
subbaraya wrote:<br>
</span><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><span class=3D"gma=
il-">
Hi Phil,<br>
<br>
On Wed, May 10, 2017 at 3:11 PM, Philippe Mathieu-Daud=C3=A9 &lt;<a target=
=3D"_blank" href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a><br></span><=
span class=3D"gmail-">
&lt;mailto:<a target=3D"_blank" href=3D"mailto:f4bug@amsat.org">f4bug@amsat=
.org</a>&gt;&gt; wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">
Hi Subbaraya, nice work!<br>
<br>
The timer you are modeling is the mss_timer, which is in particular<br>
</blockquote>
used in<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">
the smartfusion2, I&#39;d rather name it mss_timer.c so it can be reused by=
<br>
other SoC models.<br>
<br>
</blockquote>
Ok I will change all other file names also to mss. Do I need to change<br>
type names<br>
also to mss?<br>
</span></blockquote>
<br>
As you wish :) Actel/Microsemi keep changing how they name it, MSS, M2S... =
What I mean is this timer is valid for a Actel SmartFusion and for the Micr=
oSemi SmartFusion2, naming it &quot;msf2-timer&quot; seems to restrict it t=
o the SF2 only.<br>
<br></blockquote><div>Hmm. OK I will change to mss except for SoC model,fil=
e and SOM file. <br></div><blockquote style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"=
>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote"><span class=3D"gmail-"><b=
lockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex" class=3D"gmail_quote">
I added few comments.<br>
<br>
<br>
On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">
<br>
Modelled System Timer in Microsemi&#39;s Smartfusion2 Soc.<br>
Timer has two 32bit down counters and two interrupts.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a target=3D"_blank" href=3D"mailto:su=
ndeep.lkml@gmail.com">sundeep.lkml@gmail.com</a><br>
</blockquote></blockquote></span>
&lt;mailto:<a target=3D"_blank" href=3D"mailto:sundeep.lkml@gmail.com">sund=
eep.lkml@gmail.com</a><wbr>&gt;&gt;<span class=3D"gmail-"><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote"><blockquote style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x" class=3D"gmail_quote">
---<br>
=C2=A0hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<b=
r>
=C2=A0hw/timer/msf2-timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 252<br>
++++++++++++++++++++++++++++++<wbr>++++++++++++<br>
=C2=A0include/hw/timer/msf2-timer.h |=C2=A0 85 ++++++++++++++<br>
=C2=A03 files changed, 338 insertions(+)<br>
=C2=A0create mode 100644 hw/timer/msf2-timer.c<br>
=C2=A0create mode 100644 include/hw/timer/msf2-timer.h<br>
<br>
</blockquote></blockquote></span></blockquote>
[...]<span class=3D"gmail-"><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote"><blockquote style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x" class=3D"gmail_quote"><blockquote style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; ARRAY_SIZE(st-&gt;regs)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[addr] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;%s: Bad offset 0x%&quot; HWADDR_PRIx &quot;\n&quot;,=
<br>
</blockquote></blockquote>
__func__,<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote"><blockquote style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x" class=3D"gmail_quote">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0addr * 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 timer_update_irq(st);<br>
</blockquote>
<br>
<br>
Here if addr &gt;=3D (NUM_TIMERS * R_TIM1_MAX) you still update Timer1 IRQ,=
<br>
</blockquote>
while<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">
this is unharmful right now this is likely to be break later.<br>
<br>
</blockquote>
As long as Interrupt status register and Interrupt enable register are not<=
br>
modified calling timer_update_irq will not harm. Am I missing something<br>
here?<br>
</blockquote>
<br></span>
Indeed, this is unharmful. It just surprised me when I follow the control f=
low.</blockquote><div>Ok I will change it. <br></div><blockquote style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex" class=3D"gmail_quote"><span class=3D"gmail-"><br>
<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote"><blockquote style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x" class=3D"gmail_quote"><blockquote style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">
+}<br>
+<br>
+static const MemoryRegionOps timer_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D timer_read,<br>
+=C2=A0 =C2=A0 .write =3D timer_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
</blockquote>
<br>
<br>
I believe min_access_size =3D 1 is valid for any APB device.<br>
<br>
<br>
</blockquote>
Ok. I followed Xilinx soft IP models while writing this. I am really not<br=
>
sure it is mandatory to put access_size. Can i remove it?<br>
</blockquote>
<br></span>
checking the datasheet &quot;UG0331: SmartFusion2 Microcontroller Subsystem=
&quot;:<br>
<br>
&#39;&#39;&#39;<br>
CMSIS Data types:<br>
<br>
The [Cortex-M3] processor:<br>
* supports the following data types:<br>
- 32-bit words<br>
- 16-bit halfwords<br>
- 8-bit bytes.<br>
* manages all data memory accesses as little-endian or big-endian. Instruct=
ion memory and Private Peripheral Bus (PPB) accesses are always performed a=
s little-endian. The Cortex-M3 processor configured for SmartFusion2 SoC FP=
GA MSS uses only little-endian.<br>
&#39;&#39;&#39;<br>
<br>
So Yes, &quot;.min_access_size =3D 1&quot; is correct for this Cortex-M3.<b=
r>
<br>
If you remove it memory_region_access_valid() will do:<br>
<br>
=C2=A0 =C2=A0 access_size_min =3D mr-&gt;ops-&gt;valid.min_access_size<wbr>=
;<br>
=C2=A0 =C2=A0 if (!mr-&gt;ops-&gt;valid.min_access_si<wbr>ze) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 access_size_min =3D 1;<br>
=C2=A0 =C2=A0 }<br>
<br>
So that is the same, personally I prefer it to be explicit (not removed).<s=
pan class=3D"gmail-"><br>
<br></span></blockquote><div>Ok will change to 1. <br></div><blockquote sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex" class=3D"gmail_quote"><span class=3D"gmail-">
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote"><blockquote style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x" class=3D"gmail_quote"><blockquote style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void timer_hit(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 struct Msf2Timer *st =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 st-&gt;regs[R_TIM_RIS] |=3D TIMER_RIS_ACK;<br>
+<br>
+=C2=A0 =C2=A0 if (!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_ONESHOT)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_update(st);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 timer_update_irq(st);<br>
+}<br>
</blockquote></blockquote></blockquote></span>
[...]<span class=3D"gmail-"><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote"><blockquote style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x" class=3D"gmail_quote"><blockquote style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote">
+/*<br>
+ * There are two 32-bit down counting timers.<br>
+ * Timers 1 and 2 can be concatenated into a single 64-bit Timer<br>
+ * that operates either in Periodic mode or in One-shot mode.<br>
+ * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit<br=
>
mode.<br>
+ * In 64-bit mode, writing to the 32-bit registers has no effect.<br>
+ * Similarly, in 32-bit mode, writing to the 64-bit mode registers<br>
+ * has no effect. Only two 32-bit timers are supported currently.<br>
+ */<br>
+#define NUM_TIMERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
+<br>
+#define MSF2_TIMER_FREQ=C2=A0 =C2=A0(83 * 1000000)<br>
</blockquote>
<br>
<br>
I can not find this value, can you point me to the datasheet? It seems SoC<=
br>
specific to me.<br>
<br>
</blockquote>
It is configured in Microsemi Libero. The SOM kit from Emcraft comes<br>
with this default setting.<br>
I guess this property should be set and passed from board file and not<br>
from SoC.<br>
Am I correct?<br>
</blockquote>
<br></span>
It seems an option configurable in Libero before synthesizing, so that woul=
d be SoM/bitfile specific?<br>
<br>
What I mean here is I don&#39;t think this is a fixed value for a mss_timer=
 and I&#39;d rather have it configurable (but ok to default 83MHz in your S=
oM).<span class=3D"gmail-"><br>
<br></span></blockquote><div>Yeah. Same like hw/microblaze/petalogix_ml605_=
mmu.c where one design was chosen for FPGA.<br></div><div>I have chosen the=
 one which comes preloaded with Emcraft SOM kit. <br></div><blockquote styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex" class=3D"gmail_quote"><span class=3D"gmail-">
&gt; Can I attach the datasheet to this thread?<br>
<br></span>
Isn&#39;t this datasheet publicly available?<br>
<br></blockquote><div>We need to download instead of direct google link. I =
dont know why.<br><br></div><blockquote style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quot=
e">
Eventually can you upload a binary (like your Linux patches) somewhere? So =
it would be easier to test this patchset.<br></blockquote><div><br>Sure I w=
ill put the source code and binaries in github. <br></div><blockquote style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex" class=3D"gmail_quote">
<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">
Thank you,<br>
Sundeep<br>
</blockquote>
<br>
Good luck!<br>
<br>
Phil.<br></blockquote><div><br></div><div>Thanks for taking your time to re=
view.<br>=C2=A0<br></div><div>Sundeep<br></div></div><br></div></div>

--001a11492210339d63054f4ccfaa--
