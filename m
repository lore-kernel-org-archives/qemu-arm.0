Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1227588wrt;
        Wed, 26 Sep 2018 16:04:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62Bv4PXYE+A/D75N6Byl3UG1WjZEhxl95i9jDJHi2+LAm8bu1dKaGCBCXB5l7/aF35i63u8
X-Received: by 2002:a37:3ac9:: with SMTP id h192-v6mr6145866qka.324.1538003064142;
        Wed, 26 Sep 2018 16:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538003064; cv=none;
        d=google.com; s=arc-20160816;
        b=Uin5d8U+lMropyP6K9nDaGnyw/0pO52ld5E+i95PCnl1Y9U1jyFKCJNelwnoTYp6Bl
         kw0zUhdN61aKL5rYm8Qt6MHPqkyfgPuyeOYSouQNid8SQzPyUOEwE+r+tJyNx8IOoDDO
         2NFFEOMfDk6rziBuqXCymZIBS5E+yFYUTzcbrUewjTJX3dxxsZ12unT8J1hf/+QMcqzF
         gpY1TgwzNVsmI2KdfBpsW+K9j50/iesvr68mPn8147BmQyhpL3owEIJ/6q0+z2xGvwKM
         2f/lFX5nr08ojNLHJ+4Om5N//DtbCqFCFM8y/JBPZq3DYsrWKEHaADUnWjJVs12RY1pV
         2BKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=hH2G/lpLqQbiO1h4Arw/yJWTiIs40gyf20va7eA/nNY=;
        b=VfVZgjUqu02n9qANUq1+OKaaMQ0OpW/cCH5USvQp29a1M3e+w8iWGbSJjmLLH2gmRd
         fxUagK8u9SGMo5cRbGjUcuundrQTMMxRJht8ZK0Xdpo4E3qADKLyOAse9fhfUtWx05Fi
         6huEc+xW7xUFwA13d6ZEsXwSVDEZk0r+mQ8n/730Q/cubUosRegaSLrA33oDXxUJwnrS
         z1TAxljThv0669Bmf/r+Mi6IG2ce7TIY2bM4gAxDyW7GcyUpBXqtttlgJN53vF/WjHDH
         ltDxzBUCkc6woMYaJaEywXqoJ2RcYH2WZM+ont62ZRZl1QKRSmaNfnL/JuRR29Zi+yhB
         xCrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qgN4y117;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l11-v6si249979qkh.314.2018.09.26.16.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Sep 2018 16:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qgN4y117;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5Ir1-0004A5-KB
	for alex.bennee@linaro.org; Wed, 26 Sep 2018 19:04:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g5Iql-00049S-RV
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 19:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g5IoE-0003c6-Vg
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 19:01:31 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g5IoA-0003a8-If; Wed, 26 Sep 2018 19:01:26 -0400
Received: by mail-wm1-x343.google.com with SMTP id y25-v6so3917939wmi.1;
	Wed, 26 Sep 2018 16:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hH2G/lpLqQbiO1h4Arw/yJWTiIs40gyf20va7eA/nNY=;
	b=qgN4y117jK0PkQMbIK0/NY5jG1BRtU54yba1ZurIyW3LtZACXQVP3Qi4kFRaPD6Jf4
	+tt2pu2mc3nuxMigMr7TTnaYcd04EAMXI5h/4tXMrR2dUbAAym0T0SgKei8YLtqv/Vdf
	FVKMbh+Ys0Iuo4CTv1Krt0374P6xd9eOqFAGJBDVg2h2smippTY88q5jNwl9ADbvKOHa
	9TTXsiGgkF7hjiRL7JuWsme5YmRHueW1XbmfqjpdiN/SIF1t7Wp1vCoW4AJY53nW9QMO
	JWIpRgjS50dUY7og3Sk/0onwaDbwSsUzy+zidqmC6mAUEPXzcAx2iJZlE8b77x1MFn9s
	NNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=hH2G/lpLqQbiO1h4Arw/yJWTiIs40gyf20va7eA/nNY=;
	b=KGi5/X34v2YvBGRPD6NwW9xbxRUOyfMgMDAY/FS4txtUUlJgf3V6QlErozpU1TBL60
	mR9of6nI1AHqmQTnZTMjMNV9lXkfn29MmPe+VhbLnx7doXmxo11+Yi4lez64dnReqEaf
	OFYa9yhPoyL++CN+0K50eukRpPJhy8vczCJjAwVSroYwzi9YmcuVe+KCDKxMBpqWzadA
	Faejwmlqa0pjX5+bY2tHdd9mZmiiCCj7+gym8t4AAYtiCXEBlOSMq3FvAxaVxXjTpfsM
	1KKLdspp6LvmzMRg2Xx8Bkyxf/Sc2+N5W5zeTkRLV8aXZOIWR2+NIJo91xwkZaYW8zLw
	mzPw==
