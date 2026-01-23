Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EBAD74EED
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Jan 2026 15:48:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vjJOr-0006Fs-QM; Fri, 23 Jan 2026 10:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vjJOn-0006Eb-3g
 for qemu-arm@nongnu.org; Fri, 23 Jan 2026 10:48:37 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vjJOk-0003hA-VT
 for qemu-arm@nongnu.org; Fri, 23 Jan 2026 10:48:36 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-78fc174ada4so19323267b3.2
 for <qemu-arm@nongnu.org>; Fri, 23 Jan 2026 07:48:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769183314; cv=none;
 d=google.com; s=arc-20240605;
 b=A8VGcrKQoJ4isjKCIzYEJMwBuQXHNg/lujGDA6SghusC4R+tk05O2U44BZfhlco3sy
 u+ARgllLukU3fSDtouEDYCc/PrbvUlvF+fF7JEcAj1aKIIL2TPKI7JHfpjUTFOUoVRMV
 gLzPfcmt9MfDjHbZ3cskCM8PGS6gOhtZVqEBGDVjCKZSIVrhKcgC3WYsT9Zvbqs/Xd0P
 741NMq7HiMkdzCiEyzf3mW859qEc98vSRG+Jz4k0cUTZNFCaw+GNGVHYCwy4sMcbw+B+
 7/Md7930HXUWT/UESEFIdoCe6IN+YetgIXeoDaTZEkK07CPgR3+ae3fg8jiKXfBbLrEa
 9gMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=k064vq3zFzCawpV6EY4a+ObDGzA7njkSR3kCyquwJ9k=;
 fh=FSASbXN1Dh+1jCrZBbCB8Sbwkms1F6uh8bdurnXcBWc=;
 b=BxkUmwviDlxui6HwVRpXJ2UfXdw7dQKHgra14kzPoKGZgP8MGI5LoTESmiD3F9/eSr
 Q0OlmTwtkIwSejJUDqZK6Vo2ytx7cpMbhuMzsSNPCrZYy0uzeBj0HahPsCJe+MJyJmx4
 +P4Hou1jChPekSo4ByG4RWLAjNvTFFBghPUxsbGMJG6PbfA6D64ysqjkVB1H0w4Yl+Lt
 m2jfgGXrkAK0MgIm6JQgtCzzgrWOK66PuE2kAeZr8snp7Mo4yuzZdLBLv38pOLwPx/OO
 wKWBhqU5D1JbWkeNRkj/lOeAaUtXd8716FfvZ31QxNGM3i3kWAeZtFktAqWlvW8bNyA+
 WAiQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769183314; x=1769788114; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k064vq3zFzCawpV6EY4a+ObDGzA7njkSR3kCyquwJ9k=;
 b=NoJ4KDbVaLe3lRxBk6wRlMBiQzCpS1NKjTGD6n7J98FdzCtL7vhDgx2TaOmuzIOxYz
 8eoctmEddLL1wNYnNAQvrAWTVJpDZp/xYnhxusOol67S/NcuHdzUOjBiLQNokDOceSoo
 m5ojlflc/PF0lgBamMBoRM1jYOubU/vsM/atkEb4G2o/myTZ+KeFvmxFjtA5evKX2xDS
 WUAmJbGABIDYno6o1sxbyZXrbfEE64anfELh+1qLJEJxWdMU5L8NQN+XhvelpZ6PxXgw
 PblcZJs9jBieBasZMlO1sJMl+2Itm9QPTMLtKuL2+QB35p18eqkh6A3mcQUrkv/vaCWp
 fHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769183314; x=1769788114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k064vq3zFzCawpV6EY4a+ObDGzA7njkSR3kCyquwJ9k=;
 b=QCV8L3v3DYo5h3GRUZlVNzEJhYLTWwRdBdRtls967JSOYnsKVvSyobDvk4yy8lodG7
 5wgPj5BFwucyXXL3h1i9tdKmDeoXtEMGmJX5Nf+886V18G5UInbYxkaGyQ0JgisBeXda
 1cyXxGydIHwtD/6ExkJhkWfoSsbCr4cIr/UK+lqcyqpP2RPYjWpw9pbEe0OVciyPcWF+
 19WRvtidJydwh6kGmIBCozTGzSJUJzSh2SBoEMXR0oi5Q6ISgP3dyvMfdc8x2WO5KwnI
 ii4Dx5BqcSlvOBnfD9NMb+o892PtkLyUYLdGvGlgk7xCkoXVJXhg7OpW3bGkbbalZ95U
 PrCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxk+6sbROme3WGtpgNirSGxIL68hEijbROuu6igw3t95z/tUaPAoXM0s2D1pXWhCDVGNlydUX/lw==@nongnu.org
