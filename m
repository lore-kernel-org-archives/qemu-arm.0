Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2536969wre;
        Mon, 28 May 2018 07:29:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIbmM7TMmYwjp8gNA9HsEXk/Sb3Op5Lk5F7ymM+smwNCh/6UuCOLSzmP626o/qf4/eqpfJR
X-Received: by 2002:a37:82c6:: with SMTP id e189-v6mr11152559qkd.322.1527517794596;
        Mon, 28 May 2018 07:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527517794; cv=none;
        d=google.com; s=arc-20160816;
        b=SZcXDuKhvm6Ph6apd50Cta1mzwJx27UPW6DdvUvCxOZQ45ep//v/OIpdU5fTJAPecj
         hEkaOwPUmaEaXqhuGzjEW307Bo2VO/C+AGVpRJhBiC0eV3djKnN14LRv3KDiJbuJGacf
         yumKvv0gzvYsyLSHaQPseXum6VVxwUKxylVGXwdksC7ILJF2cPVfCsLp3y8sVE/qogN3
         5Z/adFsdgweYs9VPh2ELpXqdIx1xghF9yKJfrMvAepj95OzZ00wkVoeQtEDt7skc7x0N
         pALYdyryTPKepw6ECHwoD6hX8C9dJMJMbnXDYZbNaGniiCwfBwi540m3wqvmiXpuwLfx
         LxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=ciWwWP1hIgykExERQLD3CZAzfJcTnvyo84csvXIXtSo=;
        b=tg0z7XyFB+zGaN7lrLAatVw22le51nQZxOcMyecB5hCL6/RQzocgrjn6e2nXLv7HtP
         eIXoKa/pDML2sJG0ui83YApHERwUyYrM2WVkBZjd4QNCTmFKY2EFNkrqNK8+zupe7EBG
         XYFOBokTxEwJw+uW3fc61qh1Htve86PsCI5l+atE0Zc6oJ11gbLwAxLEnhrwxd1BhR9e
         X5Dus1Qv4Dk2yu52F99GS0E5BaNEV4LpOH00Dm47g8Y7C5M/tRF32l/622lNMIJQFAIr
         00MPwy5ChPoXhjRPda7E7Z7/97ykudayzAbHJkRt8/wsrXP2Ox8XbsN0xWmguZv4xPn2
         d5rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o/dVGpj+;
       dkim=fail header.i=@jms.id.au header.s=google header.b=BRSb8LIf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1-v6si1368242qvc.198.2018.05.28.07.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 07:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o/dVGpj+;
       dkim=fail header.i=@jms.id.au header.s=google header.b=BRSb8LIf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNJ9m-000592-3V
	for alex.bennee@linaro.org; Mon, 28 May 2018 10:29:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNJ9a-00057V-AX
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNJ9Z-0002Ki-An
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:29:42 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fNJ9W-0002Iq-Px; Mon, 28 May 2018 10:29:39 -0400
Received: by mail-qk0-x241.google.com with SMTP id h7-v6so2109995qkm.0;
	Mon, 28 May 2018 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=ciWwWP1hIgykExERQLD3CZAzfJcTnvyo84csvXIXtSo=;
	b=o/dVGpj+h/e39WRulIg9k7Cvx7BWu8OoI5DhNYow+50om6bnpxMGPn/ERqT1j8wuCR
	fRXzkRWuA/OmD68KnqDFWqqkGbAMAx6jyHzXxLUbmNvsmTNb1Ksmun4zWRdbpxxRzU8S
	RcyjfGSKlgxJNOoIDGiE+svJ+Go0BzQjF3JqNw2KuTxvQFvBdF/QuwXDBVaoGwtpq1XC
	8CQVYWy6FiMJYEKj9oGBg5pzDZVP0r4hMHXvUKt18kO+w0u0nDVGBN5XkXd1U96vJ4zU
	csLYjLC9qXjdMr0gwzne2CXd/2Cu2v3AQU01poTQbtrmEnMEJkP3hTl9VqYG3w2ABTif
	OZKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=ciWwWP1hIgykExERQLD3CZAzfJcTnvyo84csvXIXtSo=;
	b=BRSb8LIfiJYtCKF1eEPhWkPNf29Y2YBuvL8PJyHlLquG1WADwhugngO6BkK1jTh2gk
	b6elORNEODNGach9Emkjmx0GnS5QGBTW2L6mke/vVs5ZOPwzthO52FOxWkncIoK0IohG
	VImPIidWNtog+pI2qmsqnuOnuLhrv+a5BR8SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=ciWwWP1hIgykExERQLD3CZAzfJcTnvyo84csvXIXtSo=;
	b=YAR7E2g2cVaMoAlm4VdLmtiwmk1jO8IpWpCEt/x/kUnFZwvEYUs6vo2WqeWMlEHP7q
	ct+xI0jq9slSWeLsHxour5faZKNL9RQoCv0OAne8W9qFu83afLrDle9TwhkLfXQK+z39
	TCH23r0FVygwxNyE+3u7JVlMjGc9THQDk6r7HnEZlDWfLXR/LwFJXR7QfOCHNxy+5ndP
	FLWzxfm1Nhzt9xC6vKAsjEPTEz5hjoIAuyV3Bal/DsSXtaj6mtX2jefDcwFGkJTt+0tV
	x3ZUmvGSkfkYG5pG3IQUl5oKTzhn1BE2B2quQpblqo7LPAMC3FoDaeymbloLE2MmpGZO
	nMbw==
