Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m16-20020a056000009000b0031c71693449sm21729739wrx.1.2023.09.29.07.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:39:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3FBCA1FFBB;
	Fri, 29 Sep 2023 15:39:44 +0100 (BST)
References: <20230929124304.13672-1-salil.mehta@huawei.com>
 <20230929124304.13672-10-salil.mehta@huawei.com>
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
Subject: Re: [PATCH 9/9] target/arm/kvm: Write CPU state back to KVM on reset
Date: Fri, 29 Sep 2023 15:39:32 +0100
In-reply-to: <20230929124304.13672-10-salil.mehta@huawei.com>
Message-ID: <87pm21nivj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 20neqz8bIqti


Salil Mehta <salil.mehta@huawei.com> writes:

> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>
> When a KVM vCPU is reset following a PSCI CPU_ON call, its power state
> is not synchronized with KVM at the moment. Because the vCPU is not
> marked dirty, we miss the call to kvm_arch_put_registers() that writes
> to KVM's MP_STATE. Force mp_state synchronization.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>

Seems reasonable:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
