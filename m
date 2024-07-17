Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1003024njk;
        Wed, 17 Jul 2024 12:06:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaDuOYXiAUWfCUTWekH8i+Kz8DlBTCuNRUTwXBbQ/g64ks22NexT3udaguqma+B95UA7R9auHtnlf5USfpO7aT3gXy9m8Y
X-Received: by 2002:a05:651c:1a0c:b0:2ec:529e:6522 with SMTP id 38308e7fff4ca-2ef05d289b7mr2354561fa.31.1721243211834;
        Wed, 17 Jul 2024 12:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721243211; cv=none;
        d=google.com; s=arc-20160816;
        b=Pdqp2EsQjiv0nG0ket675v2WryXXNLlMipLf95eQ3SfmIvchNxSuhnXYk6sdnDtVu4
         KkbF7OR4gTF9ICzyKKmAmM/IqMD1u49cjJsL/t3kLrr+c7RseJYV6CSsRW3fGpdVoTB8
         DgOzbJ3gWWnVCwETfxsZrpzMD5UfSpe9cU36pAQWtjUEsYLV+sDrtLMFetov6jMDlxa4
         s0L6RRBvB/N76yqEWbrUC88jZsTbRbTC219fo4gC76VIIDFbxI2gjPnaj8PbGPaq0V2O
         Q7rlX1a1I8P6QX4FbjiyjCNVPeYvlDWSdHyxNE6AWGVENOdOb3v70s4Iswct1DUp5S0u
         k3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmTyUPUh2TdjaS2kakIUu+zSdq0kzqZ8AQ2di4fhUkI=;
        fh=y9lTshx7VKR4AAZoNPghPcJ3RkRV+rOB8zl6o03w0Tg=;
        b=ANKLKf2rU5iwy2bEP823X2jqvptdR2w1lPFG/P1p7s0AYnwled+/awynxDgUUz8Phj
         6ra2kIEEaRZtTHbwibVIfGZo1CH5V9BZrPIcbdJUemn42w76biHYyoJwRY4veQz9GnWU
         l5iL8/7+TleJNGAQ4eGEvXedfH8creatoU5/0n+vphQE4Ji9JWRKYNi1I2jyWPoIDVuF
         MBXFrTU/gJnx/B3w5EfleZ9rqXWAipFAoIRhDUEVFEohVpGScGCZmK6jc+0oXi5S+Xiz
         zed8rdNTmKo5zCADPN7u1coyfvEQHLFYU3XEbR2ryFxZ0FeyN4BWwjZyd0ggkHglXuQP
         BNKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvK4sLFi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ef05c9247csor638911fa.1.2024.07.17.12.06.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 17 Jul 2024 12:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvK4sLFi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721243211; x=1721848011; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmTyUPUh2TdjaS2kakIUu+zSdq0kzqZ8AQ2di4fhUkI=;
        b=PvK4sLFioA3aK47Wa4tbMvB0lmL4bqVExIyRVWu/+W2zeWagwYsUA017bXnfBoHglu
         GB887kFFDePRMyT502Dof8Z8q6L5w4lFc8jjX/+G1yDOekqYim12rOQ9njciIZI7/oOt
         heO1p1S53EQPxLTw831P5nXNUXarKlvX+HPtakv4+qKF9plBusE3HbuKcwzI1q8OFQDN
         Cg0pL1Ohl6deMZhxa6kwJGb1TaOS19Dr4koT3B8N1uLXGnuE9G9rxCP1FX8wWfpuss7t
         rE5eNC66IgfP3201ekJgDzJ9MmTqlfpIcSZJOR3CdlKqHYEZPcoux5XBkYL+pBgWscRi
         FKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721243211; x=1721848011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmTyUPUh2TdjaS2kakIUu+zSdq0kzqZ8AQ2di4fhUkI=;
        b=XYjt5fgChSjGPgIXi7SFx8FshhZWM03tx67ZUgmKG6VOZBweCDTQhmzCgqXjsaRHOD
         zKZwnGnGnhQejxEQ89laYM/6hFOwBq3j/mqJe7uJi3P5vwhwTTQWJPg9LLJyLmVp2ogW
         VaK1pyjVG/s4VQS2eFiegYfQUc9lXwzDBjHnrO0AClzCVFn07ayWw5G+pDQ2nd3LsWGY
         4a/1g8sxNYUglozwwM68tUlD19C7RxIjWDh2+8dDdLPPO1xsPYXg4KTpELm+AkGGxjqf
         AchDoFyeucG+RnoJLTZ93Hebtvcyw4yd9SW8OeAvQpw5eFL1PqorITPzzBrYJabhQK3n
         HRtw==
X-Forwarded-Encrypted: i=1; AJvYcCU5zSr1kdkGxl+q7gWATfq8qhTR2Voe0jN6h9MB3fgsSUGWww8FhPXC5nKTsa1rD5mCciTk/hYKCib307eQzWVKcaKpYOYn
X-Gm-Message-State: AOJu0YxWn4KmIPfeHd3sMDgko9L0oNIdf3atTwbGdYk7eYcqwWMIx6zH
	f05MivIkURxKmmQLYI6g59Dx6VJz+DByi56Tnq7bqO2fFkfOQNSyuyW/tHsoiSlqIlnhlxOBcMF
	3ibNDQGziuXjb4bmTB3TrNZvzuU9wXVxzIKKNIRcC
X-Google-Smtp-Source: AGHT+IGXxq60Nbxt/VLpXBWKiQuKAR94McjSn38xqdH99XBIjQBmd2SBUsMaV2HlB23vdXxYiDos22kvDEsmQCNytgw=
X-Received: by 2002:a2e:9e02:0:b0:2ee:6b86:b0aa with SMTP id
 38308e7fff4ca-2ef05c7143emr2087811fa.17.1721243211042; Wed, 17 Jul 2024
 12:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com> <20240717150931.GA3988597@myrica>
 <1e7e750b-61bd-4822-8742-124bdf66a7c4@redhat.com>
In-Reply-To: <1e7e750b-61bd-4822-8742-124bdf66a7c4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Jul 2024 20:06:39 +0100
Message-ID: <CAFEAcA9e+NCFZ+Zhs0C-XxD++=33FV7Tnt8GzZmvUnpzMw2Yxg@mail.gmail.com>
Subject: Re: [PATCH v5 00/18] SMMUv3 nested translation support
To: eric.auger@redhat.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: fmiB7WiPce3l

On Wed, 17 Jul 2024 at 18:44, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Peter, Richard,
>
> On 7/17/24 17:09, Jean-Philippe Brucker wrote:
> > On Mon, Jul 15, 2024 at 08:45:00AM +0000, Mostafa Saleh wrote:
> >> Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
> >> but not nested instances.
> >> This patch series adds support for nested translation in SMMUv3,
> >> this is controlled by property =E2=80=9Carm-smmuv3.stage=3Dnested=E2=
=80=9D, and
> >> advertised to guests as (IDR0.S1P =3D=3D 1 && IDR0.S2P =3D=3D 2)
> > For the whole series (3-9, 11, 12, 15, 16, 18):
> >
> > Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >
> > (and I think patch 16 is missing Eric's R-b)
>
> Jean-Philippe and I have followed up the progress of this series,
> Mostafa took into account all our comments and all the patches were
> reviewed. It seems to be in a pretty decent state so if you don't have
> any objection, please consider pulling it for 9.1.

Yep, I've had this series on my radar since you said in a
comment on the previous revision that it was close to
being ready. Thanks to both you and Jean-Philippe for doing
the heavy lifting on the code review here.

Applied to target-arm.next for 9.1, thanks.

-- PMM
