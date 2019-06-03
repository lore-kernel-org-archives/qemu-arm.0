Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp975577wrg;
        Mon, 3 Jun 2019 11:21:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwSdJ5zR7kPwRCAUlQ1H7pke48HVd9ohbKUzLDKhFCW6qFHOYw9p1IP+YVYNPc/cMl0ioQF
X-Received: by 2002:a37:a244:: with SMTP id l65mr4442056qke.118.1559586107268;
        Mon, 03 Jun 2019 11:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559586107; cv=none;
        d=google.com; s=arc-20160816;
        b=TSkMMxYKMs27EY5BpJfvrrURjYxSk2eSCkjFsdK5QpAAvw+Ohw6OPfkc1Pqkce3qMT
         GDsPfeGRGUF0itBd7RuTwgWm4XCApnhkGS1+AWGcql7C0zQi8UYaZV6xKnRxUiW2gBbk
         lLEhU6evsKaFLqcG8cDdC2OGlV2MY84SWP0XHNR5ir6WS13kPFGKwn/FA4ZgbggmcQy5
         sBjVGjBJGtCBsDThx0mGx+pOdW2kdVrNNpGHgjLLzwP0n7Wnflaki/2JWX9bO8K8ecwZ
         IfSnr4UOpMe1Wsmjq+Y/TE/JdvkJbZUpC+PNJ8WZKIlFXvHwOX9N8WBVOZLcJ0f4U4f8
         I1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=OVQKzPP3Dh0R+sR938iDr/HtlZw38Ct8+TwxZDTndLQ=;
        b=WEs4yqwREaBgJRmISyepXDSdQFUMr/oe1mdNWOnS4SMWyNb+qPshdmFr5CGSHAwm7K
         ItPzgUEy+rj+hbKpDrJjgWcg80+s7Pu9B8w3s87FysduxSpQk+sOpuW2b+pFi1wnw5sl
         ihtf7wwq1SRoxdwicn/dIiozK6aIUMQhxtkjZ5Uyc2RTYby2iihnytuKPXNo7XcdGmIp
         F4eX1xjmxXnAxgP50hcK0vZocJScyL0qziTxr4xSV/oG8NhJWvgemcFS0mRyqcQ7fCp6
         y+D1k00nT5uaaHMW1VEesGB/Okhzg6ZW/gKTWiOKosBjGz0DOFVIL/Yv4rLCVOwe4CMh
         6BPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RmMMNNyp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t184si5093101qkh.17.2019.06.03.11.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jun 2019 11:21:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RmMMNNyp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hXrac-0004F7-Aw
	for alex.bennee@linaro.org; Mon, 03 Jun 2019 14:21:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hXrV5-00082g-93
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 14:16:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hXrV4-0005j7-E3
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 14:16:03 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hXrV4-0005h8-5Y
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 14:16:02 -0400
Received: by mail-oi1-x243.google.com with SMTP id 203so13527067oid.13
	for <qemu-arm@nongnu.org>; Mon, 03 Jun 2019 11:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OVQKzPP3Dh0R+sR938iDr/HtlZw38Ct8+TwxZDTndLQ=;
	b=RmMMNNypM+X9S7yxNaM8i67Mexv6U0ulQAQz1AN9kxlq5rM4R/oNdj3PCzHFkEfYWH
	Agbc/blmfeujiUYVwLf6JVmWevbF7oZep0a8Nqtua7Q2v/b+TdMwBn8JlczU/RtevWVn
	awcYaTnwm9C7HnzQT69tPZYJGffXe0MsLxELJK5Wu4qm9VjRufdtD53G1DZ7AJsxeRp4
	KTchlpViGUGZhVSLxGo4tdVFRTxKJmMHLUcH4w8hUQhGUIb3yqJSoORunHH8a5z+lq7J
	zg4sGAe28lHqW5UlvfECYNQ8IvZKs4qQaA1lLCRtZpwm+Hs3Icywk83wFXucRJRsHNMd
	YSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OVQKzPP3Dh0R+sR938iDr/HtlZw38Ct8+TwxZDTndLQ=;
	b=mEGh9BsZE9f6Tid/S/bOU0pZxE05YN+ypLSSN5iqZA3w3aR7DU+bfiu55sKJdQc+Bp
	IFMFqK18/SX+lKv7timSFt+gcY5q2x9Xwuz2YGxvlYBEX65aZDi3yqI+tLDoFT5Ecn8I
	+aDJ3+D+lTzwZC8G0D9vRSDKjYaKw2iabrnfBSfKViHcG8kqRANsXNynZUmcLCbwzp5Z
	VMG8k8CBdF1yKijopNaxXwJAZ7Hb5ZcujohIi5EmMdsOvA2vrm7k0N5HQD7z19BSxaWC
	u19czib4q8DbtT8y5COgWpWd9yCdWMJewtk+rITadg+sU5iVjK+JgaSLjjxxs9YcyHFH
	R2XA==
X-Gm-Message-State: APjAAAWD8R8SOL7pVV+fOYG2sPLWceWxItk5m/TWhKvNMnJBJS1sWgFU
	V/WDTwjWNIWwqQYISboJa6zCE0iFvn4GEw==
X-Received: by 2002:aca:fc8d:: with SMTP id a135mr1861429oii.145.1559585760708;
	Mon, 03 Jun 2019 11:16:00 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86]) by smtp.gmail.com with ESMTPSA id
	c125sm5535852oif.17.2019.06.03.11.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jun 2019 11:15:59 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190518191934.21887-1-richard.henderson@linaro.org>
	<20190518191934.21887-3-richard.henderson@linaro.org>
	<CAFEAcA88nA_2u1Yc-9ZPAy2w6LVk5f9Rrss0e53E11W4Xb4YpA@mail.gmail.com>
	<e177b43a-2abc-3aee-461c-2cfd9a8a0a20@linaro.org>
	<CAFEAcA_1XuWqVu9gonn5_Y9x1V=UcWNHEXtwop2s0qyUbwiZpg@mail.gmail.com>
	<13d9e22b-4ac5-fb87-622c-a99b5494d06c@linaro.org>
	<CAFEAcA--wutvPH5xSRm7yNCQ9+TpjJ84qbSLTUa7YFgKnLmi=Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <56471d19-7c58-3790-84d6-e7b60f8a3b8e@linaro.org>
Date: Mon, 3 Jun 2019 13:15:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--wutvPH5xSRm7yNCQ9+TpjJ84qbSLTUa7YFgKnLmi=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Use tcg_gen_gvec_bitsel
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hs534OWrK8wS

On 5/23/19 8:30 AM, Peter Maydell wrote:
> On Thu, 23 May 2019 at 14:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/23/19 9:08 AM, Peter Maydell wrote:
>>>> Because the three different instructions perform the same operation with
>>>> reshuffled register arguments.
>>>
>>> Ah, so they do. Next question, how do I find out what the
>>> order of arguments in the above code means so I can compare
>>> it against the pseudocode expression we're implementing?
>>
>> >From tcg/README:
>>
>> * bitsel_vec v0, v1, v2, v3
>>
>>   Bitwise select, v0 = (v2 & v1) | (v3 & ~v1), across the entire vector.
>>
>> The "selector" is second, the first input operand.
> 
> Oh, this series is based on another patchset.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

The prerequisite for this patch is now in master.


r~

