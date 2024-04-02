Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3827398ejv;
        Tue, 2 Apr 2024 02:15:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZK5I8jXKHr9bGzqVzjAKjFMiIPKvSxJpNwZla2/MxHaHjZm98kCVIdcm53RnCc0JDEAyRrr+cEWNH5MjYMeJRDfv+Cedw
X-Google-Smtp-Source: AGHT+IGL60T0rcbNDFAj3733dp/nlFsdlOCzPCnXQduqVHCqbO1I+SSxGBNBnDucoBfpgedwrfh3
X-Received: by 2002:a05:622a:1708:b0:434:342e:2b56 with SMTP id h8-20020a05622a170800b00434342e2b56mr1419799qtk.31.1712049347442;
        Tue, 02 Apr 2024 02:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712049347; cv=none;
        d=google.com; s=arc-20160816;
        b=xmReP4xhjo4t+n8TlJoaWWXXSImjcHSEFP0Xef8VjWPGbDJT1cDhTMO8fgDQcgs4K7
         9WVcrM5EsYFIluiJjx5aWyo7PNSZ9Pt+bWySm1+k3v16PghScmbSvPAL9Ni1Dh3w/zXw
         i8aAJYt9A1u6Gvh5UOvRQ3PI7qLhMNUtJu009TMeY3QqJ3EMN0235xgHBJAS/qExEh1o
         Srqn/+HbYYwaukd0QyV1BYm8qAoVqAeqybbSAdIWrcujqSADoYKWIizUle9FOpsap8g1
         dmS3ZZwbu+F9I/eboHJKploEGdjvQO/KCaZvDCd4EHzoed9IgV2VjtthiKFj4clc/D/P
         CICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4nO2HzaN0kDt/16pA7tNJlMUFkH3bORvVFVPgUTmBlU=;
        fh=qiZPS4UC8WZTyfFCFo+5R+0C+WhFaVgWm6qQmIOAEaI=;
        b=A+zA0vejNLRUVcauJX5KKOqkckbCbE9UyZsSRO1j91cBUcdhtmJJiiAXW2uDG760Ky
         6Ij/DDO7plHeutWioeLBoY5J8gr0lkzIzfu47ROTKXAk58NqtZhMcbSFMoRprQIYRal/
         fWbXH+T2txgob8/VOhdwV52+xFcE5CaHj1a2X2xCQQliP4qP4Z/SgMlOKTc/qH8i0woN
         7EoLS2/PT1/ocwIyiDqx+BLS19+EUhUVCrl2GhTo70Al/YEaB8UTJL/tRQxLKa2qwNJ4
         /+vz4k3Aq4nutH4Z9npCSCACnNyezxAlX9w6B4z5K58ciT98UKVd/kiq4S2Yt+qGgsU3
         Gt5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zWciNxR/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a05622a148900b00432d73bd5f0si5993136qtx.588.2024.04.02.02.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 02:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zWciNxR/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rraEo-000596-Iz; Tue, 02 Apr 2024 05:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rraEb-00054D-6j
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 05:15:13 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rraEO-0003OT-G5
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 05:15:12 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56d5d4d2e2bso2819764a12.3
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 02:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712049298; x=1712654098; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4nO2HzaN0kDt/16pA7tNJlMUFkH3bORvVFVPgUTmBlU=;
 b=zWciNxR/VKe6N6fNNYTeVKOAUgta0AuMDRw8vb55AMI2haNSv8MwI0sHw2Dtg/fe4o
 aL8QQFDYYjvwmJ3iEXo6Jtou6VwHmL87neZ+0Wr0C5wAzEpKZGJ/4e20eO6BlfYXaFov
 tsFC7CzFRsfdRUB1ms/76M3L5l+gA5YLC2YwEvtj+svc6l3rtBlB0CfZogGJgtCmgvkt
 GJvlJ5iKCzDFn2TNCTq+xybrcEoDXBeeClIbskdZJFh2PZTNlK2ZBjwTabxu3ug8w32P
 DlV6RQCEwQz8T31QH6DZIDKCSlZF7BFK7yBz8X6mkAzzK+MiGEB8dWoesb8+jp+3UYDH
 TVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712049298; x=1712654098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4nO2HzaN0kDt/16pA7tNJlMUFkH3bORvVFVPgUTmBlU=;
 b=VKsTt4B0JFgH3taIKFqFHvDBJTRCmHzMlbi2WIFUNjc6DKtQqgDiptxL8rtGsZemrP
 ftR4VBb+7nlRr6z9UX3izySupyt7uB0oikD3RzRiWTOB/G9WgKjI1gEJBuVHmnEqVXvm
 OUYdjSOMz64gYJ0PVJozp/80ptz/oPxN8STA37vOpWlt6gvGgUq5X4Lewkw2ssLYI17z
 5Ix33YmpzSsnhl4VkMz0ojn+w9XLc4jNhJPS32tALDO+PZiIAF3qz0Q6fMZdDghfcT8i
 kKEgAE4KnMQXKPEfk+Ch9qOJ63dSSUBmIW/ZZi+hEofKo7IVGFGF9n0hjp5Ru8GYTrXG
 fB3A==
