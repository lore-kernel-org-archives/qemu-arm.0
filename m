Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c4ba2sm773646a12.30.2025.01.09.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 09:34:21 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 572FE5F75D;
	Thu,  9 Jan 2025 17:34:20 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Nabih Estefan <nabihestefan@google.com>
Cc: peter.maydell@linaro.org,  qemu-arm@nongnu.org,  qemu-devel@nongnu.org,
  qemu-block@nongnu.org,  its@irrelevant.dk,  kbusch@kernel.org,
  eric.auger@redhat.com,  roqueh@google.com
Subject: Re: [PATCH 0/2] ARM SMMUv3 StreamID Implementation
In-Reply-To: <20240221171716.1260192-1-nabihestefan@google.com> (Nabih
	Estefan's message of "Wed, 21 Feb 2024 17:17:14 +0000")
References: <20240221171716.1260192-1-nabihestefan@google.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 09 Jan 2025 17:34:20 +0000
Message-ID: <87h6676gdf.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +tY8ynX36uHT

Nabih Estefan <nabihestefan@google.com> writes:

> This patch series modifies the ARM SMMUv3 to be able to work with an
> implementation specific StreamID that does not match exactly the PCIe BDF.
> The way to achieve this is by converting the smmu_get_sid and smmu_iommu_=
mr
> functions to virtual functions that can be overridden by inheritance, mak=
ing
> sure the StreamID is consistently 32 bits and removing the hardcoding of =
the
> SMMU_IDR1.SIDSIZE to 16 bits.

I was just going through my outstanding review queue for '24 and saw
this didn't get merged. Was there a re-spin that I missed? I see Eric
left a comment on 2/2.

>
> Roque Arcudia Hernandez (2):
>   hw/arm/smmuv3: Check StreamIDs against SMMU_IDR1.SIDSIZE value
>   hw/arm/smmu-common: Create virtual function for implementation defined
>     StreamID
>
>  hw/arm/smmu-common.c         | 12 ++++++++++++
>  hw/arm/smmuv3.c              |  4 +++-
>  include/hw/arm/smmu-common.h | 16 +++++++++++-----
>  3 files changed, 26 insertions(+), 6 deletions(-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
