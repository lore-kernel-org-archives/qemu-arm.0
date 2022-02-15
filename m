Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp611490lfl;
        Tue, 15 Feb 2022 13:52:08 -0800 (PST)
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr690442wrr.403.1644961928241;
        Tue, 15 Feb 2022 13:52:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644961928; cv=none;
        d=google.com; s=arc-20160816;
        b=TxBQCKf6aabbfCpfg/XwNjE/XYJ+jlFMEVph6dO93Pbmn2vwcMC3F3Aaa/pkaoPr/m
         UEXfcFeDdIxLAzzR7FiyS4zc8tax+p48l5zHuZjYzep3DQX7rBZ9fr6IdXI/C73NNE23
         6e4lvEPA3AGV+sNrp9/SIABnHazRblyU02oz4Du0lk2AKUlSGFtN5kTjp38ep/jdgctu
         D2Er1wrlvoNfQBdRgTgamJHH70NBF2YfQ67MuYeS0cIBAqHGDPh6R6Y+VHD6gm+hgG9N
         TpLOyUZXDJrlChbXOI6sYmAexBw6nulinr4R3C163OAxf75Zm1v+3iT/HPpdbUoX/o7f
         M6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T07S4JHhtp008CEFdV/z8mu7sXcuQjmjrMpL3M/sk3E=;
        b=Pq910kiOWo8HUYYkbflJrKTrdgLbggNL4wEfvEHHJIZjlFZsfZdssBsLaN2+m52++2
         1tMPjCYUoqfCwrcJwu/4uNvaGaG8x4xyHmF4l51bXYUM3GvkY45FTmGiKuGXVBvSmWCl
         vPJD6RQxHM4IQn9bD4JTfd+hx3TjtPgJXWN1w1OS69prJzSebiKXzIJXewZja7YRnU5T
         NEjGNdqxhD8QXLKLw2VQZph+tZ61tgZZs0Eze2fsWq1AubEhwi9IWMQEZpQ5i5e6fVpW
         RNsH+XSBqtoUu3vfYXLT+nr0v97B4hNYkQ5sOWIbsDWmUWvyWs9dy8r64t/arhpNBOSd
         5odA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EOS1zmsX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 13sor5082808wrz.7.2022.02.15.13.52.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 13:52:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EOS1zmsX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T07S4JHhtp008CEFdV/z8mu7sXcuQjmjrMpL3M/sk3E=;
        b=EOS1zmsXUXOWj20dnyzgn0EfdBJZ5Fw5+T35RRlqxajcnyEDr1kguR6LyTpb3lYO0U
         DM0BeR6h8D3NrUSZkkjFPVVlDg6I/D1HLkoEkB63/HjFYc87X4/FrMW2jX/dxp/atc3R
         2DPHbDlVNQ54hixwSDw9Q+rAhm6zJa4Ql+38PebyIsnQUOedOistfguSWn2wHWuurNUb
         bC8sTiDRdzJ3jbHD0f6kykl36GAvjouvMtskhE1N/TiZwCGpEDzvKA9fGK3C4pE1Pkx3
         u13ADx3IPm2F0gkHiEHYsZLdP4gh9t7yKEH8IwiDQOHbHOeyx2eyQgVZGjtEK092s9dN
         VXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T07S4JHhtp008CEFdV/z8mu7sXcuQjmjrMpL3M/sk3E=;
        b=c30I41zD2T0p6zZRKkbCx3ckBx2knXfNnKxkRwxvgmyGlrTCBwTZawL68aigDYHNgp
         uM1TlBufe3S8q2+gLA1hnvdsSostVuE62WDuIp2wLMvWLUbcNHj6+30eo7zVzm1tQZR9
         cNiDABhni7lZXCNG7VTJc/t77Z6tWcd/4sldwpM/MVh0XafbHHN1AZwKd7yrZHjrxFa+
         fVKXkl6NwXbVaEPsiByPfOkcZv22KTnTmP9YmC891r6hHMhUZWHtGOOk5WF+UimM/RoI
         UpdROEzdFpgasLFqdWD1qqh7MQJZo0CoR4OOBWjN7ST9mYvx0lM2/BFpw8ojFgvNb562
         YfRw==
X-Gm-Message-State: AOAM531lU+3ejk+ij/K8aQ16yoMne78m8Dze9pUxIO4JZ2fbbbFiWwck
	VRDFu+H5LEmV+Vvc2TMiv5cF0k+NVSGity3DGCSimxzZ
X-Google-Smtp-Source: ABdhPJyIgODgzgCYo5XBtTD9O6/9bnf7/2/8LieuUZxaOrNZRr53K2hXNKLSsrIJIEhinJsMK9NkqDVX712ZRaBTmFI=
X-Received: by 2002:a5d:4534:0:b0:1e4:9d38:2d4f with SMTP id
 j20-20020a5d4534000000b001e49d382d4fmr57174wra.2.1644961927988; Tue, 15 Feb
 2022 13:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-5-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:51:57 +0000
Message-ID: <CAFEAcA-4+F9uv-tG777tqZo-k1d6dg_NhPdQZ4cChTKpUT5TDw@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] target/arm: Move arm_pamax out of line
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZijjayKmFuyX

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly share parts of this function with other portions
> of address translation.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 19 +------------------
>  target/arm/helper.c    | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+), 18 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
