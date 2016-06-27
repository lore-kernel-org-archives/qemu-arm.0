Received: by 10.25.21.96 with SMTP id l93csp1250034lfi;
        Mon, 27 Jun 2016 11:26:14 -0700 (PDT)
X-Received: by 10.237.37.8 with SMTP id v8mr25592848qtc.28.1467051973937;
        Mon, 27 Jun 2016 11:26:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v2si18310688qkd.281.2016.06.27.11.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 11:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHbEb-000463-Cz
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 14:26:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bHbEY-00045m-Kl
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 14:26:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bHbEU-0007zn-71
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 14:26:09 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bHbET-0007zi-VO; Mon, 27 Jun 2016 14:26:06 -0400
Received: by mail-lf0-x242.google.com with SMTP id l184so29600825lfl.1;
	Mon, 27 Jun 2016 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=sptOJL2p1QyEMo3aw+Ysj0BRWl8mm+oYApVDyVFFRyY=;
	b=lJZq3fYKrwrFXWMCkNXCsMh0RtW3I1oSo6btHsihQQLW2KFTvANrkkAeZy0Q2Jtu5J
	/HFz2DgR+wXeyn41EHggicQye6cFib1jCUdkbaC4QS2a6ABIFWy1U4LL/1kUBLnSlPmD
	dGEIz3ir+S8TOyNC+AsDZpZR6ahOa43xSINn7SQMYAFa/Fsg3gMMIC+uaJJVwHo2N0sE
	9s0Tm1ZzKBKkjOn/PFL4hxvEHwQQtr1LMblMftQlfYIz3KbVHyVUQyHghH542y0Khnp/
	dvI1T6hobs7iu2gz9tKaTPC6ge8ipnSlT/0jdoRYI7xl4bCRYcqzS/czZNwGF23X4tt0
	8t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=sptOJL2p1QyEMo3aw+Ysj0BRWl8mm+oYApVDyVFFRyY=;
	b=NCvy2NYOLyQ1egITLP9lOVcMdkbJZU/ckhCAHQ9kccxT44XTFt4/lW4foZMZnS28BZ
	7JQOtAxYxKobZmc8mH98n0ujWUnWuHUv7ZrUGjkvZlFhXZj6I1mc4W/IMzIBF7gd3Uik
	piCzIsDxxv0MvqKTHnI8mXUf2V+LV6OdcwYZgpSrDPeOPgwLi66BxHcqJmI09d+Tpabd
	SV2IX5QNp4qDSlHp0x4Q9YzN82cYQNZN+hKRaFmCAHnIB5WevkjKeGujwicbqphh83IU
	gz+zwE0n3GyFDxTBRpUBj4iE9YSvm7tvQUtOCKtfQ1bdjZYID55mhlzQVZ58RiUNjbZR
	RAyA==
X-Gm-Message-State: ALyK8tLmGEiPbTooANt4PNQNcwiiCSPM3NBTVd2KMJxnh7LEcSGU/f2n+V2L0/f2Km/PTQ==
X-Received: by 10.46.9.80 with SMTP id 77mr5617275ljj.0.1467051964701;
	Mon, 27 Jun 2016 11:26:04 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	r132sm3279674lfr.17.2016.06.27.11.26.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jun 2016 11:26:04 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20160625123521.16752-1-digetx@gmail.com>
	<CAFEAcA8HFfuEHP-d8+H3DC06+RpjjXqQoCX81w2Yr+Txsn5fSw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5814242b-8a8c-852a-51e8-268033b51200@gmail.com>
Date: Mon, 27 Jun 2016 21:26:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8HFfuEHP-d8+H3DC06+RpjjXqQoCX81w2Yr+Txsn5fSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
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
X-TUID: 3MZxwqn+/BTP

On 27.06.2016 16:27, Peter Maydell wrote:
> I guess this fixes a regression, but it looks really weird.
> Why should the timer behaviour change if there happens to be
> a bottom half present? That should be an internal implementation
> detail. It's also a bit odd that use_icount is in the check:
> that shouldn't generally affect device emulation behaviour...

In case of a polled timer that doesn't have ptimer trigger bottom half callback
setup, we are free to wrap around counter since timer behaviour isn't changed
from ptimer user perspective, as it won't be able to change it's state in the
handler.

I just decided to keep that wraparound feature for a case of a polled free
running timer, this should result in a better distribution of the polled value.
The potential users of that feature are "imx_epit" and "digic" timer device
models. I should have mentioned it in the commit message to avoid confusion, sorry.

It is still an internal implementation detail, not sure what you are meaning.
Could you elaborate, please?

"use_icount" is redundant now and should be omitted, good point.

This patch is supposed to fix IRQ set -> timer expire/counter wraparound
ordering. I'm wondering whether we have same ordering issue with the scheduled
ptimer trigger callback. I can imagine the following scenario:

1) ptimer_tick() -> periodic counter reloaded or set to "0" in oneshot mode and
ptimer_trigger() schedules trigger callback

2) device uses ptimer_get_count() but the scheduled callback still pending
execution.

That should happen in the same QEMU "cycle" to cause a potential issue. Is this
possible? I'm not familiar with how AIO scheduler works.

The potential fix could be: to directly call trigger callback from ptimer_tick()
after changing the delta value.

-- 
Dmitry
