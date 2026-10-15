Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF3FCC6B30
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:51:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHJ2w-0001UH-BD; Thu, 15 Oct 2026 06:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHJ2t-0001Tb-TJ
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:50:47 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHJ2p-0007dr-7Z
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:50:46 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c3fd91337baso19159266b.3
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792061430; cv=none;
 d=google.com; s=arc-20260327;
 b=O3fSom8T5iaST62soj8TTcfAyVqdqHd7300KkOarEsGENXchFpZlw/rVcdNjAoU/O6
 zfsl2oK7KDWhcJLLr6yEkTh1pBalAw8zeA0kO8IgbV6zNyU9o2Y+bUX9i1x0bkJp7RKY
 SYCxJIxcIR1036U3zk5iNDWPnz1EwJr10JG3bckROr9p+phYvopEhLrEmg81AsDbfwkf
 6I5Rhr4O9iJqxmtTesd+KS+XQjSxdQ6h92ZaxTDt9OedmEtPZRsFMAyqBu79NMDvOX27
 gGFAXxgUKi1K0PkRkFXartU/NTWINn87gSMnfDnkPhdLXOHmQuqDNX2zkmxfasc/zsTP
 5Gvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Q4AO9bxH+tgTrPhIoG66FprxezF6tidCBv/9483EfV8=;
 fh=bylHTlXKagR60JR6hlKikcBZkjoax/Kz3v/HLA7SjSY=;
 b=V6D8Xdq/rgRvkU5DOf5QmccEsTcenlYCoHVhALAZETYS0a/NAOnE2WNkUTH2LTReGe
 uzRW7wwv8WKh5taApSKyNf8Slcna/d4EbclCUbkfkf5DRUUTFybPMdto672fA8Ghl2B1
 EjU5ljPl6uUDzAYtgZGumFT9s8ajh6t6Zki0IZBFFjp3bqbLG+3RbWTPbQdpMmlAi0N7
 92rZVwPPpCN2KYVl4mdUyxqiXbWQfs7XsBsmJRzNDhxTRGYG3T6JBqxS3pymdbInpPHO
 QOi2+LHahQmqLutGu9j/2H30LfIUhJmyEVunurqbBK13wQFpQc2KVUNhVIE7mCfarJmQ
 GUyQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792061430; x=1792666230; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Q4AO9bxH+tgTrPhIoG66FprxezF6tidCBv/9483EfV8=;
 b=TQRo9IGqn3T0Hz0OZQGo50lo6ZANMArCbFceJ00Mb2ZFJCBcGeKFExiVwyVZJMfbpZ
 q/f6VPN2ZUJEz0nXjovMt4BdQH364QjyzcHJrHz1P2JMWR3wamUyhqsiiTasYERb9d3i
 4uQiX7xXfC3xFFx6ARjm2nzE41z88f1HWi6bO5J2le3QddkIL0OFTFZmiC/USxg6fGzC
 z1xHb/uE6ZAe2nChlV6vHWf7mKdUhgjYp8ZJNAL1t9D0te62IywFElVIa8+Ni+jRyV5W
 TuJh3h8iJRFVPCwVqAvp4VLwl9yITi78uhTNsIgr+JmZYAOTUkAv5Cn6M+hLP8eeIuZF
 cD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792061430; x=1792666230;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Q4AO9bxH+tgTrPhIoG66FprxezF6tidCBv/9483EfV8=;
 b=GkisDEZG7qTGiUEWrhEDtUXjGvL6WLcTKwa4vZh8Yfe7MHhWwEF70VDTrJkv5zmBb3
 jl2j9wsNuLlutGc/RePlrD4wy95jCCFHcLrqG7oizaoKAdZ4Jy8SKePE+0OSX7I77/UQ
 qa9gYy6HUYioEBJUrwU5Nj89NRV9TI0dkC463sdpv1gAzALbkAjbV4vc85EfOhlwu8lp
 NcH0FqxnBU09FT41Enwv2OH0+JATvOAzu8912Fo2MwXaeaEUhlAdtlkPqU1eUIN0hVXe
 JjmOZkcREtdeE8/aLTLtm7TIR8l67UnLEFNe8Yvslw/qyv2LdDy9Ki4pyKwbrmQGTi0A
 /xCQ==
