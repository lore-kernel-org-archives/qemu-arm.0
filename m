Received: by 10.25.21.96 with SMTP id l93csp495052lfi;
        Thu, 30 Jun 2016 12:02:05 -0700 (PDT)
X-Received: by 10.129.148.1 with SMTP id l1mr8044096ywg.31.1467313325517;
        Thu, 30 Jun 2016 12:02:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u64si511681ybb.147.2016.06.30.12.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jun 2016 12:02:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIhDv-0001ML-JC
	for alex.bennee@linaro.org; Thu, 30 Jun 2016 15:02:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bIhDm-00019j-Df
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 15:01:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bIhDi-0007fA-AD
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 15:01:53 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:32797)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bIhDi-0007ee-2U; Thu, 30 Jun 2016 15:01:50 -0400
Received: by mail-lf0-x242.google.com with SMTP id l188so9317453lfe.0;
	Thu, 30 Jun 2016 12:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ZYh1NoqWFJMBCOwk5VkkoQsI0pKISZAk0c42dj3HwHY=;
	b=jGcunz8QF4176nUxi1HWkmiimPU2SAzCswSEXnm7q42IVIcSBFpJ12XFZufsMuHE4g
	wSozbuVRTpFnATIuciQvrxChmkGuLKsCiYIRtGjxYekrombJlykjJObJVGQ1vN5DR5V2
	7QLUL2zBm5tSSgvcUuuErrh7eW1udEdGUcgsqVjqiSIbE31Y9AGZwr5/plE1jPgqnaou
	/n+LJtkv1px8lRSa2nMfw+RDA8rSDO3fFp2xnXt+828rWioSzY/jc+fJX0HtBoAr9j8c
	kG2vFHpl/OpI5jIv77SeCY37o6Cv6PlJQNQwwPjj7VDHuWyzJvgu2IlNlOGRpqiB8oab
	xIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ZYh1NoqWFJMBCOwk5VkkoQsI0pKISZAk0c42dj3HwHY=;
	b=eIcne3eDYYnd8Njfyl2MKWZamyjZhY2iVuoscXMD3MbSqFWnVX158uaOgEvx72YasC
	VNgkP33FfrAid0hphXWgCRZwP49QP2f2FEYAwEIwPIm2/Mpey0JoLtRFnzA7oqjLsOmO
	1IOTi3lBmgb56+72S2IbInJgIG/8EhkJfmbXT29xVor4j4fcp0ggdYBBOpwcDpwu0Byh
	Ko0TXuDfQ/uvD3SOZbtI/Rb6M3lKp1UbfTdLQJfvIzDxHWnmKfeUwwVjAXi0mOF0Wq9K
	auk2yUs1k8WYCKel6vCzM0o2F0mSMgA+x+/WY965tfnvd02c+8mREQvsHkAnX842Hu+9
	xD/A==
X-Gm-Message-State: ALyK8tJMF8R/Vsus3SqRKZTqG86vXh7TEGbXuYYg002SMEwUqYwuOtvNxSdBuZcjMKwAUg==
X-Received: by 10.46.5.13 with SMTP id 13mr4747024ljf.66.1467313307783;
	Thu, 30 Jun 2016 12:01:47 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	35sm258711ljb.20.2016.06.30.12.01.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jun 2016 12:01:47 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20160625123521.16752-1-digetx@gmail.com>
	<CAFEAcA8HFfuEHP-d8+H3DC06+RpjjXqQoCX81w2Yr+Txsn5fSw@mail.gmail.com>
	<5814242b-8a8c-852a-51e8-268033b51200@gmail.com>
	<CAFEAcA8788W2infUBneuUh4eNMLqPpdNzGXqKESgi+ZKpigdyg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <121dd825-9c64-b3b9-bca8-41bcb984ec0f@gmail.com>
Date: Thu, 30 Jun 2016 22:01:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8788W2infUBneuUh4eNMLqPpdNzGXqKESgi+ZKpigdyg@mail.gmail.com>
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
X-TUID: XEaeQvfUvUYk

On 30.06.2016 18:02, Peter Maydell wrote:
> On 27 June 2016 at 19:26, Dmitry Osipenko <digetx@gmail.com> wrote:
>> On 27.06.2016 16:27, Peter Maydell wrote:
>>> I guess this fixes a regression, but it looks really weird.
>>> Why should the timer behaviour change if there happens to be
>>> a bottom half present? That should be an internal implementation
>>> detail. It's also a bit odd that use_icount is in the check:
>>> that shouldn't generally affect device emulation behaviour...
>>
>> In case of a polled timer that doesn't have ptimer trigger bottom half callback
>> setup, we are free to wrap around counter since timer behaviour isn't changed
>> from ptimer user perspective, as it won't be able to change it's state in the
>> handler.
>>
>> I just decided to keep that wraparound feature for a case of a polled free
>> running timer, this should result in a better distribution of the polled value.
>> The potential users of that feature are "imx_epit" and "digic" timer device
>> models. I should have mentioned it in the commit message to avoid confusion, sorry.
>>
>> It is still an internal implementation detail, not sure what you are meaning.
>> Could you elaborate, please?
> 
> What I meant was: ptimer_get_count() is typically called to generate
> a value to return from a register. That's a separate thing, conceptually,
> from whether the device happens to also trigger an interrupt on timer
> expiry by passing a bh to ptimer_init(). So it's very odd for a detail
> of interrupt-on-timer-expiry (that there is a bottom half) to affect
> the value returned when you read the timer count register.
> 

In order to handle wraparound correctly, software needs to track the moment of
the wraparound - the interrupt. If software reads wrapped around counter value
before IRQ triggered (ptimer expired), then it would assume that no wraparound
happened and won't perform counter value correction, resulting in periodic
counter "jumping" backwards.

Anything wrong with it? Am I missing something?

-- 
Dmitry
