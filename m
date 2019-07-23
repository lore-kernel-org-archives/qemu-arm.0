Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8013421wrv;
        Tue, 23 Jul 2019 04:47:29 -0700 (PDT)
X-Received: by 2002:a9d:5911:: with SMTP id t17mr53744856oth.159.1563882449262;
        Tue, 23 Jul 2019 04:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563882449; cv=none;
        d=google.com; s=arc-20160816;
        b=eZd1xzTN/m5MWiZssFdtgE03VgOd/dBHJxCxtDg1c3PxJM7t1SvKXxk/0FI20iyr+X
         0ExCOHQxv/I0CEV9Qf9isnSkHmCa3z+QUArkSqcCuyVzVNxQb5v57KsdvIMR1L+ZZXgz
         bd64pJL/d9JNDcXdhKP6TZsJm6Rsmsc9ATPk4EQLgXL/83F4pWrWTAyLfJiHPqWoObMc
         9PzeK7NWIFuxnE45ikv3gRerT6pB5QGPLBWUzAfkxGpKYlgGfIGqWkUabqqPMfMwU5H1
         vCYs8o2NsdTIBYlmRqzUrfsa6lBXB6+uMEcknZcBZeJSC4FglK4XYTy/qEKBzxjWPHaq
         0qDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fz9eaAluHIdQpvsypCntyI9q7SgqRMnI4BQquledjgY=;
        b=zFRuzQAkFkLXh6xbQDDN3uKD9Ie/Hx1UMzo5SnZdY0YdhETC9sa9Reaqj7Xl2YJ+hc
         Si+9zIduicb6bGaAI+OfAO8irVWCPFz+GjmAgJpelvD6S7Y0iyElZPGqyjE7FGcQZUgZ
         tPg15wkOvNjwLqlcistvmsUtnuICZW6XrZ+14ONBlc27W+GkjFuh5zNR3fEvgfDDoNKv
         ShexXUFdCysrrHtxBuoLXhnjjR8XYTlUOnTpHf5N/f5hw1SXCfjlbdOTDtBk/Z5y1Jve
         J6vOQxHWAJwykKTjjIJdP/ZiMW82fX6AwK9F4ljj6iZbLHgLqmNzMJod1mZWNccXTk7e
         gW3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hrvgrQXC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x206sor18706252oif.28.2019.07.23.04.47.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Jul 2019 04:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hrvgrQXC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fz9eaAluHIdQpvsypCntyI9q7SgqRMnI4BQquledjgY=;
        b=hrvgrQXCUkVsiVVWHOkdbQ2/e3KlV3YhYnwlR0j83Y4V28wx+NuxPUjYDNdFsOZzDP
         FVnLD5aBApWa6m5DMP6rv2Av70SNhRxSDfVV7ZspG7oAX40ofXuIbqwdVkC/Cs+HBkiv
         DREG9MYPK/vrBkbZYeU9AFsPOtHYnmMOAlUaXOIgSfghtkZ3EaypRpt9cbiqJoJdHNEB
         db6cEOyGLfms93Zgl6yfaNDBupo0cupqMSNXfHjkkGCoGbC7gW8qtWqEN+cbTDEU0amk
         ijZgg12JKsxa2o/QeGevdavwRXqztKW/yo7aGocL6A+K99OrxDlarIAL2SZgzKnD/A8d
         hSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fz9eaAluHIdQpvsypCntyI9q7SgqRMnI4BQquledjgY=;
        b=eL8xdL+uoE77Ugsc9nHgssYbVulFOfCMdZSlmmp45A64rpK0xHxpi/djYgWKKUVoyg
         PMjbQBGrzmhrinCsN7XfnW5+OE3jiw2oJPXC21iWs0rCHi9dXVweAMer+555qizi/YT/
         0SObazCwpsJWnrZLQOIs32MFBdADxMEIslkvzYKXRAu0iDUzf+iK58PV+CRCaw/iPKi6
         cBeLryoq4/8g3EQ09LgMK+N30BBoYQF+oufrz6hZH751x2OS1SdLv7Rnj+6jNyIZeAWI
         KLbF+avnuR3e3R82m1qZQnfLQ7Q97gwX8zec2pun2U8m38BYu/zScI8UY1ehffwDBAWZ
         biUw==
