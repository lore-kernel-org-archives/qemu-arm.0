Received: by 10.25.159.19 with SMTP id i19csp2051663lfe;
        Tue, 9 Feb 2016 10:11:25 -0800 (PST)
X-Received: by 10.140.194.4 with SMTP id p4mr46175448qha.30.1455041484993;
        Tue, 09 Feb 2016 10:11:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h8si36868689qgh.33.2016.02.09.10.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Feb 2016 10:11:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTCl2-0003qh-ET
	for alex.bennee@linaro.org; Tue, 09 Feb 2016 13:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aTCkz-0003pQ-Uu
	for qemu-arm@nongnu.org; Tue, 09 Feb 2016 13:11:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aTCky-00088I-Vs
	for qemu-arm@nongnu.org; Tue, 09 Feb 2016 13:11:21 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aTCky-00088B-Ov
	for qemu-arm@nongnu.org; Tue, 09 Feb 2016 13:11:20 -0500
Received: by mail-vk0-x233.google.com with SMTP id k196so56049350vka.0
	for <qemu-arm@nongnu.org>; Tue, 09 Feb 2016 10:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0Neeow3IQGto6+AEyErXVPB3gxi1gg9A8e3oT5eItaw=;
	b=PGP84W5PU/6oapZxwuTYWflxMROrlNuUWugJ463QjSeqSB44Qqu88redVcylUdAIvY
	XDeZKHCPU1Ko/+DkWXyzYU5DjS5rEzVfhdLJqjB3dYysHYEC0Y5hKzMOnHg04VHi2vLa
	2pXbgbDnpxMpeh/mwNExuVJMoYnfqHtblCMMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0Neeow3IQGto6+AEyErXVPB3gxi1gg9A8e3oT5eItaw=;
	b=j1WuuJ86lKJuv+Wejg4ZpYhnk8VDyBLuTbOngAazPku6/ItDsr79OeLUud5WGRFDu0
	A8TgncDCU02o7z4KIE6DNESs6GfaAPKF581wQXTkJbsl/EZtzklK4ocHIQOPYnEb+t/9
	A3Q7PMzbofKjXIEetazCK70VGiuxdPoBK19XPX+FikuJaWNsBYLAEv8cm/zNS+RIb33o
	ze2tZtdquZOHbQoyHbyGc0IUnzPpgr0SHh23h9QahFaeTRX2aJGUrt7z9qS0cfDiyG+c
	qMYzIgdOykZLpAkVwY/NztMn+tYMCPgUuXeCmGYu96sQZGXJwHEeSW/4hcARQeQoS/gy
	lI6w==
X-Gm-Message-State: AG10YOReK8eQb1bK9r7f0vIBxpaJYGY2If+Pg8yFnbbOMFsC1olgMNoOn334u9t/3P2BoNqztVXAjzMDtiZsJZmi
X-Received: by 10.31.47.207 with SMTP id v198mr26269648vkv.6.1455041480319;
	Tue, 09 Feb 2016 10:11:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 9 Feb 2016 10:11:00 -0800 (PST)
In-Reply-To: <BLUPR0301MB2034738A097725F02E582A2A9ED60@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1454993910-24077-1-git-send-email-swarren@wwwdotorg.org>
	<BLUPR0301MB2034738A097725F02E582A2A9ED60@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2016 18:11:00 +0000
Message-ID: <CAFEAcA81Pmi0a6saiy_Ff-ozmw4AJ6SBmW6JYR-DS86ERV004Q@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [Qemu-arm] [PATCH V2] bcm2835_property: implement "get board
	revision" query
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
X-TUID: 2KsnfEJaBSi9

On 9 February 2016 at 05:41, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Stephen Warren [mailto:swarren@wwwdotorg.org]
>> Sent: Tuesday, 9 February 2016 3:59 PM
>>
>> Return a valid value from the BCM2835 property mailbox query "get board
>> revision". This query is used by U-Boot. Implementing it fixes the first
>> obvious difference between qemu and real HW.
>>
>> The value returned is currently hard-coded to match the RPi2 I own. Other
>> values are legal, e.g. different board manufacturer field values are likely to
>> exist in the wild.
>>
>> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
>> Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
>> ---
>> V2: Set the property in raspi.c, and pass it through to the property mbox
>> code via property aliases.
>
> Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>



Applied to target-arm.next, thanks.

-- PMM
