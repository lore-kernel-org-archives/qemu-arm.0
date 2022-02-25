Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1948461lfq;
        Fri, 25 Feb 2022 09:57:33 -0800 (PST)
X-Received: by 2002:a25:a467:0:b0:61e:1b4a:7700 with SMTP id f94-20020a25a467000000b0061e1b4a7700mr8344345ybi.390.1645811853265;
        Fri, 25 Feb 2022 09:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645811853; cv=none;
        d=google.com; s=arc-20160816;
        b=qbbl2Ao52KShH9AHWaiDk15G/iUp9Zi80h+eSec0NEyAtYt/XB+DdVHAP6LN9hlnhR
         wkQu12WWsbPCgYNdQTi1wo+QoDXabOSgOR1mneTbM8maM3cDEbGMXIM8zyPvN158Lkvn
         fMRbRRzy3LoH/EgILIvWt3p1t9eNlOkK+WCBRm8+ly2JHACqVWyzJtMR7pR6/qMT4gfT
         IbIrJnEYqkNe6x0ff+ylmPQkwbzkMQv3ImG7slhuI58OfW56nF9HQSPhLR7DomCbPLoU
         GL/Cg6SjNrXx6IwIbf8iYplPvUA9WXkfljws1uefa1OFDuuazz18T1py4ltpx/iusmkE
         NK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TbDhTR7G0bzWRyZi1swxpGARwyW/b/53IV/Y4M0uj3s=;
        b=UeumL8/NLCNrSMWRRrw01hNjodHffVUaaOzYbc5bJK3zEaVxQT7URSbmWckNRklIiA
         jElfvfgMe70fNVVLOCwysviZTdufJkloV8bcM35ChcZf3ScjQLGj7UQzCghsNBdQyyyi
         0Q26Vg+9OtXNBmeVdI3BfMojevRheSUExUaQAe77RDsiztQGqpekxaQH2aW04XnMRbmx
         tSj0xvR4400eaRWHha9h8FcCKace8nXndZSa5eUrRcmiK2EO0JIyl8wI5WgBAeBqboO2
         +J5AxYBj5NUWmqvmUAYXkH/ZaDno33x1mM1BA9+YovDL+z0VdV3NNBvgoxouk/I/KFRM
         X3Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPZP5pTa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f11-20020a5b0d4b000000b0062441fda5f9sor2385549ybr.167.2022.02.25.09.57.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Feb 2022 09:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPZP5pTa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TbDhTR7G0bzWRyZi1swxpGARwyW/b/53IV/Y4M0uj3s=;
        b=iPZP5pTarRnx9XopRgzpZWOHKN6XbT6MM2sb2sKcj8GrHSM0YNp/6TKew7oMHHLYXr
         PA/kcGGXGjqjfUWbejlOV+BHlLQajPlHd9UW/K3iDUCwpOlC4bkd29XMjaz0o0JIVIU3
         jye6uMJfXW2URnPjBdA0xkKY+RhpQrHmE0HeW39Sx4ynbGddmPZvzBohM9orRzKBfpW3
         P7KWoncK5Y+D5BUCdHyCvg6V1yrRyqyRaf18GMX9PKFqvx/bJ3U3lhSpHsqvZl2MX9dd
         WQbPufjcyrRyukU+YUcndGSufvnJqgMhExtKhnKtHm14iROIpEYLSsSqoFnzg46XEaYl
         MZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TbDhTR7G0bzWRyZi1swxpGARwyW/b/53IV/Y4M0uj3s=;
        b=1drQw1khX24CJu+sD/fYePVftT9covlkYSJ+fTXH9iHwFy+QFFpiDbdujTh/RCxrAJ
         SBNQCP8J9goc4mIraKbGMF3OHwXEe7RWZMEC3//WbRApgoWUhlPc1hTwbqmJgqKtb+AZ
         v0Uc/sDDxQKjOjjJ6M/DAE4DFbeb66iIRMMjvyUmAlIaj/yEzEDiLd9Dk2oHYd428sK0
         1R5hgs43Cbw/vOgW6jX2Kgh96CIH6p1d/7pkbKrwpeINVjLuJXhe6izBfoSqM6CBAVIo
         4opZo4gaOkKzhoY4g7W4YXaZWjpSQ0FCrR0jDEpVsadeRs2Smtliftam+++8c+wA6/tf
         6WHA==
X-Gm-Message-State: AOAM5330HZ3Ln6Pg58Lfq/lGxLRa7t8cyZnBWtvUTS9owl8Ea0AR5aQi
	yn1QCjdVO+pF61Tftmv1c5Omlrt8HJodgJfy03HjIaCo0sGCeA==
X-Google-Smtp-Source: ABdhPJwZCdDUKRyrwVFGiKzVDDxHR0IqYbUr9eixpkuH/KxK3Iey9u1RGuUpPVjuGDm5zuQ8I7AjdjMKHZaFCpJBEsQ=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr8524396ybq.479.1645811852780; Fri, 25
 Feb 2022 09:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20220225172021.3493923-1-alex.bennee@linaro.org> <20220225172021.3493923-4-alex.bennee@linaro.org>
In-Reply-To: <20220225172021.3493923-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 17:57:21 +0000
Message-ID: <CAFEAcA_xh58hX-bXPOQzkjUEuWsfXYc9K27HRCQ+tH3+Xt85PA@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] tests/lcitool: update to latest version
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, Thomas Huth <thuth@redhat.com>, 
	berrange@redhat.com, Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, 
	richard.henderson@linaro.org, f4bug@amsat.org, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, stefanha@redhat.com, 
	crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 6UtTdmb2WJTf

On Fri, 25 Feb 2022 at 17:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We will need an update shortly for some new images.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20220211160309.335014-4-alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
>  tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
>  tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
>  tests/lcitool/libvirt-ci                      | 2 +-
>  4 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker=
/dockerfiles/opensuse-leap.docker
> index 1b78d8369a..e1ad9434a3 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -127,8 +127,7 @@ RUN zypper update -y && \
>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
>
> -RUN pip3 install \
> -         meson=3D=3D0.56.0
> +RUN pip3 install meson=3D=3D0.56.0

Why are these formatting changes to the dockerfiles in this commit ?

thanks
-- PMM
