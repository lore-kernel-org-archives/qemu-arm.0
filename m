Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485600njk;
        Thu, 23 Jan 2025 15:45:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU2Fab9OwBU/Hica92mdANsEsZOw6N3Zf8NOWwYaX/avi+j3Uk8gX9eCxseYG6tx0lIXDmMKAD0tyl+VQ==@linaro.org
X-Received: by 2002:a05:600c:3c82:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-438913f08a2mr299367445e9.14.1737675955834;
        Thu, 23 Jan 2025 15:45:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675955; cv=none;
        d=google.com; s=arc-20240605;
        b=bejzKfUmOY/03DU68okvZLAFx4kqeRIq+XxRs87XSnK2CkVnXKfaPB4yFrBVTalrVD
         7hAReO6q9k92vcjhNOl7UptPxyGloghTyYHr+nANzpYCBDn5k+cCNLPz5oiXWNR7CjuY
         IQLM2H8O7t3slv2ZAK3n9CyVLOcn/lIT0lMurwBM/l5s3jHEV4vQfW6Z1NidlusCRA4h
         6S4Db2mlLFwxdBQXoFg9AV2s901LgIKKtWxsgF+qS/OvMoI/mrOmf4PALbZaNCz+7lpW
         ueXAM94PVUCW4jXkJchT4xsmtIZ1vjmGQ/VbpoPWIYgBxd1aNxzAuBxOZHljCnCi/DVv
         tcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sIImxUuZ28chVlLL+vN1mb6UQluYe71i/J3SLXui4EM=;
        fh=vwlN8QDQrLsTnDh+lCHrnHSAZUyqglbfbddSfGQwzyQ=;
        b=QZe0PUHfNfbOR9iwKIuqGtNb4t9y95d8oVXDkvyBhFVbKefO9ZadwhHzXER7x7U07v
         xU0eacgwazTdo8gYvHmZBBd7cE1R8dOu949Ag2Z3/LSE1D8904NJlEUM9Qio2QXUnqNn
         jtGOlmouFACKmmeNve3wu8XG3nA6cKT5j/JpaW/wgLuW07bfKj5vg9eed4kOZLIAKf8U
         O+NXmm/6fKJ9xJlljXiuLqeQnRDc0+eksfTI5by9OWMLKxZ0ZrtQ6nNzJPZ2zDLR7N1L
         RHCxP6KqfmEEaJ6jiIcBR/vDq+5VrP5gdyieG4DAHWZqL68RnH9B23dslzbRKzbujmTd
         eGhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yiDHlDX3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4e8a82sor1981515e9.6.2025.01.23.15.45.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yiDHlDX3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675955; x=1738280755; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIImxUuZ28chVlLL+vN1mb6UQluYe71i/J3SLXui4EM=;
        b=yiDHlDX3SIMXgbdxwo9ip8+GgIPNzkRW1UbPu815WESqZN0oUpnZuBdR+XzxjXg5Y1
         Qnj5/vjWgCOFu9bzM63e7hTWNfgUjZOaCXhTziUlokdieCLD8e0DYih5AOtfVPybCZnS
         AK8z4ZtrW1/67X1doi5ts8BVc+88Q4tXK/8NvqTHTcuJIn/w9YjttYJAHXwFSQpAtfOF
         zk+Q93lI3qSWAEkHWqyTP9qL3qajdtSK6P1LHfUnXuyBibjhaddIa4OCzEcw6KcPLlyv
         ve4LJfuHS/Z5NtLf+is/PAFzAQEH3q1dUTVU1lch0WmV1LuSDHlKnTgK/3H6omozqLdW
         OELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675955; x=1738280755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIImxUuZ28chVlLL+vN1mb6UQluYe71i/J3SLXui4EM=;
        b=oszRWiG2VHbySoxKHbQOonvVIj33Pcc5wDW7kYbFyGQu1sSIj8AAZ2KQNcBXp1fSGb
         e9+XdMilZfcEs0fo1bW+Zc5bR0PghgqahKEEDbp7aZxfYN7Ee9qMB8Ng4LaE2nUzwMzN
         +bR2GpNmgm+/BubZ+3x/oCG7McXaqg3drxUSeJVHSOh4ZY0xaLfg2XY07UcCaJUBXSD5
         PIL3fVWruwh0xaRfRr6+ADaS71UZrRIR5UObsFhx7f5t7x85Pzv1POefpKrnLYotejtJ
         J96tUpTUseRjXfJQcNxxvs0SOD8Dumx9HtX8afuJg7FIcZI+RkPopvAsZ/TZkGeCbfer
         mczA==
X-Forwarded-Encrypted: i=1; AJvYcCUsV9xnHj9PrLuiFspQUVbwUAcwvPJ/TKaQaKazp6EVymnWnnA4LVafMNgePU0X/HtKjVtyHHElsAZ0Hw==@linaro.org
X-Gm-Message-State: AOJu0YxdytwbpD1F238MpkzAYyRhW7yP1u5bz1nsNGSaeprx2BK1gKGY
	/HPscseH0X9zxPLGodUhgW3am0YZpPgX91923TD4dBQrctLZE2QgDDl2jEkbaK+3pg==
X-Gm-Gg: ASbGncsTywcNyvXqrQJEC5nXgYrs06/IaxAKXE4gcxzt7Kuax9mkxfoZwW33gDGiKs+
	fqS2Q1XQlBs2kW2xIsd8YljQFZGvPvJgjIkGL/tRnSZgIrkzjpmcx5yb1a1nQH05Q7xFWZK7FWm
	Med+/xAanTlK9hZI/HRchDxEEvfy00N63W4UX0pE8yU0q1COacDrFbV2YgYiTwWt3v88gS2hJQh
	QeSo6yuRw6/jVa308NG0WZTndTejpoX8IRI3Rxd1GA8yNLwFa0FXvnYw6ME+O30vCUloMX1HZkH
	J46/XhHFs8F0Ftp6nerBTtg9BkEBcOYAU8kbTSkoxh5iweW9O7yG+v1yr64=
X-Google-Smtp-Source: AGHT+IGfBJfULhniARVxaeHND22dVQGvVM8jm6sNf2yido1MC4lasaduEx+qwJvir1julFx+bnHZjg==
X-Received: by 2002:a05:600c:35c3:b0:434:f131:1e71 with SMTP id 5b1f17b1804b1-438913cf2e0mr264387845e9.8.1737675955349;
        Thu, 23 Jan 2025 15:45:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f355sm7140915e9.4.2025.01.23.15.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 15:45:53 -0800 (PST)
Message-ID: <3ef3ad0c-0f53-4588-aaf2-f6fd712ebd41@linaro.org>
Date: Fri, 24 Jan 2025 00:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] user: Extract common MMAP API to 'user/mmap.h'
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-3-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250123234415.59850-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: XfU2DIR67Yhj

On 24/1/25 00:43, Philippe Mathieu-Daudé wrote:
> Keep common MMAP-related declarations in a single place.
> 
> Note, this disable ThreadSafetyAnalysis on Linux for:
> - mmap_fork_start()
> - mmap_fork_end().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I forgot to include:
Reviewed-by: Warner Losh <imp@bsdimp.com>

> ---
>   bsd-user/qemu.h        | 12 +-----------
>   include/user/mmap.h    | 32 ++++++++++++++++++++++++++++++++
>   linux-user/user-mmap.h | 19 ++-----------------
>   3 files changed, 35 insertions(+), 28 deletions(-)
>   create mode 100644 include/user/mmap.h
