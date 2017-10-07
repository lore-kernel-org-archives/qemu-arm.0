Received: by 10.223.197.9 with SMTP id q9csp844323wrf;
        Sat, 7 Oct 2017 09:42:06 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDPPH5JgA2fTQzKIJgga9vQI4MQk5dp3LGaM7GfuVSvWDJDX4pKEQGvMasfikkW3ZzaQgF6
X-Received: by 10.237.44.34 with SMTP id f31mr3004332qtd.252.1507394526278;
        Sat, 07 Oct 2017 09:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507394526; cv=none;
        d=google.com; s=arc-20160816;
        b=kjRPEK/uXQ5kL6TQIA4v36fiaFBItH2+y7gSRYFvKJmr+j7X/9qy820+653/IIkHTy
         73PGrAhkgKo0dimsdPkbpwzBIKlCY4z2SrI4gFfJGx7OBbNCt4XgT1EcH0d3yIC8Av2O
         iDORQbOA8403JB3dgs0Jv+hCuPCS4yoh2+L0BNtutSI819zGMUYUk/5EwN8TmpzmJRib
         8eOLR5125S5UVk8Cc7D5OnWGv3nX653nzTI18EN+62UIKmjJOTpVD14hpg3U3CKb9ill
         EJeGXLfWlr8qHS0PWvpyyZ2DFIjKCVKpWat84zBA/WxXLjiITEF9S6GMNbNoumJfNP0t
         UNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=YkgIqRpMHqM8nBLNMw7iF73kxThNr/WSf/sud6bwmDs=;
        b=ahOt9/D6PsUM5OlI72p93mo1GB+7aUHWKuo7q0Jy2hE8qMN197r8tkyLoLEUnbWGZ3
         tUb68OF3CyZBnMLzVMpv6GSzx3F3X4Qi40hEBbcxxOZ3ZtXdK9nGRQrj0K2ER3izHC/g
         17aUdylJvqkGZaC+H5dcfywcdY6RLxRHXlhdAqrR8ARe7npVRrZA0bd1Vo5ysOpKUrLI
         72pehqMtn7MG7nF8Qj3+x9QkUqCEczDZ2S0Pkt45BwS0FMLyO0Q1R3mR9wQwQQfDEyJQ
         8Fow+rKT8+9SgcfcKqq3Kl6vL5W9grDfOBN6ZBkwl3vo9GGmQEXz/CviP3Mum+kSo3Yr
         OypQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s63si1212143qks.535.2017.10.07.09.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 07 Oct 2017 09:42:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0sAv-0006v4-P6
	for alex.bennee@linaro.org; Sat, 07 Oct 2017 12:42:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e0sAn-0006ss-3H
	for qemu-arm@nongnu.org; Sat, 07 Oct 2017 12:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e0sAk-0004C6-00
	for qemu-arm@nongnu.org; Sat, 07 Oct 2017 12:41:57 -0400
Received: from 8.mo177.mail-out.ovh.net ([46.105.61.98]:60168)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e0sAj-0004BI-Q5
	for qemu-arm@nongnu.org; Sat, 07 Oct 2017 12:41:53 -0400
Received: from player779.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id DFD7181C22
	for <qemu-arm@nongnu.org>; Sat,  7 Oct 2017 18:41:50 +0200 (CEST)
Received: from zorba.kaod.org (i15-les03-th2-31-37-69-229.sfr.lns.abo.bbox.fr
	[31.37.69.229]) (Authenticated sender: postmaster@kaod.org)
	by player779.ha.ovh.net (Postfix) with ESMTPSA id C7E127C0084;
	Sat,  7 Oct 2017 18:41:42 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-6-clg@kaod.org>
	<CAFEAcA-AnBaHadyHaOuS4648b3W3AXngMs9k9hCCDXyXBSLvTg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2a6d818e-4306-1189-cddb-79cc2eea8499@kaod.org>
Date: Sat, 7 Oct 2017 18:41:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-AnBaHadyHaOuS4648b3W3AXngMs9k9hCCDXyXBSLvTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 274156629267549124
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrleehgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.61.98
Subject: Re: [Qemu-arm] [PATCH v2 5/6] misc: add pca9552 LED blinker model
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pVUdbhgrd2u/

On 10/06/2017 05:12 PM, Peter Maydell wrote:
> On 20 September 2017 at 08:01, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> Specs are available here :
>>
>>   https://www.nxp.com/docs/en/data-sheet/PCA9552.pdf
>>
>> This is a simple model supporting the basic registers for led and GPIO
>> mode. The device also supports two blinking rates but not the model
>> yet.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
>=20
>> --- /dev/null
>> +++ b/include/hw/misc/pca9552.h
>> @@ -0,0 +1,32 @@
>> +/*
>> + * PCA9552 I2C LED blinker
>> + *
>> + * Copyright (c) 2017, IBM Corporation.
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or
>> + * later. See the COPYING file in the top-level directory.
>> + */
>> +#ifndef PCA9552_H
>> +#define PCA9552_H
>> +
>> +#include "hw/i2c/i2c.h"
>> +
>> +#define TYPE_PCA9552 "pca9552"
>> +#define PCA9552(obj) OBJECT_CHECK(PCA9552State, (obj), TYPE_PCA9552)
>> +
>> +
>> +#define PCA9552_NR_REGS 10
>> +
>> +typedef struct PCA9552State {
>> +    /*< private >*/
>> +    I2CSlave i2c;
>> +    /*< public >*/
>> +
>> +    uint8_t len;
>> +    uint8_t pointer;
>> +    uint8_t buf[1]; /* just to remember how to handle a larger buffer=
 */
>=20
> Changing this later is going to be a migration compatibility break
> (or at least a bit painful to keep compat).
> Do we know how big the buffer is supposed to be?=20

one.=20

> If so it would be best to make it the correct size to start with.

yes I will change that.

Thanks,

C.

>=20
>> +
>> +    uint8_t regs[PCA9552_NR_REGS];
>> +} PCA9552State;
>=20
> thanks
> -- PMM
>=20

