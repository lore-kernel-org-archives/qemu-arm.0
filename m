Received: by 10.25.15.197 with SMTP id 66csp67174lfp;
        Thu, 22 Jun 2017 05:35:03 -0700 (PDT)
X-Received: by 10.28.18.201 with SMTP id 192mr1684275wms.2.1498134903418;
        Thu, 22 Jun 2017 05:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498134903; cv=none;
        d=google.com; s=arc-20160816;
        b=INc7KUd190Oly02KaDO8sX1m+ymSJRmX0WVRa8L7wi5/JvVn6zJvgx6TURbx1rbjd5
         dOcAZ/zSSfgWj2qtxXy+GAj1FSpWBUDrAUGvYjkDqRGa6HPLKPvgQJiLp7gvwSFN/64Z
         9fDs3jQKVUXfzYG2OYe+7JwWJE9AKh07UMs/T4B35nAq8rj7FCuNoo8V85eigUF6HgkG
         3uLg6sTJXj3Y2+mGSe2bATTFvzI7lFi9GmXOlUo/kmsV9dzgpSyTT6apGt8E6RXodgPn
         2c+kQX0728QxNqw1URUsbV3ZptHRouhKsKOXh0bJOLQyjn9+bAjmpo6p/YAWuzwIwwDI
         pZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BBD5stCgZUn8JE3Bsd5tktUGlnyJZavddg2YMaj2nss=;
        b=FTyRTm4dcBRa07PGTBIU8lfUiWUek0GUygDeuu8gDgpQBFgyGSCJ5/r3txo6ynPWin
         eNPVMP5exqzgEQmKBhUZH8t+o1QOS1FeKNc+jEyHHyE5PD40pNaQUQaBfZJBlYsDT/0F
         2Zp4RF9wBaaW5BbwQrZQVULssf8QPvV87FoQHaJQlPIdue3xO7SLEBPP0h4tUieZ3wXJ
         k4DvPW0JgL1D3wo8D/CAaOSipFhlq8vlEPA0u+JPhchR6QRpZwCLT7aWGM5yX7trPxN7
         AnI+ylHkOaVs8ZBXkikvZKk1HSPMIR7x1Afyp6OOqmXCCKqVnvsfiAtIXdrUjzkDppaE
         MOsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Yaqc4q3r;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::236 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x236.google.com (mail-wr0-x236.google.com. [2a00:1450:400c:c0c::236])
        by mx.google.com with ESMTPS id y195si1121648wmc.2.2017.06.22.05.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jun 2017 05:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::236 as permitted sender) client-ip=2a00:1450:400c:c0c::236;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Yaqc4q3r;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::236 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x236.google.com with SMTP id r103so21713198wrb.0
        for <alex.bennee@linaro.org>; Thu, 22 Jun 2017 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BBD5stCgZUn8JE3Bsd5tktUGlnyJZavddg2YMaj2nss=;
        b=Yaqc4q3r/N+M97xgR8Cuw8OBPCk8Cz7aKJ4xVRVhApD/VxqooUrkM9DMK3pwYsnGeq
         9kecSSA1ArnENenbJoKx83NE8UNJjMvADIgLjrztxozK9UMyMX1jAUuIt+0FM+nfFbRH
         lSG69W/N12fKMs8aHidnnaaqklVZBEs//Os/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BBD5stCgZUn8JE3Bsd5tktUGlnyJZavddg2YMaj2nss=;
        b=rSbQs888poxCXPExW7IYMkpZUIrUaFPCUep8euc3HZAWV+Q+Q/KrphJe6PORC8LQUy
         ZO1BMy9eTEdd00AJ2iOPdQPVy8s3wBMEjXPKAYO2oDcmPfmERNTPKj8bH7wysgsuDpYv
         NAOw0ti5H+ttvnWm5xdEV6PKlw9vJOIG358aaRAPzWGAUd6vw26DJxLEV5ueGT/KZuEk
         bodwkWvMW6bqdKDHS2EJVczuJnKVAN+KTqnod5ACZUWwkBYMq/pzOs2JZl89zp18MUtb
         HIKYJRwnwRwUH+KStZx6s7MuCFzTodD7Hp+B98CU27cgTg5DJzunjIM6G1AQWOEkoL6O
         0nxQ==
X-Gm-Message-State: AKS2vOzuC3C1TIRwf6cY3diNfEzo3mLTUc4yOX6aOo5g8wvUFxYI29kx
	ovN0/xv7hBX/AUz99Dc/oXIP6vAhfUyKNq0r3g==
X-Received: by 10.223.132.7 with SMTP id 7mr1771315wrf.187.1498134902847; Thu,
 22 Jun 2017 05:35:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 22 Jun 2017 05:34:42 -0700 (PDT)
In-Reply-To: <20170622111845.5296-1-alex.bennee@linaro.org>
References: <20170622111845.5296-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jun 2017 13:34:42 +0100
Message-ID: <CAFEAcA_cUBfzUyCs60e3O9TpqyvXTmkU9Uh25EL1Vy23Lw0fXw@mail.gmail.com>
Subject: Re: [PATCH] target/arm/helper: document potential CNTV register bear trap
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Andre Przywara <andre.przywara@arm.com>, Christoffer Dall <cdall@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: A96m+b7EBS/v

On 22 June 2017 at 12:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> The ARM KVM encodings have been inadvertently switched for
> CNTV_CVAL_EL0/CNTVCT_EL0 in the register API since its introduction.
> Fortunately this doesn't currently mater as the reset values for both
> are the same. However if this ever changes things will break in
> interesting ways.

Augh.

> Migration is currently unaffected as we just use
> cpu->cpreg_vmstate_indexes/cpreg_vmstate_values verbatim. However this
> would break if we ever supported migration between KVM and TCG models.
>
> For now we just warn future generations who may touch this code.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Andre Przywara <andre.przywara@arm.com>
> Cc: Christoffer Dall <cdall@linaro.org>
> ---
>  target/arm/helper.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2594faa9b8..e7a0e39583 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -211,6 +211,11 @@ static bool raw_accessors_invalid(const ARMCPRegInfo=
 *ri)
>      return true;
>  }
>
> +/*
> + * FIXME: the KVM API has switched encodings for
> + * CNTV_CVAL_EL0/CNTVCT_EL0 which need to be fixed if we want to
> + * change the reset values or support KVM<->TCG migration.
> + */

I don't really like just peppering the code with FIXMEs like this.
How much work would it be to determine what the actual required fix
is (whether kernel side or QEMU side) and implement it?

thanks
-- PMM
