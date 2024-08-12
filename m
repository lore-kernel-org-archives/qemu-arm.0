Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp870708njh;
        Mon, 12 Aug 2024 10:56:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVy/vSvRGPI2SxisQFfrQNLBw/TPpnxr+6y6tm1b7pqDUenZkeXshBanbLeg4bQ07sRxDFRh+4fOs9QcqN0Zcpv/wXTxylC
X-Received: by 2002:a05:600c:5127:b0:426:6f17:531 with SMTP id 5b1f17b1804b1-429d4809581mr8925145e9.13.1723485381914;
        Mon, 12 Aug 2024 10:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723485381; cv=none;
        d=google.com; s=arc-20160816;
        b=P+FMrOlTSdjVi2qMJbjyHQ8cIDSJqQwBr4dy4FjAPnfQhhyyoBWEwFxjH1npSvN05P
         /u507k5KjfR3T/fJWMP4/D5SV2fUrkbHwPYOOvxW/wSkWEyuAwwY2d7FhNMoxX3O0KwU
         xjHszX7d+SuC0k7AwLPmWs7u8qYFnpB6VEJjX6DlJMxAAfegGb370wDoEfQB/XOUYNOn
         yuHvhuucToax6wiQKF057EMoDXfp1XnYf+svrhivPMjgqeECpdobtp8n27kb+LZ0Ccts
         Exi0xxODPE1wB4H1s8SC+L6AWepdwWTFEgH3z3A9oRcTZYK+5SH5NwVRGo/y5SgGKSsp
         GJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ucpR89SN6ep8advprvDEEg8bvmnOO1GXRGaE0X67Mo=;
        fh=DYyirPUOV/Pr1mUh4cgaNJ0dVAaR7VW+KiFYddIeNLo=;
        b=XSOfL3Ut38Nb/bdQZ6vhpn1/4D6q34pwOsRE8AXJf7udyNjBKUDJ2SEfzRwvkiKury
         HYY6n2XZaK2/llGTRHFONwj0BcUzyfEYg31jTStTvA/tTAF3bE2qZSAYvGXvERQBpCM7
         uB75F5s6Ncg1LcoVxdjr9APt3MGuApgAp1t2twgqv4CnKLsMVAfULc41JG6dUF8yw01E
         7fN9dHZBeNPuJvkaReYFCjGRmcUoApLjX7PuWaX3qu11ABsDzpyyOGsjUOWTcHXB8o98
         eawmS6JXhfz9IB2Jquy1bTmbN+cvP7lLCUpap0ixUixOMXktUMn3L+QabpKUwkGJQSCH
         YWiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ue2hCfi1;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <tavip@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-429c7ddaaeesor14278415e9.13.2024.08.12.10.56.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 Aug 2024 10:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ue2hCfi1;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723485381; x=1724090181; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ucpR89SN6ep8advprvDEEg8bvmnOO1GXRGaE0X67Mo=;
        b=Ue2hCfi1EFI+k/2f+PggAHO8rwQD8m0k5fbcIXOXIQfXVtNbXWDiuQ5uJlXbchT5nz
         tzwEHTCRQsGEw0JGLeIqfTPd+XHxKAS1qFLlj3tY0sVQE45VCzoQvLn8lxZ6R9Jn1Lg0
         v43EruHpj1AGQyjWM1S6sskFii0t+1YhfONDhLugv80hfM2df6eIFmksyYlX9D0EwVpd
         Jfp3vBWA4kOINckgPvYLnbNvf0jLCflhp2hxgDR/RmXnFcY3+O6Y+SwirzU2v55bxkh1
         3/3yJO9dISlgm7c2e+VbGNeOWfarLNDDV+ejC+k3NrBJFQwFCpwh/ydYiteIt9EDijTy
         cjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723485381; x=1724090181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ucpR89SN6ep8advprvDEEg8bvmnOO1GXRGaE0X67Mo=;
        b=cD07ulsbyfs3/0B95b6T/I+m4z4tfcjZ9tWzW0tCWNHdtm/PnM4Ln6UvP2Xzf3UlYQ
         AZMqEiINDIUndxc5WAYg3kZ7+ryjFtfZLdZ/BTTFVqhPGOmbMHEOJTEoHrx9L8L2usRw
         D393dshhwLTgSHN1CSTF6cw7Rza1xvWkhv3GFMXLI40fe3Iel0LT1znok1Nh3BUc2Ojn
         +91rzudr7llAyP7X51D+DQdDZ+MSIjVg0aytBOfwpqHzjfryqzKcPRwnG6qKAYWcDUeH
         eF8eUhXT9Z+dLrMhxoJtG7GCFHXieyP1bVIatXRWEE0L4qb674zLc156wvyY0IalTyt9
         PbZg==
X-Forwarded-Encrypted: i=1; AJvYcCWMR0Nnt/cRES7GgoQyOaQ3jAOOmBaClbjVN12rqcJfaBmceQ2CT9a8HEOr6firkssc7aLgd1qmdSEK9YN28GXURpHXr6X0
X-Gm-Message-State: AOJu0YzCfPi3thCqbiTvC3ihFat1qHIgwKPHH7Wb6Ym3x2KxfTVojsmK
	v34jFjV1TPXsjSS63w7mtUdI68AupXKPKwNQDKoCQ5WSzo97pupSwPbAxbGpAa7scF+tlXeczP9
	7qkSybQfwkS0iNXNHwMnxPkOq4Q3xhPLOeXde
