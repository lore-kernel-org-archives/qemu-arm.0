Received: by 10.25.44.15 with SMTP id s15csp4325836lfs;
        Mon, 24 Jul 2017 14:22:01 -0700 (PDT)
X-Received: by 10.55.203.17 with SMTP id d17mr22865628qkj.147.1500931321003;
        Mon, 24 Jul 2017 14:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500931320; cv=none;
        d=google.com; s=arc-20160816;
        b=HVhH+qrJBJbd6JmEXEeQ4lL/mJ5tCpJGdQGkJkRcCLX3IXo+dN4oQdehUdzi8zHEqF
         zUJQelZZ+3Sacq2ssOY3NVu8sekqkJN97jZ9mTedFxHSNKU3aMlso4elp5o0zOSU5pgp
         yATWJ/jKqnrIab7OKKzxpDV74PzNdHgAygPA8TI/7NzIQwUsdE3d5Y68vYCI3i13Ylf/
         bKzUQw+astE36TDtAhP4D6Rpp5CU4R8vCnvFX1riAdsOaDg/Vx8S4YM1qGOWYjax3Vz6
         GHqThMJs9KH6UUpRXSE6hxyOiFX8wOI81i7rUdzQS4Yul2xvXlu92VsmONCsvUtmNq6x
         Qw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Mx/YKdFhr8CDn1mQ+F5kF2Lhvwd4p1lfQXjmWVYMXc0=;
        b=UrTnM1Q2f8hRZ3KeswVNuD//mBjrZSIeJgaXKD0qI/SQOmbJL/8zykB6dL5r8leo1y
         fSJcvsha1KiYYTZOyTib7HbJcpnCV6XEeJDe9mZbLGQ3X3UutZxzQtcTCm1UtGJwaYBm
         WRx20QzfGXZNef128MSt5HI2L0YzXk6I4HrbbzaW1SAE+7mS6puI9jyPcdX9Qz96JD3i
         tKUd4rIvGP8L2oHCNA5bq66b0mwEvoIU1aEAx9NeHoLZZECn15sNbHss2OviUVrMw/Pd
         6PfRYlr+URCLE13pbPZQbgp+cWgWQbZq124VCeuyGn2ODmwLrHR4pn1vXNFIdlAVkskW
         aDvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=MY/0MvCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e39si9624072qte.147.2017.07.24.14.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 14:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=MY/0MvCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZkne-00054h-2t
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 17:21:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZkls-0003vY-Q6
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:20:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZklp-0002K1-LD
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:20:08 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:32821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZklp-0002Jq-Gp; Mon, 24 Jul 2017 17:20:05 -0400
Received: by mail-qk0-x241.google.com with SMTP id d145so8528615qkc.0;
	Mon, 24 Jul 2017 14:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Mx/YKdFhr8CDn1mQ+F5kF2Lhvwd4p1lfQXjmWVYMXc0=;
	b=MY/0MvCmGNzmAF7Xa2uvJWJJNTJxCmHd3Fu3UxQ7oGqvsW4uNYZ9ZtYF2ZL3BUtWWw
	JVLWf0gdnO3leRb36gZ6j+mR7oDLDTNqFdA+tpWpQ4Z94AxKbroVaknNIXWbh3m2Puwr
	iJvQo6wJRk1GMp48BXDaEL4IYjBpScwvgDzYrzIN+L1XoaCiS6q52D3UwJCJHEF/p6Mb
	0InQX6niiJVznAT4wGn+lgSBjrobEfx6SHoKKlo9rKH4LYVKpIY+YJPJ4IvSQUs+nbhc
	+sliXreaKPQvdi9kF0EYH0dbVcgA7G4vvAfrUFp+XiR1za6RwQZGoUyLb1cgxzPQUDbY
	K+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Mx/YKdFhr8CDn1mQ+F5kF2Lhvwd4p1lfQXjmWVYMXc0=;
	b=X44m7PezURSV9xwJ2cw7uuATv+4tZZSKQ7d6vjfDXDeOgDUNLOzgm28rLEailWMSaZ
	Je3KR+MeM+5LJacEUcgWOOcOATrg5BndR4Wu32n1rFblu3uxh12jbiSPOWJPftOmU+oo
	260ozaQdcIiu5DZsXnca1t1JREo6MFxj9mEGHqdIydQ4Q6BCCYKs0xT647gMjTeuOymb
	iPGoP2sb1RB4/vABY+g/9AcVjnL/FGwVCx9UD93bCP75JDcxOgQMujU3S9LvWXwlpSwS
	BvnRcV98KikcP3io6i96+a8XTeC6bP5f37DsJt5twaZbMZVg+7h+jS9sDNyuDOT5o6jH
	8ONg==
X-Gm-Message-State: AIVw110/aqtRbbrxJMq/CWBw62tuEzXRw01zsXeN4z3h+7cPWcv8oyX6
	RYRTeVHKg9xIwkHfUP6Sig==
X-Received: by 10.55.168.140 with SMTP id r134mr11620103qke.204.1500931204709; 
	Mon, 24 Jul 2017 14:20:04 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id 73sm9276556qkx.30.2017.07.24.14.20.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 14:20:04 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-22-f4bug@amsat.org>
	<CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <08765e63-6712-f965-7ea3-ab356b083c60@amsat.org>
Date: Mon, 24 Jul 2017 18:20:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH for 2.10 21/35] arm/sysbus-fdt: fix null
 pointer dereference
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xx+wqhV36Vdm

On 07/24/2017 06:09 PM, Peter Maydell wrote:
> On 24 July 2017 at 19:27, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
...
>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>> index d68e3dcdbd..ad0cc49b19 100644
>> --- a/hw/arm/sysbus-fdt.c
>> +++ b/hw/arm/sysbus-fdt.c
>> @@ -315,15 +315,14 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>>       node_path = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
>>                                      &error_fatal);
>>       if (!node_path || !node_path[0]) {
>> -        error_setg(&error_fatal, "%s unable to retrieve node path for %s/%s",
>> +        error_report("%s unable to retrieve node path for %s/%s",
>>                      __func__, dt_name, vdev->compat);
>> -    }
>> -
>> -    if (node_path[1]) {
>> -        error_setg(&error_fatal, "%s more than one node matching %s/%s!",
>> +        exit(1);
>> +    } else if (node_path[1]) {
>> +        error_report("%s more than one node matching %s/%s!",
>>                      __func__, dt_name, vdev->compat);
>> +        exit(1);
>>       }
>> -
>>       g_free(dt_name);
> 
> This doesn't seem like an improvement. Now the
> error handling in the function is an inconsistent
> mix of error_report()+exit() and error_setg(&error_fatal).

I got this from "qapi/error.h":

156 * Please don't error_setg(&error_fatal, ...), use error_report() and 

157 * exit(), because that's more obvious. 

158 * Likewise, don't error_setg(&error_abort, ...), use assert(). 


Is this comment outdated?
