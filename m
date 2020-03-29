Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1537406lfi;
        Sun, 29 Mar 2020 03:46:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuETPTvQISrZHiRDH411cF8gddHDgPOzyV2BlKQlqnvzCjE3KC1vupkpaURSNzsCwWY+mFc
X-Received: by 2002:ac8:175d:: with SMTP id u29mr7318349qtk.150.1585478765254;
        Sun, 29 Mar 2020 03:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585478765; cv=none;
        d=google.com; s=arc-20160816;
        b=VR5GrOmRL8TEIaw9L4it/Gs2oJKiyv2EO6W1FFnzfDxNow16XFi7o3C6TaS3aVrwgm
         ATZTupXVt1wEzeXYFp3Lkzh4GUe4EKabilnBDIvBEtBvc1SHJ0k5s4vUaIc5BJyerQTf
         grERTKshawp+ARSUfNnQED6ImEw/dVGljXxZtbJOuOuH5y3rRxgdbOg9ZrHAe2uQCDp9
         iSP4J82LzGkMJiQ2snDlL4X2TArixkKPItn/Ds/8GJ/dlnCytXq0DJnB2JZ7mEWqKdGe
         qaluNBsfWjP1/llSYIyyuIiBFzlOnGA815alcqkFBE8QynYF9KvckG0P/JO0EX+ZAISF
         oYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Q8DiY1Ds79L+FkRRaCaFfXi3ZMOTrkxpTLYB+il/ThM=;
        b=URieb6V0aN8zXZXx3lm6SOCknllNnpReBSKhsyGHCjTwEWBsvrHY3ZSRCTl8c4STpE
         EjgCsL3OP+H/cWKQlW+NrALOHhKq6WzCg9BfgDa2PfYtrMLxBWhH7Glmxydccrotn2eg
         BgpPAXI4gf82vmksZ+T4ix/tqFiuKviR2n+8dQPwMbic8bSnNWokd5BJX9Gm9IMsTtCl
         ENbJhtUW5Xk+CjR+YI+L7E+mC4L/LhODjnTP6Zr7M6dLYndBXpkmPYM3MWTj2G13obiG
         j5JP7GdBOWbNJSDZ+KrroIDw4dmB3ht/zWir+Ei6uObWuwGpXqSuo+xWSl4W5PawPvE+
         hN7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U+0ZI0Cq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f28si7101021qtm.213.2020.03.29.03.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Mar 2020 03:46:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U+0ZI0Cq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jIVS8-000887-I9
	for alex.bennee@linaro.org; Sun, 29 Mar 2020 06:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jIVRz-00087v-D0
 for qemu-arm@nongnu.org; Sun, 29 Mar 2020 06:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jIVRx-0001Ef-60
 for qemu-arm@nongnu.org; Sun, 29 Mar 2020 06:45:54 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:34876)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jIVRw-0001CS-UC
 for qemu-arm@nongnu.org; Sun, 29 Mar 2020 06:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585478752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8DiY1Ds79L+FkRRaCaFfXi3ZMOTrkxpTLYB+il/ThM=;
 b=U+0ZI0CqgtuA5aiafcBXCuQs4D+IC/zPn71+VKKpUGXgZTkp0r/s0axG71EUFq8e2IpydL
 pxipHVkRkXgiEloqJ28TJDATwgdwgkyeTw0rcDi+cGxtoSB/OG7iqejhMdZwbu2WyQ1ZoM
 dAJEVLoe7jRhojooqMGu1JHsJ/Zm5P8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-rQUQHTxpNLKGyWUFLHjw-w-1; Sun, 29 Mar 2020 06:45:46 -0400
X-MC-Unique: rQUQHTxpNLKGyWUFLHjw-w-1
Received: by mail-wr1-f71.google.com with SMTP id v14so8288974wrq.13
 for <qemu-arm@nongnu.org>; Sun, 29 Mar 2020 03:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lHy0uo5maeWsR0IcekV8OOGvM8S9l3Cw9gudIE8KZis=;
 b=KoNaKabPqxCHEgslZaZC7BXuDJDxhm/p5N5Hc6igd9s/XiFnZzloYluiStCn3gGqSg
 Xkay03wjKOuTdzZBPHyBlBveXFIn3eQzJZo8X+oa5HrlQM3QYiqrWdthKfTamHukbrYN
 GyUh4CaxHUcq0X1b6G85jo68YsDDvnRnqwVQzFfoZyTh1tsn31kfeolm1i6aAzUBH4sQ
 YMqeXbUal6j3pLYWC7wz+4u+GObjzryXAmQSS5MuYDYS41TITDwohu6SbpxJnLA9MsPf
 qixO80MExcRIeFj7rkTe+c9dllmbzbSW+kb0vTsrS2Rsucp3oFzFG2kaISU27nnO57u8
 AQCw==
X-Gm-Message-State: ANhLgQ1FVE0b1XsdA1EeWRCq3gjr1CEcWHFQUMQhgtBR0eRHolsk+yU4
 slx/PQ8gqPGxccqxG1k5PKFSEcUk51tSHv5flEccfBuXBY0FXked7PYCV21gMVRR7DauMz6F6Ge
 6YKCJMidacW91
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr9371222wrh.1.1585478745634;
 Sun, 29 Mar 2020 03:45:45 -0700 (PDT)
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr9371197wrh.1.1585478745423;
 Sun, 29 Mar 2020 03:45:45 -0700 (PDT)
