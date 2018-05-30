Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4306047wre;
        Tue, 29 May 2018 21:22:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLFqnRZLc3qzpjhOehgaPZ+qF8ALmU5hqnDlKK+RikSuNzLFpCLF2ltpMVh2XZYhxBYCuKS
X-Received: by 2002:a37:2a8e:: with SMTP id q14-v6mr1031521qkq.380.1527654178778;
        Tue, 29 May 2018 21:22:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527654178; cv=none;
        d=google.com; s=arc-20160816;
        b=klSInG2KDYgDD9owQPqNeFWLDqa7vL1ISUcfXflRmcq+WzoqOUYAVjUnkQX9ca+EZj
         IQ7gqE/QI5EuuX+LgphWbuQ6rosHcYe89Aq6d5Cv+lFUSDOV8PFCjJAnL/4Q0su7UAiY
         x2QxWDagNBu7IT/nK0Sp4t1ibuzbKrDJVpdojriUr8fvqHFxvUsUobFgTxYcBC+p/uYb
         +lo1mKIfBkx1pYqrPrjBXLXCYw2/pzw4pJULJ6kyxwhuFfEPsN4gTklOFBFEWj+HtMY6
         uWjgWkrY30mOocG9wvjtJaE6EGXbVj0ytEfxQwAj3mBK6Yc3dAjpDKYUMqGvCJocSHUX
         fIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=aS16ySES7C539vrw68iJEtl7Wzq7DsnT9V0bunrfE0s=;
        b=kN5QLpzjPPAb1t+2oPg+FDrHYN61ieyvX3LZdt+25GKgk/iZ3Ky5bH/PsBqhEDcd6O
         vJYz+wQ5eP/SClryGYvUJzcPyHiCYgrlcEy+lZYlcTtz4lB8CcR548PzDZ6CS7vaoMpI
         b8Hy2Nr2QORVuyvrkr/HmuEHYwLLw3qwseNTndTYUffOL/mNliBVd5G+vW4Jwo8xH06f
         7hx21j5Bxj/xM/iMv88ti8txflTLTtElgZtRq4dV1A7xY1cQ9tXXpFCo8OtHW5/rG8Qy
         nAVZjta907+rzLBcRZA2OsisegbrohkUNvJmLvOUCIBTrYJgjDNGRgYc4VAfcjnGh2uM
         p9gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VFYMRikY;
       dkim=fail header.i=@jms.id.au header.s=google header.b=RZAJ/a57;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h11-v6si3444653qth.29.2018.05.29.21.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 21:22:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VFYMRikY;
       dkim=fail header.i=@jms.id.au header.s=google header.b=RZAJ/a57;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNsdT-0005Po-P7
	for alex.bennee@linaro.org; Wed, 30 May 2018 00:22:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNsd5-0005PW-UT
	for qemu-devel@nongnu.org; Wed, 30 May 2018 00:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNsd4-0000hv-RS
	for qemu-devel@nongnu.org; Wed, 30 May 2018 00:22:31 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:42771)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fNsd4-0000hf-Kk; Wed, 30 May 2018 00:22:30 -0400
