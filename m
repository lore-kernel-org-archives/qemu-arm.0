Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F15CA0EEB
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 13:17:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoM9t-0005Fp-IN; Tue, 19 Aug 2025 09:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoM9r-0005Ez-8H
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 09:13:47 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoM9o-0007Ug-A2
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 09:13:46 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e94e6c6150eso647392276.3
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755609223; x=1756214023; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sZ8xBbj2OKBounPS/eI7I6mmLacoY/M/f0JELVWCyFM=;
 b=xKXfHfwzwvR7wdxZA6VxWjOAnlwohOQ01KgznCqG97fa/DDCXokGzODJ5Rt0PKyeDD
 p4e3Cw/aK+MilGXd2h61HquPhvSLcetDyUBda5AxHC0Q7WQAML1x8IzBM2qr4qdGTcAv
 pmo2raE49Xvvic723sasof+FGfwtQgWjiL/vz6dZWASc9xIlkUIvF7JVrv2WbGah20SO
 BkEa7yJ2oDP6D9X4traslRBUf2nDhQMAT3l94RcHk67NHcL/zz1Gsaxpr0GE3b64FuT7
 TLpBXBySGrK4jZ3k/QSrQXac6a+jV8gCTLrHZOzfMrEqBXqVTCoHruPgV7h3pK0X7gOT
 0lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755609223; x=1756214023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sZ8xBbj2OKBounPS/eI7I6mmLacoY/M/f0JELVWCyFM=;
 b=ACA9FTk6NAcNfC8dOcLoRWCum7f/ivEJ/mkKXlBP4bX5uH0T7IUmEzu7nAtlkvhkeO
 nPGuydAAmGSqSKoekbCh4BQJL8nwDkDsvGce8yBMvNMmkOOX4CMZA5qi3rBpk/ERK5Ky
 dFPQXvjCzoumFrVy9S3tHXm53JRzsH3YVRK1kZUP1Tnn4qgJ1ZBoEm6j2Nwb/oklcvK7
 3BWJ2lmobewO1btgyx24yLt9dlBYhkavC+hd5blTFqS3r3O/Z9tGzU2h1XaiJEtOWbSD
 YZL0FWx37dSQCWgoAnZdaEsWS0A4TyT94q/3/eSP9C1lhpOHU/5+TZeqJ8Eb2l3KWKb7
 WWdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFHQQ3v66nz6nWZUOBU2y2hGIw150uy3FGI0K55tuO4WZlmsIEg+mC1A/bRrs2aPisJ+5jj+Elbw==@nongnu.org
X-Gm-Message-State: AOJu0Yx7CGWfbT1aw3NPaZoFWrherfjCM1ywC6yp7du5V+lBm7oZl9Gv
 jaff1LDy1+jfmJO45wV4+wryZoJI4Os+K8GEStgr7DwFLbguxBr+VeqotSD8aXbdigVxSlWw+vv
 tnerIuRoOzfOPhgcGX9FHyz2ysm6kFN/aUocI1mhQcA==
X-Gm-Gg: ASbGnctWgpZmp1YaiLcdhpiFQU1kvHWLsmCBV0iUewZwMD+sIMHiVPEKJKZ0u0STZSX
 xojihAj+kYnAAPcFgxYvIOw2e4O6EvwVecHZf3dXT27VzNoyiu5bEXh/fC0BG+K0stlxCPHhYTc
 ulKKxH1lB0WEj/f03Ap67t8U7LZ+p4cE+ypc0vb9Mx0Pu1B0FGZOW+1OwLzKenJ9qgPb+ZOHKRp
 8t1PWRVznGmJUjqnrI=
X-Google-Smtp-Source: AGHT+IGXIsAUPUVvwNqpg3Nvd+LkaKUluaoRqaGUyPR+RJHFStXgnP960Mz0Qsik9k2+a2psS0uHUd13OgLR0FSVc8k=
X-Received: by 2002:a05:6902:1147:b0:e93:4610:5a26 with SMTP id
 3f1490d57ef6-e94e62941a3mr3167347276.34.1755609222849; Tue, 19 Aug 2025
 06:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250808065419.47415-1-mohamed@unpredictable.fr>
 <20250808065419.47415-18-mohamed@unpredictable.fr>
In-Reply-To: <20250808065419.47415-18-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Aug 2025 14:13:31 +0100
X-Gm-Features: Ac12FXzCxzyzLiZ1Vmr-Or49aVsBNXXj80VOi7JtqJnpKiNX6jAT0m5AY7RqKBQ
Message-ID: <CAFEAcA-g+DRj=U8jcGqA9MkZPAHSWPtzogSHBW6YK2ahm2aYbQ@mail.gmail.com>
Subject: Re: [PATCH v5 17/18] whpx: arm64: gicv3: add migration blocker
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Ani Sinha <anisinha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, 
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, 
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Fri, 8 Aug 2025 at 07:55, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> GICv3 state save-restore is currently not implemented yet.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  hw/intc/arm_gicv3_whpx.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_whpx.c b/hw/intc/arm_gicv3_whpx.c
> index 35dc5ac531..700b2a1a2f 100644
> --- a/hw/intc/arm_gicv3_whpx.c
> +++ b/hw/intc/arm_gicv3_whpx.c
> @@ -17,6 +17,7 @@
>  #include "system/whpx-internal.h"
>  #include "gicv3_internal.h"
>  #include "vgic_common.h"
> +#include "migration/blocker.h"
>  #include "qom/object.h"
>  #include "target/arm/cpregs.h"
>
> @@ -228,6 +229,15 @@ static void whpx_gicv3_realize(DeviceState *dev, Error **errp)
>          error_setg(errp, "Nested virtualisation not currently supported by WHPX.");
>          return;
>      }
> +
> +    Error *whpx_migration_blocker = NULL;
> +
> +    error_setg(&whpx_migration_blocker,
> +        "Live migration disabled because GIC state save/restore not supported on WHPX");
> +    if (migrate_add_blocker(&whpx_migration_blocker, errp)) {
> +        error_free(whpx_migration_blocker);
> +        return;
> +    }


If this is the last patch in the series then something
else in the series is appearing too early in it.
The patchset should put in all the handling for WHPX
first, and then as the last thing it does, enable it so
that you can configure/enable it. There shouldn't be
a point in the middle of the commit series where you
can enable and build it but it's still missing pieces.

thanks
-- PMM

