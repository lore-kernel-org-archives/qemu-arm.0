Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp172745wrg;
        Mon, 20 May 2019 06:33:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEv+5k4L7h2h1GtIjYHjPM52xQu2w7FLUhdRUSSUdYcTPfhcx7JMeiUwFpvaJYxh3Wsgc7
X-Received: by 2002:a50:9705:: with SMTP id c5mr76711055edb.258.1558359185023;
        Mon, 20 May 2019 06:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558359185; cv=none;
        d=google.com; s=arc-20160816;
        b=bvW1V5/gkzUYgCzBnWcqQ8OB1t3FHqw9O+1IARLKD1xVcaUVuwVJeKrddhhSlKagcT
         5bkfr+7XIRixLoS5oXm4zm4U8HD+9xUgoShn5WEZ2gd9mZsFmEXLgdCTydh869rAR+J4
         Btv2i/1S0/3SrRpkuvR4/oZrSVsULYUmI54QIRnwkGrUOOjymvyMClWNmTNnjhiuiy1c
         skjwwwS+dAvTw42KG7qXzJV3EVKRATxzKZ185VVxgXxygKqjqj2/QW0BN1VmHJ4b3ftE
         ULLnvlwcVhCrqlpwI6M3ATR4oEK4NM90Z9NSqDKeI0XUSMO+9sSg1gCs5k5LwXQCkvpv
         GtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=RfCFj1Jr4H03ZgNrZFqFQ+uHjzRTCM8958+fJnGGDdY=;
        b=J0cFZ+0p7Z8uma7soYEufaRKZZFTCrSOofyyGaDux6g6kVlmZcbnqREqUob1wQ1bTn
         05vvwnjRYa6f+UV2j59gRNC7+b1kTJy2f1SOWNPJOPSetvki3S6uyrkEazpDvcesJ9O4
         h+vQmaLL0lB89eqjF1KlHQoWVpssxeE0+yLX1Rl3+zT7hz8hmd4PPVxPkCBUSpcNO9Rv
         ETMCzBwfGGGf43WvtExlTwkhLPWI72DFpCbciWgbwZ7C7lmxd3T8USYhithbD1Mu8mTm
         6ccdpVWGQUmbGAT3RM6BWg4dLuS6Sf179GZeyERooffLb+nbYQ7fBNipRvzvOYwDdrIZ
         CmKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si1534484ejc.204.2019.05.20.06.33.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 06:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSiPY-0001kj-1v
	for alex.bennee@linaro.org; Mon, 20 May 2019 09:33:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hSiPH-0001it-FI
	for qemu-arm@nongnu.org; Mon, 20 May 2019 09:32:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hSiPE-0004ix-BV
	for qemu-arm@nongnu.org; Mon, 20 May 2019 09:32:46 -0400
Received: from 2.mo179.mail-out.ovh.net ([178.33.250.45]:60822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hSiPD-0004h5-2E
	for qemu-arm@nongnu.org; Mon, 20 May 2019 09:32:44 -0400
Received: from player738.ha.ovh.net (unknown [10.109.160.244])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id B88AD12BDC2
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 15:32:39 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n0.emea.ibm.com [195.212.29.162])
	(Authenticated sender: clg@kaod.org)
	by player738.ha.ovh.net (Postfix) with ESMTPSA id 2E209612991B;
	Mon, 20 May 2019 13:32:30 +0000 (UTC)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190506142042.28096-1-clg@kaod.org>
	<b12201c8-7d5f-2108-6666-75543c38f243@kaod.org>
	<f1ca56fd-c83d-8ad6-29c9-a8fc6af4531c@redhat.com>
	<270e510b-687a-6b43-8cd6-c1eb1aea41e6@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6161d982-0d21-99d6-680a-37ae300fd7cd@kaod.org>
Date: Mon, 20 May 2019 15:32:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <270e510b-687a-6b43-8cd6-c1eb1aea41e6@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12427401697295895467
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtkedgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.250.45
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s/bEktDsH3NI

> Peter, 
> 
> do you want me to resend with only the two first patches and include 
> Joel's in the same series ? I would leave out the part Philippe is 
> covering in his object_initialize_child() patchset.

Nope, we can not do that, conflicts arise. I suppose the easier is wait
for Philippe's patchset to be merged and then rebase.


C.
