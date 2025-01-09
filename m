Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95af424sm58054466b.137.2025.01.09.02.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:40:37 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6DD565F87E;
	Thu,  9 Jan 2025 10:40:36 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,  Leif Lindholm
 <leif.lindholm@oss.qualcomm.com>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Radoslaw Biernacki <rad@semihalf.com>,
  qemu-arm@nongnu.org
Subject: Re: [PATCH v2 0/5] target/arm: implement SEL2 physical and virtual
 timers
In-Reply-To: <20241218181511.3575613-1-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 18 Dec 2024 18:15:06 +0000")
References: <20241218181511.3575613-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 09 Jan 2025 10:40:36 +0000
Message-ID: <87cygw9snv.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CTs7x49/aiLo

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Follow Peter's review I've split this into a several patches as there
> are some other fixes that should be made to other EL2 times that
> shouldn't be rolled together.
>
> v2
>   - split machine enabling into patches
>   - rename IRQ
>   - use CP_ACCESS_TRAP_UNCATEGORIZED for UNDEF cases
>
> v1
>   - improve GTIMER docs
>   - fix gt_recalc bug
>   - address review comments for the main patch
>   - cc qemu-stable (no rush for 9.2.0)
>
> The following still need review:
>
>   hw/arm: enable secure EL2 timers for sbsa machine
>   hw/arm: enable secure EL2 timers for virt machine
>   target/arm: implement SEL2 physical and virtual timers
>   target/arm: ensure cntvoff_el2 also used for EL2 virt timer

Gentle ping - I think everything is ready for merging.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