Received: by mail-qk0-x244.google.com with SMTP id j80-v6so11626721qke.9;
	Tue, 29 May 2018 21:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=aS16ySES7C539vrw68iJEtl7Wzq7DsnT9V0bunrfE0s=;
	b=VFYMRikYxIvG4I/dBH0PVB8FcoTVokY/iPCIKMBQMedmOYzFrOZlqS25BuOUR5CNSX
	YDMojOOd5L9b2HsPrNe5U2fPRx25G+82OqByPcrhdK+Nr1cTNs7LH6kV5raOs8zBctmx
	E8aqji6HztGE3WghXpsR8vivPiqHnJal5ILFLN8yK/p+Gi+Uafzli0wmrz72JOH83pqb
	LEsW0Lix53yXqRzO2dtO9lH+5dPotZs3N/CKlyJnWkNq6dY+wQzwaYE1gF9m/nkXzb6J
	rHEyG+Qv4Uqc6sw+tKBMaEf3zc8AiU9J9yZV/TnnaGJkgUf5Pz3MnkB22W6KEUZpUqh+
	U/YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=aS16ySES7C539vrw68iJEtl7Wzq7DsnT9V0bunrfE0s=;
	b=RZAJ/a57N2UdeBgjXFni6A+nHJUZ0H/VZubQ2U3jJ+sbkV7+jaCqHGaw7VrlxJpLKZ
	auOKGGTBu/6JBUvI9FwRIFnbVIBdiPkc9tgKOOtaomKL58Ux+J3Q9ccG4+ncIi3skOTT
	+G5iE1gH/Eb3lckO4NBU0bedDNRRoHgSou2cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=aS16ySES7C539vrw68iJEtl7Wzq7DsnT9V0bunrfE0s=;
	b=lBhwdmm4m9uuhMSIcoUfv28kVDL2sRZMp7IEwJ1rxvvx5RNbg9QhbxPPmiRJwycqp8
	0Nkr+otVCgiDZ6hqF+X1bRh4Kihl89vtCt0JklP3Q4CeM8mcVR07fOBJpwMG1vMkjF0d
	3T54i48edm0ptyA1T2d5U09hznNQzS0O47/XDalD+87xVXpel6UVZ5cXRjK6oZcresls
	56/FQPKeMLWZq+C8kWxls4s2wluy5F2NXMEKfh1HgPjfrUtdSUMqt1kqIwl2ToN8vvh8
	Rm669Sc4TKBPtu55O4Xr+GF+WG97Xaz1zM4j5+l0O5CmGnOql9imLnhG7DDs4D88GNIx
	sl4w==
X-Gm-Message-State: APt69E2csflgL3X7xwpZl2TdOFfVnj+IGdTIb3+/LS7iPGjo2NFcnIn/
	VQJKJfqg0EH9rjBheYxUoL29hFmN7585vubefrE=
X-Received: by 2002:a37:1314:: with SMTP id
	d20-v6mr992715qkh.422.1527654148469; 
	Tue, 29 May 2018 21:22:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Tue, 29 May 2018 21:22:08
	-0700 (PDT)
In-Reply-To: <CAFEAcA8H66jcoi2FXWPRpyoQ4OT955awzLEj+gMKTMctoYxqEQ@mail.gmail.com>
References: <20180529041946.9481-1-joel@jms.id.au>
	<CAFEAcA8H66jcoi2FXWPRpyoQ4OT955awzLEj+gMKTMctoYxqEQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 May 2018 13:52:08 +0930
X-Google-Sender-Auth: Zl5L5zRplZ19XDZPW5HNYhxklAo
Message-ID: <CACPK8Xcf8m+MfJjJWeqs5t1UkgfBaGr5T47N_0bmNqtR99VgkQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3] aspeed_scu: Implement RNG
 register
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /YSHV5l+SnCu

On 30 May 2018 at 00:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 29 May 2018 at 05:19, Joel Stanley <joel@jms.id.au> wrote:
>> The ASPEED SoCs contain a single register that returns random data when
>> read. This models that register so that guests can use it.
>>
>> The random number data register has a corresponding control register,
>> however it returns data regardless of the state of the enabled bit, so
>> the model follows this behaviour.
>>
>> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> v2:
>>  - Remove call to qcrypto_random_init as this is done in main()
>> v3:
>>  - Add C=C3=A9dric's reviewed-by
>>  - Add a comment about why we don't check for the rng enable bit
>> ---
>>  hw/misc/aspeed_scu.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>> index 5e6d5744eeca..96db052389cc 100644
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
> This will return an uninitialized value if qcrypto_random_bytes()
> fails.

Good catch.

> Does the guest use this value for cryptographic purposes?

The guest runs Linux, and Linux has a driver to expose this as a
hardware random number device.

As I said in the v2 thread, the aspeed model is for smoketesting of
firmware builds. I can't imagine a situation where it would make sense
to run a production BMC workload on qemu.

> In hw/misc/bcm2835_rng.c we opted to make qcrypto_random_bytes()
> failing be fatal (for reasons noted in the comment there),
> though that is a bit rough. exynos4210_rng() is more conveniently
> able to just never report to the guest that the PRNG is ready.

The hardware doesn't have the facility to indicate this to the guest.
If we want to be strict about handling the case where qcrypto has
failed, I will implement the same error handling as bcm2835_rng.
