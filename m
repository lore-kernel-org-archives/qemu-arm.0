Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bo12-20020a056000068c00b00323287186b2sm12683094wrb.29.2023.09.29.07.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:03:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6C3811FFBB;
	Fri, 29 Sep 2023 15:03:24 +0100 (BST)
References: <20230929124304.13672-1-salil.mehta@huawei.com>
 <20230929124304.13672-3-salil.mehta@huawei.com>
User-agent: mu4e 1.11.20; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 linuxarm@huawei.com
Subject: Re: [PATCH 2/9] hw/acpi: Move CPU ctrl-dev MMIO region len macro to
 common header file
Date: Fri, 29 Sep 2023 15:03:20 +0100
In-reply-to: <20230929124304.13672-3-salil.mehta@huawei.com>
Message-ID: <8734yxoz4j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: V6iuEFrG3hWc


Salil Mehta <salil.mehta@huawei.com> writes:

> CPU ctrl-dev MMIO region length could be used in ACPI GED and various oth=
er
> architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
> appropriate common header file.
>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
