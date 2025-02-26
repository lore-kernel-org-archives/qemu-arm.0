Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp953638njg;
        Wed, 26 Feb 2025 06:52:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUDK34TldXwW/PB+P4apHJXFyD5DFQ7fGTyoUtoNe1STRM5hF4PcnhNo+NaePDDsehVkHGIMhTjhkby2A==@linaro.org
X-Google-Smtp-Source: AGHT+IEY4Kz/4MBe7DojSJHvFq/hBhz7LX1+KM0pzrrp5yVBiPY5o/VlCRJXWWfqrV762KCL5tIr
X-Received: by 2002:ac8:5d51:0:b0:471:cb02:fcd7 with SMTP id d75a77b69052e-4738136c443mr51300371cf.38.1740581524502;
        Wed, 26 Feb 2025 06:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740581524; cv=none;
        d=google.com; s=arc-20240605;
        b=IA68EebZgZCq11TbCb16vuLKek/tiebuwST5q2scWuSiOrbTlUgRt4p3zMVIkN7k7Q
         1ZtaeO8sgc+UoIlJ00VyY2LGmPEGLVvmgINTgG4QDfbJwnbE0as+GIEj2tzzatMufLRL
         ozxzXGoWzD2LKFNj0ldLHcsbjpxjDgZRGenzjLQcS9u2wFDzFfKDzIIAElDfkIZ9aoid
         kqVpO3AuYubpOWRHPz50zm5K8hXlZ6wY8+urtakstKX8WnOkxog2AVPUDn9XbwKcXh8a
         qH4yeCVVqOH68B8tX8D75gluEhm4G0HkrwRl2uAYN+20Y2A9bDhot1SPUHeMTeusm1Ow
         ppCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=hjDcNMS3m2KvFYfCArjaQPKsyojcR0O9nS1Ii1LdD30=;
        fh=TkJqJ36BsuIH258kcKpTp/sDhvnPWO7Eb6w8QafZ+Fw=;
        b=dWPxGVnJiKNXOMU8aeUOA2eGonraPqJGL4FnXfdxYYdr93ZPjdVzVZMihGD5iGYe1y
         h3z+Yg6yyyYTNW6wINKYhiCA/HQDuxc76EHlwfBsGwC+pzfl/437HBMVE44OcQyKjy60
         y2nIuzcW7MW2cBYT8llQbrzwiaINcjQV0wzzAsRhzVtWNvEo9hXg+E6CCsDBkBJDAarv
         5RFFdKKbmwf1irgEHUxMEVPg7FcUB8lKEH9ElyLHavLxz/3S0J4L0beEV9iF/VfAgrgq
         ei5f0iQII1BNGx+k+qO1zi1RPFAmqQtzCHwxQ0w9VfacPjfbEAj+GgrJyHK3Gt1Kouev
         dXPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UQnMc1BD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47378095922si37665451cf.396.2025.02.26.06.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 06:52:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UQnMc1BD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnIlR-0002BZ-J6; Wed, 26 Feb 2025 09:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnIlL-0002Aw-JX
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 09:51:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnIlJ-0004jb-M2
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 09:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740581508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjDcNMS3m2KvFYfCArjaQPKsyojcR0O9nS1Ii1LdD30=;
 b=UQnMc1BDaDsNwdLxhI+X9StFsobLf5tzeWj5AZ7tZiU2fF2yTBJFOo4j19nglFbJDzjgas
 SSgWJ1jsO+S6+aMXnxjOkanYxs6APcYAH/4ncdWdwL2+m+MLXFreOKO+wRgJBsJwBlVo8U
 KSTQj3s8P8hbRWaSMe2JLFKOA3smwMM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-45mNjhQoOAu-3rJ090qF5g-1; Wed, 26 Feb 2025 09:51:46 -0500
