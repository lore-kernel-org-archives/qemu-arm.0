Received: by 10.28.71.27 with SMTP id u27csp2580512wma;
        Thu, 15 Feb 2018 05:29:15 -0800 (PST)
X-Google-Smtp-Source: AH8x226w0fhWwpucRStAuTF4+5aH+5wQ9HeIk/Y7ljRLtlUmyo1l53ZOSpEjBPoi3Snm64XcKI7e
X-Received: by 10.129.85.20 with SMTP id j20mr1898579ywb.285.1518701354986;
        Thu, 15 Feb 2018 05:29:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518701354; cv=none;
        d=google.com; s=arc-20160816;
        b=tHU29q2KGe+9unwjtuZco/raKoDYB9bGcUrxv30V4bmAdPkvLMGPvYfiaZXw2kgNBR
         O/9qGhf6WpjMRE+llSJoYw9urz3q5ivmkc0YIAG7TzlodHJiVMi37lXzZsj2deh02R4Q
         tfFt6GaZWlVBTA4FNPfHwErLrxSvNkrAyBoTCa8G+iXYphGB10NPVosGDH4Lt2Bon9ks
         kpWtcQfQn2IvIKTxozdWMGsnkkjhxh1S7MC0KrE5KOQ+k526OJkIHa0tBpCLCWRmNEaf
         rExbGWqZ612dTqH5gYrVswzMuqsyDXEc3pE4Z/RbhqLgZMzW1L0QbvgIwbWPvGPOX9bi
         QHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=b1EAEE4JjqEvHwFgraug9/PJOjsUifeu7syY3fVhSDc=;
        b=Oj0gUx5zigON8CRWYDULjyhhj4y2nXuFyvqdBU+9WXsYfVT2Z1vmtoNCyaPkKWywSQ
         fSmK30oh80tT5C1q3Z8xeG844ZCMmWh20i4N7vv4xpGIG1ap791fQMPL2LKny+cO/fK1
         zBu+m2xFckzMeBDFIcMfAabk1V28pkAqSYW6KBTheGr8BI4C3SRKStP4rPgXfePzHXsj
         H6uzUZxVifsFN6KK5smr6yUWVFfgIxSg9v1w5XaQc/w/MRdQ8xH+dVn05uaGapdszQxX
         f6cFMDUFjz+CeGriB6xTM92N7vtHtE+5SLhFjwn/Q2oHnHuZS4K3OC1D14zrRg37HBFX
         IB0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lks9d1w1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d184si1728154ybh.829.2018.02.15.05.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 05:29:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lks9d1w1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emJb8-0007qO-DL
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 08:29:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emJaw-0007kA-EY
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 08:29:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emJav-000174-Ju
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 08:29:02 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emJaq-00015p-A4; Thu, 15 Feb 2018 08:28:56 -0500
Received: by mail-qt0-x242.google.com with SMTP id g14so11851065qti.2;
	Thu, 15 Feb 2018 05:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=b1EAEE4JjqEvHwFgraug9/PJOjsUifeu7syY3fVhSDc=;
	b=Lks9d1w1WuqfY4jOmUBFQfL3nqIVBJ1GSyFGcSo8H0ZMRU6Cn44DBHca8nsgM/wPKz
	Tv+gyauEnIndVk1SA8++l2v5rniQGITSGYmjBAm1VOjnYO/geU5HhYUI4vuiftvUCWem
	vzDx0p53ml17lFAOn/1xqRMYjdOcI+HpB0/8e0VpSQFt/3oQw9e7ZTi8iJQgRCrtYDlp
	UcOASgFVOvxvI9/MFxXAMhTMKz/ipgPV2vb2fTcSYkNCnwmARTrjUk6uJLFijM40pXQh
	SBj6VnOkAdmj6Rpp7AvOomMcRm0LRph/mV0BxpDC9MvrqDPHypdXIxoDXYc+zxziaL8U
	vPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=b1EAEE4JjqEvHwFgraug9/PJOjsUifeu7syY3fVhSDc=;
	b=cr0tJz38eccoaAYrL2yy4ehkcIQWCTntInH+87XaPQEcW227EG6FJ4ddFcRxM2XRAi
	nt0LJ5gZM/Q666UbqYaRx8eB7GGdWPiBBYCgpsnq/TxLuI9WmQ9vjo2UHwajt9ng1572
	q6V6ycXh27BxDonYzONJ/QljEXWVg6cKasRWC3bJArAKm7rfjaMjdWdR5rJXVswpgCQn
	hc8eqJoTCeIBxV/0ynGXByEZ1eoS42vZnQXJrvpIKKE9InsD6o1paEcGXpMVqhmEHaUp
	Rph/qnSyxGAg7K03KnbdkbqE9uPrhgGm6FWk+Sevou75uh4BILanrrbVBmUvZhkPGr/z
	MPWg==
X-Gm-Message-State: APf1xPDeTb4vFg+DHAzgJUbuhlDMSnayXCACvM9yliRXyzZTdwamEbmI
	rSA1d3Qb06vM2I6SfOOlrzEtay5eUn8=
X-Received: by 10.200.0.89 with SMTP id i25mr4321578qtg.85.1518701335594;
	Thu, 15 Feb 2018 05:28:55 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	m30sm6900155qkh.91.2018.02.15.05.28.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Feb 2018 05:28:55 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180208055039.24666-1-penberg@iki.fi>
	<20180208055039.24666-4-penberg@iki.fi>
	<CAFEAcA_008TiXr0RYmPuhPcmSY9qx=Ju8CMAu_t-z+DBRruykA@mail.gmail.com>
	<9c52a265-6659-5c9c-27c7-eced8528fb63@amsat.org>
	<a3f95aa2-3a13-8a67-4fe2-b7da6eace585@amsat.org>
	<CAFEAcA8Zhih61YZNBEQQOFv_XKWknw7oN80pQbK+NgcB1mEsYQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ac100745-d5e6-13c9-a9c2-72864871469e@amsat.org>
Date: Thu, 15 Feb 2018 10:28:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Zhih61YZNBEQQOFv_XKWknw7oN80pQbK+NgcB1mEsYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH v1 3/3] raspi: Add "raspi3" machine type
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Pekka Enberg <penberg@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LOGPBgxcN/7g

On 02/15/2018 10:18 AM, Peter Maydell wrote:
> On 15 February 2018 at 13:14, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 02/15/2018 09:49 AM, Philippe Mathieu-Daudé wrote:
>>> On 02/15/2018 09:39 AM, Peter Maydell wrote:
>>>> On 8 February 2018 at 05:50, Pekka Enberg <penberg@iki.fi> wrote:
>>
>> Now I remember why I hesitated with this patch,
>>
>> This part {
>>
>>>>> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
>>>>> +    mc->max_cpus = BCM2836_NCPUS;
>>>>> +    mc->min_cpus = BCM2836_NCPUS;
>>>>> +    mc->default_cpus = BCM2836_NCPUS;
>>
>> } is the BCM2837 SoC, very similar to the BCM2836.
> 
> Yeah, we had a whole go-around about whether we should have a
> BCM2837 object or just make the BCM2836 object have a configurable
> CPU type. You could argue either way...

Since both SoCs are clocked at the same freq (and we don't model the L2
cache, the only diff) your suggestion (#ifdef TARGET_AARCH64) is the
easiest/cleaner way to go and I'm happy with it :)

A one-line comment would be worthful although.

Regards,

Phil.
