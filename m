Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2372829wrv;
        Thu, 18 Jul 2019 07:58:29 -0700 (PDT)
X-Received: by 2002:a63:b1d:: with SMTP id 29mr48226288pgl.103.1563461909790;
        Thu, 18 Jul 2019 07:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563461909; cv=none;
        d=google.com; s=arc-20160816;
        b=Cz29WKqu5d0C38hOKYfjaybgJO55eidhejpxHggQ5+ojJMlL2VaEtcBFERmyIxjCuJ
         98VhCU7F3TgTywsK+mE2rLsJhKBuLpbx+YNzZ6TAmZ7O4mjh8pc1C3gFYNcP7gbVnL14
         1RqNfgcJAI1L80ZQzspy5Xo86gDaefpa1aDkpXfyHzydMzu6Nd+PyTaPeWeArGTq03sA
         84mugislS4zCLhRofYmgh9UWbbwAFLh4JKxXUlvmDjpTa1jZsWeGEf7Zj4YQW2+ZtxFA
         rPZdXYXC/ZRtDdwE54pE3S65cdt73do91BKR48si6DCJGOvismvTuK84a39oqszkTzfy
         Zizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=TgjiWKnYVhNow5aXdsbc/uRaAI4MYXerKql/FbghhWU=;
        b=WmUkoPS41uXbCjQufbn6QqjWvowrq6NJvoU65CcKVi9+xtuIatyjuFbfsYkzjUQTio
         G60tFiW+gX4cnCsjhbHho/C/SkIEzdD2Ce4LYS53fcRzc3ZmMnVMsUi0MsvVWtkBXScl
         G1U2FlelFTdNvI5grd+E6YN21VLvO0d3rl1WHlGlvPrcVJDPT3d1ZQPwibItw+Hdf++q
         U7uT5MYgiWGCc0ygZzY6F24SIyv3r7eA8dgdSzh8yhBk3WePUkvOJN296gvH/+Io+r6j
         nyZXoQaWcePIXqpNKfhT5kvhvGV8W2ce9as5K3LZu2AnlWKyyPRmg4QxUisjTDTgOHVT
         UHoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gk+9bV+u;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n11sor32943033plg.68.2019.07.18.07.58.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Jul 2019 07:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gk+9bV+u;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TgjiWKnYVhNow5aXdsbc/uRaAI4MYXerKql/FbghhWU=;
        b=Gk+9bV+upaQ1YgstmeYjiwhK8OJvM2Q68ZuapcDbLc4iEOXb9mr3npR4P59nxWi+zE
         sNLk9bRrFA2clzQJmOWgWYfkN34RQnGNumpgU5Y0d7bAbiCGxJ3YMaYaMaOpnLmhhQvG
         hiFjp9NeqkxpcfyA+zvTEGN4u3DTcGPJLcBLhAq0CG9610V8GJbdIMNfNXEVFOJaWly8
         HP7zzsYdxp6X/4zyf/OLvNdORRdBpsPJNj4jFTKVSiOm4D0AcrLVHvEXgDB793ZokSf4
         aDVj84bnzXyI2+KpuZ58r2fmNvyAR4jGmnh8V2XEjSG7Y/+DC6ZXgyX9dCnNIZc/ENpD
         d7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TgjiWKnYVhNow5aXdsbc/uRaAI4MYXerKql/FbghhWU=;
        b=Umf+MnaJNztJ03dGCfn7A4M/6CMGwK16cYjqDWMRRaG2Qf/9bMJIltdgLpHFASpNbS
         5vkd3X/vhE3W5wk1Xq60eYmZymZEBNWeuDmwZfeNzIk6QXf5JHd+RfBGYI/NQZSQWJwF
         7NyJW1hSOSnGkRntDwGXlh4Eu9BVSQkE8pFBtBecIqGW5FxBJorHDVBqciYH/E/flO1a
         HvIFpWjkKjBO7V9aKAkqre2dgIIi0wmxegi4syjyuhcjjf0YJMNFgT8XiM+ASjglctz3
         lYoWIcOlNFnWdW6jiPmQS9GNI+5ciDzCFBOciuYvcFx6P+oMbqTD+g2khjKkc/Pm2nOh
         TgDA==
X-Gm-Message-State: APjAAAWEFLsMjW8Canv0KEhnYtcK99XOgScSjzzGfVKvXjZ4Y3O0IBNm
	hmibTmhsy2lNzeMUKEbfeO6gjmBUdYgPJg==
X-Google-Smtp-Source: APXvYqxTBR2lbuJeeNk0ACGX2TgvYzf9zUcFi4VAYQKmXcMZSptDP1Sb1aVngks/y1+7tqEpIUkaog==
X-Received: by 2002:a17:902:a607:: with SMTP id u7mr50899107plq.43.1563461908878;
        Thu, 18 Jul 2019 07:58:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-176-6.tukw.qwest.net. [97.113.176.6])
        by smtp.gmail.com with ESMTPSA id c130sm26785693pfc.184.2019.07.18.07.58.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 07:58:28 -0700 (PDT)
Subject: Re: [PATCH for-4.1] target/arm: Limit ID register assertions to TCG
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190718125928.20147-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3b7e18bf-5450-3246-137f-9bc694edc17b@linaro.org>
Date: Thu, 18 Jul 2019 07:58:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718125928.20147-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: PhlzzwKyyJMN

On 7/18/19 5:59 AM, Peter Maydell wrote:
> In arm_cpu_realizefn() we make several assertions about the values of
> guest ID registers:
>  * if the CPU provides AArch32 v7VE or better it must advertise the
>    ARM_DIV feature
>  * if the CPU provides AArch32 A-profile v6 or better it must
>    advertise the Jazelle feature
> 
> These are essentially consistency checks that our ID register
> specifications in cpu.c didn't accidentally miss out a feature,
> because increasingly the TCG emulation gates features on the values
> in ID registers rather than using old-style checks of ARM_FEATURE_FOO
> bits.
> 
> Unfortunately, these asserts can cause problems if we're running KVM,
> because in that case we don't control the values of the ID registers
> -- we read them from the host kernel.  In particular, if the host
> kernel is older than 4.15 then it doesn't expose the ID registers via
> the KVM_GET_ONE_REG ioctl, and we set up dummy values for some
> registers and leave the rest at zero.  (See the comment in
> target/arm/kvm64.c kvm_arm_get_host_cpu_features().) This set of
> dummy values is not sufficient to pass our assertions, and so on
> those kernels running an AArch32 guest on AArch64 will assert.
> 
> We could provide a more sophisticated set of dummy ID registers in
> this case, but that still leaves the possibility of a host CPU which
> reports bogus ID register values that would cause us to assert.  It's
> more robust to only do these ID register checks if we're using TCG,
> as that is the only case where this is truly a QEMU code bug.
> 
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1830864
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Laszlo, would you mind testing this on your setup? I don't have
> a system with an old enough kernel to trigger the assert. (The
> change is pretty much a "has to work" one though :-))

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