X-Gm-Message-State: ALKqPwe60bGAvHbWbi/tyexVnpHiY/fJTwFOlAan0GxyFR8BaPNZDyUg
	v0HyTHZpwl1BdMLabvk0FdQQ8bWnkm4IAEJPSf0=
X-Received: by 2002:a37:1314:: with SMTP id
	d20-v6mr11698766qkh.422.1527517778077; 
	Mon, 28 May 2018 07:29:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Mon, 28 May 2018 07:29:17
	-0700 (PDT)
In-Reply-To: <CACPK8Xe5+-zVfoS-g2Te7YOuT5emT-i=JsNDrF52WLVzLERQcw@mail.gmail.com>
References: <20180528124621.22977-1-joel@jms.id.au>
	<9959794d-6d3b-b797-bfc8-b548d54378ad@kaod.org>
	<CACPK8Xe5+-zVfoS-g2Te7YOuT5emT-i=JsNDrF52WLVzLERQcw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 May 2018 23:59:17 +0930
X-Google-Sender-Auth: jYpH0nOGOOl3n4Lo_LzHRzMmkW4
Message-ID: <CACPK8Xc1xwKBoYYQW0Uzd4keBjspw3uasdTx5OyikaxPmZacgw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH] aspeed_scu: Implement RNG register
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
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u1KrfJK+xRlr

On 28 May 2018 at 23:33, Joel Stanley <joel@jms.id.au> wrote:
> On 28 May 2018 at 23:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Hello Joel,
>>
>> On 05/28/2018 02:46 PM, Joel Stanley wrote:
>>> The ASPEED SoCs contain a single register that returns random data when
>>> read. This models that register so that guests can use it.
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> ---
>>>  hw/misc/aspeed_scu.c | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>
>>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>>> index 5e6d5744eeca..8fa0cecf0fa1 100644
>>> --- a/hw/misc/aspeed_scu.c
>>> +++ b/hw/misc/aspeed_scu.c
>>> @@ -16,6 +16,7 @@
>>>  #include "qapi/visitor.h"
>>>  #include "qemu/bitops.h"
>>>  #include "qemu/log.h"
>>> +#include "crypto/random.h"
>>>  #include "trace.h"
>>>
>>>  #define TO_REG(offset) ((offset) >> 2)
>>> @@ -154,6 +155,18 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU=
_NR_REGS] =3D {
>>>       [BMC_DEV_ID]      =3D 0x00002402U
>>>  };
>>>
>>> +static uint32_t aspeed_scu_get_random(void)
>>> +{
>>> +    Error *err =3D NULL;
>>> +    uint32_t num;
>>> +
>>> +    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
>>> +        error_report_err(err);
>>> +    }
>>> +
>>> +    return num;
>>> +}
>>> +
>>>  static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned =
size)
>>>  {
>>>      AspeedSCUState *s =3D ASPEED_SCU(opaque);
>>> @@ -167,6 +180,9 @@ static uint64_t aspeed_scu_read(void *opaque, hwadd=
r offset, unsigned size)
>>>      }
>>>
>>>      switch (reg) {
>>> +    case RNG_DATA:
>>> +        return aspeed_scu_get_random();
>>
>> may be we could test bit 1 of RNG_CTRL to check if it is enabled or not.
>
> The RNG is enabled by default, and I didn't find any software that
> disables it, but it can't hurt to have that check.

I did some testing on hardware, and the rng still outputs a different
number each time I ask for one regardless of the state of the enabled
bit.

How should we model that?
