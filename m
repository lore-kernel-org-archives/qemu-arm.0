Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp847772wrq;
        Fri, 22 Jun 2018 06:41:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI/2S/M0rHLIVz2unLWM21xaHKqHE488F0g8XGKK93mKMtW42xykkDcW9GUULUPCTwpUyVw
X-Received: by 2002:a37:d493:: with SMTP id s19-v6mr1326548qks.338.1529674882042;
        Fri, 22 Jun 2018 06:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529674882; cv=none;
        d=google.com; s=arc-20160816;
        b=Wf/hBq1tk2YyT9cX3ZsyjPULXCrO9CrjnDA1HR2hngMIINE6IuKYDfxurYmlJs4f0L
         eHD+ibrAe2seAlbTIyxrvjsTAtpXnnbYDaQH2GnZqcdBOr5o7O4aECFScQ4/WtXZ6Tp7
         Xo+p+4pE8OswI8IzolaLn22scbK5R9sFyi60B4mxCBB1f+ONc2zOflC+8MoKonmnMe4T
         TYbPtzSmiK6sp75FFAdDfPmwGE1ZlsMhFA2o1Qg5/HNofTA8HxhawGhYXlvTI194glCO
         6RLvpCZZ67otifcccptf/8AtwudXwd7YG84M11I9YnUYL9weiGkStLAs1KaR9Z4nOJ8T
         LvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature:arc-authentication-results;
        bh=3xjI2DMflkb2RUooYkvhQM3tcgsObqCyuXCtGxDgCLE=;
        b=DoD7czbaRUsmMDf5CH53KEwRu3CF0nCNOFhGe9kWKsy19kj2SPlEow6MfI9iw7QQIc
         9fRbGtM4SP8NlF6HXC+s1xN8SFfdP8fzUXNQe0Y2fv6cxSmCojbC2uexs7nHhEB09/1I
         QbiabOlZpGK7i8f7nhteWJr2IFhMVbzZAEM2qXvXwuE//s/Q6LTZ70eKBzLk9ryRVLdq
         Wap96sIdpnDwo4P3uCjn87+S1olvIkOFZg8RjllUiLWq7YTgVSn+I6oqM9DTaAnqZxV7
         lsAUPttHmMIbXRZD01LDJHi+O1qmD/jzNIVh2HF/l+XQGDU9XDZfbPC0oa6OLT0fTd+V
         V9iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rMFskD43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i187-v6si758957qke.393.2018.06.22.06.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rMFskD43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMJV-00068a-8l
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:41:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM8j-0005TH-DL
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:30:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM8e-0007ap-Op
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:30:13 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44008)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM8e-0007ac-Ip; Fri, 22 Jun 2018 09:30:08 -0400
Received: by mail-qt0-x242.google.com with SMTP id y89-v6so5871094qtd.10;
	Fri, 22 Jun 2018 06:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3xjI2DMflkb2RUooYkvhQM3tcgsObqCyuXCtGxDgCLE=;
	b=rMFskD43vXntSHq1kxxlh1lbFkq1fcuPo+PCiuHMIQA4o9jnTAEm542zZYmYftsswV
	plcCL0HMZxKGCJPYeueWzH7hoDUHap8/W+fKLlmTtqu1Vw3kh1vUhWnKYL4a8OYdkw3n
	BHXO4+3f+gsRXaCKfHEnn2NO5+HMb76T97U/hzHhjwlK2Q3+OVCOLE4W4ouy8QEV/SZm
	R9KfNXHbz15335nRXOkyvLXsQ35iu7ENE8Gbqzg6LSB6oHCiYaQ469HkZPG3COqbHQbN
	Yp5/aiwRmPElxl3hOefE25S81NnONSJe6vn3gVewENzFmNqdJL9+kjSBr0p5JoeeP2Ky
	NcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3xjI2DMflkb2RUooYkvhQM3tcgsObqCyuXCtGxDgCLE=;
	b=n0Vt1khtHPf6K+zlM+s9n0mQY1wG+YEUpO62pQYTV4tG/F9i6gSUjGfSgQANl0qC4P
	d6mz0Uov5V7Bvq8KmDbL8cjrNZ6ba5cAhOlvhIz0kZnYl3HuNmYzvgA8PXYI8tKDjFkQ
	N49uYnqm4I8JQFlVD3Ew8UjGCLyvgKFICLlAlGbu6HGUAxMkr1EdzDF1p/0nMGH//8ls
	yhKc2JRBkHFA8+W/stJCNmxfYdWyt9pJCBym9sSp7rg+XxoUxTwngJBcRJO8+v+jaTPL
	GOHl8Sj+oVBuxgLVI0BviVS410bbK7TiAQS5qtUidtzicWlyd1YiFoWmbrBVJB4KMdU7
	dOew==
X-Gm-Message-State: APt69E3B2lAIW3IFt8zDSzN5JlEXAajY2DIgT7wg3WnOrvEI6SFHXGgd
	JnrXBb2zJgvy3PMPVUSoz4MpvDOf
X-Received: by 2002:ac8:6656:: with SMTP id
	j22-v6mr1342584qtp.158.1529674207767; 
	Fri, 22 Jun 2018 06:30:07 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	b3-v6sm4471770qtj.85.2018.06.22.06.30.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:30:06 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180606144706.29732-1-f4bug@amsat.org>
	<1160f838-5625-b9bf-6c34-3071ed185074@redhat.com>
	<0c5018d5-7e87-bba1-7522-c8020277bde0@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c7077a71-6f01-b3f2-cc0b-4d845b967ef3@amsat.org>
Date: Fri, 22 Jun 2018 10:30:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <0c5018d5-7e87-bba1-7522-c8020277bde0@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Adopt the Gumstix
 computers-on-module machines
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Wa7qgTxfXt7

Hi Peter,

On 06/06/2018 12:02 PM, Philippe Mathieu-Daudé wrote:
> On 06/06/2018 11:53 AM, Thomas Huth wrote:
>> On 06.06.2018 16:47, Philippe Mathieu-Daudé wrote:
>>> These COMs are hard to find, and the companie dropped the support
> 
> "company" :/
> 
>>> few years ago.
>>>
>>> Per the "Gumstix Product Changes, Known Issues, and EOL" pdf:
>>>
>>> - Phasing out: PXA270-based Verdex product line
>>>   September 2012
>>>
>>> - Phasing out: PXA255-based Basix & Connex
>>>   September 2009
>>>
>>> However there are still booting SD card image availables, very
>>> convenient to stress test the QEMU SD card implementation.
>>> Therefore I volunteer to keep an eye on this file, while it
>>> is useful for testing.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  MAINTAINERS | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 41cd3736a9..1825deb762 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -491,9 +491,10 @@ F: include/hw/arm/digic.h
>>>  F: hw/*/digic*
>>>  
>>>  Gumstix
>>> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>  L: qemu-devel@nongnu.org
>>>  L: qemu-arm@nongnu.org
>>> -S: Orphan
>>> +S: Odd Fixes
>>>  F: hw/arm/gumstix.c
>>
>> Great! So we can also remove the Gumstix entries from
>> https://wiki.qemu.org/Features/LegacyRemoval ?
> 
> I'll remove these now, eventually adding a new Gumstix COMs
> wiki entry when Avocados tests are merged, although reading
> the tests should be enough.

Do you agree with this patch? This is mostly to avoid removing these 2
boards in 2 releases from now. The datasheets are public so I can keep
an eye on them.
I already removed them from the "Future deprecated candidates" entry in
the Wiki.

Regards,

Phil.
