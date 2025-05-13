Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp409901njb;
        Tue, 13 May 2025 03:12:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsIbP4i5LXfkyuB4Ewufn45zekE5rjvuWzN+mxzyYvrJ3aTpMGKdrseQuWfSu2O1hw5rCZZT+0V2j0qg==@linaro.org
X-Received: by 2002:a05:600c:5297:b0:440:66a4:8d1a with SMTP id 5b1f17b1804b1-442d6cf335cmr135923475e9.7.1747131168052;
        Tue, 13 May 2025 03:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747131168; cv=none;
        d=google.com; s=arc-20240605;
        b=BQ+njsaRy9gauANticxMfHvuQFypcqCOqEbozHRkov5nwyGID3uC7EVNdju9GSMyzv
         YkM7Zwqoi8e8tUK1qCHFADc8i0wwX3/5wcRXzIyqgkEa4IR4eh+OiNW5xvO/j4P+r743
         DzFZ0+4riakxd7/SbPpsRteSXpuzBEHtj5/LQT63owQqqiwlpJBTIQ8YRFG4vHsnyQ7f
         h/He+iYhUW4PcVL3qfgiRftcRy9EJLwo6ctA2hOdgfk797WMAPBPhlnsX1dtY4MMNcFm
         BXQCRvYW1dkAghcpOkYEJdwgzITNduxaK67aaVAjPUi835Lzfsrfi9aHWXNZzZLbaGnn
         pz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ep73+iR9WQw4cYUZI66lyvkdNLNSzJz4ByceQve2wXk=;
        fh=ADpJueyCEZ3nPtZxwcU1IeUQzoD7YWOpS+YGLjD5NW0=;
        b=cHPWmRja9E+kg996Cy8ILZ0jtw6A6d03d2+4t/Mtqr8e5bXZFcpvxfu5+jYmi6Vmcx
         vmcw/rwBGN28zuI3e/x4paPgf/a1SLjzctpv6L5q23gsD+bY1xcvX4OV7CkwOoDupIJL
         m5mxXym09jAMtm8rD5eR3ztbIOQPDtTVOchc+n5BrT8OqV+YKRsy28yKok35+iDfcuiZ
         wgy5ovgchr2hjUobqk1tmI+K5ExWvYtiQjQ0nNxxT8EzEVZ2p/WT7vkBkh9Jnf+ZqJaW
         Ihgae/MhjHxW3bfYG3BCRG7i+wITo/nFuKzZ9gDUhSudjE9KKfFGORUeSu5ONBAeir+5
         7Scw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uXd3zoFH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442d68b7a54sor33998445e9.11.2025.05.13.03.12.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uXd3zoFH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131167; x=1747735967; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ep73+iR9WQw4cYUZI66lyvkdNLNSzJz4ByceQve2wXk=;
        b=uXd3zoFHwgQbXnGsAC6IvDYq9R4uJR9IIuiJf54W+qHAAK5fKGQZixQ5bdICJJbVdN
         pgWc2O6IKPo8DVcTzZVF5sMAA6+TNCBajXg3v9fcvVv9d6GvovGubk7ykbncXHXe3Ksj
         Gz+Q5dlhh8ti8IzqmTwIB+tMbxArs9sjVpgQP5YmKmIjLu1ZbzQ41IUvass/pne8Q1iN
         XiWnsbmLosvDgLE0dxTKKwTj6kWGjBTkYfSBdTyB9JJcqHjxxjP8EBF1Z0TPYFM3mfbF
         kQ+vT4o4Fkj5VpsXDJJB0FAgaxg87CTxQNjrKPQIDqM/ezbcpYk2vbS+EugwKSi2RAwX
         e80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131167; x=1747735967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ep73+iR9WQw4cYUZI66lyvkdNLNSzJz4ByceQve2wXk=;
        b=e7Zskvo1EHSNa+DjgMg9ydRNvhWD7s6g7/vK1A9YPsb0cWYgxduOLzraMRLwld4wkA
         QuwIukOdjzErOt6MQbWRqZLppVwSf1pDvZkFGsrHOjnfL5nZ+TVPI/QkkYtWafzt2veH
         vq0oGRUdXTdHn13UoRgKlx1+SU6DbkkxE6zdv9neNu/KG2PKH5zPWPdQYamuI62kn/fe
         5Sa0+XRzh0aFcTIcmETMldCz17BcTeHI+UuA7TTnqmPd1YUDhj2wwcF0O/Y9SGBeoBjD
         uWF1ZZeJdTpf7s6MdMyOtPsUNBVDVX1XNyWei7pEK6fq6qI0dkeEQzPWaG6qDXjTdyXc
         MZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU05nnxW0eo2trW394+NmTVi1I+x2J+DbjcmYAsHzlbIEk9gVDG7scyxCXIFL5Pv9EF4U+lpWmzfuIHFA==@linaro.org
X-Gm-Message-State: AOJu0YweC+WvaiQXwGae7EWOK/ZvdvxHokYXkMlaboggkRSQb/GBRq4T
	WIEy75rPvO56+BCgRZxCqm4ph6b0sJvxZBIpXger94dM87+Gm7C3e7GKn6AiU1Pxpw==
X-Gm-Gg: ASbGncu6TRr8BGjRLaZO9iijWGAoMrHg/pqOsEdfzCGfcI/r0H4WEHMq8pi56NuVET1
	Lroh3ONz41iR7ctwznqemGWZLrLsjMUPOVTGcEAAfmron5lnhULarGEUQJQDJReVE2AlXBIye3n
	Eb/zO24XcwdWMBHcKUEw6AUd7MLVdzAnHpSFUJia6hnmYCf277StYOzvXwBd+hiMevU0SxrN+yc
	hBbK2xQ4fi3f9p6DBW9KvorurMhbGyZy6gy7GInrwBZq48nPVrIyfRCvTUJUFDF13Nmc09J5ucf
	yM2CnGKBlHvsE6V6SDvdGQ2qmSCzzwbpm6jkgA0eZqbzU42GBBZEVyTT1mNHWWmr0/2Va3Bkg6Z
	8d8QxolCJ7egtfcYS8w==
X-Google-Smtp-Source: AGHT+IGlvyyiBeyR8RnzU+5gL0728y0wVMx7KNEseOzxv+itBz68UxqnZpUnNfrcA8ai1zln4TfSIw==
X-Received: by 2002:a05:600c:82c3:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-442e9f4a297mr43907375e9.17.1747131167445;
        Tue, 13 May 2025 03:12:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328535sm210133285e9.4.2025.05.13.03.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:12:46 -0700 (PDT)
Message-ID: <354c9708-39e4-4106-8333-34ae6cef2bc1@linaro.org>
Date: Tue, 13 May 2025 11:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 46/48] target/arm/tcg/tlb-insns: compile file once
 (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-47-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-47-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zkuZzqbeaXgy

On 12/5/25 20:05, Pierrick Bouvier wrote:
> aarch64 specific code is guarded by cpu_isar_feature(aa64*), so it's
> safe to expose it.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/tlb-insns.c | 7 -------
>   target/arm/tcg/meson.build | 2 +-
>   2 files changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
