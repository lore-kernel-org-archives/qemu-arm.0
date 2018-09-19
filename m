Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp285969wrd;
        Tue, 18 Sep 2018 23:29:33 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdakCem5Hx+KrMDjB5VI17+ALKfsNXueJF0/QZX/CRuV6fOMSuxF8r6s0qrBwLIZ61C8Uiw7
X-Received: by 2002:ae9:c109:: with SMTP id z9-v6mr22893857qki.290.1537338573646;
        Tue, 18 Sep 2018 23:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537338573; cv=none;
        d=google.com; s=arc-20160816;
        b=Jy8fpXcsmB+B92iWHfIni/dh1kFUS4JMKdgQMEuZNpobVLHrN21Vd0jK1wPl9gq8BF
         7dIVshXyGRVgYCYrt/pyAzFTT877im5jasZAeouiVenMSvLoHYtWzlWSB+7EwqAvo4G6
         9hDX+hUauGJdJZsIicqeMa+kS3S0++f5m+JVGxe41yAgLPFMnFpHD78+NQc7BT4uTYlE
         xc1FsYP5DgdfLr08NI+WEl6T4jkmWD0uGxIwR2Y7aDnECMQ5Xl12sGtBiDLG667QaF8v
         wrBmNSJv82fag/SF8oAWYNw1HzO3Tw231Kkgc91DP/YYWm5+bnlwgESfpOGzIsYrQmPg
         HcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=3d5Ppd3YWOuGcACw3WOM9HMvrL53ZV0BsYHNbaKHyuc=;
        b=srrgWrsJ7yEQXFsv2WePjWn5lc7wQLX0MTFanFl9xF+ZIXO7Kcq9P/Z01exl4ivb9Z
         8b8Q+TWoMjTT827ONatv2QZG8HWVdB4BUmicAJvzysNIRDJmgDmeantztopNe4rOTu1e
         JZjle3hbaui/CmpKdhIOnVWrKzzLg7Ru8/Wr05Yxh1NRzw5eVaZqEyBwUOMCfxvHHO8X
         WXSjjjA1zkF7SppP6ZosXHphM9QmV3EkmK8kN39CzTtzKv8S6APwVpaDn4buVDAGh+MX
         KjWJwq6VLXe3fN9YlhWcQsTIqQq9JzAo5ICrxV0bYG2oHlPYn/9iRIBK3j+sUjehMnNF
         bmvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14-v6si2646367qti.5.2018.09.18.23.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Sep 2018 23:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2VzR-0006KZ-7u
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 02:29:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2Vz2-0006KJ-VF
	for qemu-devel@nongnu.org; Wed, 19 Sep 2018 02:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2Vyy-0001os-4D
	for qemu-devel@nongnu.org; Wed, 19 Sep 2018 02:29:08 -0400
Received: from 20.mo4.mail-out.ovh.net ([46.105.33.73]:37350)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g2Vyx-0001no-SC
	for qemu-devel@nongnu.org; Wed, 19 Sep 2018 02:29:04 -0400
Received: from player738.ha.ovh.net (unknown [10.109.143.225])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 7D0361B0E68
	for <qemu-devel@nongnu.org>; Wed, 19 Sep 2018 08:29:02 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player738.ha.ovh.net (Postfix) with ESMTPSA id 0F0DE226;
	Wed, 19 Sep 2018 08:28:56 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-4-clg@kaod.org>
	<CAFEAcA_61srcBba4Q=QoOPui35HeJ8m0S93DHkBcm5Kenp+1JA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b1b2e2c9-967a-bc80-24e7-a6f8f2f9bd6e@kaod.org>
Date: Wed, 19 Sep 2018 08:28:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_61srcBba4Q=QoOPui35HeJ8m0S93DHkBcm5Kenp+1JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17054568841026964306
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrkeejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.33.73
Subject: Re: [Qemu-devel] [PATCH 03/11] hw/arm/aspeed: Add an Aspeed machine
 class
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O/YDHWm2U4ky

On 09/18/2018 08:40 PM, Peter Maydell wrote:
> On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> The code looks better, it removes duplicated lines and it will ease
>> the introduction of common properties for the Aspeed machines.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/arm/aspeed.h |  46 +++++++++
>>  hw/arm/aspeed.c         | 212 +++++++++++++--------------------------=
-
>>  2 files changed, 116 insertions(+), 142 deletions(-)
>>  create mode 100644 include/hw/arm/aspeed.h
>>
>> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
>> new file mode 100644
>> index 000000000000..2b77f8d2b3c8
>> --- /dev/null
>> +++ b/include/hw/arm/aspeed.h
>> @@ -0,0 +1,46 @@
>> +/*
>> + * Aspeed Machines
>> + *
>> + * Copyright 2018 IBM Corp.
>> + *
>> + * This code is licensed under the GPL version 2 or later.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +#ifndef _ARM_ASPEED_H
>> +#define _ARM_ASPEED_H
>=20
> Leading underscore followed by capital is a C reserved
> identifier. This should just be ARM_ASPEED_H.

Ah yes. I will fix that.

Thanks,

C.

> Patch looks good otherwise.
>=20
> thanks
> --- PMM
>=20

