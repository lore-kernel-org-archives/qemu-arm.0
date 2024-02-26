Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2310127ejf;
        Mon, 26 Feb 2024 13:21:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXGkzOPVEpfQ/QYIcbSNapFKaX/f4boCDLaOIG52JxiFKA0zoXVdsO0G4MEL5PkasX0uFfW1CKxNTYpQWDMpNyhRJNppxd
X-Google-Smtp-Source: AGHT+IFFW7aYB3Nb6c5TC9xrpNyleuuT/ksTee8gaVs7+vCPAjeLlxMD1rI5FArIt2A2emlHrWN5
X-Received: by 2002:ae9:e10e:0:b0:787:273e:229e with SMTP id g14-20020ae9e10e000000b00787273e229emr232490qkm.68.1708982468704;
        Mon, 26 Feb 2024 13:21:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708982468; cv=none;
        d=google.com; s=arc-20160816;
        b=BAxpK1WAq9OTSVKtQe/bT+CiMm1C0Bg1k9AxwjFKX/UQXparOTjdwAvtmvRSd0BCZs
         NBDchUqC86sFmXCfb5hJUuH/knyErpj8Xp9hi1n3hIO53QXpzX2E8bICYKzuOzeQ8Gkb
         0k6IXCZeFDSm1+KcVfr0iJ9Y08cvHoMKNhIbHPtD9DoQTJOg5ZOozCtdDRbtlR74KVml
         j25liLfdK0IyZ5cCvrmCGgGUZmZ6+pGqBeQD99IS3E4vWbQV+qg45+MOjRl2ShLlGodT
         2U6q/OlbVsB1fU9MF215zUglI+MtIqcM/20KjnEATVcv01ozRfa+zs41cD0d8A6MboZk
         tL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:thread-index:thread-topic
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:dkim-signature:dkim-filter;
        bh=oDDqEa7TVP+PicOhICN0EDwccbVAw447PBX5Y4cT60Q=;
        fh=CcJsKI3Q5RSpk4JXtvWqf9aIQ/1616cRHFkObVE+sjY=;
        b=bOSIgLuLqv+BN7fQEYWjLiC3b9OHjASjeYmGbQ/awFdI4KrYvRZvmM8uLzHsWblXWZ
         EAkxMHLhp6vMZn2zESJ2qsYKLFi32Hbz9DOdFz9m4Y55tMumw2pECK/ZWoU5IDzbve1m
         IfcMx3idAAhBQ/7kp823bPMBDZfuKzq5pggeGQXWyJvFcisDhAoXwnc13u+zrwi6oC9b
         kOSsHuxorjqXFaWdqDGSBjih5/CH3+/bPFSK+BipQVvr41Y9Q6lV06zEg6yp0ENF3ujD
         96VYk589d3kOnGIdK98tPqaFpXjvkoonx6MF/+/oQ5uG8oWn1638H4WDEKBuA2Fv804d
         P3RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=2PRTloHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020ae9f713000000b007878ab0c231si5802433qkg.753.2024.02.26.13.21.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 13:21:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=2PRTloHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reiP6-0002CR-2l; Mon, 26 Feb 2024 16:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aminier-21@enst.fr>)
 id 1reiP5-0002CA-71; Mon, 26 Feb 2024 16:20:51 -0500
Received: from zproxy4.enst.fr ([2001:660:330f:2::df])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aminier-21@enst.fr>)
 id 1reiP3-0001TO-2Y; Mon, 26 Feb 2024 16:20:50 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 08F452055E;
 Mon, 26 Feb 2024 22:20:45 +0100 (CET)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id 9g5ojEoZDx7I; Mon, 26 Feb 2024 22:20:44 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 121F7205AE;
 Mon, 26 Feb 2024 22:20:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr 121F7205AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1708982444;
 bh=oDDqEa7TVP+PicOhICN0EDwccbVAw447PBX5Y4cT60Q=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=2PRTloHwTiWaiIJh2GDwG6CRI0Bn1tL8bAYWr5eezuQcDDpGWO6KIuCvDEev1M9+d
 NoE+y3WmJUC+sEsM5drVMnC+7YiLCIAY0m+OhMXh8Hy/i+zRHKnWWcNq2k1hKkPWqp
 NVY0ppkc7rSwiuGT4gVFly6S8H4Khn84xtjgKyEQ=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id N-PxUIaM7lSc; Mon, 26 Feb 2024 22:20:43 +0100 (CET)
