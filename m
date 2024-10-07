Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2200864njb;
        Mon, 7 Oct 2024 14:21:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1VSpBUwGwbSY41dTFfkjjSO8nkud0lPfnlK5ZmheiW5O4lTJYugd4FT8i+cp03H25VSFiut2FZiZONQ==@linaro.org
X-Received: by 2002:a17:902:db09:b0:20b:b93f:300a with SMTP id d9443c01a7336-20bfdf80570mr225585215ad.7.1728336091815;
        Mon, 07 Oct 2024 14:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336091; cv=none;
        d=google.com; s=arc-20240605;
        b=HIJY9zTSfx0BR3u/2rP9okXkL9dAM5kK7d1qB0IataokyNC3xnZnCQ7zjOEgfQW70r
         UgQGK3dnHHNsRaH1KClEF/43D0CudntCt3TNdIeFpB6exbX+w1BJZf5KszKpEMEOP0QO
         pNxMVsL9CZGzOHDyvsi59cbRjo+IrdU5Vxc9vhHg/lFPmdXgXcS2tzU04hq2FdDjQhUe
         Ehe+JgtRERqyDvIiLvLruOYhDs0quYyPRZoKBkz2otyW0x09GgPsCTYdvH27PRlmSBNE
         HffPG2DUq3GlCe9XhYOpuPQinxp9j0wFUZRRJzS9hs4pekY1PTAFb64MWrogX++GczlO
         z06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mYna9qMjZZUIpL4hRT22EiNVizp9raO2/erNUnGgW24=;
        fh=bAZuJviwZOv5YOIlG7l8fV7IkKVAUjhkfo0fluvrSdU=;
        b=WmQcxPDLxGYwlQzq35jPv3dPy7jbls6ZUUUL7EheIGzcBmp1TSY3gtZHLspTPgrJlS
         YZQfyHBNrGAdeRS3XDRabRM0yCGkGcW+Aog6QfXYAuHu/w7Mnir9B01pkxFVPQE0LuwI
         xHMZfWfpRUvHM1l4uw1u+ce4YlOcEN8+YL1/U1H96S6SFjPH83CFaYBtvXFSwNhP0/Ka
         Nuy/+MU8CYtk+ddh1Z00do48CYCPYaEFgavuIMLYoMkc35xDhCnizdgj7VNQBLxCtVq4
         ZjQwP8wEzAwU0v7Ima1HgnOumarGY3xhCjCYpV0bS5jjoEXjUC2fL4d/Cu88EU/skBLb
         rlUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q7/NYLvT";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c13783616sor32880925ad.0.2024.10.07.14.21.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:21:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q7/NYLvT";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336091; x=1728940891; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mYna9qMjZZUIpL4hRT22EiNVizp9raO2/erNUnGgW24=;
        b=Q7/NYLvT1C2J5NClfIVGCtJsv8vg0QcPuJn1SyNClIZGdrOGblz0mhYrPPyRZMXGHE
         He446607xOYlVeR9n0w9X2Qp8TVFSqy50RRuJ8xVLdlVnsxYqEapTqWb5HmANRdT9AU8
         /bP1S7DcL+CEtx5xWnLBfiEbJTOINF+ctlY1rSWn38CITpjzTpje/PghXpVtFoBPWb+7
         EgVL/qb8vK4KdhIzgznKt/Kf4ihetG6iRd76nPGH/LPNTkWEZyetUvdrO5l3U4gGhTX+
         50I2ZyYE+Li03Z/hpYwzLsyYEt05kx43o+gLNDBneJhcKcC0hnuyw5HS5GzpN5qBlLWL
         2GIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336091; x=1728940891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYna9qMjZZUIpL4hRT22EiNVizp9raO2/erNUnGgW24=;
        b=ddpxijUQM98GZPEAs25tri33ct+SE+x2fpBXkiF5RpXgej3mCW8G3M9zIQ4r3BtUGL
         mGjfqn3BzIVAuArc142lBkvan165PcyeV2LmV+rTAgreeTleYgYTX2IiFnuyMMZKXh2s
         TpRsOLvpY8drW6Yit3ZNjQgCca45GOd+jU8zjIlzTu+ZNXGOaXe7Ye9brW5MQFT8LCH/
         F8EJ2ZmXoFjx9yzNv+QzrvRYI5gNbeb95G4uNgaq6sch5Jn4KFgWeel1Rzwl44e2nV9/
         9KDKT6RY2Gja2ulpv+ihoPsjTXBOxvCi71voCyPRFR7NJuJt+8lyTqL15923ST1wnhYj
         80Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWmO8zvkRQTRgvHZIKJgeH3+Q14eNHyWerVJ32MNvpZ+C++z/F+hvDhOrgK3nfAzqbkdVM+DnSq+aJMyA==@linaro.org
X-Gm-Message-State: AOJu0YyneZDpxvU7GNVkq3vn8+Ceax80uRMQ8Jgc7yFlo58pQMyvUQQA
	etxk0gOonGLRmh2WLbOCqC78Loj0s/DFg2HmIiX5kTKaDYSTXNME1lMy4ry6Y/cTcVHI1tWDcL8
	6Jpw=
X-Google-Smtp-Source: AGHT+IHMAZclbZR3J38FTf/f+yeMXq7jyHdBIXJCDBtV48SAw1zPZiqJHLdVs7a1K0FMvQPjzbTW8w==
X-Received: by 2002:a05:6a20:6f07:b0:1d0:45c2:8140 with SMTP id adf61e73a8af0-1d6dfa33c28mr18563895637.18.1728336091415;
        Mon, 07 Oct 2024 14:21:31 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d6520dsm5008257b3a.171.2024.10.07.14.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:21:30 -0700 (PDT)
Message-ID: <68536a4f-090b-44ab-b072-210a9282c1bc@linaro.org>
Date: Mon, 7 Oct 2024 18:21:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] target/arm: Pass MemOp to
 get_phys_addr_with_space_nogpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-15-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: oCbRAscVsklT

On 5/10/24 12:25, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 3 ++-
>   target/arm/helper.c    | 4 ++--
>   target/arm/ptw.c       | 2 +-
>   3 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
