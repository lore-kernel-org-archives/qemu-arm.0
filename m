Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4112191wrs;
        Tue, 20 Aug 2019 08:24:15 -0700 (PDT)
X-Received: by 2002:a05:6808:9ad:: with SMTP id e13mr423115oig.7.1566314655210;
        Tue, 20 Aug 2019 08:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566314655; cv=none;
        d=google.com; s=arc-20160816;
        b=dvbtCxheOdCLc3r02TccQRIgjx3G9GhfSMyYIb9WdHTrwyweJktXDexoWeOQU4AQUo
         EMLRdeAjnkvDIlJPWssCLpFrnVDCJtp1UkJ7xk9oJVO5OcZu96g+KG/yO6O0pUj7vg/D
         AJHOMtK4bo5X2vDQFHpgaNIlNxU9wP03AgaEnfvR0mBRCTKaEZejQl/FsUt93caoHawZ
         NiQcS34vpzJ/gHQgUBwN9lXMzUUleJEyeVKSW41DpY1kOIlm6YCev++TavOmSdTRsa+R
         L0ZCP+h6H2ZR0OG88EPlXnRfBcwqrBvnX9hmoKILriOJd7G/Va5pe2k1jhTyquBO/X4S
         yFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9/XqcEjqZQcCuL55U5xMT+H3aHbvN8Rtmrx1tXl80Ek=;
        b=Gx/zAP9eUT+HB8vcTrC9f5ZnDpJ70J4ZZPjWsWX+Wr2f/ErlHHzXyk0xpsX535fCBa
         XWWwbYRoATNB8Fbq/o9CZ/Pz0cTkS9Yxr2nfUotrvnn1pXCjPMTNBeLwT/eF8ahhXVD3
         OzvLsaCx+CSLczlQWso1eUr5Lx5RpMzVu/rFAYyL4qJL82vaPzav1TYoeEtr5DvkbJMo
         C5ETDzjHJIPzV/uC0LA0a5qlIm4R9M/kGcrEa6Kl6vXPZT8q6Z+RueSS8KReRYZ7GUsd
         DHQ8o/xmaGwI68JgKc5NfKhtN0U6za6JQzsz8MNMQoKWqyC9pt8N3DkPrD759E5SNb/b
         4CrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yz3DZz0J;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g18sor2127285otn.186.2019.08.20.08.24.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Aug 2019 08:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yz3DZz0J;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9/XqcEjqZQcCuL55U5xMT+H3aHbvN8Rtmrx1tXl80Ek=;
        b=yz3DZz0JdC2uvCvIGv8fOqN0hk3NGstvZ2WbD6HK1HO2y9guO4CktkZ9JTBskHZrne
         k9x1XWLKjX1/XYsT2gzDyxRMbVIfQNNydU/EAgv5Mg9MZhhIhMJzzicj8+SErrxk5Toh
         OtZxwrvm7+TbajbnEwdYTwisvgmdt2oY6STOKsQKayO2KVhe5nYk274LjFiy4qFPJadE
         3uX33tC402IrM/i1/lJJQbcfuDmB4wiOdlx/unaCKYpd87JwH1lDRBuAl1WoYXpWfwNY
         s1uhj811WwaaR4VBns12tbLhOl2k4dmgSHXtQhKD1T+E8AL75acU60MjbGhUCV9iRyUt
         XJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9/XqcEjqZQcCuL55U5xMT+H3aHbvN8Rtmrx1tXl80Ek=;
        b=OS+9x1v+jrXlCrg15nT3RhkgcjS+lq9zRCA73Tl+7Mf8ieXX35d7sObkX2XummNjNs
         uwQ1uAlGbjqn/Wa5g2jPExOlzOA/CT7qxjC6Z2niq8ZRZB9QpdiAxndQmiieP2rMB9KT
         oD9QHt6GZAlFsWELG65munPKegIg0xgg9f2XapuGY2u9isPoCftuHEKI6WtkI6HLeAVN
         /hW33PhkU+UfcKNbS9CaoXe/rrSuMUovGjrHWqzSi1PLSN7SsqtqEUs10WiT6HZEF9ne
         R3c6uXnVvHb27REfAOt+BJNjNJlspsLAJjIH7IZZEAnpgN9agAIiSjbTp88rCNqBoXkf
         m7aQ==
X-Gm-Message-State: APjAAAXZgS5xiNk1BPHjIbsmfZrEjSPzSvrvG+cx/AedUPDkvU8sluZi
	xxqMbYDnpz1Cx0FRgZdQK7C+U/sPiPV3LDaxUAlf0Yr1
X-Google-Smtp-Source: APXvYqxc3wwSjLKgrEPqiV3CUD8/cROw4+Q9UXhZRwUEYU6Onkz7iOWKKUQG04EsQCkOg+eruKFN8BHA8TGSEyaJsL4=
X-Received: by 2002:a9d:4817:: with SMTP id c23mr21414900otf.97.1566314654807;
 Tue, 20 Aug 2019 08:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190803210803.5701-1-richard.henderson@linaro.org> <20190803210803.5701-3-richard.henderson@linaro.org>
In-Reply-To: <20190803210803.5701-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2019 16:24:03 +0100
Message-ID: <CAFEAcA9bpnMTo1Z5yi9wGz1T0knqm_TbK8YJgfyW+Xm+T8NrgA@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] linux-user: Validate mmap/mprotect prot value
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: zHBuW3hYyciC

On Sat, 3 Aug 2019 at 22:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The kernel will return -EINVAL for bits set in the prot argument
> that are unknown or invalid.  Previously we were simply cropping
> out the bits that we care about.
>
> Introduce validate_prot_to_pageflags to perform this check in a
> single place between the two syscalls.  Differentiate between
> the target and host versions of prot.  Compute the qemu internal
> page_flags value at the same time.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
