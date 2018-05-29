Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3641860wre;
        Tue, 29 May 2018 07:35:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIPvcIkJo11+j2rw8P3KjN4tIdYUYT7/p77pU1PS/wowsvUmz2knJq2vg2xlfZvT9pf3W8d
X-Received: by 2002:a0c:bd84:: with SMTP id n4-v6mr16122016qvg.148.1527604551192;
        Tue, 29 May 2018 07:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527604551; cv=none;
        d=google.com; s=arc-20160816;
        b=AFMcQDDQE5zheGtCSovgfbhiWveWPkqSIFNUa6K8hisyk90Zb8mxo6UshyLEWrUQgn
         dNHPv6Qgwlbvekq3kEFZR5939UbUyCKIcVIsJWoRFZd6KOjIHusjAJvs33TONhUK1iku
         aFPqncU8ECw2qN/eI99MBV+8qZa4HB2qdRBe21zkp63yqmpden8AK2dt6O81ROj+m9HA
         OSRkg95Se2Wx85nZpmzpFeBfEALRptHxUpJ/CTgssdqX03a2mYMbn7AauKUGyufLDklP
         vceKdlqUTguHRfIMbm7UctjwOVICEzDN7oA8/LLPxnCoJ9NkQjBdwxTm9nOE57kVQI0e
         UFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ccv371N54hgQo8PHat5HS999b/xDiPwIx6d8HxeVBBY=;
        b=dRiIdTouIHFsjvYcwwXVyWLjVgXaWSXVIBinkCbKo4DjLfNBmHp9J26kmpw1UVYpku
         Ot2rKxq45HSr3pg8++lErX9Yc3ZnG90PrhlQynmeoaSPIJWfsNtTF3ub0zAXsWR8ZVJV
         ZZNDW11p6lhbkXxcGMpH+XTc3UsalD2HpsLmgUfbDGr3+HHNgxNRwGiQBYSZkiqKvwVn
         BLLZrhJiupIY2TNEvbzhj/MHfQcCKOksUwPU5qhyiRWtyt9ySTdgj6XMGKeR1wQxu5tT
         ebBzWzBoOwgv/Y/P8od6QY7FRgumzgG5lPz+HZZj62QOgKikPOxaZqYQ9qJIxyqoKeAT
         oxMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tn34iuJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p27-v6si8428201qtl.92.2018.05.29.07.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 07:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tn34iuJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNfj4-0006HN-Lp
	for alex.bennee@linaro.org; Tue, 29 May 2018 10:35:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfge-0004Kf-MN
	for qemu-arm@nongnu.org; Tue, 29 May 2018 10:33:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfgd-00081Y-Nc
	for qemu-arm@nongnu.org; Tue, 29 May 2018 10:33:20 -0400
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:41809)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfgX-0007vU-Dh; Tue, 29 May 2018 10:33:13 -0400
Received: by mail-qt0-x234.google.com with SMTP id g13-v6so18865773qth.8;
	Tue, 29 May 2018 07:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ccv371N54hgQo8PHat5HS999b/xDiPwIx6d8HxeVBBY=;
	b=Tn34iuJMeZBQ3UlshxraOQhVOe+NFY1HnCgEc11yOx6LkFe4EnynuIi1ab83PDe1tC
	jTj3p6vnUy2iPSb/Yq2UoJqquw65LHzicL/oWH2161Jl50Xz9Wunqjidn3OcwF/PycHx
	7yBleTG02sjr5ozQaGEKII2ddL/cMVgCEKvT1MCSffqy2rwVDbQnbd1IZH0bP1bV5AKo
	7s+m6TDQfbt3Rv488y19S/1xqrE5PK/7J1JyCb4hbUsUbQLsZFVb5rj5pKC8vQOEn/Fy
	aeVWzPXAEwEg7HtFTnYVqGhzI1CCQ9RxcjrHWs+JTqRmH7rUdyAFo24rRqTd2BwrTEYW
	E+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ccv371N54hgQo8PHat5HS999b/xDiPwIx6d8HxeVBBY=;
	b=l7pmovWMwZr8NwJB8J44qwouXkS2RUZkI/EUVLWewSfG7nyeFzpi6+gfPoaHFaPI7p
	txT5uPy6akHv18PbuB5hp/wl5V39YafBJ2qraNFg4GGOcLXwINb0chrPpg41x301ZrbX
	buiSNco7s72twPSHbwiYdOuBOB8S2lYyCkSSuLLKgJAqzUN8oqifxcMtE5B7K7QlfZ08
	4g4ZDkNzWbaQK5xBeHwQQq2FeqxUqijcF3jv5u1HnyEotEckOe3/E5Uxs95LSHOVsZyv
	QLFSp1SC+1ZpiSpsYhdJ3fK1JGLHu6DbraibpZZ6Lbs1wrlpj/FceJssJhYkdvrMjHeE
	qt4g==
