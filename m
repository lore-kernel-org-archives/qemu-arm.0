Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp356061wrd;
        Fri, 31 Aug 2018 01:55:36 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ6eqAB8UUtEmlEbMTME4lUP6YlK8lg3RDNUp2zMJCBSmqSx/jFAQa7v8SmrE1QKkEAT2O+
X-Received: by 2002:ad4:4109:: with SMTP id i9-v6mr14647001qvp.100.1535705736337;
        Fri, 31 Aug 2018 01:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535705736; cv=none;
        d=google.com; s=arc-20160816;
        b=qfXEaiOAusgofnI/QbIwk9QOrsVsHIFzG4ObABtGpoUytDcxs+YReGzAs2+SXoBwkX
         2KRtMRAcjKiU4pVEWDKZny+mMdqHBqZ1h0IAGdk6prdn0RRfpA70TC3FkACcttQCsRRJ
         Xx71SAtLDPse1N/qtFUfocGQzkI3i+uBMEsLsC6HWQPV8lCHE87FAy0yYX5oKUQDUcIJ
         CG59e3mMLjoivUAWzPzT+u7Lsg1seSF7ryrGgrLm4F4mBTRHqByzCud2jfTLPS9gEePC
         QxHTZvI1+rq9SCNkvk9e/K9XrQ/0vsL52Ff0fEH8/PNbKhrfimBrvghbR9dasBcVcJ79
         qwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=IM1UnVWq4m9fqev8oy/4R0ptXdH1sBOCgzBCmoTWxFY=;
        b=baXD3KqhJn6LGaPLHBQgi9jqfWyQAGZIumlhKacBdSU3T9eg6cQSFG4zJQr0EnL46A
         A0K6/gyLMAD88wbSq826shH4FzLBge/h2D2OuHOiGdNljPFmQ8V0hwcfWakUoek+3w/7
         +OVyf6e7jOuvGAeLC9kOpeT/pFXvyClmwqcEdmxVLtJ72LYuA7GikswTa0KjdnKxaerf
         +MIhEykvC1CmTo2bG4rJnC0Ln6/jJ2iuDIWgg62eRPPfbsCcigSqaIuprOOgBbKe5LpR
         szFdMC5Eo6H2AsdBrghu6g03HXhGBrG8wnH80rORR0UObBIs9oJatWTEvp2UpEsWg00J
         K0Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l62-v6si4814741qtd.97.2018.08.31.01.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 01:55:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvfDL-0002yk-R4
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 04:55:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvfD7-0002wv-4m
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 04:55:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvfD3-0000Pe-V2
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 04:55:21 -0400
Received: from 9.mo177.mail-out.ovh.net ([46.105.72.238]:49324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvfD3-0000GX-Np
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 04:55:17 -0400
Received: from player693.ha.ovh.net (unknown [10.109.160.239])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 13037C44F6
	for <qemu-arm@nongnu.org>; Fri, 31 Aug 2018 10:55:09 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id 6614B44008B;
	Fri, 31 Aug 2018 10:55:00 +0200 (CEST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180622075700.5923-1-clg@kaod.org>
	<20180622075700.5923-4-clg@kaod.org>
	<fb6480f3-2c25-bcd1-9586-3ce45b82d6e1@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4348fb77-74ec-dd52-609d-fca0c9883ad1@kaod.org>
Date: Fri, 31 Aug 2018 10:55:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <fb6480f3-2c25-bcd1-9586-3ce45b82d6e1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 174514486781709198
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.72.238
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/3] aspeed/timer: use the
 APB frequency from the SCU
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OMq7qQ1GJrLQ

On 08/31/2018 10:34 AM, Thomas Huth wrote:
> On 2018-06-22 09:57, C=C3=A9dric Le Goater wrote:
>> The timer controller can be driven by either an external 1MHz clock or
>> by the APB clock. Today, the model makes the assumption that the APB
>> frequency is always set to 24MHz but this is incorrect.
>>
>> The AST2400 SoC on the palmetto machines uses a 48MHz input clock
>> source and the APB can be set to 48MHz. The consequence is a general
>> system slowdown. The QEMU machines using the AST2500 SoC do not seem
>> impacted today because the APB frequency is still set to 24MHz.
>>
>> We fix the timer frequency for all SoCs by linking the Timer model to
>> the SCU model. The APB frequency driving the timers is now the one
>> configured for the SoC.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  include/hw/timer/aspeed_timer.h |  4 ++++
>>  hw/arm/aspeed_soc.c             |  2 ++
>>  hw/timer/aspeed_timer.c         | 19 +++++++++++++++----
>>  3 files changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed=
_timer.h
>> index bd6c1a7f9609..040a08873432 100644
>> --- a/include/hw/timer/aspeed_timer.h
>> +++ b/include/hw/timer/aspeed_timer.h
>> @@ -24,6 +24,8 @@
>> =20
>>  #include "qemu/timer.h"
>> =20
>> +typedef struct AspeedSCUState AspeedSCUState;
>> +
>>  #define ASPEED_TIMER(obj) \
>>      OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
>>  #define TYPE_ASPEED_TIMER "aspeed.timer"
>> @@ -55,6 +57,8 @@ typedef struct AspeedTimerCtrlState {
>>      uint32_t ctrl;
>>      uint32_t ctrl2;
>>      AspeedTimer timers[ASPEED_TIMER_NR_TIMERS];
>> +
>> +    AspeedSCUState *scu;
>>  } AspeedTimerCtrlState;
>=20
> This patch breaks compiling with clang 3.4.2 for me:
>=20
> In file included from /home/thuth/devel/qemu/hw/timer/aspeed_timer.c:16=
:
> /home/thuth/devel/qemu/include/hw/misc/aspeed_scu.h:37:3: error:
> redefinition of typedef 'AspeedSCUState' is a C11 feature
>       [-Werror,-Wtypedef-redefinition]
> } AspeedSCUState;
>   ^
> /home/thuth/devel/qemu/include/hw/timer/aspeed_timer.h:27:31: note:
> previous definition is here
> typedef struct AspeedSCUState AspeedSCUState;

Ah. Bummer. I will just include the file then.
                             =20
>=20
> I think you should not re-typedef here. Either include the right header=
,
> or use include/qemu/typedefs.h.

I didn't know this file existed. I am not sure to like this method.

>  Thomas
>=20
>=20
> PS: Did I already mention that I really dislike the typedeffing in QEMU=
?
>=20

It's a bit painful I agree.

Thanks,

C.=20
