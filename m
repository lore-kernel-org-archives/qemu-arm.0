Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp148421wrg;
        Mon, 20 May 2019 06:12:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydr1CuxEJskWjBn0kC2j/I+cnFSvy6zZ50VtpcnAzPC44XntXT2JfPJxxx1ijmeJvrmCbC
X-Received: by 2002:a50:8e1e:: with SMTP id 30mr75795218edw.283.1558357936305;
        Mon, 20 May 2019 06:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558357936; cv=none;
        d=google.com; s=arc-20160816;
        b=P4iPRTbrNaYd2uzOmKdwyiBct9SByUeiU288/SLn99fG7uc3UTOKVL9F7U0h3xQLyb
         A4nN9hi+5b9Z07qUgf1RL2JEJsuAZfhtay7A2C2YIucF6e6Ch0zltiGGbZHuxdXzWish
         97ZV/Hb4K6tDlDCDPBjqocd4mUHv57rpgvFJxWehkovQXcZ0cBtEiyvoKjVu/XXLMnkK
         G8zKdNCmwNKuJZC0nMFuZOOP1lOqeEefmDIyWZdwiucIpWiF2GitcOEXkPe1dapR4pBr
         HPZp+BTvwVskcI9NFZIJ2zWQus25hIjowcrZYUfyYeYIUUIV7ABqSEQlB/2owBCzF63+
         iUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=9jDT2IgbqGdmPe8qELH+y/h2O76klpD1QoU4jF+40Jc=;
        b=YvBV08tDMTe+4KKkyRjzMm6igZaZmGfebXBhaqsMN50UO/e3eryj8GsT0iLkq0Xyhp
         3L2rfRWfV2qTfUqzAhauuwOkeght9c4/C2PSKya/YBhmwqzKTiyARZpEAu+vildRS7m7
         T/jzbJTHe+CWOfWsEK21ESFCX+XRvsMOIyT5I5bDnmn/2ckQWv0lqWhnezeeYmEuf70I
         jqfO37+RBCaxlld1cVrWaDumb05X0RFDrG9Vf8dONKMdwaN26Ykz2FoHI3PUQ4Z+XJ9K
         6ELYMdKlF3ro0VccNvdxRpZlbNls7D/oR7FniUGcmQyG7swYd9Tvhf5++Nff5PsaukSC
         iCqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si2367809ejf.102.2019.05.20.06.12.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 06:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSi5P-0003Hk-AT
	for alex.bennee@linaro.org; Mon, 20 May 2019 09:12:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hSi4g-0003Fz-Pq
	for qemu-devel@nongnu.org; Mon, 20 May 2019 09:11:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hSi4f-0001mn-OB
	for qemu-devel@nongnu.org; Mon, 20 May 2019 09:11:30 -0400
Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175]:38452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hSi4f-0001lx-IU
	for qemu-devel@nongnu.org; Mon, 20 May 2019 09:11:29 -0400
Received: from player694.ha.ovh.net (unknown [10.109.160.153])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id D0498131FD9
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 15:11:26 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n0.emea.ibm.com [195.212.29.162])
	(Authenticated sender: clg@kaod.org)
	by player694.ha.ovh.net (Postfix) with ESMTPSA id 2D9B65E1CF44;
	Mon, 20 May 2019 13:11:19 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190506142042.28096-1-clg@kaod.org>
	<b12201c8-7d5f-2108-6666-75543c38f243@kaod.org>
	<f1ca56fd-c83d-8ad6-29c9-a8fc6af4531c@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <270e510b-687a-6b43-8cd6-c1eb1aea41e6@kaod.org>
Date: Mon, 20 May 2019 15:11:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f1ca56fd-c83d-8ad6-29c9-a8fc6af4531c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 12069084054961687467
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.175
Subject: Re: [Qemu-devel] [PATCH v2 0/3] aspeed: cleanups and extensions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LoHYqE9YHAEr

Hello,

On 5/20/19 1:09 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 5/20/19 9:47 AM, C=C3=A9dric Le Goater wrote:
>> Hello,
>>
>> On 5/6/19 4:20 PM, C=C3=A9dric Le Goater wrote:
>>> Hello,
>>>
>>> Here is a series adding a couple of cleanups to the Aspeed SoCs to
>>> prepare ground for extensions and new SoCs.
>>>
>>> Thanks,
>>>
>>> C.
>>>
>>> Changes since v1:
>>>
>>>  - moved enum defining the Aspeed controller names under aspeed_soc.h
>>>  - removed AspeedSoCInfo 'sdram_base' field
>>>  - fixed clang compilation
>>>
>>> C=C3=A9dric Le Goater (3):
>>>   aspeed: add a per SoC mapping for the interrupt space
>>>   aspeed: add a per SoC mapping for the memory space
>>
>> I think these two patches are fine to go even if Philippe's comments=20
>> are not addressed. There are valid but not a blocker to me. =20
>=20
> OK, so:
>=20
> patches 1 & 2:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> Peter, can you apply them?
>=20
>>
>>>   aspeed: use sysbus_init_child_obj() to initialize children
>>
>> Philippe has taken over this patch in a larger series which will go=20
>> through Eduardo's tree, if I understood well the emails. When merged,=20
>> we can try to re-merge the RTC patchset from Joel. I think we made=20
>> things a little more complex than they should have been.=20
>=20
> Sorry if I made things more complex. I went on PTO after sending

PTO ?

> "hw/arm: Use object_initialize_child for correct reference counting" [*=
]
> then was slow to address Thomas/Markus comments.
> Then maybe I should start pinging maintainer more aggressively when my
> series are reviewed but not merged, to not delay further developments.

Well, I don't know if there is a good method for transversal patchsets=20
like this one. I guess it depends on the area.=20

The overall merging process became more complex that expected after our=20
three simple patchsets (Yours, Joel's and mine) collided.=20
=20
> I took note of your comment and will try to keep things simple the next
> time.

It's not a big issue. We have time to provide fixes before 4.1 is out.=20
Let's put some energy to move on and get code merged.

Peter,=20

do you want me to resend with only the two first patches and include=20
Joel's in the same series ? I would leave out the part Philippe is=20
covering in his object_initialize_child() patchset.

Thanks,

C.

