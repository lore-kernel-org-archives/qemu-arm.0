Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1563547wrp;
        Thu, 19 Sep 2019 15:07:51 -0700 (PDT)
X-Received: by 2002:a17:90a:22b0:: with SMTP id s45mr182791pjc.22.1568930870975;
        Thu, 19 Sep 2019 15:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568930870; cv=none;
        d=google.com; s=arc-20160816;
        b=nsAuliKlFaEz1O6hpBTTS5iE8kv0hHmXljryZSEewDshl2YhdX6cB8CGBugtRkvlTe
         Gyy4BLL/Xh3yOSqoJRyFzpBhyEUmPqY/TEUBUeGsN8VjhHhHeububl0AGj2pPJcprAF6
         h9pY2/f5xg8PG1E9Uig/WOai37aIjFFC4gkU+TAp4u8cCZhV+SaDiVKKMhGsrYbgqjHv
         0f0rMHHCNAGcEusWyZsD4O+8Xu37OZ4YkLL7+jr0gSZZQU6pWyJ+QvrCCaUa9oOA5SyB
         +jkgtjDHsZIaqdVY7+GSpvGo1GSmT7GCgv+Ow5oeoRas6uvPTy/cc5yjm5jpijej0n58
         ENeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=zn109NspYuddncozafqxVjUrrzvHkyw69jS7Iiefkx8=;
        b=VRGBo7C2+GNIlVoNO3zlTuA+bzRcEqN/E3mFEtqVwylp/afh1o2dYsuF/XJTV1db65
         G40xDOGtN/7ofg9O+cQY/g9nydZucSHdi7v08HXgRQc3oEQd+2sDs+rXLoovm5fqo4nv
         rZYiZSKluzEWXlOOk0ISMJqzuFkASPahFBVFO6IKXac4PeDPmlGzuk3EmEbnMhGrghV1
         NKwtOUX/zllPhC3kCYM/j5u23KiKBc6B6fFeNjSMvoo4NWHTz0+O+b41Bcqob5BN5NTE
         Y3Pnjg6lC+XVYfA4t1zhr7MTcWktEmN7rmhl7IcKI51Y8EDaWVeRn8vOsyBSuKQEh0st
         qimw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQsS66C6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o9sor60873plx.57.2019.09.19.15.07.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Sep 2019 15:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQsS66C6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zn109NspYuddncozafqxVjUrrzvHkyw69jS7Iiefkx8=;
        b=UQsS66C6C9IjyVpY7ax8CgvPkPxh+9rJ/eDfBi3NJeyYkDZKVl3B6ibLfCH8W/Uaop
         BVrgOSjQtwUUUEj2VSwBHjHtQN4n6zt1aM7tPmI0lmHJOiUVPj3RLtnEFqvarerJ9/FH
         RSTj/A6keeEsXa5TjmG9VrUbMEpm7NO9ugpR01i8PSNog0hC8VEdDWoTGpcmCRBFqu/R
         AhrQVNqii2W9bZwLKXOXX6dVr01/xIjxEmIKJS5Y8V1ak9MuNz0ik+RVnzuI48Y/XY+W
         D/tyt3u6HGNEolXz921Sm55PlPVWtqreCt6tw2wX2NJq/Fggzk7WTgCgvETFkGDuVpEL
         GsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zn109NspYuddncozafqxVjUrrzvHkyw69jS7Iiefkx8=;
        b=EZlS0IcrfMBsGPimCFYZ1FQQYaJe0ko3RDIH+EaABGLX4s7bfTZDHXPM3k7fL+2qy+
         cLiddHKzgxC09YTIzohGuBWu+gn6NtRxOM8Jgebv6YSfYZu3LwxsKJM8wUpCc++UvKfk
         0902zS7qbWB57Gk+At86QFxlsOl/AY08Fi+BUAjpX2WaSsjQ7mAty+KB8nxASlyMUHCm
         CLm8TYKRVL3bei/1HGyhUO1nCLsSgS6nSco54wDykPww9KYIaxo8qmYTY+Wu20/ZGve0
         OwPEcZd4mc6RolidVeFmSoXgd1HbFlTN6FbITD0NrOLdLmYRF66kdCrbq7Xn4ERKlXZm
         xbJw==
X-Gm-Message-State: APjAAAXzBB2IsO9bDXHKdlmwhQjEV8pYtklkMyo8cv5uuqgneFLhxe9a
	qvoUPlkabCCzW6Xlx6Rf27XBbf59pdgzhg==
X-Google-Smtp-Source: APXvYqwf1+KlV06d6P5/M8Cjx6hnXKuha3OOA6KfrNJC2lfXgemwubSmZrStYOtTs7k6f1Vu/wSjQw==
X-Received: by 2002:a17:902:8b83:: with SMTP id ay3mr12592214plb.32.1568930870441;
        Thu, 19 Sep 2019 15:07:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id x10sm2815pfr.44.2019.09.19.15.07.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 15:07:49 -0700 (PDT)
Subject: Re: [PATCH v2 09/16] tests/tcg: add float_madds test to multiarch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fe7844c1-d34d-0f6c-627d-b3ddf1334dae@linaro.org>
Date: Thu, 19 Sep 2019 15:07:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919171015.12681-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: eEfLGuHzdf8x

On 9/19/19 10:10 AM, Alex Bennée wrote:
> This is a generic floating point multiply and accumulate test for
> single precision floating point values. I've split of the common float
> functions into a helper library so additional tests can use the same
> common code.
> 
> As I don't have references for all architectures I've allowed some
> flexibility for tests to pass without reference files. They can be
> added as we get collect them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - allow tests to add addition patterns to the list
>   - conditional diff-out
>   - use __builtin_fmaf instead of forcing optimisation
>   - use hex floating point definitions and output
> v3
>   - remove add_const stuff, make explicit tests explicit
>   - various style clean-ups
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
