Received: by 2002:a17:90b:958:0:0:0:0 with SMTP id dw24csp7934685pjb;
        Tue, 12 Nov 2019 06:40:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxrNPWXPhWtnTXIDPbmocRuDVgpW9yS9JsiDElZiUJVT0BcymFv3E5joeOMxYdBsTI+B4Ip
X-Received: by 2002:aa7:c2c7:: with SMTP id m7mr33283985edp.295.1573569611575;
        Tue, 12 Nov 2019 06:40:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573569611; cv=none;
        d=google.com; s=arc-20160816;
        b=WpEFdLm9k5CuaA1H+oExC8ToHtBVdFWDvXUrIuILpktWYkztBVszIC/+QJQATiFTEJ
         gvWiWUQFCsmJuZBo4DiXXGJWBSFIyzC5VvNFezEEq1iqMrFL5tRAYJUJ0O08rVMpob3o
         ssqCdQug7OokU9/Uzi487G0CLjib46jKGsMf5lxBq+SI/tfQvWKi0ZtBfIrMZXOPBEpi
         Cla+snQJtz6AACKGiqL6VSUPpqInva/UpbWinqrdWjqJH0+dpHOQvlWP6I2+ANEvQ8UK
         EnYag1yqWVJCucDP7Er0NtdDBvqv6F7zx7QWkYB2QBGEarqD0utXfjl9kmHPDJJTlBOO
         eUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=tnhPRLPJ/5MrUb5GfbZcfW8Ek/saOTgyfSOq0d+rRSM=;
        b=qiIu8Frloz/6XYvdIxfAs0TJzCnlp5IxLNPr7BklDKKjpbUb44SFZZE8peqDFTGMMv
         SRystG+3ggrDY52ABNsC2aa0L1yZZs0SZOmO9slwX0sT5pr6jZZEiMrLQJL+rULr7rXB
         jMpT+MNMX0FsTHc7GuoPXG1vT8Zi7LBFdJVAOU+tkI26ElZlihDh0ZdDkWLd+gNt3c3k
         2hnq4G2/Hwf1rex5tqbqzvC9rFMadXmvqNLNnPo5EwEaCJYv7l9HYT4aGJNsb4457FYp
         Q2hGCUQw7XMUkW1FzmlBINFmyiMMKr7acu9D69R6nyUMHqFx2pS8kNZWTv5jsYzle+GZ
         h8Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N38waVHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si12607230edp.357.2019.11.12.06.40.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2019 06:40:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N38waVHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUXL0-0000JH-7l
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 09:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58416)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iUXKF-0000In-Jp
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 09:39:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iUXKD-0005JK-7u
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 09:39:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28597
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iUXKD-0005J6-4v
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 09:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573569560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnhPRLPJ/5MrUb5GfbZcfW8Ek/saOTgyfSOq0d+rRSM=;
 b=N38waVHR1CiQuKTZ5wu6QXhcA0bT+LDYNFnU9XnZGj/l2DUmC1XAIY4G7FFpgCR5bhhfnJ
 HFVAckzHx+BdTfTSsQi8QyVjprH6f3ctKprzZDTetso0ODPFQw8pvn+28ba8LYYKLN4Gnd
 oMj0FUk08vYkA8+s5sdeu+2f7Yeb4Ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-m-8exEPtMt6WE6B7_oki3g-1; Tue, 12 Nov 2019 09:39:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 395F8108BD1B;
 Tue, 12 Nov 2019 14:39:16 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 865595DDAA;
 Tue, 12 Nov 2019 14:39:11 +0000 (UTC)
Date: Tue, 12 Nov 2019 15:39:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH 0/5] ARM virt: Add NVDIMM support
Message-ID: <20191112153910.435414be@redhat.com>
In-Reply-To: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
References: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: m-8exEPtMt6WE6B7_oki3g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LY6EZ3Pzp3WM

On Fri, 4 Oct 2019 16:52:57 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This series adds NVDIMM support to arm/virt platform.
> This has a dependency on [0] and make use of the GED
> device for NVDIMM hotplug events. The series reuses
> some of=C2=A0the=C2=A0patches posted by Eric in his earlier
> attempt here[1].
>=20
> Patch 1/5 is a fix to the Guest reboot issue on NVDIMM
> hot add case described here[2].
>=20
> I have done basic sanity testing of NVDIMM deviecs with
> both ACPI and DT Guest boot. Further testing is always
> welcome.
>=20
> Please let me know your feedback.
one more thing,

It's possible to run bios-tables-test for virt/arm now,
pls add corresponding test case
it might be easier to just extend test_acpi_virt_tcg_memhp() with nvdimms

>=20
> Thanks,
> Shameer
>=20
> [0] https://patchwork.kernel.org/cover/11150345/
> [1] https://patchwork.kernel.org/cover/10830777/
> [2] https://patchwork.kernel.org/patch/11154757/
>=20
> Eric Auger (1):
>   hw/arm/boot: Expose the pmem nodes in the DT
>=20
> Kwangwoo Lee (2):
>   nvdimm: Use configurable ACPI IO base and size
>   hw/arm/virt: Add nvdimm hot-plug infrastructure
>=20
> Shameer Kolothum (2):
>   hw/arm: Align ACPI blob len to PAGE size
>   hw/arm/virt: Add nvdimm hotplug support
>=20
>  docs/specs/acpi_hw_reduced_hotplug.rst |  1 +
>  hw/acpi/generic_event_device.c         | 13 ++++++++
>  hw/acpi/nvdimm.c                       | 32 ++++++++++++------
>  hw/arm/Kconfig                         |  1 +
>  hw/arm/boot.c                          | 45 ++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c               | 20 ++++++++++++
>  hw/arm/virt.c                          | 42 ++++++++++++++++++++----
>  hw/i386/acpi-build.c                   |  6 ++++
>  hw/i386/acpi-build.h                   |  3 ++
>  hw/i386/pc_piix.c                      |  2 ++
>  hw/i386/pc_q35.c                       |  2 ++
>  hw/mem/Kconfig                         |  2 +-
>  include/hw/acpi/generic_event_device.h |  1 +
>  include/hw/arm/virt.h                  |  1 +
>  include/hw/mem/nvdimm.h                |  3 ++
>  15 files changed, 157 insertions(+), 17 deletions(-)
>=20

