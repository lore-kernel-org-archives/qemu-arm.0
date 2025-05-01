Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp266236njj;
        Thu, 1 May 2025 08:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWc2AWYOBcglJt1SvfvX8mk+J/Fbmf5QgylWtQfcxLMw3bnR3mT+T9jCSYkTC3258MpEKVhcUubUM/w7A==@linaro.org
X-Received: by 2002:a05:6a00:3d13:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-7404777f698mr3992213b3a.9.1746111985619;
        Thu, 01 May 2025 08:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746111985; cv=none;
        d=google.com; s=arc-20240605;
        b=f1JSqUTFncFtRTQlDh55T6bgkIm5rKOGI9Gkp1kp3/Swvx/vs7fr9lzRY5NUku/Y6J
         vJ/I/dmzf6bHpIba8TFFLZMowMS275GiOC0gz8MwyILTYLP1fmJHthR+dE34OXBg0FAK
         Jb3YEj91sRKLXxDTIpjcxr4qpWxhhfNnMm1YN09F4e9GRMXFTWE+h9B7lsL+hDzHbHjF
         9bw8f0wOHLWlX1dEciNtGMktXNGYxoVB8g0Pwcwg7Jl+uM+CWbwsYZHavZ+X6AboYxMN
         mwzB3SA5XlohT43Qe9QIV6DrUPJglhDTRdjH94JTN7G7PgTkTN/LJQqZRR3P2iw/oBap
         wNgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iZWcy/gQwmgZzW18F5hJaXUmKEUe5Bw5th9wm/LSgKg=;
        fh=celgj5ZFqZMHRGS0y6ykQeF5BLmLG2sQxkAt7E0P8Lk=;
        b=dh+oU7qUOMlaPwbz1D1Uq4fye373mjT0WwkGyB9gZkbIjhedvBcpZMPGw3RTNN8f+I
         /DUYjdocQ1IvRQVtV5Am0xkKeweyPXTr91cCLpRAqEQtdAgoRS4QBmCUj1npv/lPbl53
         aEm/GAk3EcjP4DmezDQbUVwtwKXBOMgBINZFV5H+/QoZF6lzBwjemQ1sT0kFlUBa87at
         f1g9V0s0PCB6R/5EBG29LDu8mNy7pmtKpAyRj/KsPFsn6qEjmOHNGy28AgPBNrZPjsKj
         yvYAkXGbwIRAtCXZDsfUxp7EE6Bum9GQ31MmbtghNiESBbipoIpJsogiSanUX3gKOLKx
         PV7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lIxwwNt9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb73e5sor923486b3a.1.2025.05.01.08.06.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lIxwwNt9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111985; x=1746716785; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iZWcy/gQwmgZzW18F5hJaXUmKEUe5Bw5th9wm/LSgKg=;
        b=lIxwwNt96mvpFVEr4EsFwHZYWFYfjhFQANEP+u3RLiCJnZJEzG3A6j4FCOHXSRWdgw
         T3nR4Hqhi3ZljM1GUyz7xzr2TLQjx6EF3oAdKKnZiM1Ubx1P3F1Q9mBw3SEtIZS6dNR2
         rLt2yEkheTVUVArtTcxcYLxsk4rDpqaVUQyELNLs2ZXgk2Uq98qrz5zQCsm90tGVu3mm
         l/KL/wfJEiyNkPZM/iNOL2lSsRC/YLoJywUBzuzGymPeUEL9gA12nPE3UcrF+hU8IgSe
         eW8otpyqLaKLDz7kbI3Wd28vV2gSzRlQLJDmnZ6NP4Z5YCKkkhTcexeO5yM8W2kbGYHa
         1rWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111985; x=1746716785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZWcy/gQwmgZzW18F5hJaXUmKEUe5Bw5th9wm/LSgKg=;
        b=wn/+Vx6dXfpEok2T/9tPuiSF18IiCBiIp1P7bQQPzvBvmFIEaSzr+5nMdJ6KyL7QN4
         1G2hxDaIl1bl/Vmcg3YRV7BskMG83En7ZsoQqG8hAr1SN+UXP9j4EBN/c3dS0ATiJieq
         XtXopqUA9NUPJMdyOHlVod3/NMwpGv4ReIQ9WTLidCOW2YE8oqBgQENciqwcyXRfwWP8
         9oBOnHLMGyzELrFBDGB5/ss10gpt9zqM7ncSYsd0LBk4fbfvn3xmMpkLE+NRuqxRsFbf
         YnO8RMICTpdo21dlPPS5RmMOHKLTFCDPH//Rh3JDgdgpCTDi02gLo4lkUAs7s4gUMreK
         xHnw==
X-Forwarded-Encrypted: i=1; AJvYcCUVTGOmg8kFaaLeTFGtMi5foR72KE36Bg6yOly9XejLz4DnoL8E5jS+BJBxEnkMzYIHHb+Hl0xBqOhU0A==@linaro.org
X-Gm-Message-State: AOJu0YympfORZ+l8ayMEpLrzj9PBK7ZN+zqng5s9D6U/CQhMHZNqJhyB
	0bJUz1ds+UuIB45e9G1ewndh3YgwLkA1StVD+9Y6SYMp+WYNvS8UpZ7xbTa7eJnPqA==
X-Gm-Gg: ASbGnct++s4k/xDlyDQ7/gO0q0o6yaNEID/nuiUcfMMWJqx4vKS4UmiiVrfpf0RsTb4
	n1xMBDtDyNXDIOaYijFDI6E1n48xbtqMiF1hIyj0v/dSsj2oBHwM3H+e4vtGYOOA8EGXQ0Qy4RK
	WBaLZH0HiT0cd0VAepyole6iJdmIl/VlFjp4meSf0tOan+k/GbGzqSvnfu3AYzhJHkZoMWM9KOz
	0Rs5m66+WE8BU5TldXwiCBvdgrQ73phCczk8xRK8udjuGdJsRUuUWKmguDWSBmIwFULFi8y7fhN
	w26VCO3f7LHcyWDrt1i1HD3bHuPl5twTlkZJRI2MOjV+zszwisY8OloUMyOuwTkH4lzBC7AFxsx
	20mOd1tY=
X-Google-Smtp-Source: AGHT+IEYYi57/VU7OygPpKRkUXmhr7nlLM7U1UenGjpFwEyAsZYWV7KSkhl1VmFWd5WF1whtavzxLA==
X-Received: by 2002:a05:6a21:1788:b0:1f5:730b:e09a with SMTP id adf61e73a8af0-20ba73fbe81mr4682296637.20.1746111984650;
        Thu, 01 May 2025 08:06:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404ef18c61sm933502b3a.62.2025.05.01.08.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:06:24 -0700 (PDT)
Message-ID: <8f480fa1-609f-4b90-b6e7-02a76d2767d2@linaro.org>
Date: Thu, 1 May 2025 08:06:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/33] target/arm/helper: extract common helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-16-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-16-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: cHSgm5YXYo6q

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.h     | 1152 +-------------------------------------
>   target/arm/tcg/helper.h | 1153 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 1155 insertions(+), 1150 deletions(-)
>   create mode 100644 target/arm/tcg/helper.h

Why?

r~
