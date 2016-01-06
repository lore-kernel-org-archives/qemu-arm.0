Received: by 10.182.158.201 with SMTP id ww9csp183300obb;
        Wed, 6 Jan 2016 12:52:41 -0800 (PST)
X-Received: by 10.140.180.20 with SMTP id b20mr141122128qha.49.1452113561433;
        Wed, 06 Jan 2016 12:52:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n83si52396853qhn.6.2016.01.06.12.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 12:52:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGv4S-0000K8-4x
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 15:52:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGv4P-0000Jo-RJ
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 15:52:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGv4K-0002Z9-Mq
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 15:52:37 -0500
Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232]:33853)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aGv4K-0002Z3-Fp; Wed, 06 Jan 2016 15:52:32 -0500
Received: by mail-lb0-x232.google.com with SMTP id pv2so212936661lbb.1;
	Wed, 06 Jan 2016 12:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=uBDrgMqyy9FtsKYFjiusPtKU1raI8Y7VSptLlAkReN0=;
	b=yiVoHmf3adg7hd4umfWmqyRFJOnd2cieTwfawK0bJBWb9OkmPkbPIjUZ0xEDwHgVnn
	XOdP46kYYTzAwyv6piW8x4TXIxZyBufxSLMfEt48EP7enuTjUQiLgpdc0Ne12Rm3EkE7
	LGLAGa9YQEL5oPZCd3H+++7c3MnvrS9fRpHpyMLSK4HePRsr7NLFI2DoPDfzwhNpLBB6
	u7Ce8BxbuDTwQuwhjc1XS84tC7v0HECK+XVwURwr1wttqUjUj2H1SJoz7XmjmBuBsCaZ
	E+IPUZ3b/E+KcTzVtcI4FJ4alop5x3u1j7dNjAZuN88XxnbUoxavpohxzdfZkRRQFSH1
	3jzw==
X-Received: by 10.112.184.133 with SMTP id eu5mr25506487lbc.99.1452113551488; 
	Wed, 06 Jan 2016 12:52:31 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	f74sm3120462lfb.7.2016.01.06.12.52.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 12:52:30 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
	<004073b3af0a56899f9a07e3f6b00167359322e6.1451960508.git.digetx@gmail.com>
	<20160106121711.GC4227@pcrost-box> <568D12A7.3010304@gmail.com>
	<CAPokK=pSmKDdZuinYKiHur=b2hV8WFuN5AO+mB_jQByyQLSgGw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <568D7E7B.8090505@gmail.com>
Date: Wed, 6 Jan 2016 23:52:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=pSmKDdZuinYKiHur=b2hV8WFuN5AO+mB_jQByyQLSgGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::232
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v8 2/4] hw/ptimer: Perform tick and counter
 wrap around if timer already expired
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
X-TUID: 1zMSkpht4ykl

06.01.2016 16:59, Peter Crosthwaite пишет:

>>>> +
>>>> +            if (expired) {
>>>> +                /* Wrap around periodic counter.  */
>>>> +                counter = s->delta = s->limit - counter % s->limit;
>>>
>>>
>>> Why do you update the delta here?
>>>
>>
>> Because we would want to schedule next tick based on current wrapped around
>> counter value and not some arbitrary delta.
>>
>
> So looking at ptimer_reload(), the new schedule is done relative to
> the VM clock of the when the tick was expected to hit, not the current
> time. But this new delta is going to be relative to the now time and
> then used to update the next tick which will happen relative to
> next_event. Unless you stop or scale the timer, I don't think you need
> to do delta manipulation?
>

Yes, I missed that next_event would be set earlier (like you described) in case 
of expired timer. Thanks for the note, will fix it.

>>> Also can you just get ptimer_reload to do the modulo math for you? If the
>>> timer is !oneshot and expired, then you call ptimer_reload anyway,
>>> which will update next_event. When the expired test returns false
>>> you can just reliably use the original logic involving now and next.
>>>
>>
>> Yes, that's what I changed in V9. Have you received it?
>>
>> https://lists.nongnu.org/archive/html/qemu-devel/2016-01/msg00272.html
>>
>
> Just had a look.
>
> V9 still has the modulo I think?:
>
> +            if (expired && (counter != 0)) {
> +                /* Wrap around periodic counter.  */
> +                counter = s->delta = s->limit - counter % s->limit;
> +            }
>

Modulo is there, I just meant that V9 changed to call ptimer_reload() on counter 
== 0. As noted above, ptimer_reload would adjust next_event, so s->delta
shouldn't be set to the wrapped around counter. However it should be set to the 
limit, since delta might been altered by ptimer_set_count.

-- 
Dmitry