Received: from zmail-tp1.enst.fr (zmail-tp1.enst.fr [137.194.2.198])
 by zproxy4.enst.fr (Postfix) with ESMTP id D41BC2055E;
 Mon, 26 Feb 2024 22:20:42 +0100 (CET)
Date: Mon, 26 Feb 2024 22:20:42 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, 
 =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 qemu-arm <qemu-arm@nongnu.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1283821622.11802412.1708982442539.JavaMail.zimbra@enst.fr>
In-Reply-To: <CAFEAcA_B=soMv78uDsDv-F5-0XQWDXfUr-i0iTUJHr0=VHmvkA@mail.gmail.com>
References: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
 <20240219200908.49551-7-arnaud.minier@telecom-paris.fr>
 <CAFEAcA_B=soMv78uDsDv-F5-0XQWDXfUr-i0iTUJHr0=VHmvkA@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] Add write protections to CR register
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [::ffff:46.193.4.103]
X-Mailer: Zimbra 9.0.0_GA_4583 (ZimbraWebClient - FF122 (Linux)/9.0.0_GA_4583)
Thread-Topic: Add write protections to CR register
Thread-Index: ZdboMa7kkJkgiid2tTp9Nf5KMlm69A==
Received-SPF: pass client-ip=2001:660:330f:2::df;
 envelope-from=aminier-21@enst.fr; helo=zproxy4.enst.fr
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mTbKuJps4cf/

Thank you for the review and for the tips ! It really helps.
I will address the problems you have highlighted and will send a new versio=
n later this week.

Arnaud

----- Original Message -----
> From: "Peter Maydell" <peter.maydell@linaro.org>
> To: "Arnaud Minier" <arnaud.minier@telecom-paris.fr>
> Cc: "qemu-devel" <qemu-devel@nongnu.org>, "Thomas Huth" <thuth@redhat.com=
>, "Laurent Vivier" <lvivier@redhat.com>, "In=C3=A8s
> Varhol" <ines.varhol@telecom-paris.fr>, "Samuel Tardieu" <samuel.tardieu@=
telecom-paris.fr>, "qemu-arm"
> <qemu-arm@nongnu.org>, "Alistair Francis" <alistair@alistair23.me>, "Paol=
o Bonzini" <pbonzini@redhat.com>
> Sent: Friday, February 23, 2024 3:59:03 PM
> Subject: Re: [PATCH v5 6/8] Add write protections to CR register

> On Mon, 19 Feb 2024 at 20:16, Arnaud Minier
> <arnaud.minier@telecom-paris.fr> wrote:
>>
>> Add write protections for the fields in the CR register.
>> PLL configuration write protections (among others) have not
>> been handled yet. This is planned in a future patch set.
>=20
> Can you make sure you include a suitable prefix (eg
> "hw/misc/stm32l4x5_rcc: ") at the front of patch subjects, please?

Sorry. This will be done for the next version.

