Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2964930ejy;
        Tue, 4 Jul 2023 08:01:58 -0700 (PDT)
X-Received: by 2002:a05:6512:10c9:b0:4f8:6bca:50d7 with SMTP id k9-20020a05651210c900b004f86bca50d7mr10698949lfg.13.1688482918726;
        Tue, 04 Jul 2023 08:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482918; cv=none;
        d=google.com; s=arc-20160816;
        b=ADW3nnEyMK29cyzmg/wYA3AEjXLsMj/H0iV8bldtdTB+aSZhSapQYx+zuUGvCW2/yB
         o7g9cPo2LSaukjsDHsvHzeqPJgsJ4usvsM8VShibzg34R9fncVlJRSlqx4QLDfMRuDzM
         HCkMpUtWTB0GuzdS2AYq8sC3c7de6HjiPnQ5IeJ96xAgnEWl36o3mAy3P36cSDd7arKp
         0eGXvdkwMfse7Rg2PSmO/oSQyQUiC4kdFcCqSxtvOi0MBbeQRiDO6IYmpRjeK4ADJ3f3
         MDTyaM2ISkda1xxG5Q0VAuXgEv8dPzMF/OLFNwTtfxa1ogq3S7JwvDjevcM+lS0zjt88
         u6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lJNdG3kc+XhhTJZGszgqViT985Cu75mIYQQW0+ON9MQ=;
        fh=xeZpCZUcz5+/LxCyKk6qk6KK9cD4mAsPbYo6D4//XL8=;
        b=xvSXXa2hvb6aUQuoBilpSD3d+9/NSOU1rpRnQYeB0kIlcisxNMYyv/QnWZ1DY3iQ3o
         SNM+2zThpgZFGXOwXS1J2v1jGFHG/xBjYZ7OkBvuiONNIrMbBM682MfC5Y2jIPOIJehG
         h/DAoBq7ORCY58Vlt/Zk8B6bs2bzoXcQX2ezg63Fhb2Leu4iWDi6tlZ0t0QZGt1oUguh
         B6/wQjtbZnobuX7K5WEqmFgFNSJJAz1L0+lP+/MIHjdcsQpmH5k3/pBOOtwllnKYPRlF
         3ALHlnT/P4OLzeJRZS5AzMo9a1CkDEFru8+S1AK7KLAPf3qbSnDDRzAxgyty4tJOjsxN
         PY+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wRTAlAef;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o27-20020a509b1b000000b00510dfcfea76sor6348560edi.4.2023.07.04.08.01.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Jul 2023 08:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wRTAlAef;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688482918; x=1691074918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lJNdG3kc+XhhTJZGszgqViT985Cu75mIYQQW0+ON9MQ=;
        b=wRTAlAefM6jEPCWDIgbIkEAtaBzf/xq2LXLY/IchV6fUMmm2/oL35ru0LhD4Cc5Cnq
         NaUGc1Wj2utE551LeBzEr10fHjXyCBYRAq/aCtdIYrdobqcIpw3foiiKmiqTRQ4CUJPe
         9ARNN8FCdPE5zcgjMJqX5PZBgo7j2UtI9DOqMLC3GYM2Z/A+sJeq9ehqsI497Kjiif1T
         GKZcMMS9kxiGCroUwJkNnfl0EPr0gsZwajmiKTBbt/a+XusN0a9FUn3WkNRdkMPfJNdl
         2e+kzNjsEmF+omfZ/u/VmqVP3ROVvdla4XAqKMtsg8oCR5lHREKIPSTdjBpMQf/5wEZT
         j8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688482918; x=1691074918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJNdG3kc+XhhTJZGszgqViT985Cu75mIYQQW0+ON9MQ=;
        b=OSahrhUaWhQw6yp00IXLcawYIcz+nkheOBZ8lJ8JlKHNUeRsGjh8mAVTfNgfAAaIfG
         gtDQESdy/v+6djo1Ry1i8i4cpYNfXESZ8MJif2jDqDw7eNjepxBYqzLfgO2uMJRaYMyN
         1/TklVWdbMDvA1CFlgwIJ+OnnWVsKRuq1uUJ2tnHdg13f7/e/FHujuLJ1C+f4Mz+0sRX
         KRAcGMYbiA7xUsJ6Fcg3SunZhU96CMYV2bS1Jtne5k/lh+xCcxmqJZjzj3ro38hfU6/o
         vfu13R/5v0iXirUnjP95PrMBXqcB1Hu+3hHcRN5rw0wXCn/W6i+eYEq0LUZHpVK5HGMe
         jGsg==
X-Gm-Message-State: ABy/qLb3TSkvsszeYs1E+O3qCbM4Sr1idOXkCAND5IEgHi+3V1xC42wx
	z38gJebAYhhtLC6i7dakBwl3POkouabvcyuy3jUw1hKI
X-Google-Smtp-Source: APBJJlGUVecw6ef2AnOkqxzLgjolFM2onXbfyP/SxMGDqviT6cyyjaBmimxafNFXSqwfZn8zLKRAEz+JRQpdostJpBw=
X-Received: by 2002:aa7:c1c4:0:b0:51d:e4c5:7910 with SMTP id
 d4-20020aa7c1c4000000b0051de4c57910mr9835655edp.14.1688482918379; Tue, 04 Jul
 2023 08:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230609172324.982888-1-aaron@os.amperecomputing.com>
In-Reply-To: <20230609172324.982888-1-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jul 2023 16:01:47 +0100
Message-ID: <CAFEAcA9zB_SRVTmMAJpQ9K3gryPsYhJJYU7ZDxsaFsQpb1Up3w@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Implement Most ARMv8.3 Pointer Authentication Features
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: gpw8CrKxEYrk

On Fri, 9 Jun 2023 at 18:23, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Changes from v2 of this patchset [0]:
> - Remove properties for EPAC, Pauth2, FPAC, FPACCombined
> - Separate out aa64isar2 addition into its own patch
> - Comment clarifications
> - Several code formatting/simplifications
> - Rebase on top of latest upstream changes (for example, those which
>   reorganized decoding PAC branch instructions)
>
> [0] - https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg06494.html

I was looking at trying to bring this into target-arm.next,
since the changes in patches 1 and 2 for code review
comments are not large. However I found that it fails
"make check":

ERROR:../../tests/qtest/arm-cpu-features.c:425:pauth_tests_default:
assertion failed: (g_str_equal(_error, "cannot enable pauth-impdef
without pauth"))

as a result of patch 8's changes to the handling
of the CPU pauth related properties.

The assertion seems to be because patch 8 has changed
the error string to something different from that which
the test case is looking for.

Patch 8 needs to also update the test case to include
testing of the handling of the new properties it adds.

thanks
-- PMM
