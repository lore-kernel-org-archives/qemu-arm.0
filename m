Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3339D2D8FA
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 11:04:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkgrK-0006nx-OF; Tue, 27 Jan 2026 06:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkgrH-0006gN-52
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 06:03:43 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkgrF-0005sq-BE
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 06:03:42 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-79478ec4cf1so5269317b3.3
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 03:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769511820; cv=none;
 d=google.com; s=arc-20240605;
 b=BP4L3B0XYpRwrFvI3Ym0aBdmqq8RDuDBnCfLxqslm5j1riEa03HUNrd6LqKS+mNFba
 0ihzeLBKu2YegtmW2OoqBHV1zGqXGL8Rn4Po5QqvkVhBwbLewO5ZypE2aGh960jjPlyg
 8pdjndliOeb3T3Z2ksnHAadUf4jyPF/mro9AgmyXZgzSxjjzkiKP6p54zCJ+BWb5nttE
 pC322UZNhwpDd2qaP8lfyt2xzGtJOt9tDZs+8faxOqQDP4EtYX3rC9U8M1e6IMyQFnH2
 DH1jWCxV7ip7laQwH+S+zmm0uTVKD5EOYWF+x11V4dWbC15Ib6rgxncCJLIdSN5hj/M1
 b5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=N1jnLph35YoBDXCJeldeE9p7JgSNAcEGoaSTKws8yuo=;
 fh=8oQatT+i9sxKPI0NkpQmy3fOLVCL4tvpeh/44M9wvEY=;
 b=gyA234OhfrTj0AoYkfIy9k1U+aBKjQdjLmjB5vEBcBDtiIXX7kOYB5FH/leR5iNBVs
 blQwdlFLDMfrUeV3K/48sYVuglpWuyyeUsXaKpcwOiw0EbCRWWpZ2KIxifXkdydFt2us
 KzxuFpGWzrSpQMDaIxgPrMtosbIZq8JXz4xpJrAiFJPL+CPIXrEKhfcW+eIyketHnerQ
 8bC57HLxK5d0xKqyaA8x9hiV1AdSGUvbGjuouUrLbD6fcl1usFq3Kc00IyIEqlq+FT1C
 Rn3KKHZflugHlCx86JH4XnRzdHYnvCA4SObK8bFFU/Y0/YUnKXAg/3ITfejePysm5qBq
 bu8g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769511820; x=1770116620; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N1jnLph35YoBDXCJeldeE9p7JgSNAcEGoaSTKws8yuo=;
 b=KUeFzTp2+n8jZSaRjgPPWOiiQ9dUFUWtJNj5fLpKh5nQVN9SIbyYnp3o2s9JzVygMo
 6w7i9kN8A3uutHeFzdkQsBv5h37f0UKrVqquQgPGSEJ/8QdFc6A2dy5Oa98FFcD4cGW5
 jBggFonUzOpf4XVW+RGB2vDZqsrerBm37ESxEzznBekgcqBU6WAseMwCE+yOXGlNqjsU
 GX6DVi8E3ypCHxU7p7/0+UnRpgmA2RUzpg7Fi0qfc/2qRrDWFzwQp+owSWI3e9xyeBuj
 51P7e+ysI7v+ccI7BvAxvnvPPmTmvjQXcDwNxDfksltv/rEjhjyrlPm/6aMKooALauBN
 ECxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769511820; x=1770116620;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N1jnLph35YoBDXCJeldeE9p7JgSNAcEGoaSTKws8yuo=;
 b=Dm1+Vb21dciT7D5rL/gYQ4QQW+/AsJiY+w8YeMx4o0jHoe3INxtthdkH+5FljGG/4u
 DhVBslO0R2LvRQwMCBIMf+YfhCMwbwS+PiHWi7FLL6ZdDiVWXO4m1UzYnYeX3Un87lVP
 q+X0x+U6O3vNNfEm5GyAXwkXIFnKANSyQvBfeJ3hrVPaeNXYr+zaUadX9CNfHtxaMC4o
 tPX7BVDF6mOqW2znBydBwgPtI6Ky/eX/ctnI0B6T3+5EWsrbcXzTnkuyx2dyC6gZ3AyY
 UB9UmkSptB+b/TE6gfPb+amZpjX6HgQB0T9LwBAB/g3d7RLZUNvIdzYV+RvQhiB1fNHk
 8fTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxX2dThSXEb6MDLqYXa5Puj3oJuk//oS9tOD+4yc+NW9jhG8y7fDtmOnOn5xVuTFJJ0/gAiX0CXw==@nongnu.org
