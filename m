Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1806762wme;
        Tue, 22 May 2018 11:06:20 -0700 (PDT)
X-Received: by 2002:a62:1fc8:: with SMTP id l69-v6mr25335811pfj.49.1527012380200;
        Tue, 22 May 2018 11:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527012380; cv=none;
        d=google.com; s=arc-20160816;
        b=TQyfM4gKw7yve0EoNIv91Clkg6yFmWsKf8S9CSnEGFccCn/Pkocwfj1S5egOGu5tjJ
         UjXBPGnC4L1c9ZohABxLdKy5P1ocYLGd2Tajn/A0aU4jHdkYAULVXpaks1QH+puLOnup
         fnPUN9iLAIHRk/d9OuRptjMkNxs+KGKOynveQDyUAqGKxZ30eOvMjRWWkvQtAHbNBtFk
         yRLL2GlSgopHhjI/jsXrqk0y8d/dL4g/h8ibBQi3aJTXrfqm/v5iTQkkAqRh9rw9Z9Cg
         WmKWkOEKajIyNXRblbQ2cMwHQU0ac0NfB5Ob0nVh9mLzMrMsBX2eWhs8fxrz5OgOvqsp
         jalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=kVF90YaENbufVLOpnUwnkcNJZWzTi/3I1BatEHhIQoc=;
        b=J6tgsHpsWb/GxHBwwq/v+4ek8Uu2mQ1Pg4fvab8yjzpxt++a+/lS+lIllSGSd8f+CQ
         KrFXofQF5eDTnuebTQZWBp3Li0Sih/aMH/5I4SnCvrStL8Byvwim4PNCqyMAdGzgNoAA
         V3/igXZ4khjYCN/cayzFF3BLqZ/zI6jM34Pc4THy8ykwIw+m/ScRWIw/FHHpSMLA4peE
         v3e0hjhKD8ek19Wnfmd0irtu1dclUt5A+0trJWxWyIS9YDPy/IuFKLod/ov9DvtXtqPS
         Ikhn4JUMshdZDyjK5FSDfukv5hy3QgBQe1LbWMKd8P1M2007i9l7qmZZF12yzSvGnMcW
         2BFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gxk0eHVU;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t125-v6sor5176008pgc.259.2018.05.22.11.06.19
        (Google Transport Security);
        Tue, 22 May 2018 11:06:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gxk0eHVU;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kVF90YaENbufVLOpnUwnkcNJZWzTi/3I1BatEHhIQoc=;
        b=Gxk0eHVUn+vPQialy4FfCoSowCCGjT6ixAelE6Fz1OgvoCz1dD2UCQz2PH2F1FcFX+
         VRjSgmiCztiXRTbvkdDqFTBZAitihgM2tnTKOQ9z0ug2vNsj6DakHQUGF6jKn/jPrJoQ
         eFgs2sUCkMNEEdFMsjsTwU+cpg4Kdy+j95EgfVDYi9jM5f3imRwEc4T1/dGlkhoo4Aw0
         fV4zeKAqjtjO2mDmkq+Mqfdq38ZQTdVvO5zOuOp6FOZiqr9lkT0qe6VGgsiUyq9rljDk
         IRRJrU2mvWcvTCXeW+e8DSExY86LQ/t6RNvcWEkCNFFlJmdjSlq2yyMnL5ve7UNpyC+J
         vmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kVF90YaENbufVLOpnUwnkcNJZWzTi/3I1BatEHhIQoc=;
        b=BDKldpS1HWX2kHAPHKc5NzAe5SwGUAxWa7rwu1ceF0WZJ8+uKr52RS7qa/OeKSAQis
         7QUgYSwiIZzpQBz9u9Z1tjNZPcZgx/3V/MP/vPeJd24pQNXBPc2ARxfq927TEIeThk9N
         R3NAnhw/GR6lzTZkoLlV6ZZ9g9+PIdRWK6Cr8jHXP9eHd8z+8/gVgUoHihavvXTprs6e
         UoGRYlz45m+Lrwh/fYXLnPzfdl5joRQR8Ebi8SAOisE/ieD5m6/udH11ZUSv9ZI0UpMF
         l/ruQlQJ8FONT6y8HglkKrf/YHga3kb1eLiNdk3kUUwPOlJZmI7PgZBVek6nCov3DGLX
         vuHw==
X-Gm-Message-State: ALKqPwdiN7K0scBzbc07kmXSziSgNJxMRO7rVQ0L+JkuDtznsbjOdIkO
	b3dT5l8Ey9JMAII0QRuutLGkluL8
X-Google-Smtp-Source: AB8JxZreJQNcYrKFkNjKM2knMHUgsxsn8VG4cQMrAb9R4pnsTwIr3X+w8Ayv6ghKODYXdBjwccFBzQ==
X-Received: by 2002:a65:498e:: with SMTP id r14-v6mr19408564pgs.78.1527012379511;
        Tue, 22 May 2018 11:06:19 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id y83-v6sm42415347pfd.21.2018.05.22.11.06.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 11:06:18 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 16/27] iommu: Add IOMMU index argument to translate method
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-17-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <23332ec0-bf12-7e04-8261-533c52c3f314@twiddle.net>
Date: Tue, 22 May 2018 11:06:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 8UtI5qq9Wke9

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> Add an IOMMU index argument to the translate method of
> IOMMUs. Since all of our current IOMMU implementations
> support only a single IOMMU index, this has no effect
> on the behaviour.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
