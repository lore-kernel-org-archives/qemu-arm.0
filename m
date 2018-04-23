Received: by 2002:a4f:9ad6:0:0:0:0:0 with SMTP id b83-v6csp3681426ivh;
        Mon, 23 Apr 2018 02:28:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqE786ZWKgs/nU/2Z0dQ/sXSZ1sHVXP7nz//NfLFrU//6xNYB0c3xUgJhlWJ/GUKDPQ5dSr
X-Received: by 10.55.128.67 with SMTP id b64mr21479956qkd.78.1524475738202;
        Mon, 23 Apr 2018 02:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524475738; cv=none;
        d=google.com; s=arc-20160816;
        b=B8vzC6Qd5C7GTLfu9REaIUKq7AV2BsEJXFoOOg9VF6LCBZnC00qYbtUtBZEPaZzWIg
         bKld5rSsJ5BqeaOsLCamLPm7wu5HsvOGw6a7F3cmYFf86O1mTamVt6M7ulcxukwzgLsB
         r4xJDgV/K3y3xGNwS09kBOn7DGDlshcWJ2RcN9dN8bYH9bAT56HiXqN3Z4TNFyfqPJ/u
         WWQmaYNdRXHT6VN8iUv/ObHW4wcQuXAO+wm5T5YestYyGJD6d5iwYulDrE/+aacIRIfa
         oAcN1SNR6fS6t1fta1xixviU9aWyunYMdDFRf398qMm6R0BLl2VcUh89BYB45+9fdL66
         1Xog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=guKkcVyCpczjRNc/4cpDLg4APBNuZpwJugHYRu/dtU4=;
        b=VurIo/HTZh0HBndTcbd0AMSffkWV0fwIPQSnjQAhSdBySSBmDg8msS4J214gO82ql3
         E+rygUFtbrxLJ17wQAc6E+RHT7Mj/D5Fa5USz0E8CthobpQK//CJEhjEa4LW/lADudb0
         SFFc9TmrxszJ35KCrnuopV0TLtiy59hodErbA6V9OAuw1f+IXwk9gPX0m3Y0qsSvXS31
         2uGFQTgMZVt+Ypf0SqiCvMkmo0IcUs5exG2ogrgkm4AMn/SJhdXJZX3bcZqpuoxz+OX7
         mqH8k/FVBMQiuKZyYbe6FJ/wVrgSrED5ailPmcpThLpgDCRUoVfNQLOLfm1UaNeiU4k/
         otqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j141si6369029qke.124.2018.04.23.02.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 02:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAXmL-00029D-N2
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 05:28:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAXm6-00027k-JN
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAXm1-0006O5-3f
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:28:42 -0400
Received: from 6.mo4.mail-out.ovh.net ([188.165.36.253]:42340)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fAXm0-0006NN-Tr
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:28:37 -0400
Received: from player737.ha.ovh.net (unknown [10.109.108.61])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 2723F16854E
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 11:28:34 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player737.ha.ovh.net (Postfix) with ESMTPSA id DC7FEE0083;
	Mon, 23 Apr 2018 11:28:30 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180423064020.25434-1-clg@kaod.org>
	<CAFEAcA-LtNpGTV08jvK4i5C5i64WjM5gMB4zGr8P4fkVSkNH7g@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <53691cbf-08bf-e3f7-22d3-601a279aa08a@kaod.org>
Date: Mon, 23 Apr 2018 11:28:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LtNpGTV08jvK4i5C5i64WjM5gMB4zGr8P4fkVSkNH7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12052195555312700331
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrkeeggddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.36.253
Subject: Re: [Qemu-arm] [PATCH] timer/aspeed: fix vmstate version id
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2oKTV/5x/cta

On 04/23/2018 11:12 AM, Peter Maydell wrote:
>> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>> index 50acbf530a3a..7df19bd9df91 100644
>> --- a/hw/timer/aspeed_timer.c
>> +++ b/hw/timer/aspeed_timer.c
>> @@ -498,8 +498,8 @@ static const VMStateDescription vmstate_aspeed_timer = {
>>
>>  static const VMStateDescription vmstate_aspeed_timer_state = {
>>      .name = "aspeed.timerctrl",
>> -    .version_id = 1,
>> -    .minimum_version_id = 1,
>> +    .version_id = 2,
>> +    .minimum_version_id = 2,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
>>          VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
> Wouldn't it be simpler to just fix the incorrect value in
> the VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
> line ?

Yes. Also. 

Or bring back all the version ids to 1, as we never supported 
migration before.

Thanks,

C.

