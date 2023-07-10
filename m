Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1241027eje;
        Mon, 10 Jul 2023 07:54:58 -0700 (PDT)
X-Received: by 2002:a05:6512:3241:b0:4fb:9d61:db4d with SMTP id c1-20020a056512324100b004fb9d61db4dmr9387548lfr.18.1689000898552;
        Mon, 10 Jul 2023 07:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689000898; cv=none;
        d=google.com; s=arc-20160816;
        b=wA+9kk9Wt+/joNVX+vHOQHXNeH1Qop6h1j+cVuiW/u9RMpuz0krxCODNRAI5VwGMdj
         e79CxaCdbxMEPsvwj5v7ygUu/KIwpD+HlGPVdtWf71M+fXfmScHnHp6yhMyu6ZATh0xC
         JcSfjFKAD9ghf1kWLjmWILgwd0uBXnPvgCB5T3jQpdjH8HhrDwTPrUbObBiV417UsbdA
         92sAgsLxcxtudlnnNwYzF+xJTSECd7M6dnTbYK2BD4hx3DghCpfO2pTKdQFxfZuQe4Il
         JI34Fspm6ooBHQKAoDxZRlwufRrbXD/bXL8zghs/6++630FSP2X76a+VxAWKqaBkF9m8
         SkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KuukenZcuC3POp6fp7XZmh0oSDn+VaLz2/wG6xVeHY8=;
        fh=7HTYbGOnxMKOUf+EFl85n//qoSQOHUOz8fhRALArAlc=;
        b=Yql1Gh+wKDFfEOx8hbAMsilyPIrwccJD+h0J/wTlh5fT9BDNZHsKrp64oCN+TuVmW9
         Q+Q1Gb1Qv8avaDNdMXt8W+FiAYKp6hCfdScfd8kUMQ06eXAJAZ8QtOFgmB+YRkAhYwXz
         FA5vZdsp0rFIQW+D5PytOcpqqMnZSXeMjHIDraYtQhCN4svQCnD6K1iVoqFUNpjKMJYv
         D/Oo9/zyzEvHZbVOQIYZgzU/HtaKVlAMkqk+kilRB+SvICnClhdElsqfpy3UXbHk5Qyz
         4h7Zs95kGp5Tq7/EFyb0yw9Qj+rcXd+PN5roIWQgY87RyB1x0J0HRRCWO5giC9vX8+H8
         l6/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S99aeUQt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u30-20020ac25bde000000b004f3a94d7604sor3862809lfn.5.2023.07.10.07.54.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 07:54:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S99aeUQt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689000898; x=1691592898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KuukenZcuC3POp6fp7XZmh0oSDn+VaLz2/wG6xVeHY8=;
        b=S99aeUQtl2K8ci2c6tU58Yyfyb9uFdUYEFhW/qOkMGODvoPSNVWcs4YiRgzgGuLSiY
         ABiXAxZqN/kLzmBR+2osvaZ5ge2TXpOpdlNj6wpH1WFHhFUQEvAQ4J2/CnMk4gIvaFUU
         J3y9kJHkZ5LKFiakJeTheHHBiVqg2l2gZOzDDEAiXAAWcag307WeMxOZc+jmPocS9q8Y
         cS5cQUOub3rjdVB6W5QPi+GM/y1j/sEmCihdesu6klULLaSRZH83c0a3Y5bciXTJuMJs
         PRjIzQsEGo5uROUYJI9yl9Fhx79qez2LlZWy/KCAAdehfZJKwwAfawhst0XXF49Fo2QB
         HDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689000898; x=1691592898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuukenZcuC3POp6fp7XZmh0oSDn+VaLz2/wG6xVeHY8=;
        b=gaCMNsl/LylgOXgKxOU9j4e34cf/OrzidSllxENi/P9FvaeLva+7EYWpeRj1udG0+f
         CqbWv/Lw5oKNNoHdiHasWobSrmcRF2huXA3Bs3mcb+wwmklq8cdN9nYL/kZ6bTYmEaMp
         VL5OGmjd78eUk0W5hVWeK34X7KNTRaSC2OTLCjJ8GSBVWDNvd1osPTx77dfniiaQjGDa
         5WZAzmYaAGyWXh7wg7wbWiYDGUPtm3k3g77IjMzJlltxdimyRZ+I1CS7MDzlZ6V+toRn
         j6E91LNL01hzXUZjzqFxhXMewsJCLtD4vSUW8sdeNNqiQUK3Gdfulyi8RJCP5FqNKxxB
         JpvQ==
X-Gm-Message-State: ABy/qLZIa1jjnTsPgi0gJYpeQc8YbZziPSygJ/HuMMqhch5+12okv5y5
	h5L6iMKHzlOldaDagVUcweRjcIPofuvtL+MnQuPV5R5h
X-Google-Smtp-Source: APBJJlESX9hEh9WlI8RgcT0e7RZuI0eoBkDlsR4YIhfEPzEBs9wA/GSF096HJnxkVyzpYMCfelO+xyFmGxqMo9fnNPE=
X-Received: by 2002:a05:6512:3b83:b0:4f6:45af:70b8 with SMTP id
 g3-20020a0565123b8300b004f645af70b8mr12258829lfv.58.1689000898160; Mon, 10
 Jul 2023 07:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230710144348.239441-1-thuth@redhat.com>
In-Reply-To: <20230710144348.239441-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2023 15:54:47 +0100
Message-ID: <CAFEAcA_QTRJwtQxh1FRHtwjSARAptF-j1ZeyGen8xBfrhq7tww@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: Disable the test_sbsaref_edk2_firmware in
 the gitlab-CI
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Beraldo Leal <bleal@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: lP8bvhheDlXf

On Mon, 10 Jul 2023 at 15:43, Thomas Huth <thuth@redhat.com> wrote:
>
> The test fails occasionally, see e.g.:
>
>  https://gitlab.com/thuth/qemu/-/jobs/4196177756#L489
>  https://gitlab.com/thuth/qemu/-/jobs/4623296271#L290
>
> Disable it at least in the gitlab-CI to avoid failing CI
> pipelines due to this problem.

I'm not really a fan of disabling flaky tests only in the
gitlab CI. It means that plain "make check-avocado"
is useless to the average developer because it can
have all manner of broken or flaky tests in it that
never get tested by our CI. In fact I've had to develop
the habit of running "GITLAB_CI=1 make check-avocado"
so I can run the CI tests that we think work and not
get distracted by intermittent failures.

If we want "disable this test except for if you're
trying to investigate why it's flaky" then we should
have the test be opt-in, not opt-out, the same way
we do with QEMU_TEST_FLAKY_TESTS in the qtests.

thanks
-- PMM
