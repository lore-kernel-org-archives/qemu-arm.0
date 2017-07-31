Received: by 10.25.44.15 with SMTP id s15csp3539177lfs;
        Mon, 31 Jul 2017 05:09:35 -0700 (PDT)
X-Received: by 10.55.95.194 with SMTP id t185mr6739991qkb.61.1501502974876;
        Mon, 31 Jul 2017 05:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501502974; cv=none;
        d=google.com; s=arc-20160816;
        b=d+qVyx+yeRX4UxCXLY3RJBH6blThTUlK29Eus7azH/ooMfP0IbsngHyVP6rLuzWs63
         4+En/6aoX0bdDVZ3fZyWANGtS2bW2JRMLMruJWLKJ64CpW8z+uOkIYbBFp8mvsus/D51
         xn8rjrp5nIQjc8gbXglFCpoUrkR3112p5i33UF+CVWUG5yoRixI2QR8DVyvlBj6Xpcsd
         ixXmAjdMiosdVMes9bWnF6gVgdXYkGzm2mQvSHgJGdeiS8mUA1czJ4VJbnuz6aELfI/S
         mWpKedGO9CcMXdVThuaEBSbHJFXRlpelWLNq8ptXQDBL7L22dM2lrO+xdqw58HPwo9A+
         c4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=uR6DBlmnq2fiWDqbUjhcwVHmIy0IBOX7dDkwWzEOADI=;
        b=HfANuNR32UsQgxj5U9Bfbf1kK4N2hH3+YXq2tTqhWzSRrLrRoUiILt/qs4RbTiRv0y
         1uWOZ2yboqOXhYbxumz7tuOTUckO7E6qcus1AWYVw04nGynXIU9ChFL65bLacZaoxpif
         tWOsPR/Tsm82zbZunJ08uOPlRtjjq6NFEdPaikc0/Zmc05CMvzRqmbfoSPdR0cxz3oku
         HpSt37r4zDRA/UgT0bMM5M5S6ZYv8OAOTIucIbaso+6wmGiw77OYE9iS4x0IQ3aYbXTt
         WVVxFgpoIP9u+GQqlqGU1lAkKBn0EG0ZQhSSZvZKOY8jkPDM3D2bpZE4pBx8L0AXaefk
         8qcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=AKCSrPyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p34si15552361qtg.235.2017.07.31.05.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 05:09:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=AKCSrPyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dc9Vs-0005mT-4V
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 08:09:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dc9Vl-0005mG-1o
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 08:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dc9Vk-00035F-4z
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 08:09:25 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:38394)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dc9Vj-000344-Ta
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 08:09:24 -0400
Received: by mail-wm0-x22c.google.com with SMTP id m85so168086303wma.1
	for <qemu-arm@nongnu.org>; Mon, 31 Jul 2017 05:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uR6DBlmnq2fiWDqbUjhcwVHmIy0IBOX7dDkwWzEOADI=;
	b=AKCSrPybdDMGRAiZ5plQ7zwWpCvEX+uPK6uMGu2AT6lZquVzSEAa9IdEMghTvq0Vrf
	0dBHNh0qx78irWc6Spuh3ywGglNlAkt5OduddiUiJC7wwBEijrY6oasZ2GKmL/8IH6Zf
	qvET3hd/K0h6dxEYkNx/Qs8nykRbjcYxTsmFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uR6DBlmnq2fiWDqbUjhcwVHmIy0IBOX7dDkwWzEOADI=;
	b=YX7QtASo0H2qBVuh07QiA2Nv+x8+wCcoDl9JLinHAuPATzI7EPdHEESbzUG6dqkx7d
	evBFUXiyC5Z/R2+aQx3w0GGU0YDQ9VelFBIXIKM+frsGEXyYon8mDCsFHZjMfMoDA9CE
	mAVg7Pj4NmXIWdXCl3OJm2KGtGhyKjKrbIDucbxYhft2o3yUXWnv9rwrhqpSOkb4P778
	B8s/c37s1JeIgacmw7Hq/rlHZISecad8qtOhUiEunjINlTPwQw+blgfiq1b3cbotFoeG
	eIUU5iPnQp7wEvSr3UoBSbDqbGZhNqus+zMXCiEZUq6Js+mi6+iMX000hPr2t3Q5u3Vy
	mrQA==
X-Gm-Message-State: AIVw111rir5WC1mEwDiN6goEHA5GFyGGiCTnw8bFCpa5ke/JbRfWtP6u
	S+5vIM6lYpgI0PZJGujc9HEfxRHrDnD3
X-Received: by 10.28.95.69 with SMTP id t66mr11381460wmb.74.1501502962615;
	Mon, 31 Jul 2017 05:09:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 31 Jul 2017 05:09:02 -0700 (PDT)
In-Reply-To: <b48b8728-7cb3-3d6e-745f-1aee5c2038e6@amsat.org>
References: <20170717133010.12784-1-f4bug@amsat.org>
	<CAFEAcA_rhoCup57nYYW4HN6Qsz3sp-cxY-OwsK-x=fYtfJ31aQ@mail.gmail.com>
	<b48b8728-7cb3-3d6e-745f-1aee5c2038e6@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jul 2017 13:09:02 +0100
Message-ID: <CAFEAcA9bb3YTVQvK5qoN8jEqEpAsP-a7hoGjSoYeqwTGzs7jng@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [PATCH] hw/arm: use defined type name instead of
 hard-coded string
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
Cc: Rob Herring <robh@kernel.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zhilHmCgq1RW

On 27 July 2017 at 14:48, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> On 07/27/2017 09:36 AM, Peter Maydell wrote:
>>
>> On 17 July 2017 at 14:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>
>>> Hi Peter, this patch is waiting the IDE queue to enters since it depend=
s
>>> of
>>> commit de09efcc7b67ada3593354711b12a03dea23a9d0 to fix AHCI includes.
>>
>>
>> There's no commit with that hash in master -- do you have
>> a commit subject or something that I can use to find out
>> whether it's landed or not?
>
>
> Oops I guess the IDE queue was rebased between this patch and the merge, =
or
> I messed my copy/paste :)
>
> The dependent commit is 70e2337030f and has how entered /master, do you w=
ant
> me to send an v2 with fixed message? Anyway I delayed this patch for 2.11
> since this is not a bugfix.

You don't need to resend, I'll just keep it on my list of things
to deal with after 2.11. (Anything below the '---' isn't really
in the commit message anyway, it gets stripped out when the
patch is applied.)

thanks
-- PMM
