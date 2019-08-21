Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp792048wrs;
        Wed, 21 Aug 2019 06:22:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzR56rjYxZ9FhSnibL82OOQ23mJiyO/okRjvTj1skVsV52nG873DgrNbEHKvXLgZeh0PMTD
X-Received: by 2002:a37:743:: with SMTP id 64mr30158701qkh.175.1566393773655;
        Wed, 21 Aug 2019 06:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566393773; cv=none;
        d=google.com; s=arc-20160816;
        b=FwM1zO+yyqdi0zj2L+IvIL4xXtizEqotoCYf/oRiSAiLeu7tizjccaDTbcd5uFm1K5
         7uZzHQWHyGwRsT4Id7eOpHklMtIBWWpapoIRVjHVgh8HIWuoj2HWYkxHHrv/bONVUHhi
         2olY7zCGdxXd3sS7shYB6x7JXi59LjD0zUbt+NUq2Ox44xyfPYMnOMWAGcldPef6Osnt
         e1E+2XDZIwh4FHnnqZQQHPSLMJqbdchBBkMBtmLk4f5vhfflhFPX79csxyxj4AGehRnt
         1mJLucyA8pvLzf2yLz1YMM0TuvnNdEShdogLjC2tmWse1yDi3iGuxRhRgavJPCuzMtPE
         stPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=3OsJpNbl8sS4YEWp4eG98RCYvxig5HbLT/K8i511nMs=;
        b=pKNk2+U4c8rzcGVmMI4tZP/ZsQg4ZAk+cEDRTVjMRMKRe2qxUqNFdlDrf3AEAe417j
         PWuMDJFR2SZE7dGKMSTJH9NNjlqT0sGgZOdEUq2KH1qORrw77QKN6Zl/h+zPCG/b1HMj
         ZCU8FMHdZWjwQZAmyEN6QopPCvu46kYXYcoKp7hGu8GyTcAOwuIFLDI6aBbRKAIt4Rmc
         J0r16el1386S1InNm5gPJrb2laxSp290mxgSNlehCRdajatLUTzQREu5PZ0z9D2N3UX5
         qWAEJkXBOwH602g4cOwK0BYsBb4WI/Z2GviGg2BXlLXBLNtCqsFpW2Zxgs7v12y+mX4G
         U9mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si13558086qtr.242.2019.08.21.06.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2019 06:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0QZg-00021j-I0
	for alex.bennee@linaro.org; Wed, 21 Aug 2019 09:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i0QZS-0001vX-By
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:22:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i0QZR-00009R-8I
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:22:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52800)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i0QZR-00008f-0d
 for qemu-arm@nongnu.org; Wed, 21 Aug 2019 09:22:37 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1E6A5C0568FA
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2019 13:22:36 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id k15so1217372wrw.18
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2019 06:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w2V8fHoT7g/hE3y1MUfQuj/SBJjLfoDC7skvCwNQJq4=;
 b=l76B0AElaKE5w6Wgwy0dQT4Z9K+dvTkl/9TY9ohZFC9G7gCSLPYxbqn/kAImeN1vj4
 kBawAUyQN3ELal2P9u0J9ZZdlz2mulZGu1jVz2u/aDkNWQBW9GcOSeuUKcFe5ORi3bYB
 /j7/lUhJ3L/ZfpBM+W4yGsVRWwEE3bdw6i9khfS7GCUelsNWcUo7vur2PhSVjB5IKQKy
 xlaZzMoI6PIQ+q+sSSJ7RG5FMXq/0n2EipDn0cxdb9raX2veBqvmu0JS9mSxORi3858l
 810D3knOrn/lznw8InmDR0PbKDsC/QQZmCxA6CZGp5RG7OXV31ltXuTLohEf6jUX1CHd
 4Ckw==
X-Gm-Message-State: APjAAAW1tC2S3Dhwo7Vp8otWifvZAs3bkzBnkN4GSvHPT1/v6uDgWa67
 XYVc22f1cFiimOzspVSmERC9ZFDZ5L86/TL7RVHTnb4NyZqWqjp4aD2CG5qHBEPKykPSZTJupcT
 ByZjFm/3ULqRR
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr6077212wml.77.1566393754730; 
 Wed, 21 Aug 2019 06:22:34 -0700 (PDT)
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr6077195wml.77.1566393754502; 
 Wed, 21 Aug 2019 06:22:34 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id v124sm5301627wmf.23.2019.08.21.06.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2019 06:22:33 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-37-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f5cc0c43-d366-6e3f-c741-47d70c95c429@redhat.com>
Date: Wed, 21 Aug 2019 15:22:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190819213755.26175-37-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 36/68] target/arm: Convert
 SETEND
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6OK/pCMs9x73

On 8/19/19 11:37 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c       | 22 +++++++++++++---------
>  target/arm/a32-uncond.decode |  4 ++++
>  2 files changed, 17 insertions(+), 9 deletions(-)
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 928205d993..46e88d1d17 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10124,6 +10124,18 @@ static bool trans_SB(DisasContext *s, arg_SB *=
a)
>      return true;
>  }
> =20
> +static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
> +{
> +    if (!ENABLE_ARCH_6) {
> +        return false;
> +    }
> +    if (a->E !=3D (s->be_data =3D=3D MO_BE)) {

:)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +        gen_helper_setend(cpu_env);
> +        s->base.is_jmp =3D DISAS_UPDATE;
> +    }
> +    return true;
> +}
> +
>  /*
>   * Legacy decoder.
>   */
> @@ -10209,15 +10221,7 @@ static void disas_arm_insn(DisasContext *s, un=
signed int insn)
>              return; /* v7MP: Unallocated memory hint: must NOP */
>          }
> =20
> -        if ((insn & 0x0ffffdff) =3D=3D 0x01010000) {
> -            ARCH(6);
> -            /* setend */
> -            if (((insn >> 9) & 1) !=3D !!(s->be_data =3D=3D MO_BE)) {
> -                gen_helper_setend(cpu_env);
> -                s->base.is_jmp =3D DISAS_UPDATE;
> -            }
> -            return;
> -        } else if ((insn & 0x0e000f00) =3D=3D 0x0c000100) {
> +        if ((insn & 0x0e000f00) =3D=3D 0x0c000100) {
>              if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
>                  /* iWMMXt register transfer.  */
>                  if (extract32(s->c15_cpar, 1, 1)) {
> diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decod=
e
> index eb1c55b330..d5ed48f0fd 100644
> --- a/target/arm/a32-uncond.decode
> +++ b/target/arm/a32-uncond.decode
> @@ -24,6 +24,7 @@
> =20
>  &empty           !extern
>  &i               !extern imm
> +&setend          E
> =20
>  # Branch with Link and Exchange
> =20
> @@ -50,3 +51,6 @@ DSB              1111 0101 0111 1111 1111 0000 0100 -=
---
>  DMB              1111 0101 0111 1111 1111 0000 0101 ----
>  ISB              1111 0101 0111 1111 1111 0000 0110 ----
>  SB               1111 0101 0111 1111 1111 0000 0111 0000
> +
> +# Set Endianness
> +SETEND           1111 0001 0000 0001 0000 00 E:1 0 0000 0000  &setend
>=20
