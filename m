Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1851331wrg;
        Thu, 23 May 2019 08:12:34 -0700 (PDT)
X-Received: by 2002:a1f:30d4:: with SMTP id w203mr1963998vkw.0.1558624354439;
        Thu, 23 May 2019 08:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558624354; cv=none;
        d=google.com; s=arc-20160816;
        b=vpmxj/PUdb2lcGrerPNqj2AI30lMdFNLhvU7k4Dv7WAVbCDfYyNL0VS0enABKUVOyI
         a2WjjiZHSW0ASdHi6jgB53vJ58ik7MINjyMEMI37kt0l0bGxk7sTLuL7AgXWs+AZ1Zoy
         8A1iVtx5UHeCPwpH9+yfB7rbBDxzVV820nttxREjjSRj5TiGJdY4TISOfPSnTQAYktM8
         vzgLsgSRGDtYJxcXE5ysZs4yYbyIp5PXxRNngYh2hhBl8/Y0NfnHRcfMmgBb6gZFS5Cz
         4bfMdKjOvzj8t1taAOC3eesEuEmerEEggTOkvnDZlwJLYVAL9hlh2Lr/m482GnCznY4b
         l9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=wC3UR6u8dZDnh7XynwOzXaqOC8XFwBxoBcdv7qIHYfE=;
        b=WMIUpjVCGreZvd7XtYbwnlhnPIbM3J167xdONNxXgLmhm37D4pKNDD5G4BJZie8rxn
         odjtp+Vc5sgYMyAc7w+pFjmlNPW+kTbY2CwaxcQhjWsdOI+qP1WSPDTXKzzHFX6gFbNQ
         zMCIqbZDu+iCML4aJmbVAaly+fk7vwbC9pKxjdm0eVeZUhv0//kgoyNhfY8z5oDtfjUC
         WlEw6zvXwwM9tjTIZB1cCypr8/KW9dVLzumjMvtcOPy0XRLwOWvrhTqdo8AY7VkAQ/o5
         v8o4SvGWIVuh2HCUXBFgiGYQZ0S86f7o9Mb/fK7RkQy7XPReF7bdG7Yh2de/WpF9yc0t
         CdGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HMLIUHgJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t5sor6504804vso.105.2019.05.23.08.12.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 May 2019 08:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HMLIUHgJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wC3UR6u8dZDnh7XynwOzXaqOC8XFwBxoBcdv7qIHYfE=;
        b=HMLIUHgJih2oVMi2BlQb+ltJN/RC4l5uklDdKiGnrBr4vmtEeiQrMGfwOSmXJ18ONX
         3/aSi6uZE38niukwdpXCqFi94JX4Gw6/oBYEklMSuNUEMeTVhX1OEKOUQvi+mXSChd35
         4jn5Winh9cZTBSVWPTTFA5f9IlERokcFiVDUt7WlT/Gkepp6zqEijIYNj396Kh+vuJ7L
         AGlxf+v4kHO2HW3ZkmcpRmNmRy1AtWi0qWi1/hU7aLfrbAlCBnhboWDe7TMPKQsJXSZ3
         jmrEe9mHJknjhlnPHsgNnCVaBZ+EbIqvdPkgOUNvQm48jA9DfEkNHKkTnMx7jxF9pk48
         8KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wC3UR6u8dZDnh7XynwOzXaqOC8XFwBxoBcdv7qIHYfE=;
        b=HYdGel6mZsxk839hGI++BeNKv1z0/yKt71p/vuGqrjoD7Dw6S+OZijlP+kWIqLv6tY
         COH6mbuEa7T6jMglRkT/FrDTZqm9CEpXsLdfmjNCPPUClVqxidtu1zCyhCoofig3sCEt
         QgX6epvd04V7rySoktsdb8k0J9UGVs68wUlgw08POjwbfx+QwLrv5HbTOYGjYLuKI3hA
         RyFnKrVQp1bVAWlCoaLvIlx/w0jJfCWkkqdxOiqfduA/8MJ0/TKTQOBgdJxyPf+CTAu8
         lRvioKrHpEB0x/+dI2xzE6a2ixbuiAo2x+Fq4vAppQpojbIUvQ+NyKXH3HDbPIl1f8Hj
         Mvww==
X-Gm-Message-State: APjAAAW1bzc4TGpJD8LRxlyfJCduT29pbPtXixO8zh5K214lF0sqSMfs
	lrEZYU1PLhgUByT771Z7kN7Y4Csf
X-Google-Smtp-Source: APXvYqw33ySFh92vOl0HjHAeIoMUhaFTBZCqbcBmpDxH4I+bv7tGDEiHjhX1LMrO79HwjfH4K/ysEg==
X-Received: by 2002:a05:6102:1c7:: with SMTP id s7mr31887879vsq.136.1558624353876;
        Thu, 23 May 2019 08:12:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] (ip-173-130-215-183.orldfl.spcsdns.net. [173.130.215.183])
        by smtp.gmail.com with ESMTPSA id 143sm13796557vkj.44.2019.05.23.08.12.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 08:12:33 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 01/28] semihosting: move semihosting
 configuration into its own directory
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e6c89c18-48df-c85d-39a4-2299f1026cf4@linaro.org>
Date: Thu, 23 May 2019 11:12:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523102532.10486-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: GAv9rNh+sqCu

On 5/23/19 6:25 AM, Alex Bennée wrote:
> In preparation for having some more common semihosting code let's
> excise the current config magic from vl.c into its own file. We shall
> later add more conditionals to the build configurations so we can
> avoid building this if we don't need it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
