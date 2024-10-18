Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp865235njb;
        Fri, 18 Oct 2024 07:46:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxqWNCa5GfyEmfbdK45hWkp04NJdSrlztKs1fqn0mEhdeOGoD9BCysc6AUIrWvhzwTXXlF46AZBXHzgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHWODq5gY0bKOHQ2h5em11JEw2lSd3A51U/+Sf1lV5frtDA+qslF0dCAGA/AYB/Xs0IZn9R
X-Received: by 2002:a05:6102:2acc:b0:4a4:87a7:88ed with SMTP id ada2fe7eead31-4a5c48ef4a5mr5255123137.2.1729262797468;
        Fri, 18 Oct 2024 07:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729262797; cv=none;
        d=google.com; s=arc-20240605;
        b=XHEVdpTSR84BSji4sar+Z7u6sRblIDpMfCMjkaUBkmgM3GPj2w8b7lctMkpSQ5gThu
         31h0ay7pZ/J6gS6ZEMhvojhLGFBjeev/pYqBDe8tek3rF4jyrEqEIU6pzhxvwSDnr7cy
         u4XCLmOaVehSWsCfH7wxiHfiQAvy4DQzhQj6cNYYoMGXOeTfHaa5jkuwb4yNMK91NAri
         ywQdW+5StNFQfS0mNHSNUSvFmcBWyMaEeyED8us3X3kr4Y9rPwt6JNYA9i/VvWHOiXrU
         55B7mhJbnX1oXyQBh0ApoQPkjRIZdbaAtiv5DcNqOkyAYkBaESk74h326kQrpgBcr3sR
         W1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=i/ztCsWLlUUVGVa5aydX3kmHSXu4gICaoiz1Ks7rfqw=;
        fh=IGlciV6GBkKPDa/59auavX9LG0P4PF9f9sNGBaRr2tI=;
        b=JqqIIj6iCxPhGBq6rAqLa6fmUCD15KwVr8k3vKxvmzgdVHHfFgmztYC9uU5iqtgYbv
         NSDOXsbdOeS+Lb4rsrWEMpMhiQXyl9lWhIJ30LGzndzdmXaGGjqONgrGSqwPipujGeRF
         z19xCrlSgw3+GEHba64WDNqWmXAX1j0zhsz2dlIjzGmEFSFnR7gEgd75ODrgnY2XBITG
         9S/J9o4lnD1Ld7txs40d5i/G4QgJT8akexuNP5Q0UueSFlZCOdKMt/ZgFV1aUfNjif2z
         yce5Q4d9Lzu7DOVMyxo7TO+S8ys7ur8nwVWe7f3/fold540HZez4jtqL4kgHL0CWCTW4
         MCBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZrE+wHSD;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-851e587fca7si311264241.92.2024.10.18.07.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZrE+wHSD;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729262797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/ztCsWLlUUVGVa5aydX3kmHSXu4gICaoiz1Ks7rfqw=;
	b=ZrE+wHSDK8czX/eQqr2xBTMVoUdtLEQVusqE7o2DYNRvMIrK08eBv1AITpzKbrJic9pDQQ
	J8gArjWp2x1zwyF0EboDXb0BJfjIawPTDuDPWG72uDNX5L4gc/WnPl0mf63mPMw7FI4OkT
	uJ29pxQIuc/rlEjiKw+YKaRHyAwPfjk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-eammRiA9PKqUvuXvuwqLxw-1; Fri, 18 Oct 2024 10:46:33 -0400
