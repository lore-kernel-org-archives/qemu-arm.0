Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h12sm1788863wrv.58.2021.03.25.10.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 10:19:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6D46E1FF7E;
	Thu, 25 Mar 2021 17:19:05 +0000 (GMT)
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
 <20210323041238.133835-2-shashi.mallela@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Cc: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/8] hw/intc: GICv3 ITS initial framework
Date: Thu, 25 Mar 2021 17:18:20 +0000
In-reply-to: <20210323041238.133835-2-shashi.mallela@linaro.org>
Message-ID: <87o8f7gnhy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qrT0qfUUYX8Y


Shashi Mallela <shashi.mallela@linaro.org> writes:

> Added register definitions relevant to ITS,implemented overall
> ITS device framework with stubs for ITS control and translater
> regions read/write,extended ITS common to handle mmio init between
> existing kvm device and newer qemu device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
<snip>
>=20=20
>  typedef struct GICv3ITSState GICv3ITSState;
>

Also could we kernel-doc this function and explain when and why tops
would be NULL.

> -void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops);
> +void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
> +                   const MemoryRegionOps *tops);
>=20=20
>  #define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
>  typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;


--=20
Alex Benn=C3=A9e
