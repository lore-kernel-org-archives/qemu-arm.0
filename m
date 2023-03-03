Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp940880ejc;
        Fri, 3 Mar 2023 03:16:45 -0800 (PST)
X-Received: by 2002:a17:90a:4e:b0:237:b5d4:c0e5 with SMTP id 14-20020a17090a004e00b00237b5d4c0e5mr1286333pjb.27.1677842205058;
        Fri, 03 Mar 2023 03:16:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677842205; cv=none;
        d=google.com; s=arc-20160816;
        b=C9aHNNaDD/lvQWGhizh4CLeKqjPOl2n3DXm8ljO4IG+OVXyARoNqQLSMi+HsLv9A+N
         hIuv7iDZPjU807u3fpg2TZBct1cTxkKjskZ2RymJybyuPWBs6Y9xxHhpufSlctc7EHe8
         688R05lDV33c0efigGkI+I0gTNJTU0gKCi7lpoBsnp/LpWjSpxdCQFmDPrUGqA4N2KwZ
         1D5bp3Lzr+1Wqnb5oYbm6YOIW35ZwQLUx5bW3AD0kAANBapXKpQn0nvGuJ4U1LgmAq2I
         V/6nJ+BAOAl35oo2OO/GofYDMk/QPlCE4PUhdDD2KMs9smK9nnQdmeWJKHbAzFhWA7ZH
         VTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HpqkAhmyA0LdyZSyhNu9CgDOyvGP61IIvcQNWKvMTAY=;
        b=EI5rZY4XIDUml1YteuPTV9yhB2Oo8FbYFDFCyXD9c3YeW3z3omqKoFaSrm9W2eSRaD
         dbUjk38LkByDLM0ZZyGH1V1RThQK4Tk0B5rmZQgtypz6NKF/gFHLwj/BLpQKXeOTFc5I
         1MrLcyp+IsXgbk3OpRlx33Gq9cDY7nj0/zlSMKVEGUc9GiWcGrflvxtFsj70DxJKl1is
         qP27GUIVm6s79SGnSU9uzKTDFKy8zJc2hzDQ0LyyYYkWfsvf9tHFQQoaGXCSpbdUjlG2
         aeNotG2KlVGbRGKtXG0PngpOP50+HdvLaVIpFPjwOvfhnKlS2eP8CbhuMSEsRFnRoAmY
         wVxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPuwdCNt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p10-20020a63fe0a000000b005030d968ceesor774218pgh.39.2023.03.03.03.16.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Mar 2023 03:16:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPuwdCNt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677842204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HpqkAhmyA0LdyZSyhNu9CgDOyvGP61IIvcQNWKvMTAY=;
        b=aPuwdCNtlGGPCx32OtbizzAVK4IYwHotCm8vUf8rH71gCgSTi1Zcq6Ws8tRaL1SKR2
         qHQx4dPQGal5Mp01cA6yIhckJT5y0sDY/56m8Lkyg/mZJMEvcnV988KI15KI5u6L+IRM
         h+iELKli65iCRvcgLCo/zay4wFtlM4nv5Jr+dKavsDrx73Cy/z5r5CszWSk7BN5jbqoe
         cV8M2NxSGEj949OnkHmqKa248lgc2klZK4amqtvMC0R95XHJEVU4zXax0Zjrm7Rio91E
         Uw1owcNYZT9V8Mn4FhEJHKN6dtpI1WDU3Go5X6Cqo5qi3WxQC0vRJPf39b08ndKFcJMI
         yXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677842204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpqkAhmyA0LdyZSyhNu9CgDOyvGP61IIvcQNWKvMTAY=;
        b=C0HJMnIaanU+Jr+nMuBDi0o/HN8zmRQfdQEeMrmADRU7glYHy0aPJ4LTE3g0vDJrv9
         wanQAYK2qLowvkUN/x51UPT9Imy0OvlRAHOWnsUv0T9knlbSXN249zlrXWUAHZ/jogN9
         pew/tJAQnLHBb9u6x9IbXfL6k3gFaSYU7StRGr9LCRCwtwNdUPW/jJ0K9IS0d0juiRkt
         1gi/rJL93B96Hfrs4KCBLrqwtJ1a7epBKKLJc56Vwa8bzLmaIEBgabr1J5dGrHJQ8EIL
         7bxNo05pT5xzeIMi1QYCkxOMhsfusODbQaQzyy/vBxRO/EhU1uq9LLBYxoqzG5RIwc1w
         344Q==
X-Gm-Message-State: AO0yUKXBPzZkOBIsexXYPE5UhlwNBCqUPpWgCIpBflXNYWhQohE28Ptp
	5UqaHLR3cZiDR8aP9/rxbLVMwPvTIyFJ+b1trMHLk3Sh
X-Google-Smtp-Source: AK7set9CNauIHkidY86e9p0+4D48SNNhrsSEwa5fbYw0YUBRN8Nx2srPULT6bjJ68MYMjGEsg/cbJriR7JHdxPs40sc=
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr378922pgh.9.1677842204397; Fri, 03 Mar
 2023 03:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20230302163106.465559-1-thuth@redhat.com> <20230302163106.465559-5-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-5-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 11:16:32 +0000
Message-ID: <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com, 
	Richard Henderson <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org, 
	Reinoud Zandijk <reinoud@netbsd.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Bn+cXPLKohJx

On Thu, 2 Mar 2023 at 16:31, Thomas Huth <thuth@redhat.com> wrote:
>
> qemu-system-aarch64 is a proper superset of qemu-system-arm,
> and the latter was mainly still required for 32-bit KVM support.
> But this 32-bit KVM arm support has been dropped in the Linux
> kernel a couple of years ago already, so we don't really need
> qemu-system-arm anymore, thus deprecated it now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index a30aa8dfdf..21ce70b5c9 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>  on x86_64 hosts. Thus users are recommended to reconfigure their systems
>  to use the ``qemu-system-x86_64`` binary instead.
>
> +``qemu-system-arm`` binary (since 8.0)
> +''''''''''''''''''''''''''''''''''''''
> +
> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``.

I think this is not quite true -- at the moment if you want
"every feature we implement, 32-bit" the only way to get
that is 'qemu-system-arm -cpu max'. The '-cpu max' on
qemu-system-aarch64 is 64-bit, and we don't implement for TCG
the "-cpu max,aarch64=off" syntax that we do for KVM that would
let the user say "no 64-bit support".

thanks
-- PMM
