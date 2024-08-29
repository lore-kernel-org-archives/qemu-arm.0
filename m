Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba639d512sm44833625e9.18.2024.08.29.02.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:59:58 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1E0F55F790;
	Thu, 29 Aug 2024 10:59:57 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Salil Mehta <salil.mehta@huawei.com>,  qemu-devel@nongnu.org,
  qemu-arm@nongnu.org,  mst@redhat.com,  maz@kernel.org,
  jean-philippe@linaro.org,  jonathan.cameron@huawei.com,
  lpieralisi@kernel.org,  peter.maydell@linaro.org,
  richard.henderson@linaro.org,  imammedo@redhat.com,
  andrew.jones@linux.dev,  david@redhat.com,  philmd@linaro.org,
  eric.auger@redhat.com,  will@kernel.org,  ardb@kernel.org,
  oliver.upton@linux.dev,  pbonzini@redhat.com,  gshan@redhat.com,
  rafael@kernel.org,  borntraeger@linux.ibm.com,  npiggin@gmail.com,
  harshpb@linux.ibm.com,  linux@armlinux.org.uk,
  darren@os.amperecomputing.com,  ilkka@os.amperecomputing.com,
  vishnu@os.amperecomputing.com,  karl.heubaum@oracle.com,
  miguel.luis@oracle.com,  salil.mehta@opnsrc.net,  zhukeqian1@huawei.com,
  wangxiongfeng2@huawei.com,  wangyanan55@huawei.com,
  jiakernel2@gmail.com,  maobibo@loongson.cn,  lixianglai@loongson.cn,
  shahuang@redhat.com,  zhao1.liu@intel.com,  linuxarm@huawei.com
Subject: Re: [PATCH RFC V3 00/29] Support of Virtual CPU Hotplug for ARMv8 Arch
In-Reply-To: <9227bac3-aecd-fbde-3691-5e949373fad0@linaro.org> (Gustavo
	Romero's message of "Wed, 28 Aug 2024 17:35:50 -0300")
References: <20240613233639.202896-1-salil.mehta@huawei.com>
	<9227bac3-aecd-fbde-3691-5e949373fad0@linaro.org>
Date: Thu, 29 Aug 2024 10:59:57 +0100
Message-ID: <87bk1b3azm.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: iVtBP1Hc559u

Gustavo Romero <gustavo.romero@linaro.org> writes:

> Hi Salil,
>
> On 6/13/24 8:36 PM, Salil Mehta via wrote:
<snip>
>> (VI) Commands Used
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> A. Qemu launch commands to init the machine:
>>      $ qemu-system-aarch64 --enable-kvm -machine virt,gic-version=3D3
>> \
>>        -cpu host -smp cpus=3D4,maxcpus=3D6 \
>>        -m 300M \
>>        -kernel Image \
>>        -initrd rootfs.cpio.gz \
>>        -append "console=3DttyAMA0 root=3D/dev/ram rdinit=3D/init maxcpus=
=3D2 acpi=3Dforce" \
>>        -nographic \
>>        -bios QEMU_EFI.fd \
>> B. Hot-(un)plug related commands:
>>    # Hotplug a host vCPU (accel=3Dkvm):
>>      $ device_add host-arm-cpu,id=3Dcore4,core-id=3D4
>>    # Hotplug a vCPU (accel=3Dtcg):
>>      $ device_add cortex-a57-arm-cpu,id=3Dcore4,core-id=3D4
>
> Since support for hotplug is disabled on TCG, remove
> these two lines in v4 cover letter?

Why is it disabled for TCG? We should aim for TCG being as close to KVM
as possible for developers even if it is not a production solution.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
