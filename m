Received: by 10.182.158.201 with SMTP id ww9csp452083obb;
        Thu, 10 Dec 2015 04:45:39 -0800 (PST)
X-Received: by 10.55.82.132 with SMTP id g126mr14815587qkb.63.1449751539675;
        Thu, 10 Dec 2015 04:45:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si14648431qgf.45.2015.12.10.04.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 04:45:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a70bL-0004qy-Dy
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 07:45:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a70bE-0004mM-45
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 07:45:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a70bA-0003Zq-9j
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 07:45:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36697)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a70bA-0003Zm-3c; Thu, 10 Dec 2015 07:45:28 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id B3417743;
	Thu, 10 Dec 2015 12:45:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-204-39.brq.redhat.com
	[10.40.204.39])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBACjP0B025933
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 10 Dec 2015 07:45:27 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6BFE4303F916; Thu, 10 Dec 2015 13:45:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1449743372-17169-1-git-send-email-armbru@redhat.com>
	<1449743372-17169-4-git-send-email-armbru@redhat.com>
	<CAFEAcA-hedUXdofT2_3ogpn_5GtOugDfQU84fOUC4YH5fdYr5g@mail.gmail.com>
Date: Thu, 10 Dec 2015 13:45:25 +0100
In-Reply-To: <CAFEAcA-hedUXdofT2_3ogpn_5GtOugDfQU84fOUC4YH5fdYr5g@mail.gmail.com>
	(Peter Maydell's message of "Thu, 10 Dec 2015 10:37:51 +0000")
Message-ID: <87zixieal6.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/12] arm_mptimer: Don't use
	hw_error() in realize() method
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
X-TUID: et0pKQQ/20vM

Peter Maydell <peter.maydell@linaro.org> writes:

> On 10 December 2015 at 10:29, Markus Armbruster <armbru@redhat.com> wrote:
>> Device realize() methods aren't supposed to call hw_error(), they
>> should set an error and fail cleanly.  Do that.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/timer/arm_mptimer.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
>> index 3e59c2a..f1a34ec 100644
>> --- a/hw/timer/arm_mptimer.c
>> +++ b/hw/timer/arm_mptimer.c
>> @@ -220,8 +220,9 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
>>      int i;
>>
>>      if (s->num_cpu < 1 || s->num_cpu > ARM_MPTIMER_MAX_CPUS) {
>> -        hw_error("%s: num-cpu must be between 1 and %d\n",
>> -                 __func__, ARM_MPTIMER_MAX_CPUS);
>> +        error_setg(errp, "num-cpu must be between 1 and %d\n",
>> +                   ARM_MPTIMER_MAX_CPUS);
>> +        return;
>
> I think the trailing newline is incorrect for error_setg, right?

I always misse one...  will fix!

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!
