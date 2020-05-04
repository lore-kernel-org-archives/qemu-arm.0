Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp68047lfb;
        Sun, 3 May 2020 22:14:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypJHQ5L4GtH/cfRNyx9xwMj8GxWOkCOLTGOJSCZ8ynHzMQe8149Sg42TisNP2UoSo2YZi5mY
X-Received: by 2002:a05:620a:1316:: with SMTP id o22mr4699813qkj.422.1588569248120;
        Sun, 03 May 2020 22:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588569248; cv=none;
        d=google.com; s=arc-20160816;
        b=gMzRwDrwRRtWQKFlQuACGXp3D0aOyS3BXax60Vpq5DEq+3spW1g4X+BEEDFxqJ7tJr
         paNyGAKbMEuH/i5CXmCHGX87pK9tcA8qQsh4ZBZpPF30JLMnpE7uBIAnp2UqBz7tRpm+
         nFm+OIAP6wRWnn7ewYKV9XqQHvzX4BtjRiBrzryMhBcmAOBKg+caabwZMuXqVVejnndd
         UgZq6O6Rm68yC80ptgYSvKpQUyQQe9229znX4IsvTNECgDc3D7q8tPt3MgWCr/+3GK8S
         oMQINYbw8vjOh5FIZ6ckgspXppZdQUturppdQ4TQFGFbiOnR2Lub6XrHqULFT0Wfwcve
         KGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=K7WTJ5RKuUhGf6Q3b2DcGRPpfKLM81fW7ZqFfBymxmo=;
        b=Ej2uTQZQTJenvJzK4BSoqWAs/RS1VWDf8C6hNm23MbQe/dICenYfRQTU8bW+dcAtN4
         b5AWfbNsEWVAAblWGwFbbpHSiKKymxIi4oc2jKPaNxvIidv1K/FR8rKYzKYiYBV0L1iH
         G3OEujBeD1UUmjPYkgnsjhG9+/GhCa2CQ5aJ8KeHpFyhebOGMSivMEznAPBMSobgeAw6
         UIWd6/jWyFEBikoKAeaEsIkpbGkYYZs4AT2H2rEOuEV8FAsbbJchIcv3mYXPM8Tk5/En
         mCDoQoUszK/+cD73e2SsOOPjbXZTr0ka47Rykvu/dKzo9qxJuRkUTEiUYObMc5dM2KyB
         /nZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cPokWSTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id s24si5804149qtj.228.2020.05.03.22.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 May 2020 22:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cPokWSTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVTQd-00070p-Fm
	for alex.bennee@linaro.org; Mon, 04 May 2020 01:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVTQV-00070O-61
 for qemu-arm@nongnu.org; Mon, 04 May 2020 01:13:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45983
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVTQT-0008Ni-2z
 for qemu-arm@nongnu.org; Mon, 04 May 2020 01:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588569235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7WTJ5RKuUhGf6Q3b2DcGRPpfKLM81fW7ZqFfBymxmo=;
 b=cPokWSTlcKYLLtqSQQTLUsM/PzZl5ORv6InFewhVZojfkEyraaUwq9T7SzDMtlr31aTE7Y
 EJe73Mtj0ES4i91K9X/JM0SdtdMMWNZHvGakFnIre6L/Wsmiy0a4WQq+Kvzw4gcjsLo6k4
 PvSXHlihiZFiDDRVn0W269OjWvuEx10=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-dxDBML15MbS6Dxx3AR3fXQ-1; Mon, 04 May 2020 01:13:50 -0400
X-MC-Unique: dxDBML15MbS6Dxx3AR3fXQ-1
Received: by mail-wr1-f69.google.com with SMTP id s11so10161797wru.6
 for <qemu-arm@nongnu.org>; Sun, 03 May 2020 22:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GgWpv3lJzZ6vzSp1N9aF4A77CBI5ISRWAJFVtv0cZms=;
 b=fIbVaQiB2AEJ3OmEDy7frDYiX9NloRlnlMTRxh5pz+1aQUXVK7WC+uw/218eWMTnvh
 Q4BUxtBfH+d2iQIhz7VZ0UmOMVm5BWregxU/84e9xUiCFhrOjEgZ778nAAuHI+v36HRG
 Thj1VJ8vjVHgHe3eDBoWs8syk3NKh2Pme0aW9rMhaEBLauyjwwvK4w/MBEr8YuitYMEq
 eTjt4E6LO3NVwUB6x54a5A+Jml3bdmYIFobpk+c92PiQcr3zN2jp2Q+gBzSgH6kZwEja
 3plu+IaODa8sxxdRD4aNMXp9flVRIYY7VpB2hlFk1+i8QfQxiA20i5q8q9nJnsKNAPQL
 zkjA==