X-Gm-Message-State: ABuFfohm7XJ6OC4QoIwtsOBT3uezaZkoy5TL6PMA42ZjgGbF99V8SRn+
	9BDdLwclKp7NNPn24F+KuSo=
X-Received: by 2002:a1c:4e16:: with SMTP id
	g22-v6mr5789163wmh.111.1538002885256; 
	Wed, 26 Sep 2018 16:01:25 -0700 (PDT)
Received: from [192.168.2.36] (106.red-88-7-90.staticip.rima-tde.net.
	[88.7.90.106]) by smtp.gmail.com with ESMTPSA id
	62-v6sm586049wra.48.2018.09.26.16.01.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 16:01:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180925144127.31965-1-peter.maydell@linaro.org>
	<d890001e-6aef-673c-2727-b4278b85ca7f@amsat.org>
	<CAFEAcA8VH5B4NL3+sNuzr8RFUOn_Myjqa5+MgYNtkkqmARnOUQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <4411b71d-b1d1-04eb-9cbd-0b897be53670@amsat.org>
Date: Thu, 27 Sep 2018 01:01:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8VH5B4NL3+sNuzr8RFUOn_Myjqa5+MgYNtkkqmARnOUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Idwer Vollering <idwer@cuckoo.sh>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Ij2OlSL8Gg3

On 9/26/18 2:29 PM, Peter Maydell wrote:
> On 26 September 2018 at 11:35, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Peter,
>>
>> On 9/25/18 4:41 PM, Peter Maydell wrote:
>>> In commit c79c0a314c43b78 we enabled emulation of external aborts
>>> when the guest attempts to access a physical address with no
>>> mapped device. In commit 4672cbd7bed88dc6 we suppress this for
>>> most legacy boards to prevent breakage of previously working
>>> guests, but we didn't suppress it in the 'virt' board, with
>>> the rationale "we know that guests won't try to prod devices
>>> that we don't describe in the device tree or ACPI tables". This
>>> is mostly true, but we've had a report of a Linux guest image
>>> that this did break. The problem seems to be that the guest
>>> is (incorrectly) configured with a DEBUG_UART_PHYS value that
>>> tells it there is a uart at 0x10009000 (which is true for
>>> vexpress but not for virt), so in early bootup the kernel
>>> probes this bogus address.
>>>
>>> This is a misconfigured guest, so we don't need to worry
>>> about it too much, but we can arrange that guests that ran
>>> on QEMU v2.10 (before c79c0a314c43b78) will still run on
>>> the "virt-2.10" board model, by suppressing external aborts
>>> only for that version and earlier. This seems a reasonable
>>> compromise.
>>
>> I tried another approach to keep MEMTX_DECODE_ERROR delivered (out of
>> 0x10009000) for 2.10, using the UNIMP device, but the code looks uglier
>> (create too much generic code for a single issue):
> 
> I definitely don't want to do that...
> 
>> I prefer your compromise.
>>
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  hw/arm/virt.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 0b57f87abcb..3ba310a37b6 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1926,6 +1926,7 @@ static void virt_machine_2_10_options(MachineClass *mc)
>>>  {
>>>      virt_machine_2_11_options(mc);
>>>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_10);
>>
>> Can you add a short comment here?
>>
>>        /* See https://bugs.launchpad.net/qemu/+bug/???:
>>         * Some misconfigured Linux guest poke for vexpress uart
>>         * at 0x10009000 */
> 
> I view it as more "virt-2.10 is supposed to behave like
> the 2.10 release virt" rather than a specific fix for
> this guest, I think.

You right, fine. Very useful short explanation btw.