Received: from redhat.com (bzq-79-183-139-129.red.bezeqint.net.
 [79.183.139.129])
 by smtp.gmail.com with ESMTPSA id f187sm11477343wme.9.2020.03.29.03.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 03:45:44 -0700 (PDT)
Date: Sun, 29 Mar 2020 06:45:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 00/10] ARM virt: Add NVDIMM support
Message-ID: <20200329064435-mutt-send-email-mst@kernel.org>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com,
 shannon.zhaosl@gmail.com, david@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f+zTH/aYkgsw

On Wed, Mar 11, 2020 at 05:20:04PM +0000, Shameer Kolothum wrote:
> This series adds NVDIMM support to arm/virt platform.


So I'm still confused about whether there's a bugfix here
that we need for 5.0. If yes pls post just that part
with acks included and for-5.0 in the subject.

> The series reuses some of the patches posted by Eric
> in his earlier attempt here[1].
>=20
> This also include few fixes to qemu in general which were
> discovered while adding nvdimm support to arm/virt.
>=20
> Patch #2 addresses the issue[2] that, during migration, the=20
> source and destination might end up with an inconsistency
> in acpi table memory region sizes.
>=20
> Patch #3 is to fix the qemu_ram_resize() callback issue[2].
>=20
> Patch #4 is another fix to the nvdimm aml issue discussed
> here[3].
>=20
> I have done a basic sanity testing of NVDIMM devices
> with Guest booting with ACPI. Further testing is always
> welcome.
>=20
> Please let me know your feedback.
>=20
> Thanks,
> Shameer
>=20
> [1] https://patchwork.kernel.org/cover/10830777/
> [2] https://patchwork.kernel.org/patch/11339591/
> [3] https://patchwork.kernel.org/cover/11174959/
>=20
> v2 --> v3
>  - Added patch #1 and # 2 to fix the inconsistency in acpi
>    table memory region sizes during migration. Thanks to
>    David H.
>  - The fix for qemu_ram_resize() callback was modified to
>    the one in patch #3. Again thanks to David H.
>  - Addressed comments from MST and Eric on tests added.
>  - Addressed comments from Igor/MST on Integer size in patch #4
>  - Added Eric's R-by to patch #7.
>=20
> v1 --> v2
>  -Reworked patch #1 and now fix is inside qemu_ram_resize().
>  -Added patch #2 to fix the nvdim aml issue.
>  -Dropped support to DT cold plug.
>  -Updated test_acpi_virt_tcg_memhp() with pc-dimm and nvdimms(patch #7)
>=20
> David Hildenbrand (1):
>   exec: Fix for qemu_ram_resize() callback
>=20
> Kwangwoo Lee (2):
>   nvdimm: Use configurable ACPI IO base and size
>   hw/arm/virt: Add nvdimm hot-plug infrastructure
>=20
> Shameer Kolothum (7):
>   acpi: Use macro for table-loader file name
>   fw_cfg: Migrate ACPI table mr sizes separately
>   hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM output buffer length
>   hw/arm/virt: Add nvdimm hotplug support
>   tests: Update ACPI tables list for upcoming arm/virt test changes
>   tests/bios-tables-test: Update arm/virt memhp test
>   tests/acpi: add expected tables for bios-tables-test
>=20
>  docs/specs/acpi_hw_reduced_hotplug.rst |   1 +
>  exec.c                                 |  14 +++-
>  hw/acpi/generic_event_device.c         |  15 ++++-
>  hw/acpi/nvdimm.c                       |  72 +++++++++++++++++----
>  hw/arm/Kconfig                         |   1 +
>  hw/arm/virt-acpi-build.c               |   8 ++-
>  hw/arm/virt.c                          |  35 ++++++++--
>  hw/core/machine.c                      |   1 +
>  hw/i386/acpi-build.c                   |   8 ++-
>  hw/i386/acpi-build.h                   |   3 +
>  hw/i386/pc_piix.c                      |   2 +
>  hw/i386/pc_q35.c                       |   2 +
>  hw/mem/Kconfig                         |   2 +-
>  hw/nvram/fw_cfg.c                      |  86 ++++++++++++++++++++++++-
>  include/hw/acpi/aml-build.h            |   1 +
>  include/hw/acpi/generic_event_device.h |   1 +
>  include/hw/arm/virt.h                  |   1 +
>  include/hw/mem/nvdimm.h                |   3 +
>  include/hw/nvram/fw_cfg.h              |   6 ++
>  tests/data/acpi/pc/SSDT.dimmpxm        | Bin 685 -> 734 bytes
>  tests/data/acpi/q35/SSDT.dimmpxm       | Bin 685 -> 734 bytes
>  tests/data/acpi/virt/DSDT.memhp        | Bin 6644 -> 6668 bytes
>  tests/data/acpi/virt/NFIT.memhp        | Bin 0 -> 224 bytes
>  tests/data/acpi/virt/SSDT.memhp        | Bin 0 -> 736 bytes
>  tests/qtest/bios-tables-test.c         |   9 ++-
>  25 files changed, 244 insertions(+), 27 deletions(-)
>  create mode 100644 tests/data/acpi/virt/NFIT.memhp
>  create mode 100644 tests/data/acpi/virt/SSDT.memhp
>=20
> --=20
> 2.17.1
>=20