X-MC-Unique: eammRiA9PKqUvuXvuwqLxw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4315cefda02so12744845e9.0
        for <alex.bennee@linaro.org>; Fri, 18 Oct 2024 07:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729262793; x=1729867593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dr4lak5IERRTFNRFjxYnCwZFdfA+aOpOjEHMGekPVRY=;
        b=tjhjt1M3Zm5gHfz6fmijr2Ji5RNU/JiiM37NqTzCVIho6yxjqngLfKdoUtj8OR7B7c
         k3Zpc9ctf0/2WgalTGsSDBqq20V99RDr5dDG6ZErQtb6PtlXNTeAxiD86uMyf8XDO2cJ
         SaQReLBz9NDHDKgTlWARLfm2fxh8D0u1+rFLwZM6SNNr3mmzZV3n2TawfEOA6Dy4EjXN
         1J9vwjy3hzYgkBAHS7X9/PdL/pEMg+YpxvfNPH4Z7a9r/XegPoPNjpq7bqrCSofhAf+h
         TRlgSLCLZ1aDI0cMr1zJ//IAEUYAicutinQoW+TrvLhPcX8+Q4i4xcyHDdU/Z0mF3xdA
         L5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiEcvnelQgtak5Mo+5JWhAo3XDyhl1yH+NfttL3wINBppNsnK4aenMNVd0o89BBVd8JEwodV/XsXqMKA==@linaro.org
X-Gm-Message-State: AOJu0YwL6InP7PmL1EzsEjUF9Rn7OTbA1vJjCVPQZcFnWBvwlPOkbaZb
	+sU/zAjjY2b0MVvAVZw2bvb6o5xEB3slUUFkt9hzZof7Jv2+FhkQdb1eacSu3b7LtHpsEc3Mvzo
	16p6Os0ui+GHnFHizZpPo1Lrj+3IFvwA7TI8SFGIEflYdR5GT+thTqg==
X-Received: by 2002:a05:600c:5489:b0:431:52b7:a499 with SMTP id 5b1f17b1804b1-4316164da71mr21633475e9.20.1729262792680;
        Fri, 18 Oct 2024 07:46:32 -0700 (PDT)
X-Received: by 2002:a05:600c:5489:b0:431:52b7:a499 with SMTP id 5b1f17b1804b1-4316164da71mr21633265e9.20.1729262792205;
        Fri, 18 Oct 2024 07:46:32 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e445ddsm25955015e9.38.2024.10.18.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:46:31 -0700 (PDT)
Date: Fri, 18 Oct 2024 16:46:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
 <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <andrew.jones@linux.dev>, <david@redhat.com>, <philmd@linaro.org>,
 <eric.auger@redhat.com>, <will@kernel.org>, <ardb@kernel.org>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <gshan@redhat.com>,
 <rafael@kernel.org>, <borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
 <npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <shahuang@redhat.com>, <zhao1.liu@intel.com>,
 <linuxarm@huawei.com>, <gustavo.romero@linaro.org>
Subject: Re: [PATCH V1 0/4] Arch agnostic ACPI changes to support vCPU
 Hotplug (on Archs like ARM)
Message-ID: <20241018164629.2939b711@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241014192205.253479-1-salil.mehta@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xQ++JOFVSs0z

On Mon, 14 Oct 2024 20:22:01 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> Certain CPU architecture specifications [1][2][3] prohibit changes to the=
 CPUs
> *presence* after the kernel has booted. This is because many system
> initializations depend on the exact CPU count at boot time and do not exp=
ect it
> to change afterward. For example, components like interrupt controllers t=
hat are
> closely coupled with CPUs, or various per-CPU features, may not support
> configuration changes once the kernel has been initialized.
>=20
> This requirement poses a challenge for virtualization features like vCPU
> hotplug. To address this, changes to the ACPI AML are necessary to update=
 the
> `_STA.PRES` (presence) and `_STA.ENA` (enabled) bits accordingly during g=
uest
> initialization, as well as when vCPUs are hot-plugged or hot-unplugged. T=
he
> presence of unplugged vCPUs may need to be deliberately *simulated* at th=
e ACPI
> level to maintain a *persistent* view of vCPUs for the guest kernel.

the series is peppered with *simulated* idea, which after looking at code
I read as 'fake'. While it's obvious to author why things need to be faked
at this time, it will be forgotten later on. And cause a lot swearing from
whoever will have to deal with this code down the road.

Salil, I'm sorry that review comes out as mostly negative but for me having=
 to