>=20
>>
>> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
>> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>> ---
>>  hw/misc/stm32l4x5_rcc.c | 164 ++++++++++++++++++++++++++++------------
>>  1 file changed, 114 insertions(+), 50 deletions(-)
>>
>> diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
>> index a3b192e61b..198c6238b6 100644
>> --- a/hw/misc/stm32l4x5_rcc.c
>> +++ b/hw/misc/stm32l4x5_rcc.c
>> @@ -346,9 +346,47 @@ static void rcc_update_irq(Stm32l4x5RccState *s)
>>      }
>>  }
>>
>> -static void rcc_update_cr_register(Stm32l4x5RccState *s)
>> +static void rcc_update_msi(Stm32l4x5RccState *s, uint32_t previous_valu=
e)
>> +{
>> +    uint32_t val;
>> +
>> +    static const uint32_t msirange[] =3D {
>> +        100000, 200000, 400000, 800000, 1000000, 2000000,
>> +        4000000, 8000000, 16000000, 24000000, 32000000, 48000000
>> +    };
>> +    /* MSIRANGE and MSIRGSEL */
>> +    val =3D extract32(s->cr, R_CR_MSIRGSEL_SHIFT, R_CR_MSIRGSEL_LENGTH)=
;
>=20
> registerfields.h provides macros for "extract a named field", so you
> can write this
>    val =3D FIELD_EX32(s->cr, CR, MSIRGSEL);

It seems really convenient ! Will use them !

>=20
>> +    if (val) {
>> +        /* MSIRGSEL is set, use the MSIRANGE field */
>> +        val =3D extract32(s->cr, R_CR_MSIRANGE_SHIFT, R_CR_MSIRANGE_LEN=
GTH);
>=20
> and these as val =3D extract32(s->cr, CR, MSIRANGE)
> and so on.
>=20
>> +    } else {
>> +        /* MSIRGSEL is not set, use the MSISRANGE field */
>> +        val =3D extract32(s->csr, R_CSR_MSISRANGE_SHIFT, R_CSR_MSISRANG=
E_LENGTH);
>> +    }
>> +
>> +    if (val < ARRAY_SIZE(msirange)) {
>> +        clock_update_hz(s->msi_rc, msirange[val]);
>> +    } else {
>> +        /*
>> +         * There is a hardware write protection if the value is out of =
bound.
>> +         * Restore the previous value.
>> +         */
>> +        s->cr =3D (s->cr & ~R_CSR_MSISRANGE_MASK) |
>> +                (previous_value & R_CSR_MSISRANGE_MASK);
>> +    }
>> +}
>> +
>=20
>> -    /* HSEON and update HSERDY */
>> +    /*
>> +     * HSEON and update HSERDY.
>> +     * HSEON cannot be reset if the HSE oscillator is used directly or
>> +     * indirectly as the system clock.
>> +     */
>>      val =3D extract32(s->cr, R_CR_HSEON_SHIFT, R_CR_HSEON_LENGTH);
>> -    s->cr =3D (s->cr & ~R_CR_HSERDY_MASK) |
>> -            (val << R_CR_HSERDY_SHIFT);
>> -    if (val) {
>> -        clock_update_hz(s->hse, s->hse_frequency);
>> -        if (s->cier & R_CIER_HSERDYIE_MASK) {
>> -            s->cifr |=3D R_CIFR_HSERDYF_MASK;
>> +    if (extract32(s->cfgr, R_CFGR_SWS_SHIFT, R_CFGR_SWS_LENGTH) !=3D 0b=
10 &&
>> +        current_pll_src !=3D RCC_CLOCK_MUX_SRC_HSE) {
>> +        s->cr =3D (s->cr & ~R_CR_HSERDY_MASK) |
>> +                (val << R_CR_HSERDY_SHIFT);
>> +        if (val) {
>> +            clock_update_hz(s->hse, s->hse_frequency);
>> +            if (s->cier & R_CIER_HSERDYIE_MASK) {
>> +                s->cifr |=3D R_CIFR_HSERDYF_MASK;
>> +            }
>> +        } else {
>> +            clock_update_hz(s->hse, 0);
>=20
> As I mentioned earlier, please avoid clock_update_hz() for
> clock calculations if possible.

This will be changed to use clock_update.

>=20
> thanks
> -- PMM
