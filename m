Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3140620wre;
        Mon, 28 May 2018 21:22:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKQp4CYCnTXFC1kqX5X5d5eckGByD5LhGpR60z7jxhf3qMcGxFIrwvnWnZGTSQCbT5R0Aph
X-Received: by 2002:ac8:668c:: with SMTP id d12-v6mr14702076qtp.344.1527567756592;
        Mon, 28 May 2018 21:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527567756; cv=none;
        d=google.com; s=arc-20160816;
        b=XB0OsB4dJTahiVODJxDrfuc5svWQJ+U850aKJz8YtlN6e2lXEIM6cdBRV5kNsvUoBX
         Hph6QFU6GRD1YgxIxyZ/g9NMm0xthlBLZT8zv2wwFp06nKW3BLE9UjRjvU0pYN6NcJOG
         71oXzyiEMgkzMVKdN2y8hZMQwT6ycFi5k+SheZxOpHQvR1XSmV4+q1nQcjftoitgX+XZ
         6qDl0zlW5FmORitNxeDkQKxxXGOiUvc4oJAaxD2YiPWi9ICNW1bYvG+sl0MlvJ1S5Ag+
         ucy3z3mtRIwMROcUmx5ADcXfPbGQMo+BjQMElEZcNEMQen5DDXED2ycFmsFt1Q6pPFVU
         F+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=MAdEXnHLYqRJOHEjpHwpyVtZ0yYq78UM9Keyl+9x8lM=;
        b=anJkPmowr0bzSTICnHGIhgF/AIKu+vycQ3uV5CKolvldLjDWZpB2vcDWnjwBvX42ow
         VZrgdvPCDLHyG1jxXj4CjQkSYkkKlfaFuCHWuA7dXcMvEXy+iz8ZCSrblHawxwmXNJmK
         FvgZh810sUv7booqJwobZa6m/onukFcf6RDQrRR6r9dHNIuFSrAw9s/HCcMoHRi0dUy+
         tfLbfWyLOyy+AhSoscy+eS6tzO/4BhMbbPWRV7Rqp9eBzLVsY0xLei15KV7YFstpGK2/
         cdBr9FgZdxYyeCwMBa/VTO/FA16JDx9yOZr2NXgRvURm0dHTdFeY/LXrKJgNLNJ91Glf
         219Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N14XguKx;
       dkim=fail header.i=@jms.id.au header.s=google header.b=dVK9V/hp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6-v6si1853339qkf.216.2018.05.28.21.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 21:22:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N14XguKx;
       dkim=fail header.i=@jms.id.au header.s=google header.b=dVK9V/hp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNW9c-0008Nn-2z
	for alex.bennee@linaro.org; Tue, 29 May 2018 00:22:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNW9T-0008M9-9N
	for qemu-arm@nongnu.org; Tue, 29 May 2018 00:22:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNW9S-00022y-6v
	for qemu-arm@nongnu.org; Tue, 29 May 2018 00:22:27 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:40618)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fNW9P-0001xu-DH; Tue, 29 May 2018 00:22:23 -0400
Received: by mail-qt0-x229.google.com with SMTP id h2-v6so17103807qtp.7;
	Mon, 28 May 2018 21:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=MAdEXnHLYqRJOHEjpHwpyVtZ0yYq78UM9Keyl+9x8lM=;
	b=N14XguKxoxonTvPYIH+E2Xn/RmaLYmkCivZ+9RXOvrDJJ7msCN5+otVmuowupWLtEM
	AObetmw1tq+toV0QeytEbcKWBMJ4SCwDzjbBFyyf4qgjfXSLbdE4RqAkH3HxlLIQfL1c
	LI1wNcZNLHRgi9xe87bNMHZpVBWGa8VK7Dsutb+29K6kWBb3NKY8b1lO327Zz4u+ow76
	0zyBOPDrJDORDmM44l19Lg5eJVVN+wVuJjFbbrx+rYhsBU9eQ9T09i/bSvLrUZYjaom4
	+f33Bh+SpwEsB1dYnScKq/dIVBYSCostY/SyZBpuzlV9Zhd17lPXCqFptIx0j5IqnEYC
	djMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=MAdEXnHLYqRJOHEjpHwpyVtZ0yYq78UM9Keyl+9x8lM=;
	b=dVK9V/hpa8vKapuSQeQb4Vsf+TNw812L1qIjsC0YecuPJGjsQYIiYkAP03gQPT8QnG
	pzuZ7wksadE1wfphDQLV6ywgUgLi2+Tt49KUDJAwbQ0IpXcEZMJFUgZup7HHEImkOQOr
	gqRJdY8LEvYtFmO4M2MKS0sMb+y17B67fcKVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=MAdEXnHLYqRJOHEjpHwpyVtZ0yYq78UM9Keyl+9x8lM=;
	b=B4ydt54pcdbUPScpXpk3oWrcvgFy53Ya+wlBV27wLOyG8CNdw6rArphW0R5fyt5Dcq
	zLh1YGvVZaGVGJwKvyDwnHsXvO+9ku18mFL/yrRcIzcW5X/JisSgZurwr2JDaFFbumcH
	Zkf26Dxyp9jUBYdI9qrHN0qyJiURLxYfwzA2avEX6rP3CZwkxxLNTl99xkPVxSLBAZPu
	LznPBFhP0TU9tWUlZmNvLKzmZ/TdsJaJZaL6Hd6dFFsE1Uf0Se2f/HXxxPSj+7Ddi9lK
	UEg15bjsBT3DSMXX7f9yLtUerXa1zN+ZZoWKXtlwQ+RHsPIeW0MXHa2f4bxJE4tDtLmK
	y5yQ==
