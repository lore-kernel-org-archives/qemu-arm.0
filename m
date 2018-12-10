Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3468263wrt;
        Mon, 10 Dec 2018 03:13:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WUebEu8WSAFVNrnssvQp+5utSBjkJUKxRqN85gH1X6beHlIQkTDFCF/tCkEur/jF2OBVsq
X-Received: by 2002:a0c:d29b:: with SMTP id q27mr11004767qvh.62.1544440389083;
        Mon, 10 Dec 2018 03:13:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544440389; cv=none;
        d=google.com; s=arc-20160816;
        b=A9H28REFSWOrgGQUjD3bb7Fgwd3vzxdcIOmglS09u8ROgm3jDcxsEjRpPdI5tMqyfi
         vNnOK7suPoDMmbDeLi2zoNEuAOZKZHvU4WHfgt//V50HICCtuHhFiaxrDGvTn/S5Rh3q
         B5sgaQ2Jh+KIRVQak/u4EHGZe+6pzdyE2u83c3wvKh7vMbjWYAiN1E8hHUUp2HhfAiW3
         OboFuWpW3cTMSvz6aySYxxdILA7FdVrITSXxxJmfRWYn/eKSqaaAxyBWxEuBuHgQeKHB
         JtJmhC01l5KEfxX7NxfUy+vPHfyPgA6C5OnTdfOAtJuE6y07VE8EKOLiYKyOKgGj8QdH
         f8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=rnNYlzn/FnxKVrOMoAiSXrxIKM+wo3/gqlUAYt0tDSY=;
        b=pRvaCWAh41iU5FGbGnH4YHKW2uuqjPBxr0FbF38vxFIM4+bWWTRHjJQBghjzkLjbvA
         CVJa8+eDFYln8nQxScngzNsb2HD06tAqU86fvXDYFTngP3Ko/GkH3N5GMaYDLt+KByha
         2AyAA0VVfW83oq0IGJNdAdm35ZLKLgkbk9xFxWDdTGeKWyBH2Ge5f6nNwrqV+NhufOhJ
         IixYTY8rXZRZz91Vhb5LCQkweEHeHUJi5w/wpQ7rLbKALzBT3MMhptCZ4s07XEfn/aHf
         /WRSxphjl1tJn+J1L0Aov6bbrwdNr16cZ+uWgQeoChO3LO9tpNs6JfT+4xAC5PiGnEYJ
         IniQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si1516160qki.9.2018.12.10.03.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 03:13:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWJUq-0000kN-Jb
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 06:13:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWJUc-0000iE-3m
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 06:12:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWJUY-0005Hl-U0
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 06:12:54 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:34325)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gWJUY-0005EX-GF
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 06:12:50 -0500
Received: by mail-wm1-f42.google.com with SMTP id y185so6360210wmd.1
	for <qemu-arm@nongnu.org>; Mon, 10 Dec 2018 03:12:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rnNYlzn/FnxKVrOMoAiSXrxIKM+wo3/gqlUAYt0tDSY=;
	b=qpjX5Bx6ewcJ5mKnYwhMSjKAriDN173xvPzUaxDxtPD7esZORi4R/ymdp3Yi3nLLwC
	pbh1jrb6OSW+wVAUksTr3omntzl+lEvPOpuZwyM0W84XPvgBCYouxl0FmnEI6x1Jh91E
	y/oZ/QCedGxRIWkqWFoZNXjcU67RsbyKrOeykjCvvPjgEJcWcCJDI67ZRxkJW09nTFO2
	46PEKLniaONq0gGEn+fEM1gI4ph+ZKy1lOe3xkIKXiymE0NIGEuR7NyWTpRm/ghkMjLm
	qDBVNpBRyDbM7Zu0JEINqun5LPU1w8XENnrkBQB5EcAhQaA0d8p/fzo2SSmCetv635jH
	qy/g==
X-Gm-Message-State: AA+aEWYoF9/7PQDzUSSvOf6mr2PAhCjm6vduvF10u60fXEy0HLpl80Mu
	ZsOzBJ1v9dyNc1/+1dNXF7kidQ==
X-Received: by 2002:a1c:5604:: with SMTP id k4mr9741365wmb.107.1544440368801; 
	Mon, 10 Dec 2018 03:12:48 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	n127sm14646712wmd.20.2018.12.10.03.12.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 03:12:48 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAHmME9qhe0ZemTkc2jkEO=_hu6PhvKUKGHC9QYTj2j+QHhNf8g@mail.gmail.com>
	<CAFEAcA8fYaKTZkLR8Ja3P590bSWy1cu61-gSxyf6+wXCfCLoxA@mail.gmail.com>
	<CAHmME9qQo4XfRgZUZDt3xbx=5KmRoYbO3N0+3m9gdKi9hvnZQA@mail.gmail.com>
	<96301756-f879-84d1-f5ef-d2615257d309@redhat.com>
	<CAFEAcA-J8gWONJye0JvuwG5warWKZD1MX-GW8=BPuCo9wF5ziQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f6cc8816-65ea-fe75-2f00-2c741566dda8@redhat.com>
Date: Mon, 10 Dec 2018 12:12:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-J8gWONJye0JvuwG5warWKZD1MX-GW8=BPuCo9wF5ziQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.42
Subject: Re: [Qemu-arm] [Qemu-devel]  more serial ports on arm?
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hpyGOiHIcBMA

On 12/10/18 12:09 PM, Peter Maydell wrote:
> On Mon, 10 Dec 2018 at 11:00, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Hi Jason,
>>
>> On 12/7/18 5:42 AM, Jason A. Donenfeld wrote:
>>> On Tue, Nov 20, 2018 at 11:08 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> It's still stuck, because unconditionally adding a second serial
>>>> port to the virt board breaks some commonly used existing guest
>>>> code (UEFI + Linux), and it's not clear to me what the best
>>>> command line UI is for allowing the user to request the second
>>>> serial port.
>>>
>>> Can the UI be the same more or less as for x86? Specify a second
>>> -serial, and then the machine gets one added? If it's in secure mode,
>>> then it's added as serial 3 instead of 2, to remain backwards
>>> compatible.
>>
>> You can use various -serial arguments.
>>
>> If a board supports 4 serials and you only want to see the 3rd (secure
>> mode as your example) you could use:
>>
>> ./qemu -serial null -serial null -serial stdio
> 
> That's the opposite of Jason's issue, which is that the 'virt'
> board only supports 1 serial port but he would like 2...

Oh sorry Jason, I misunderstood your question.

Regards,

Phil.
