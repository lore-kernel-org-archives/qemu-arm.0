Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp68077njb;
        Mon, 17 Feb 2025 06:25:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUW+4FIiDMRrek54W9TktHtxEWscZMsF0OvIP/y1hubsZbuY50/5xI/sxV2PaO8rpJq99uyuW6ldeCu3w==@linaro.org
X-Received: by 2002:a05:6902:2204:b0:e57:442a:befd with SMTP id 3f1490d57ef6-e5dc91f5e7amr7347851276.32.1739802326910;
        Mon, 17 Feb 2025 06:25:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739802326; cv=none;
        d=google.com; s=arc-20240605;
        b=TfQ1uLFtCUqOAsrkzf7RcN24VTNEFBSSTNDUmZ+QzxNVhbwJrSPnBZTL+MJtJDOZRG
         buoR0ZljwZEup4zhfoI5VVtKBzB+pjOkmExasCucnqsw+4frGAWLr4iaYv1utzlc/cAg
         muDmAt+mUKKXcmVY1SjQLrr2CkhEtjfx8Btu/njfEm2kaHVoFhR9wMGxZ6nQMUEhmZoD
         wx5soxAUarBgVkXwVbW5hXcaSw4f/Uiz/laPpdRmzp6StPePP57bq4MjdWurLYM6596V
         +BiN6TKyBHUoXH2IY4AIOJTLrrXdsdVUXWSqq5qOunHH/rFhFBVj2KvZmZ/zz/1caC0d
         mAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Klwl8j9fJtwkONRCxBfElOiHGMV6PR7z65Grl+CdRR4=;
        fh=kkZKPiQunOax3p+E7hwFU5UxgGeAW3By8gG3FLWshVM=;
        b=DOcqd8QhRxF8WApJpjGNyeyJMIhRauUk3KUncV1dKrF+SNTyKiG2YWAWjnc2v3Veb5
         kumH68Ek7TSlidAuo3BX1mrIbyq/Ruu6jG70waZU6QiEv+AGBdoqpkApM4jcuWHUw6B3
         WBesEd5QVvjmFZ519fEncCfB8sDWR+/LIoRd7hp/v5mppErSoUVKsN0wtvxqxx1QYHjN
         AVcvwHZZVsg4qm4n7BSswz8XC2pSAhhi41HZnNFbEBoE17N4CEffFsuu8EWF44TA56oa
         L0nvN5zgcvwPVpGlg1mjKf1paJPSuCjla3OwnnU2749a5JR37/9j+zbvHjYXQ6zpz2KR
         gXkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MLeFZS0C;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5dae0cc131sor4381592276.12.2025.02.17.06.25.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 06:25:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MLeFZS0C;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739802326; x=1740407126; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Klwl8j9fJtwkONRCxBfElOiHGMV6PR7z65Grl+CdRR4=;
        b=MLeFZS0C7GB+cIgmSVk9tI3S7RuMARxGEEgyPzw2CvTmCQBf+eDkNyqeS8B2OOwaXW
         NuEC7xq5Xksk0RquGKlqqIqzEX99pt1W04jAPM6pLKX7o1RNH9X8X2rqdvJx4EgOpSBl
         TmFWpHM61gKHtG72kuR4hPz8Scmo6VF/dAvbn9N+z3+nZfQET4kEZuo/hSw9vLtkeyoM
         76khsNtfAv/60Stdk14YUOy6wF+AJk65zuIy2rKsKLnuTKyjRsqDdb7Pz/d9POKiviF/
         I5hsMJZ76YlrY3LWlZRkrUcpQQ8k+sUIXsElu9lxCCV40/HStxynsy6tliU1PyEHGiej
         ES6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802326; x=1740407126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Klwl8j9fJtwkONRCxBfElOiHGMV6PR7z65Grl+CdRR4=;
        b=aANmoVLep5NHtvGG2qFoCuaQANuoIoZj41bPa2spEjdcgrc8AQ2hjsBDbmZHLwYanq
         BJQYqjsRoQxfY+zcMQNJ1l+Ob3ER1OD3msLiqlpHSb6wPomLQtdMTFO8/hFxlAH6sG2r
         KWLrArrKnpPmMftQe5i5cQtaN9PBPvDfYhkgu7BEdRPOXh29zIuDxly9Pstwd3RoGswk
         h1+pts9+MQWlViohHPHYXxS97/ZEoCniX2zTAMcJhdN34/nfwbrfB2jUyv43dhhRWW6K
         Ba7NPFOPxQ2tRYoacpp7UZg/QrCGupcDrJ1iqebJx0Vkc+UX4S0Gt2mc+M7z+bQCe0Le
         xGZw==
X-Forwarded-Encrypted: i=1; AJvYcCVQbcbHYqLfI5Z2MP7Ov2pCrUZo60A9VSh/MBCSRu0JBtc8/IHfvqMCGcl72dh0Fzi4Ayd/Z3zoXL8rag==@linaro.org
X-Gm-Message-State: AOJu0Yy6ZVh4oMpZfhov04AxcXpYeXYWqBZyOluPqcZ7xxZJ71QEr1Rz
	b0hTeSb5RgJfRpuk7oLFrRYbTYjt2OTK9pyPjRHJJPQIw5/NVye4mutcGv6IOpfFvjwCQaKI2di
	8sKO2qGzmoNxS/rs/fvVSCjfTQf9bGAJJNxE97Mgw
X-Gm-Gg: ASbGncvbLeqIdux1fK6OVP4EEz4GrPnR4Vs24TWl+ViZ1ZaDAMA0rlsEI+bp+LxuNua
	09lgJu4nTMlqhzcr4n+5xR6sshwSoD0CxQGjp5FeKBlhM7jJOIOXjIy10xdEoniSVIRp+XaAMCQ
	==
X-Google-Smtp-Source: AGHT+IF066er0vfriODEHWb3kxBnFTDlASVw6mNlV0HAvqB+v8oCylhFxZV8PzuJLgwusY25geOgfLXf9pg0YSW9mk0=
X-Received: by 2002:a05:6902:2204:b0:e57:442a:befd with SMTP id
 3f1490d57ef6-e5dc91f5e7amr7347827276.32.1739802326579; Mon, 17 Feb 2025
 06:25:26 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <20250208163911.54522-4-philmd@linaro.org>
In-Reply-To: <20250208163911.54522-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 14:25:15 +0000
X-Gm-Features: AWEUYZlBg7uVbVWyBO3wgSoK3No969-zQetpTIUZtucNNe9zc3mPEJUzIgm0fdI
Message-ID: <CAFEAcA9iKwXEWNFBRQvVny9ZgnCf_VHj_PRtyKBa-WFG-U0Rsg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] hw/char/pl011: Introduce pl011_xmit() as GSource
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 38Z1uCbfHRnS

On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Extract pl011_xmit() from pl011_write_txdata(). Use the
> FIFO to pass the character to be transmitted.
>
> Implement it using the FEWatchFunc prototype, since we want
> to register it as GSource later. While the return value is
> not yet used, we return G_SOURCE_REMOVE meaning the GSource
> is removed from the main loop (because we only send one char).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