X-MC-Unique: 45mNjhQoOAu-3rJ090qF5g-1
X-Mimecast-MFC-AGG-ID: 45mNjhQoOAu-3rJ090qF5g_1740581506
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4398a60b61fso35199735e9.0
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 06:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740581505; x=1741186305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjDcNMS3m2KvFYfCArjaQPKsyojcR0O9nS1Ii1LdD30=;
 b=VkrXFer9f2jyhVe5qxcHaVaWPvlJMHBBf1QJpD18GAwFQHIIhCIHUbruR2Pl4D4Lld
 p4oI13/Z8ZnnhDvvub/JQwHf+XmNtBTijxu/dyIRd8z+MojklYBu7viBZIRTCVnxPzPK
 SHWprNMrxNCUUrk8QoxL+Wvf0rq20qX1mkPcKLZtb9V/JinqlBWlmcMct7Di1SRosNKV
 MVb0T3s63q4jVVcjriJnPaKvwgCtaLB1j1cDJI3WJlnZPIFeVZp1sCpqbOPu0tFQD1LU
 lD/zaeJYGwvtwlcAhh1FIUflpcSRj2HksjVD/u5aLmzWwaecWcXG+jVfccEbEpzizwY3
 7bDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMgQhXngdDF5zxAL72y9ToHGs6XmvicwbuXLGVxFdKCyP+sZdSa3rb4rHwfIHGD+7hUws7kHafYA==@nongnu.org
X-Gm-Message-State: AOJu0YzIhBHAnXwVi0sbuWf5vZDzoZ82yVhfRyqePqbM4VNZc/rfFxz4
 zfKWN/abQKer5cbSPficE1CoerkA38a5tLGmr3f4yfZbmrxDoG/x0JwF/Mtym4CoJRRqfYj2RZB
 7J5JNHAJ7+BNhDaqDbH6ExEDyssdpyNgwXE5GvJIcC7beJr76Mg==
X-Gm-Gg: ASbGncssOy83p1OKDUCW4H96+YYoV3Y3HnsHu/zk3w/Fy1xeWADo5IpgBLcG7xtifzL
 sAaUa5vVsIwtUl/cHKIQ6VHzVsX8Kk0UEQ/Y6l2+PYl+dx+KZEcH+othKv/rMcYNpFMF80Al8nm
 FvrDREl93VJo3KbSnuAQUI7g9BMi0Fy/g/Zrm5javN0ERTAsKYMaNnBQ6ebquKf+YSngi7hPURC
 1VVbvem27rpS8s9vbH+Gqgmgq7UDUTATUx6FsJDLmh5F6I/IRbVeipWMcWDHSmJM5utgrZqZLyV
 W6AtJzrXNuIlHsvz/V8HBd1vJeV9MxeyLidfa+8fIp0cyedI/e/Tf/zjtac9q1w=
X-Received: by 2002:a05:600c:4588:b0:439:88bb:d020 with SMTP id
 5b1f17b1804b1-43ab0f2dcb1mr60884595e9.8.1740581505538; 
 Wed, 26 Feb 2025 06:51:45 -0800 (PST)
X-Received: by 2002:a05:600c:4588:b0:439:88bb:d020 with SMTP id
 5b1f17b1804b1-43ab0f2dcb1mr60884275e9.8.1740581505080; 
 Wed, 26 Feb 2025 06:51:45 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8e71c0sm5790989f8f.78.2025.02.26.06.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 06:51:44 -0800 (PST)
Date: Wed, 26 Feb 2025 15:51:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Eric Blake
 <eblake@redhat.com>, John Snow <jsnow@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Zhao Liu
 <zhao1.liu@intel.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/14] Change ghes to use HEST-based offsets and add
 support for error inject
Message-ID: <20250226155143.0e4a05f8@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250226153913.27255b1e@sal.lan>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
 <20250226151656.10665bc9@imammedo.users.ipa.redhat.com>
 <20250226153913.27255b1e@sal.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D7jWWNtFSlPiRqeI-FUYm3_akI8bKzfoIsdVdb2BBPc_1740581506
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AEkxypxkprLy

On Wed, 26 Feb 2025 15:39:13 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Wed, 26 Feb 2025 15:16:56 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Fri, 21 Feb 2025 15:35:09 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > Now that the ghes preparation patches were merged, let's add support
> > > for error injection.
> > > 
> > > On this series, the first 6 patches chang to the math used to calculate offsets at HEST
> > > table and hardware_error firmware file, together with its migration code. Migration tested
> > > with both latest QEMU released kernel and upstream, on both directions.
> > > 
> > > The next patches add a new QAPI to allow injecting GHESv2 errors, and a script using such QAPI
> > >    to inject ARM Processor Error records.    
> > 
> > please, run ./scripts/checkpatch on patches before submitting them.
> > as it stands now series cannot be merged due to failing checkpatch  
> 
> Weird... checkpatch is at pre-commit hook, as recommended at QEMU 
> documentation. It is actually a little harder to manage this way, as it 
> sometimes cause troubles with binary files.
> 
> Anyway, I'll run it by hand before sending the next version.

