Received: by 2002:adf:a309:0:0:0:0:0 with SMTP id c9csp710743wrb;
        Wed, 26 Jun 2019 03:07:38 -0700 (PDT)
X-Received: by 2002:a1c:a00f:: with SMTP id j15mr2279026wme.167.1561543658664;
        Wed, 26 Jun 2019 03:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561543658; cv=none;
        d=google.com; s=arc-20160816;
        b=AqgHI2inR9PSkkHcWxRpOoPEG89Ae2fsDqyC2oAM+iKyEzprdGKUn7R367UCxY7keO
         DTJhgd4i1HQvBxHxdvJ1GhGntbpZ6zsGJSni14NnkLU+U6mP1bsCpft03E9C6m/rCKB7
         q6PHkUtjxNtZDI66MUebJ8Iu5d+ETUbHtupBGeW0d5wol4Yx7I6m1OthoH1TJFs6jOBT
         zHJdA6KzeC66sHQGKsW24AoqZQmVixrGwgYrGgsA3EL4IQWJbLPf0mR7g6eI9MgvVkeC
         RU6zppdeigK5oks68jNK+F2wf1GONcGLB21XqB193ox37aLGUVgwY1nbp98RvVWQPQGn
         QvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=d13CFAs8heXrNe1lEMEAnywPJmbZC2RHpfH/z4Bp+Cg=;
        b=sX7MAeNr4s+4dP/n1MJX3KADLNjNxUikwR2pkxiXEKkWZ8BjvxIjCgujThPNVMiBIG
         vgSePtvKy3JPmYmvfE5KTadBYvfYZv2QWjGvbTaQkVTRAi4XMwkr2KHZVi+Q5QKZIdjj
         3dKXfCyBac+e7q7NWTfT7wcgLNUw3Hv0/I8In9bfD08k+tmoQkeLE0ZMhTKrXtzYgLnj
         wj8HW9bf1ujyeNN0LKo9dpVcHHD1uQqoMrolBSVF2esZiC+XKumsFcB99472uSHtdQYl
         RGFWg9fX0UmkWXDZI1pSvoYqQNtOG4kRoVNHwyENKbzALhrl6eIGqFlAyJntK+SAbr64
         5qTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fUlQR/yC";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m1sor865568wmm.2.2019.06.26.03.07.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Jun 2019 03:07:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fUlQR/yC";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d13CFAs8heXrNe1lEMEAnywPJmbZC2RHpfH/z4Bp+Cg=;
        b=fUlQR/yCzjv9zpDX99mCZl0qkKJ14ozQMrthed/R+cIHiRmZgf6U+5u15BjHwxsd27
         HeqiYLRSPWxK/modB1CoGSfmJoKwsTpc0hJJlBMkvmuqM0wv7J7XTe1W9PaS62odX1Su
         dKkipVqymtpCNHr1Yl5pZFX2lx4V1J6RfAKY4BNJt9hrltOlVPcC4UMw4QoKtwim/UqV
         sU/sNRIWWfVJe2dP76COWlmq/BbSLRI9wRVWJCZEi3qhHnpalfWa6XdsxlR868YUibzU
         n2G8Hee2VG7sbYI3dss7f/XJo7JrCO9EUh/hNV+r1dU5HjhfRzLoZWeU2PsqVd2+qplF
         oqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d13CFAs8heXrNe1lEMEAnywPJmbZC2RHpfH/z4Bp+Cg=;
        b=GyVZwuYZ6jq5d45wCm6kpwosnyKdhV9ikVjj8kZRc/IcIavXtkypYhFppxP+lTICv4
         Df88t689bjsmW5I2b0pQLikpGO12y8PnMWEp6WryJX6lPED94TU8PAItKIMWD2ShrI6A
         zLaEvrKRtIsICkqYMngc/WMF1MLnQ1bK5s2vBcJDfKgZPc+48y8P30BD2+2LeyGm68Fo
         5No856+uk4hFE3siI6bk0eVyWNcT2IavrjFNqeUFf40pvzBJhhPJ7Ggu9/lJhQ8z8BQ5
         010BhFoTEiLZvqwTFn4RrrJGhISKDvpFXxieIT7KszqlP4rkO0Pd7Aa55qx0Q0XEhnaa
         cRdw==
X-Gm-Message-State: APjAAAWBdobPy4HcEUViaN4FcAj+1+zeXG97CVkYas4aM1QDmBf7Q22S
	xjYbHgpuSWKEpdgjoekXBNqYcvnv
X-Google-Smtp-Source: APXvYqyLaAs5XqQSGQhJNLMdFFpYV107oBZt5JWJ52BPC+hkq8GO8dOFUmtP8BSoIyjhGTh+jx8DQw==
X-Received: by 2002:a7b:c766:: with SMTP id x6mr2239722wmk.40.1561543658321;
        Wed, 26 Jun 2019 03:07:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id 32sm32360886wra.35.2019.06.26.03.07.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 03:07:37 -0700 (PDT)
Subject: Re: [PATCH v2 05/14] target/arm/helper: zcr: Add build bug next to
 value range assumption
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <07f6fb25-daf2-4429-49c8-7aefb2cde7ae@linaro.org>
Date: Wed, 26 Jun 2019 12:07:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-6-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 8eqtP0z3t0Lc

On 6/21/19 6:34 PM, Andrew Jones wrote:
> Suggested-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index df4276f5f6ca..edba94004e0b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5319,6 +5319,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      int new_len;
>  
>      /* Bits other than [3:0] are RAZ/WI.  */
> +    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
>      raw_write(env, ri, value & 0xf);
>  

Re down-thread conversation, I think this is the nice easy way to make sure
that the 0xf is modified if we ever decide to support larger vectors.

I *think* that we could write ARM_MAX_VQ - 1 here, but I'm pretty sure there
are a few other places where we assume that we only need 4 bits to store this
value.  Anyway, we'd definitely need to audit the code to allow ARM_MAX_VQ to
change.


r~
