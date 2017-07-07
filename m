Received: by 10.25.44.15 with SMTP id s15csp363202lfs;
        Fri, 7 Jul 2017 10:37:01 -0700 (PDT)
X-Received: by 10.223.154.141 with SMTP id a13mr1498138wrc.139.1499449021866;
        Fri, 07 Jul 2017 10:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499449021; cv=none;
        d=google.com; s=arc-20160816;
        b=FZwPLDq1Pb4qSHZi6sKGW1FZ4d6X8S9dCs4mmCoLeiuq1Sv1IJvWbcY9QgocZuB/8i
         gFrepyrvddNXDXqJLD05A29O84xckVtIFINekCHGnSfvnKUWEFgPqrX8iNkLtu82azdk
         YpT3bgq1NN61CC+PmvfmZhMTJPE/qrbUy611+KcLDX6Ez068hYAho1KbZx7roAlXl/+S
         oHbcmQ/dn0ZcViVEg5hiqiGwPk6Fz+lSbMeO9eCrm68Vntm15kj9eGaFZGLbJ+++dvki
         wOphYvctY5Ns0OGwaGE+qy/aTrX+nAEnvPLgXjEzzJX/5CVY0stxjYrh/m1gEQvSiLvn
         /KSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=W83NwN1n0Roou8a7YCo5+8yq3RZIhdQao0rWtcJ8UQA=;
        b=gGglArH449UC2AZClpUBoxYxCYnTxRDek0uN0vKBlbtfmw6hMqigyFORH701YiwhHP
         2y+SDX8aNzYvyA8lrFI+8auFHibe6fQCEJub5cs/XIXYtzyb2KdgJ4bm6yzW7Y5sXJDQ
         UGocnAaucqGv/XpVGL+WN50924DHhCmBWzjVDzlACSwqkCDNbTKw5DLa3BKqA+YHibnk
         MfxotAkJVA5giCwAU2uYOR68zmm9Sy8BaPXi1hT3oZoN67du7mP2DZXGBdHt5mqtQWb7
         h6iGjKIDTSoAv75YMsKAEujbhnPkxoPWeNZ7U3627iTOB/Glw5pH77DCpucXiFEWU0tk
         33iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Epi13lRT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x234.google.com (mail-wr0-x234.google.com. [2a00:1450:400c:c0c::234])
        by mx.google.com with ESMTPS id s184si15962wmb.85.2017.07.07.10.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::234 as permitted sender) client-ip=2a00:1450:400c:c0c::234;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Epi13lRT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x234.google.com with SMTP id k67so55988231wrc.2
        for <alex.bennee@linaro.org>; Fri, 07 Jul 2017 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W83NwN1n0Roou8a7YCo5+8yq3RZIhdQao0rWtcJ8UQA=;
        b=Epi13lRT5BdEK3Jpv1WZIBJGuu8OwKO8laKBz2wyzy+ET4rnLyHcUUsZE08thum/jh
         QYaQ/10FXOmkMFk71Y2p/7PiCw7I/LqiYTsaKUx08Y+z9vi8jGjjSVyzT8tKAjklSuVl
         KGxAhv6ws1VTCRiwUqt4/nUDhCZpDqBzVo370=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W83NwN1n0Roou8a7YCo5+8yq3RZIhdQao0rWtcJ8UQA=;
        b=V/3fNeZ+3qziYPgZoV3jJuLQ/ir64BkKrASqBPqOad0RzRApQEgTBSpPkpkc1BUrDA
         Q6U2A+23hq7kjYdNmDV25A5gTLim7VJLdH0yoTLMJ5dHZbGhl2tKMNqhwCYO/9VTbWlD
         MkPqJ+0UvXbc/Xou04CsP99qCdv7lUzsXpfHxwjJ0Tv7MJmsYSbcyw7LYvYcAMZk5nhV
         NIx2ccTv6Z0jZ3XDvPVKDSkmiAz8KhkHyPRMf8JdUZOnR+tBnpxzCQxCwvFUUtHgLtxh
         GcymB8KU5NPpI2QBzmN/umhhuPQK1L99WiikHpiVF6U2C7D4F7eTpUsP0ZdyDR9oIEha
         qsNA==
X-Gm-Message-State: AIVw111EOfFHTOd2oloKPCAiLayRCmC0vuc2m8mVCVdp79GLvIMvsno3
	B3JApF/5stjcj2FBwJ/Qm6zXjBeuqZgtGSgIKQ==
X-Received: by 10.28.129.205 with SMTP id c196mr5353wmd.120.1499449021357;
 Fri, 07 Jul 2017 10:37:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 7 Jul 2017 10:36:40 -0700 (PDT)
In-Reply-To: <87inj49mr1.fsf@linaro.org>
References: <20170707161822.29659-1-alex.bennee@linaro.org> <87inj49mr1.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jul 2017 18:36:40 +0100
Message-ID: <CAFEAcA_YvS8OQVTPnvRtWyVuAKO2bccyNALOs1Oq7snTO1WwkA@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: ensure eret exits the run-loop
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Etienne Carriere <etienne.carriere@linaro.org>, Joakim Bech <joakim.bech@linaro.org>, 
	"Emilio G . Cota" <cota@braap.org>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZgQLyUYLY+ua

On 7 July 2017 at 18:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Given the wording of:
>
> /* is_jmp field values */
> #define DISAS_NEXT    0 /* next instruction can be analyzed */
> #define DISAS_JUMP    1 /* only pc was modified dynamically */
> #define DISAS_UPDATE  2 /* cpu state was modified dynamically */
> #define DISAS_TB_JUMP 3 /* only pc was modified statically */
>
> I'm thinking that really these DISAS_JUMP's should be DISAS_UPDATEs and
> we need to disable the TB chaining optimisations for this. I'll prepare
> a more comprehensive series next week. However testing this patch for
> known failure modes will be useful.

The problem I think is that a lot of our current code assumes
that DISAS_UPDATE means "go back to the top loop".

In any case I think you are right that DISAS_UPDATE should not
allow chaining to the next TB, because it implies that perhaps
a TB flags bit got changed, so you need to look in the hash
table again.

thanks
-- PMM
