Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4420DCFD313
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 12:01:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNVG0-0005v3-4J; Mon, 24 Nov 2025 07:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vNVFh-0005ll-HL
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:01:12 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vNVFW-0007h6-Mx
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:00:57 -0500
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-37b9728a353so44656231fa.0
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 04:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763985650; x=1764590450; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fxcugJN4iqbUkWCXcF/hds4Q0Hkw5d2C87ToQwh/bEA=;
 b=B9oszzushFBsTWaWc9VPPia7ph+eYNAgrkjoGvMjPec+wKuNbD8VJy2CkvGboWSJI6
 +QMzEMyVtLopXTHwr4mRL6PJnazDi7ksqDoY7k3iPrApYB5oPQInjFhRduTRHW5GFx+Y
 K3PGKVUPIeoYi9P6DQ5/2o1FQUKo5bVUIeI4HcwIEfaGdGpzF5AgLVm0GlYd2lwBktFz
 bQ3mhpB1yu/cKr3xCBQvrexoKejL028JkKLcW409TOG4ULiAtcKwBSTRJtV9Ke0a5Noo
 w3hrpvOC3BRuvKl6/4ugQHJDmtYc5mWs/K8YbAqDsrgZX5HCEvr+VW1+ASLjGG1xU9JO
 fG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763985650; x=1764590450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fxcugJN4iqbUkWCXcF/hds4Q0Hkw5d2C87ToQwh/bEA=;
 b=N5hp3U0pJMZZOkSteCLvmSoPcdqDOEldgA5hfbluj8zL5IGhSB1+BoRqe61qeFMkuv
 N22Ugmw02sDw9F3A3PxsJiH6NpVJrOz0dpGBPVQxOBlBYWydjYMSO4ywwJ19zdvqe8z5
 4Zd2v1kPDGPyXEaQH9F0YK1FgS/JVoLlor7x5gHzJ77QOUZOe58lTBcY/S+m7MDQeYYI
 M0fr+CKIFbSQMw6QZDhj1gPDFe1nZD2m/QlgsObDsDv7zT93vq4tzoK4KT35eDWwFOb2
 HeUQFLH/C50LIxc6eQu9liNIGwzrrrVx/IE55kz4UAy3O9mjUjfBac6nOVx1mIuu92k3
 /YFg==
X-Gm-Message-State: AOJu0YyLtSoYsX1t/JieJab7RJfPVu7QV0S4+jsywaTvShrp17/V/Frr
 htL8PvboZGc8I2jsqdBisalNATcPHNRoEu92mp3NlBaL7TeQ94QfIKhRNJbtbx3ac8CORla7gsV
 CXA4DTUpnX51EJIzbXF4R5At3MZmtrGsvoC3U9byzDw==
X-Gm-Gg: ASbGncsAMsczS7+YXm+Ta+/YeQUzoA5JbXp5W52JvaAKkGOh/DFk2CfpVKm8rGb2t9f
 VT0rPac0o8c/J80taxomUsgUxNS0emkw+lkEbaivvIoXiODeP5tqbBpB8YM0z91wVZFpkIhdLHJ
 vCNl9gCDvwiI8MZ29N7GrWjVkXWSJvv6yHj/a71r5vYjTmtbi6/Lq6KjjY2glgkrtTU/U9EarUk
 UxrWDldcD4kgSIuHOI4EAmhvQ9Vrx0Q138vWwr1343Gu2FARn1H/DefF53wTRr7xBc+CUGy2K3s
 lqYyD2cGtqU=
X-Google-Smtp-Source: AGHT+IFv7gFMEtQDnv1NmWpGmVYWF7dNTnkyvG1rIgB6f0KRhw1YNa/jJetR5fJQM++/pPnQCF8Q3YqBUprxH8x8mt4=
X-Received: by 2002:a05:6512:2354:b0:594:36b3:d1f9 with SMTP id
 2adb3069b0e04-596a3ec4221mr3745923e87.25.1763985649848; Mon, 24 Nov 2025
 04:00:49 -0800 (PST)
MIME-Version: 1.0
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-29-skolothumtho@nvidia.com>
In-Reply-To: <20251120132213.56581-29-skolothumtho@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Mon, 24 Nov 2025 20:00:34 +0800
X-Gm-Features: AWmQ_bkzm1loeZ68F2GglU3pwemcmcrtJEIDA8KfwBL8G5qBxoxAIh42Y0Xoscc
Message-ID: <CABQgh9EuxEfHYOtMdCMBcaSqJZjzm2Q8Tz108jGcxcfTRpi3mA@mail.gmail.com>
Subject: Re: [PATCH v6 28/33] hw/arm/smmuv3-accel: Add support for ATS
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com, 
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com, 
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
 jonathan.cameron@huawei.com, zhenzhong.duan@intel.com, yi.l.liu@intel.com, 
 kjaju@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 20 Nov 2025 at 21:25, Shameer Kolothum <skolothumtho@nvidia.com> wr=
ote:
>
> QEMU SMMUv3 does not enable ATS (Address Translation Services) by default=
.
> When accelerated mode is enabled and the host SMMUv3 supports ATS, it can
> be useful to report ATS capability to the guest so it can take advantage
> of it if the device also supports ATS.
>
> Note: ATS support cannot be reliably detected from the host SMMUv3 IDR
> registers alone, as firmware ACPI IORT tables may override them. The
> user must therefore ensure the support before enabling it.
>
> The ATS support enabled here is only relevant for vfio-pci endpoints,
> as SMMUv3 accelerated mode does not support emulated endpoint devices.
> QEMU=E2=80=99s SMMUv3 implementation still lacks support for handling ATS
> translation requests, which would be required for emulated endpoints.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c    |  3 +++
>  hw/arm/smmuv3.c          | 21 ++++++++++++++++++++-
>  hw/arm/virt-acpi-build.c | 10 ++++++++--
>  include/hw/arm/smmuv3.h  |  1 +
>  4 files changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index b6429c8b42..73c7ce586a 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -647,6 +647,9 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>
>      /* By default QEMU SMMUv3 has RIL. Update IDR3 if user has disabled =
it */
>      s->idr[3] =3D FIELD_DP32(s->idr[3], IDR3, RIL, s->ril);
> +
> +    /* QEMU SMMUv3 has no ATS. Advertise ATS if opt-on by property */
> +    s->idr[0] =3D FIELD_DP32(s->idr[0], IDR0, ATS, s->ats);
>  }
>
>  /* Based on SMUUv3 GPBA.ABORT configuration, attach a corresponding HWPT=
 */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 296afbe503..ad476146f6 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1498,13 +1498,24 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, Er=
ror **errp)
>               */
>              smmuv3_range_inval(bs, &cmd, SMMU_STAGE_2);
>              break;
> +        case SMMU_CMD_ATC_INV:
> +            SMMUDevice *sdev =3D smmu_find_sdev(bs, CMD_SID(&cmd));
> +
> +            if (!sdev) {
> +                break;
> +            }
> +
> +            if (!smmuv3_accel_issue_inv_cmd(s, &cmd, sdev, errp)) {
> +                cmd_error =3D SMMU_CERROR_ILL;
> +                break;
> +            }
> +            break;

got build error here, need { }

../hw/arm/smmuv3.c: In function =E2=80=98smmuv3_cmdq_consume=E2=80=99:
../hw/arm/smmuv3.c:1505:13: error: a label can only be part of a
statement and a declaration is not a statement
 1505 |             SMMUDevice *sdev =3D smmu_find_sdev(bs, CMD_SID(&cmd));
      |             ^~~~~~~~~~


Thanks

