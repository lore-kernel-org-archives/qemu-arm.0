Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0169F4BB65
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 17:39:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuwNX-0008A1-OD; Tue, 24 Feb 2026 12:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuwNT-00089b-PM
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 12:39:20 -0500
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuwNQ-0003y8-F5
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 12:39:19 -0500
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-64ae222d978so5525917d50.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 09:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771954755; cv=none;
 d=google.com; s=arc-20240605;
 b=ZP8wOoTW3Rsbr2omjt7zCSAUlBAKDVIEFa+n6Wg4EEjecylFP2Soi4gH02GWsm9moD
 0nYL9cPXMWsapT46jwScbZwRJp6bc4aMuI+ewioSNngAGPRUPRssgTYKcNSL2JkDYZcq
 yyqD5/fo/TAUCBe53A1QffmLRnQj9BciT5rmwG29mZ+938dyhaZLGiSoAodHGa/0FNDd
 3DLDEReOMkhItapIHzgV2cNCpfbzOom+QFK//bQkIXU2CrU1YEHYCXPUrfXjxWZgCSuf
 xMAmxXW0x28LRgIll39OiTNaT2LcvaaB7d8FNu6hNl8m3fo/iZXbsO6AS3mMTCHntj4K
 4vow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tkIbci1DAFaxW/t/+Jin9X+O8itoBxS3vfyDbF3HHmE=;
 fh=tfPlYbAo/9Z/W6yChBth9c+CqPlBDmTs4pyketzMXhg=;
 b=J1MJvsmjlYfB9xwR9EZRiQIkMkjcgyWuIhF1NwT93z+nw0+dvCMbI/f1Ahiievz2wE
 haemYYzVCKDY5HbNzlOEn6OQ6iF/fnVCGLYFwokMPnvK/F6fx1lwHubzmjRNlAFkEt+q
 hQjdwwMntldmgTl7FWuCsyTI40IrNWCkq6qlrtt5YPWT33zvSVvf76ah/52Aaug15/za
 Q8fjUa5BPIvFVsDkmriXmo2U+NPI5t29zKOjalp0sTtD53yrvgCU9ftEMVBrkw1sg5gv
 pLjx170vOfqHO+dNk2d5U3wmfEYnW4IXVA8NbxwqeOP/aqJs0+VlcdxtBBYn+nb7184s
 MLyQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771954755; x=1772559555; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tkIbci1DAFaxW/t/+Jin9X+O8itoBxS3vfyDbF3HHmE=;
 b=FM5TWpJJe5zmK3GgDH2fk4X6Qi/ebRsc7/ckQlGspQBryTSvsP2BEZX1MHBP6Ttl3F
 sGkem+6TLLcDTjvWSy7Zp4AgIX5bHFveeYJ8AJ8KJlm5L/GM1g20K/fCWO08xE5yba/B
 NrUiFJj/Xxq1AQXTMdUIcC01GWrpJ8EJn+R1qgPB8pyYRi9I0e8mGtReSNP23ZgDgIAO
 0tKovOoPnGZAEx3e4QHj9xRtHRn6UW2r+yCVvnUpefUxyRien7ht0ce/NNYXQPU9s5Uk
 YO6gnv6TsLM+GP52AwW1gDkKCITwUP+4AZ78s02lC6RVPg24p/HadzNiFTg42L5lvJCT
 4pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771954755; x=1772559555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tkIbci1DAFaxW/t/+Jin9X+O8itoBxS3vfyDbF3HHmE=;
 b=GCaIOs17NQUoePXTrFxYvVpQgV+dbuBnloujtBuaQi5ff0p5PIdn21EUsOupsAgAjW
 /zakvUvqHD11T8vuM5s4wrKumGKTTGvalW5/KMbN4fn4/Mk77y84cWSbLYvgnm17Pee8
 Sp5JbKQwYcWuKtManyep3IJqsWewjmku8Vky7dgQtOO2igGiK5dZPxwOJdARQ0KCKywF
 tVvgim5KEgSRXTF8Vqi5n9pVVCNP1ahwWX+xFxEk7lMUMKtW3cSTnpG77n8/3JbnQYWO
 5CRP3+iaBYoTBeSKh5018AO4bzXrfhxjF5eZp8t4hNPg3N3TDyFkRQlCIzJrR1R21mIw
 +b3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNpAHgpMI1lWvWv7ABxywR6vytUJB6L9XAoOp0f7Re0q369ptiA8xmg5lteIYV9xdx6SA/9nIRAg==@nongnu.org
X-Gm-Message-State: AOJu0YzAIZB2L4pBbbiN45w/cvAJvGkLO1Hrk0xWKMAPFfS44bvE9jvB
 GrihRY1DJmCqSJN5ExTORtDKPoAPFaPaXu3spg8HUHzUD/GorqDrzfLGcTUqHkxahVgtJS6b5jk
 uXP7BDlIRUfCMYtYjlkcK2FRVq12ufD54PSkssLmr6w==
X-Gm-Gg: ATEYQzwiFhX1uZa/WNk18Wgn5cQZZgVlyJWPDsV/H5YuD+B30cjHSH/m3zrBMMtO0NN
 Bh0DvVxBHLrgAqADtvBylA7rIQjVpWARxqzJfObiz4wLuhOk7R2JIp5F11/7QQ4hXs7aS4LGgae
 1z1z/TTDXZPCBcNDoT0TYnne5UHLxryqO1BkWkr4VVomTEpytuVZSd3cyjGp3h9O80SuVGBGSlj
 y2rdVyIKYyLo8qtPQriWiuCQZ35adIsInULG8LdzzmVJQkV18LaDctDxW69CcORZR0ypksoktxr
 +1csKKN+Hh+vPopzOIPn+S7fpQ2IURYgpNlQpptOjQz9H0jUrJHGyXcXzMKjMoXgSSk=
X-Received: by 2002:a05:690e:e87:b0:64a:d18a:66bd with SMTP id
 956f58d0204a3-64c787d5328mr11475825d50.16.1771954755189; Tue, 24 Feb 2026
 09:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-10-alex.bennee@linaro.org>
In-Reply-To: <20260219171810.602667-10-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 17:39:03 +0000
X-Gm-Features: AaiRm50pMo8gde-D1qm7vZm0Bhas8-SQLHZ6xUQkqf2U50DUphIzgmXP8vVT_eA
Message-ID: <CAFEAcA-BG9s3LoC_QZeKmpbok03h6N++F2tcOVSORvrRBKkfyA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/14] target/tricore: move cpu_reset from
 tricore_cpu_realizefn
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Thu, 19 Feb 2026 at 17:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Implement a proper cpu reset handler for tricore cpus.
>
> Message-ID: <20260108143423.1378674-11-alex.bennee@linaro.org>
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


We should arrange for CPUs to be reset in the board code, not in
the realize function of the CPU itself.

thanks
-- PMM

