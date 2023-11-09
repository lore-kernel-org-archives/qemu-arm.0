Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp704551ejq;
        Thu, 9 Nov 2023 11:30:01 -0800 (PST)
X-Received: by 2002:a50:ccd3:0:b0:53e:1388:cb2e with SMTP id b19-20020a50ccd3000000b0053e1388cb2emr4579647edj.35.1699558201384;
        Thu, 09 Nov 2023 11:30:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558201; cv=none;
        d=google.com; s=arc-20160816;
        b=MESuDAkmVnWEi+1tjhIz5b2BEF2K0vd5G+Cs6BrsaVPxIxFXio8v/5wJMXZ59Cplyg
         h0Kd/CY6igfDJ1JiEyFDfJaLgtAR4agW0d4+/PHo5jfttbEv5trTgV5uDVg80yQe5EKC
         n3YOhyGwCwo/gNO3TRkULoI14CLGUDJ2fqDd3dy2MwMCvsthdFdcl+M1W5hABkcht3u9
         G1MKQGqlhr0t37HWWK14a9qtFhscJbe2hEYZQAZkS5s3N3IzBU2eOv4nUvc6hYNbL0MZ
         a52IzOD1Re7flT9y6e0xnKNEkqmX/noY41I8sAY9WY2cxbAcm8TAkOq7Qng2KPGpC0zU
         SV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0olOI3obuspQaQ5qJvTgrsHdbBeQUPijH6bDalbEkU=;
        fh=P+Jxe+ydfSl1cP30TqtBnnQeiBkeQtzeFH1r/b1mTHI=;
        b=StEzJol+i9/YQSLE4+fRY+ZtVMZxaQltQuHYzsZJmBRGMlqgNRiPnl50eo960UFIo9
         fokCGHMFl5VOgkeUXZnvV/I0/C/6F+sEcOvH9XDwkLo/fQeY4WxYAgy02fssaspS9GVa
         ueGSfByj1RS6p+GziGmU7aXI5wAnnRnED+0IbVackGEp5aXNtJLCWG9Ph1iBzwpcRuV9
         u+HHAkNWX7dxjXnl+yHfvWT2DXRUvhdZ3l4mI6qer6VDwp9Ulew9ZvxnHlHnU9sGKfI3
         Ceg4YGhbhepNAfQjfnpMmYftcKszMQc07aSoBTXT2Fpae45Z+dPZ8pWXcLI85fw8l048
         aUQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVTpf4+M;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v26-20020a50955a000000b0053ff91b1ae4sor4894653eda.3.2023.11.09.11.30.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:30:01 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVTpf4+M;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558201; x=1700163001; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0olOI3obuspQaQ5qJvTgrsHdbBeQUPijH6bDalbEkU=;
        b=EVTpf4+MCzZygH/Y0PDwjjkLjRE4oB3Im+E3QAgz1VlgiDR+tmBqbVejHyYx/rQLUM
         D/56iMU8gGvaS+P9d81BwupE/+56LJ/8hgvD44G2h++uw/kOw0D/7bANmAiH67//toAC
         yuh7uQ3Qbmw5w2iLpw8Y6VuWP1UEkZDqeAcDjZfaA75PGd1A9NlNJTN+N1V6omZrgAsY
         9xkGA+UCv43LaQ6jZwA9NcBq82qH3xlMv/fSEwsmAyqm23RTkBTNRfRyECke3wuLLmRB
         RmhhNEwL/ztH+anR8v2nSxSSz/SeeY1N/b08gbhv3P4iJs1zrSYPGvr+lt2lMgTii04z
         TAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558201; x=1700163001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0olOI3obuspQaQ5qJvTgrsHdbBeQUPijH6bDalbEkU=;
        b=CVdOASJ/d42DX9lvb0otWhUoo1EEgDwqKc4i81GFUfIdOE7TOzHPxYztJb8RGpO5wc
         2KuUMKsFAOLklxpPmti8oUsa2wkbdYCA0lU727CFaKU6FmUfsQt0geG0GG2Z21sDEp0n
         HPI8g5/UOi6owl9oOg14QRdB9qzjncd+ezdMRkIV3AhjILiPZvkJ5SsZm41KJQHRrV9l
         CNUe9oL1tfXCrXe3He0DnxeDzguY9Ce6stioduMjxW3h0gqkKkqJHf6BoPiBH6elOtTv
         9RhiFQostP7T66aWnEfmZNNRlTyh+uhJf/hwlFFPYKHTUiyUpRBHetHDvYdez8JTdoqb
         abEA==
X-Gm-Message-State: AOJu0Yw14bz6SL1eMh3aVuilxsbE/vXgDELMao7Sd7BmY/BNJ9yX9VK5
	Rf1dAj6CuHoaQp/WO6rEP8Nm9VXpyRLY9MvlRyFA4awO
X-Google-Smtp-Source: AGHT+IF0WN3Agxcw6IxAAduW5qi8H2p/Z4lMVh7PpfuceKoAuD9wRTGZWNVy4m4M5cJ9poVKFI+XV2UkPeUeDspDKrU=
X-Received: by 2002:a50:8e59:0:b0:543:5b61:6908 with SMTP id
 25-20020a508e59000000b005435b616908mr4970633edx.18.1699558201016; Thu, 09 Nov
 2023 11:30:01 -0800 (PST)
MIME-Version: 1.0
References: <20231109192814.95977-1-philmd@linaro.org>
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Nov 2023 19:29:49 +0000
Message-ID: <CAFEAcA8MJeX1Jk_-ONP1nNgHYadL7Oa8P3jGQXwNoofQnJWk8g@mail.gmail.com>
Subject: Re: [PATCH-for-8.2 v4 00/10] hw/char/pl011: Implement TX (async) FIFO
 to avoid blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: vk+kLwdTBR2K

On Thu, 9 Nov 2023 at 19:28, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Missing review: #10
>
> Hi,
>
> This series add support for (async) FIFO on the transmit path
> of the PL011 UART.

Hi; what's the rationale for the "for-8.2" targeting here?
What bug are we fixing?

thanks
-- PMM
