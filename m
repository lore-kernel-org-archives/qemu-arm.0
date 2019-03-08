Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8782972wrx;
        Fri, 8 Mar 2019 12:18:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6JWfyGJpqNT3A7ASycB73c0KwetpchTtGOB1hUdntUySLsV37sG5Dj1znZwg+mPfNLgW1
X-Received: by 2002:a81:62d4:: with SMTP id w203mr16276863ywb.389.1552076304899;
        Fri, 08 Mar 2019 12:18:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552076304; cv=none;
        d=google.com; s=arc-20160816;
        b=GiqzprLb1c5kLSAmsRrJWweziaAPf6o+TgFqo90s/ZEiifw1utZswkxlCzrU73A1P3
         hauhht2rHtYYcEps+6YwsHECEwcffNh1/M107zUhrH1rqHHJQjI9Qx3FYCqjkJaXdiH0
         Y/H9NchnJZL8XBN0GiuYT21r/uIc8V655uSpPk3N3lW9MEgiAers/zcmdBZPQ/MlVIka
         mKTFmlflPIYNuSKAjRtVsLVjrhra8f2uIgzc4XAHVW7KKMFBNFIdNcw+I8/msua26sp/
         qIE9AfO25+RyTNj3HcWvyz3bDJ9I80uxLMyh5yR2e+UNQ5Gf5mEP6gMBsKc0Y9P2zRhI
         QfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=092uP6DCIn3kvDMGcE/V7nUr2Wqd0vfB/bOThvtgxro=;
        b=AsPk6+z7OSff36nEK3F0zR/cLBMVCx1Q0Ztd7bifpfKGFBkSfMdprWszLs6RPfS31c
         4ZXr4NMJ3CkI1giFi0rO1Xdx7FHrdi4ylR7pwW1nQT18EFYQwDgUc2CPlVKxIISdMRwt
         +Ri2349IT8ZXmfCz5sdzWqOAeO/ADbMA1sj02a6hcQiXENpZpdDmmM1bCkRpt2TWIK2L
         yRoCiirFBMsJciF9e+hW1+kabAhN79HKDrOWCJUOEhpZuvUhNxlKQ4Yn+PH9yFW193SO
         lG8Nrkpf59yMez+4lIUwCo0o6rh/oVl75KMMfCkypYJeyWT+cjcCrCQ5U+xVF37emeE0
         TINw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n83si5029278ybc.444.2019.03.08.12.18.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 12:18:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Lwm-0006po-6k
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 15:18:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2LwZ-0006oe-K2
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 15:18:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2LwY-0006ei-O2
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 15:18:11 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39028)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h2LwY-0006dt-Hl
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 15:18:10 -0500
Received: by mail-wr1-f66.google.com with SMTP id l12so6217330wrp.6
	for <qemu-arm@nongnu.org>; Fri, 08 Mar 2019 12:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=092uP6DCIn3kvDMGcE/V7nUr2Wqd0vfB/bOThvtgxro=;
	b=Z+WqT+eFUQyNLhUDkLTWTJvTz3IIfbCRbmCbOJmBAQhSCnkNXGbloivuLt/Ld7ejND
	KN4i2l652UcJYaPCkpo1AwXtR45L4xY2vJAh3mLySjAcioAMQ+JUwkMwAy2+wlmcwzRX
	JXXdwedSFbtPkEIoAffrR7XseDDjaSLdR2MGHKgH+WHDbpqj2AivN52Mo+6iwBKB1w2m
	ug1SlkP6EQI5ngHSlgK/wtz50GhhMMWpYrmbGNGiVYnqGBKt4e8mNZyWOi7zXkLR4Dnb
	w1HAydrp9+k5JdB45U66PiVuGrvRit6igVOphgcEFs4/Pees+deWxwbNjv+OtcJ0vaT9
	5kmg==
X-Gm-Message-State: APjAAAV1zYwylm/hICaXTtVevwV1kfC98U3kGjdZRHK5ZrRvAUN+4yYc
	ZEwdhnNDk7x3gXwIAAPaCrvBgg==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr12451207wro.16.1552076289394; 
	Fri, 08 Mar 2019 12:18:09 -0800 (PST)
Received: from [192.168.1.40] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43])
	by smtp.gmail.com with ESMTPSA id 11sm4755074wmg.27.2019.03.08.12.18.08
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 12:18:08 -0800 (PST)
To: Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-14-philmd@redhat.com>
	<0e007e09-cf54-312b-9563-59f3994209bf@redhat.com>
	<40319ac6-4545-4e7b-0339-8229727355e3@redhat.com>
	<a3c759a5-73df-f481-ba21-48ece92f1185@redhat.com>
	<9f1cdb48-3262-de5e-a500-1dfb3d6372e5@redhat.com>
	<f4d5a154-0c9d-0e1c-144c-c6855dadafd6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9f2f0884-3be1-7089-d10d-6549081a89a7@redhat.com>
Date: Fri, 8 Mar 2019 21:18:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <f4d5a154-0c9d-0e1c-144c-c6855dadafd6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [PATCH v2 13/18] hw/nvram/fw_cfg: Add QMP 'info
 fw_cfg' command
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pxoJ4K5mlJ9w

On 3/8/19 9:00 PM, Laszlo Ersek wrote:
> On 03/08/19 19:07, Philippe Mathieu-Daudé wrote:
>> On 3/8/19 6:31 PM, Eric Blake wrote:
>>> On 3/8/19 5:08 AM, Philippe Mathieu-Daudé wrote:
>>>>>> +##
>>>>>> +# @query-fw_cfg-items:
>>>>>
>>>>> That looks weird to mix - and _. Any reason we can't just go with
>>>>> query-firmware-config?
>>>>
>>>> Way better! I'll use query-firmware-config-items.
>>>
>>> Do we need the -items suffix? Also, is there a chance that we might ever
>>> want to extend the command to return more information that is global to
>>> firmware-config rather than per-item?
>>
>> Laszlo suggested it could be useful to ask for a specific item (with the
>> full data encoded?).
> 
> It's possible I referred to that a long time ago, but most recently, I
> think it has been raised by Dave.

One of your 'random' ideas :)

https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01959.html

  (6) If we want bells and whistles, two optional parameters could be
  considered: one for identifying one specific key to request info about
  (identify by selector? well-known macro name? file pathname?), and
  another param for placing a limit, different from 8, on the individual
  hexdump size.

  Important: these are not "requirements", just random ideas, food for
  thought. I'm fine if you reject any subset of them, after
  consideration.

> 
> Thanks
> Laszlo
