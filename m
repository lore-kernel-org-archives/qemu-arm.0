Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp143331njb;
        Thu, 27 Feb 2025 03:08:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXXiu0LRZhdH4QGiPhPl/3ve4pb+kQ9AO0BtjXvg9Xuvs9+Ygh9WS7yoAGCVL2Ak6C+BE1nQPXubwxwg==@linaro.org
X-Google-Smtp-Source: AGHT+IEKxtMtPDhdAHa/g4BFt31LLg58sqzbarX+NZ7xCmR3Ln5Alw6GX001Dn89fQt2LI1W/kLR
X-Received: by 2002:a05:620a:1995:b0:7c0:8950:e3ea with SMTP id af79cd13be357-7c247fe6c8cmr1043961285a.58.1740654526450;
        Thu, 27 Feb 2025 03:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740654526; cv=none;
        d=google.com; s=arc-20240605;
        b=TuH9sIc08TSRZJuQ2hSk07Q0wL5h7w9oYPXbcsVnzmJgpxAuSa+aQCICdRmeQ8o+yd
         p0alkZREz6hDkSwHFa/BPVspNiQY6qwIQaZ+6cx1KZW8Szf8oO7aBaJvNLZvLX4UzCzQ
         p+jZ7rutG4qKR4/vuyziDufW6Zs4LFTwdaeUKoQJJ2FvbGW9f95RyuFZbqplLfyiNLoX
         JNzJPG5pxtB4zzZpQMoXK94zupDvCPGctkFf9z/jQoZewW+5HxCpjtDSxpDqd2OPdiOI
         GnWyAGBY7gBXFnBgBXB6JleePnLcd9yzmmwylcf2OiiKqi1hgNOr015sXnYNVQpJ8Gf0
         1Jqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=yKq6id3xi+nk02MUoh5jQxJO/ciZ0CWs2JFBpSAxIFo=;
        fh=P4RS9JukmZ21CQvKZobEDPuTf7aagFpCfdcx6mggSE4=;
        b=CKYEURUzy1QLCnoUZv/0eBMXIAkiJRWWyzkiIijKz/Vhnx3FLFYALVLDEMzKzIPd9W
         Lk5HRpMVzwVy2mgYh6Bqooe+8Tct4bfyGUpNpJvQLy9EYv95ItFtwoBzrvVw6i83+SPd
         2vQAPj1AmCJD9YV7s6Hk7zbcx5+RGUZlNN/nQL3uyop5VhfjHEqx/x9qsMYpgpyaAWAL
         lRqFlVj2rVUGgyz/g5igiLUbP4g6vfn16LmYYZ5PN2BKJHKs9BFmtVh5wPQnJF4Dn44A
         5PmyRLvtDYElcUFy9AJNAsAcrg3YDjNXqvxiZ67Zu/EsevHOWymLLU3q+aEFQdBS4w1t
         7HZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Pq91ovwN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378da8fe8si102455885a.582.2025.02.27.03.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 03:08:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Pq91ovwN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tnbiy-00082I-Kq; Thu, 27 Feb 2025 06:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbiV-00078E-Nv; Thu, 27 Feb 2025 06:06:18 -0500
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbiK-0007uT-Hw; Thu, 27 Feb 2025 06:06:09 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 98EAD6114B;
 Thu, 27 Feb 2025 11:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8F1C4CEDD;
 Thu, 27 Feb 2025 11:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740654332;
 bh=30VEPafuYaXUOzx4ugW+Q9XaK63O/Un27g6xe0Hutbk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pq91ovwNVBny9JMf8+HSNMd53hixAs09BNZdZs5+XZvukQo19RDYmaAYsKuKnRqbO
 6qo83flXm7EcwbmofLf+K/qhsk3B2bAqdNTMyY/WKXRgvC0HaoCsudv+HdBkrxGgIy
 W4UCV9K8pWXY1D6xpT48SrVORm8c4TjrcMZJLrS0G06NvYq+PWtK/eobNmfWXSBSh/
 CVsZJQvI+myXNB+tNggscbw4QICP4mKpEB9mI3ofP3VY4nQvRUr5s9XHr7OZbBwiCw
 Ng8h4v4zAUUE26KyhVo+9/xOxpgQphhwKFZmhAOYf68HoY/Kn1nPA1H87h4vqpLuKN
 BwGFkzU7lAAHg==
Date: Thu, 27 Feb 2025 12:05:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
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
Message-ID: <20250227120525.66c348a0@foz.lan>
In-Reply-To: <20250227105454.69e3d459@imammedo.users.ipa.redhat.com>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
 <20250227105454.69e3d459@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2600:3c04::f03c:95ff:fe5e:7468;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I9BsHbl7PCME

