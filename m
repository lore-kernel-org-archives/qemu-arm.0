Received: by 10.25.27.66 with SMTP id b63csp1604201lfb;
        Mon, 6 Jun 2016 10:25:58 -0700 (PDT)
X-Received: by 10.55.154.142 with SMTP id c136mr17483939qke.63.1465233958198;
        Mon, 06 Jun 2016 10:25:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b130si12695563qhb.14.2016.06.06.10.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 10:25:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9yHl-0002OB-H9
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 13:25:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b9yHT-0002F9-U7
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 13:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b9yGX-00074H-Sg
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 13:25:38 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33305)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b9yGX-00073v-Cj; Mon, 06 Jun 2016 13:24:41 -0400
Received: by mail-lf0-x244.google.com with SMTP id w16so14088825lfd.0;
	Mon, 06 Jun 2016 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=HuqZjufHHlNXyB7fp8UxOXQD3YFSfwulQuynh8FpVcg=;
	b=xdbthGGRkhz3Lc1AmBpJ99fdhtJiK98ob5WVZ2crqotBqr9CS5mn3wUZQCxQGBjxdS
	xPGa3+9hsSx7UqDE6+6O+MDItn5g5mQ+Cy+rhFQvAgKxE7xrr0vsS12BIeh3fP477YUM
	XQ7Mk+t4Dib/2aEeXrSe93yMDEKKTgajbYqTXbnfF6njI+KV1JHk7IZpEjUiB0d+yEhQ
	Gs1DeQHKZ08wYY3uVN2zhWPog3EIsABFYNx3+aYTDsIF3rSAZ0KKzFMfiANDLK4+dPdB
	IloMLJPJ1qvzJF72M/fVhZ7a0vmYMq0mampdKlYjKYPW7Ehib7RWDNB/l+nDnFdY6K1A
	1WHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HuqZjufHHlNXyB7fp8UxOXQD3YFSfwulQuynh8FpVcg=;
	b=PmQ2Bmn/z7XT+Kh5b31MMxgeqP4kq5Bpc1+DhIeyfirsVo5wGer3GjyeFAgh4cjgy0
	MBlU1WjQgBSCHJ9QYn8N19U8Qubxhq7znK6u0ZRgxHRMvCrcUkc0sahn1Y03e5RY0p2m
	EQg1fVSAIKipXx4E3FKWKV9dNeXycy1jETilVkV4rVLHMDyR/yTr1gCw+VyxvhWWsXa/
	F7p4QAc33QgSv3pU8CMSIeY8ICAg8gWAs5y1q7JgJAQRT4XWR/xKi5w3p+Xv1Cl0L5vJ
	dNqbhslUY886onOQgV+wNIYMuyyjEgSRs8KT5FcQatErtGEwM4NU2/BsGr2HFckfRnXB
	KVNA==
X-Gm-Message-State: ALyK8tIbcVxwL3oUeDRY6krVdHRVtFk5YbL2Zb5oa9xHGZ10ahxWc2Qj0bHBKttIkiGKxg==
X-Received: by 10.46.5.194 with SMTP id 185mr4693057ljf.65.1465233880143;
	Mon, 06 Jun 2016 10:24:40 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	wt10sm1930307lbb.25.2016.06.06.10.24.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Jun 2016 10:24:38 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1464367869.git.digetx@gmail.com>
	<97318fe5bbe95202ca2d96e72a31c597a148ea77.1464367869.git.digetx@gmail.com>
	<CAFEAcA_Y29-mxShvHqZrQC-g4Ve5X+yE18SWaCKumb40FaSmeQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9037a58a-0017-8b0f-12ef-11849fd1ed42@gmail.com>
Date: Mon, 6 Jun 2016 20:24:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Y29-mxShvHqZrQC-g4Ve5X+yE18SWaCKumb40FaSmeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH v13 6/8] hw/ptimer: Support running with
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
X-TUID: rJaRoA0gaHvt

On 06.06.2016 13:09, Peter Maydell wrote:
> On 27 May 2016 at 18:03, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Bump VMSD version since a new VMState member is added.
>
> I'm afraid you can't do that -- the ptimer code is used by a lot of
> platforms including some which do not permit migration compatibility
> breaks (at least sparc, for instance).
>
> If you want to add this feature you need to at least make it seamlessly
> support migration from the old version using a vmstate subsection.
>
> Better would be to make the policy a QOM property -- then it is
> constant for the lifetime of the timer and doesn't need to be migrated
> at all. (There's no reason to support timers which change policy at
> runtime, I hope). The default property value should be "same behaviour
> as previously".
>

QOM property should fit well, thanks for the suggestion.

> This whole change would be more solidly supported if it came with
> a clear description of the bug being fixed (ie what device is currently
> using the default-but-wrong behaviour and is going to be fixed by
> setting a different policy).
>

I'll extend the commit description, thanks for the note.

>> +    if (s->delta == 0 && s->policy == UNIMPLEMENTED) {
>> +        hw_error("ptimer: Running with counter=0 is unimplemented by " \
>> +                 "this timer, fix it!\n");
>
> hw_error() is effectively a verbose assert. Have you checked that
> all the users of ptimer do the right thing? If not, we can't
> assert() until we've fixed them all. Similarly below.

No, I haven't examined all the users thoroughly, will take look through them for 
this issue.

In my opinion it's better to know that your QEMU machine doesn't behave 
correctly and just fix it.

> Note that what we had previously was just a warning-and-continue
>

Yes, and it was literally "forever" there: "committed on 23 May 2007". Seems 
just nobody cared to fix/improve it since then.

I'll keep old "warning-and-continue" in this patch and derive "hw_error" change 
into a separate patch.

>> @@ -165,11 +170,8 @@ void ptimer_run(ptimer_state *s, int oneshot)
>>  {
>>      bool was_disabled = !s->enabled;
>>
>> -    if (was_disabled && s->period == 0) {
>> -        fprintf(stderr, "Timer with period zero, disabling\n");
>> -        return;
>> -    }
>>      s->enabled = oneshot ? 2 : 1;
>> +
>
> Stray extra blank line.
>

Ack.

>> +enum ptimer_policy {
>> +    UNIMPLEMENTED,
>> +    SET_CNT_TO_0_TRIGGERS_IRQ_AFTER_ONE_PERIOD,
>
> Given that enums aren't namespaced, "UNIMPLEMENTED" is too broad;
> you need some PTIMER_ prefixes. Also the second one of these is
> too long a name.
>

Ack.

>> +};
>> +
>>  /* ptimer.c */
>>  typedef struct ptimer_state ptimer_state;
>>  typedef void (*ptimer_cb)(void *opaque);
>> @@ -25,6 +30,7 @@ uint64_t ptimer_get_count(ptimer_state *s);
>>  void ptimer_set_count(ptimer_state *s, uint64_t count);
>>  void ptimer_run(ptimer_state *s, int oneshot);
>>  void ptimer_stop(ptimer_state *s);
>> +void ptimer_set_policy(ptimer_state *s, enum ptimer_policy policy);
>
> Documentation comment headers for new global functions, please.
>

Ack. Thanks a lot for the review!

-- 
Dmitry
