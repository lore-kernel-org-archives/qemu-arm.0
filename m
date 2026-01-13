Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC024D2F345
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 16:47:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfhXb-0006Xu-RB; Tue, 13 Jan 2026 11:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfhXO-0006M4-Bk
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 11:46:42 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfhXC-0002t4-UG
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 11:46:28 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-7927b1620ddso43004057b3.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jan 2026 08:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768322773; x=1768927573; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0QajJYXlecODGkTukuDOduHQYrFEf5/EjvUawAylcY=;
 b=gh7l4g9ZAl3L9M5XqMwZWaQ9u+4ZehQGLf6Vh06Ec3Rztf4Dqf2JcbyosrRzwWAmCf
 jHqLH/g0izK5TIzZi8XGMg7SLLyzwkF1NAPIG2HTAUGgaWtnR6eDePNycytV+GB0ZJx0
 Jnq6vffcEPCaMZoNp2/cFgsU2W+9bom3Jjr62eHF69do27DNiGHsJokxx0TBqwn+pZPK
 R8VYoTUUQO/FCv8B5NanOn4AvB55v51y7EwThjTIFxZ+Cq41P3LBiKqZAB0D2s2v2vCb
 9Mypt9dt2oxabNZ5gBIk9IUj/b/PMKMKUv6Rx87GJ7jIjSFWUtBV+4gc5bd0BtenAAwE
 Vlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768322773; x=1768927573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I0QajJYXlecODGkTukuDOduHQYrFEf5/EjvUawAylcY=;
 b=w7ZnVsFn7jIuyJeN/S0Dsjrsio1qlR8QGBic/JctDL5bH7iwSm8XBeZSdDcdswWjUE
 UFmnMtAdsXYc9ccWlYG6cXF/XDTpnsc8g6DmQGc0QLs8FHpB7HRNC0xURqLhYfuVoSg8
 JpLGAx3VV8Utjo8buBHcer9PuX2DHy0lr4ga5xnfupfNcPvfx2leLCaDKSjoXySeui0b
 pYBw7bdTvyskIfoi0xUoo1kh+VC1pRiy0yOMoq8M6eAVB9vpRP1nIzvuS5epeKq3eK9j
 Vxg+hs6uE1AFG7gA/Nnz8KSaFMccBlYn0Nol2G9cN2wIjyi0RzV8B5PCJi3Z9NqSBQ9f
 WF6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNKHHsen7aoL/FPwCAj3Xd0TFDDVp51IuCZukRcMcRF3LaVmPJAhKNbQrFz4VaD+p4E/gScRSoww==@nongnu.org
X-Gm-Message-State: AOJu0YznJ6Qu8GCPXdxuJk8JctsN1C2b4ftGkm0My7WKig2WJIWgTTgz
 s9EpydmQLqeerrsSPtPZlRqerMd9QecFOj/VYQL93oPxHG/gPPT0uwoPyqs5aimr5pPhbRXMHBi
 ODl852h1sT1ghUT8qMTOePE1SwHnsretzT700+h5BxQ==
X-Gm-Gg: AY/fxX6UprHx7onhEu2DkIU69hS8xtLHONxt2FT7jcBaU2Xo0ViEsJDQywQ5m2tw5I+
 OLsF9JK2vJkUURJWXwGmzmy3liDrkykLfxKqyQXNis6oGP07whnNa/36nDyI1DFc+wka5Oy3w1O
 OCTId1kS4aieN5jw6uSbsKUW9w5TXHZU+7pwVx4G3xMH98bqzRwa4jEo3reASF80u476kgsMfWp
 7d1PcmihCvAyFKuT131ZviW4NWSjsbBBDchPeMohfe1BA/a5PKRA8BnlV8bB0pJ94jjRaH/wRHw
 /qg8+nZ+qHCk/TGPpTuAjVO6lcjs0VhIsw==
X-Google-Smtp-Source: AGHT+IHE/1uENNKhb5WWbNwFE6VZA9Zl0r39yGZio6NdyBYD+IP5dNB1a6sPKgFRz11EhKwxBYeal4aDxzZ4eiR/yMI=
X-Received: by 2002:a05:690e:14c6:b0:63f:af0f:aaf with SMTP id
 956f58d0204a3-648f61ff312mr3208186d50.1.1768322772941; Tue, 13 Jan 2026
 08:46:12 -0800 (PST)
MIME-Version: 1.0
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-11-alex.bennee@linaro.org>
In-Reply-To: <20260108143423.1378674-11-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jan 2026 16:46:01 +0000
X-Gm-Features: AZwV_QiYWmm6YDzUxIH9z-rO0TstCrgqpxMC9nfx1bP_YIlFSZ80eFHaonc73Yo
Message-ID: <CAFEAcA-a3GNasG0QHCo031XbXgjV8FTyTHbcmBiwv=1-v-uYAQ@mail.gmail.com>
Subject: Re: [RFC PATCH 10/12] target/tricore: move cpu_reset from
 tricore_cpu_realizefn
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 8 Jan 2026 at 14:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Implement a proper cpu reset handler for tricore cpus.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/tricore/cpu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index 04319e107ba..c3dda9f6a54 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -24,6 +24,7 @@
>  #include "qemu/error-report.h"
>  #include "tcg/debug-assert.h"
>  #include "accel/tcg/cpu-ops.h"
> +#include "system/reset.h"
>
>  static inline void set_feature(CPUTriCoreState *env, int feature)
>  {
> @@ -81,6 +82,12 @@ static void tricore_cpu_reset_hold(Object *obj, ResetT=
ype type)
>      cpu_state_reset(cpu_env(cs));
>  }
>
> +static void tricore_cpu_reset(void *opaque)
> +{
> +    CPUState *cs =3D opaque;
> +    cpu_reset(cs);
> +}
> +
>  static bool tricore_cpu_has_work(CPUState *cs)
>  {
>      return true;
> @@ -120,8 +127,8 @@ static void tricore_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>      if (tricore_has_feature(env, TRICORE_FEATURE_131)) {
>          set_feature(env, TRICORE_FEATURE_13);
>      }
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> +    qemu_register_reset(tricore_cpu_reset, cs);

We currently call qemu_register_reset() inside the
CPU's own realize function only for i386 and s390;
for all other architectures we require the board code
somehow to arrange to reset the CPU objects.

We should figure out what the "right" way is we want to
handle this and be consistent...

Calling qemu_register_reset() with a function that calls
cpu_reset() is not ideal, because it means that inside
of a three-phase reset process we end up running all 3
phases of the CPU object's reset inside the 'hold' phase
of the full process. What we want is for the CPU object's
reset phases to be called as part of each phase of the
full reset process. qemu_register_resettable() takes an
object that implements Resettable, and is probably a better
idea.

-- PMM