X-Gm-Message-State: AOJu0Yw5Au6DkjNECrsi1p3NbqckWRceOHBFIvirCECb/oOZGlhYoCkf
 QCZgQWvTvPuozYQ3fGKVnvmqTUb6NqkZcgHzbn/WrYLWP5QgdxooL8a0b8xLpdErqShhbDoaWfe
 hFDdtGGljVRL03hlj1OWnU9AOeQ6HiPH1PpP7Ocb04A==
X-Gm-Gg: AZuq6aInhAkNgCQRl8VQS5c37grjnJbFrgYMaXcT2m6qbUUzYYCpuf/KyE8GiEl5K94
 WeEe1lP9qo+05IA+n2JykHdco3VCMEI/wpZYpyXBYGbDyxIeTIs9bDUOypuEH65oQaVO70EHFqF
 L01Ho71Sd8Xc13zyHTPfp1PAfK3AZfEhX0Debyk4kFrcBtT33ayQyo2j8JfqnWEZOassmCWNnzy
 EdPt67dYG3XiKNYD08U02PF6iGCi2SrrXTFjyU0HTFuzmNvy/YJqMu9NaCEbkDvuU3RDA==
X-Received: by 2002:a05:690c:a5c3:b0:784:997d:b86 with SMTP id
 00721157ae682-7947aa00aa1mr5780347b3.2.1769511819980; Tue, 27 Jan 2026
 03:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20260121134114.9781-1-mohamed@unpredictable.fr>
 <20260121134114.9781-20-mohamed@unpredictable.fr>
In-Reply-To: <20260121134114.9781-20-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jan 2026 11:03:28 +0000
X-Gm-Features: AZwV_QhuN8WQJ2P7_1r55rwCH69Slg1g-ILoVMnr_9zj2rV-jvQUgLCs2GtryS0
Message-ID: <CAFEAcA9XQeo_HXS6_Zki90q2awOi8P-kN-s4KXX7AcVOr2bhYw@mail.gmail.com>
Subject: Re: [PATCH v17 19/21] whpx: arm64: gicv3: add migration blocker
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>, 
 Igor Mammedov <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Ani Sinha <anisinha@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Wed, 21 Jan 2026 at 13:42, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> GICv3 state save-restore is currently not implemented yet.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/intc/arm_gicv3_whpx.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_whpx.c b/hw/intc/arm_gicv3_whpx.c
> index 9bc036d1ac..a2f8e3c5fb 100644
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
> @@ -204,6 +205,14 @@ static void whpx_gicv3_realize(DeviceState *dev, Error **errp)
>          error_setg(errp, "Nested virtualisation not currently supported by WHPX.");
>          return;
>      }
> +
> +    Error *whpx_migration_blocker = NULL;
> +
> +    error_setg(&whpx_migration_blocker,
> +        "Live migration disabled because GIC state save/restore not supported on WHPX");
> +    if (migrate_add_blocker(&whpx_migration_blocker, errp) < 0) {
> +        error_report_err(*errp);
> +    }
>  }

I think you can just fold this in to patch 11 where you create this device.

PS: QEMU style says no declarations of variables in the middle of a
code block. The GIC base class has an s->migration_blocker field
that you should use for this (and indeed you're already testing
that in your whpx_gicv3_icc_reset()...)

thanks
-- PMM

