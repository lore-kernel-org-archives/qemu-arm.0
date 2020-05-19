Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp4427258lfb;
        Tue, 19 May 2020 14:42:25 -0700 (PDT)
X-Received: by 2002:a63:da10:: with SMTP id c16mr1164046pgh.208.1589924545069;
        Tue, 19 May 2020 14:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589924545; cv=none;
        d=google.com; s=arc-20160816;
        b=BWmJW1vNenE/G2RVeQ/7Mj2p6LicFTcLjDXA+JOd3GKqs7Fwe1kT6zKSRKcQNwozdc
         2LNWpHAeVfziyR4xpIkJPcrnsvOo996GiQosjm7i9Ti+eXeAVZlRAn/Wl82pow1mW7FF
         n237E0JxC6J3ueSdJR374Wbzvyr5qeOmp7DouGip6HxdTBLCy8B82cJglWdzEBR3gtdx
         0e5aSJ1tCLkOY3UsIBKfsRpWp68oqw4Lt7ntMBmXSddrFZA1HSWD9ssMfw9LsnEdFeZe
         SNB1YZRyRWCbpBxDgLXISN4DKr0KuuxBqeljd0uaRxWsGvk5T1Jmr9+q0tv26aI73+5L
         Di/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=nw6O/vTT+E8Mxtuq9SAx4g0rj9wiZLc+1sIiGwNLVkA=;
        b=cc+IuPHHortEicbnr6sMz/JMAb1j7DTsbbXJqm3hhrStVaWWI6RnUhRJRcwIbNBHvb
         TOfxLd1ReCyGKfxZz17PIBKtdYpY4n/2vn7+EvS+yRl5j1MvczN/rJsKZL3mUwD62LSK
         lIEW3gWUM+5rYK4EDyiHC+wOI5/kZDLmfv2gwloqIsI3FTSNi/XXsTXAPC1HYTIJnF55
         S3tyH4OvLH2JwfAF2ZScSfiRSgAODx4hhveI3M24+pe3eYxX/rnOGOpzNX08cjA+U1j0
         6HovUHY5KyrmXtEF59cGlhvJ/5EeOnXi3xO1rxprEopw53R63x93/3lRp65pYE5Q23W4
         AFDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R0aa1j7W;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v23sor1461540pga.2.2020.05.19.14.42.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 May 2020 14:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R0aa1j7W;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nw6O/vTT+E8Mxtuq9SAx4g0rj9wiZLc+1sIiGwNLVkA=;
        b=R0aa1j7WkOY2GiiHQX+/mXzmvb7PlqA7REwJ59dpfjz0wH2HVMoyX9Z0ndpUXuHK+Q
         /KWjZVitCqxCcveFVsyxWV/sYCuTwTijV4RL0JGZw0XPgKjWOIk9VSRBh85osFWB+J3l
         VEW0UhmXn8xZjsfK5tcyIClZCOuoWjOk7wfU90bTbt7qKEqmgAOa77runt4l+R/G7DjO
         wMcjHx4kk5DG2nnI5DTJJ315ZiO9WjO454KIehB4oV1uxZHA8X+PNwX0RkayewQP9NxS
         rRzQZfo1I5kYj7kBiNKCFK4uKoR+szMThqGoiMiQ6+lE45SnogQFl+oZUYcCqbxT5RVQ
         IPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nw6O/vTT+E8Mxtuq9SAx4g0rj9wiZLc+1sIiGwNLVkA=;
        b=QyDSJu0ZQlH3KOpLLSdFXUC/sBKZ7CtjgVs45E3hXNxscsFCO7gTaXysfrK+nBKKqu
         l+UZ1bVLHGhmmPu1vXzJ01kxhSiFgNyhTaD0TkmYczm4S//opZYK07V/zKvBNR9QBhFG
         0ow0cmql3dX3ZJTw/m2avpCYm35enB/+5pNs3L9JeNZe88OJ7doFF4zpzAeB6da8KBpk
         2oB6tY/0md1Mh2IGV51PwB270Kor4hTaudsh5dn+7x1RSaV1II/SW+iy8/hmUupPaHA8
         MHU/1ft7aEDwHBuCum92VcQQVOURVJb01BWML2d5QQOenWEb+HbZ398ImGFNuBBx1FTi
         Aq5g==
X-Gm-Message-State: AOAM533g+cP0GHfDKOxfA8I1huyOZfQ+6isb9w55SsG4MFfqk8BF4Z0e
	21c+PmM0qGSRqsn7XNrA3I6FKpxl
X-Google-Smtp-Source: ABdhPJxnavV4hRyjr6rJbh9w41mz0XHfZeDzrjVDcsA4BK6TEInttraXpc0uqBFmOxNqZ+dmpunDBw==
X-Received: by 2002:a65:614b:: with SMTP id o11mr1059106pgv.443.1589924544588;
        Tue, 19 May 2020 14:42:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id s102sm379040pjb.57.2020.05.19.14.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 14:42:23 -0700 (PDT)
Subject: Re: [PATCH v2 09/10] Makefile: Allow target-specific optional Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-10-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81f9e132-1709-e67b-9cac-8d7707ad47e3@linaro.org>
Date: Tue, 19 May 2020 14:42:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JVWf1uS5U/1j

On 5/15/20 10:08 AM, Philippe Mathieu-Daudé wrote:
> Allow use of target-specific Kconfig file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
