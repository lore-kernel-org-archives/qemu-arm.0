Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2483590ejo;
        Thu, 14 Dec 2023 09:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcr2gElTzUY6YX7721yK8/EPNLG1/+3UTXJ9oksUdRpaPALe96vPjTsQjgvCt8VsOYruvr
X-Received: by 2002:a05:6871:e80a:b0:1fb:75a:c413 with SMTP id qd10-20020a056871e80a00b001fb075ac413mr10770895oac.60.1702574665428;
        Thu, 14 Dec 2023 09:24:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702574665; cv=none;
        d=google.com; s=arc-20160816;
        b=lL6+HCoGI8a7DNsS7j3cbSv2h6MiMGm1vYDAlebG7E4P5XlD9aBpZBiQvJ5GeesQe7
         1xh7kVPfQcnRoxCtgN/BZiLkVAtQs0g1XLYgssDq4mNkpjHW5BnKxJ3AhhRoviZhT0Bd
         F1fp8PWEmuXgwBaxdIq7r26UMTMy/0JgeMyQFqD8J6+XkxRhw4odjizK+ESGTzvl1tBL
         ec3/tcVvrLY88IQqLFYOcFKvArY+7xAqFai0wJB509Q7bPRzImaegNHOaWLZdV/UsnjG
         fz75jsO9N2/X4WlZUKjJBoeWZMjmWW++uxaFGYO5oieXjqf5I6i9qxTyWbRwWvEQJfd2
         J28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UKra64iSaSeFV3LQpsosShbMK65VZiJ0KZyiYrlx1b0=;
        fh=p2gCSBkMbPEESFodP4IGFO1jRPz2GyWpXL6EU60pNjc=;
        b=gJHXp+Ik7G4Ki+zUKr8ZcW+IIQ3MxllXt9O0Jipoe/Llea+r5YuThTrfRn9uX4/9Ff
         K2ZP5nRRU2F5WpfBBFUTJzeYdakfRHk5Mf3WNomePzg2OLSFn+KkXOMu49PGUoH72Yd7
         zDuDMzAkXauGQyYwJQ/kWLqrhXZYV98lFQSi1cu+WmtXyfp1RXf/DDZlkOKrfhLjGUKb
         E0oxxKlKwGPgfiAwuPQYuCLcxbEYwJL57l7BdqgUKuPtAVKuJIQAWhM4kIjRKB50esE3
         JhdytBxR2C9habYzJQvxfPlWlipjaeiQndI+Qx8MZjpYkYlFryyDW2tOd55aqnvAW4Yi
         m0Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MxDV3NCE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bx5-20020a05622a090500b00421c3b9dbe9si16399253qtb.208.2023.12.14.09.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Dec 2023 09:24:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MxDV3NCE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDpR7-0000eC-DP; Thu, 14 Dec 2023 12:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rDpR5-0000cl-2R
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 12:23:47 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rDpR3-0004Vq-1g
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 12:23:46 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50dfac6c0beso6604846e87.2
 for <qemu-arm@nongnu.org>; Thu, 14 Dec 2023 09:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702574622; x=1703179422; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UKra64iSaSeFV3LQpsosShbMK65VZiJ0KZyiYrlx1b0=;
 b=MxDV3NCEcwzb6BktywdJLNA0HKugMOs3FoaS47ygK/J7eiVj45FYM4PhAsGPtRf5Ei
 v1reNj37T/es7U1JLNB//a6+/7+4sPgXO9oe8fwQ5u2cAWy61Tvzyc9Wunw5YWiKBMAH
 wEVhgAJDSz78yBR19cih+SEivL+jQgwfC5nPyHqVitT6PyXjKOE1Qo9wI8hMa3OrypG4
 3RgB326xL/1fGQohf6QAXPhM1xA7sw5g+rV7F+x2dkmVCvFmqLwOFiuJJVe+bp9FTVAH
 Q00O2NzNOKnYHPZoffdPpiHDFz9DAOud7Py8PQEjbA/krctJIzB5aFOejy/hHp1/F5F7
 mC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702574622; x=1703179422;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UKra64iSaSeFV3LQpsosShbMK65VZiJ0KZyiYrlx1b0=;
 b=OV2Ck/G6kbhROhDyNTgmJZfDqL78DI5/PI86ocJNEUQ1fkQVfF5BuV5hcSuN3klcHY
 ZECH+jcmq99paPjgkN0VMjcLpbg8oTVHDZdHmDX6pvEX1C79HNUbI2Z2OEwGlbgboIv0
 POd2rPJ4FryyP4K5mM2iP0Q4iYkF/xXHJ1xKZv4s47jPC3vguF2EkzixaqO/jjliE811
 rM8EHHRoMFHzN4Xerri2MDGvkRKlfmSGzLhKlL+UqVIR0lLdpNKm9B86yPMR5Mkj9tCt
 z2o+fvsI3oY6n8OInsR7wHyEozlDpyVzM4X1u9eXeUUa+v1TIYecjZV2vVvdCMr7R2fA
 2XDg==
