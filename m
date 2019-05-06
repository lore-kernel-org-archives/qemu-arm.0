Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2337046wrh;
        Mon, 6 May 2019 05:17:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQwEKsDkGPgelUT02JPVSfsDvRdX9fCEu35fKcbGPYuYuJOvuPTx4klPUGrrAh80Qs1PR5
X-Received: by 2002:a05:600c:1002:: with SMTP id c2mr8947430wmc.138.1557145067286;
        Mon, 06 May 2019 05:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557145067; cv=none;
        d=google.com; s=arc-20160816;
        b=Te2y6morERCDr8lCMKs5Ze+18NwjLWRgKgWfoCKAGnxmuJTE4FjE8YJTQyCXl6eFRH
         9tbOgvp6v1wW6+3S9I1+bTn1uG4c+oswl45g4ASGLx5B8sMaMy3+joJMnzz720NwfWL1
         +hXgEI+pX33S9EBKgPzHwCSM62Zir/I2UUMYW1rJOMX3g/i5fO94dhLEWHRivjnvmZRC
         GKP7eQHGqv+W5UiULV4x4Ks8UYF6zvogom2iQHNoRwjAK7XXHJfxSfb88bQdU4VlOZFk
         f9XvAkWFQMVA4eN5kxPYr0f2y4C/4I10qb88jbC9qoU10/kqiiiNixOliYmhka6jiI88
         yZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=GPcpdg8QV058H1GLa55vX9skNIwpcet8Bz69ksAuJTs=;
        b=EaIRkBjWbe4jvMWhqJEO9+074XFQreAZI6CowI8HdxoATmBX0R0BA8JiAQpJPCbDEH
         K5xJsGgs1Q0Rmnj9sUsp+T2yeGHMjsiPWD9FQZxVCKj9nxhlV6J6ehduf4of6k4glLXt
         lOs8c6dU+1Rw4AZ1CdeZswp//Xmay7FpJigGhioAaB1rKwaoo4/Id8u0tnbQ1J8e/jbM
         W/VbPIuFfFvzrz3MOTlpsmWYphu90xUVtejIeMl97Nj/hmgH3DOG7HDYPrWq9zOW4qA8
         la2zVck8BjmGR3aePN2ylVJIxeeY0JddXdyPfYMdkDZgQEUUHvq/+28hBM70kmADI/Zq
         6vYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14si3522806wre.368.2019.05.06.05.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 05:17:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNcZ0-0004ZI-D9
	for alex.bennee@linaro.org; Mon, 06 May 2019 08:17:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hNcYn-0004Z8-DT
	for qemu-arm@nongnu.org; Mon, 06 May 2019 08:17:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hNcYm-0002Gm-9Q
	for qemu-arm@nongnu.org; Mon, 06 May 2019 08:17:33 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:33767)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hNcYm-0002Ac-3i
	for qemu-arm@nongnu.org; Mon, 06 May 2019 08:17:32 -0400
Received: from player729.ha.ovh.net (unknown [10.109.160.54])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 064B2191D52
	for <qemu-arm@nongnu.org>; Mon,  6 May 2019 14:17:22 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player729.ha.ovh.net (Postfix) with ESMTPSA id 66B9559A73EE;
	Mon,  6 May 2019 12:17:17 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20190430044036.1144-1-joel@jms.id.au>
	<CAFEAcA9qyzHiEY-OudwBUDzCia-jSQ7CkY_L7oC0t4Nu_665uA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d5f88bee-1873-d985-b926-17c159464e53@kaod.org>
Date: Mon, 6 May 2019 14:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9qyzHiEY-OudwBUDzCia-jSQ7CkY_L7oC0t4Nu_665uA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2725240725283769152
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.48.182
Subject: Re: [Qemu-arm] [PATCH v3 0/2] arm: aspeed: Add RTC Model
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
X-TUID: kejhYaxXmWNd

On 5/3/19 3:36 PM, Peter Maydell wrote:
> On Tue, 30 Apr 2019 at 05:40, Joel Stanley <joel@jms.id.au> wrote:
>>
>> v3: Add some commit messages, resend as v2 didn't send properly
>> v2: Minor fixes, added vmstate and reset, and rebased on C=C3=A9dric's=
 series
>>
>> Based-on: 20190411161013.4514-4-clg@kaod.org
>> [PATCH 3/3] aspeed: use sysbus_init_child_obj() to initialize children
>>
>> A model for the ASPEED BMC real time clock (RTC). The model is suffici=
ent
>> for running the guest Linux kernel driver, and ticks in time with the
>> host when programmed.
>>
>> It does not implement the alarm functionality, which includes the
>> interrupt.
>=20
> Hi -- I've reviewed this series, but can't apply it yet as
> it's based on Cedric's patchset which needs a respin. If
> I forget to apply this when I apply the respin of that one,
> please ping me...

I will work on a fix ASAP.

Thanks,

C.
