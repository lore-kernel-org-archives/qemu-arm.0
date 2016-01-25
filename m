Received: by 10.25.159.19 with SMTP id i19csp1435264lfe;
        Mon, 25 Jan 2016 11:45:54 -0800 (PST)
X-Received: by 10.140.254.9 with SMTP id z9mr24508059qhc.5.1453751153671;
        Mon, 25 Jan 2016 11:45:53 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n83si25962723qhn.6.2016.01.25.11.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jan 2016 11:45:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNn5F-0001Z8-8B
	for alex.bennee@linaro.org; Mon, 25 Jan 2016 14:45:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aNn3O-0006L1-N0
	for qemu-devel@nongnu.org; Mon, 25 Jan 2016 14:43:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aNn3N-0001Ct-TR
	for qemu-devel@nongnu.org; Mon, 25 Jan 2016 14:43:58 -0500
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:36585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aNn3I-0001Bq-I7; Mon, 25 Jan 2016 14:43:52 -0500
Received: by mail-lb0-x242.google.com with SMTP id ad5so6894360lbc.3;
	Mon, 25 Jan 2016 11:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=KHDIwoUFII7gsNAkwO1QDMNGRF/sbyoYU8Vq4+zNHB8=;
	b=sMYAq6Hu0QSLoXeJzaSG5rn7p69ow4S0DorcRl+7EP6MionQ77PeqdzWENQgFvxkxy
	hZcKmNRCxbC+D8AlHFVQA6rcrA5mQRomP1iupae7BLDmZe0vWGfRiVZvGzPZ7tolD9y8
	L0i0gYe9hIuY/vR86Qg0wsFRvDuuiNImLCDM7MGeMjIFhDYKOuGwDnPIHIBI54UA5YIL
	g4cMMO5MJ0Lk0kp/h1t/h1BwOMjkAO3o/msuzW5BcVLHgoPQGVknEcwvXpjVeMl/CzhN
	SM5Y8M564utNxQuUonINla0uDC3AaGmJ3xXoreXJ5hxT5ILsEeoy4mAdN0IoWkntugRs
	XlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=KHDIwoUFII7gsNAkwO1QDMNGRF/sbyoYU8Vq4+zNHB8=;
	b=nEXi/2lznxa9g8ZTm+HYO20/lv+/1EbiqV2d/E7Q9tYAugq35HrAYRVNvLjdUeWIGy
	424fvWsqhvWz/CrqT9M00dbYdPAknuYcuLbalsfvPakusl6JoWniIzAopbcGlrfibeo3
	B3prPAaomZIYomRxDGN/YHCvPf2fQJuHJ1X+DWbKUju3ykR23IJ2VEf9OfRR7oScfyXz
	/JjjlZMMHhzXliRJ9P/CBQUEcOwuOnZW39YagSyn61RslyA3OfiDJ8OnBwTqr3jPzxsF
	cZte03XENgZkfCVv8qZ9RrMlxy2DyTIaK0PAR4CczKUNda2GoAiti6TVpkjtL9mXJ5An
	wNbQ==
X-Gm-Message-State: AG10YOSeX2WSH9RkeIPNg84xYTPb+jXJkQseeH7ZwCZ99QFlcD24XiU0v/Z891dYKhiE8w==
X-Received: by 10.112.136.103 with SMTP id pz7mr7086612lbb.3.1453751031333;
	Mon, 25 Jan 2016 11:43:51 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	130sm2915827lff.31.2016.01.25.11.43.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jan 2016 11:43:50 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
	<9fb47bb0f1355221ef074766d5cc49f2de97e79b.1453402860.git.digetx@gmail.com>
	<CAPokK=q0EzXWeAFibVYKXmvwh5=vM6LsEqJB9k5dNGF6AiHeoA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56A67ACA.4090801@gmail.com>
Date: Mon, 25 Jan 2016 22:43:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=q0EzXWeAFibVYKXmvwh5=vM6LsEqJB9k5dNGF6AiHeoA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v11 2/7] hw/ptimer: Perform counter wrap
 around if timer already expired
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wol0DTBlhV8P

Hello Peter,

24.01.2016 08:29, Peter Crosthwaite пишет:

[snip]

>> +            if (expired && (counter != 0)) {
>> +                /* Wrap around periodic counter.  */
>> +                counter = s->limit - counter % s->limit;
>> +            }

Noticed another nit here. This should be:

counter = s->limit - (counter - 1) % s->limit;

So wraparound for counter = -1 is counter = limit (not limit - 1). Will fix it 
in V12.

I suppose your r-b is still valid, otherwise please let me know.

-- 
Dmitry
