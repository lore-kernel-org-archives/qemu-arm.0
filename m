Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp651387lfq;
        Wed, 16 Dec 2020 11:55:27 -0800 (PST)
X-Received: by 2002:a05:6808:2cb:: with SMTP id a11mr2915382oid.93.1608148526930;
        Wed, 16 Dec 2020 11:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608148526; cv=none;
        d=google.com; s=arc-20160816;
        b=Y24x2x4MeoGhs9KPI+d+V3gL6dTHBmWzyvv0TE2+bCEX4xcYT90OwAc5ge08f7rMYD
         9ymxluy9Nq5elXUpR5GEYt2Qt4zz344C28E54raZFflEIgZcjf/ez8aZI88EDwxPMVy8
         PQZHeyscP5SUMndq5DJ1ce0K3tLHi3tcfehkcrF4CdPKqcHgCFUutOq/zhvyYywosv26
         hqKramlvei1s0P+d0cOgINatLMTP5dl+DlTjJR/DAJeKKI/bVM6TdAVwsG3ZDCeXEsCb
         88uor0pjnorHrLc0cYkxHGSczeatSJi+8A4vNxsgTYHc3R3KfxxtUMsAZw7wTsLkLT0t
         y21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=holC9FieOMLJMIML1wTWQ69ici2u+YywvFKu6WFDdZY=;
        b=cxEIjTIyhTuGPw0MEGDqybwi+QsztYQoKbwOM54BCP5pO9GQl492MzwLkB3wG4xwt/
         2PsOXuhYqoSDoriBDFNTwmIMa13IyBNQDdjgzWGzTAox/6Vc5HJ2hMPqF9f57RYB3sMr
         FJ5sayzqGFM749SgSohFIjWDdcb4MnxwnaRyJyjJKgcndvb16dZWqdGwTwwmJbcJCT6y
         MPU21opQHbUhxX8jYiDzVE4Ao7gs/m2tZUoZ8aUGWYQMg/KFkeyNt3D02h5WXSkRvjA2
         cwTJL5Of7rrutqxKU8eu8ta0e1RhhXVUZwxP0k/Kp2biloiX3/qVzeVGDlXGO3F6lZRC
         kJYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O3gtqoTv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y187sor781474oie.92.2020.12.16.11.55.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Dec 2020 11:55:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O3gtqoTv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=holC9FieOMLJMIML1wTWQ69ici2u+YywvFKu6WFDdZY=;
        b=O3gtqoTvxZfzGyD0+GL/zNFVO2U4nKpg3vDRFuBGRUnGfMTAmj93w6d0b1L9/tKjxY
         yBRexS/3Y5xS/FWi8CKCfo15NNaLy9jbN/Z+EoVTy+tiqrcj2CpZFfVHTaWvTzNxlFik
         neY5eO+HX0M0zgw7pykolkxd1aQujNnajGaeXBnmc3DPzlkKZ7a5o+rLo2JTE7seZzUg
         /PuXn2RXZjH3FuQhkdyNYzIE06A6cii5+iG30sQVNAmqrsnJSpYcHn4obEunDk9KpUX2
         T+7qCw24VQVk2g4LEC1TEMata+WfSoSi3iI/zK/jB8hWek8L2DdBThVlFW4AAQ51oS7z
         H3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=holC9FieOMLJMIML1wTWQ69ici2u+YywvFKu6WFDdZY=;
        b=aiWsb7VfDIhlHTnFov3yLyF9O1IzzfPsww9p8GRhbGRheNqV/Ly7KxZXCaMIVoDNc/
         pRCYdk551sdFB0Jq/OlOZvzUyYDQVHsUb11inHbi9p5lgayGqPQoK6M31vvRlkdM1yyD
         HMuvcVZ0wtG4xFSaJjtt6SOvka9mtNS5a3tc2A5LOF7WU8m49wh4Wf73XBYurNP97DI0
         hNFw99cvojgVwPmeFxLOzIF2AO5ngcEENUvYxf/dI4w9M2GjAcrFgL0aaaQ+yjA8dtnz
         j00qDqHjuzQb1ykcueKcVjfIjfzFFl8pUPEkmyzxUliEW6KD6kgNF62h1uRVSVL82MpR
         oWvA==
X-Gm-Message-State: AOAM530UZVDk01i6hTsxybDjxpPyM5ujUaw+BSsheCSoEnHRtB/w4QhM
	koeWC9lxlUc6Tll9CUbe/0J7SgfIWgb32/LzeNA=
X-Google-Smtp-Source: ABdhPJyV/OXzVcCqPqiy9u0xSlzP2gKg6mCN5t9yXBwo2NeAvlbFlvVJ4m4nFa9D1qg39SCkHI76Vg==
X-Received: by 2002:aca:c7c2:: with SMTP id x185mr2873996oif.143.1608148526617;
        Wed, 16 Dec 2020 11:55:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id z3sm714009ooj.26.2020.12.16.11.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 11:55:26 -0800 (PST)
Subject: Re: [PATCH v1 4/6] gdbstub: drop CPUEnv from gdb_exit()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201214153012.12723-1-alex.bennee@linaro.org>
 <20201214153012.12723-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <380799b0-cad1-3a36-0164-365aa80e3dbb@linaro.org>
Date: Wed, 16 Dec 2020 13:55:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214153012.12723-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: WiaHD/9IforK

On 12/14/20 9:30 AM, Alex Bennée wrote:
> gdb_exit() has never needed anything from env and I doubt we are going
> to start now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/gdbstub.h    | 2 +-
>  bsd-user/syscall.c        | 6 +++---
>  gdbstub.c                 | 2 +-
>  linux-user/exit.c         | 2 +-
>  target/arm/arm-semi.c     | 2 +-
>  target/m68k/m68k-semi.c   | 2 +-
>  target/nios2/nios2-semi.c | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
