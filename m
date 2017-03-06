Received: by 10.25.0.147 with SMTP id 141csp1373740lfa;
        Mon, 6 Mar 2017 05:34:47 -0800 (PST)
X-Received: by 10.55.113.134 with SMTP id m128mr9592545qkc.208.1488807287304;
        Mon, 06 Mar 2017 05:34:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v66si15462749qki.84.2017.03.06.05.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 05:34:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cksmi-00063G-MM
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 08:34:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cksme-000624-An
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 08:34:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cksmd-0001F1-A2
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 08:34:40 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36465)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cksmY-0001EW-0o; Mon, 06 Mar 2017 08:34:34 -0500
Received: by mail-qk0-x244.google.com with SMTP id n141so20302008qke.3;
	Mon, 06 Mar 2017 05:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=I5jOa8muaQr1hOtCyzfBIeVhrvTWOam/zWd43MsdsX4=;
	b=YqCheNKH+QRv7L8wnTI05eWSoBIbiq60wz08AAluJ3lQrAd4gsgFLc4ufUkT8Jqqjv
	O2YWaxaYYFT5lvG/FmDthisvXEggT7UZZVd15ltaLGzusQaS1jYcRqcG3t+AEfR8Uf3z
	Whmundi9V5FqfGp1+CGWi6JuELbH4DhaId5224wndkd4gSc0Ri5BdqKmkoc7dD+LJmq1
	n06gOo5SkOYVU/SMJ7BPjuxt0lYEFd0h+IlR1jXkcsPZBAYeU9K6IsWL0/vAqPFZKG/1
	LaIJegmwrM5vAUfDPbeCDlfNYVTxT/v2qiTVJD5pffj+poQ9Gp8NsMUntCm/27vLkrxH
	iOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=I5jOa8muaQr1hOtCyzfBIeVhrvTWOam/zWd43MsdsX4=;
	b=ul5H4IqSRIcGdOQJZtgRh4q+WbCx+omnPS1Vw9gNJMGgDOdMVuRoOvVKAgTBn8WTqj
	2GFuKVZEApUxa/8KTk5v54vqS6xVigkz1YKqbpHueYjMG3gQVcAd8vAnciJan0WER3+t
	bAuIMQoLSs5s2ATeDnFNXDfJgIVEDQYF7Q3w9sqMEmv2F/Zpk9ua/b4hZt+MZMr34871
	oeqm2bXUd547ZTwU1RMvKIQy8ev1lZWDz9BBtxbeN4BiWjgGO2lQB3L3+w/+T1jcjycA
	0lySjJBasDGfv6VwX60+UW05+BsJMZpyCnOZSuNxiu79s1EWOx8WsMgcnhJTd7RAGfJL
	HbSg==
X-Gm-Message-State: AMke39mJnPGQWt54EE9bpkqmVV1e3KYlQTKQrd53OrHK/WSW08xophX3b8wRr94rG5LaJA==
X-Received: by 10.55.80.135 with SMTP id e129mr14260791qkb.192.1488807273454; 
	Mon, 06 Mar 2017 05:34:33 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	g13sm13421337qtg.8.2017.03.06.05.34.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 05:34:32 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20170305214857.9510-1-krzk@kernel.org>
	<20170305214857.9510-3-krzk@kernel.org>
	<2130c1b2-0f81-13f6-a1f8-c0a2e294e3f0@amsat.org>
	<CAFEAcA8DOfstrMiEBLsgf6U6S9uT9ahA1ALrJdmQhcV+7K8Obw@mail.gmail.com>
	<4989d5b6-586a-de18-e8e6-6ab9e9ac131c@redhat.com>
	<CAFEAcA-6yQ=95hGdia6TDhq4C-swOJ1iZA8C+u99Dy9kfG+f0w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5e79860e-3823-1db8-8ba7-5c8bb44046d8@amsat.org>
Date: Mon, 6 Mar 2017 10:34:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-6yQ=95hGdia6TDhq4C-swOJ1iZA8C+u99Dy9kfG+f0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH 3/3] hw/misc/exynos4210_pmu: Reorder local
 variables for readability
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ueRAUtSBDC6q

On 03/06/2017 10:16 AM, Peter Maydell wrote:
> On 6 March 2017 at 13:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> On 06/03/2017 10:46, Peter Maydell wrote:
>>> On 6 March 2017 at 04:06, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>> your change seems OK but while you are here, 'unsigned' is considered
>>>> harmful since more than a decade.
>>>
>>> Considered harmful by who, and why?

sorry to cry wolf :)

>> It is true that unsigned has all the disadvantages of "int" (it may be
>> smaller than the size of the object" and all the disadvantages of
>> "size_t" (it doesn't optimize as well because the compiler cannot
>> exploit undefined behavior).
>>
>> I wouldn't call it harmful, but it feels like the worst of both worlds.
>
> size_t is a pretty silly choice for a variable that's looping
> through the number of registers in the device, which is a value
> that would fit in 16 bits, let alone 32. I would probably have
> written this with 'int', but use of 'unsigned' doesn't come
> very high up on my list of things to complain about.

silly would be "typeof(PMU_NUM_OF_REGISTERS) i;" :p

I got your point about the complain priority list.

> (since we use -fwrapv the compiler can't exploit undefined
> behaviour for signed loop indexes either.)

regards,

Phil.
