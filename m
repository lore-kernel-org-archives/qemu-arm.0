Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6358473lfb;
        Mon, 28 Mar 2022 02:16:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/5b15oszxunn4kHPFnkV3Nu+IeJk3r+G9tr5gapf4WAbXM9JNL4wTs4gpdBC9EIPKlSEG
X-Received: by 2002:a05:6214:f62:b0:441:2cd7:9cfa with SMTP id iy2-20020a0562140f6200b004412cd79cfamr19358702qvb.61.1648458998678;
        Mon, 28 Mar 2022 02:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648458998; cv=none;
        d=google.com; s=arc-20160816;
        b=SEc6kT8c2AYTrTm8GmVC9Ld/MEWmN3l/x6J/86HZZWKU6nVHnvJLKdTiF73CsUeju2
         FTyDS+Cys+hj5cvKBQ9QPMlbU/cBUOdbJYxQngvqg67QI7OTlWQW26Dyz3zfaac4kOUu
         MtJLl6mx3OvbjXE2PlHWJmSqAGBa8tvJ2Sq7hPJWUPyamEWPS+1xXvG/n8jeV47tQGQv
         pMjLyZHWPMQsaySKtTBN9OYzL80CbL5JYfasn0wJE7ZuvWHVsoiBefMrEPRnqCmjOa8n
         jzjYNZQhqAcWSA1r00kiXBtHvlEx4QaTqvlLoc215VBsIt1VuJWmhUHAZptrkokx/xTH
         si+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AFjPYOtBhBn/wLv9qKb5ww3IIl6i5H38HTopswr/NfQ=;
        b=NafcgWkm5E8jZ0HuoNodroSnPYt71HEVMcQdxeNth2tq/MjZnkt4FBOCxqdSJQarCc
         R6SkXxrtOQZW3EtK4lLry3zsTe5YhHCnQpLIWuIHKFebK/3phUR47Dk5tjwoZwZIBkp+
         PIfI3TXzCLWe8zBtNwFxRfXDSxDY27I4PFXaqfq+/9Bj0wvJkJ4dPawggTUr+g8cfXxv
         6wXLfGPob4i+abPD5aevo1MqAbJT25651IEiyWAr+1Xzi27greMHsm0v+9qsgmAAYiHq
         In16LMOMx9Jabny+CMeB9JDobUHwIkIqtUwbjC0hR5gQWhK1l4Eq/5sljZNZR5YXrER2
         H3Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JMz6XQdD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020ad45488000000b0044107880c15si5771130qvy.358.2022.03.28.02.16.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 02:16:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JMz6XQdD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYlUK-0005DI-QT
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 05:16:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlTa-0005At-4i
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 05:15:50 -0400
Received: from [2607:f8b0:4864:20::b2c] (port=44670
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlTY-0007TQ-0N
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 05:15:49 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id y142so24846626ybe.11
 for <qemu-arm@nongnu.org>; Mon, 28 Mar 2022 02:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AFjPYOtBhBn/wLv9qKb5ww3IIl6i5H38HTopswr/NfQ=;
 b=JMz6XQdD4WPpWsUVegxLVrOLcZSeyq3BFPfi/ZO1vsece479jlLjqFCDRSds5a0CPS
 50FeZMK6e/dIIhcc84Fl0brT3kfgBmP+QhaJLfDzDEtu4KELqwvi0hnmNuuCwiOpyduK
 a62HLg0LBNKDa18CRQQsBl9/GbgTggpB6hVg+U0ffL3OQlzRsTsLPkFZlcN09r/oGQVa
 i5gKbMeJwqPKmwzqM+DcLIxDkh2TIbvzMXiOcEDaJQ2+fbcPH5gvjw1hefB1gqhiRr9U
 iz5jyPY15BcYrJqEk0DkNQ8CfRrhwEPLCyuay8N2UGAV3w+x2s+iqGem37vgQhDupQoP
 OeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AFjPYOtBhBn/wLv9qKb5ww3IIl6i5H38HTopswr/NfQ=;
 b=q58vdPgUkpIEOwtajJ7NUpcLbpqrgTmqicqhT2DAb5P94TxdC7/RdEgr5/hNNtDxBU
 KmmJQVXLynkz6RPTrWVWWmd7ZCeijBrCra7b6iKLZP5pMb+Up4MSR4po7nPmOswz+Nnu
 xdySgksfD73Hu0wrKyzgl81aCCEllw3KoiYcVjhMeqDaUjF+N+QmrM2g4859bTfOB/IK
 i+ghG/6sQzsC2KRqFaIi7BgqKeOrxhTo9MSAq8N/xNSc0T8f1qKluyt8sQrcSZ01RVsY
 JuSvyyztrvZPYbC3Kh2lGEVlyW7ibdLlE38gNEu/j8ba3HaXzaYEI88NRsAgCcdRyc9j
 56JQ==
X-Gm-Message-State: AOAM532WIajdL3JJI1NOhxbPMUu+g37+LeZqWooyUyP4WIyy562gt0rm
 CpwlELwkwYzVYxnulJbyfRGsUki400nzgTc7XGLIvQ==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr21790735ybq.67.1648458947136; Mon, 28
 Mar 2022 02:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220328084717.367993-5-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Mar 2022 09:15:33 +0000
Message-ID: <CAFEAcA-g=XaURutqWd6okRHb3-pz3SegaxRMG5j2s+PThQHdGQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] intc/exynos4210_gic: fix format-overflow warning
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /5T6xm9VF1Uk

