Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z5sm7260894wrv.67.2021.06.07.03.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:23:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 67D591FF7E;
	Mon,  7 Jun 2021 11:23:56 +0100 (BST)
References: <20210604130352.1887560-1-jean-philippe@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, shashi.mallela@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
Date: Mon, 07 Jun 2021 11:23:31 +0100
In-reply-to: <20210604130352.1887560-1-jean-philippe@linaro.org>
Message-ID: <87lf7mnfb7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /IDT4SbAPTvM


Jean-Philippe Brucker <jean-philippe@linaro.org> writes:

> Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> check logic") added an assert_not_reached() if the guest writes the EOIR
> register while no interrupt is active.
>
> It turns out some software does this: EDK2, in
> GicV3ExitBootServicesEvent(), unconditionally write EOIR for all
> interrupts that it manages. This now causes QEMU to abort when running
> UEFI on a VM with GICv3. Although it is UNPREDICTABLE behavior and EDK2
> does need fixing, the punishment seems a little harsh, especially since
> icc_eoir_write() already tolerates writes of nonexistent interrupt
> numbers. Display a guest error and tolerate spurious EOIR writes.
>
> Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access chec=
k logic")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Xen seems good at triggering this as well...

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
