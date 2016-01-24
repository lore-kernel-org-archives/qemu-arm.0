Received: by 10.25.159.19 with SMTP id i19csp814494lfe;
        Sun, 24 Jan 2016 07:03:38 -0800 (PST)
X-Received: by 10.140.144.21 with SMTP id 21mr3629655qhq.95.1453647818869;
        Sun, 24 Jan 2016 07:03:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d138si18912934qhd.108.2016.01.24.07.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jan 2016 07:03:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNMCY-0002w9-G0
	for alex.bennee@linaro.org; Sun, 24 Jan 2016 10:03:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aNMCV-0002w2-KK
	for qemu-arm@nongnu.org; Sun, 24 Jan 2016 10:03:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aNMCR-0007Cc-LG
	for qemu-arm@nongnu.org; Sun, 24 Jan 2016 10:03:35 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aNMCR-0007C6-D5; Sun, 24 Jan 2016 10:03:31 -0500
Received: by mail-lf0-x242.google.com with SMTP id c134so6707666lfb.2;
	Sun, 24 Jan 2016 07:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=zSNba9jXsb1zv33N5qNX7RFExsxCHZPdaMgdieQKBLE=;
	b=GJYYwFyTGIA20s41R5a5bnRg6GE7RBIGOj2miIwNqUnzx6llGSkeqhMc5buzVdHhOg
	DDtEs1+XHO10o8WryU6DzRvS2Fep78j9KpexfXzQ0in0T/EWX5z5DzIwd6zqRwK8nxUY
	zNHZqbIU+sa+IZmqtaaYXOcF64JcN8XBOK+EXN4C1oY3vuMQ/YP7LJMHLWPGxGXTMnN4
	JGYVnjvQGUGJ2u7eyO676KVh4wEumGkqK0E4PBiPPWe77Gzv50fUxAjf/0hj6PBldrY1
	NiVuCVgo2Jn1AcDjYhq4zYSrDGBhHxIaPey0ePBoKmKtVnqbuZRfkocv4YVsrecpiXc1
	8qKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=zSNba9jXsb1zv33N5qNX7RFExsxCHZPdaMgdieQKBLE=;
	b=BcX3h+PHU0PiM2TU4Msgiu3egZFmCp0SdnIiUlSOAAj3EZbWfVmGk/2tjOm499Gljf
	ttV85WUR4pB6/Xd9J/CEKv6ruvNRTDbendbNjR1ActE5i5rAqKC5Bx/HGQdDvGIegWIY
	i9DvkRqL8SlEeyYDy2zItU1wKNh8J/kAgWwvAx9Zs1Xe7hl8D9kHr5ST/8Rz7tG2s65I
	oLJ3RbgLgvFuLgiC9EcqXG9GEyjkJjDBvxD837tJ/5o4JPxiVIaWoNEJq9PFBuV+cD/p
	yh68BugAnaxXRcftigTMnzzdj2nDkzBq7i5W4cpLPBxE9d6MLN6SQwuhA3UFcaRDjEhM
	kUsA==
X-Gm-Message-State: AG10YORmYF9iVej1rKUpt8S+wlEovVd8P0OYWseaLTznKNf1oaJDgDY5b4mjhDgdvHjwMA==
X-Received: by 10.25.207.65 with SMTP id f62mr3753222lfg.73.1453647810527;
	Sun, 24 Jan 2016 07:03:30 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	s2sm2149262lfe.34.2016.01.24.07.03.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jan 2016 07:03:30 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
	<3ceca99fa19a5251a9ed121a4645c59fdad61150.1453402860.git.digetx@gmail.com>
	<CAPokK=pOV7_uaumcbbJ0OZoSrYPz=iggCAG91U7Pcad6tKTOCg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56A4E796.8050608@gmail.com>
Date: Sun, 24 Jan 2016 18:02:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=pOV7_uaumcbbJ0OZoSrYPz=iggCAG91U7Pcad6tKTOCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v11 6/7] hw/ptimer: Legalize running with
 delta = load = 0 and abort on period = 0
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AkaevSzd/NX4

24.01.2016 07:28, Peter Crosthwaite пишет:

[snip]

>>   /* Set counter frequency in Hz.  */
>>   void ptimer_set_freq(ptimer_state *s, uint32_t freq)
>>   {
>> +    g_assert(freq != 0);
>>       s->delta = ptimer_get_count(s);
>>       s->period = 1000000000ll / freq;
>>       s->period_frac = (1000000000ll << 32) / freq;

I noticed that this should be g_assert(freq != 0 && freq <= 1000000000), 
otherwise it possible to make period = 0 for the running timer when setting freq 
 > 1GHz, which doesn't make sense because we can't set period < 1ns.

Or maybe we should clamp period = max(1, period), freq = min(1000000000, freq) 
to "allow" higher timer freq's?

What do you think?

-- 
Dmitry
