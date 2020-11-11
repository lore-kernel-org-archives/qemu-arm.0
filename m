Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp733083lfb;
        Wed, 11 Nov 2020 12:10:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxo2t79D6AU/YmfzLRoNF1CqMQLi7GUS1Q0eyvbfCl2AtEtoFARlHWK4hPJ+UVPxwPPbSLC
X-Received: by 2002:a25:4656:: with SMTP id t83mr32846443yba.65.1605125415407;
        Wed, 11 Nov 2020 12:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605125415; cv=none;
        d=google.com; s=arc-20160816;
        b=fLKeTPmDhz9eI1swA9ah7HsBH4b5LE/RzHJl9u5ufldDQUwMQvRwWCpW0HA27iz3iP
         zNip3f/nlovCbbuvBCDYg5fkKaGFbhUeFDfqr2lPGvQB3zahbbYMF/ocwFLUe9NRYHAe
         q+XivoDO+L4bgn5jHS6jYMAk3bDCRkOmpNB3xQqkeSNowWs4wBOwNzl1Mz2kBsssan2w
         rbUiZQ5ARf8+hpPiZViDMDurq5SHKSz/ncxrnM/SOI99jPqBM5naYK77+9/wTDjP3/D6
         ltLpXOcdg5jpCAfRSE3pfQpehgHvj6DyS2quW362bmFg64CFcDkP2/DcmWXWS+KpLToH
         iABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8VutIPnXcgSd4P4lTt3pBxxmTj6JoEaKdxLPoubesfM=;
        b=Ra6Uepgzgcvr8yMzCKX2acEfZKPgQFJNG7FCsZ5sXcdheKgNxGmoEeCCq7YXAOz9HE
         ivibfWDeLTOZO7nWaMAkWBIZ3s9J/3cc1Tz6bbo7oTHvuP4/EBsKTYshasWUcKXM+4xk
         YSDTT5KMsmmoUaHEvGaN7nCi3kyPby3Nyc1AasO4dOahCkDkB55LX2zs59Nr2Mq877kk
         wfcHLtc3wRNYy9mSILYwZrt94A+Lc+t0MP+wB1xt/RPk1PlRtrwrt3n89f1+82dOgb2f
         ELkaFXPuEJ9Ka5X2qRlSurav5eNz+pg19nklLF+ApCyq9rIsQwlpRzA7V7vNWPavkaB3
         hb0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c+uPQKWj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si3069806ybc.426.2020.11.11.12.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 12:10:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c+uPQKWj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcwRa-0002yw-RW
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 15:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwHL-0003AJ-G6
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:59:39 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:34008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwHE-0008Pd-Pt
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:59:35 -0500
Received: by mail-ej1-x642.google.com with SMTP id o9so4463819ejg.1
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 11:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8VutIPnXcgSd4P4lTt3pBxxmTj6JoEaKdxLPoubesfM=;
 b=c+uPQKWjSpXditJKr+pgeykWXvkdNqrQ67Tk5xH2atLrm3lhFiIeXxZgZdm2u8Ulk9
 cIGnIIxo62h5by2w2AVCYD0YUcPXi16HQfke5n5mXMc7hDTWxahSJgmQejbEp8Dx5qOs
 KRKD6hg8GesE9+x7tW18sjgOBO32h18j6N5sDAW5besX8L6Tz7iz2USD+1losWNmsYTB
 5mF4VooQoNaxcDD1XWaP5BigZ7XaYM4nIrVaolEHD2MpvFtNd4hJBUntM3sHBIW6X+oR
 6mdnhSpD38qM5q5hT1mrQ1np/K2Zqqb5FfPL/taHCPOLA9cgMwakP06aUO1/AB3qIOYd
 hNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8VutIPnXcgSd4P4lTt3pBxxmTj6JoEaKdxLPoubesfM=;
 b=bjbvuv8twZlp/PAVzyv98GUEypqiMw6EG16z/2+Fz3CXyYDGX5oC4J14V+Thrso0lJ
 3HS3eaOkWO6LhUtY34aNtdlkfjQP0EXCxr0el+HTRpZOSxxjoUsoeiWW94smW7i/qAoF
 yG64tRT/301TKTCbSbNoRBIt9R39bZgQjwyIT0goZ8FS8kFN9BE+vnQqwpFtRQ9wUjBb
 Q2KIqFeN0q0Rx5IBtjwIdsyu5mHAZyZgSnMoouZtQZy5n2MIac4/Cb5rFzgDPOC7iufJ
 ijYDfpj7jz9Y5DcxB5wWtCtZrjVwMLgk95RkwNypmfQ7mYj3xPNGmEYGGOwsjyNrQ74Z
 UOFw==
X-Gm-Message-State: AOAM530q2ZXYKpD9QfsCxbc4F4yb6NEOWkUOf2pfZWnPCZPRHYTIF9gd
 HP/nyD/GqQIIZNIVaakUttZ4E1qGO++vjaPukHso0g==
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr26793058ejs.482.1605124771417; 
 Wed, 11 Nov 2020 11:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-3-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-3-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 19:59:20 +0000
Message-ID: <CAFEAcA8M5w0tY9q5PmbEkJ1pN0f64nmziKP7cqChGmFGkXL-TQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] vexpress-a15: Register "virtualization" as class
 property
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m9E3hh290yc+

On Wed, 11 Nov 2020 at 18:38, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/vexpress.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
