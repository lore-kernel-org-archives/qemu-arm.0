Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o1sm3637733wri.19.2022.01.20.07.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 07:05:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 978901FFB7;
	Thu, 20 Jan 2022 15:05:04 +0000 (GMT)
References: <20220118203833.316741-1-eric.auger@redhat.com>
 <20220118203833.316741-3-eric.auger@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, thuth@redhat.com, pbonzini@redhat.com,
 lvivier@redhat.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, david@gibson.dropbear.id.au, clg@kaod.org,
 eesposit@redhat.com, jean-philippe@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/6] tests/qtest/libqos/pci: Introduce pio_limit
Date: Thu, 20 Jan 2022 15:04:59 +0000
In-reply-to: <20220118203833.316741-3-eric.auger@redhat.com>
Message-ID: <87r19278in.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JSy5A7+OJWXd


Eric Auger <eric.auger@redhat.com> writes:

> At the moment the IO space limit is hardcoded to
> QPCI_PIO_LIMIT =3D 0x10000. When accesses are performed to a bar,
> the base address of this latter is compared against the limit
> to decide whether we perform an IO or a memory access.
>
> On ARM, we cannot keep this PIO limit as the arm-virt machine
> uses [0x3eff0000, 0x3f000000 ] for the IO space map and we
> are mandated to allocate at 0x0.
>
> Add a new flag in QPCIBar indicating whether it is an IO bar
> or a memory bar. This flag is set on QPCIBar allocation and
> provisionned based on the BAR configuration. Then the new flag
> is used in access functions and in iomap() function.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
