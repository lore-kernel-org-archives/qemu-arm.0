Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q12sm6305386wmj.7.2021.05.12.08.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 08:43:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5E5201FF7E;
	Wed, 12 May 2021 16:43:30 +0100 (BST)
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Chengen (William,
 FixNet)" <chengen@huawei.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Cota@braap.org
Subject: Re: GICv3 for MTTCG
Date: Wed, 12 May 2021 16:26:58 +0100
In-reply-to: <1f157423cc544731beb743287a4be5cb@huawei.com>
Message-ID: <87h7j8ez4t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: TsaSLkxuuTMy


Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:

> Dear colleagues,
>
> I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 hos=
t.
> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:
>
> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8
>
> The version 3 of the Generic Interrupt Controller (GICv3) is not
> supported in QEMU for some reason unknown to me. It would allow to
> increase the limit of CPUs and accelerate the MTTCG performance on a
> multiple core hypervisor.

It is supported, you just need to select it.

> I have got an idea to implement the Interrupt Translation Service (ITS)
> for using by MTTCG for ARM architecture.

There is some work to support ITS under TCG already posted:

  Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
  Date: Thu, 29 Apr 2021 19:41:53 -0400
  Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>

please do review and test.

> Do you find that idea useful and feasible?
> If yes, how much time do you estimate for such a project to complete by
> one developer?
> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?

As far as MTTCG performance is concerned there is a degree of
diminishing returns to be expected as the synchronisation cost between
threads will eventually outweigh the gains of additional threads.

There are a number of parts that could improve this performance. The
first would be picking up the BQL reduction series from your FutureWei
colleges who worked on the problem when they were Linaro assignees:

  Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from cpu_handle_int=
errupt/exception path
  Date: Wed, 19 Aug 2020 14:28:49 -0400
  Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>

There was also a longer series moving towards per-CPU locks:

  Subject: [PATCH v10 00/73] per-CPU locks
  Date: Wed, 17 Jun 2020 17:01:18 -0400
  Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>

I believe the initial measurements showed that the BQL cost started to
edge up with GIC interactions. We did discuss approaches for this and I
think one idea was use non-BQL locking for the GIC. You would need to
revert:

  Subject: [PATCH-for-5.2] exec: Remove MemoryRegion::global_locking field
  Date: Thu,  6 Aug 2020 17:07:26 +0200
  Message-Id: <20200806150726.962-1-philmd@redhat.com>

and then implement a more fine tuned locking in the GIC emulation
itself. However I think the BQL and per-CPU locks are lower hanging
fruit to tackle first.

>
> Best regards,
> Andrey Shinkevich


--=20
Alex Benn=C3=A9e
