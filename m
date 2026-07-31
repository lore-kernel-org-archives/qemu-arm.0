Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A06C5516D
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:58:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmoT-00011S-1n; Fri, 31 Jul 2026 08:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpmoS-000114-3J
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:58:08 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpmoQ-0004bN-9v
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:58:07 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-6679d88abdcso1230548d50.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785502685; cv=none;
 d=google.com; s=arc-20260327;
 b=L8SLqBn1WnZ4QysSp9b691hxsroHdi44Z0x5JrhCIOJbjFtP7KCZ6Og0/f9oiBHhok
 gfVl2KfQN6Wc0WbPf56mjghcVGzUFqw6qmTv3BdcZmnquFVhHxOhCEvlKJ+ls5uTBSq7
 GT9qugw8ocrXdjv6kqO8Kt6eN1NxbyfxtocI0P1vLb+XkXAmkuURfu2WYoZrg6pH2tFl
 Mzn6r7Td1gkcY7dy2XFBTdu8NfTT/7IWwsg9kJ+zRKKGgVlhuBwZS1jQa1hhFrMoUbdm
 P3csBQ9B3vQSb3CR/FmfY9YYSgrn7Oq7PGPIUT9SOImnBB9XI6RD/qdlBQSfO45k8BqJ
 L3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zT010dL9zwi/EIWKfQkcBqsb9hq/y0PhOEutY5xxjRU=;
 fh=ytKKvCEYUbyIhWn47fDaRZX3h9L4KpQ/DR1oWzW7rjM=;
 b=UKw040XVchy+2AWgmYogYxABafKVnbGMZeM8uZgtXiQtnfUFzIDhnncF/jnMoQI722
 /PBfS97NLefXhD38BEICspKIVl8KTVF3jqaO+ejqIZXiZ7QjPpENlrkEaFAPkFfF94o5
 jl+E7B3Ss9a9zkzgs5woguyWPg/We2agbjsyDnGKC5qabnLTNm22G95xbXe2qNcCrfdJ
 iNG/f+DlqoYXyd7pnxdc+yFGYnL7LSI7vKkZuXsaL6LDI5+0g7VtBAYTY6gLiJQQ8fxQ
 19glKzPdh5i34IUOiyYiR+2qyQvfuZEZv5dADqG9837e2Zj1LcGJC6p4rg7aqLoMkJje
 rH1w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785502685; x=1786107485; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zT010dL9zwi/EIWKfQkcBqsb9hq/y0PhOEutY5xxjRU=;
 b=jh+jSTIh7ROKDTZDxO/R7hNJ0NnHTLyoMq3r6ljIOHfvYpfz+rONrybyK+zrPcktDp
 0xgg6jJVlgVbbNuQs6D0f8v0EkFLTuZV6SsBlvgfeKc7bMbOcT93dCH+z/qXMpI0tncd
 gtgErPyBRLvF1FOC3DyhzKYqO8iRABEuVoOrWca+BM90Vn7XV0al/2cde97sRpM3g7WM
 zPKdO2szhjTfuggbSNMettnTae8ExQVzwtWIsihuDDatqlcWTa1iCQLB5NkRbvWUzu1q
 xVFstw+qTe3XIGhGrqIfRZUJNBMqbUl9rxKU55iID1qCd96i+1aHGNGOerU230gyR4VH
 p5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785502685; x=1786107485;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zT010dL9zwi/EIWKfQkcBqsb9hq/y0PhOEutY5xxjRU=;
 b=BdZkfsVmfchh40+QSbCl2OwzwVLfWu5CejoxkBkjQWIFeHoG+yDiq9tyy51rI677Fg
 qUc+Y0cOnkNCjjiLKI+3lL4e2AlN1/9AFEQv8QoUfP5LR4zve10xVO97+NVDHscZQCGy
 l53j9sIuVpANIXfqRjNdqFQcjsPPI32c2wtmcDATy+FnefojpGGMOANzH0bZ7oQiwIDG
 bcjnC5c3l72ihwU/ts1s7vT3GgDH1kzY79+m/L2SMlPQTdVb3BrelllWqjflq9UHvUra
 xPKDJCJVLBRADJnWmgMHt2HEkqwW35NFpmDNyYK4of0UGkkP3BlY2A2b8OHRYJRtDjey
 qzxw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqdYDx1sTHFFhG7yTKvMQaihpW597RGXuGFvOBuZe6JNGcdLCXT2lAFBqn+hInE+iebAldPjjeaTQ==@nongnu.org
