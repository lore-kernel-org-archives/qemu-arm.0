Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12602702lfc;
        Mon, 2 Dec 2019 03:39:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqygp0GVQolWrMQ/0RFuohh3TIU6mykKjwdvwCTInTgeLemhCs/+2Mgt6kd169tqHo32NB3S
X-Received: by 2002:a37:4ccb:: with SMTP id z194mr31444548qka.128.1575286744331;
        Mon, 02 Dec 2019 03:39:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si9378757qkg.56.2019.12.02.03.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 03:39:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3qnXKbgn;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibk2h-0006KY-KT
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 06:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44577)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1ibk29-0006KR-Dr
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 06:38:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1ibk28-0004Ps-1l
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 06:38:29 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:51086)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1ibk27-0004PE-FE; Mon, 02 Dec 2019 06:38:28 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 82F8696EF0;
 Mon,  2 Dec 2019 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1575286701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kc4rOJaJAYsNyCWNjPbW9WW8Alz48HOG756F5zrMF0A=;
 b=3qnXKbgngrLys298wuE/JEhUm0wVSEaZ89fMLWV4Cb34aYF/4myeg4+4+XSagbqI3LafXk
 IhRQHAqQYfQfC3GP97klTyipM93omHoIP2Mq6fqQefl7XCghoBMbNGmrXnO7AmXlh6WwY8
 qYu2RljaoW3ebaC1K2uAmgcxphur5uQ=
Subject: Re: [PATCH v5 04/13] hw/core: add Resettable support to BusClass and
 DeviceClass
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-5-damien.hedde@greensocs.com>
 <CAFEAcA9z_Tu3jEABbRVgoZfw=_6RDm8MOQNOYh4qwmQzJjBAgQ@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <0befd5d7-dde3-9a41-6c60-1bc372f7fd28@greensocs.com>
Date: Mon, 2 Dec 2019 12:38:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9z_Tu3jEABbRVgoZfw=_6RDm8MOQNOYh4qwmQzJjBAgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1575286701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kc4rOJaJAYsNyCWNjPbW9WW8Alz48HOG756F5zrMF0A=;
 b=Wi4oqgutqhzNbKcEtiG4+L4eiPJCFAsdD4tm4s9izLCm1Ju2q41Lv7sAOnTuh8Pm6Rfo2F
 JCNDiq6dDsKhlrgZteDGN3NWCfjUzRJPhTfJZ05H77uYoC4VoUpW1E7Zi+R4j3PmtkR36A
 UIpLYX8uNZvuektGCsFrIPCoPyUoYls=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1575286701; a=rsa-sha256; cv=none;
 b=a5+O9S4I9dxfA+Rnf7LutTBtMjnLdCtsP1Uiv3LCOVrc80pTRx1i+NPR4ofgLPefyvngrv
 H65jPJ2pdBO/uL5Rqr6K2HqSzL/j0eA0rFbJzkGgtOgHQG+pxcqx0ji9M47acfIZPTPrTv
 Gs7YpitOBwpWbXPIM6JRKXWl/gpu2Uo=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7KAElx12hZie



On 11/29/19 7:36 PM, Peter Maydell wrote:
> On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> This commit adds support of Resettable interface to buses and devices:
>> + ResettableState structure is added in the Bus/Device state
>> + Resettable methods are implemented.
>> + device/bus_is_in_reset function defined
>>
>> This commit allows to transition the objects to the new
>> multi-phase interface without changing the reset behavior at all.
>> Object single reset method can be split into the 3 different phases
>> but the 3 phases are still executed in a row for a given object.
>> From the qdev/qbus reset api point of view, nothing is changed.
>> qdev_reset_all() and qbus_reset_all() are not modified as well as
>> device_legacy_reset().
>>
>> Transition of an object must be done from mother class to daughter
>> classes.
> 
> The standard terminology here is "parent class" and "child class".
> 
> I notice you've used mother/daughter in a bunch of other comments
> in various patches -- could you change that to the more usual
> terms, please?
Yes. Sorry for that.

> 
>> Care has been taken to allow the transition of a mother class
>> without requiring the daughter classes to be transitioned at the same
>> time. Note that SysBus and SysBusDevice class do not need any transition
>> because they do not override the legacy reset method.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 

--
Damien
