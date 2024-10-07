Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2201282njb;
        Mon, 7 Oct 2024 14:22:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1LM2fnDxcUYhxp8XaB4yjOcNa89z9wieFupiBHXDmaDNE5F0Sr+IqSEyTFbBenu/zruBxpzPx18369w==@linaro.org
X-Received: by 2002:a17:903:22cf:b0:202:26d:146c with SMTP id d9443c01a7336-20bfdf803dcmr212705775ad.5.1728336159593;
        Mon, 07 Oct 2024 14:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336159; cv=none;
        d=google.com; s=arc-20240605;
        b=AvAinb+3u97ZwwJUp1zB5lOuknV5wF2pedoVt5LEKMphTZlvuoSS7RcGLOHLvU6CL4
         c5B/v527VOAIxHJh5+DDh7BloUTDb6y5TxymN65dO5ZsoYNQy9So8TXXNbgRMJVjNcf2
         C0NnBG49XZmsmMCK8MUvDeHGFkKos1rv0qxd2Hm5H8Zlec4r1pTtdvzMfhm+wQ18qdWY
         3k1ZAvTPtRy9SVt9NGDFKiygt2PGNyzatDt/ieEXgR99Y3BpyxIxJal0fLqhITC1B5Rr
         CuBVOLaA9L04aXFjrT+Afwv6Hb1OEuiO6T6HtYzFZPZuXZqcz7D7D5unCmb/U2zevCvf
         Ep6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=s60O5wYAf6jx00TtsFTa4DP5HnU2LyNHVb304Id2ieA=;
        fh=D5BU/9g0YKXQaPwsNwz6HrznYoUMnj4H77lZ9OBJQo8=;
        b=WtZ5I4x01YYKmlIRTVO6D7BzvC3x+HFYvwhsuavjNdMdUU/ebTyLimrw295JlnWqnN
         iJpTolCFWPnmUShDCqELjhr8OrOajCzolIY4aJXxD2y5rQ8Fazfex3csIpGXi3IGabty
         WaomuxGhRnlnpBODjipmcMcneO09biuPj5j1LjRUeCs67d7OSr/aqZiC8UDATzJfaCVF
         Id9fcNmWSX5T+OQ9mDU3YxLLwFw8XdNGByxhPlLsNvtFEJJ2IK5hc+R9p4UiOQmBA8Tx
         iI0yhd1rjFU6arW3sLKJ5c2irIuTSxh5jd0oaz1IUh+dTZ6U6iLHifHznEH8CBGJbMhh
         Jpqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mzv+dOBF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1396d01dsor30878015ad.16.2024.10.07.14.22.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mzv+dOBF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336159; x=1728940959; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s60O5wYAf6jx00TtsFTa4DP5HnU2LyNHVb304Id2ieA=;
        b=Mzv+dOBFCAIFfg2tBuxCJEfjcoeRr3xcxPjPGeEEts9bXALuMgOTlKBslUlEyPLy1a
         2Ip9gYon70EbnpfBuqxmqo3r77/n7a9W/Xp/tnpkchh718xpgSPzbujMtZiK6JOzqmjU
         YiMX8CTi4StOwgnvP8X5OP4dzpJAnL+shxmlcfgUfet7dECpkXdrwlSsajvbXmBBiCz4
         nmPm3JLf4DFnbOWUJlG2m10ajIAMhRb9H7Pyv+PEtU5WiPSNkspvp4WaM3TBjU4O4+v9
         DOE2NQ8QbqWKh5NxFNRlKmZcoo2GJNh+3j82weXS+ZZxxTrMVxtHjfM0nx+8x780gJkA
         QhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336159; x=1728940959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s60O5wYAf6jx00TtsFTa4DP5HnU2LyNHVb304Id2ieA=;
        b=w/mBS+AKSjeHzar7ZIo340t2vSVDPDI2HDLLRgJBOB5xvqJuddcUmkPDAbl3juEiyQ
         qSSyvt/CUEpAuoG9K3sSJjX2OXFfjRheZeoTF9upeiw078oz7RxBL7+eX0ws0m+aiBgk
         kGVcjx/OaAp0sBlLGGViZTSJooQamV6CsL2erl410zG2xtJSGCy1E2rPIOkSY3x7EieD
         hZMamWcHETuROkMsyA6TtHV71z0TtmXAasyJtvaeUjCtVrle8Y28xYhSebq8C2LgtpoA
         V8ygKT6ZWnYy5g3VDsCm9XOtWqhzjhZq9x5IeYkrkEvCmdBgIV9sgE751+3MYZja0E/v
         E1lA==
X-Forwarded-Encrypted: i=1; AJvYcCX0fImcYrXHwFK9fi0vspvoAqHeWAEWt+3f0q0gnlb9704CElDZQv5oWoPJxe7oFl5AERzRu7Fe0161Fg==@linaro.org
X-Gm-Message-State: AOJu0Yx5xqGl/MvBRFTTYJp1xw3LMhhuqo3x8BcqRNM3IypVUkgtqjOO
	yQuPz5J6LS3VQ5OqFVKTy0dKoP8lbL6xrulyjouDX4z8jUA6qdVnN0uIbzU2gU37eA==
X-Google-Smtp-Source: AGHT+IEuq2X2j5M3Rc8qtgH0NBoziNfV19PVaUHfklTp3hTM6YD1W+hXeAgxThlOsil8iCd1VXi+Ww==
X-Received: by 2002:a17:902:db0e:b0:20b:a5b5:b89 with SMTP id d9443c01a7336-20bfe495d34mr188077105ad.35.1728336159124;
        Mon, 07 Oct 2024 14:22:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c528540a0sm693765ad.93.2024.10.07.14.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:22:38 -0700 (PDT)
Message-ID: <819fda22-2258-4d7d-9015-99ce43a7e7c1@linaro.org>
Date: Mon, 7 Oct 2024 18:22:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] target/arm: Pass MemOp through
 get_phys_addr_twostage
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-18-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4XvvtaL1y7bP

On 5/10/24 12:25, Richard Henderson wrote:
> Pass memop through get_phys_addr_twostage with its
> recursion with get_phys_addr_nogpc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