X-Gm-Message-State: ALKqPwfhe9/Yhuwl+l36uQbnF3N4FiY1zfkyNzX5ZO/t3YcWUs0kANFr
	vCMcue0UeIUuC6pXIBJkbD54w9yMlmeEwGqpTl4=
X-Received: by 2002:a0c:8cc5:: with SMTP id
	q5-v6mr14566434qvb.60.1527567742678; 
	Mon, 28 May 2018 21:22:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Mon, 28 May 2018 21:22:01
	-0700 (PDT)
In-Reply-To: <45bcd928-b328-0a0b-a0a2-6b4c4f0b560e@amsat.org>
References: <20180528152225.7108-1-joel@jms.id.au>
	<45bcd928-b328-0a0b-a0a2-6b4c4f0b560e@amsat.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 May 2018 13:52:01 +0930
X-Google-Sender-Auth: 0rMrSuRa3hMHtt9WeZGnHoj1984
Message-ID: <CACPK8XfyPwPrFjMUBKLdYgF=0qNZKXi3KT5OvUnELsAO9W9siQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] aspeed_scu: Implement RNG
 register
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
	qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BRRmhYWRDykK

On 29 May 2018 at 01:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Hi Joel,
>
> On 05/28/2018 12:22 PM, Joel Stanley wrote:
>> The ASPEED SoCs contain a single register that returns random data when
>> read. This models that register so that guests can use it.
>>
>> The random number data register has a corresponding control register,
>> data returns a different number regardless of the state of the enabled
>> bit, so the model follows this behaviour.
>
> I have been bugging C=C3=A9dric to check specs for the RNG_CTRL register =
and
> he sent me the v1 of this patch than I missed:
>
>     >>> may be we could test bit 1 of RNG_CTRL to check if it is enabled
> or not.
>     >>
>     >> The RNG is enabled by default, and I didn't find any software that
>     >> disables it, but it can't hurt to have that check.
>     >
>     > I did some testing on hardware, and the rng still outputs a differe=
nt
>     > number each time I ask for one regardless of the state of the enabl=
ed
>     > bit.
>     >
>     I confirm that the HW doesn't really care about the enabled bit.
>     Let's ignore it then ?
>
> Now your comment makes more sens, however I think it would be more
> useful to add it in aspeed_scu_read() to make it obvious.
>
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> v2:
>>  - Remove call to qcrypto_random_init as this is done in main()
>> ---
>>  hw/misc/aspeed_scu.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>> index 5e6d5744eeca..29e58527793b 100644
>> --- a/hw/misc/aspeed_scu.c
>> +++ b/hw/misc/aspeed_scu.c
>> @@ -16,6 +16,7 @@
>>  #include "qapi/visitor.h"
>>  #include "qemu/bitops.h"
>>  #include "qemu/log.h"
>> +#include "crypto/random.h"
>>  #include "trace.h"
>>
>>  #define TO_REG(offset) ((offset) >> 2)
>> @@ -154,6 +155,18 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_=
NR_REGS] =3D {
>>       [BMC_DEV_ID]      =3D 0x00002402U
>>  };
>>
>> +static uint32_t aspeed_scu_get_random(void)
>> +{
>> +    Error *err =3D NULL;
>> +    uint32_t num;
>> +
>> +    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
>> +        error_report_err(err);
>> +    }
>> +
>> +    return num;
>> +}
>
> This function duplicates bcm2835_rng::get_random_bytes() except it
> doesn't exit(), is that on purpose?

Yes. It's not fatal to the emulation if we can't provide random data.
The aspeed model is used for smoketesting firmware builds and aiding
in firmware development, so strong cryptographic guarantees are not
essential.

> What about refactoring, inlining bcm2835_rng::get_random_bytes() in a
> new include/hw/misc/rng.h?
>
> (This can be later patch)
>
>> +
>>  static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned s=
ize)
>>  {
>>      AspeedSCUState *s =3D ASPEED_SCU(opaque);
>> @@ -167,6 +180,9 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr=
 offset, unsigned size)
>>      }
>>
>>      switch (reg) {
>
>        case RNG_CTRL:
>            /* The RNG_DATA returns a different number regardless of
>             * the state of the enabled bit in RNG_CTRL,
>             * so the model follows this behaviour.
>             */
>            break;
>
> With a comment:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks. I don't think it makes sense to do this for the read case, and
it was strange to find it in the write callback, so I instead added a
comment next to RNG_DATA.

Cheers,

Joel
