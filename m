Received: by 10.28.71.27 with SMTP id u27csp41480wma;
        Mon, 19 Feb 2018 07:18:05 -0800 (PST)
X-Google-Smtp-Source: AH8x225Va1rDF4BuQnmrogrsoN7FoDhU87QVfqZbfVLmy0oj4vJB9Bz0AzyC47eU+ylCD52OO3cx
X-Received: by 10.37.51.67 with SMTP id z64mr10511602ybz.268.1519053485390;
        Mon, 19 Feb 2018 07:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519053485; cv=none;
        d=google.com; s=arc-20160816;
        b=MmOtsofoMs/0wCjPg3fI2OTytd/BME7M4jqdD0YjhVIRz9cNgYoqTISbxUaV4OknqL
         zJo15ZbADhlHkLt6xKaA8ZT5SHDv9i4XT7yM8smKD4dwl2RuoXg6V3Ld41gvKS2/LTZY
         7Xj3wj4kre8+fgpH/0K2vijMe9b36sEy3cDqOq0eRJKeR89BddaNa4P588ljjsY4E6BN
         tv/Q6WM9e/gXJ8vpofpO/m7LwWDisVDJ8Zned+YDhyhvNr4GZ5Fp6pRQfeII6zHRFQjw
         d+uWtk+mhxF9LcvrS5Mp9IJdd7OOVg3sePMChZmb0s0LjX/oQkWxwAOHkNzKAqSZNzaA
         qJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=XhRK2ZXOyJWMA6NIi1ryHY+g8T2UXzQKCdTymOVPn8s=;
        b=LanqnmrdJzrGWNObO0TfjJhsA9UpgUB+DRYiNf2AN/WslH0lpAO7PO3ILKWFha54IY
         mZGVLzF3vRhiNr6m18EWiVsJAfBR8GOwgxmkbUrp7TyJ0DcimrrgWHpJHFLMCNpp7AeE
         DJE3ufV1tde5bv7kTOvxJlQS02506urP0voKFzOPlYiAW2WoSw659rpRCX6I8c8yNFqF
         H7BSnW8mMhKGhu24XL7P4vMSLCnMExoUj9XPrsxHIGjs3J1k3EeNSLzL7MQS0Nptc0uh
         CbHviHjwA00ZaIIF7FmD/5YOy3TH2XSIceFhSunhiqWg1n4XpbidsUtPcZBdm9gzScKN
         ufgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L403sB4u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si937539ybk.677.2018.02.19.07.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Feb 2018 07:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L403sB4u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ennCe-0002Hb-S9
	for alex.bennee@linaro.org; Mon, 19 Feb 2018 10:18:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ennAz-0001Qt-Ub
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:16:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ennAt-0003Gf-J6
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:16:21 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:42941)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1ennAt-0003FH-E6; Mon, 19 Feb 2018 10:16:15 -0500
Received: by mail-ot0-x244.google.com with SMTP id a7so8731968otk.9;
	Mon, 19 Feb 2018 07:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=XhRK2ZXOyJWMA6NIi1ryHY+g8T2UXzQKCdTymOVPn8s=;
	b=L403sB4upfA5FlU/bZIWXZmZF3vXhsh6vZ3xTG61hmyDdh5JcgXO2J+gZFCDgoNAMq
	vc+AN3IwKz8QJ2iRFC1hUgeQ3kG14q6FjBPx9q0opc94AtIWyCbwuhD5dSUm58RD8Ldq
	bVYasRbMHceGTEHK8Moc0g6NJrXZCHJk9UdBaBXnB1BSVfq4H/UgYbN9f5r7dN0x90TZ
	gaKihgqYYIkfvI9Qh6Yz6c7AmE6IXDmD5gE4d+gvaA7z8b1rBCIkEiEh4Lu6SLGwyYpj
	8EY+pjONpMR2o2F3j8KoP/an1l8DUsYImVxyXSWDeqzDQm40OMOj33QttQnlDlXfABf+
	kfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:reply-to:subject:to:cc:references:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=XhRK2ZXOyJWMA6NIi1ryHY+g8T2UXzQKCdTymOVPn8s=;
	b=KXVbj0w9ElL0QiQdjY3CBTSNJ0RkjnkZsBA+J6MNJFNwX9xnb7w7n6UUH/VJL+gbHL
	hl0Wb49uyllskCLuKl/74cvvtnB7bVAyTEs1Bqe8wWBLRC5qUc3f4uGr7LnYspQHyVy3
	J/fLEWuxeMWJT/yrG94h7uSMowUT1FfQNRIRZZncibDL3xT2ySE0nTuHkfdKGsVq7Pyk
	z2MSBO1NpnTGTo9Fsg1Wtiy/Ut0/QKPVlS1srz1YKAP95tli16XyOPDi2DMN0S+LwNjI
	+eRR+6C9WJsTJHwrBgq2FpUaBBaw0XyVjGABG4ewOqkYAnQAC+rSeng8tzmMBJVDsJXv
	qe7Q==
X-Gm-Message-State: APf1xPBXwPWsGhMfUDRqB9JImfyT/KLA5RhQHYUrXt3rtJR4xY3hddhH
	sT/UJwqOhJWskG71u1aAq1AtQFU=
X-Received: by 10.157.3.196 with SMTP id f62mr306834otf.360.1519053373754;
	Mon, 19 Feb 2018 07:16:13 -0800 (PST)
Received: from [192.168.27.3] ([47.184.168.85])
	by smtp.gmail.com with ESMTPSA id
	r2sm11698488oif.13.2018.02.19.07.16.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Feb 2018 07:16:12 -0800 (PST)
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
	<20180217140051.22731-3-linus.walleij@linaro.org>
	<3f009bb2-fb39-36ff-b3ed-a9b8c63db081@amsat.org>
	<CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
From: Corey Minyard <tcminyard@gmail.com>
Message-ID: <f4bcb303-ee95-9cc5-cc0a-b3e26592386e@gmail.com>
Date: Mon, 19 Feb 2018 09:16:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [PATCH 3/3] arm/vexpress: Add proper display
 connector emulation
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
Reply-To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BEbussB5lnc/

On 02/19/2018 08:10 AM, Linus Walleij wrote:
> On Sat, Feb 17, 2018 at 7:28 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 02/17/2018 11:00 AM, Linus Walleij wrote:
>>> The assignment of the SiI9022 at address 0x39 and the EDID
>>> DDC I2C at address 0x50 is not strictly correct: the DDC I2C
>>> is there all the time but in the actual component it only
>>> appears once activated inside the SiI9022, so ideally it should
>>> be added and removed to the bus by the SiI9022. However for this
>>> purpose it works fine to just have it around.
>> This seems easier to just do it now rather than postpone :)
>>
>> In your patch #2:
>>
>> static void sii9022_realize(DeviceState *dev, Error **errp)
>> {
>>      I2CBus *bus;
>>
>>      bus = I2C_BUS(qdev_get_parent_bus(dev));
>>      i2c_create_slave(bus, TYPE_I2CDDC, 0x50);
>> }
> I tried an approach like this but the I2C_BUS() macro was not
> publicly visible in any header file and trying to pry it out just
> brought along a lot of refactoring in the i2c core.c file that
> scared me away...
>
> Has someone else fixed it already?

I have a patch that does this.  Well, it's a small cleanup patch and another
patch, but it's really no that bad.  I'll send it.

-corey

>
> Yours,
> Linus Walleij
>

