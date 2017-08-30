Received: by 10.223.188.70 with SMTP id a6csp996379wrh;
        Wed, 30 Aug 2017 07:47:26 -0700 (PDT)
X-Received: by 10.237.63.189 with SMTP id s58mr2643677qth.84.1504104445940;
        Wed, 30 Aug 2017 07:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504104445; cv=none;
        d=google.com; s=arc-20160816;
        b=upUyn57MmfsV5LS7N7d6rANkTKstyOh/9TOPtwQo0ksijNkCqATjmD5hz5Yl/1WbBY
         Q4wcglJz4qLgwOcGpvYSi83TBvGizjvHquzDQWDEDjuw6a0wfRmgKB4YfpA8yAyZ4Sbx
         QGjxap3O2Mg1rR3FIoExIR/nzT5HDNtC7uU2uqLSqmmZib94VTFqZ1jIzOKyS6LQKyov
         j0Ts8c+FuD5ysEq+7utXH1YHO5nonETTpu2Pk5hZ8cZm/AwZkVsFtUd45f58jJBhEqIC
         pkxZXXJmz1lSYT38DuGrV5GG5xb5VJ25uIb16gzGlUkTXzf3wCQkvtnQ4zq+4VaYM4AQ
         eOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=hA/ke2mx4cc+kJjjRICjPgxunFfp01dcoUEQZKg9UsI=;
        b=TZ7kY4JA/eiaZWqdRuNWR4gKIKtwakQPTcBaWODRJ7gtp3GqVHU1VOgBVL9z1o3PN7
         L4UDYnuHm3RXA0r/+qwxI0NwRIfVYl91JEFomjXgLKntYG/DCjqcuIf6s6Uj4x/I/Mmj
         zDrD/PxXJdj7YRtJlgUfptA9Oq6bjz3xPzyPwk3ObSeArBAhmf1gx+llTE9o1I/xtrTy
         GbKyT29faS6/BBy842tvsyFHCxdD1RNEnDej+Vqw51o/phDmAH/PJHGzoxvSfijL8WMf
         YYTRHBwrahLUf83C9rWdbZfoaef0roP3MdDUueaCMjeUsiLCJbO8IVpm1CtkseSzid7v
         tcMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rb+gg0a0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34si5273273qtn.542.2017.08.30.07.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 07:47:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rb+gg0a0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dn4H5-0007HH-Lr
	for alex.bennee@linaro.org; Wed, 30 Aug 2017 10:47:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dn4H1-0007Fo-2D
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 10:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dn4Gy-0008T6-EW
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 10:47:19 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dn4Gy-0008Sn-AC; Wed, 30 Aug 2017 10:47:16 -0400
Received: by mail-qt0-x242.google.com with SMTP id e2so5303442qta.3;
	Wed, 30 Aug 2017 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hA/ke2mx4cc+kJjjRICjPgxunFfp01dcoUEQZKg9UsI=;
	b=rb+gg0a0Ul8V+wqIwWWokmzRuvztzH7sL/kqNr1yu/sLG8seF5NqM8yn24C8ebeWct
	tJe1NUTTd9ZkPYvCla7+fIrN1N4kf4OUwo40iNmCnk54Dr8em1/Ekr5Sp6DXLsinDdEl
	I1giz7BHrYfAVJaEHJZw9OrEDEMC1yIG51Xjc54rnW/2MpnluEw9h8LYH/+dlVsi+FsS
	Ew/7r8EG/ehH65Z2l36y0Lo5ki/R7XGVXnm7t8+rZJtOHPgmfdNq4PLfSw7nUDWjPxkw
	U5HOc2Cy2G0asqdSGqZLTkTe5qj7rVdQKQXo2wyYvaYZiBaWaB3+32qY6dAxULmzgpnu
	zWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hA/ke2mx4cc+kJjjRICjPgxunFfp01dcoUEQZKg9UsI=;
	b=WonQlFn/Gv+sLi3NCLQKnjOaRqDC94jYzn1w6fZECAEMojgO6/yLeTauMWBfh2oHhC
	OKtxsgw5bv1+u/jOTJgvdyImB5LJAy20Ij4meyePM+XXYoeHP+Zr0Ee8uYcPeakaD6uM
	Pm8Uh+2utkjEJ9u9RegwTUkq3T6hvwn0xM+r0ajs62M5enKXLZXPZ+ELMRKJnoywTYGR
	E914ygRinSoSs+X3ATI0iuC4lY/ySMTjOqaeyNXnPTN9D5y/EGkzTeX5eakZEpxF5Skm
	CsP2gG3WK4Yyd7C5l4LAyvn1ATG/v7nFSQnE4NW6FpPqzbjiMJfRFJJ9dx8YcV/r5FMH
	2QfA==
X-Gm-Message-State: AHYfb5i4V1StAAsbsbsD1U24EUQkProtWFxsfmqdtOY+uIniN0RMYF15
	3K2hUYbb6Ly4Og==
X-Received: by 10.200.41.15 with SMTP id y15mr2285918qty.82.1504104435609;
	Wed, 30 Aug 2017 07:47:15 -0700 (PDT)
Received: from [192.168.43.33] ([170.51.34.109])
	by smtp.gmail.com with ESMTPSA id
	e30sm3693963qtg.54.2017.08.30.07.47.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 07:47:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-5-git-send-email-sundeep.lkml@gmail.com>
	<10da5552-c90a-21e6-43ac-829932f64930@amsat.org>
	<CAFEAcA9W=YqbeYKuAxvfNyjfCWGyAXuPdxwFrpLmoezLJ4pm-A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <40ca8d07-75e5-e0b3-021e-5abaffd16b78@amsat.org>
Date: Wed, 30 Aug 2017 11:47:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9W=YqbeYKuAxvfNyjfCWGyAXuPdxwFrpLmoezLJ4pm-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [Qemu devel v7 PATCH 4/5] msf2: Add Smartfusion2 SoC
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cXmLc882I9zt

On 08/30/2017 09:26 AM, Peter Maydell wrote:
> On 30 August 2017 at 03:45, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> I think they might be issues if you start QEMU without -serial and then use
>> a firmware polling for an uart, the device won't be mapped and the memory
>> accesses are mostly ignored.
>>
>> I'd rather use:
>>
>>      for (i = 0; i < MSF2_NUM_UARTS && i < MAX_SERIAL_PORTS; i++) {
>>          static const char *serial[] = {"serial0", "serial1"};
>>
>>          if (!serial_hds[i]) {
>>              serial_hds[i] = qemu_chr_new(serial[i], "null");
>>
>>          }
>>
>>> +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
>>> +                           qdev_get_gpio_in(armv7m, uart_irq[i]),
>>> +                           115200, serial_hds[i], DEVICE_NATIVE_ENDIAN);
>>> +        }
>>> +    }
> 
> It would be better to fix serial_mm_init() to handle having
> a NULL chardev pointer, because we already have a lot of
> SoC code that just passes it serial_hds[] regardless.

clever :)

> I'd leave this code as it is and we can fix serial_mm_init
> separately (somebody pointed out this issue for a xilinx
> board recently).

Sure.