Em Thu, 27 Feb 2025 10:54:54 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Fri, 21 Feb 2025 15:35:09 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Now that the ghes preparation patches were merged, let's add support
> > for error injection.
> > 
> > On this series, the first 6 patches chang to the math used to calculate offsets at HEST
> > table and hardware_error firmware file, together with its migration code. Migration tested
> > with both latest QEMU released kernel and upstream, on both directions.
> > 
> > The next patches add a new QAPI to allow injecting GHESv2 errors, and a script using such QAPI
> >    to inject ARM Processor Error records.
> > 
> > ---
> > v4:
> > - added an extra comment for AcpiGhesState structure;
> > - patches reordered;
> > - no functional changes, just code shift between the patches in this series.
> > 
> > v3:
> > - addressed more nits;
> > - hest_add_le now points to the beginning of HEST table;
> > - removed HEST from tests/data/acpi;
> > - added an extra patch to not use fw_cfg with virt-10.0 for hw_error_le
> > 
> > v2: 
> > - address some nits;
> > - improved ags cleanup patch and removed ags.present field;
> > - added some missing le*_to_cpu() calls;
> > - update date at copyright for new files to 2024-2025;
> > - qmp command changed to: inject-ghes-v2-error ans since updated to 10.0;
> > - added HEST and DSDT tables after the changes to make check target happy.
> >   (two patches: first one whitelisting such tables; second one removing from
> >    whitelist and updating/adding such tables to tests/data/acpi)
> > 
> > 
> > 
> > Mauro Carvalho Chehab (14):
> >   acpi/ghes: prepare to change the way HEST offsets are calculated
> >   acpi/ghes: add a firmware file with HEST address
> >   acpi/ghes: Use HEST table offsets when preparing GHES records
> >   acpi/ghes: don't hard-code the number of sources for HEST table
> >   acpi/ghes: add a notifier to notify when error data is ready
> >   acpi/ghes: create an ancillary acpi_ghes_get_state() function
> >   acpi/generic_event_device: Update GHES migration to cover hest addr
> >   acpi/generic_event_device: add logic to detect if HEST addr is
> >     available
> >   acpi/generic_event_device: add an APEI error device
> >   tests/acpi: virt: allow acpi table changes for a new table: HEST
> >   arm/virt: Wire up a GED error device for ACPI / GHES
> >   tests/acpi: virt: add a HEST table to aarch64 virt and update DSDT
> >   qapi/acpi-hest: add an interface to do generic CPER error injection
> >   scripts/ghes_inject: add a script to generate GHES error inject
> > 
> >  MAINTAINERS                                   |  10 +
> >  hw/acpi/Kconfig                               |   5 +
> >  hw/acpi/aml-build.c                           |  10 +
> >  hw/acpi/generic_event_device.c                |  43 ++
> >  hw/acpi/ghes-stub.c                           |   7 +-
> >  hw/acpi/ghes.c                                | 231 ++++--
> >  hw/acpi/ghes_cper.c                           |  38 +
> >  hw/acpi/ghes_cper_stub.c                      |  19 +
> >  hw/acpi/meson.build                           |   2 +
> >  hw/arm/virt-acpi-build.c                      |  37 +-
> >  hw/arm/virt.c                                 |  19 +-
> >  hw/core/machine.c                             |   2 +
> >  include/hw/acpi/acpi_dev_interface.h          |   1 +
> >  include/hw/acpi/aml-build.h                   |   2 +
> >  include/hw/acpi/generic_event_device.h        |   1 +
> >  include/hw/acpi/ghes.h                        |  54 +-
> >  include/hw/arm/virt.h                         |   2 +
> >  qapi/acpi-hest.json                           |  35 +
> >  qapi/meson.build                              |   1 +
> >  qapi/qapi-schema.json                         |   1 +
> >  scripts/arm_processor_error.py                | 476 ++++++++++++
> >  scripts/ghes_inject.py                        |  51 ++
> >  scripts/qmp_helper.py                         | 702 ++++++++++++++++++
> >  target/arm/kvm.c                              |   7 +-
> >  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
> >  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
> >  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
> >  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
> >  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
> >  29 files changed, 1677 insertions(+), 79 deletions(-)
> >  create mode 100644 hw/acpi/ghes_cper.c
> >  create mode 100644 hw/acpi/ghes_cper_stub.c
> >  create mode 100644 qapi/acpi-hest.json
> >  create mode 100644 scripts/arm_processor_error.py
> >  create mode 100755 scripts/ghes_inject.py
> >  create mode 100755 scripts/qmp_helper.py
> >   
> 
> once you enable, ras in tests as 1st patches and fixup minor issues
> please try to do patch by patch compile/bios-tables-test testing, to avoid
> unnecessary respin in case at table change crept in somewhere unnoticed. 

Just submitted v5.

I took some extra care to avoid bisect issues. Still checkpatch 
had some warnings, but they seemed false positives.

Thanks,
Mauro
