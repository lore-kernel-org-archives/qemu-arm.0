Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp561628ejn;
        Fri, 14 Oct 2022 11:02:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:987:b0:563:6b50:b2f0 with SMTP id u7-20020a056a00098700b005636b50b2f0mr6672956pfg.9.1665770560921;
        Fri, 14 Oct 2022 11:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665770560; cv=none;
        d=google.com; s=arc-20160816;
        b=x576iXWKvq0U0pDVnnrX9bynP8eTQFmUfS9Sxw1aLQe9UPpT+//6+Y/+stEKTRkbtH
         c37/6pO2e2HrBx6eDjBPSEYbs3IZ6T+o6qetTPoL/tkBJUOgA03AnSNMxnkbyA3Oy4J4
         WC/5xOOtE3MKhpLkeHKi7KPBQDW1QNUFljWKU965fzIIZAlZw1A5ohX2oL8vbf4sIYGY
         H2ICV6tvVMkVvKqpRuDqgH/rDVlTZemWE0CAZwZWpnwLi+yT4Yu3kwt18AyzQkaKR1rp
         pduyuf0EUETv9Rq6KdKLyPveaftAK//vmWR6AXtJNg6ndkiiCezet2eCkRmeHDuoc1HU
         J8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O0cHMS0fTrILr6zx0fkG2j8GYVombfqCH0iel4nFKAw=;
        b=JF3SX7Brp8zDBDF76WGcO1vgjXHFJbQFcQsqjcPQIRvQKkkS8lUENDqUtyyJGZ0/9N
         hD9fL5GFOT57PIV5l++J3QJEmfpPSk+Q9hbKnViRFV6VqPWGpR1C42lr3yIdicbWn9PC
         ceZcXt622A/Joxz+8LCmDONqvLqRPYP7dNnKU5G2lEG3oxCgknZl1EE/6If4R7fj4ota
         NT/xKBQvvgXQxmqss+UVwLySh35SmvQIlyU6OtTI5rACjGx+JGY/js8egDJJGjKkdPEW
         dxZfAx/pE1XsCG4BtwBld/euYDY++4D4i28gMbgELmQfsx26/eE4RN2/mq/296xZjKCk
         mr+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OALRlVaN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m17-20020a056a00081100b00538116baa57sor1753625pfk.75.2022.10.14.11.02.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Oct 2022 11:02:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OALRlVaN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0cHMS0fTrILr6zx0fkG2j8GYVombfqCH0iel4nFKAw=;
        b=OALRlVaNowzDEsNzbCvEGa8iQODArpjcQMvT8Dyuk9Ceq4DNy3fBoOoMLbj3otyEM0
         OkCZtt9QsedOxFhmSZAIh3GXfXAB6Km+9PYMYIYXniBPjOfDt5D6ftHgaHfKeMpRIc5u
         fmJGk2krO4dCTBGGtsz2jDmaE4cs7Y6lCi9goIC6DYaFdijlKDrZkIcsDdmnXGjgEL1r
         Jq1At46MdumWagkk0SsWYnKC2MBtgBioidlCvtjt1DWpmNZQg/bzdtTtQJqQ7bWZX/IH
         YNa144Dih1zW6P/KnNyrSe70eEihAvhvKSOCkkznZSlADnzneG0bf7Ia1iHp0sc+BNSe
         WdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0cHMS0fTrILr6zx0fkG2j8GYVombfqCH0iel4nFKAw=;
        b=dIvBs5of1fmDTnE9UbrrsxWcxM9/jehTuFY9+At4QPyfTBVewWn7t3l4vU36AKiUY4
         MQOxgH/JxWCSSrC5H4jzfExuiQp/g9e+H6jhHYUSP8p/BhEg7gj+a/C/FBYDzPDZhmK5
         v2BCQykCs2xC/JVzu2UFk8eozDgDRtgZw5g6kuWM1J+nI9AwLll1z4ca3OPXg7N3gfuy
         aTpiLN1DeihME94tvTHvXNqlhQKCy7qNYkfvBCgoFfgpJ/7a9mNIJffwiwGu7tO0ErJy
         FhTiFs6CeCXZekIDJ3bpA/Jbfxu9R3XvtfGpFiHhIkqOsQxjRufIhXZ093I/sgDC6M2R
         iTyQ==
X-Gm-Message-State: ACrzQf0BtSzO9RzQWhRgiMpJgiRxAaHZekx50aCVBCHyP7sqXcnkUDVx
	dg03iIujOAQIC/Qk4WuGP855BjEdUH5iivm2D/F7JkbUayzATA==
X-Google-Smtp-Source: AMsMyM662yH1yIMGAz7eRuuShS06VDrHfr4h1k2BMzrBxweTo9ONMHjgiiEo9CAEH8BLC833pu8eRhDB/vUgrUeBImM=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr5580763pgi.192.1665770560461; Fri, 14
 Oct 2022 11:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221010153225.506394-1-alex.bennee@linaro.org>
In-Reply-To: <20221010153225.506394-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 19:02:28 +0100
Message-ID: <CAFEAcA_CEFLejvFBYhxR+AomKiBziuh=wMWKfnBkuiKQtgQWYA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: update the cortex-a15 MIDR to latest rev
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Arnd Bergmann <arnd@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: q+SdnT+NFlXu

On Mon, 10 Oct 2022 at 16:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> QEMU doesn't model micro-architectural details which includes most
> chip errata. The ARM_ERRATA_798181 work around in the Linux
> kernel (see erratum_a15_798181_init) currently detects QEMU's
> cortex-a15 as broken and triggers additional expensive TLB flushes as
> a result.
>
> Change the MIDR to report what the latest silicon would (r4p0). We
> explicitly set the IMPDEF revidr bits to 0 because we don't need to
> set anything other than the silicon revision to indicate these flushes
> are not needed. This cuts about 5s from my Debian kernel boot with the
> latest 6.0rc1 kernel (29s->24s).



Applied to target-arm.next, thanks.

-- PMM
