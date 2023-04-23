Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2174266ejm;
        Sun, 23 Apr 2023 02:15:52 -0700 (PDT)
X-Received: by 2002:a5d:4109:0:b0:2f5:8116:6453 with SMTP id l9-20020a5d4109000000b002f581166453mr6771168wrp.61.1682241352027;
        Sun, 23 Apr 2023 02:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682241352; cv=none;
        d=google.com; s=arc-20160816;
        b=p86HuZ9onTZmYFEXJx2CAIsHLHmF2X+1sAxrThjrXh7pY571HYWeh1omKJ/CF78lVg
         Kx30/GLAykt1P64SYgdxd+NFZ/RXyaQhdiWGt1DlpFqy1XT67JESs/OIwrWlMMYsGGrV
         CVlwxDd/o+fNvqc7JvAr3pSYGncpH3ymaxW2GfiCUO7y+TLfcSR9im6APTad5LmeBFJu
         Nq+YzNoSNtza+d716o0PGbwH32tj+XmuqN3dziFF8iWvv6omDo8NfdxCUgvno3RuqXpN
         ZnbF2D/v+wTlxPKnBtpkCO/ToinfSPOzGF62AhOruF7wt22/4goCwr+P0FdJRnaPOLm8
         B4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yPiT5LE+veZlStzegaij69CaOiLEitibVVYX2yKR6a4=;
        b=KCTJ6TQmYtOiyCkRyCVzgTrlAYMKCrKwbrzht9DdCcd5cztaSHwl3+UW+Jq9oudja3
         9qzECz6VE1pHaStMj9IfUa11Pr/mUEZlSTBTZvjJLkmwk7rcVjI6E3M45bwisXzuNTgH
         LgCSiTGsL5B2ubFXY3vkkyiBZ/bdT1A8V3G61FQo4uuzwc4go3qILT/9NmNDgh2ZadCE
         TjW2mSDE9nwLTWg134zUiUeD2J0SET1rcvSDufFx6EvgN0oRZXoZLZxufTIjyempXuiA
         waIeWwd4K/KGOdMBWYvYpWXQHswOKXwEq52aL7wHAPeSt0G9XbFg7OKehFzQyDruNsRG
         9i6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4EAAIrH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e14-20020adfe38e000000b002fe96c1848asor3249762wrm.3.2023.04.23.02.15.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Apr 2023 02:15:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4EAAIrH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682241351; x=1684833351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPiT5LE+veZlStzegaij69CaOiLEitibVVYX2yKR6a4=;
        b=j4EAAIrHq7tGjbgGTrjHz14fxr4JCC1wlTqeZVB6qR3p1fHdzAPdzHbNS01bhtMXI4
         Zh/Uxfevdjx5rR8jknFFHAHWgzqKNB6oz0EcQpyczQ+6VXNr48lzKoCU2/r3Mc0YuH8G
         qIDTOsG1qaUzKn895OBSo8+mFlgFUzbTwILyH5VPX8J1T2rngwIdLghC4PTB19AEQbkb
         ztMG3+0YWTbM0zyYDDI0RZwOQynILQVGP4mxf5dI0iGEa49hGgFBLDW1LqAnt6Y6Hsqr
         4Ij4p62VkpVE2O+lqnb8cjB53pxkikf37NRC9itK8F2POCIQw0UQtaOJp7+eh4G/qwKn
         8DAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682241351; x=1684833351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yPiT5LE+veZlStzegaij69CaOiLEitibVVYX2yKR6a4=;
        b=ao9WlZCVd6ZSH5/nNeMQx2dbPaLYU7CyvXzi4pxO1MZjeY8jFB1+GAskQ3geXzgGDb
         QbTlxhXjoqKcthE6hc4FHWTlHo/rEHVAS4FcTo2ROtOiq8YqZgwYIuUatj069Re8EYt9
         0OGGF/Bg42zEZWKc9wgUrqqeGr/k0z3z+UNTv2o09un8x6oqcGNfUYOpA2hiSza51M42
         hKSwBAoTy/TEtswGdPXA/ANn4mnIr1Z1zKMYhB/iyg7WqlH4MSD1Jf7/RU+yauh8uKTq
         Vpyj0R3PykBoWynriUY9al0XRZOWV4BLcMR9/6BwSYx5PshcSQZnIYRgtvGAX6a8/Gjx
         peEA==
X-Gm-Message-State: AAQBX9fPP0ocXVnv6Gds4bH/JIh823Xik3qhSQMLmMWGB0MM4paIEmB4
	fUgRrDoK88/hngZURQcv42Snu7Qym63Nzhhjit4b6cRV
X-Google-Smtp-Source: AKy350ab3abq/9H1rb8odbHZ2EclKPlMk410+3Gro+MmfdzprB+mKuB5HG++sd8XjN3k8OFdsFMqsQ==
X-Received: by 2002:adf:f98f:0:b0:2fd:c43a:b713 with SMTP id f15-20020adff98f000000b002fdc43ab713mr5911796wrr.7.1682241351696;
        Sun, 23 Apr 2023 02:15:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
        by smtp.gmail.com with ESMTPSA id z19-20020a1c4c13000000b003f173419e7asm9113533wmf.43.2023.04.23.02.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 02:15:51 -0700 (PDT)
Message-ID: <4c3b0a36-572e-cf12-ea4d-d07a44f99a40@linaro.org>
Date: Sun, 23 Apr 2023 10:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] tests/tcg: limit the scope of the plugin tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20230421131400.2750123-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230421131400.2750123-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: L3rBI6cNvadB

On 4/21/23 14:14, Alex Bennée wrote:
> Running every plugin with every test is getting excessive as well as
> not really improving coverage that much. Restrict the plugin tests to
> just the MULTIARCH_TESTS which are shared between most architecture
> for both system and user-mode. For those that aren't we need to squash
> MULTIARCH_TESTS so we don't add them when they are not part of the
> TESTS global.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/Makefile.target                 | 10 +++++++---
>   tests/tcg/aarch64/Makefile.softmmu-target |  2 --
>   tests/tcg/aarch64/Makefile.target         |  1 -
>   tests/tcg/arm/Makefile.softmmu-target     |  4 +++-
>   tests/tcg/arm/Makefile.target             |  8 --------
>   tests/tcg/cris/Makefile.target            |  3 +++
>   tests/tcg/hppa/Makefile.target            |  2 --
>   tests/tcg/i386/Makefile.target            | 10 ----------
>   tests/tcg/ppc64/Makefile.target           |  2 --
>   tests/tcg/riscv64/Makefile.softmmu-target |  3 +++
>   tests/tcg/riscv64/Makefile.target         |  1 -
>   tests/tcg/s390x/Makefile.softmmu-target   |  3 +++
>   tests/tcg/tricore/Makefile.softmmu-target |  3 +++
>   tests/tcg/xtensa/Makefile.softmmu-target  |  3 +++
>   14 files changed, 25 insertions(+), 30 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~
