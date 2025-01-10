Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp273605njn;
        Fri, 10 Jan 2025 08:29:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOOm2zsKRp5/nnongneSE8Kkkcw4RZAzkpZzk6DjQ41Dp5AYFWX1/Sru9dv5VOaYvcCawFXbK0al8UUA==@linaro.org
X-Received: by 2002:a05:690c:6405:b0:6e5:a431:af41 with SMTP id 00721157ae682-6f531311b91mr89792167b3.38.1736526544671;
        Fri, 10 Jan 2025 08:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736526544; cv=none;
        d=google.com; s=arc-20240605;
        b=TR8X0AwJb/nd1aFmhbhny+rsgCSzpotTb0pRjb1ZxRljn3IzWBz7JZrkpDOlJwz19e
         z+XnY5SXEYvdGcrlyr9qsqeJABJVLPn34MS2rnGlTQnTr/foqX5hYPowyrKfm6C/Sif/
         olCrUcyxJ6pijGnp/DYv49eGbPpkNhdOUGSjhc/9pQzgqoID3xp6chHQi9RGKD32ZPW/
         pbQe3vYLZtScCpYjvz7MWH9Wp8RsKe9x6UDOj9xqsT3/ky0ZId8FPW6TWWaNe/vlA2ip
         M4jRQau+CGVweoiWqzn8/QDI5+ZApGmvB/8SGIlM8uXEy3RO2INAMaQEDV2XUJcFSmVl
         KOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4P3RvkgYEkN/PcKVgKotdpH2Ww4nP6EziPFXrkthcqQ=;
        fh=bi7hBNueebXm3Yqh+eBT7dkTKMbfJioP3jKfhnIbZpc=;
        b=UDUZAJqWqe9/OtNp8nM3mo6V/AY/AfP3RhVqhhJBku9aQIDiR691j4h3NOCnEbPuXA
         w0k0HG86pmBGfRznbulzbUXVgWHKeez2rymGFzDvLYQpYu9obKQo2Zj/G/66f8f1WpiD
         U5MS+iEkCT8d/jowrrgmDFhZIqXwQZAdrnzAfDepJ0kAyY5pOO4uR/M7CAIDMqXERMX3
         3zAAFsKVylUke2qXm1yyuCe62E7msXVI1o93a2IFrxgbdmyB8yWK1XbCpH6idJAdRf6O
         haNFooLu/yQL1PMb88yrAso/ba61ZcspZBoXm+iAQKGxg4zRYL9i6IHSdMPY5Xr5FqVG
         phvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qpA5D1Tu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f546c88d74sor24300007b3.7.2025.01.10.08.29.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 08:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qpA5D1Tu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736526544; x=1737131344; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4P3RvkgYEkN/PcKVgKotdpH2Ww4nP6EziPFXrkthcqQ=;
        b=qpA5D1TutlNYnVfojZn0m5+RJ5NWpuYLo4cnm49RUdTQ628BUotcgQECL6Hucw6uok
         copDy2J5/CKaHBsteMfeTa3+Hv2rxY72tN6IBaFHy/o5YosZRFGRz8o5twXIZXosIc4D
         1QRvdP5kpmHLc0tT4LTKfFYU/YllhsrMGtDpW4ivwL00N6klqaV03aYNrYU5Bvf50cv1
         h+zxpqvgr2kz6oKazh9kFRvM92TNIQbC48fJBJm+RmlTgOtzuXJnZdxt1cWPZvXcdhCX
         qjvqF6DrkwqVsANH/+nCO7fmBNKNQZvs+pfZ6UjGziG9c2lFntfOxhwAWBMaOJtE+Yq4
         RW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736526544; x=1737131344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4P3RvkgYEkN/PcKVgKotdpH2Ww4nP6EziPFXrkthcqQ=;
        b=qjUrWrDJjMIjnJmxXKcZrONGKYcaLZ5pvG+wU2boOFdrq3qNCu22Sxj5BIwaqxckue
         aHy9wLXUJzSB1z3xBPa2ixmN5eQI1O72Be9VJqMsb/DaZR7YeRlAHwOqBEtN3J2oW5Sh
         xJ1Q5dFTV1Sm4yvB/60wokGH8qocD5wFH8pguNjY+5ZKArgOruFv3lHlIWC8L5tykIwO
         5MZbkAcOYD6DWnj9TWmxUiJBl/jECwJ5/WVVcI5tz9swjRO0dE0QgUPsgFH//h2/JvJ8
         9B1cTDmETHIipDoTV7DoNuOG31pqJIelEdvBVTmLnQBvoEWjzb1StPxpEciWBdn1ZiW1
         YuHA==
X-Forwarded-Encrypted: i=1; AJvYcCVPkokSBoXR4oG9VMhfYSv8zZhfy+DEaF2zqsaUaJiUtI+ULopx09PFXt5Ij4X3CtFC5nQBiKt+3cqVwg==@linaro.org
X-Gm-Message-State: AOJu0Yxsq5bmponw3r7U3eG3EY+aqlSU0MJfzuuUbKaJapLFLQ0n1edZ
	6rij8JKMgp/DVYWghkkop0LeMxTwz+eoTbhPft1/8YCKa/t42wkHqouTd3VugZFJ8H3AlUoL8dv
	cDvIZ0wzg2atlAS19ylDhXYbVKaujFHitQxVZBIaR
X-Gm-Gg: ASbGnctR5MbnCDctgAQDDw3b/zyy/FMuNeTEt5QkYUJaWutpqKi7zhncuQxZbPPAQHN
	OrToqfJ1oWQDKiLZ4aSf45jOY8JTaKWUhDkXwfto=
X-Google-Smtp-Source: AGHT+IGSQPPb4p21lFIAsHRRJ1ufv0nZ2Pc++jBHHW+w1ROe0ZcRBLTQt3v4uupnXO5Mq2h/77PKQJWNHsec/oe1BtE=
X-Received: by 2002:a05:690c:4b05:b0:6ef:4a1f:36b7 with SMTP id
 00721157ae682-6f53125116fmr94441207b3.25.1736526544276; Fri, 10 Jan 2025
 08:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
In-Reply-To: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 16:28:53 +0000
X-Gm-Features: AbW1kvYBYorNd6K3Xev2CdPCyku8Ffe0oLMvXxGOtPD0myxvI_4y9l2HxcfuYfw
Message-ID: <CAFEAcA_ChARwKyvRXsEk1U3q1T2528753Eu7LgDSsDbF1s5tNQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Change default pointer authentication algorithm on
 aarch64 to impdef
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
	Fabiano Rosas <farosas@suse.de>, Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, 
	qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>, alex.bennee@linaro.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: QLIyW3PgiHv1

On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
> spent up to 50% of the emulation time running it (when using TCG).
>
> Switching to pauth-impdef=on is often given as a solution to speed up execution.
> Thus we talked about making it the new default.
>
> The first patch introduce a new property (pauth-qarma5) to allow to select
> current default algorithm.
> The second one change the default.
> The third one updates documentation.
>
> v2:
> - ensure we don't break migration compatibility, by using a specific backward
>   compatible property.
> - added some documentation about migration for arm virt machine model.

Other than a minor change to the 3rd docs patch which I'll note there:
applied to target-arm.next, thanks.

-- PMM