X-Gm-Message-State: AFq9FYL6IkKkRVDfX6HzFCGY5P+1mbvji7PMFt4KOdQ6Ea039IpT2jmH
 iZUaP9zrStwN5oBJ8zgUSqHgSdwJwY315kmba76O6AqdNjf7hTEbdG4ChLvCfFAIaDDjuN8LLMt
 CTgt3laK20o13kKxybrinkXhgj1Cfp2SemYd/YVcnGA==
X-Gm-Gg: AYBFou353vWp4/9vY8qqRW8mhDhgCRsA0wG6U5kH7d/2LwVR/Kwd/77EXd6+wOZ1TGD
 4CefMX5flejZXuAkmqGn9071sqAPjUHXS2xon+U4vyXI46Y0pgNXdmFsVajhN6vcYtl4jpj7X5T
 JUTZg7/F2Rb+MIo1TaNmcN0LxFK+TKRGmW3CaqPh1SRtP3TcUyB9Ryv7BvNiSQ/b9oGpxdIJahT
 EYH0M0RLVxzXlBF4MdOOTECfXdYkn8oLP76RycPRHtoMatBJu0rMMaRbr2gMGEpc8V2oDM+iOA8
 NERojdfQmwIMb3HzgY0b63lMnT70LTJO/fxO3hTdqxON2CGVnG3Q5jv58QBoboedfhb44CHm3JC
 ct7XcnP2Wm8w75o241wxm0VKFRKGWXorVmhJ2JyY=
X-Received: by 2002:a05:6938:a082:10b0:c3e:f39b:2286 with SMTP id
 a640c23a62f3a-c3ef39b2474mr118063566b.0.1792061429972; Thu, 15 Oct 2026
 03:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-57-peter.maydell@linaro.org>
 <8a030bca-4697-405a-aaa8-017baed8ab55@oss.qualcomm.com>
In-Reply-To: <8a030bca-4697-405a-aaa8-017baed8ab55@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 11:50:16 +0100
X-Gm-Features: AclHuK88lg45P4EkvW9HrI8lz9zJgYYWo6jTVyjchPgx-fRU5L14eo76rAgVhK0
Message-ID: <CAFEAcA9yv0GDLT5XTp_2_FRO_xRhPdGjhKbjkdfUfh=epaDNPQ@mail.gmail.com>
Subject: Re: [PATCH 56/86] hw/intc/arm_gicv5: Implement IRS_VMAP_VMR
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 13 Oct 2026 at 11:12, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 13/10/26 10:39, Peter Maydell wrote:
> > The IRS_VMAP_VMR register lets the guest mark a VM as valid.  This is
> > a 64-bit register similar in operation to IRS_VMAP_L2_VMTR.

> > @@ -1604,6 +1679,14 @@ static bool config_writel(GICv5 *s, GICv5Domain =
domain, hwaddr offset,
> >                                  deposit64(cs->irs_vmap_l2_vmtr[domain]=
,
> >                                            32, 32, data));
> >           return true;
> > +    case A_IRS_VMAP_VMR:
> > +        irs_vmap_vmr_write(s, domain,
> > +                           deposit64(cs->irs_vmap_vmr[domain], 0, 32, =
data));
> > +        return true;
> > +    case A_IRS_VMAP_VMR + 4:
> > +        irs_vmap_vmr_write(s, domain,
> > +                           deposit64(cs->irs_vmap_vmr[domain], 32, 32,=
 data));
> > +        return true;
> >       case A_IRS_SPI_SELR:
> >           cs->irs_spi_selr[domain] =3D data;
> >           return true;
> > @@ -1704,6 +1787,14 @@ static bool config_readll(GICv5 *s, GICv5Domain =
domain, hwaddr offset,
> >               *data =3D 0;
> >           }
> >           return true;
> > +    case A_IRS_VMAP_VMR:
> > +        if (gicv5_domain_has_virt(cs, domain) && s->vmt_config[domain]=
.valid) {
> > +            *data =3D cs->irs_vmap_l2_vmtr[domain];
>
> irs_vmap_l2_vmtr[] or irs_vmap_vmr[]?

Should be irs_vmap_vmr[]; silly copy-paste mistake.

thanks
-- PMM

