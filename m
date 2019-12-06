Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1046916lff;
        Fri, 6 Dec 2019 09:33:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqygsgU89eSIe+NLxLMcH/QfNqqPnz7TnVf7XHo6MeTjaFg6zpR6ijYRf2wBUBjbJLLwmueX
X-Received: by 2002:aca:7583:: with SMTP id q125mr13875214oic.100.1575653608907;
        Fri, 06 Dec 2019 09:33:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f68si957702otf.305.2019.12.06.09.33.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 09:33:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="r/rjT14+";
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idHTr-00070g-DK
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 12:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1idGLx-0007pM-Ci
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 11:21:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1idGLw-0006Qn-1t
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 11:21:13 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:44274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1idGLv-0006LC-EQ; Fri, 06 Dec 2019 11:21:11 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id B401C96EF0;
 Fri,  6 Dec 2019 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1575649269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8c+iJWFGPAiZo9jyfQbNY0kXYYSglGYK/9W4fXx3aw=;
 b=r/rjT14+vBaGM9Jyt10ruvVkwDTpFJZmmNZYEMVR79pBFBFipB47pHs9bIKJFUD6jy0/vP
 y89v4rJ0ghvzbUjOrf9L0/REKpfARpEYm5isva6Hethq8Dx1tnl2tcz3qsFl+/I9uSjGnN
 Srfk9Vaq4n5iWWlZqPOq/9hHnkRv8+k=
Subject: Re: [PATCH v5 09/13] docs/devel/reset.txt: add doc about Resettable
 interface
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-10-damien.hedde@greensocs.com>
 <CAFEAcA_4x+EvDS8Lc0xyPE1GHRh4+7dvJ6sxMPXZjkrZ_CgrHw@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <82ff568e-2828-f055-af3e-43e748127fd2@greensocs.com>
Date: Fri, 6 Dec 2019 17:21:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_4x+EvDS8Lc0xyPE1GHRh4+7dvJ6sxMPXZjkrZ_CgrHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1575649269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8c+iJWFGPAiZo9jyfQbNY0kXYYSglGYK/9W4fXx3aw=;
 b=DtV9BBUDi5HAWhHGhslm/XNInRy71liL5TTsKD9NRCmqb2CB0w3fd5GptvXqAywhJJjR2M
 Q/vgQyI4QxSYo0cgbvrD2RjE+U4EXZK2HgviS1NAiawUUCT9FmmOj0D5ENIC78b/+OcsA7
 hE5BA0hpu3Sza77WxwCvoK8fCWK4oHY=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1575649269; a=rsa-sha256; cv=none;
 b=ZDIdtvKGXiPY69R/9y4+7NXRhIzaRs0nQ698DAPBxrVWWasaav/o77lITX/YGJIMmz3zH0
 VZ0ZyZosJYjU7wDNnFii1p6Bo5pg4o8eBRKrYPnxUh8N66Sc449vmL5H3J2uvBY7/OboGx
 WRvPb2cAwLbFUhvJ5PzMDW9p1LNLjKI=
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
X-TUID: d4H3zAHw4+xE



On 11/29/19 8:00 PM, Peter Maydell wrote:
> On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> 
> Subject line still says ".txt".
> 
>> ---
>>
>> +Polling the reset state
>> +.......................
>> +
>> +Resettable interface provides the ``resettable_is_in_reset()`` function.
>> +This function returns true if the object parameter is currently under reset.
>> +
>> +An object is under reset from the beginning of the *init* phase to the end of
>> +the *exit* phase. During all three phases, the function will return that the
>> +object is in reset.
>> +
>> +This function may be used if behavior has to be adapted when receiving external
>> +interaction while in reset state. Note that until migration of the reset state
>> +is supported, an object should not be left in reset. So apart from being
>> +currently executing one of a reset phase, the only cases when this
>> +function should return true is if an external interaction is made during *hold*
>> +or *exit* phase of another object in the same reset group.
> 
> This paragraph feels a bit unclear to me but I'm not sure how to improve it.
> 

If I add an example like this is it better ?

This function may be used if the object behavior has to be adapted
while in reset state. For example if a device has an irq input,
it will probably need to ignore it while in reset; then it can for
example check the reset state at the beginning of the irq callback.

Note that until migration of the reset state is supported, an object
should not be left in reset. So apart from being currently executing
one of the reset phases, the only cases when this function will return
true is if an external interaction (like changing an io) is made during
*hold* or *exit* phase of another object in the same reset group.

--
Damien

