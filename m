Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp616252lfl;
        Tue, 15 Feb 2022 14:01:58 -0800 (PST)
X-Received: by 2002:a5d:6da8:0:b0:1e3:c0b:153d with SMTP id u8-20020a5d6da8000000b001e30c0b153dmr18501wrs.658.1644962518790;
        Tue, 15 Feb 2022 14:01:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644962518; cv=none;
        d=google.com; s=arc-20160816;
        b=DC2Q/kSy7KOKxh/KOPPWzl80wc/Hg99tKMH95jfnjDfXt775G+dauNeqSJsHh4Qe+a
         iCg8IiBpD6qKx7foGDmRiXcOjSbjzB9UekmlT1+KBfgl7k8jRi6gPDw8sVwgPdqCgek7
         eq8ou1QPuGeaPWsWxZ7T+eYss8p+8YM5O+M9ta4qyOE9UGjx1CT2fcoKbBaPUUJlr5wh
         yy+j+nS+rW5uYL+IwdXYEXSXNg5IMZy5Ua/bayrMEHDzMESET4h0aXYApLCfCnNjttTy
         WIkiZ8X0yUwlv2MFoYA1WLSYOlTba1V/LXYH3bSrMxexd6mfzXLGovh8FTbzOnt9sIJE
         4AIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=slGKjp1EyADeI48N6b5u/oGvMYcf3V24i9a3DsUgpqE=;
        b=FNzQATvN7BhLdoEVBzjIEOYIIMJW05so2xI4TT++g6Nbsk8vbyzHxTtTQExdgcA2vV
         hi2VUjnxdLPNWhUKYfxIwWVI1d1p3oYx+HWCVPiTFQcepGCz30zs/ZX/j/+eWvFHY3I0
         sOiYC54xj+Y9hAjpnKpyDen1kNEPYwTL+Yb5lgQZy2g0QjbtNRtlfv/nJ9NLPHU9xEv7
         He1Jv8bkHpISJw5ZRCMsSyKVSTHDea6YrZmkvM7HqRJKOzIzLBsuoSi01kLp9kWc5qwp
         NTO8Eax0S1aevLQTR72KShoPNAWKSI8BcVVozxgOKPqCgJGOuYpAq0pzD4/5blumvJ4c
         Qe6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=puIfEeRT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c14sor4828458wri.55.2022.02.15.14.01.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 14:01:58 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=puIfEeRT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=slGKjp1EyADeI48N6b5u/oGvMYcf3V24i9a3DsUgpqE=;
        b=puIfEeRT8zmm5OgztSn0CBKiZrFbuViT446Uh/A2xTKBRFVrO9o+jEgDr9Lqvp3ctV
         4ZY+lN4CagNHq4tBreXGWL54SsiQlIwnSwequZOK9eR2Qdt7QNd2zcxr90GRGmZ3OaoL
         JZUW/sHY2N5yPzW2Filmz6MJ2iGIijm56k3xg8uvv7x8px/t7ig6AoSd/fFOgRh3kigk
         PBTV/k0PBVwq+bF07vWAFtSphp45JUaWWz+0UFClYKB0n279mMK1wXhr2USgYeFABWMk
         n2k0zdAct+n/ButgpgUtLNPZI4j/LU4jRb6vFeDwhmkdFcp4OueFhrI6VsZFuykR8xUL
         82rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=slGKjp1EyADeI48N6b5u/oGvMYcf3V24i9a3DsUgpqE=;
        b=q19P0v0HfcsahVg5AWJ+imoI8ezRZ+AwGUWecYsqMJrogj0g1oEYyktwXxREhpV/mN
         TgQaQtV3+TAHJRUfNGCR1USl3TGloguUhSWjsKZWeGj8rpl9cwaJhC+VGPPe95PH2L2A
         zEvN3fvFpZ1HqDGUcslKtKgIFDAlBVqtvSQS7rdl5zW+30XCffvaUlziNQOmhfbCOjxH
         oe83ptvhUpKZDy0a34wvOZwSBdq/atxfp0BBUbUiC3hNXmuruFEgCkaw4ZMMGUi0axkp
         LJBOJECakNEunqUQ0RedcMmNCkxegHbc22wNK+oAfHoAuA0TOe08l3igpyL9p7zabtfu
         92AQ==
X-Gm-Message-State: AOAM533Bd/Xfwb3fsTRVwUu5PiJw0/7ARSKvb+NbS+vrjRGnW3XPUedw
	XAggvRdM7cKOlMHsgELURX/+Hc/F6QqUPYy5GINfm3FeLGfqCw==
X-Google-Smtp-Source: ABdhPJwchBUoW046nLy6RdTfl8ek/G6rBzECrdzUaz/QdOfjuNoGIGjZn0jyaQXnvqwd63Hd/32pPbq6RulWCb+v/8k=
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr63651wrr.172.1644962518571; Tue, 15 Feb
 2022 14:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-8-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:01:47 +0000
Message-ID: <CAFEAcA_F8P9BVxdnv+hq+RYsXnyOgFX7PFqNPqPS9+OhxYD8HA@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] target/arm: Honor TCR_ELx.{I}PS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IT/NmqamwtpU

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This field controls the output (intermediate) physical address size
> of the translation process.  V8 requires to raise an AddressSize
> fault if the page tables are programmed incorrectly, such that any
> intermediate descriptor address, or the final translated address,
> is out of range.
>
> Add a PS field to ARMVAParameters, and properly compute outputsize
> in get_phys_addr_lpae.  Test the descaddr as extracted from TTBR
> and from page table entries.
>
> Restrict descaddrmask so that we won't raise the fault for v7.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
