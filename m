Received: by 10.25.0.144 with SMTP id 138csp1124363lfa;
        Sun, 16 Apr 2017 21:09:22 -0700 (PDT)
X-Received: by 10.237.53.218 with SMTP id d26mr7159928qte.149.1492402162851;
        Sun, 16 Apr 2017 21:09:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si9728344qkh.6.2017.04.16.21.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Apr 2017 21:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czxyc-0007md-CR
	for alex.bennee@linaro.org; Mon, 17 Apr 2017 00:09:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxxk-0007SB-En
	for qemu-devel@nongnu.org; Mon, 17 Apr 2017 00:08:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxxg-00074D-8k
	for qemu-devel@nongnu.org; Mon, 17 Apr 2017 00:08:28 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:34634)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxxg-00073r-4r; Mon, 17 Apr 2017 00:08:24 -0400
Received: by mail-qt0-x242.google.com with SMTP id y33so3267954qta.1;
	Sun, 16 Apr 2017 21:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Yi5D6ODeunsYAGib5k2uk58L+PI+4GrlVpd8yELWfJo=;
	b=daJ5OSnYxRA7u7dPUZVR2jbgZFNWQQdiYA7C+th/71qnY1eDS0cw/q1U03dYYPXxDX
	+0bTaeWwYDefNKEX1EJAUm3aEvcz+n27va8DzACdB63swqgLA7zb1lYSX09pLuEaBMuO
	ss6LZ/FQLwGvsuJ6Z9ztAjDVJi+KLijspCITs8enG/DL1cwLjhzSrpYQ045pW1HHR9fm
	K6u8aj+UUyZwot6emOZxSKZD0vsMDW8WQ2j4BR3FwlWBio6cDPSoQ1nfqf6SbQM/XNvl
	ly2EIZX1F+ynALcqcsTKH+Bl49PUnBNqI5+LFjGkhqOPRO70d5EVa0cX7DWB1AxaOsf9
	8jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Yi5D6ODeunsYAGib5k2uk58L+PI+4GrlVpd8yELWfJo=;
	b=I8p+rnvA9yvw1E42PerOWBnPN6Ja9yI+bWKrY7aqE+7mx5VBD3g14Z22DkCZ5GXCa+
	L1yvSRC2MuIRMw86rcQ/3qi0Y/NovnWQ4CNwSR05a9kkjvmxodgwAoFIEXTugJKA2VdL
	pkZ3oz51tz1Xvp82GWTTA0xu4Oly4UIQQT7rZO5X5Cvrgl0yFe2L0A1186p801eaPlTy
	97z/Z7iGjbvpbHwGQJNM6kZReS2oC6aoRhKDH2SMpztkkr3iruCMmv+gWoaPjdMP+0nf
	lrU99gdrN7xHhh2R1G2wINKFgQJOyIh2mWafqa7PyR4bt0HZB5nbd+mQxoEeFSGY3XUr
	Ob5A==
X-Gm-Message-State: AN3rC/5hRIal1cOg4Csyo07MG6gY8XwrdkCA7TH9CBlWwRhM/ZXqi1sA
	QjyYGzTkcx+EHA==
X-Received: by 10.200.3.195 with SMTP id z3mr6968722qtg.129.1492402103540;
	Sun, 16 Apr 2017 21:08:23 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id c33sm303211qta.65.2017.04.16.21.08.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Apr 2017 21:08:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-10-git-send-email-peter.maydell@linaro.org>
	<b13702b2-44be-563b-5743-33c773a6e037@amsat.org>
	<CAFEAcA_KnJPrKU2gWCkPJELkU3QtbTOu+_fMrHWwkPcwS+NE2w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <93f5df04-c4a3-7c21-0035-a9a9a711a792@amsat.org>
Date: Mon, 17 Apr 2017 01:08:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_KnJPrKU2gWCkPJELkU3QtbTOu+_fMrHWwkPcwS+NE2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 09/11] armv7m: Split systick out
 from NVIC
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
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ecNfeH4QJmmG

On 02/20/2017 03:51 PM, Peter Maydell wrote:
> On 20 February 2017 at 17:43, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 02/20/2017 12:36 PM, Peter Maydell wrote:
>>> +/* Conversion factor from qemu timer to SysTick frequencies.  */
>>> +static inline int64_t systick_scale(SysTickState *s)
>>> +{
>>> +    if (s->control & SYSTICK_CLKSOURCE) {
>>> +        return system_clock_scale;
>>> +    } else {
>>> +        return 1000;
>>
>>
>> this magic seems to be SYSTICK_SCALE
>> (Paul Brook's commit 9ee6e8bb85)
>
> This patch is just copying this function from one file to the other...
> at some point we might want to try to improve the handling of
> the clock scale factors but that leads into complication, because
> the external-clocksource scale factor should really be board
> level configurable. (Slightly confusingly the leg of this if/else
> which is board-configurable is the one for the internal clock,
> because we're modelling the ability of the stellaris board to
> configure the PLLs so as to downclock the whole CPU, which
> incidentally affects the timing of the internal systick clock.
> Modelling this properly needs to wait on Fred Konrad's clocktree
> patches getting in, I think.) For the moment I chose to just
> leave the existing source alone, mostly.

Fine!

I didn't know about those clocktree patches, I'll eventually use them 
for MIPS.

>>> +static void systick_instance_init(Object *obj)
>>> +{
>>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>>> +    SysTickState *s = SYSTICK(obj);
>>> +
>>> +    memory_region_init_io(&s->iomem, obj, &systick_ops, s, "systick",
>>> 0xe0);
>>
>>
>> It seems to me the correct size is 0x10. The manual describes the range
>> 0x20-0xFF as _reserved_. This _reserved_ description is at the end of the
>> 'SysTick' chapter which seems weird to me... I rather think this range
>> belong to the 'Interrupt Controller'@'System Control Space'.
>
> The table of the System Control Space (B3-3 in the v7M ARM ARM
> rev E.b) defines the Systick space as 0xE000E010 - 0xE000E0FF,
> which makes it 0xE0 bytes in size. The NVIC doesn't start
> until 0xE000E100 in this table.

I still think it's weird from an electronic design point of view, but 
since I don't have access to ARM internals I'll believe the datasheet 
blindly :S

> The table of the SysTick registers (B3-7) agrees, in that
> it defines the registers as covering 0xE000E010 to 0xE000E0FF.
> In the current architecture everything from 0x20..0xFF is
> reserved, which just means there's nothing there, but if
> there was ever a need for systick to get another register
> for some reason then it would go into that space (and if
> we then implemented the new register in QEMU we wouldn't need
> to change the NVIC code, only the systick code).
>
> I think the way this patch has modelled things matches the
> architecture -- it's a guest error to access the gap between
> 0XE000E020 and 0xE000E0FF, but we should report it as an
> attempt to access an invalid systick register rather than
> an access to an invalid NVIC register.

I agree.

> thanks
> -- PMM
>

Regards,

Phil.
