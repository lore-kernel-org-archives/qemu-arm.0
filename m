Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp4592774wrb;
        Wed, 10 Jul 2019 00:15:47 -0700 (PDT)
X-Received: by 2002:a54:4f09:: with SMTP id e9mr677120oiy.89.1562742947779;
        Wed, 10 Jul 2019 00:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562742947; cv=none;
        d=google.com; s=arc-20160816;
        b=CF3hfhO+dbtrxxX4CWuTf0fOqltqal7n2Lz9LRRfYVJltjisvNZ9VTMo6cbBg/8qRk
         V2COWLd/Ys3s6WyFjQe7exFHkxIDv5ggaMDoS/iwKlJPrUkFTp5/jPguQHxOhsCJ4TXJ
         ONi5Z8jbL5VyLRcGWhX/gTBSu5+HVKas9v8/K2RWPJsuPF6W0hbDY1jsNNAEq4CVIi+h
         S7f9wBgfUjotM4GYI+nUrHyEULMnoIN/gALf/MBMN+UYkB3gj+O53wRND1U2JilEqZ5A
         yOb5rcqc70x9+V1g1fCPBa8WyexLRvadCmeEURb8THbVbE6GH2XzWG+3KuAzple+ZEqN
         6U1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=A2QhuxE+PKanxB2fnz1KZf4nLuqSSG0BPKCsBfK4o/s=;
        b=upRWGPkNiRnQIIZZ4ZTRi/90BYocE4snYQIvdrp0K1wUMeTJ50V75ggm/Tx5wh4SsN
         zNsoUCoMBO4WpzQtaqAYaqTbRUKcc2LHzLjcVuDVDuDaPKGGgzMlhTLAN25EsgCcHPU9
         uooNdoL06Foh2fN68vZbe8nN6TtZ0MAsGXY7Nkf61KiSGEe4nGKuREnv7rlq8qakqaTH
         oiLRyabboV7r2/plJ6FhgYoWGmCWCJ8wG055X6oqXcKgSDtcG8lg7tV6UhvG8wZsN6V/
         L0m4sEenpafOguimPc9rwzP35o3T5KYjcyO4F9MTGDdzHFFdFSWz6Zlu9GaCrE3cB1ci
         duKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lus2BUgg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n23sor632786otj.70.2019.07.10.00.15.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jul 2019 00:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lus2BUgg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A2QhuxE+PKanxB2fnz1KZf4nLuqSSG0BPKCsBfK4o/s=;
        b=Lus2BUggxbCfesyMXznqhK1nmZvrUbXQ68qhjUlK5FdTjictszwCGS1ZStiSQ+OWwE
         zlnHft6q0ujBHaL6+0ZRwhUmVx6cVuZjvs5FDRZif8Br+dXuwT1AhALbF9L5kRgbkE6R
         EVZZ7Oq+liw/7arX0LRpEb0UKELsPRkLJSVHP4q9a7J4bXOaKB9Gmgjlx9r++qKzC/Fo
         g1g2DnfNgZ6UZQzhzWM37feu9Ih9+gijMIMImMBDky+IMmyC6HmXwnf5wom4xh5xN8ZH
         MyxV+D4/N/rOgxnqJZaVdJIeePFDQBTyVsBaqhDYYCEq+Ehl8I6liQoTAeCRBMJZy/Yz
         4SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A2QhuxE+PKanxB2fnz1KZf4nLuqSSG0BPKCsBfK4o/s=;
        b=MRE2uI8NLwVq3gVMW5qhMwK6JoxYP66vTXp5gVPpogNNa1PEzh1LP/7oLdIDQsNTuP
         e6dceAK1MEo6nXT79M+nPXfXBiuA4F807lC13p7CsUtWtTflw0hDIj43/dxNQTGw4Ace
         B7lWN4pIW5hrpG0uKyw4RIuA9Nl3Y8xwSbAKlUUBSB5U6DMQmpoo8wodBCudfv3J4Fjf
         Vt+Ylv/D/j1n70DwowFT5suqGAmwrWGhEOag7E7cDSXR+DC02FSpSYYEvo/XCRD2FTXd
         XXkHi3VM4VY0Y+/eMQ/s9cLEFrhLe6F5DuUVXCm2tpn/sHgh00WBjNrK5QQ5wc1BPld/
         uN1A==
X-Gm-Message-State: APjAAAVAzOTv8YZqRwsnH/x96n26tNgHEMegryNigpg4mPtXUJ+j8G5b
	YR87wvoB2rvuK0R+ATVZ/loOT7ND
X-Google-Smtp-Source: APXvYqwBmhI+46eMXoj/+0L7aGLaT4RWepZWkZ5OMkcV/XY51pKhgIA95X3qrgIIyjkQQ56U4ORokg==
X-Received: by 2002:a9d:6508:: with SMTP id i8mr22710531otl.355.1562742947337;
        Wed, 10 Jul 2019 00:15:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] ([172.56.7.82])
        by smtp.gmail.com with ESMTPSA id 198sm520866oie.13.2019.07.10.00.15.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 00:15:46 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 5/5] gdbstub: revert to previous set_reg
 behaviour
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 Jon Doron <arilou@gmail.com>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fecd49db-8517-764f-d998-bca7656de8d1@linaro.org>
Date: Wed, 10 Jul 2019 09:15:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705160421.19015-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: lzu10u41z7TP

On 7/5/19 6:04 PM, Alex Bennée wrote:
> The refactoring of handle_set_reg missed the fact we previously had
> responded with an empty packet when we were not using XML based
> protocols. This broke the fallback behaviour for architectures that
> don't have registers defined in QEMU's gdb-xml directory.
> 
> Revert to the previous behaviour and clean up the commentary for what
> is going on.
> 
> Fixes: 62b3320bddd
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Jon Doron <arilou@gmail.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  gdbstub.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
