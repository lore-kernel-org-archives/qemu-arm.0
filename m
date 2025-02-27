Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp219429njb;
        Thu, 27 Feb 2025 05:30:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWExAKfnHKCbtx1nX2yjEpxNfJnV0e3Ybpfd7KRLx+NKd3PyGs4pyPLf6+2m9DtvVEu/+PQ5QcW5lBcNw==@linaro.org
X-Google-Smtp-Source: AGHT+IH+sK9uK6aO08vqrEUeRUIntwidpy9N6G5C26ubIyiA7kxcyXvhVONmJlHpr4sBoRu5BT2j
X-Received: by 2002:ac8:59c4:0:b0:471:f08e:d661 with SMTP id d75a77b69052e-4722473c3e4mr427919181cf.13.1740663057244;
        Thu, 27 Feb 2025 05:30:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740663057; cv=none;
        d=google.com; s=arc-20240605;
        b=iLwD3JMyW2Nqgmkf+AOOQAXq8dPI/4V6JA2CaUk7F4a4/g3VpQ4ZvKQdl2y170ZMT9
         sHH7zvl8yxQrZn5ITv1uPGQgt/8MeFOFV7Z3sMICogOsSNRALHB8wBlaR73kXn3X0mRB
         wLnCuue2CCYGt+Z4YI/YPLM0UOfXMGGH6bSrHdfu5IdmU2bzbk+QhH652WmH6vacjFuO
         LDxLvAzlOEmlwaKMTNqBtx30nSnW+NFfUj9R7QslN9QrmNO3piu6AaMb+j1ktVARrXSk
         PmUhxsyXSROhic4EY9do4osjy8a3Zuz3wWHYYS1fau+arG7TSmfVTwcHgU41kAApfcRd
         jErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=10kUSJV4EUd1FzHZvX0wjBLQDNiAVBrIFn/OMdDmjA4=;
        fh=8O5xUjBFqdWI65tDBaG7b/9U3zm0U8oyC74cBpwqIwg=;
        b=REdBcFUpnHvuQqWwLdgwEsLRVHpFV45x5gWeRb4+FKwYwwHOg1zfOKv9tLj3c6G7Ui
         8DNwNLm1xmePXAKgZ4Du3uD1wxuLQTSbGAQq751+y3cYDJnrVaNZrrIR5cTn0bll7+Sf
         miEn2SNGCsQnXy1Z7NrnBKjNKOVugXqZNj/7wj5CaJ5yNaeQvAy1BqQMPP+9nAw1ZX/s
         p+NimUY/+96eFIqckuMyUjlDXJaerd5ckxH4d0YxSl6Seur+1U0uCmw6LsXEblos2Hjh
         D4X+LJwPNDLt0biSSIDRi/h1aGws/s/uOpEHt95I+x9Ys9HobF8QnuieiHsWx3kfXuRr
         WOuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q0dYoV8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4747240ddc9si12337731cf.372.2025.02.27.05.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 05:30:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q0dYoV8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tndyS-0003Rm-Dz; Thu, 27 Feb 2025 08:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tndyJ-0003QY-3v
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 08:30:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tndyF-0002hn-FH
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 08:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740663032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10kUSJV4EUd1FzHZvX0wjBLQDNiAVBrIFn/OMdDmjA4=;
 b=Q0dYoV8W4ZvDE2RFBqnv6RzyT3Hf7zLGwcYK4o6O0wrAkPyyrUqQEgMHAlfmTmvulBOHYw
 7BzaVhdMyTtbABwce524SVwiss0rcKVOU0yjNiIFGyrnn+dkFKCApBE4yAlAQZJNfJVQ3Y
 SG45MMTbOebTPma+e7noniW9EpSAbek=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-kSG2106cOhWSgRA-gy-1qg-1; Thu, 27 Feb 2025 08:30:31 -0500
