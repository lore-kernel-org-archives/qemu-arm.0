Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3139139njb;
        Tue, 18 Mar 2025 11:50:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFHesvfRMEWV6yVBJMBHA71bFnPVVcV2SLkKZUjRqxZ9BfbeTVG6WeOaWfTaUmts4lmmFW9tqmTd9htQ==@linaro.org
X-Received: by 2002:a05:600c:3108:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-43d3b9d2632mr26557025e9.19.1742323838848;
        Tue, 18 Mar 2025 11:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742323838; cv=none;
        d=google.com; s=arc-20240605;
        b=KHXyHa+z3MEhAFvq4YUcfY5VMlsbgdHMXVyt/j79cyttPb6IIOp9FgCNEyl/7UxXm+
         P+mINCmTdxUiHg8XfW6H3OWD+V2ARbv5ThOlXwr5wfnUF8ypw9UJyII/d/PmW41RtVcA
         MTI3CljsO0B5y6gITEriVzbOm1GPwUzyCmSdfrTX4PhLTU6gfY91ILJt2UK86yUaX6fG
         DeYPdrdsgNTPkCsEkR/VHST6YSgX8d5bpB+g60aDXIjB84RgISF39x6+v2N1aCtoH3Hd
         N5frcCqAeb9QdKCFJaQ/9iDeGOk2qgOdJnXtDpJFcCWipFA5N3h99qrFPkJS35c0uOk+
         9eCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Pb8edXtU/tnxak4C/Cgcr8vuawSDN9htQBMBeu74gNA=;
        fh=vMfbCljGjzYbsmgsT5vy7Lf8fJe9GycorDjokD5sUkw=;
        b=UfQ4NApuoTAQ1ZMdmwyYF6SDjc/pIkMW7WK01e9V0262n2ALvHbDVEnIG/J/uZzj9V
         Wr2GMFg8jbIiTDdqKfUXrKnb/YN6mqQ+jcvAERalqpNO2TcJcCoka/HPaQ6p0NIT6FM6
         kBc4AQrvxZC8eaXFYoor4XUtveB7VfXcOBRF4mwkn9LYzccFtc/ynhhKYrzViSmsZflA
         HfqX2Zv38g3nz+uaIj6yhNC9DBHb8LzL3UiYpr7DvVIdgBYxte6/5pf7enFBLP9JNxK3
         b+42ytcIUw+jewM94BJhygHI/2/7i51tb0iXmu+I/K/u/npbuQKNcgNEP+GvD0H/CTuo
         rY0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lGLX5xyj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d1ffcc8b0sor34873275e9.7.2025.03.18.11.50.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 11:50:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lGLX5xyj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742323838; x=1742928638; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pb8edXtU/tnxak4C/Cgcr8vuawSDN9htQBMBeu74gNA=;
        b=lGLX5xyjgUK2T8L2/ctYaHV8yJ6e5XZiiKpkHkpvrxSwyXVR08cKFLWgMw1XolbBsV
         C46bZQW4qPs/O/mPal7bQ0w8JoUSP/TLdRkBgfVbahY0ehFekRJbF0BMDrK4g38aTV5+
         enjLrO3gfTdyBaDPoZxBEU4uTiMUC/nprWGFm8mNONZRIEH+n2DFWTOjoKMOzbndUHQ6
         tv3NtU5B99KGA0nhbH6Wb90+O+z3OAvVj9Njok8Lm+QQ/BALG2FK/AqHxnlpiXIfDk7d
         J0HYtRpeHXqey+iu5CoWE7D3hwfrY/C4vWTkZN+C6sjo81QJ/4L/DPgVEdoIZtNb3Nk3
         xAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323838; x=1742928638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb8edXtU/tnxak4C/Cgcr8vuawSDN9htQBMBeu74gNA=;
        b=HbrQLoMqYWf6T1ZB+jh3KBx2lu5A+fduKY45oD6ct+i8/MLKx4eggjQjRjouGXOigG
         dW91xel3szoY9FA7tyMgz6cUCURlIgBCwbLS/ruuwLMuIBOWSG05CZHRQ8twS0VF7QPj
         3NuvcQq0hjUJURgG/3EJ3om/mMHz6LprdMBbbwzf/EGWjs6piWVvSx1dBkCA3wqT5W9V
         CdoncolNqktDPXTPc+joQ3zSZ9JDC6C/dhXZDMPcx5fqwZB3ypGl8FTMA9MsN68BwaRY
         IkQPbOyIh+so0wPl2DB7iheWLeBM3LF3LrVrza7fTd7dxbvkBjkM3uCFjEZ6OAGfSC+w
         bU5g==