X-Google-Smtp-Source: AGHT+IGy5gO53UM0oJAlohh+4At+0i0l/Vi8pIR52RUwf7WZ6I/jyEACa11eGpb3JDTApRUeJH2/9xzeV7TAt+hsG4U=
X-Received: by 2002:a05:6000:1bc1:b0:367:926a:7413 with SMTP id
 ffacd0b85a97d-3716cd2c07bmr713273f8f.63.1723485381094; Mon, 12 Aug 2024
 10:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-4-tavip@google.com>
 <CAFEAcA82c_RZ6512dB1OxpAtinRctkZK7ZyjpxX16Wk7DYZDPg@mail.gmail.com>
In-Reply-To: <CAFEAcA82c_RZ6512dB1OxpAtinRctkZK7ZyjpxX16Wk7DYZDPg@mail.gmail.com>
From: Octavian Purdila <tavip@google.com>
Date: Mon, 12 Aug 2024 10:56:09 -0700
Message-ID: <CAGWr4cSiNOm1mL6ZC+Dr8bFHz9Dx2R78_we9wL=W6f3FExb-kQ@mail.gmail.com>
Subject: Re: [RFC PATCH 03/23] scripts: add script to generate C header files
 from SVD XML files
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: VO4AQlcCA5qH

On Mon, Aug 12, 2024 at 8:27=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>

Hi Peter,

Thanks for the review!


> On Mon, 5 Aug 2024 at 21:17, Octavian Purdila <tavip@google.com> wrote:
> >
> > From: Stefan Stanacar <stefanst@google.com>
> >
> > From: Stefan Stanacar <stefanst@google.com>
> >
> > The CMSIS System View Description format(CMSIS-SVD) is an XML based
> > description of Arm Cortex-M microcontrollers provided and maintained
> > by sillicon vendors. It includes details such as peripherals registers
> > (down to bitfields), peripheral register block addresses, reset
> > values, etc.
> >
> > This script uses this information to create header files that makes it
> > easier to emulate peripherals.
> >
> > The script can be used to create either peripheral specific headers or
> > board / system specific information. The script generated headers are
> > similar to the SVDConv utility.
> >
> > Peripheral specific headers contains information such as register
> > layout, register names and reset values for registers:
> >
> >   typedef struct {
> >     ...
> >     union {
> >       uint32_t PSELID;              /* 0x00000FF8 Peripheral Select and
> >                                      * Flexcomm module ID */
> >       struct {
> >         uint32_t PERSEL : 3;        /* [2..0] Peripheral Select */
> >         uint32_t LOCK : 1;          /* [3..3] Lock the peripheral selec=
t */
> >         uint32_t USARTPRESENT : 1;  /* [4..4] USART present indicator *=
/
> >         uint32_t SPIPRESENT : 1;    /* [5..5] SPI present indicator */
> >         uint32_t I2CPRESENT : 1;    /* [6..6] I2C present indicator */
> >         uint32_t I2SPRESENT : 1;    /* [7..7] I2S Present */
> >         uint32_t : 4;
> >         uint32_t ID : 20;           /* [31..12] Flexcomm ID */
> >       } PSELID_b;
> >     };
>
> Bitfield layout in C isn't portable, so don't generate this kind
> of union-of-a-integer-and-some-bitfields, please. You can
> generate FIELD() macro invocations (see include/hw/registerfields.h)
> which define shift/mask/length macros that can be used with
> FIELD_EX*/FIELD_DP* to do extract/deposit operations.
>

I see that C bitfields are already used in a few places in qemu. Could
you please elaborate on the portability issue?

> >     ...
> >   } FLEXCOMM_Type;                  /* Size =3D 4096 (0x1000) */
> >
> >   #define FLEXCOMM_PSELID_PERSEL_Pos (0UL)
> >   #define FLEXCOMM_PSELID_PERSEL_Msk (0x7UL)
> >   #define FLEXCOMM_PSELID_LOCK_Pos (3UL)
> >   #define FLEXCOMM_PSELID_LOCK_Msk (0x8UL)
> >   ...
> >
> >   typedef enum {                /* FLEXCOMM_PSELID_LOCK */
> >     /* Peripheral select can be changed by software. */
> >     FLEXCOMM_PSELID_LOCK_UNLOCKED =3D 0,
> >     /* Peripheral select is locked and cannot be changed until this
> >      * Flexcomm module or the entire device is reset. */
> >     FLEXCOMM_PSELID_LOCK_LOCKED =3D 1,
> >   } FLEXCOMM_PSELID_LOCK_Enum;
> >   ...
> >
> >   #define FLEXCOMM_REGISTER_NAMES_ARRAY(_name) \
> >     const char *_name[sizeof(FLEXCOMM_Type)] =3D { \
> >         [4088 ... 4091] =3D "PSELID", \
> >         [4092 ... 4095] =3D "PID", \
> >     }
> >
> > Board specific headers contains information about peripheral base
> > register addresses.
>
> thanks
> -- PMM
