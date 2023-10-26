Received: by 2002:a05:7022:f409:b0:6e:5a56:ff6c with SMTP id rj9csp597079dlb;
        Thu, 26 Oct 2023 05:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9wdu6tmxpfC+zb5ozbwF8SKByi23J8IOAiGYHGrFAy0SLkiA5NEjZQpksHxv0gWSK+s8Y
X-Received: by 2002:a05:6214:224c:b0:66d:a1d3:fd94 with SMTP id c12-20020a056214224c00b0066da1d3fd94mr20834728qvc.19.1698324070955;
        Thu, 26 Oct 2023 05:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698324070; cv=none;
        d=google.com; s=arc-20160816;
        b=FdgEtV6vxIcDIhNRnB2wJy0xiGCilIypEe5N7o/w+Dv6hQHjNT4Lr0o6qlQjiVL1lB
         Ez7RXOCavc8QCAVz5+41H3GCZg9ZesS0/ox0veZdKZMJNqvKH8RrTX85GKGZTqr48cnC
         NwlN3QAqDXPVjPNIeIm9sJ60l3+9BOlVx17DIq2yRf/cyOUI/foyDBYUn++QkBKQnw5d
         Tnoc2BFP6+30Jntx5yewM89CYOSjIlpDJla+3xJK9Z/GuYBFoUY0jTLIugQTxtpIEi8p
         O4V8fnxNWBVEObebMPKqmPoUZ7NkosooXqDz5PN5Z3cdd9RkFPS86qdSIcv5NlByIyLF
         kG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=+8LLrAduSXNqZUXXnFq+1TDLT+T1Sh1kSSpOXTamkMQ=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=XiVQ1zlXDCaSdzT4u3cEnnDCtC2s64GZ7W9Qw3ZLM9vpyXAk+lcaycrt4mgvFbdHeG
         8zARyo7SuZD41/1RxHRBykzPuv+M3EQdayLdYMY3qkM/lwzs5Dip2UfxpvWnqxRin84x
         4ZBv/jJzkwJzfWjNg0DRfI5JYjXC/iz2sZ0p+7GER1lKOPJ0GiItTZF0nCbhp+fY67Q+
         S+lMUjlATchoe7p0top7gIf2ytrJ1+SM+7k3UE76VeQTrTuWq4cIA82ik7lGZYKY1S1y
         2Gnet4eZScrwdIi8a9rZjcNHZNq6lDwXlrbkczRVbfT+BcYJFlpkmsPQcx1sVKyJg8E9
         lRFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XykjC+2v;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v18-20020ad448d2000000b0066d1e75c07csi9441298qvx.195.2023.10.26.05.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 05:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XykjC+2v;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698324070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8LLrAduSXNqZUXXnFq+1TDLT+T1Sh1kSSpOXTamkMQ=;
	b=XykjC+2vn3/q4WU8aT3HIqxjnHueAUk68bnjdLxb+o0ftbLTMzQvxMvVXBhm6mJocH2Xip
	3t3rdTWZ7h1RfdUOa+Tnxg76QYRUdIe/2WYgeoounNf7j9JCHHyPPBhitAH8e7ZXS+I6gT
	90l3+7a5GS1VZ9Jl/1r9iiHSEAYVNVE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-WNjnU9tWPc-gUXs9N9S3yQ-1; Thu, 26 Oct 2023 08:41:07 -0400
X-MC-Unique: WNjnU9tWPc-gUXs9N9S3yQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9ae57d8b502so57750866b.2
        for <alex.bennee@linaro.org>; Thu, 26 Oct 2023 05:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698324066; x=1698928866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rm7xHyPU7UrFKbHExCp3hETRS4Uo99zPiXo0roR67+8=;
        b=txYdR3jyumKBwqdSnfF9O504dJW0l1SIqbhAjeaAP5DaQZwO8gcnyeTXYUGymm3nbp
         mlB5+X1BV2oBoKprT5D87H3jAjUeZGyxXPzwWe18uMPfdOnxsjb0SHaIBzBvGQO1je4o
         WijqHUPXcYDdKbZDVk4kyUuduKKB9Zj6Pu0dTqLqVHcgA0ADLRzj2xBfiM2IxlEy8KOT
         nJE+I4BXcCi0Dbgj7CvuMCFRLtyxEk6fnkXd/YG88HDAkwp3vaFU5vyg1pd+OHw5V4u4
         KsBFbtwcVyR2aiOWGP3hA1iiTdx0doI6NMMim1l+DWqS/my49qtYzZTkMdyopLqdqyu6
         Z3pg==
