Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2c7d79sm9570291a12.59.2024.05.15.13.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 13:26:00 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E903E5F78B;
	Wed, 15 May 2024 21:25:59 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org,  eric.auger@redhat.com,  peter.maydell@linaro.org,
  qemu-devel@nongnu.org,  jean-philippe@linaro.org,  maz@kernel.org,
  nicolinc@nvidia.com,  julien@xen.org,  richard.henderson@linaro.org,
  marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 04/18] hw/arm/smmu: Use enum for SMMU stage
In-Reply-To: <20240429032403.74910-5-smostafa@google.com> (Mostafa Saleh's
	message of "Mon, 29 Apr 2024 03:23:48 +0000")
References: <20240429032403.74910-1-smostafa@google.com>
	<20240429032403.74910-5-smostafa@google.com>
Date: Wed, 15 May 2024 21:25:59 +0100
Message-ID: <878r0arfe0.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jkmT2lK6eiFo

Mostafa Saleh <smostafa@google.com> writes:

> Currently, translation stage is represented as an int, where 1 is stage-1=
 and
> 2 is stage-2, when nested is added, 3 would be confusing to represent nes=
ting,
> so we use an enum instead.
>
> While keeping the same values, this is useful for:
>  - Doing tricks with bit masks, where BIT(0) is stage-1 and BIT(1) is
>    stage-2 and both is nested.
>  - Tracing, as stage is printed as int.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