X-Gm-Message-State: AOJu0Yyx4GKB11AZIaqojDjy9Dh01SQ3h3izmi6WSmXVmr51MvYpQ1MO
 7Diq5ayEEPcqaUqQqijb5NiKjgmZqVEdm+por3a5S5Clucdh2Oo47LJNhEzK7dOvyMCCYogpd40
 KCvM59DNn9lizrY5XD3QiFgXD9wscEq72DtDHHHHRG6vagxsy
X-Received: by 2002:a50:d698:0:b0:56b:cf40:f712 with SMTP id
 r24-20020a50d698000000b0056bcf40f712mr6719781edi.19.1712049298358; Tue, 02
 Apr 2024 02:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240329150155.357043-1-clg@redhat.com>
In-Reply-To: <20240329150155.357043-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 10:14:47 +0100
Message-ID: <CAFEAcA-=DFR-eRLz9XK4=u=Aq0O=3dWZv+nLcDOgWyWAt3iMCQ@mail.gmail.com>
Subject: Re: [PATCH] raspi4b: Reduce RAM to 1Gb on 32-bit hosts
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FS0pIkwUeSVs

On Fri, 29 Mar 2024 at 15:02, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> Change the board revision number and RAM size to 1Gb on 32-bit hosts.
> On these systems, RAM has a 2047 MB limit and this breaks the tests.
>
> Fixes: 7785e8ea2204 ("hw/arm: Introduce Raspberry PI 4 machine")
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  hw/arm/raspi4b.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
> index cb1b1f2f147e8685a1dba6f137335ea0bc89bca5..85877880fc706d216de04ff1e=
081d66e6080ebac 100644
> --- a/hw/arm/raspi4b.c
> +++ b/hw/arm/raspi4b.c
> @@ -112,7 +112,11 @@ static void raspi4b_machine_class_init(ObjectClass *=
oc, void *data)
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>      RaspiBaseMachineClass *rmc =3D RASPI_BASE_MACHINE_CLASS(oc);
>
> +#if HOST_LONG_BITS =3D=3D 32
> +    rmc->board_rev =3D 0xa03111; /* Revision 1.1, 1 Gb RAM */
> +#else
>      rmc->board_rev =3D 0xb03115; /* Revision 1.5, 2 Gb RAM */
> +#endif
>      raspi_machine_class_common_init(mc, rmc->board_rev);
>      mc->init =3D raspi4b_machine_init;
>  }

Running "make check" on a 32-bit host has clearly fallen off
our CI config...

Applied to target-arm.next for 9.0, thanks.

-- PMM
