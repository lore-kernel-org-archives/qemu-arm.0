Received: by 2002:a17:907:9383:b0:a61:bdcd:a6e2 with SMTP id cm3csp7948ejc;
        Tue, 28 May 2024 07:40:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrP7d4AofBfe3XZ/UbsHg1Hjwx83PUQrjmOg59zdly6CxOoKJ2aBy7RSeh4UR4iHkRiTrkQA91l0E8Y01CDWz7LPaLw31u
X-Google-Smtp-Source: AGHT+IE5LGlNd9vk2Wj/F0/Cbzln3pc8KGkN7sJEjgf7ChoH6o3walehRFvM2rOVONDnDYOEujMv
X-Received: by 2002:a9d:7d86:0:b0:6f2:5e72:2a47 with SMTP id 46e09a7af769-6f8d0a52004mr12108757a34.1.1716907202326;
        Tue, 28 May 2024 07:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716907202; cv=none;
        d=google.com; s=arc-20160816;
        b=AdDM07911tZJGIrfS/Gm2MxSuMl7ghxmCj7I0/f2/D2KruSls+7TqueofJmnUxECST
         bH2rkkFy1k0BooDDEEtuOYJGNmTmgar4VfNYCwperuoBLm2YZGz4TKQ+bthbcbw4S85A
         CrOr2dCdMB4g8CUSXz7E/Kalyng79Ijf2lwPU1NwIE3H/58XA0o90MgUJZSInrCg4Mq8
         CUH/N3WzM7XjhVVGd9SukAPZuaCjfePDKGzap9JvJaF+8HfRhhnFpumCrt+1WNHuH2LA
         mXcYJL/m60mFkwSLN1dC7GgzzvYOsxQBUufpt59j+NdrZnrrZAtRiy9W8OQrXEcIEIMi
         ZUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=82Dad7r9mnGdA86VN1MU+SipozoAUOPsiZ7WniVAyRg=;
        fh=0GiZk/z3y1z5YawYvLx2n/68SE41P7P4EqaBb1SXqqs=;
        b=Qua/WAj208GqD+7kxaHlkncYy+8lSGC5HSjjzkJcpjhWfGvtSJ1r60SelP7v7GGgCx
         aYbjk4BonylnCjPXjTvmb0phYvYBcAuW5OdIdrgeErneaNsgWm+spjJc/2+RJWZcXSvf
         Jj+iGNtXOcm1TY44WH9uEBwRFqmtfuiBv9lRBo6NZ4uerca9GEVwyHLTqmfEm2t27JAX
         SfWhRZr6DRTLlHVo6tTq2BbOEm+0b7t9zHjGs7DM5M8DSF1xYIquyGum676IgVzWBopK
         CqFbSsdzCRlIcN42BixCKxpXN7s5MIEz5jTcSGpzVorQQXUCtOqMOK8NaXkg6BAN1KqK
         qJSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2An08he;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fdadc4313si14215771cf.216.2024.05.28.07.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 07:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2An08he;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBxz6-0000Wg-U5; Tue, 28 May 2024 10:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBxz5-0000WL-IM
 for qemu-arm@nongnu.org; Tue, 28 May 2024 10:39:27 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBxz3-0003xD-1M
 for qemu-arm@nongnu.org; Tue, 28 May 2024 10:39:27 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f45eso794881a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716907163; x=1717511963; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82Dad7r9mnGdA86VN1MU+SipozoAUOPsiZ7WniVAyRg=;
 b=i2An08heFD5PI8ufXDeF2HIAwonMoBE5bDz960tKXyKMbDlhb/Dq4SXC/bq7Vs21rd
 0KDZWPDZsBQbCj8gkPQtfFOmUL5W+jj5H7UmSxWF2Cb/udB32VfatmMyMUAzd5klBWB6
 Oo0d64BSZsXtlWF3HqYpC5vjFhDowZrAfy5q10F8D84mJjFxS3aDb0EWtYzN70LOA5Cn
 JQICfsqVF8RHXddRqQns3yB0kbu73/mUmVKYEKZ5gtayTmbeuYGZ4hgEa70RpHdbf8Tz
 S2IXfEc61S/dZQbsf/2oDHfVM3IChV0+I3LrtPowDNvui7sLrZG87/U7MDoOote6PSUU
 n1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716907163; x=1717511963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82Dad7r9mnGdA86VN1MU+SipozoAUOPsiZ7WniVAyRg=;
 b=SnOxmwUuUHNxuanKUpldt8iUKAl2jMyyt8g9jeboxRfe6ui3XbRh7wyycuXp0Wf6ZP
 MKlStzuAE9xTlXvAUH3wDOdbEAwMKloPHYtuXky4HCG4ERuyqI0kT5UZuAO4z1ODGpWH
 uMutVBXHVX+1a31kQ+0bL/xGDjkL+vJjbL6Sg4/X6KtIVhVD8b/xrrN0lLkFFjfBXBTR
 UvDkoVFXuNSAaCqEX3Irzqft5o4+10kc3cnSwWp8fnflnw53lFwP38UmJSmT5VBgHWR7
 7wJPSXU3c2AJrRKecDiv9dnQozgDCjp1rIJnzjnrRlqoPlg/JC1SddJlCpqC1JsqlQ7s
 ndmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOMqGoslkgPID2Diu2vGCbr/+zcDV+N71uyGXdJf9k+7ra+knlvIP78MkO0me5h9d80Pgwo11UZczhFCW6lCj5KxkP
X-Gm-Message-State: AOJu0YyXU2tLPcnVmzGA3Bb6r7yShrDOACIlXZU279X5Q6vs1ypKIpeE
 /vngrL2iQdfqFCIwjQ4NXu/S+MFsoHbEVkY3qzdUe5IAJSmF70fq4JuduV0tCaUtm1ie9dB7FyE
 29GU/68dkKAAbjVNFnKBn3Ojik1QAuRfKXYqbqQ==
X-Received: by 2002:a50:a45d:0:b0:578:632e:6794 with SMTP id
 4fb4d7f45d1cf-578632e6d9fmr11865679a12.10.1716907163547; Tue, 28 May 2024
 07:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240523194441.21036-1-ines.varhol@telecom-paris.fr>
 <20240523194441.21036-3-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240523194441.21036-3-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 15:39:12 +0100
Message-ID: <CAFEAcA-zQKi3Wt_wxHOEXRywCNrK=-Mrt1ZgX390de2Y0BsT8g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] hw/char: Use v2 VMStateDescription for STM32L4x5
 USART
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Damien Hedde <damien.hedde@dahe.fr>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc@lmichel.fr>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3pTBwZ9+9K8F

On Thu, 23 May 2024 at 20:44, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> `vmstate_stm32l4x5_usart_base` namely uses `VMSTATE_CLOCK` so
> version needs to be 2.
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  hw/char/stm32l4x5_usart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
> index 02f666308c..0f16f0917a 100644
> --- a/hw/char/stm32l4x5_usart.c
> +++ b/hw/char/stm32l4x5_usart.c
> @@ -546,8 +546,8 @@ static int stm32l4x5_usart_base_post_load(void *opaqu=
e, int version_id)
>
>  static const VMStateDescription vmstate_stm32l4x5_usart_base =3D {
>      .name =3D TYPE_STM32L4X5_USART_BASE,
> -    .version_id =3D 1,
> -    .minimum_version_id =3D 1,
> +    .version_id =3D 2,
> +    .minimum_version_id =3D 2,

I don't understand why we are bumping the version number here;
can you explain? Usually we bump the version number when we
add a new vmstate field to the vmstate, but this commit doesn't
do that.

thanks
-- PMM
