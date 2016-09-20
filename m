Received: by 10.80.163.71 with SMTP id 65csp1205546edn;
        Tue, 20 Sep 2016 14:20:51 -0700 (PDT)
X-Received: by 10.200.34.219 with SMTP id g27mr38329446qta.42.1474406451781;
        Tue, 20 Sep 2016 14:20:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3si25693679qta.89.2016.09.20.14.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Sep 2016 14:20:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmSTD-0000F4-3s
	for alex.bennee@linaro.org; Tue, 20 Sep 2016 17:20:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bmSGR-0005kL-PX
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 17:07:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bmSGN-0002RH-Fa
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 17:07:38 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bmSGN-0002Qy-8d; Tue, 20 Sep 2016 17:07:35 -0400
Received: by mail-lf0-f66.google.com with SMTP id b71so677815lfg.1;
	Tue, 20 Sep 2016 14:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=h2e+/ate39dpXFqe+OIVxebzgcmkIevL9nRjG1m3Jj0=;
	b=EgCqrAgNOuGAtAunqDuyWniXI0H3RFAO3DESFvHYSeBiXXlu1cc7EADJv0GstYnwD9
	8roOGKeqUFWjuMebZMQqJR2sqEWKOzd9xuXEC3Hg6ZLGk/VPOa715k15dNd2up/evtKl
	qWfMY37MXEerpaaXFXJ9ZQ3BhB4x/0h5GeiNJu9JebxlmXqPwiY1r5GzGzfdxIDXgcb7
	DTCfZqRND8fgkWFNg9wMZCUhkCHLtMiWWr1h/0bIiDGZvscBIriP7UPNulUw9zHOZKoO
	k9G2fYUkr+RbvZ6B70l2UY9Sq6vWUcOfhI47Cwb1BXuvh8xfcqNE7yZlJIDRJxFtYj47
	cffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=h2e+/ate39dpXFqe+OIVxebzgcmkIevL9nRjG1m3Jj0=;
	b=Dd0kAalxlRwMAC2l8hI7A259J7hXNJB427vuF7AoE3ftZ/noHCfwhgOkBwdR1UwqYT
	AlL++XgptIq4978z9cvTgFIzjApHgN4jE7rQCJNBwTyfbnOtrZAgKuxqyrYUbAys3hGF
	zCFXmNvYBCkYTOHUZagwsZvMRXMZ6FFMbIBukSL+nlLrNM85/fAvgSPrSEvjXVdbyYZZ
	pAESjVaB7mL0In3Gl35aup8QKmSByjNDFmaFw17IB9YJcDzq/yy7nKu0GQ1FXKJyf+md
	OH9+IPFs80ffKvIHYbn86zqORSdkIoUSsTeftycW2y9HH6G23/7JsEKIQQV8sD2v4blh
	3oFQ==
X-Gm-Message-State: AE9vXwNLZI60LsjFaogaV2/8gLw+YuUzpV1WdoYnYAtZc+BE6NxrInOzRqhws9Zb6YmQ4g==
X-Received: by 10.25.138.9 with SMTP id m9mr3649408lfd.13.1474405594317;
	Tue, 20 Sep 2016 14:06:34 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.googlemail.com with ESMTPSA id
	s70sm6129123lfi.23.2016.09.20.14.06.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Sep 2016 14:06:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1473252818.git.digetx@gmail.com>
	<b485e92cac7725a75f7de9ca6b458ffa4082e099.1473252818.git.digetx@gmail.com>
	<CAFEAcA_QoFRgBvHTJzpVERJ2y_EiT=w483ep5atbe604U2WByQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <daf3308b-729c-5cf8-7a41-0aed37df3168@gmail.com>
Date: Wed, 21 Sep 2016 00:06:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_QoFRgBvHTJzpVERJ2y_EiT=w483ep5atbe604U2WByQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.66
Subject: Re: [Qemu-arm] [PATCH v16 07/16] hw/ptimer: Add "continuous
 trigger" policy
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
X-TUID: tcPEB3tzjhaS

On 20.09.2016 20:21, Peter Maydell wrote:
> On 7 September 2016 at 14:22, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Currently, periodic timer that has load = delta = 0 performs trigger
>> on timer reload and stops, printing a "period zero" error message.
>> Introduce new policy that makes periodic timer to continuously trigger
>> with a period interval in case of load = 0.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  hw/core/ptimer.c    | 18 +++++++++++++++++-
>>  include/hw/ptimer.h |  4 ++++
>>  2 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index e9b2e15..97ce8ae 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -45,7 +45,8 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
>>          ptimer_trigger(s);
>>          delta = s->delta = s->limit;
>>      }
>> -    if (delta == 0 || s->period == 0) {
>> +
>> +    if (s->period == 0) {
>>          if (!qtest_enabled()) {
>>              fprintf(stderr, "Timer with period zero, disabling\n");
>>          }
>> @@ -58,6 +59,21 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
>>          delta += delta_adjust;
>>      }
>>
>> +    if (delta == 0 && (s->policy_mask & PTIMER_POLICY_CONTINUOUS_TRIGGER)) {
>> +        if (s->enabled == 1) {
>> +            delta = 1;
>> +        }
>> +    }
>> +
>> +    if (delta == 0) {
>> +        if (!qtest_enabled()) {
>> +            fprintf(stderr, "Timer with delta zero, disabling\n");
>> +        }
>> +        timer_del(s->timer);
>> +        s->enabled = 0;
>> +        return;
>> +    }
>> +
> 
> Again, this looks like it's affecting behaviour even when the
> policy flag isn't set.
> 

No, the old behaviour is "to error out" when the delta = 0 and it's still the
same with this patch applied. This patch splits the "(delta == 0 || s->period ==
0)" check, so it won't error out if delta was changed to 1 in case of the
"continuous trigger" policy being used.

-- 
Dmitry