X-Gm-Message-State: AOJu0YzYL5UVgukYbhKSMwdg9TxC+e+huGPVJE6rXrLrKdKmHtdDAV7Y
 0ybj+iDIdZpbJVCoVOduQSVazz2hDBOM78EQj8pJ3YQ3lzcDcv8CzR8NFwjz5PTqwSZu1jFQGs5
 B9PqnVWCIaxBK1uLVICnQ9ioXPlOttlfz0OXonPEi3w==
X-Gm-Gg: AR+sD129MZc2XPI8Unm507sg8J9o8M50379EfOGQBm56Rbxo1VzKwN/bnlv45uOewuO
 MroHhd8bWA9WliRZfrHx53anQj1xSnAlY4L7t/cH/vcJra3KhewPRx2OptkNbl7heteOZKc5MLE
 HadqmRrYCRuj+OJJ/6Ik0ddNNDBmwUm4K1vLY9kAASxex1BnDBnFGKvHwbTkrgmW0ukZDtUow0x
 s+90uNMbj5VopHIdwzwfLC7sMSsFeNf6GNvtQXxcUBQYi+4JZjHnLlrLAw8kL0sF8jFRgcBgJNC
 gEQsZXTs4jLPKfWGN31Gj7YWKNwvNKoST5GvzmwipuOIjq3zYIoo4F1iPNXOYUQ3Iosb19Pi3W+
 Z4QlTHL52/MwG1LfCHUKrJdUGLdyG
X-Received: by 2002:a05:690e:4887:20b0:660:4936:95d5 with SMTP id
 956f58d0204a3-66945480ec9mr1111441d50.40.1785502684845; Fri, 31 Jul 2026
 05:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260723233605.805-1-simonxhy0404@gmail.com>
 <20260723233605.805-2-simonxhy0404@gmail.com>
 <CAFEAcA_Ybrqb0g-cZYf6yL2eHRUZ6PfeWQMiVrVVeFJFp3q8KA@mail.gmail.com>
 <DM6PR02MB49408F0E20F38E117E7FA08FFECF2@DM6PR02MB4940.namprd02.prod.outlook.com>
In-Reply-To: <DM6PR02MB49408F0E20F38E117E7FA08FFECF2@DM6PR02MB4940.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 13:57:52 +0100
X-Gm-Features: AUfX_mwhHN4YczljuUr35pt2yA3jGS3PHiNYGl4bxDW-fsy_E23m7ZYAtHpjLvY
Message-ID: <CAFEAcA8h9ca6gjKrBjvzX63OJ+1TCy=TTDCHA=0SHdv_TsFVGg@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm/tcg/cpu-v7m.c: add cortex-m85 model
To: Simon Xu <simonxhy0404@gmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Fri, 24 Jul 2026 at 19:11, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> > The major reason IMHO to add a Cortex-M85 model would be to
> > have a CPU that supports M-profile PACBTI, so wouldn't
> > it be better to implement the feature first and then
> > add the CPU and the board model that uses it ?

> I understand your reasoning behind adding the feature first then the CPU/boards
> so that there's something to use the features. I looked through the patchew and
> saw that was how you handled it with the M55 CPU and v8.1-m features.
>
> To explain myself, this patch series was a part of my intern project at HPE. We
> currently have a fork of QEMU where we use it to emulate the HPE BMC. I am
> working on implementing the currently unavailable M85 CPU with the Custom
> Datapath Extension for internal use. I thought I could potentially upstream only
> the M85 CPU and related machines. I didn't include CDE because it was not fully
> polished and PACBTI because it was not super critical to my experimentations.
>
> I do agree there are no architectural differences between the M55 and M85 right
> now so I fully understand if this patch series is not sufficient for upstreaming.

I definitely think it's a great start and it's most of the work
that we'd need to do to be able to add a Cortex-M85 model.
We also had a series submitted which made an attempt at
the PACBTI implementation (though it only tried to do it
for user-mode, so it's also missing some parts):
https://lore.kernel.org/qemu-devel/20260518-pr-pacbti-v1-0-8932a885b03d@foss.st.com/

I've made review comments on the other parts of this patchset.
If you have time to work through those and respin, then I
might be able to find time to sort out the PACBTI part,
even if we can't commit the an555 board code immediately.
And even if not, we have these patches in the archive that
somebody else can pick up some day.

Incidentally, the custom datapath extensions would be a much
trickier thing to upstream, since by definition they're custom.
The Arm Fast Models handle these by letting the user supply
a plugin DLL that implements whatever the custom insns are,
but for QEMU external user-facing interfaces are always awkward
and it feels like specifying that in a workable way would be
a lot of effort for an extremely niche feature.

thanks
-- PMM