X-Forwarded-Encrypted: i=1; AJvYcCXRPlNOOCvm4mKq/Uj5ix0fR3oUMmBmkOe7Td4jP3WukKTkfzS8ngoxhCdH746a0MvHfrNXeqX7PQGrmA==@linaro.org
X-Gm-Message-State: AOJu0Yx9xT7Bc4Aiy7wTxx1HbYDVQAvreoK0dGecE96w51sD/BLKH75p
	gqeRrZyV3NZefYKQqFFjc8WhUKSfqSGtcWr6DhYZpfF/rEx0Q7g9kP5Um1YcyiRZ8oWTe5U9huH
	kbyE=
X-Gm-Gg: ASbGncugyKFgXfBZRSSkyQHFNMdzUq0GlXgSUFP72cKwZOenL8erID19pXUTpGzBx2x
	gX0amyRsYyfjjAaNfb7j3n3B0El7CgkeWmYiv0opEpTtedCjQW5ahCb4fBU9OkqFQ6k2sp00s6N
	8B2fK9sa+J1igb5AWilX4gVKL9XsoD3wwKcBwKidWQWcP5Z4K/t/JqTKnOfOZjkbe7XQ1HacppC
	K4exQEboSIJOWy/rpfls95Nxb46+509tUailyh4HS3KPjc+WDtbt4a1HS9n+DXgcoVB/236EDTm
	BoRYSWAtbcF1ieOzfQu8ZwykNVgwOarYyOkKw4BqKiDsbZE0OYZvC6Gp1ZWcgy40a1UfNC6e6zE
	j93mUnlktT+zc
X-Google-Smtp-Source: AGHT+IHc6bB1TMekdEnRg8WWvTC5IvU6RseA1FLMd6Is9WRWqk3FY+zcYaKlvS8rTcAwam40KfJI/A==
X-Received: by 2002:a05:600c:138c:b0:43c:eec7:eabb with SMTP id 5b1f17b1804b1-43d3b97f061mr32907705e9.8.1742323838301;
        Tue, 18 Mar 2025 11:50:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe524ccsm142287535e9.0.2025.03.18.11.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 11:50:37 -0700 (PDT)
Message-ID: <a88f54cb-73be-4947-b3be-aa12b120f07e@linaro.org>
Date: Tue, 18 Mar 2025 19:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] target/arm/cpu: define ARM_MAX_VQ once for aarch32
 and aarch64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-10-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250318045125.759259-10-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4iPO9mIEgqly

On 18/3/25 05:51, Pierrick Bouvier wrote:
> This will affect zregs field for aarch32.
> This field is used for MVE and SVE implementations. MVE implementation
> is clipping index value to 0 or 1 for zregs[*].d[],
> so we should not touch the rest of data in this case anyway.

We should describe why it is safe for migration.

I.e. vmstate_za depends on za_needed() -> SME, not included in 32-bit
cpus, etc.

Should we update target/arm/machine.c in this same patch, or a
preliminary one?

> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.h | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 27a0d4550f2..00f78d64bd8 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -169,11 +169,7 @@ typedef struct ARMGenericTimer {
>    * Align the data for use with TCG host vector operations.
>    */
>   
> -#ifdef TARGET_AARCH64
> -# define ARM_MAX_VQ    16
> -#else
> -# define ARM_MAX_VQ    1
> -#endif
> +#define ARM_MAX_VQ    16
>   
>   typedef struct ARMVectorReg {
>       uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