X-Gm-Message-State: APjAAAU89azVg20UZQP20Y/XGgDtPkzovYm95xo9w94LIAo++xI6L89x
	KpqzvHs0rHLWviHd9AWdbafgLm/53D9+eM34LSvRoH2jZGcPmA==
X-Google-Smtp-Source: APXvYqy8p4uetYE2MjVqQWIWzOIP3MWFzXARcHl+pnKIY0Fn9YOsdDbu/++kmxrjwTSRrOaxo5Hp7TjigLMq2Uyj7CU=
X-Received: by 2002:aca:5cd7:: with SMTP id q206mr33770929oib.146.1563882448703;
 Tue, 23 Jul 2019 04:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190723113301.16867-1-alex.bennee@linaro.org>
In-Reply-To: <20190723113301.16867-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jul 2019 12:47:17 +0100
Message-ID: <CAFEAcA9CP0cUkDR4qOKVgM1b2U1KNot=A-5OPEAOKu3=KpMyuw@mail.gmail.com>
Subject: Re: [PATCH for 4.2] target/arm: generate a custom MIDR for -cpu max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: wEqE0KpJStrW

On Tue, 23 Jul 2019 at 12:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> While most features are now detected by probing the ID_* registers
> kernels can (and do) use MIDR_EL1 for working out of they have to
> apply errata. This can trip up warnings in the kernel as it tries to
> work out if it should apply workarounds to features that don't
> actually exist in the reported CPU type.
>
> Avoid this problem by synthesising our own MIDR value using the
> reserved value of 0 for the implementer and telling kernels the ID
> registers should tell them everything they need to know.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - don't leak QEMU version into ID reg
> ---
>  target/arm/cpu.h   | 6 ++++++
>  target/arm/cpu64.c | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 7efbb488d9d..61eaef924e4 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1605,6 +1605,12 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
>  /*
>   * System register ID fields.
>   */
> +FIELD(MIDR_EL1, REVISION, 0, 4)
> +FIELD(MIDR_EL1, PARTNUM, 4, 12)
> +FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> +FIELD(MIDR_EL1, VARIENT, 20, 4)

"VARIANT".

> +FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)
> +
>  FIELD(ID_ISAR0, SWAP, 0, 4)
>  FIELD(ID_ISAR0, BITCOUNT, 4, 4)
>  FIELD(ID_ISAR0, BITFIELD, 8, 4)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index b1bb394c6dd..e88aadfd2fd 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -296,6 +296,12 @@ static void aarch64_max_initfn(Object *obj)
>          uint32_t u;
>          aarch64_a57_initfn(obj);
>
> +        /* reset MIDR so our franken-max-cpu type isn't mistaken for a r=
eal one */
> +        t =3D FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0); /* Reserved for S=
W */
> +        t =3D FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf); /* See ID_* fo=
r details */
> +        /* the rest is enigmatically empty lest kernels assume it means =
something */
> +        cpu->midr =3D t;

I think this would be easier to read if you used one big block
comment rather than being extremely terse so as to fit the
comments on the end of the lines:

 /*
  * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
  * one and try to apply errata workarounds or use impdef features we
  * don't provide.
  * An IMPLEMENTER field of 0 means "reserved for software use";
  * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
  * to see which features are present";
  * the VARIANT, PARTNUM and REVISION fields are all implementation
  * defined and we choose to leave them all at zero.
  */

It's also a bit inconsistent to do an explicit deposit of 0
for the IMPLEMENTER field but not for the VARIANT/PARTNUM/REVISION.

I wonder if we should put 0x51 (ascii 'Q') in the PARTNUM field;
then if somebody really needs to distinguish QEMU from random
other software-models they have a way to do it.

thanks
-- PMM