X-Gm-Message-State: ALKqPwcvg7bjZ6aeDzEymYt4zmCYvHOBYCfTUCAR+fREULvezLALDGL/
	7f5Tj02seeFnrixJ8Qbn8j/tjRPditk=
X-Received: by 2002:a0c:b40b:: with SMTP id
	u11-v6mr16005452qve.131.1527604392688; 
	Tue, 29 May 2018 07:33:12 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	y41-v6sm26517367qty.84.2018.05.29.07.33.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 07:33:12 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-22-f4bug@amsat.org>
	<CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
	<ae090923-3523-3e56-fbc1-65b270680939@amsat.org>
	<e0d37c83-537a-5288-b033-e5be3b8858ca@redhat.com>
	<c1078250-30a0-0d4c-d830-88591fb6ba43@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <713f16f9-3faa-7644-38c6-0797252d5922@amsat.org>
Date: Tue, 29 May 2018 11:33:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <c1078250-30a0-0d4c-d830-88591fb6ba43@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 2.10 21/35] arm/sysbus-fdt:
 fix null pointer dereference
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k4RMm0P9TcTZ

Hi Eric,

On 07/24/2017 06:57 PM, Eric Blake wrote:
> On 07/24/2017 04:52 PM, Eric Blake wrote:
>> On 07/24/2017 04:48 PM, Philippe Mathieu-Daudé wrote:
>>> On 07/24/2017 06:09 PM, Peter Maydell wrote:
>>>> On 24 July 2017 at 19:27, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>> Use error_report() + exit() instead of error_setg(&error_fatal).
>>>>>
>>>>> hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable
>>>>> 'node_path') results in a null pointer dereference
>>>>>      if (node_path[1]) {
>>>>>          ^~~~~~~~~~~~
>>>>
>>>> I don't understand what this warning is trying to say.
>>>> We can't get to this point with a NULL node_path,
>>>> because of the previous conditional, which is using
>>>> error_setg(&error_fatal).
>>>
>>> Ok I see, Clang is unaware than error_setg(&error_fatal) is a noreturn.
>>
>> Indeed, and that's because error_setg(&error_fatal) is not in preferred
>> form.
>>
>>>
>>> Patch dropped.
>>
>> That's a shame.  Rather, we should patch this file (and others) to avoid
>> all the inconsistent uses of error_setg(&error_*), to comply with the
>> error.h documentation.

I started to port/clean this up.
To avoid future inconsistencies, do you think we should/can enforce this
check in checkpatch (which is stricter than human review)?
Is the "Qemu error function tests" section a good place to put this check?

> 
> In other words, switching to the preferred spelling in the following files:
> device_tree.c
> hw/arm/sysbus-fdt.c
> hw/block/fdc.c
> hw/ppc/spapr_drc.c
> 
> is desirable, and has the added benefit of also silencing a Coverity
> false positive.  But it should be done in terms of switching to the
> preferred spelling, as it touches more instances than just the one that
> shuts up Coverity.
> 
