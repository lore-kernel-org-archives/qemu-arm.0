Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp612848wrt;
        Wed, 26 Sep 2018 05:30:23 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63N86S9XI10hdSEXs+PV030WM9ocO68dpL2jvaG7FUoqzixa9NRPtXqwS0F4S8GfucOkloe
X-Received: by 2002:a37:cc9a:: with SMTP id n26-v6mr4053198qkl.112.1537965023870;
        Wed, 26 Sep 2018 05:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537965023; cv=none;
        d=google.com; s=arc-20160816;
        b=Mu8ELgbGexHaTw1VhLiL+Wn5CrfJ+nHmTmpeyIx/3LsFPh5+FJv0vHy34aYWHpecgW
         Um8ZAVgaShJEfkqdPgO8hQaMkbJwVuAJYRG50Z8MwJ4E81uQ5YA7TgCds7R8+2yoqLaX
         IV/RNDOMH8TuXcU7s8+kxSw15NqXNpT4IhPIgd67rDrOn7AyZMFNckUWMJOfrgWMeHH1
         2U8cj8iDGbYv6KRNls69pmjV4Lei6U4OrQhNcF2ZmWM2V2hFe0s95h1IGBcObpAnsTxS
         /ZSdkC0EpIkBrLc5dZX+eGPR2ZWM2CJxDftMmEBcVOPSlcZ6OwsTAAckd+NlJJd6tsNe
         6utA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=THk7UwgS7h0AH11on3/tr01oTUvFgy20Qtpv/Vddn9s=;
        b=HjoDK7S9fpYcE7X5AjWJmPbWBuN0aH5bO6DYDKQy9vA5PzWRFZ/vICWoC3UbEVTWef
         YA+LtALudwswrUTZL5anZmT5a79qsLJ7PV+xNhoYXnp0TF3zmkEGHq2+6nf9Vb8l986F
         V1iGVu2wbvMnwHoYtMJDbEH76qldFIMUpK72ygD6twD6sMduseLKrf9ZA1HrNVjnpZ9K
         vX8jcd11cfJZwSH4iI/qY2g+E1xIVhvmHUJ+0eClQ1bo6mxtffu6oGPoe09GY9Vn5ZX6
         UM8gSOylG92bmLAXU6TkTnYy+BZAwFeSFJi2G592LtAnbpwFW2I3EwbsT2Z89zJWfz6z
         OSdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eA9UPIT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g20-v6si3663506qtr.323.2018.09.26.05.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Sep 2018 05:30:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eA9UPIT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g58xT-0005yI-A9
	for alex.bennee@linaro.org; Wed, 26 Sep 2018 08:30:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g58xG-0005uP-R1
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:30:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g58xF-0004O0-O2
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:30:10 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39894)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g58xF-0004Le-8l
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:30:09 -0400
Received: by mail-oi1-x242.google.com with SMTP id y81-v6so4209205oia.6
	for <qemu-arm@nongnu.org>; Wed, 26 Sep 2018 05:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=THk7UwgS7h0AH11on3/tr01oTUvFgy20Qtpv/Vddn9s=;
	b=eA9UPIT6RB+aOQZwv1PtYIWgD2EmOUxX9bV8SiMPGqWC6OHAMsTWTPgOyxB6f3kvHH
	7FobST3BDz04xkPU+M8zt9N2fe+0t9HeJojuYQDj4HDPkMcexoFKjZIWoIoL2J8X8Jz2
	QjTg6viy7ASjxeiApo+KG3TqwK8/mntVDiiq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=THk7UwgS7h0AH11on3/tr01oTUvFgy20Qtpv/Vddn9s=;
	b=if/8FUMI2WeETpgNIxQP7X6q5EoFrcoUpEpr3lIeGlBMeh5E+xea6Jc7zH9barOhM0
	84ZjudSs3zfCSq0lbc4rZ3zIrN1D7yi6kYwdkzpLXZFob2vAaTn3X8uY7BRuGO130dKj
	171VIRPSdnepddq5H00G+QU8QT1vLdKU7T2VLOXcClzhpCilMfJdga0TZitl/9yrt7Gu
	vYzG6OiqM8/E1ssu2I/+7YESe4slI8x3saAiaL9w3S1IkhmUjO1VC4KVEXnUslPJip24
	En1t5otQmZD6SP9EotkiDh/1kVTFCOnW1qW0eUntGFkAL8kcNgxsl0VKiroH+B2RaNwQ
	gO+g==
X-Gm-Message-State: ABuFfojO/blHfkVzOhPHNP/vc8Xv7jpJjbzZHf/uDr5D1J9ExwJQyUp1
	0zM94WhqT6dPqJbuBjypOadwZGqzcAYxGch1MqoAHA==
X-Received: by 2002:aca:3bc2:: with SMTP id
	i185-v6mr430649oia.156.1537965008594; 
	Wed, 26 Sep 2018 05:30:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Wed, 26 Sep 2018 05:29:48
	-0700 (PDT)
In-Reply-To: <d890001e-6aef-673c-2727-b4278b85ca7f@amsat.org>
References: <20180925144127.31965-1-peter.maydell@linaro.org>
	<d890001e-6aef-673c-2727-b4278b85ca7f@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Sep 2018 13:29:48 +0100
Message-ID: <CAFEAcA8VH5B4NL3+sNuzr8RFUOn_Myjqa5+MgYNtkkqmARnOUQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH] virt: Suppress external aborts on virt-2.10
 and earlier
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
Cc: Idwer Vollering <idwer@cuckoo.sh>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b4VdRiuajKLL

On 26 September 2018 at 11:35, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> Hi Peter,
>
> On 9/25/18 4:41 PM, Peter Maydell wrote:
>> In commit c79c0a314c43b78 we enabled emulation of external aborts
>> when the guest attempts to access a physical address with no
>> mapped device. In commit 4672cbd7bed88dc6 we suppress this for
>> most legacy boards to prevent breakage of previously working
>> guests, but we didn't suppress it in the 'virt' board, with
>> the rationale "we know that guests won't try to prod devices
>> that we don't describe in the device tree or ACPI tables". This
>> is mostly true, but we've had a report of a Linux guest image
>> that this did break. The problem seems to be that the guest
>> is (incorrectly) configured with a DEBUG_UART_PHYS value that
>> tells it there is a uart at 0x10009000 (which is true for
>> vexpress but not for virt), so in early bootup the kernel
>> probes this bogus address.
>>
>> This is a misconfigured guest, so we don't need to worry
>> about it too much, but we can arrange that guests that ran
>> on QEMU v2.10 (before c79c0a314c43b78) will still run on
>> the "virt-2.10" board model, by suppressing external aborts
>> only for that version and earlier. This seems a reasonable
>> compromise.
>
> I tried another approach to keep MEMTX_DECODE_ERROR delivered (out of
> 0x10009000) for 2.10, using the UNIMP device, but the code looks uglier
> (create too much generic code for a single issue):

I definitely don't want to do that...

> I prefer your compromise.
>
>>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/arm/virt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 0b57f87abcb..3ba310a37b6 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1926,6 +1926,7 @@ static void virt_machine_2_10_options(MachineClass=
 *mc)
>>  {
>>      virt_machine_2_11_options(mc);
>>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_10);
>
> Can you add a short comment here?
>
>        /* See https://bugs.launchpad.net/qemu/+bug/???:
>         * Some misconfigured Linux guest poke for vexpress uart
>         * at 0x10009000 */

I view it as more "virt-2.10 is supposed to behave like
the 2.10 release virt" rather than a specific fix for
this guest, I think.

thanks
-- PMM