X-Gm-Message-State: AGi0PuYehH3vm6u7VSDDoYWgH442CftnlcCkWLAmIVHes9+uBXFhqqyo
 uvkXB9fLoy7MpLP5jBft5Cg5MhGFUvuZ/sxICeSn8poN5ZA3tC+BOT8Kx/CSRXu/7PxFad44yu8
 z7LhaU2uKK2PW
X-Received: by 2002:a1c:9852:: with SMTP id a79mr12328525wme.27.1588569229607; 
 Sun, 03 May 2020 22:13:49 -0700 (PDT)
X-Received: by 2002:a1c:9852:: with SMTP id a79mr12328491wme.27.1588569229259; 
 Sun, 03 May 2020 22:13:49 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 w10sm18236963wrg.52.2020.05.03.22.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2020 22:13:48 -0700 (PDT)
Date: Mon, 4 May 2020 01:13:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v4 0/7] ARM virt: Add NVDIMM support
Message-ID: <20200504011252-mutt-send-email-mst@kernel.org>
References: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:13:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 prime.zeng@hisilicon.com, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nuuGkVW4JVrt

On Tue, Apr 21, 2020 at 01:59:27PM +0100, Shameer Kolothum wrote:
> This series adds NVDIMM support to arm/virt platform.
> The series reuses some of the patches posted by Eric
> in his earlier attempt here[1].
>=20
> This series previously had few fixes to qemu in general
> which were discovered while adding nvdimm support to arm/virt.
> Those were sent out seperately[2] and are now part of Qemu.


Mostly ACPI stuff so I can merge it if I get an ack for ARM side.

Alternatively, for ACPI things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>



> Patch #1 is another fix to the nvdimm aml issue discussed
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
> [2] https://patchwork.kernel.org/cover/11472501/
> [3] https://patchwork.kernel.org/cover/11174959/#23020961
>=20
> v3 --> v4
>  -Removed patches #1 to #3 from v3 as they are now part of Qemu.
>  -Addressed comments from Igor(#6) and Shannon(#4).
>  -Added R-by from Igor(#1,#2,#3).
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
> Kwangwoo Lee (2):
>   nvdimm: Use configurable ACPI IO base and size
>   hw/arm/virt: Add nvdimm hot-plug infrastructure
>=20
> Shameer Kolothum (5):
>   hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM output buffer length
>   hw/arm/virt: Add nvdimm hotplug support
>   tests: Update ACPI tables list for upcoming arm/virt test changes
>   bios-tables-test: test pc-dimm and nvdimm coldplug for arm/virt
>   tests/acpi: add expected tables for bios-tables-test
>=20
>  docs/specs/acpi_hw_reduced_hotplug.rst |   3 +-
>  hw/acpi/generic_event_device.c         |  15 +++++-
>  hw/acpi/nvdimm.c                       |  72 ++++++++++++++++++++-----
>  hw/arm/Kconfig                         |   1 +
>  hw/arm/virt-acpi-build.c               |   6 +++
>  hw/arm/virt.c                          |  35 ++++++++++--
>  hw/i386/acpi-build.c                   |   6 +++
>  hw/i386/acpi-build.h                   |   3 ++
>  hw/i386/pc_piix.c                      |   2 +
>  hw/i386/pc_q35.c                       |   2 +
>  hw/mem/Kconfig                         |   2 +-
>  include/hw/acpi/generic_event_device.h |   1 +
>  include/hw/arm/virt.h                  |   1 +
>  include/hw/mem/nvdimm.h                |   3 ++
>  tests/data/acpi/pc/SSDT.dimmpxm        | Bin 685 -> 734 bytes
>  tests/data/acpi/q35/SSDT.dimmpxm       | Bin 685 -> 734 bytes
>  tests/data/acpi/virt/DSDT.memhp        | Bin 6644 -> 6668 bytes
>  tests/data/acpi/virt/NFIT.memhp        | Bin 0 -> 224 bytes
>  tests/data/acpi/virt/SSDT.memhp        | Bin 0 -> 736 bytes
>  tests/qtest/bios-tables-test.c         |   9 +++-
>  20 files changed, 138 insertions(+), 23 deletions(-)
>  create mode 100644 tests/data/acpi/virt/NFIT.memhp
>  create mode 100644 tests/data/acpi/virt/SSDT.memhp
>=20
> --=20
> 2.17.1
>=20

