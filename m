Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4798579wrt;
        Sun, 25 Nov 2018 15:00:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UWznLO6uHpkT0tOoWD3MILMoT8/X+/katNW31Y4i5Qx4qW/Fws2KVWVG3R/+47Te2ROEhq
X-Received: by 2002:a25:6fc6:: with SMTP id k189-v6mr24655996ybc.438.1543186853199;
        Sun, 25 Nov 2018 15:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543186853; cv=none;
        d=google.com; s=arc-20160816;
        b=zrvk2SL3nrdMbq54b50dTA5lcId7UOdFyOOiCUgP5DUTb58Oi4ldAOQnGNaJwkvrmf
         4cM1JFVhajto9PUtjpqdOcvlbm7XEZEiURia7e8RQidHWTN9+Zc25/y6etc+7IM5LpKU
         F3AFqi7nmSltTwbvIL6XNUect9XlI4bwdO8z3YVdbF6d0NzuphRNGGaCwo2Wkfh5iQ0f
         8ihpPtg6OrM9Qu2Le8Lk2ZkeAOrYqlE9kmjX/Hnis1L9KeEOY+US0llJRKjDOAaKmbGN
         t0Eubj/RugytBLK1FDGzwx1z681uD0lpOZFHMU7wpjbOyDXJooxycUElmowc9meUr9pe
         ZH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=h49mXQD/6evJzFcdAia785pdtgQ2K6zvVG6xgxtTHmw=;
        b=iD/Z/Cf2w1xrasS8W3F4nx7DUwaFQz3YGFvGY/ucqMNrwxFBWVz5KLqUX/IRjZDLFj
         xfjvwOD5L1A3paf8HFVClatUL8BOTOg2LBu78mX5PAQ+OxeDYb1mIXks2l1WZzR8U4Wk
         vTZEfB5TsUdATm4ZFlqyKwKpTqXEu6gfoi1hDrhu9ymfFxObQw2485oYfEJ+gOwahLpD
         sfQVv6p2YxY9JwaCdPzqvwuuoEVs4eJQO0noT3PkotD2269yUBzuHuYfA8ntFRHo7+J5
         tdwfkCdbKjf5KcGEtxb0ZCO8AbQbq+WHXbmyXagaMRWh4F44ieEu5fpBOy6pRhGhzexu
         W19w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d4si10627664ywj.206.2018.11.25.15.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 15:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR3OU-0005GK-TU
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 18:00:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR3OI-0005Ff-Ph
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 18:00:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR3OE-0000Q0-QZ
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 18:00:38 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39444)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gR3OE-0000Ox-Kr
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 18:00:34 -0500
Received: by mail-wr1-f66.google.com with SMTP id t27so9060606wra.6
	for <qemu-arm@nongnu.org>; Sun, 25 Nov 2018 15:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=h49mXQD/6evJzFcdAia785pdtgQ2K6zvVG6xgxtTHmw=;
	b=NvtaxMh86duhSArOdlWk/lJuFVTehidOkf52yV5VNcApCJu51tiGZ2elKlgJEgcbTH
	3NdRUKur867JrNZ9ZWStRpsEpS0BHn7lYlm7u7f/y7SBuhssuAow61TH5hLIwZkg4ENC
	AjHQ0BblT0Hv+0D5rpNfyCnM2SfhTIabcIu+9kPtYksQ1ieTckpmqEMK7kT9atU6RwNY
	dGlM9vuFEXUj6gbzpkgR9l9owO2XQTG62z46dcvlOS1nerco9G1cr17H5WGlbhnzm6la
	1SoQDOD8U1sHO24U8SN6Q9a7pF1fhBQqAx+lYtmYXUFKXpA0kELqP/rpjw7E+tmoD6zP
	YYDw==
X-Gm-Message-State: AA+aEWY9F69VOkZ/FSyu5E3krcIT1f7B8x6QigFw0AIaIqBDsJ1ySkBF
	BJ8JM/9nA05MzFOVBW4rKZjcXBozx0M=
X-Received: by 2002:adf:c846:: with SMTP id e6mr2574085wrh.243.1543186833560; 
	Sun, 25 Nov 2018 15:00:33 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	125sm20166822wml.35.2018.11.25.15.00.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 15:00:32 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-7-philmd@redhat.com>
	<CAFEAcA_ujDFu_X0cm5gVppESYeZ4KfNwjJkVKrsCNRgBeeQ1OA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c29d16dc-5d6a-19d2-d024-8c5877e21f36@redhat.com>
Date: Mon, 26 Nov 2018 00:00:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ujDFu_X0cm5gVppESYeZ4KfNwjJkVKrsCNRgBeeQ1OA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [PATCH for-3.1 06/25] MAINTAINERS: Add a missing
 entry for the Xilinx S3A-DSP 1800 machine
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uHYKARLFAJ10

On 25/11/18 23:50, Peter Maydell wrote:
> On Sun, 25 Nov 2018 at 20:51, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4e396cbe71..aa17e9bbd3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -822,6 +822,7 @@ petalogix_s3adsp1800
>>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>  S: Maintained
>>  F: hw/microblaze/petalogix_s3adsp1800_mmu.c
>> +include/hw/char/xilinx_uartlite.h
> 
> Missing the leading "F: " ?

Argh... If there is no need to respin, maybe the maintainer taking those
patches is willing to fix this mistake... :)

Thanks btw!

> 
>>  petalogix_ml605
>>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> 
> thanks
> -- PMM
> 