X-Gm-Message-State: AOJu0YzlZWWEYC2mDlKfgBjHd3dJ0qEnxqbl+hsBaS9y+jYu/2wl1D/X
	+GCkUbboOhYUQVFSQk2bDDN74eBSJXhmsucVCLDMMRXKsj7p45SOI4F0CuYfxunvOFszIwmJNi1
	EMTqS+bS9zATepfla
X-Received: by 2002:a17:907:60cd:b0:9be:466c:1824 with SMTP id hv13-20020a17090760cd00b009be466c1824mr13930143ejc.11.1698324066293;
        Thu, 26 Oct 2023 05:41:06 -0700 (PDT)
X-Received: by 2002:a17:907:60cd:b0:9be:466c:1824 with SMTP id hv13-20020a17090760cd00b009be466c1824mr13930110ejc.11.1698324065904;
        Thu, 26 Oct 2023 05:41:05 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id lt13-20020a170906fa8d00b009c4cb1553edsm11620259ejb.95.2023.10.26.05.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 05:41:04 -0700 (PDT)
Date: Thu, 26 Oct 2023 14:41:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <linuxarm@huawei.com>
Subject: Re: [PATCH V6 0/9] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20231026144103.565a9566@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231013105129.25648-1-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mO2+4jp/8ax6

On Fri, 13 Oct 2023 11:51:20 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> Virtual CPU hotplug support is being added across various architectures[1=
][3].
> This series adds various code bits common across all architectures:
>=20
> 1. vCPU creation and Parking code refactor [Patch 1]
> 2. Update ACPI GED framework to support vCPU Hotplug [Patch 4,6,7]
> 3. ACPI CPUs AML code change [Patch 5]
> 4. Helper functions to support unrealization of CPU objects [Patch 8,9]
> 5. Misc [Patch 2,3]

Thanks Salil!

Overall series looks good to me (modulo some points, I'd like to be address=
ed)
I'll do some testing and follow with per patch review tomorrow.=20

