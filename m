Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4502422ejc;
        Mon, 6 Mar 2023 02:56:13 -0800 (PST)
X-Received: by 2002:a17:90b:4a92:b0:237:50b6:983d with SMTP id lp18-20020a17090b4a9200b0023750b6983dmr10253536pjb.8.1678100173605;
        Mon, 06 Mar 2023 02:56:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678100173; cv=none;
        d=google.com; s=arc-20160816;
        b=LgIooRxHZdoz8Zb9Xxl2lCL8nOGrLb2WD0Nq2tAJlgCu6jy9c5JrbaaPWLZgQ1ylIB
         t8kY4zjnuKlTOlBfVVfLyhj3EF0TV6YCShARkzkZMFSgimiR9qGGJL1pgBKa2HhZRKYZ
         QvBPIIlAHBb8lrpflogbEwLUvVY/+8DEKCSj75m+MIpiGXA7P7eOm+lsEUd7mbqnmqb1
         5SPAKF8OEwO1xQgWssFEcdJ+gekBpyKD/ooVey9PvPNANtdD51ArQDyWrOiyr24d7VIQ
         uoehh73I4Sy+8GovdboxMsgjcwI4dR8S+kIuU3+iXrgm6sQGjEf4YX8SUH/cJm1aoyTl
         x5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6+WoYORE9OMrBiSUYAnQLFIV76lFUiJemJwY5hzx2c8=;
        b=GAqhGyKTD6EfhpcyHu6i8jqXjYbxJIENPp1AIECfN/DO2/AkQ3kkl6+A5cYfFM6Du2
         9qMPYIBEkpVjOJ+LYW9fbg8WW9EOzMNY4BmTlOhbLNehpieUN9fXuqC9kgMDPenTwTrZ
         CPfQdkZoTBU/NeYKbBPHFbAm8atrhiGloZrGb1/l+/lv3h7oU9Hhs5KzjpW25uCbg78a
         N2tLh5Ox8gP3zc7NDFtAaWDqpwDzm47rUEOMrbyYa+k/PXafXYZ7SIYiHRJSyGaEZ8KS
         FLjj+SkMDEnNuoocX22DP+lgffCnDiWVhEQ67eC2NgTZuwvMp4K26xybMcsnQF03i+yJ
         k3sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zP/OAoG7";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d3-20020a17090aa68300b00233d8af0841sor5115861pjq.33.2023.03.06.02.56.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 Mar 2023 02:56:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zP/OAoG7";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678100173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+WoYORE9OMrBiSUYAnQLFIV76lFUiJemJwY5hzx2c8=;
        b=zP/OAoG7Vp5q6gaNv8q8YGgfhpLYHkbeUQMaVIuEolHyYKThc7F0M7WyonthCsjA6F
         GQ/p8qhRGlETfIVWL4Srw+VaTkE3z5LBA6l0doox8zyVBUgaYCe6pZEHFuHRfLknSbPG
         abfa6UGuGCRksu1ftCkHfOID2/p8vCPYTtA9yaJp9CdCfYgFqWWeryv+iwRIVImrTWpW
         arve414bDeNDBpSg3UspvWlYdvXcU7iYQ3oBjcJ6PlOaEdQ1qlLyMOnyAgzpGcIo98L6
         9zp0R+EG4EztxFIWrIhO7brO/yoQnuMtP3aWyliZh4mDoR5B4btzuO4jwdE+rOTpe+a2
         cboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678100173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+WoYORE9OMrBiSUYAnQLFIV76lFUiJemJwY5hzx2c8=;
        b=3C6ghilIGnMTMM4EsIBRTKmk+E3b4rIq6xyhLLJsa47XcN8f9mcfzuE7MEmtTI09YX
         RRgZbEHEerv+LtMYI6+N/B/Ow3sVGvY2z7z5gIDnUP8CTwz25k6wIpEEmUY6kCliad3t
         lPUNDUKftBZG+UB0iyGZxH5EG4AoM0G/jlEi0OR93uqR/LciP2ZIIVKa/LhylG3uVUrD
         6UwmtY0qQUt5jqRUJXcfBgk6+HCznyhN06nQ2OxE3Pwd4ZozS78HqW/b6Hm8V5MwhqGD
         Qn7tk0Q+MGukPRYiwjF4e9thFwRyg/0oGd+DWZq3RSY5NsDAvA+xbpTZK0oeeGVNwL7k
         9YAQ==
X-Gm-Message-State: AO0yUKW5omTO0ihcc/mejsX9ClAN9UHCBKNNvTd1HJXJdUK7z5aczgwN
	QuKV9usX3BpAVTgGiV6nlTs0zCjPLgtkgOWC9mfEOIXmK7YOaoU8ITE=
X-Google-Smtp-Source: AK7set9+yutBX+OqK3KGkW5gqvHtNOjzkIRwTukQYFL+fFCA4XEfEfa1Na/z07VLIUzGpR7+ZnlTIXqg88/61jvQUFE=
X-Received: by 2002:a17:90a:dd86:b0:233:be3d:8a42 with SMTP id
 l6-20020a17090add8600b00233be3d8a42mr3674365pjv.0.1678100172949; Mon, 06 Mar
 2023 02:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20230303160109.3626966-1-ardb@kernel.org>
In-Reply-To: <20230303160109.3626966-1-ardb@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 10:56:01 +0000
Message-ID: <CAFEAcA9v5QsPjt3u8SrXx60-5KXrPRrOcZG6DnnA=hknMHvU8w@mail.gmail.com>
Subject: Re: [PATCH v2] hw: arm: Support direct boot for Linux/arm64 EFI zboot images
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: A4B0H0tt8npT

On Fri, 3 Mar 2023 at 16:01, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Fedora 39 will ship its arm64 kernels in the new generic EFI zboot
> format, using gzip compression for the payload.
>
> For doing EFI boot in QEMU, this is completely transparent, as the
> firmware or bootloader will take care of this. However, for direct
> kernel boot without firmware, we will lose the ability to boot such
> distro kernels unless we deal with the new format directly.
>
> EFI zboot images contain metadata in the header regarding the placement
> of the compressed payload inside the image, and the type of compression
> used. This means we can wire up the existing gzip support without too
> much hassle, by parsing the header and grabbing the payload from inside
> the loaded zboot image.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