repeat 'simulated' some many times, hints that the there is
something wrong with design and that we should re-evaluate the approach.

ps:
see comments on 1/4 for suggestions


> This patch set introduces the following features:
>=20
> 1. ACPI Interface with Explicit PRESENT and ENABLED CPU States: It allows=
 the
>    guest kernel to evaluate these states using the `_STA` ACPI method.
>   =20
> 2. Initialization of ACPI CPU States: These states are initialized during
>    `machvirt_init` and when vCPUs are hot-(un)plugged. This enables hotpl=
uggable
>    vCPUs to be exposed to the guest kernel via ACPI.
>=20
> 3. Support for Migrating ACPI CPU States: The patch set ensures the migra=
tion of
>    the newly introduced `is_{present,enabled}` ACPI CPU states to the
>    destination VM.
>=20
> The approach is flexible enough to accommodate ARM-like architectures tha=
t
> intend to implement vCPU hotplug functionality. It is suitable for archit=
ectures
> facing similar constraints to ARM or those that plan to implement vCPU
> hotplugging independently of hardware support (if available).
>=20
> This patch set is derived from the ARM-specific vCPU hotplug implementati=
on [4]
> and includes migration components adaptable to other architectures, follo=
wing
> suggestions [5] made by Igor Mammedov <imammedo@redhat.com>.
>=20
> It can be applied independently, ensuring compatibility with existing hot=
plug
> support in other architectures. I have tested this patch set in conjuncti=
on with
> the ARM-specific vCPU hotplug changes (included in the upcoming RFC V5 [6=
]), and
> everything worked as expected. I kindly request maintainers of other
> architectures to provide a "Tested-by" after running their respective reg=
ression
> tests.
>=20
> Many thanks!
>=20
>=20
> References:
> [1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt C=
PU Hotplug on
>     architectures that don=E2=80=99t Support CPU Hotplug (like ARM64)
>     a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug=
_7OJ1YyJ.pdf
>     b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_i=
n_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
> [2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotp=
lug on
>     SoC Based Systems (like ARM64)
>     Link: https://kvmforum2020.sched.com/event/eE4m
> [3] Check comment 5 in the bugzilla entry
>     Link: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4481#c5
> [4] [PATCH RFC V4 00/33] Support of Virtual CPU Hotplug for ARMv8 Arch
>     Link: https://lore.kernel.org/qemu-devel/20241009031815.250096-1-sali=
l.mehta@huawei.com/T/#mf32be203baa568a871dc625b732f666a4c4f1e68
> [5] Architecture agnostic ACPI VMSD state migration (Discussion)
>     Link: https://lore.kernel.org/qemu-devel/20240715155436.577d34c5@imam=
medo.users.ipa.redhat.com/
> [6] Upcoming RFC V5, Support of Virtual CPU Hotplug for ARMv8 Arch
>     Link: https://github.com/salil-mehta/qemu/commits/virt-cpuhp-armv8/rf=
c-v5
>=20
> Salil Mehta (4):
>   hw/acpi: Initialize ACPI Hotplug CPU Status with Support for vCPU
>     `Persistence`
>   hw/acpi: Update ACPI CPU Status `is_{present, enabled}` during vCPU
>     hot(un)plug
>   hw/acpi: Reflect ACPI vCPU {present,enabled} states in ACPI
>     _STA.{PRES,ENA} Bits
>   hw/acpi: Populate vCPU Hotplug VMSD to migrate `is_{present,enabled}`
>     states
>=20
>  cpu-target.c         patches.vcpuhp.rfc-v5.arch.agnostic.acpi          |=
  1 +
>  hw/acpi/cpu.c                  | 70 +++++++++++++++++++++++++++++++---
>  hw/acpi/generic_event_device.c | 11 ++++++
>  include/hw/acpi/cpu.h          | 21 ++++++++++
>  include/hw/core/cpu.h          | 21 ++++++++++
>  5 files changed, 119 insertions(+), 5 deletions(-)
>=20