X-MC-Unique: kSG2106cOhWSgRA-gy-1qg-1
X-Mimecast-MFC-AGG-ID: kSG2106cOhWSgRA-gy-1qg_1740663030
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-390e8df7ab6so182677f8f.3
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 05:30:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740663030; x=1741267830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=10kUSJV4EUd1FzHZvX0wjBLQDNiAVBrIFn/OMdDmjA4=;
 b=gB2FMgsKEvm8LCTJIDg0RFu7yJceII7tw9YVzi3NAvnZJgoCJISj4IBrKhrTh97bwy
 QYJ6onzonxU6F04sOz8felHdXXgiJ3Pt8OIW/ZDNQOi2F5YXnkIMRkEIT/cYBqRFdtfh
 siRl3cHyjrXQk2voXdX90WscqFlQ9YwzWGhf/DJCJdTlz2E5vhpbt6SdUZmopO+R9JjA
 zlCLrk4fx0JKkPDoknIDJDF3fFKXDtLXH5ZLDedyzVUm1H6c/rkYlFy0niV75HzrPqCb
 Yyw5p8OAfIhE9nqyW/wwm654wwn3OOpuvGAHUxHwsbjZj2tQsI4J+94HfF0qVT1+d+ba
 keRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjxKMWMU5wqm/sGOapYLNCmKfGln8yabR/n4+RjGGU1Fao1hOOyC1rY8KjfuTEEl3+W/b0S5/alw==@nongnu.org
X-Gm-Message-State: AOJu0Yz+m5/cxo8JV5dyEKnurd+LGRVnG/5WlQcgW2d2nffk6agz1wdS
 F7lvpCCss7+6DUPZAE7PuByYwrVLox/hxiky5Dc8m0bsjP8f4SzNVULf4xo5hEhHlYUkth/rmE2
 40Zs4t5pBy6zPWJMuwcfs76DNmikqRaYeMOunrHMPPrZppnINGQ==
X-Gm-Gg: ASbGncsjiD+swhgG26oYxcxU7KHi9yoppT2DaJdcwZsMp7gxbDY/hg/qCd1l94J285f
 uk8lZMwwltG9VOKwegsGcrDiQZAgR9KwrSxrptJqSS9F/aAL+JJM03APbP/INmj2Mu7QTmKAJ7N
 zBJRnS7n0cgwNV+Spf2bwEoLbZrnTy5GiPHTBRvA5phwGvlfNjr/hhrkxVmYlyxTBOUFTgGPdjr
 gO9mh3yC4E8HYfvQ/casfCq5C2xuM42VkXQU85xIFpK68/Or5RW+SXc+URnOIpAARCIoYwKb9nm
 GXlsFZvhFXRDvPxefyJxxQyVXrxUd3SCMYTOqvn/lYyKwxV9yiQQkTC4Bl64SRk=
X-Received: by 2002:a05:6000:1a89:b0:390:e9e7:ca70 with SMTP id
 ffacd0b85a97d-390e9e7cc41mr530489f8f.30.1740663030077; 
 Thu, 27 Feb 2025 05:30:30 -0800 (PST)
X-Received: by 2002:a05:6000:1a89:b0:390:e9e7:ca70 with SMTP id
 ffacd0b85a97d-390e9e7cc41mr530476f8f.30.1740663029647; 
 Thu, 27 Feb 2025 05:30:29 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7ddesm2094064f8f.57.2025.02.27.05.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 05:30:29 -0800 (PST)
Date: Thu, 27 Feb 2025 14:30:28 +0100
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
Subject: Re: [PATCH v5 00/21]Change ghes to use HEST-based offsets and add
 support for error inject
Message-ID: <20250227143028.22372363@imammedo.users.ipa.redhat.com>
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NUriunNDBvZJFLsblTa3LnkW9dJogK3PGM-MjwfboTM_1740663030
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: qi25fK5+in9M

On Thu, 27 Feb 2025 12:03:30 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Now that the ghes preparation patches were merged, let's add support
> for error injection.
> 
> On this version, HEST table got added to ACPI tables testing for aarch64 virt.
> 
> There are also some patch reorder to help reviewers to check the changes.
> 
> The code itself is almost identical to v4, with just a few minor nits addressed.

series still has checkpatch errors 'line over 80' which are not false positive,
it needs to be fixed

