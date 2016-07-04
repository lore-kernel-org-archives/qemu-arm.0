Received: by 10.25.21.96 with SMTP id l93csp1524794lfi;
        Mon, 4 Jul 2016 06:35:45 -0700 (PDT)
X-Received: by 10.37.82.4 with SMTP id g4mr1842934ybb.103.1467639344011;
        Mon, 04 Jul 2016 06:35:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a133si2016953qkc.140.2016.07.04.06.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 06:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK42J-0007Ic-Ds
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 09:35:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK3M5-0005Uz-Vr
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:52:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK3M3-0002VZ-Tm
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:52:04 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK3M3-0002VQ-Ca
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:52:03 -0400
Received: by mail-vk0-x22a.google.com with SMTP id c2so230352561vkg.1
	for <qemu-arm@nongnu.org>; Mon, 04 Jul 2016 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bmfgG9lxMPWCzKMJd870KjfJTlX7WdPRoGGoo6UYEqE=;
	b=E3lanQ/87WNhON0vkKA77v+Sg2QtWR7Y0vqDiYGYE6FtutBCdHwz5gfe1XS26/oAUb
	8nYLJpJzkbcQHa3xe5y3oUM0/mLupwNPleieLFWA6RgJHvgESWWLDFAfm2A8OKQsnnif
	GVgjaWui44fkZP/e4xJRnu8khqURUzi6mlbGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bmfgG9lxMPWCzKMJd870KjfJTlX7WdPRoGGoo6UYEqE=;
	b=NnEK7qbPVZekAtYkhCjYS1Xr1t2xjYgZxErI89UWVcx1Q+Tdufa4ufWxqPSmEyydGQ
	Hrf41SYRQgt/haCFWLBhvoogHeVg7L6OarNIjmGjEY8zXcifAt/v/U02yTUs8Hn75fih
	L55vnMf775S7G7mfBL9XxIhKqlgHfyFFK1FiZKqF3zMBh6BSYuTKNMtsaBcHwRE2631A
	jeN3Fr8cYYdPe4pQyreL1ifch19c5M5YM69kqIfE6h2Y7j0awc0/Def3iGHAvLJLfI6E
	3xSxbSSnig0G4mM1iXQ+imOgKKxSiotPT2ETjmC4FYO9k/hcd+6/0jVANC2AZziLsxAS
	MPWw==
X-Gm-Message-State: ALyK8tJv9JxQ5ypgxfifnRtFY1UwwHL2SeCYL0ltbB/PnuYD1VuduigjGQIROs8A+jteg8xQ/a1KlupYgzl8gxz3
X-Received: by 10.31.208.196 with SMTP id h187mr5277577vkg.120.1467636722755; 
	Mon, 04 Jul 2016 05:52:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.242.75 with HTTP; Mon, 4 Jul 2016 05:51:42 -0700 (PDT)
In-Reply-To: <8a6e0fd8-cd84-53c2-e230-a401ffac4212@kaod.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-2-git-send-email-clg@kaod.org>
	<CAFEAcA9RzmF7UcCL3fuBCPtWbBrWUYs8836=OjC5d=H3n4u+Bw@mail.gmail.com>
	<8a6e0fd8-cd84-53c2-e230-a401ffac4212@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2016 13:51:42 +0100
Message-ID: <CAFEAcA-MKzmUAZTEbL7WMEOyP84y5=Jj7J-jprW6azMRBYwcaw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [PATCH 1/7] tests: add a m25p80 test
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Marcin_Krzemi=C5=84ski?= <mar.krzeminski@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MeJKl0W9546U

On 4 July 2016 at 13:39, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 07/04/2016 02:24 PM, Peter Maydell wrote:
>> On 4 July 2016 at 13:18, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>> This test uses the palmetto platform and the AST2400 SPI controller to
>>> test the m25p80 flash module device model. The flash model is defined
>>> by the platform (n25q256a) and it would be nice to find way to control
>>> it, using a property probably.
>>
>>
>>> +static inline void flash_writel(uint32_t data)
>>> +{
>>> +    data =3D cpu_to_be32(data);
>>> +    memwrite(AST2400_FLASH_BASE, &data, 4);
>>> +}
>>> +
>>> +static inline uint32_t flash_readl(void)
>>> +{
>>> +    uint32_t data;
>>> +
>>> +    memread(AST2400_FLASH_BASE, &data, 4);
>>> +    return be32_to_cpu(data);
>>> +}
>>
>> These are weird. As per my question in the other thread, if you
>> were writing this as a piece of test code that ran natively
>> in the guest, how would you write it?
>
> Here is the uboot flash code :
>
>         https://github.com/openbmc/u-boot/blob/v2016.05-aspeed-openbmc/ar=
ch/arm/mach-aspeed/flash.c#L420
>
> So these are doing byte per byte, but there is no reason not to do
> long.

If you want "write a long", that is what writel does,
and your test code should be able to use it in exactly
the same way native guest code would write a register
value with a str instruction.

It's very easy to work around endianness issues by
randomly changing things until the tests pass, but it's
much better to actually identify what you need to do
and where the code is diverging from that.

thanks
-- PMM
