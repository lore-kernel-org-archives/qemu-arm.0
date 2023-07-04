Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a15-20020adffacf000000b0031434c08bb7sm6587679wrs.105.2023.07.04.06.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 06:45:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A34251FFBB;
	Tue,  4 Jul 2023 14:45:33 +0100 (BST)
References: <20230704130647.2842917-1-peter.maydell@linaro.org>
 <20230704130647.2842917-2-peter.maydell@linaro.org>
User-agent: mu4e 1.11.8; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] target/arm: Suppress more TCG unimplemented
 features in ID registers
Date: Tue, 04 Jul 2023 14:45:28 +0100
In-reply-to: <20230704130647.2842917-2-peter.maydell@linaro.org>
Message-ID: <87wmzfg58i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2d1dyGwuAflZ


Peter Maydell <peter.maydell@linaro.org> writes:

> We already squash the ID register field for FEAT_SPE (the Statistical
> Profiling Extension) because TCG does not implement it and if we
> advertise it to the guest the guest will crash trying to look at
> non-existent system registers.  Do the same for some other features
> which a real hardware Neoverse-V1 implements but which TCG doesn't:
>  * FEAT_TRF (Self-hosted Trace Extension)
>  * Trace Macrocell system register access
>  * Memory mapped trace
>  * FEAT_AMU (Activity Monitors Extension)
>  * FEAT_MPAM (Memory Partitioning and Monitoring Extension)
>  * FEAT_NV (Nested Virtualization)
>
> Most of these, like FEAT_SPE, are "introspection/trace" type features
> which QEMU is unlikely to ever implement.  The odd-one-out here is
> FEAT_NV -- we could implement that and at some point we probably
> will.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