On Mon, 28 Mar 2022 at 09:48, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/intc/exynos4210_gic.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> index bc73d1f11524..5b6f4330a5f3 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -289,10 +289,6 @@ static void exynos4210_gic_realize(DeviceState *dev,=
 Error **errp)
>      Object *obj =3D OBJECT(dev);
>      Exynos4210GicState *s =3D EXYNOS4210_GIC(obj);
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> -    const char cpu_prefix[] =3D "exynos4210-gic-alias_cpu";
> -    const char dist_prefix[] =3D "exynos4210-gic-alias_dist";
> -    char cpu_alias_name[sizeof(cpu_prefix) + 3];
> -    char dist_alias_name[sizeof(cpu_prefix) + 3];
>      SysBusDevice *gicbusdev;
>      uint32_t n =3D s->num_cpu;
>      uint32_t i;
> @@ -322,8 +318,10 @@ static void exynos4210_gic_realize(DeviceState *dev,=
 Error **errp)
>       */
>      assert(n <=3D EXYNOS4210_NCPUS);
>      for (i =3D 0; i < n; i++) {
> +        g_autofree char *cpu_alias_name =3D g_strdup_printf("exynos4210-=
gic-alias_cpu%x", i);
> +        g_autofree char *dist_alias_name =3D g_strdup_printf("exynos4210=
-gic-alias_dist%x", i);
> +
>          /* Map CPU interface per SMP Core */
> -        sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
>          memory_region_init_alias(&s->cpu_alias[i], obj,
>                                   cpu_alias_name,
>                                   sysbus_mmio_get_region(gicbusdev, 1),
> @@ -333,7 +331,6 @@ static void exynos4210_gic_realize(DeviceState *dev, =
Error **errp)
>                  EXYNOS4210_EXT_GIC_CPU_GET_OFFSET(i), &s->cpu_alias[i]);
>
>          /* Map Distributor per SMP Core */
> -        sprintf(dist_alias_name, "%s%x", dist_prefix, i);
>          memory_region_init_alias(&s->dist_alias[i], obj,
>                                   dist_alias_name,
>                                   sysbus_mmio_get_region(gicbusdev, 0),
> --

More false positives, but here the new code is massively better than the ol=
d.
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