> Repository:
>=20
> [*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v2.commo=
n.v6
>=20
>=20
> Revision History:
>=20
> Patch-set  V5 -> V6
> 1. Addressed Gavin Shan's comments
>    - Fixed the assert() ranges of address spaces
>    - Rebased the patch-set to latest changes in the qemu.git
>    - Added Reviewed-by tags for patches {8,9}
> 2. Addressed Jonathan Cameron's comments
>    - Updated commit-log for [Patch V5 1/9] with mention of trace events
>    - Added Reviewed-by tags for patches {1,5}
> 3. Added Tested-by tags from Xianglai Li
> 4. Fixed checkpatch.pl error "Qemu -> QEMU" in [Patch V5 1/9]=20
> Link: https://lore.kernel.org/qemu-devel/20231011194355.15628-1-salil.meh=
ta@huawei.com/
>=20
> Patch-set  V4 -> V5
> 1. Addressed Gavin Shan's comments
>    - Fixed the trace events print string for kvm_{create,get,park,destroy=
}_vcpu
>    - Added Reviewed-by tag for patch {1}
> 2. Added Shaoqin Huang's Reviewed-by tags for Patches {2,3}
> 3. Added Tested-by Tag from Vishnu Pajjuri to the patch-set
> 4. Dropped the ARM specific [Patch V4 10/10]
> Link: https://lore.kernel.org/qemu-devel/20231009203601.17584-1-salil.meh=
ta@huawei.com/
>=20
> Patch-set  V3 -> V4
> 1. Addressed David Hilderbrand's comments
>    - Fixed the wrong doc comment of kvm_park_vcpu API prototype
>    - Added Reviewed-by tags for patches {2,4}
> Link: https://lore.kernel.org/qemu-devel/20231009112812.10612-1-salil.meh=
ta@huawei.com/
>=20
> Patch-set  V2 -> V3
> 1. Addressed Jonathan Cameron's comments
>    - Fixed 'vcpu-id' type wrongly changed from 'unsigned long' to 'intege=
r'
>    - Removed unnecessary use of variable 'vcpu_id' in kvm_park_vcpu
>    - Updated [Patch V2 3/10] commit-log with details of ACPI_CPU_SCAN_MET=
HOD macro
>    - Updated [Patch V2 5/10] commit-log with details of conditional event=
 handler method
>    - Added Reviewed-by tags for patches {2,3,4,6,7}
> 2. Addressed Gavin Shan's comments
>    - Remove unnecessary use of variable 'vcpu_id' in kvm_par_vcpu
>    - Fixed return value in kvm_get_vcpu from -1 to -ENOENT
>    - Reset the value of 'gdb_num_g_regs' in gdb_unregister_coprocessor_al=
l
>    - Fixed the kvm_{create,park}_vcpu prototypes docs
>    - Added Reviewed-by tags for patches {2,3,4,5,6,7,9,10}
> 3. Addressed one earlier missed comment by Alex Benn=C3=A9e in RFC V1
>    - Added traces instead of DPRINTF in the newly added and some existing=
 functions
> Link: https://lore.kernel.org/qemu-devel/20230930001933.2660-1-salil.meht=
a@huawei.com/
>=20
> Patch-set V1 -> V2
> 1. Addressed Alex Benn=C3=A9e's comments
>    - Refactored the kvm_create_vcpu logic to get rid of goto
>    - Added the docs for kvm_{create,park}_vcpu prototypes
>    - Splitted the gdbstub and AddressSpace destruction change into separa=
te patches
>    - Added Reviewed-by tags for patches {2,10}
> Link: https://lore.kernel.org/qemu-devel/20230929124304.13672-1-salil.meh=
ta@huawei.com/
>=20
> References:
>=20
> [1] https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.mehta=
@huawei.com/
> [2] https://lore.kernel.org/all/20230913163823.7880-1-james.morse@arm.com=
/
> [3] https://lore.kernel.org/qemu-devel/cover.1695697701.git.lixianglai@lo=
ongson.cn/
>=20
>=20
> Salil Mehta (9):
>   accel/kvm: Extract common KVM vCPU {creation,parking} code
>   hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
>   hw/acpi: Add ACPI CPU hotplug init stub
>   hw/acpi: Init GED framework with CPU hotplug events
>   hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
>   hw/acpi: Update GED _EVT method AML with CPU scan
>   hw/acpi: Update ACPI GED framework to support vCPU Hotplug
>   physmem: Add helper function to destroy CPU AddressSpace
>   gdbstub: Add helper function to unregister GDB register space
>=20
>  accel/kvm/kvm-all.c                    | 64 ++++++++++++++++++++------
>  accel/kvm/trace-events                 |  4 ++
>  gdbstub/gdbstub.c                      | 12 +++++
>  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 +++
>  hw/acpi/cpu.c                          | 27 +++++++----
>  hw/acpi/generic_event_device.c         | 22 +++++++++
>  hw/i386/acpi-build.c                   |  3 +-
>  include/exec/cpu-common.h              |  8 ++++
>  include/exec/gdbstub.h                 |  5 ++
>  include/hw/acpi/cpu.h                  |  5 +-
>  include/hw/acpi/cpu_hotplug.h          |  4 ++
>  include/hw/acpi/generic_event_device.h |  5 ++
>  include/hw/core/cpu.h                  |  1 +
>  include/sysemu/kvm.h                   | 16 +++++++
>  system/physmem.c                       | 29 ++++++++++++
>  15 files changed, 184 insertions(+), 27 deletions(-)
>=20
