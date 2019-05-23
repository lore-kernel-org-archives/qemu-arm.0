Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1711219wrg;
        Thu, 23 May 2019 06:14:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtO0Qxo7jT9Rly2oGCBN2UfVhMQUYJLZn0253sLu3TZVIru9cUbJMQaPD+70/M7u+RCP7a
X-Received: by 2002:a17:906:4d57:: with SMTP id b23mr75928420ejv.254.1558617282340;
        Thu, 23 May 2019 06:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558617282; cv=none;
        d=google.com; s=arc-20160816;
        b=a1oCwWm/XoXhRuiWm1euhKgTV4OgwLcmhU6uB57pvQiVz/Vp2FEpD5ZJjVyhuabcZM
         ptlOx5V8cSxxg4QxRngrHCube0F/Z54oS8EjzCrZQgkDJj3/nzF6GKyOQRklm1RpNSUc
         n5M+qs1EYzfjX1v6xWVpe5ztVrFO0oTfrQ4I0G2fcWpdRoVZcX149tUF3NWz77aqoOTU
         cEfaNm2+Sm25qxnTS50yZo0g/5ZophrRadtFBbT7UGwoTdeF0Y7jcKhiAzitH+7Jxgw1
         7fVy/FJ9AagW8XnQodo1egjwtA3xrhsBjLfG+b8pJQEBwNCXG3dJPfBw8IDLcWGU1jN4
         D4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=WU5MZIAdIMVDBJ9gG9o4UPOvB7bts28LLT1073rUwMk=;
        b=W06K0nvrhh3NQSZQkO7tuub1RgOuLQNa8BrecqlwHB3e/a9J6BKkEx6APtD77u1ThL
         7Q0RU+bhT+iOLX8qyFzWsyrKH+nExMCL8JcFvmIxRz1WDh8QeEu9/HkbWGXG7L0ecnaf
         liSPA6casWTeEoLdIlkG5vmoPMlRF+QF8DTJLRPWwjgEOG271U2Eej17VLLpyKxJhYKJ
         nBHvFL/yiM039VcLP0RcYd4J6Znrh1LhBarZlqSsHxahP6ZdZL0eGq7CKhz0WAn/t3Nv
         olVJOlLROoLmCPXOSiOWfvKCwq+7puU8NsyDFNh2l1f+lEw/q7PKQqwtEXdCcjGjp9uL
         mcTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si2869345ejb.106.2019.05.23.06.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 06:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnYP-0003KS-8N
	for alex.bennee@linaro.org; Thu, 23 May 2019 09:14:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hTnNY-0001JW-Jk
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:03:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hTnNT-0007Gh-Tc
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:03:28 -0400
Received: from 18.mo5.mail-out.ovh.net ([178.33.45.10]:54622)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hTnNT-0007FO-Ou
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:03:23 -0400
Received: from player755.ha.ovh.net (unknown [10.108.35.12])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 5EDC922B5FE
	for <qemu-arm@nongnu.org>; Thu, 23 May 2019 15:03:21 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n0.emea.ibm.com [195.212.29.162])
	(Authenticated sender: clg@kaod.org)
	by player755.ha.ovh.net (Postfix) with ESMTPSA id 3B88963078F5;
	Thu, 23 May 2019 13:03:12 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20190506142042.28096-1-clg@kaod.org>
	<b12201c8-7d5f-2108-6666-75543c38f243@kaod.org>
	<f1ca56fd-c83d-8ad6-29c9-a8fc6af4531c@redhat.com>
	<270e510b-687a-6b43-8cd6-c1eb1aea41e6@kaod.org>
	<6161d982-0d21-99d6-680a-37ae300fd7cd@kaod.org>
	<98d1e57f-c033-fdb4-51bd-4a6fc2223d58@redhat.com>
	<CAFEAcA-eVECkPpxnvDtX3v6BFMSVCF4SU87r51PdG=E=hCYLfA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c2597233-e1e3-6bed-e992-ec8ea250cedd@kaod.org>
Date: Thu, 23 May 2019 15:03:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-eVECkPpxnvDtX3v6BFMSVCF4SU87r51PdG=E=hCYLfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 11103624882754390870
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddugedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.45.10
Subject: Re: [Qemu-arm] [PATCH v2 0/3] aspeed: cleanups and extensions
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +1W2WBpHFCX4

On 5/23/19 2:52 PM, Peter Maydell wrote:
> On Mon, 20 May 2019 at 17:32, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>>
>> On 5/20/19 3:32 PM, C=C3=A9dric Le Goater wrote:
>>>> Peter,
>>>>
>>>> do you want me to resend with only the two first patches and include
>>>> Joel's in the same series ? I would leave out the part Philippe is
>>>> covering in his object_initialize_child() patchset.
>>>
>>> Nope, we can not do that, conflicts arise. I suppose the easier is wa=
it
>>> for Philippe's patchset to be merged and then rebase.
>>
>> Eduardo said he'll send a pull request during the week.
>=20
> I am now completely lost about the status of these patches,
> so I'm just dropping this series from my to-review queue.

yes. It's ok.

> Please send a fresh patchset once any dependencies have
> got into master.

I plan to send a larger one once Eduardo's patchset is merged.

Thanks,

C.
