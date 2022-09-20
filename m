Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1821817ejy;
        Tue, 20 Sep 2022 07:25:51 -0700 (PDT)
X-Received: by 2002:a17:907:b10:b0:76f:e74f:4f4c with SMTP id h16-20020a1709070b1000b0076fe74f4f4cmr17234577ejl.132.1663683951873;
        Tue, 20 Sep 2022 07:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663683951; cv=none;
        d=google.com; s=arc-20160816;
        b=RFla40w1ovZipQsq3AkbWwgPwYL/wNstcnJpKKcqHXMlWgOtd/qfqsWT0gL2bY8WLI
         uX6V3jtTUrCrpRDXTm3oerKgAY4O5foLVguhTEH7D61hUpI4OP/6AetA4vYILL3OiAtM
         VPU+aVAJs//xtaO+Pn2nzHyEJu8A+RLtoTjagyR0pOF67dZhVeSu1LDtuhl4xUhrDxov
         OkrIlcfz4NXh1yoeGeNiR867t95j/kuGsjDlMdINPjNnvm3sldmK/pkaKMW+5NABOFJS
         qZe4LiHM1aabEbOYew8Csx/Pd9vN/634I+tb2gYfQSNfqcvz8/LlJ3JU60v8b9dvLzoL
         Zo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8a2Q2kCKajrPYDnxbIr5HJoJ/UAyVTuqI+zyphFleY=;
        b=W/Ft6hjCoe/4XheVE4F138XpAfUt0mBusgJQsjNfbPgA71J35SsKHEarUayMPRuIFL
         I3F4DzCtnWXQqIa7gcM1BKGJl6ZLonT0YzmYci4SQjva3mV/gNWl3aRvOkmXUwmCALOi
         ALAqnQX/tRWtdd5Vcfq8M5uwDB/igHeXR1qI9FtgBIm8lQW9J0rRc+Krq8BZtlL6vXkX
         dDhnH/U0K4w28f5jKDIw2slox4P2bTJPJS3m9rf7E1siiGXEsa+T8DIFmmMRq32hvIWx
         XN5DnhymLbJT+OfM7XeBk7yEaYg38OdyHzp1jnic5WuG/I4oXHvaQtCf2eOHMEKHoV5Y
         EyFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PE4oRsn7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m4-20020a1709060d8400b0073d5ed593dfsor828173eji.126.2022.09.20.07.25.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PE4oRsn7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=j8a2Q2kCKajrPYDnxbIr5HJoJ/UAyVTuqI+zyphFleY=;
        b=PE4oRsn76QpbhndK6BpsfKiNFiTuP8PsylLIvSAPEj4zq33kbYy6oHh1GuTgNU4XpV
         5+dus/+VllgNowZNeh5a52sT0tykq/fbZZyprMEq2qBuYrb8xFVzzOUcqkX6e6naoFS6
         45/b1HlYWoo7cgCTUeHNCOi8FMBTYxiNYfTEbbNKKiOVb30nnUisd4pa/V7qQARkiQL7
         tMEoyIGEtUi9UuBVMZGMqRJAqgnhVZuWqvYCjHXq4LgnGVj5sE33xmngKNpMplezxvFU
         oKthkiM4RmfSSBG5W59adH5mup6ddRctHWaabeGpoukK2wMPZUlu0EaDSZKlnN8FfkU5
         A3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=j8a2Q2kCKajrPYDnxbIr5HJoJ/UAyVTuqI+zyphFleY=;
        b=cXJexdAfzQgepb4TUhbN9Ihcvb1aJiAa8x6lWA89wINcPBwHCyjw4uLTQm79cU/rTF
         brv33kgiZoiSjsY3GlDv70x8DHvjR8PCX7m4Cj6k2YQTnIbOOZaVFbn+oHirMCaK+dfQ
         RiExVdSU4ZPk0v+3oM0lviUUDlVDFrquZiGeyuzMVn3W8Mll0Mjz4UruVJM0l9PJfNNY
         Du7uCEiq5ZMCM4a2SsfxrG1hweKgyc4K5sZ9YfeZPX+hFo+d4+Vm/kiC3O+l/9XKOtog
         ikw1qm+0pGiV/jn0jAPiF2zYReIDXhlwBURzZTI3aw19DiJe57l/yZ6yMaUbdE5xmxKq
         5t4A==
X-Gm-Message-State: ACrzQf01hPdLbPYvyPmsUjiEt4U3R/mSnnwOETLeYoBri0ksNoIB0qe9
	/XwrFn7Os0ujb3ZhAPYPlxINz+yb1ulZbpK/ar8ioRB9
X-Google-Smtp-Source: AMsMyM7z21yDhyjpAXDTWy+jkR/BCoaZMg9Nl2o3HWR9Z8GRNQV7rxs091oQU2F1gGBSX7XiURZw770sJWxMTBrUKIg=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr16441679ejc.504.1663683951651; Tue, 20
 Sep 2022 07:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-6-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:25:38 +0100
Message-ID: <CAFEAcA-LT6V6=7-J7FD6_RLB4tw3e+OFXqMxe-AuO_84VEbgJQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/66] target/arm: Use GetPhysAddrResult in get_phys_addr_v5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: OSpVAIzxRno6

On Mon, 22 Aug 2022 at 16:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
