Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d7-20020a170906174700b006e80a7e3111sm849189eje.17.2022.04.05.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 06:54:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 661CD1FFB7;
	Tue,  5 Apr 2022 14:54:25 +0100 (BST)
References: <20220210145254.157790-1-eric.auger@redhat.com>
 <20220210145254.157790-3-eric.auger@redhat.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, david@gibson.dropbear.id.au,
 clg@kaod.org, eesposit@redhat.com, Coiby.Xu@gmail.com,
 stefanha@redhat.com, jean-philippe@linaro.org
Subject: Re: [PATCH v3 2/5] tests/qtest/libqos/pci: Introduce pio_limit
Date: Tue, 05 Apr 2022 14:54:20 +0100
In-reply-to: <20220210145254.157790-3-eric.auger@redhat.com>
Message-ID: <874k37ljou.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gsr/Z5jYkfQj


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
