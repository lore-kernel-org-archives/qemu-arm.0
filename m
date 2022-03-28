Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6356338lfb;
        Mon, 28 Mar 2022 02:12:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaUyKN/4/rdE+X/qG0eXxFO8g5dEtOE3rEYtcNh+BmgPH5wXPqDvcDpENYJWH3hnk/kYND
X-Received: by 2002:ad4:5b8f:0:b0:441:248c:2ae0 with SMTP id 15-20020ad45b8f000000b00441248c2ae0mr20204000qvp.39.1648458763576;
        Mon, 28 Mar 2022 02:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648458763; cv=none;
        d=google.com; s=arc-20160816;
        b=LjvQBdVfshR6V2lEx8K4MbEScAN75x6trC3/ms208Ln7rJdyPSZItrXa3cgC/BS+Zl
         Hs+pigAkzlPwSermMu4+8m+wsGQPRqYY3Dqc8TfByLZth53hPxIOrabhywJD4mmGI/uR
         HoOVlQFhgSZj4nvbiCI+9RnO/iHeTTBy7ztGZld4BWyHEkNtV33jtbFNcVGMLMU6n5mv
         D7SS/HXXtCw7EpE+fiabGzKKFOm4zxgdKHkZ80susbt8ttRL1tcRua/s23HYtQAhKOIS
         UuF1IRaUza08GLcS3eOVOmPbzfSL2wpVWAxTctjL65CG/zv7e5fZkVoQzCSuuHQFhWd6
         yIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vbZTUE3w+OHXmU+zmX9lDlYAc35V1rdIsjWszz2GshI=;
        b=wKxxNqgrsPuMrdd9KAJaNe/+HrfCKurxn5W/3S1EzCm2CRGH+Sp7s8pZ2F9L4284Id
         xcWdafbsj5UiGbQBKHpL7OssmmMWe7uq+ChuDjPoRta1hXo74FFyRvgUujUN+KWix1jF
         MTbv+X7fAi/GPU/b1VrRBGJkCEBK+WLNv29VTlLmIQ67tW/I0lrVT6ecc4Bzq2lgb4xN
         gQCTUotap8ydbjie1a7sme1rpFuG9TBIXqeKIrunUofqrkOWCIS7TvIZnBbz7vPCicfY
         FdJ07xFd7JPV4MpRASETD/Oahc+J59IihC4s7uMKcuLnKk55puuk308s1+yZgsU/LXoY
         CSJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PTJbX99N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020a05620a449200b0067e4be238cdsi8021258qkp.274.2022.03.28.02.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 02:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PTJbX99N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYlQZ-0002R0-3j
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 05:12:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlQH-0002QJ-FX
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 05:12:25 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=41482
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlQF-0006wj-Uq
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 05:12:25 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id y38so22226785ybi.8
 for <qemu-arm@nongnu.org>; Mon, 28 Mar 2022 02:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vbZTUE3w+OHXmU+zmX9lDlYAc35V1rdIsjWszz2GshI=;
 b=PTJbX99NdsV6CochF1UQ4gg9SkFbx2yqPKH1u2g1IVeZccPcF6w06Z5IxC2c91VAMj
 CSpmeTsbIg9vmD+ANbIPAaOAFX/lmzOkr3IO0Nyjhelk9L4zSftiFXPgynr/KdJ2Qn99
 9bu6Y2RHCPUOvIsKbxyfhrG3qAdTctQkeqSq/FSjNa4lT2BV2sR3C88ESDH59AEqIA2b
 FIvmwt29qkLF6GZ13l4eI74tbpn0J/tlc4nEW/ogwJu2fTx1dT2XTBpbUoENvO3W5hE3
 93zwkuJSUsGwrnqIiqFzUW9y4rMbkLCmuwxEq5Xe14YurEteUgJmyjtY3u1h3Q4Sk0BW
 y8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vbZTUE3w+OHXmU+zmX9lDlYAc35V1rdIsjWszz2GshI=;
 b=ws2dHRyHRGWZGV7GttBVDUA93/MeGJbHPl+9uQlWdg0YYU10XN2CjD1tsCSw6TduFv
 vPdaphr5cggbB2d9QVA72sjfgjWdzUF6SQwOxpXadF6PyXmkiPlBCadlA8iXuZLMjP1E
 sX/U6AjDyLi4yhjbj3NAhmDPvA6EJeFJ5R4oaVPrLaSbv4jM34iLDLeOCY7917esKu3Y
 03nMmeSWqUsdv7OI0ZdhdiSPtxWIlijpc8iD7FsItQfZlVo+WPtg2onmX+PSqzNSxIsb
 RCVSupc5XFvGDFSQ1QKXx/jIT2hzWPkUtdUuu4YH53aavfv1CZFcEYJO9ZrgmbnaA3KL
 Cx3Q==
X-Gm-Message-State: AOAM533nfSy47KDbz35T3o4Wf6oycTNavgtQUWahhltLSnv5nYUWgQcE
 2IzRD2slRdXSaNHPEkGmFdY1kQSBl8LnhzppLSGx/A==
X-Received: by 2002:a05:6902:150d:b0:634:5046:d294 with SMTP id
 q13-20020a056902150d00b006345046d294mr21044234ybu.140.1648458743135; Mon, 28
 Mar 2022 02:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220328084717.367993-3-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Mar 2022 09:12:09 +0000
Message-ID: <CAFEAcA8Bqf8Jaqdx5PP_37ZY68cyUUyZagY1JcxCSFSiVGURuQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm/digic: fix format-truncation warning
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
X-TUID: P0ICx1lFcVyR

On Mon, 28 Mar 2022 at 09:47, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> ../hw/arm/digic.c: In function =E2=80=98digic_init=E2=80=99:
> ../hw/arm/digic.c:45:54: error: =E2=80=98%d=E2=80=99 directive output may=
 be truncated writing between 1 and 11 bytes into a region of size 5 [-Werr=
or=3Dformat-truncation=3D]
>    45 |         snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
>       |                                                      ^~
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/arm/digic.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
> index 614232165cdc..6df554797734 100644
> --- a/hw/arm/digic.c
> +++ b/hw/arm/digic.c
> @@ -39,10 +39,7 @@ static void digic_init(Object *obj)
>      object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm9=
46"));
>
>      for (i =3D 0; i < DIGIC4_NB_TIMERS; i++) {
> -#define DIGIC_TIMER_NAME_MLEN    11
> -        char name[DIGIC_TIMER_NAME_MLEN];
> -
> -        snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
> +        g_autofree char *name =3D g_strdup_printf("timer[%d]", i);
>          object_initialize_child(obj, name, &s->timer[i], TYPE_DIGIC_TIME=
R);
>      }

This is a clear compiler false positive, given that DIGIC4_NB_TIMERS is 3.
But this is a nicer way to write the code than the static array anyway.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
