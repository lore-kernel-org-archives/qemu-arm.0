Received: by 10.25.21.96 with SMTP id l93csp412862lfi;
        Fri, 1 Jul 2016 10:49:34 -0700 (PDT)
X-Received: by 10.55.22.154 with SMTP id 26mr29165312qkw.193.1467395374460;
        Fri, 01 Jul 2016 10:49:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y7si2975489qtd.128.2016.07.01.10.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 10:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ2ZJ-0005eZ-T0
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 13:49:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bJ2ZD-0005c7-9L
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 13:49:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bJ2Z9-0001JR-1Y
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 13:49:26 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bJ2Z8-0001J7-PV; Fri, 01 Jul 2016 13:49:22 -0400
Received: by mail-lf0-x244.google.com with SMTP id l188so12005523lfe.0;
	Fri, 01 Jul 2016 10:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=WmEu5+s78T9NJ6psXpYiqer7dOzQQLl37gRiYxWoxQQ=;
	b=u5cf85vRhSyRf7PIG0ThuhnE8vzG/p6+Bxsycj5IaUn7vkVAHouycLXBsVp1zkDhZ2
	LRpgnbbE+ncqjuIp5vkrc44RkG50DGF67D75LY48vZmFwJywiQIzJjMMmJgsRJKd1UuN
	DSqvYfwlT6q7zyV0EqaTSXWRRWm+7DZe7LjyriihQRjnnHLDqrU2cOggMAhbNcJ8Ud2f
	XK6P/9nJ/FmYafWPVPoZBIGMwRZbwmOBtyKHNgwM8cURDE5O4M3sgFK1lEVec9rglMTs
	nedgNQSF5RGfa+OE3QMtA0L8AxlmYdE/AVbEYm3Ew8Y43lLrVP9QC1QR9qrjE/QmzC19
	ydGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WmEu5+s78T9NJ6psXpYiqer7dOzQQLl37gRiYxWoxQQ=;
	b=H/SYL0MJmCLdKiOBy6IBAKhL06Pauti6lKcXp/gfCm+ebicoiHYrC8zoR/BGVSFmUE
	MqBg/v6LLoPjkiSa8Nb/SG4oaLY/acy0ERTkixWNFQHTLThJKry1V0VaFt/W5KpsNGrX
	EOaGpSsHWbLEMwKsa7UwLybDTzsN83KHlUgwrDqcwmtvKKvXduK+nTSn668cdQekidKZ
	O8UmJpRO/VWLlrgb4kwIF8dNFpY2W/yllzifXRkETVpMmSmOj8+Wa0FVLkybZU3oBnEQ
	XSyiDfKum1F8uQv5py7YJbUAs+I78x2Jb1XymGEyl2OI4/hzC8SUPBs0tJlI6HwtqhLa
	W25w==
X-Gm-Message-State: ALyK8tLdXYpErU+Il9nehZnbgzqtytq1NrLPGLpyjrlJqn04BUOAHSRKtXHtTZ1+g3EKRQ==
X-Received: by 10.46.33.80 with SMTP id h77mr6064319ljh.29.1467395361727;
	Fri, 01 Jul 2016 10:49:21 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	g193sm325970lfb.14.2016.07.01.10.49.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jul 2016 10:49:20 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20160625123521.16752-1-digetx@gmail.com>
	<CAFEAcA8HFfuEHP-d8+H3DC06+RpjjXqQoCX81w2Yr+Txsn5fSw@mail.gmail.com>
	<5814242b-8a8c-852a-51e8-268033b51200@gmail.com>
	<CAFEAcA8788W2infUBneuUh4eNMLqPpdNzGXqKESgi+ZKpigdyg@mail.gmail.com>
	<121dd825-9c64-b3b9-bca8-41bcb984ec0f@gmail.com>
	<CAFEAcA-ZGbR2nz80n=QcxRTr=PN5EMQ-OrbncaAQnHMwmhPtZg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <340f08ea-ee9b-1284-7e7f-17d33b314885@gmail.com>
Date: Fri, 1 Jul 2016 20:49:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-ZGbR2nz80n=QcxRTr=PN5EMQ-OrbncaAQnHMwmhPtZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH v2] hw/ptimer: Don't wrap around counter for
 expired timer that uses tick handler
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /8qPL+b9tuT2

On 01.07.2016 19:36, Peter Maydell wrote:
> On 30 June 2016 at 20:01, Dmitry Osipenko <digetx@gmail.com> wrote:
>> On 30.06.2016 18:02, Peter Maydell wrote:
>>> What I meant was: ptimer_get_count() is typically called to generate
>>> a value to return from a register. That's a separate thing, conceptually,
>>> from whether the device happens to also trigger an interrupt on timer
>>> expiry by passing a bh to ptimer_init(). So it's very odd for a detail
>>> of interrupt-on-timer-expiry (that there is a bottom half) to affect
>>> the value returned when you read the timer count register.
> 
>> In order to handle wraparound correctly, software needs to track the moment of
>> the wraparound - the interrupt. If software reads wrapped around counter value
>> before IRQ triggered (ptimer expired), then it would assume that no wraparound
>> happened and won't perform counter value correction, resulting in periodic
>> counter "jumping" backwards.
> 
> That just says you need particular behaviour between counter reads
> and IRQ triggers; it doesn't say that you need the behaviour to be
> different if the ptimer code doesn't know about the IRQ trigger.
> 

Okay, I already explained the reason for having two different behaviours - to
make polled counter value more distributed when possible. If I understand you
correctly, you don't like it because it is "odd" and I agree that it's a bit clumsy.

So, what we are going to do now? Would you just revert the offending commit or
you have some other suggestions?

I think we still need to change the returned counter value to "1" in case of the
expired timer, since it would result in the deterministic behaviour across of
all of the timers. However, it definitely feels like it should go into the
standalone patch and I can include it into the next iteration of the ptimer patches.

-- 
Dmitry