X-Gm-Message-State: AOJu0Ywec/6xQiAbUnc3fI4vUOAkph+qtDh2Dns8nXxqCLaGnMUj890T
 blj7R0cKwmFft83fX7WNwPs99u1D45+MqPgOBN0pPArS1+LCEQk+zj7RFtLpTw8TtzAN3FRRWfW
 F3QUifoEK+4ilYxy7Zie7wjqhR42CAej3ubAQjsVSEg==
X-Gm-Gg: AZuq6aIIA5WhKhMTgzmxdSUdnVtbyF/FLM5olRDrLrGlNenGDWzzRxONF+E7p8ugLqg
 mRGqrQbeeDESnqMMU70N9kfa3ni8uE5lnzgS7lYAVD1rRnINDdwDw4QWCKCIU87bD82dWHLXbpH
 kF7LjMCdKcHT5lvqB8ikQ3SWIvQwY4XopQOg+vmNxKM7pDzp2VLgDN5jpVAjSqgi6BMtvprVRgT
 PlGwZMpLLdh5eIzjLMvUmyQWqkxgEk92XB4QWZlgnLr1iQxQXefaG4eFU8q1/ufTaQnAgXpMall
 K4Z+
X-Received: by 2002:a05:690c:6e12:b0:787:cad1:bdb2 with SMTP id
 00721157ae682-79439a1b2damr27274667b3.69.1769183313763; Fri, 23 Jan 2026
 07:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20260121175248.87649-1-skolothumtho@nvidia.com>
 <4d1a883b-5465-45af-8dcc-eb905f552c29@redhat.com>
 <20260123114149.000065c5@huawei.com>
 <CAFEAcA8RFqO-U5ayU2u=dNhjHCj=1mJiAv26QihfqNfqQVq1Lg@mail.gmail.com>
 <CH3PR12MB75480D0CDE889070E1F4C448AB94A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <CAFEAcA_8Zd1_C+94wj2c+pJk3ebFT5_Zgt1Ww0qxzFqW=F98xA@mail.gmail.com>
 <CH3PR12MB75482DA817149816D5CD485EAB94A@CH3PR12MB7548.namprd12.prod.outlook.com>
In-Reply-To: <CH3PR12MB75482DA817149816D5CD485EAB94A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jan 2026 15:48:22 +0000
X-Gm-Features: AZwV_Qjovq_ENmuJV73kXm_AGzypC9i2UOYvNWpfa3IF8IH6DGpAzY9Y7EphmtU
Message-ID: <CAFEAcA_w=+RHygwsSQVvE6XU44d6+hgKy=bqdD08aBM5_xyn=Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/37] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Eric Auger <eric.auger@redhat.com>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, 
 Nicolin Chen <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>, 
 "berrange@redhat.com" <berrange@redhat.com>, "clg@redhat.com" <clg@redhat.com>,
 "alex@shazbot.org" <alex@shazbot.org>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>, 
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>, 
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, 
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>, 
 Krishnakant Jaju <kjaju@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 23 Jan 2026 at 15:33, Shameer Kolothum <skolothumtho@nvidia.com> wr=
