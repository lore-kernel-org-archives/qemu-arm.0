Received: by 10.25.0.6 with SMTP id 6csp902163lfa;
        Thu, 1 Jun 2017 10:32:10 -0700 (PDT)
X-Received: by 10.55.58.67 with SMTP id h64mr3342493qka.9.1496338330616;
        Thu, 01 Jun 2017 10:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496338330; cv=none;
        d=google.com; s=arc-20160816;
        b=jIJfGIAqZn5Ih+W3xYf4kqlPllVqxVPvjsx6auxb0SJxpdTaSwE6POe1mCvf6FzPsd
         YmfB8htzA6ixUuxjG3O7/BLtcE1KCmAIO9YlfWJmXLbYgu2vbt57g+AufRMARKL2qSK3
         lUXb/n2xSL28ZfTq7WoahkW/SagrqxFLNgL+C8tCDZ2kC/PUaVS9XuECyVvju+TolBXC
         Wf64gVVjFJl4oa3TA6HEaHoBNCuUYPPHTGhsU2xBinkyb50kgTX+6e9CMK4vcwWaODVW
         fmRq9j3dROR0cx09Hp7xUUjtkvdzlcug+ELR5dJyHEE0AUSsW4lQDltWjtY+zeuCvHgS
         CncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+Pe9NsWJ4m80Du68+S91YfSqLWpwLyH5InCMvw+jEqU=;
        b=c+lfg1HEKjuyvZzHm7Ze9tf4VzJPYEh61wuf03Qa7a8aPFdK1zb8NnaICyrAw4bHj6
         8yYSvv104ZvXlSaEBWj2sKHnNQmIEaMXp+sIfL5fuRICGqIHi21ybEQADMvNLa8GqBX5
         +QZm6vi0rxutXARmCVZkw7aZHZYDRGnaIM9t2PUns+njlslnSA/fbYg/qMooq80vFJLb
         BWIu6Tub76cIhIg15NATcn6g7lW4pt/zq3qDGzkZqE2BpYufqOX8IhPF8N8faUNTewuy
         z7wH0IF5noRrDWT+WGemdAD5FHSwIjCrxAMlwSLvh4xEUyI5i94ypZgWMykPXFw9crDt
         SB/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m55si20556444qtf.187.2017.06.01.10.32.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Jun 2017 10:32:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGTx9-0003wZ-Pp
	for alex.bennee@linaro.org; Thu, 01 Jun 2017 13:32:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGTor-0004bB-C1
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 13:23:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGToq-0005MC-DE
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 13:23:33 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:37981)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dGToq-0005Ly-7S
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 13:23:32 -0400
Received: by mail-wm0-x234.google.com with SMTP id n195so41335446wmg.1
	for <qemu-arm@nongnu.org>; Thu, 01 Jun 2017 10:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+Pe9NsWJ4m80Du68+S91YfSqLWpwLyH5InCMvw+jEqU=;
	b=JthgzzgC3C8PnaYeRO9yM8z5aAOPYQQ0biggmjjhLOjlD8UaTFhorandXQu3a3MHT3
	r7oZYMUCANOZXDk/fsHPGyC+HX4rYhCLBDkQtUScK7bEaQrWrxrbFn+qtkO4+epGly2e
	gmoLB0LuJDEzD9Ja6MCIjBkSGHyeWZxcPw0mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+Pe9NsWJ4m80Du68+S91YfSqLWpwLyH5InCMvw+jEqU=;
	b=TOFcbXRxLKfiUHPnOTglmU0DNAeioD9Dp8tc5YbhXDUL2Z3fzFUiy68Mz1Z+GNCBgD
	uidOd0CjA9pf+YgxP5+vpSPzDrYlBLfEutVMgMPNW15wTFFuahOviTWoTo5/ICf34XIy
	mr7O39hktw4+v8QBf/P+9DXwNAvMjXrZotIKrwAlO6W9gMY5j1dIO5Ueau/C2ccGwDv+
	JZHCXbQJBztBaJx7DUrdN9+qwiAcoI5F5li7NwS8B9gl33nhiU9Wje+iVukuZ7A37gxr
	oTOdu2ECgHiFMse9z7zmsaMhjZMnCrpIErjyfrXv/doNuQIlDKXbJrNPP/u+83xr0Z8C
	p5lg==
X-Gm-Message-State: AODbwcCRjdhoETUhFv5WZC1ZyYYpp5VSKDfgRZfyAwGFVVyCQ2quG0S2
	U8VwF2rETMFS762xUv2aaDEEbD/0AukF
X-Received: by 10.28.103.214 with SMTP id b205mr170083wmc.125.1496337811125;
	Thu, 01 Jun 2017 10:23:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.178.66 with HTTP; Thu, 1 Jun 2017 10:23:10 -0700 (PDT)
In-Reply-To: <20170601171019.j7ist5qnuvllvfhi@kozik-lap>
References: <20170521152949.15338-1-krzk@kernel.org>
	<CAFEAcA8qYBAgHWPGdSTry7Rmt1Ai9gmKXdKs+f_x_jQU0+7c5Q@mail.gmail.com>
	<CAJKOXPebX4GFh06NmAfkt3Vt5D-xwbeJ3UPA-Z+vMc8BtQZcZw@mail.gmail.com>
	<CAFEAcA8Q8-U9aocQgbUTt2WP4S9Tj_K_iXZuP08x9Ck0LszS3Q@mail.gmail.com>
	<20170601171019.j7ist5qnuvllvfhi@kozik-lap>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jun 2017 18:23:10 +0100
Message-ID: <CAFEAcA_3+S8jWsKUjzivBLcJhan1mfBo7o1WzMaG6wo6qa6LuA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-arm] [PATCH v3 00/11] hw: arm: exynos: Bring up secondary
 CPU, QOM-ify Soc, other improvements
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dzfZQTQoMN8R

On 1 June 2017 at 18:10, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Jun 01, 2017 at 05:31:41PM +0100, Peter Maydell wrote:
>> It sounds like it breaks a key thing, ie "boot a single cpu kernel
>> built from a defconfig", though. That's a regression I'd rather
>> not have.
>
> I am not sure if I understand you correctly... the system previously
> booted into one CPU mode because second CPU just could not boot. Now by
> default, second CPU succeeds and this means that *default* settings are
> indeed more broken than before.
>
> On the other hand, after removing a line from hw/arm/exynos4210.c:
>         qdev_prop_set_uint32(dev, "num-cpu", EXYNOS4210_NCPUS);
> and running qemu with "-accel tcg -smp cpus=1,maxcpus=1,cores=1"
> everything is okay. Booting of one CPU is unaffected.

Ah, I see now.

>> If there's a subset of these patches which don't break
>> that I'm happy to take those. Otherwise we need to investigate
>> and fix whatever the problem is that causes that unresponsiveness
>> before we can apply them.
>
> Yes, you can take everything except first patch
> ("hw/intc/exynos4210_gic: Fix GIC memory mappings for secondary CPU")
> and it should be fine. Rest of patches are just independent.

Can you send a series which has just the patches that don't break,
please? I think this series needs a respin anyway because of the
make check problems (noted on the other thread).

thanks
-- PMM