X-Gm-Message-State: AOJu0Yzm3epKUO0vDRmtqerMIjR6hJO1D/ZF3LMbhDD8qKFeNmVx5oLC
 tkeS4m97oydSt/Rda8SZ0zxJzw2q0gdrxaXEk6eTeA==
X-Received: by 2002:ac2:5489:0:b0:50b:e454:17b9 with SMTP id
 t9-20020ac25489000000b0050be45417b9mr4957007lfk.84.1702574622124; Thu, 14 Dec
 2023 09:23:42 -0800 (PST)
MIME-Version: 1.0
References: <CAC8KSA16N+DsCzPVE64NvqxQZZfst67prPbu=nzPTfHiFCEgdw@mail.gmail.com>
In-Reply-To: <CAC8KSA16N+DsCzPVE64NvqxQZZfst67prPbu=nzPTfHiFCEgdw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Dec 2023 17:23:30 +0000
Message-ID: <CAFEAcA_1+-AkM3Pt75CM4WVorDrN2btij_Cn2n_aYvKk++PORA@mail.gmail.com>
Subject: Re: [PATCH v3] fsl-imx: add simple RTC emulation for i.MX6 and i.MX7
 boards
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: SX4LsT/tdgsw

On Thu, 14 Dec 2023 at 11:49, Nikita Ostrenkov <n.ostrenkov@gmail.com> wrote:
>
> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> ---
>  hw/misc/imx7_snvs.c         | 91 ++++++++++++++++++++++++++++++++++---
>  hw/misc/trace-events        |  4 +-
>  include/hw/misc/imx7_snvs.h |  7 ++-
>  3 files changed, 92 insertions(+), 10 deletions(-)

Hi; this doesn't compile for me:
../../hw/misc/imx7_snvs.c:139:5: error: implicit declaration of
function 'qemu_get_timedate' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
    qemu_get_timedate(&tm, 0);
    ^
../../hw/misc/imx7_snvs.c:140:22: error: implicit declaration of
function 'mktimegm' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
    s->tick_offset = mktimegm(&tm) -
                     ^

How have you been testing it? This looks like a missing
include line, so I'm wondering if you've been testing it
against an older version of QEMU rather than the current
head-of-git? (If I fix that error then there's another
one after it because the include line to get mktimegm() is
missing too.)

Also, your email client has unfortunately mangled the patch in
a couple of ways:
 * it's sent it as combined HTML/text, not as plain text only
 * it has wrapped some long lines
 * it has sent it base64 encoded

If you're planning to submit more QEMU patches in future,
it would be worth looking at the notes in
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#submitting-your-patches
about 'git send-email'. For a single patch, I can fix stuff
up by hand at this end, but it's a bit awkward.

Other than that, the patch looks good to me.

thanks
-- PMM
