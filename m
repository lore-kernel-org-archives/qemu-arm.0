Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1858248njb;
        Mon, 29 Jul 2024 08:39:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXVKzphLFK8IswNDPDjiBxxIQOAR/9NeoJWlvM81w4TJaTqMWr286UrvBVx0lNkLB7e4sxrmP3i+o0BQCN8VFlh9n1GM2q
X-Received: by 2002:a2e:a78a:0:b0:2ef:1b93:d2b6 with SMTP id 38308e7fff4ca-2f12ebcaeb4mr57632341fa.8.1722267563872;
        Mon, 29 Jul 2024 08:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722267563; cv=none;
        d=google.com; s=arc-20160816;
        b=ObENszb0cWjK15F17ybc2tJS2StBc7nBui/uFRKs/Amo6czKszIs2QXt4r9Rue69TP
         Zorsqh2W31xgsHBpvMAMJbH7yvV/sGUoDOiuCMkb8M6KA6vnbOpnAGhXul4Fg8//pHmq
         QxDYVts0TPODfzSORb/Z84JOmBtB5yodDX2vqS+ljVMQpTWK4JTuH/yhttA27tUFWkuA
         RUKYHKr6cakZCU8C6CNkWNU3pQKjOWWmHmKuQTQNhexsDyoyuluME+Q2eEU1PeIdYptK
         Us0eDP9WnWll2FZXtKt6nNduClVZtw4jNisz6Iv3s2y6mEU/Go51Vg6pEDOXFA1z4jN6
         ZDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UAaECwIohdTcRxD66PZ+czjrv1KtXk3qx/5j9/cG0yg=;
        fh=Sa6X1z/cw12ymCj94f0KD42x9XG9FNcaeSnSgDqSUtY=;
        b=iN9vw+caHKbk/5478+RZbERR3iQc3x5/Lce7VkvY8xG7QKnpeUrcVYyiv4YFpJQKy6
         lJUkHQJDCKm/TCIRqQmZBq0B6RXXBSWUrlVohkDXQt4kEUMxD2Fzay8BykhppUdKrWRD
         iOTN8XlU9ABFlelcpFHV3e2HXDZ3zWTjQiPslLTuJxYUW/Bx3ZrFne+wT7n/KWOAOpWC
         +vAdCs/hbNaHXnrq5xZTrtdCCrQ/Vi8vbitOiyCdptcP4afZfQm/mYNgRE7rS6GfssfO
         YQxYc2kR1hj4+TpREwRg5zTFs+prL9R7tmNl1Ca/Jub2hejy+iLyjLW/r0mJ0pl9nVVA
         TeXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zb2ZrMK3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5ac687063b3sor1554098a12.1.2024.07.29.08.39.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 08:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zb2ZrMK3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722267563; x=1722872363; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAaECwIohdTcRxD66PZ+czjrv1KtXk3qx/5j9/cG0yg=;
        b=zb2ZrMK3AkzmbRC4xVWgfgLT6e+w52JqHcI/RYyevP+/McNC16I0wEIDqauRtDy9f9
         ODVj2Am/BM8q7bgtLps1Hc/YfUhoAVYn5iZstupLXFFdQW9+v0quuTrOkMGx3bugpAcN
         5qbFqoSFQSuHx4taV3arOUYYidBmAmhTdESHHZhzvjW2yVTKJCEj6HAvIqxOBaUxFcgm
         7yFEQD6bzUD2Ct56EhNKFESCI/xegjOzXxwVS05QKTCZekamWdb/eCn2PsaldIObyK3D
         AniSkixSjAmjBC2Yjoy5WQYKAhOO3tKYrM4OJhKEuH13sFpESCrA6UuNr+JU1h3YQ15X
         IS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722267563; x=1722872363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAaECwIohdTcRxD66PZ+czjrv1KtXk3qx/5j9/cG0yg=;
        b=EXL+gkTgsph07ZccycTrhYMUTCNa44eR9zkSF/6UYhh/XRiS3OeHthRnT/Jh1LYlLB
         ar42WaJ26Rw+szFPzIYXJBu9zfnt9K3EXE8ULi/sDDEvAhwTufltc5P09+ZGKpJ6xH3O
         ZeafSJ6xgXovHrfkIBUMM50ZnbQ83/BXZHpZ93wEe1SpUefLxiuUabrQZe/h8pcY+7+B
         LxLOhWjuSvVvvOr/6zjMDd+FuoEukJP4CM30G4BKe2Zh+bN5TfCSQoIU/gqkqW4GddIf
         JNjbBvi0p/5RY7/G5cwSN5jdQmi+4qx4jW9bVsJk2wxQvlo1g2WsqSUtALHCHEUlQLdC
         u2WA==
X-Forwarded-Encrypted: i=1; AJvYcCXHZ7Jumc7I4V5bHtJSO2hHTEbPvHSovcRDTMZSsid3rUoNcgyfLVNP4XjJt6RUFPsaXjsDin60w7/L+9sXW96RAZvb1PQw
X-Gm-Message-State: AOJu0YyAUsn7QsZJuBfiLqQaLjPCUPkT4NZTCQ083c0SrVoUTjK9Kxs/
	0lIAsohxIPzeBHNcnTBuZ5Qn5zxXY0FK94sXCJunoQaO88cy08qggLNo2le5bFbJ0r3nPZFuHdl
	LWa+gUgQe1vUIt9FiQUAX7Vqqc+Xo91+dT1L+ZTWW
X-Google-Smtp-Source: AGHT+IEvL2Qc9pTW+fj+dQlO/Isk3veoaCARkRDeHTnlRC8QCGCk8hGQ2u24cQ6bjPbE23yN3hEFf+UIWF4hOjtv18E=
X-Received: by 2002:a05:6402:3481:b0:5a2:68a2:ae57 with SMTP id
 4fb4d7f45d1cf-5b0225c52f4mr5591102a12.31.1722267563299; Mon, 29 Jul 2024
 08:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240719181041.49545-1-philmd@linaro.org> <20240719181041.49545-3-philmd@linaro.org>
In-Reply-To: <20240719181041.49545-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2024 16:39:12 +0100
Message-ID: <CAFEAcA80FOgY1tYDeG8DnFwwvGkXyK=tqi4AdGj-53ef+uJm3Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] hw/char/pl011: Remove unused 'readbuff' field
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Tong Ho <tong.ho@amd.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: VVmeqbIjtYhT

On Fri, 19 Jul 2024 at 19:10, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Since its introduction in commit cdbdb648b7 ("ARM Versatile
> Platform Baseboard emulation.") PL011State::readbuff as never
> been used. Remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
