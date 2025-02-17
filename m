Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp75980njb;
        Mon, 17 Feb 2025 06:37:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWP3GfcQuhg6US4VelTrJBhrmhIY9/oiaBN9jmqrmn7nYMC5o+uRJhJAxWl4mGXyS8TiefZ5Ad38CHhcg==@linaro.org
X-Received: by 2002:a05:690c:600c:b0:6f7:4f75:44d0 with SMTP id 00721157ae682-6fb58271f7dmr78802767b3.2.1739803045077;
        Mon, 17 Feb 2025 06:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739803045; cv=none;
        d=google.com; s=arc-20240605;
        b=EQzaSuZ11HFe6J9kpZwQ2l2g4RlTu1VsdVpSD9vaJYTn9fe8sGWKA6+6Ejnmkebv8i
         cEYSs1tQEgQFRqZh4uhkQ2F/o/M221r6HzLer6laHtA3PFPPgqiVx0cVR86yZOqml1Z0
         bPIUQeBJehADCa+rI4V+jgA4FdtCF8f6cMpWXRyQyjSWjZSjcJSuQncBzR2vkGIC4Pcc
         rRXu6kpbrM4sNNDsQV9+4NgwNpnrPYcRddvbKPkYlKgeaxzfyk1SzUwPwypjBsmBkIXD
         DpC1l1jQg4eQys8+zzyAoNCG7nwoQ4Br4LSRnU+qlKM5sMKgcRtP1cqRokSRmhNbjICb
         lI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G4SK+HvCc6ptd1LtIP/LSc2/QzgcAAxoa/Y6hkD/GmQ=;
        fh=gnFnHKVnrIVMlLEVwTJDRGBQX0mMaanz+UaOGbMRrDs=;
        b=TKUT0i94ac7Dxs0LUQfQxb5yBjdj3VEsqx2M/nkfIpM3CBaJvNmICvBD53o4nb5KRn
         P+seoj1KWioPbzXlKKEfiJz0XNwH4oUWEZuoqXZDZy8bWq6WvaeaGlNrmX5UJ+375lPz
         U3Negk3IewKx4jOmGSzx5IRPCpF+MsUG8/TVSxU9VGnDgicjukQa8Dn9dZP0QfivIman
         grA5d3JkWX52ifvP3K342Kgi7iLhHKPZFpwBYn1/8oDPh0rZDKCYXLbXmqOb2XQwKsrl
         mK6EyWk8t6o35WUfNX6CM2N3XiOzdny6NGrDn+dMwlquKyVD6ELp4x/qM5sPNvHjh9Tt
         5CQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nun1rcjO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fb35d60fccsor56022997b3.5.2025.02.17.06.37.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 06:37:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nun1rcjO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739803044; x=1740407844; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4SK+HvCc6ptd1LtIP/LSc2/QzgcAAxoa/Y6hkD/GmQ=;
        b=nun1rcjOPgo/kWkcQxjW2fQCNO62SgbcaW/KGHYA7MDhB/qRp40N1anySwAHTQkAJZ
         CwKCE6uTnIzgiX3HP9r+vS407GQnzfsmtu4DDJqU6Tqy3awvdzrgh2gyfEe6qiGEhP35
         Qm+uqb6kHwGhaZybEWCHaXtenXj88ksJkSDtxTSN/w3QJfqpax6f51FioZXds4udgjdz
         XPwpuML7O2hxT2EJ//n4pr+68a3tZGObVB173XbDSW6PfnKJk7CFuPKX+CLXyDYc4+B+
         PqR1GY76mobTch72/rChIm7QDJJyokkDLZVhTg5H2F9fLF+iXCiwRwFHYcz/Jn0PNi5o
         uUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739803044; x=1740407844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4SK+HvCc6ptd1LtIP/LSc2/QzgcAAxoa/Y6hkD/GmQ=;
        b=hw4tQULiPcqIZex6vx3eSWj+LvVMbNpcTAxZDQMfFNdv1Rh7EPLdFNh2AlwB8CmxzU
         KQCB0GYwbynDsO4bxzDIlm+TzVrnREwKsrwRyFS0e1hRWrx3+6fqe2o7AifzmDxnoFm3
         47aK6pu/z45jUajxEzFdaymWeqq2gdLqR/tcvncCzTrF06w7OJP/uH62KHkIkoJIZZ0F
         g5opzVaIeETI0NnjUSS2k3ta6HYsljqRi4zWiaaBU9cxxQ6UrqtypjEe8dIz0lB1h2rz
         pYj5ZZdOQyMGdG58qAfRTz/7LaGgBb1aYDnH8JVU/CrLXIHfNQgE5iDsY+TPww169E2H
         DRFg==
X-Forwarded-Encrypted: i=1; AJvYcCVtnsikVF7SKuRubCvWiGfpiDUkuiCPJCgR881+gFbB/J4UYIGnLwLz16NXpctnhnqlVi1Jpsc4oWkuZw==@linaro.org
X-Gm-Message-State: AOJu0YwAI6LPOnJJZTNHBfV6YeYM9CIFlEDxVD+nkQqzszmXee9bx04S
	in3K0WrSHKRoMeSBOd4eIobdKaLnzVU4Az7qgp3q3K/zZKyASNuzMGJg3oMyEokh8cozlg4LlYw
	ut5cbHR1bV5OOP6YS2Kj7ixUoAkr4I+quEzJoycjv31NybLGeh3o=
X-Gm-Gg: ASbGncvXWD1X6dP2qCDphrTZssw4rr6XF+RvAfttI5/lnnkaf6SlXFhSGyR+B5m+Clx
	jPcGsUzSW1AJ4LZQ66BG65cfdNnjuodQnAsqag/GfuNI4MMR9iBji46KzjM6XOd3WjLZlwL4KVg
	==
X-Google-Smtp-Source: AGHT+IFed88iTcWE4fdkwHywI9CoAe7VqnfpWneaaUvIEEs9z7AO56AjZh/4lvLpvlgv4RWKtwM51zb+IfoYfRifY2A=
X-Received: by 2002:a05:690c:46c6:b0:6ef:641a:2a73 with SMTP id
 00721157ae682-6fb5828f911mr75119327b3.9.1739803044663; Mon, 17 Feb 2025
 06:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <20250208163911.54522-8-philmd@linaro.org>
In-Reply-To: <20250208163911.54522-8-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 14:37:13 +0000
X-Gm-Features: AWEUYZmf28LkTuVlzwrOtzC11OEi7GSyEcTkad7S_xelSk6_j_yISaFozTUyjkM
Message-ID: <CAFEAcA-QVK3gcY4sGNJES=opPK_SqyuqYKpn1CQtDiBLLhaJqw@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] hw/char/pl011: Implement TX FIFO
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +7s+BamOnNu3

On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> If the UART back-end chardev doesn't drain data as fast as stdout
> does or blocks, buffer in the TX FIFO to try again later.
>
> This avoids having the IO-thread busy waiting on chardev back-ends,
> reported recently when testing the Trusted Reference Stack and
> using the socket backend.
>
> Implement registering a front-end 'watch' callback on back-end
> events, so we can resume transmitting when the back-end is writable
> again, not blocking the main loop.
>
> Similarly to the RX FIFO path, FIFO level selection is not
> implemented (interrupt is triggered when a single byte is available
> in the FIFO).
>
> Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
