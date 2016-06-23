Received: by 10.25.21.96 with SMTP id l93csp630820lfi;
        Thu, 23 Jun 2016 10:12:38 -0700 (PDT)
X-Received: by 10.55.163.143 with SMTP id m137mr21069134qke.66.1466701958775;
        Thu, 23 Jun 2016 10:12:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a45si1030605qta.99.2016.06.23.10.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 10:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG8BC-00068f-4h
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 13:12:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bG84a-0007qD-La
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:05:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bG84V-0001tr-Gq
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:05:47 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35983)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bG84V-0001tW-5h; Thu, 23 Jun 2016 13:05:43 -0400
Received: by mail-lf0-x241.google.com with SMTP id a2so18951626lfe.3;
	Thu, 23 Jun 2016 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=6JNXu9y4fbIUr3+2cWnmrkj/QNxZKwxOyx9fgO/XGyI=;
	b=Ah6KN9UACsK1PC2OgeRRXMeQqw99qdW/0wZtf2+SBaUVZeo8cmmPskK4ON3ySwP51+
	FE81NdCsOTsDyDyt7QcgRM7frB3XvnE9sHB6pliTKOpW0bsDaYIYEgzSSU/hQl+SM5v5
	s38X9bXUjnwIJuOhHWyvGqaEliY0jPRKP/gEGF0tZvsptHmQIC6r2sL5jdWDxNelGUYH
	MWbA8VukU+EHYFVa69evTIPTop3dtJzOPpojQTbY3qo75ucRkkmTxmEfxE3WWfkr0Ahi
	BOE+iTsyoDcBDrdfW/8I5zUZfCcoeeGk9EI9CGcy+J7MQdOzyt4Obx0ki11w4IGHU64m
	jwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=6JNXu9y4fbIUr3+2cWnmrkj/QNxZKwxOyx9fgO/XGyI=;
	b=Vlvs0vfcjMAesSrxPWdDtm4XWOkyDU4h0HAa9n786RzJGY40CWcbYlGZoicN/a5xmY
	nxbTfaUFusDH724L8e2b7HOhisNjiF2p1z6mSykeWCOCPt3IlNgWNQ0sQ293ZMCZ94Q+
	lEu/MNEH6lC9tdmf0mOi4NBVmTEfPA64s4o4LhR47vnurYptITWqbdjp7O7oHYL645jN
	ViUEh13hvrzPlBNeTsdc8z6Py2qsS++KEhtw4nTDISLx/39fstYl7fIPHTK3vfUmUUOK
	cYMY1ggI5s1v998NT0aHVi/UdkmmkrCWTRmzbuq+EMRIORnJc1KqgRUcTZsusYGZIqpd
	MuMA==
X-Gm-Message-State: ALyK8tLyPbaseBkUp5e3LMimQnV0Vm8oEkGVeXyGksfC0Tdpy1c3cQuio2bSFwreAT8GmQ==
X-Received: by 10.25.144.12 with SMTP id s12mr7203560lfd.221.1466701542281;
	Thu, 23 Jun 2016 10:05:42 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	u13sm184501lja.15.2016.06.23.10.05.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 10:05:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1466167530.git.digetx@gmail.com>
	<2bbc3737669523d9483f27276f929a6c4772fd48.1466167530.git.digetx@gmail.com>
	<CAFEAcA-v0pBZ2Thxiv38qHJcbeyrgCBvB_EeaCi2OJwGxFyyuA@mail.gmail.com>
	<d86d652a-8fd5-7383-36d4-68f4e8d23627@gmail.com>
	<CAFEAcA89Q80T0Xe=dXrR1Spox_pP3YXqnVQ_qAN=VuYPO7owRA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <878870eb-b5ca-8ac7-d4d3-ce13e0f0ad0e@gmail.com>
Date: Thu, 23 Jun 2016 20:05:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA89Q80T0Xe=dXrR1Spox_pP3YXqnVQ_qAN=VuYPO7owRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH v14 1/3] hw/ptimer: Support running with
 counter = 0 by introducing new policy feature
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
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Pyd6Eo4yNEj

On 23.06.2016 19:43, Peter Maydell wrote:
> On 23 June 2016 at 17:32, Dmitry Osipenko <digetx@gmail.com> wrote:
>> On 23.06.2016 16:49, Peter Maydell wrote:
>>> On 17 June 2016 at 14:17, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>> Currently ptimer prints error message and stops the running timer that has
>>>> delta (counter) = 0, this is an incorrect behaviour for some of the ptimer
>>>> users. There are different variants of how particular timer could handle that
>>>> case besides stopping the timer, like immediate or deferred IRQ trigger.
>>>> Introduce policy feature that provides ptimer with an information about the
>>>> correct behaviour.
>>>>
>>>> Implement the "counter = 0 triggers IRQ after one period" policy, as it is
>>>> known to be used by the ARM MPTimer and set "default" policy to all ptimer
>>>> users, maintaining old behaviour till they get fixed.
>>>
>>> Could you split this into:
>>>  (1) a patch which just adds the new argument to ptimer_init() and
>>>      updates all its callers
>>>  (2) a patch which adds support for setting the policy option to
>>>      something other than the default value
>>>
>>> and also make sure that we only do one change per patch -- there
>>> seem to be several different behaviour changes tangled up in
>>> one patch here.
>>>
>>> I think that will be easier to review.
>>>
>>
>> This patch isn't supposed to change behaviour for any of the current timers. I
>> think it is clearly expressed in the last sentence of the commit message. There
>> is one unintended behaviour change in this patch, it's my overlook [see below].
> 
> Right, but my point is that it is hard to tell that when I read
> the patch to review it, and splitting this will make it easier.
> 
> thanks
> -- PMM
> 

Ah, you are meaning to derive adding *new* "deferred trigger" policy into a
separate patch. I'll do it.

-- 
Dmitry
