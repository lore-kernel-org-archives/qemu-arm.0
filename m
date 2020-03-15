Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2059368lfc;
        Sun, 15 Mar 2020 11:57:05 -0700 (PDT)
X-Received: by 2002:a63:6a49:: with SMTP id f70mr22051378pgc.246.1584298625112;
        Sun, 15 Mar 2020 11:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584298625; cv=none;
        d=google.com; s=arc-20160816;
        b=HoxeQtExmuzrmlsxKlr9e3p3puinSFGp3W7+DLBEqhzghERf94vUUCgxjG8HFMAkLu
         Mc2NQm50vSzJWeUBbD15Hug/S8ayuCK2e+pGsnbNE4k7rHKXP5gRekhjLeWt7YAxwIuw
         HnEF+mWOOSqR8N8yRzymXuOY0PLhMn3YVyafv6XQKSvwHSeEd9FGX2cl+q97tR1FLWn/
         IliQ7TEfbpEdX1Q1CvWNogYEhdAIxYL0esoHBQK+h/W45ko/pRW69HnE1QNoaiBZowgy
         /lQ1KrSPtK/YTh8zr0VmWL83VT4lE/4FHOk1SnurVJfcfpw+0KHYcQl60i4dMgkOFqW9
         W6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=PDtmTCwcPEgm4OuieYeOqkSBuA6jPU6r2b5Kj3wu1oM=;
        b=MxG6eHRi8vJb4FNNe9YoTBJCFQoF/aWWz0+Ucth46WN5PsxAFY3xHAkzQi54xyaEEL
         KGCoPNmLKD7adsa+DocLsIzgukiS1qJX+aQyNPiP5pEBy7Ln6xJdvBro6KEXqlV9nDDK
         FyCT4v1xM34OXEpyzTqzVk/U+yTMh8dF77PcsQ/0upzg4ftwJRZhKrQMlHjeKTexWmR4
         eR3pnIR/NYog1CajLmzTSMDItGUICqHkSZ4DKJHsD91PHMyj+zm5RClgXY92yAgAKI7N
         2GAQsjnv/SbpcVRR6jv7HaCL4sMT3tc0VX+PnxkPN/qFNrsgkqpXl+iFOqo4BEEdUjYc
         U1sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pUth1/9n";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r6sor18241632pgm.2.2020.03.15.11.57.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 11:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pUth1/9n";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PDtmTCwcPEgm4OuieYeOqkSBuA6jPU6r2b5Kj3wu1oM=;
        b=pUth1/9ncBfCYN6YqlK+vmtXviBb6Ab5lbPEN4ngphVZyRlUZZcPSf4IG33YFUV95O
         0Zn+nMcNcwIW7R5qlREXKG6biuBjhrdQa2CVdfj6sbcbAmradtXSLj0tz7c3XscM/vMP
         wsfgMJ+zHeeuEYkTzLVU1fpFCvBGEURJ6RJ6DiU5zW9iQR4rAHgd1tmxCz5mNUaruyNt
         gaEhXafLE53+gGWR0l4xxK8n6dqMAuBcZCTlW19I+gJBP5my039QrNbgAk8+RdshCXVJ
         o/HLtFUPGVM74xjlxBCDMU37+XzruIZspKxkcUKFxk0346bfi4eZhhwuFBDaRgeeDD+d
         Y+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PDtmTCwcPEgm4OuieYeOqkSBuA6jPU6r2b5Kj3wu1oM=;
        b=mKZ4N3ZBcIXk7ENlLuZAKah1UI9sN04rJrU3sEJGXMsVyZPTAjv6DGBC1+/jN1n46Q
         tGmIg8mUajXeHkEvkUfyEQxaQk4KfxvJWagCVN5mZ2xV63qZPFM2pM0uel/M2dcGJ182
         MBVJn/ByOCX4uFwY5rFMbqZc1YTImPhwmn0RVUx/M3ZqyywsBYZlNZ761NSP76fhtbln
         RqmP9+VsTLrCZMQAOwU1ek+G4PhaOoTuNCWJ4xI0e32c+USUmMdgiVCXCjNDWC3SWw1/
         hzuleF7694pKTZGb5dW+0o6pkzGT/oXVeHcM7dj6VhjNsHLHNPN129ERp5QngdBvm/4/
         X7hQ==
X-Gm-Message-State: ANhLgQ0UvjSvwNf37TEtPPZHgS+l6Nv6GLmHblno4FFZKTb1lZIVRnw1
	KmEkIUoRNfcDXVJXn2ct733crpN7
X-Google-Smtp-Source: ADFU+vsTr5M+ef7X/zSRhKhoSQ/0bU2ZQ8EIWwuFuxsb7Qgf6/xLgdzo/Fxd5aM033NPbk69mtkWXw==
X-Received: by 2002:a63:161e:: with SMTP id w30mr23216111pgl.110.1584298624662;
        Sun, 15 Mar 2020 11:57:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id x11sm63955419pfn.53.2020.03.15.11.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 11:57:04 -0700 (PDT)
Subject: Re: [PATCH 03/14] tests/Makefile: Only display TCG-related tests when
 TCG is available
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b3eb94cb-7cf4-2cfb-8eb5-ca1204c2be61@linaro.org>
Date: Sun, 15 Mar 2020 11:57:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: AkoPMO7iexEL

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/Makefile.include | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