ote:
>
>
>
> > -----Original Message-----
> > From: Peter Maydell <peter.maydell@linaro.org>
> > Sent: 23 January 2026 15:06
> > To: Shameer Kolothum <skolothumtho@nvidia.com>
> > Cc: Jonathan Cameron <jonathan.cameron@huawei.com>; Eric Auger
> > <eric.auger@redhat.com>; qemu-arm@nongnu.org; qemu-
> > devel@nongnu.org; Richard Henderson <richard.henderson@linaro.org>;
> > Jason Gunthorpe <jgg@nvidia.com>; Nicolin Chen <nicolinc@nvidia.com>;
> > ddutile@redhat.com; berrange@redhat.com; clg@redhat.com;
> > alex@shazbot.org; Nathan Chen <nathanc@nvidia.com>; Matt Ochs
> > <mochs@nvidia.com>; smostafa@google.com; wangzhou1@hisilicon.com;
> > jiangkunkun@huawei.com; zhangfei.gao@linaro.org;
> > zhenzhong.duan@intel.com; yi.l.liu@intel.com; Krishnakant Jaju
> > <kjaju@nvidia.com>
> > Subject: Re: [PATCH v8 00/37] hw/arm/virt: Add support for user-creatab=
le
> > accelerated SMMUv3
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On Fri, 23 Jan 2026 at 12:04, Shameer Kolothum
> > <skolothumtho@nvidia.com> wrote:
> > > > From: Peter Maydell <peter.maydell@linaro.org>
> > > > I can fix that up when I queue it into target-arm.next.
> > > >
> > > > Thanks to everybody who helped with code review on this series:
> > > > not having to do that myself has been a big help for my personal wo=
rkload
> > :-)
> > >
> > > Thanks for sorting it while queuing.
> >
> > Unfortunately I had to drop this from target-arm.next,
> > because it caused one of the gitlab CI jobs to fail:
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
la
> > b.com%2Fpm215%2Fqemu%2F-
> > %2Fjobs%2F12839040278&data=3D05%7C02%7Cskolothumtho%40nvidia.co
> > m%7Ce64f88e5ebe54c10a77008de5a90f12d%7C43083d15727340c1b7db
> > 39efd9ccc17a%7C0%7C0%7C639047775811752760%7CUnknown%7CTWF
> > pbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> > 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dr2cFx
> > te6tcUSLjTTpMKMvmU4g7FgrhMTatELkP4sJXo%3D&reserved=3D0
> > (Not an intermittent -- the job failed the same way
> > on retry, and passes with my target-arm queue without
> > this series in it.)
> >
> > I'm not sure exactly what's going on here, because
> > the bios-tables-test test passes on my local machine.
>
> I tried on both my ARM64 and x86 machine and no failure.
>
> > Could you investigate, please?
> >
> > 1/457 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test OK
> > 83.58s 55 subtests passed
> > =E2=96=B6 2/457 /aarch64/acpi/virt/its_off -
>
> This is the one failing apparently.
>
> > ERROR:../tests/qtest/bios-tables-test.c:554:test_acpi_asl: assertion
> > failed: (all_tables_match) FAIL
> > =E2=96=B6 2/457 ERROR
> > 2/457 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test ERROR
> > 25.86s killed by signal 6 SIGABRT
> > >>>
> > MSAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1:p=
rint
> > _stacktrace=3D1 PYTHON=3D/builds/pm215/qemu/build/pyvenv/bin/python3.11
> > UBSAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1:=
print
> > _stacktrace=3D1 QTEST_QEMU_IMG=3D./qemu-img
> > QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-
> > storage-daemon
> > ASAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1
> > RUST_BACKTRACE=3D1 MESON_TEST_ITERATION=3D1
> > G_TEST_DBUS_DAEMON=3D/builds/pm215/qemu/tests/dbus-vmstate-
> > daemon.sh MALLOC_PERTURB_=3D162 QTEST_QEMU_BINARY=3D./qemu-system-
> > aarch64 /builds/pm215/qemu/build/tests/qtest/bios-tables-test --tap -k
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95
> > stderr:
> > acpi-test: Warning! IORT binary file mismatch. Actual
> > [aml:/tmp/aml-7QQVJ3], Expected
> > [aml:tests/data/acpi/aarch64/virt/IORT.its_off].
>
> Any way to retrieve these files?

They aren't in the "job artifacts", but you can probably do
a patch to tweak the CI job to add them, push to your own
gitlab fork of QEMU to have it run the CI, and then look at
the results.

thanks
-- PMM

