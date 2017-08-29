Received: by 10.223.188.70 with SMTP id a6csp6070951wrh;
        Tue, 29 Aug 2017 07:51:52 -0700 (PDT)
X-Received: by 10.84.175.195 with SMTP id t61mr761776plb.240.1504018312285;
        Tue, 29 Aug 2017 07:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504018312; cv=none;
        d=google.com; s=arc-20160816;
        b=sS32tDacNAqXTCwIyyMYR+cQ6/MAl/AvkgWa7pZMoIf1PFm8+Q8QViTq8VPUy2un91
         gRHMhLCx60We/JF1cXL3kK4dyvxWfhrZt8un3XAZLdHaQIJtazKQwZ8VUl4CL9pzQqAC
         7vpVlkAlv9hqMEaFa2ScHOsP9wRHASPe5Ndkox7xB4+/ReujerGao/X2F4s8EOhcjxzx
         0olqZFIKP73dkO86eZ0H0epuzVdRA9sLKaYA4Ef8ppHQzgM+oL/thmv0qtrZTjic1vGT
         I+AYr6P0qhA3h5SKPsDSGZr2DyqtmKXDEM2BExXwYdHnmUQHvJo04UtJr7yfD0UOddXu
         im7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=thpuyTi89PF/MxBd8Kqwj95uNLxUhqR4tu6B8ByJmxU=;
        b=vOp/9YaHkQnzX+IFP83jgyL2hWAmltm3BnoqyakpHSXNAp9gA2Unt4dTg7hwtj5c+d
         +CY6xLNDqHfSnQZo6akpFYnN4XDXtbGnJeANos1GMl2VBmdAfiokmZl5lYvX/OxnwQxp
         8csOLOXXvMNvhOZFDbg9M02EKixW4K64VRCYw6FxX3KkxwpaPdd1LDvAznMp9EjEwiZs
         byVwaBm8Lz4NSbUiuHN2QcN+beUHp8Z5MrdDQ2JO9ArIDhtgIU2CG9liDD8Yar7ZFI8l
         0ik3Sf8r2INC/xBVGj++dXIjACFD1/UwquzcPyvEQuCxxkYDOA1KaGeX1ygBumPe22fU
         rkhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dBRbL7TR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t195sor1944715pgc.75.2017.08.29.07.51.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Aug 2017 07:51:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dBRbL7TR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=thpuyTi89PF/MxBd8Kqwj95uNLxUhqR4tu6B8ByJmxU=;
        b=dBRbL7TR6FgrW2FZbdmwL30Hf3oHd+y7UIt0YMaFBSkPvlXF8hd23ZvNsI30ayDomb
         6OQg0gAP6o0aKx42f6X60yzcv/tGSIef4HabEp9ApxGs2CKy7TStQCtSiNBulFKYHTQd
         V9Kq7HLiyvvs3meoai5/Fc0+y9XeGmwDs/2BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=thpuyTi89PF/MxBd8Kqwj95uNLxUhqR4tu6B8ByJmxU=;
        b=dpQBfNrOvksPwVKjGlUOs4+WGzMQD35hDI69OusuHtQIwiz6WV/2va3mnLHD1NX3ux
         T3ce50mYAWlyZU9ePJgjkkuW/e6G9CM0epEz9iRH2BCb384A1Ve1RIkLwSVoPVbTU8d4
         1sKczE69as//SbIBhwo1bvyl6gtunnp5eMJjwpTA/ELtjsvWPonFOn1BEyGX162DBDww
         QU0tMJ/F7iAvZi3CLJKvAI0ZzVKDRyx7T8RFK9gk1c0piYJIJSU1aSiD8WCtENtmROXV
         mXQO1CKp9ylMjT8k3b7vkCXRbqand1gzn9lBgvmW9B016+J2OVEQ8mg0KzkexVG/bbsD
         CaiA==
X-Gm-Message-State: AHYfb5hJr1EIkAh6jVRdKur4lA/aZskHrbpGNtBcNlnM2BvpXla5cS2x
	vV8zz9igZ13X3tqGUZY=
X-Received: by 10.99.67.130 with SMTP id q124mr555170pga.73.1504018311734;
        Tue, 29 Aug 2017 07:51:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id s81sm5752498pfg.78.2017.08.29.07.51.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Aug 2017 07:51:50 -0700 (PDT)
Subject: Re: [RFC v3 PATCH 3/5] mttcg: Add tcg target default memory ordering
To: Pranith Kumar <bobby.prani@gmail.com>, alex.bennee@linaro.org,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
 "open list:AArch64 target" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: pbonzini@redhat.com
References: <20170829063313.10237-1-bobby.prani@gmail.com>
 <20170829063313.10237-3-bobby.prani@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ad72a04-83d2-8db8-2375-0380642cbd66@linaro.org>
Date: Tue, 29 Aug 2017 07:51:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170829063313.10237-3-bobby.prani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: WYhD4DDQ2Luq

On 08/28/2017 11:33 PM, Pranith Kumar wrote:
> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
> ---
>  tcg/aarch64/tcg-target.h | 2 ++
>  tcg/arm/tcg-target.h     | 2 ++
>  tcg/ia64/tcg-target.h    | 2 ++
>  tcg/mips/tcg-target.h    | 2 ++
>  tcg/ppc/tcg-target.h     | 2 ++
>  tcg/s390/tcg-target.h    | 2 ++
>  tcg/sparc/tcg-target.h   | 2 ++
>  7 files changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
