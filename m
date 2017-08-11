Received: by 10.25.221.202 with SMTP id w71csp1360583lfi;
        Fri, 11 Aug 2017 13:38:22 -0700 (PDT)
X-Received: by 10.200.4.145 with SMTP id s17mr24468264qtg.154.1502483902395;
        Fri, 11 Aug 2017 13:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502483902; cv=none;
        d=google.com; s=arc-20160816;
        b=XSbwy7s5yVQBNFQDTDQckL3fbVAWBn8cpQ+AIpmMwkC+d+8dPxHFrQjzOsB41HryYl
         1ovPeTkaQY7rlmR7KtRof7+gUZqNYcuFg664cBxf4SLnAiNBrIW/VMiSP2Vtajm6Ks1c
         5dv8Gtgvc5afcoiyklSkdiaVgyuT2/+lBZjOU06Nu/8ompu7wa4L3lp80c15VqbEw929
         4mwB6Kukx5X2PU0xFnzR3qQcEzea0QGec+H0DrMAspYKF57Wdv0sR02Nt8i0ijgtsgxd
         V/1CG9am7JOwfOxVf8AqY8ifCk76GUf6uqYXO3/Vwwk99/a7X7VoCkp4v38GtYSt9cX4
         kmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=UPSNMKtRU3jlDqHEXvesYT7boWGThUh/8TgNRsen8fQ=;
        b=Tok6kkEqRwRi7lSeSSh+9STrU5KmFw+CeYq5zTO1uWcMz8CLEe2/d/FdoDUt9x9JnV
         nnnghut58qTZ8qlT0NNfR+pZcxBur++6fgYxZZRMP+6ce26A6NGLic2u6DuB3Wu/mdim
         9oZ/CjJ3RZmlgxfFxS4m5kC7Q3OxzLUNEkWJacHfu4lIHI9WnVWU3JzAsfSpq4lLqrJ+
         2CHADXDoNWJHHxq3gXY/gExS3dyqzl5mcDi9OGUk+TdOu+gHUv09ujy/TvIphI/dFwYj
         uF/lYhErpFcKzkF2Og6f8p40rU0P3W0xh3Z5qgkHhAnp3COc0hbEpN2G9fIXTJatHd2R
         yuZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eS1vuiyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 49si1497713qtw.101.2017.08.11.13.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 13:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eS1vuiyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgGhH-00036d-MN
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 16:38:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgGhC-00035J-Eq
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:38:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgGh9-0004ts-7e
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:38:14 -0400
Received: from mail-pg0-x235.google.com ([2607:f8b0:400e:c05::235]:35267)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dgGh8-0004tX-Vv
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:38:11 -0400
Received: by mail-pg0-x235.google.com with SMTP id v189so19628921pgd.2
	for <qemu-arm@nongnu.org>; Fri, 11 Aug 2017 13:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UPSNMKtRU3jlDqHEXvesYT7boWGThUh/8TgNRsen8fQ=;
	b=eS1vuiybmNBw1/0LTrk+jP2FfHouu6bv6sztWfHvltmh1VyW2UgHZ5Qs+Dr1Uqq6LP
	gZFZ3s6oAUWVP/uVQn1AS7B/Wg8kiRzQBGjbEicHGhTRNPHpeoIl+h2QVdvSk7djQ1i8
	ilAUP80CL0P52ARzbs4XYDDpoiMNMbLmwvRuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UPSNMKtRU3jlDqHEXvesYT7boWGThUh/8TgNRsen8fQ=;
	b=BYhCErH8BGOf+02YEMKIGi8Bn4ZUfUPeEFFhNO+ZOqoT0Yag/+yqDOjvfHyKDLoSqb
	4osQYVsMF5AO4q5gI2Y0nAyB8ObN/bg4S+eO0x0WREwneyxmDf/ZrICVtXPZfkS/l3kH
	B2Z17v2kTtMGA4Q7JQjmFseXq2d9pNDSp9Bsudmxo8OYpeP0f0XnCIaJtw2y8zNsehzy
	IPoM8digpuDDQIg49pLmL5DhPlCp2uZRLIpwPq6Eua/6phMtpuW8XAog6nren8Wuvxwa
	p52azBMhGPPma3OHjTYZh1wDez7M2cbg6LoD7n8osPxO8iteQ2UGO12/V3JvrBpkaOcS
	HEeg==
X-Gm-Message-State: AHYfb5iW2SSrpFoes+V5Zhybz2OhIY5aqZfUSLOFT8lQRlmlIF13vczs
	8OUCQem2evdtdlAf
X-Received: by 10.84.217.143 with SMTP id p15mr19199877pli.45.1502483889989;
	Fri, 11 Aug 2017 13:38:09 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	d5sm3099907pfc.110.2017.08.11.13.38.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 13:38:09 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>
References: <cover.1502474835.git.alistair.francis@xilinx.com>
	<2fbcf76e4ff63d8527edd3662342948276e2cd37.1502474835.git.alistair.francis@xilinx.com>
	<de3609ba-241a-6df8-b5c3-30eb4535735e@linaro.org>
	<CAKmqyKPLJpv79Dv77t8m2q-pFOBg3u4hDmcz5Wk2t+tt+bT8UA@mail.gmail.com>
	<fb2b501e-21b0-f711-19f5-a3087b6007f3@linaro.org>
	<CAKmqyKOCAS1=WPFwBUXwTve1T_VZsQKJdT=15CPRoHSs-eEhDw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <abdfeb96-6c04-66cb-44fe-a964beb901c3@linaro.org>
Date: Fri, 11 Aug 2017 13:38:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOCAS1=WPFwBUXwTve1T_VZsQKJdT=15CPRoHSs-eEhDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::235
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v1 3/3] target/arm: Correct
 exclusive store return value
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F+yDc8BrUDkU

On 08/11/2017 01:29 PM, Alistair Francis wrote:
> On Fri, Aug 11, 2017 at 1:24 PM, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 08/11/2017 01:13 PM, Alistair Francis wrote:
>>>>> +            tcg_gen_ext_i64(val, val, memop);
>>>>
>>>> What is this addition intended to accomplish?  Because of the position within
>>>> the code, you know that memop contains MO_64, so that this is a no-op.
>>>
>>> This is when size == 2 so it's a 32bit operation so memop contains MO_32.
>>
>> It's a paired 32-bit operation, so we're operating on a 64-bit quantity.  So
>> extending from 32-bits would be actively wrong.
> 
> From what I can see though, the 32bit memop is carried into the
> tcg_gen_atomic_cmpxchg_i64() call so the value returned to tmp is
> masked by the 32bit operation.
> 
> Is passing down MO_32 into tcg_gen_atomic_cmpxchg_i64() wrong then as
> it ends up as a 64-bit operation?

If we're passing MO_32 down to cmpxchg_i64 for this case, you have indeed found
a bug.  I'll investigate this further on Monday.


r~