> 
> ---
> v5:
> - make checkpatch happier;
> - HEST table is now tested;
> - some changes at HEST spec documentation to align with code changes;
> - extra care was taken with regards to git bisectability.
> 
> v4:
> - added an extra comment for AcpiGhesState structure;
> - patches reordered;
> - no functional changes, just code shift between the patches in this series.
> 
> v3:
> - addressed more nits;
> - hest_add_le now points to the beginning of HEST table;
> - removed HEST from tests/data/acpi;
> - added an extra patch to not use fw_cfg with virt-10.0 for hw_error_le
> 
> v2: 
> - address some nits;
> - improved ags cleanup patch and removed ags.present field;
> - added some missing le*_to_cpu() calls;
> - update date at copyright for new files to 2024-2025;
> - qmp command changed to: inject-ghes-v2-error ans since updated to 10.0;
> - added HEST and DSDT tables after the changes to make check target happy.
>   (two patches: first one whitelisting such tables; second one removing from
>    whitelist and updating/adding such tables to tests/data/acpi)
> 
> 
> Mauro Carvalho Chehab (21):
>   tests/acpi: virt: add an empty HEST file
>   tests/qtest/bios-tables-test: extend to also check HEST table
>   tests/acpi: virt: update HEST file with its current data
>   acpi/ghes: Cleanup the code which gets ghes ged state
>   acpi/ghes: prepare to change the way HEST offsets are calculated
>   acpi/ghes: add a firmware file with HEST address
>   acpi/ghes: Use HEST table offsets when preparing GHES records
>   acpi/ghes: don't hard-code the number of sources for HEST table
>   acpi/ghes: add a notifier to notify when error data is ready
>   acpi/ghes: create an ancillary acpi_ghes_get_state() function
>   acpi/generic_event_device: Update GHES migration to cover hest addr
>   acpi/generic_event_device: add logic to detect if HEST addr is
>     available
>   acpi/generic_event_device: add an APEI error device
>   tests/acpi: virt: allow acpi table changes at DSDT and HEST tables
>   arm/virt: Wire up a GED error device for ACPI / GHES
>   qapi/acpi-hest: add an interface to do generic CPER error injection
>   tests/acpi: virt: update HEST table to accept two sources
>   tests/acpi: virt: and update DSDT table to add the new GED device
>   docs: hest: add new "etc/acpi_table_hest_addr" and update workflow
>   acpi/generic_event_device.c: enable use_hest_addr for QEMU 10.x
>   scripts/ghes_inject: add a script to generate GHES error inject
> 
>  MAINTAINERS                                   |  10 +
>  docs/specs/acpi_hest_ghes.rst                 |  28 +-
>  hw/acpi/Kconfig                               |   5 +
>  hw/acpi/aml-build.c                           |  10 +
>  hw/acpi/generic_event_device.c                |  43 ++
>  hw/acpi/ghes-stub.c                           |   7 +-
>  hw/acpi/ghes.c                                | 231 ++++--
>  hw/acpi/ghes_cper.c                           |  38 +
>  hw/acpi/ghes_cper_stub.c                      |  19 +
>  hw/acpi/meson.build                           |   2 +
>  hw/arm/virt-acpi-build.c                      |  36 +-
>  hw/arm/virt.c                                 |  19 +-
>  hw/core/machine.c                             |   2 +
>  include/hw/acpi/acpi_dev_interface.h          |   1 +
>  include/hw/acpi/aml-build.h                   |   2 +
>  include/hw/acpi/generic_event_device.h        |   1 +
>  include/hw/acpi/ghes.h                        |  52 +-
>  include/hw/arm/virt.h                         |   2 +
>  qapi/acpi-hest.json                           |  35 +
>  qapi/meson.build                              |   1 +
>  qapi/qapi-schema.json                         |   1 +
>  scripts/arm_processor_error.py                | 476 ++++++++++++
>  scripts/ghes_inject.py                        |  51 ++
>  scripts/qmp_helper.py                         | 702 ++++++++++++++++++
>  target/arm/kvm.c                              |   7 +-
>  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
>  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
>  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
>  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
>  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
>  tests/data/acpi/aarch64/virt/HEST             | Bin 0 -> 224 bytes
>  tests/qtest/bios-tables-test.c                |   2 +-
>  32 files changed, 1692 insertions(+), 91 deletions(-)
>  create mode 100644 hw/acpi/ghes_cper.c
>  create mode 100644 hw/acpi/ghes_cper_stub.c
>  create mode 100644 qapi/acpi-hest.json
>  create mode 100644 scripts/arm_processor_error.py
>  create mode 100755 scripts/ghes_inject.py
>  create mode 100755 scripts/qmp_helper.py
>  create mode 100644 tests/data/acpi/aarch64/virt/HEST
> 

