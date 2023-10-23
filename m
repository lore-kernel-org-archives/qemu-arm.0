Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1706939ejb;
        Mon, 23 Oct 2023 16:54:18 -0700 (PDT)
X-Received: by 2002:adf:cf0d:0:b0:32d:9f1a:9f60 with SMTP id o13-20020adfcf0d000000b0032d9f1a9f60mr7714781wrj.61.1698105257849;
        Mon, 23 Oct 2023 16:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698105257; cv=none;
        d=google.com; s=arc-20160816;
        b=Jg2NMLv2gFAsehvSgPUKS+pwLyURLXTXj+qW0Qyw6POl+YTHfO/BcMmLIoZ8wm7aie
         WCyWoHGFMoMCxrXuPLrEZR0JcBaV5Za7SXtzNF4LqqKoYRbq+XMYMzdgS+OagM73lnjV
         aUs3X3ewkR8GMgElEYHRflCWAQg6UBSmBQ1pA2vxfkawBJwQLbgKfCe6sC306V32KuYk
         wRuXQgr5uPEs9Njfz5oEc4wBCe5T7GairoWE1HZaodNIzBi8qgj8LEWj+vXJSIYAKT13
         PpDHQhV0d+RzFdo1+P1blu36yuqGvbzLxPCCy8UfxE27C3L0HY/6kDU5wDQ56ImK92Ps
         QD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6o+DekYjjnj3xmt+pxvdI6YmCXVRtdmhxWyk/XPyGoU=;
        fh=dzXeOW5AEeHqYmBcG4wNV1+x2mK4LYvwhlSKubJBhkY=;
        b=SYNDLehgjcAkAt6qVmPy8CbKpYbB/+fTCmMS+eKwhc3ubhdeQHp8zOteGWKa0eHzlw
         6uof5iQT+4OHUF9Y+UI7zIDynB0Trr3rotWefY8z5lp+NGYv7IW11kb3Z9xIdUB7yHjM
         pETEx0F9p9faLrmMgp3RHwEiHWG/2qE0suu2m2wRM8Fm9Avprk2XfuXTLMFx9tzy0VyK
         FCVIuofgCLgnVu+J6tywfRQmD6CxaGiDC0Xtk/LR4bfEQDGy3TuTdnIDI5qDqRfoA8B8
         Rw0QQPBk4RaIODtdKLZ8TMZ5k27ilj71JKPOkOS1llKrvm3UFlS2be7+lmK3V3kWl8Ps
         WDEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sksYWLVS;
       spf=pass (google.com: domain of titusr@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=titusr@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <titusr@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d16-20020adfa410000000b0032d8eff6c53sor1917738wra.5.2023.10.23.16.54.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Oct 2023 16:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of titusr@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sksYWLVS;
       spf=pass (google.com: domain of titusr@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=titusr@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698105252; x=1698710052; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6o+DekYjjnj3xmt+pxvdI6YmCXVRtdmhxWyk/XPyGoU=;
        b=sksYWLVSGw3gYk6/OqgwZPSKM5dzO0JiCZ+1oW8fgjqmkDQDPGaG3fviNPsvrj/tZk
         O9kk5LJw0jj0R5ctLEpPbvjsbs2qQs6p4g4C99NhjOr4W6saY4G+BWOdkti1G6Heb3t9
         Asl+66Qp+PMR0POmGQ58U62DYXgIPVEVzBRUXfWBWfUtUI27hW+mdlI5tbB9+7yRnZny
         xFNWXFxtBKuapv473cfIJqsndQzKu/D14/R7Kjae7bshTbfgAD4W0crw//sEx8N/qOhv
         JTRaj+/PntTL0nSpLzX8ONGXFyWodiHWwZT4D7YTedb08EvZ1ytC0EU5AKjB8cNMD8wj
         WESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698105252; x=1698710052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6o+DekYjjnj3xmt+pxvdI6YmCXVRtdmhxWyk/XPyGoU=;
        b=qe9wL2n5grvTDzNV1wFJEdBe5jsUcx599lFxp4eCKVeLKOsimO+1w9GitsSOg5kPdi
         9Uem8jkvXNR9O22SOlwd990RnPFhmA19Ta49mIkuY6W9l+WORhUu5lVMIaSzbNtYSmdg
         bDNSUoxdVCFafdOHOlX6lMnOUNjKURe2RbekeOF4qwJAm6R/X4SGG1zQpvE3F19SO2sG
         jWCaP6qfHclXLtFNMHSaB+p+p6buA/JdHsbg1zEwb5Ns+k8wcnB/eDdzMAz+rJVrQGIn
         +zDbG5owwtlbNOHcly3I5dBqx+c9s2T2tjwMmZRw9ld9DS7XZd+MnQYa2ZZ3junteXsy
         hxmg==
X-Gm-Message-State: AOJu0YztWTv0OYprZnzmyKZVlRw/Br9LkeV9/8QfeldYi4rnxuorh17A
	ek39jWMDvDWGpIQU8IJibIX1GEv1noMmvv1wwzabkWorUpoAvQudJc8=
X-Google-Smtp-Source: AGHT+IFXA5BXYASV66wpZJBzx7v/e6rwYJWG3ZIXSts0YIzwAU5oJ7L/Pz/nKcYoXhaptq2vOhv0XRL9b9HMdpPJWCU=
X-Received: by 2002:a5d:4e06:0:b0:32c:d0e0:3e70 with SMTP id
 p6-20020a5d4e06000000b0032cd0e03e70mr7758101wrt.56.1698105252332; Mon, 23 Oct
 2023 16:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231023180837.91785-1-titusr@google.com> <874jih40a3.fsf@linaro.org>
In-Reply-To: <874jih40a3.fsf@linaro.org>
From: Titus Rwantare <titusr@google.com>
Date: Mon, 23 Oct 2023 16:53:36 -0700
Message-ID: <CAMvPwGpXZxyoX1WNypgNCW+Uj+bcVPn99vF71Myx7jn_c2Fjdg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] PMBus fixes and new functions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, minyard@acm.org, philmd@linaro.org, 
	qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: vP768gJiZHPr

On Mon, 23 Oct 2023 at 12:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

> You seem to have missed a number of tags from previous postings:
>
>   https://qemu.readthedocs.io/en/master/devel/submitting-a-patch.html#pro=
per-use-of-reviewed-by-tags-can-aid-review
>
> (although I notice we only mention Reviewed-by in the docs)
>
> You can use a tool like b4 to apply a series and collect the tags. It
> will also collect the Message-Id's which are also useful.
>
> Once you've fixed up your tags I think as the maintainer you can submit
> a pull request.
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro

Thanks for the tip about b4, I spent some time getting to grips with
it and it's a huge timesaver.
I haven't quite figured out how to get it to produce and send a signed
pull request, but I don't need that just yet.

-Titus
