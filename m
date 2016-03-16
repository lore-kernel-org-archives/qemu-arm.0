Received: by 10.25.208.211 with SMTP id h202csp6697lfg;
        Wed, 16 Mar 2016 11:34:27 -0700 (PDT)
X-Received: by 10.140.19.147 with SMTP id 19mr7635597qgh.70.1458153266911;
        Wed, 16 Mar 2016 11:34:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f195si4291498qhf.83.2016.03.16.11.34.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 11:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agGH4-00029h-Ej
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 14:34:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1agGH1-000299-FL
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 14:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1agGGy-0007vF-9A
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 14:34:23 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33998)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1agGGy-0007v7-1B; Wed, 16 Mar 2016 14:34:20 -0400
Received: by mail-lf0-x243.google.com with SMTP id i75so1601319lfb.1;
	Wed, 16 Mar 2016 11:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=izJK/u4p0vENwQJ0lolMPGOOIGjQLqRBsiXIYd7II78=;
	b=Gvl6welgtr6WAgtFuertam9dBjzeL7tTFN8Gs0PhlQ0k6sMpjhUo8yI49Rr9gLYHto
	LOvwfN25UV6TX5Womnj4Yk+p1sIJTgMp/6Mw3hDQXmAWLZu2Wd5EIlpZ+NZJXUgJEM2H
	UChvAHvVvJAzQCCvjM0cio5d4Pgh56YEfeK4MBcSc2EMiI2kLfvsOqrvXvnna/3MpniR
	5OeaN7+wl4qR5WPJcupzlxmefDpoNmDwLB3EJB4EhTFDiWNGB+uGAKOWekbYQY6EkfBB
	0UO6754r5DHU3ScJsiv8/UMnkqnAJCl0J2V6DoTOCFAO1bishqaHZ9tDtZxAtjsuqIef
	0sGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=izJK/u4p0vENwQJ0lolMPGOOIGjQLqRBsiXIYd7II78=;
	b=Dt+mROD1GjxdBL0oXmScAPjOiezyBf9V1cDr7ID7y7DKxZzX4JvpO38+oFiJZd5pim
	mleDaaZPBRBYZu5aG6eSqRguRDCQnaFWO9ikPGHtW2U53ysvNjsNC2ZGAVoRbJbdV8k5
	JmhyVcTb86BAdTzTYOxSjuAy7+N/zy6awD0gYr73VMF9tn1KKXSV2LUakTtWXLpHconl
	usuI1qfOaeIk71av4hDw8G9CMqDQqKu4xYzwz8F7gRyv5rKdmxm1g2Jo3RQEVPpJWXkX
	+hCK8Z2nvd6ss+iSK0l4WT99AuNRfsM3aQR2YdHUa7a3A1o4zVMJOCyn049+IFYotznP
	FaWA==
X-Gm-Message-State: AD7BkJIPD9DXV/Hfb5hrbx7wVpt5G9MT3F+fio1nHQJ0v0Isv/BY86anB3UjOt7XAL8kpw==
X-Received: by 10.25.141.65 with SMTP id p62mr1685679lfd.10.1458153258963;
	Wed, 16 Mar 2016 11:34:18 -0700 (PDT)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	m64sm722870lfd.36.2016.03.16.11.34.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 11:34:18 -0700 (PDT)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
	<0eb543c0917bac416a18fc9daf97f5ba4e61ce1f.1454169735.git.digetx@gmail.com>
	<CAPokK=reD-sN1525osBbcxjFDzyJKvaoEf69C7wb6oHco4N=Lw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56E9A727.7080807@gmail.com>
Date: Wed, 16 Mar 2016 21:34:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=reD-sN1525osBbcxjFDzyJKvaoEf69C7wb6oHco4N=Lw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v12 8/9] hw/ptimer: Perform delayed tick
 instead of immediate if delta = 0
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
X-TUID: o2HtyLCgat5Q

09.03.2016 00:08, Peter Crosthwaite пишет:
> On Sat, Jan 30, 2016 at 8:43 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
>> It might be necessary by some emulated HW to perform the tick after one
>> period if delta = 0. Given that it is much less churny to implement immediate
>> tick by the ptimer user itself, let's make ptimer do the delayed tick.
>>
>
> Isn't this related to previous patch? It is kind of a rounding problem

Ah, you probably meant "Legalize running with delta = load = 0 and abort on 
period = 0" patch. Yes, they could be squashed.

I chose wrong policy at first time, further added MPtimer tests revealed it.

-- 
Dmitry