I've just applied v4 => format-patch => checkpatch
maybe I did something wrong (don't see how) but it complains overhere


PS: do not respin until I've finish this review.
 
> >   
> > > 
> > > ---
> > > v4:
> > > - added an extra comment for AcpiGhesState structure;
> > > - patches reordered;
> > > - no functional changes, just code shift between the patches in this series.
> > > 
> > > v3:
> > > - addressed more nits;
> > > - hest_add_le now points to the beginning of HEST table;
> > > - removed HEST from tests/data/acpi;
> > > - added an extra patch to not use fw_cfg with virt-10.0 for hw_error_le
> > > 
> > > v2: 
> > > - address some nits;
> > > - improved ags cleanup patch and removed ags.present field;
> > > - added some missing le*_to_cpu() calls;
> > > - update date at copyright for new files to 2024-2025;
> > > - qmp command changed to: inject-ghes-v2-error ans since updated to 10.0;
> > > - added HEST and DSDT tables after the changes to make check target happy.
> > >   (two patches: first one whitelisting such tables; second one removing from
> > >    whitelist and updating/adding such tables to tests/data/acpi)
> > > 
> > > 
> > > 
> > > Mauro Carvalho Chehab (14):
> > >   acpi/ghes: prepare to change the way HEST offsets are calculated
> > >   acpi/ghes: add a firmware file with HEST address
> > >   acpi/ghes: Use HEST table offsets when preparing GHES records
> > >   acpi/ghes: don't hard-code the number of sources for HEST table
> > >   acpi/ghes: add a notifier to notify when error data is ready
> > >   acpi/ghes: create an ancillary acpi_ghes_get_state() function
> > >   acpi/generic_event_device: Update GHES migration to cover hest addr
> > >   acpi/generic_event_device: add logic to detect if HEST addr is
> > >     available
> > >   acpi/generic_event_device: add an APEI error device
> > >   tests/acpi: virt: allow acpi table changes for a new table: HEST
> > >   arm/virt: Wire up a GED error device for ACPI / GHES
> > >   tests/acpi: virt: add a HEST table to aarch64 virt and update DSDT
> > >   qapi/acpi-hest: add an interface to do generic CPER error injection
> > >   scripts/ghes_inject: add a script to generate GHES error inject
> > > 
> > >  MAINTAINERS                                   |  10 +
> > >  hw/acpi/Kconfig                               |   5 +
> > >  hw/acpi/aml-build.c                           |  10 +
> > >  hw/acpi/generic_event_device.c                |  43 ++
> > >  hw/acpi/ghes-stub.c                           |   7 +-
> > >  hw/acpi/ghes.c                                | 231 ++++--
> > >  hw/acpi/ghes_cper.c                           |  38 +
> > >  hw/acpi/ghes_cper_stub.c                      |  19 +
> > >  hw/acpi/meson.build                           |   2 +
> > >  hw/arm/virt-acpi-build.c                      |  37 +-
> > >  hw/arm/virt.c                                 |  19 +-
> > >  hw/core/machine.c                             |   2 +
> > >  include/hw/acpi/acpi_dev_interface.h          |   1 +
> > >  include/hw/acpi/aml-build.h                   |   2 +
> > >  include/hw/acpi/generic_event_device.h        |   1 +
> > >  include/hw/acpi/ghes.h                        |  54 +-
> > >  include/hw/arm/virt.h                         |   2 +
> > >  qapi/acpi-hest.json                           |  35 +
> > >  qapi/meson.build                              |   1 +
> > >  qapi/qapi-schema.json                         |   1 +
> > >  scripts/arm_processor_error.py                | 476 ++++++++++++
> > >  scripts/ghes_inject.py                        |  51 ++
> > >  scripts/qmp_helper.py                         | 702 ++++++++++++++++++
> > >  target/arm/kvm.c                              |   7 +-
> > >  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
> > >  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
> > >  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
> > >  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
> > >  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
> > >  29 files changed, 1677 insertions(+), 79 deletions(-)
> > >  create mode 100644 hw/acpi/ghes_cper.c
> > >  create mode 100644 hw/acpi/ghes_cper_stub.c
> > >  create mode 100644 qapi/acpi-hest.json
> > >  create mode 100644 scripts/arm_processor_error.py
> > >  create mode 100755 scripts/ghes_inject.py
> > >  create mode 100755 scripts/qmp_helper.py
> > >     
> >   
> 

