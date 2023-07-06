Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4178823ejy;
        Thu, 6 Jul 2023 03:27:37 -0700 (PDT)
X-Received: by 2002:aa7:c654:0:b0:51e:1af0:3a90 with SMTP id z20-20020aa7c654000000b0051e1af03a90mr1289260edr.37.1688639257248;
        Thu, 06 Jul 2023 03:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688639257; cv=none;
        d=google.com; s=arc-20160816;
        b=lr1Gr/zpLno3Az0yRKXtYSruhC+15WPo/mbsaMAR377TXDK+5SNlWEehHFVk+LFpH+
         Uxq3F//gkPHPTnRjeuMAi51yLwBDkhVNi/jDBEMd3gOU3KrL5JJEsFYca6YmKwj+8ElK
         9yDbrcRogkiRlWxVtMmZIHZjGF3BZMCfGREkOKdKipKSqYI5EQ+IzqIpcM45pIn1WENU
         iPbMIM+HnmdPY8V72/6ozLibRKNQTtui2AjGX8f54IlFprY3EA2pi+ti9H0HoXl8qKf8
         4CrHYZJEIS0OzWwerBtBDs2ig1moSNR//1fV6Daqix8nzMfdRWYxtptOjg6k4ljTFrbT
         uNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TjI5VncEJUo131PC1BdfMM1kZk+v4da39H8MLcFrQag=;
        fh=tDxx41Tih1V/d5KDeQ4fYywVQ3l4fbvfCAHNYXgcdmI=;
        b=T+xOcNuBgO+1jbrgTKEHHp+XUUarDX2wEkaXPNo4cBIYhybbN/1H3mcXYbQzzZE/sv
         +2DOjWWhZ8kfC0NNyWXUA+OKn7/C7ABfnpahD0lB6XwwLT+IT2gcb8Z3qYJcGiLYj0dd
         B0zj5aS5lt4Na8JKBvHc0s5JD7kvKhJ8RfhtdLY3eLDpVN07KpOdfHFo0FPRXRvZRhBn
         Z/ycKuVB/0xJpL+OUoPM8o/mQw6wDCGIkDWUwu44AADQykIXupnt1DSVQinc+eQejx82
         GaytM3JLaknAak/YANLIQ26cOI3lzk1K/5Etjh29gBE1vQ1e5c+fH5t5jJvRuzY5KBIj
         xmxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QOpc0g+i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g10-20020a50d0ca000000b0051e24fa1640sor433794edf.5.2023.07.06.03.27.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Jul 2023 03:27:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QOpc0g+i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688639257; x=1691231257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjI5VncEJUo131PC1BdfMM1kZk+v4da39H8MLcFrQag=;
        b=QOpc0g+iGdf+RTxPB4yMSBchXmqviaoFQrimRwvWWCJ9bdsOL4ntqKaJtll1tyqoa+
         QiLFcMm2ZgEOejCw/sVbK4/YVurHCJ03PaApn1hp73inF4nkF9sf8441IDAuKb/82diO
         PhS7+ApY3hzTc/WEn4iqdxBQ2TWpRTnMB2VFCPSok7hgXyM2F9cYWvDCH7MyvTZHnOd8
         wGSmvJCUWCYcjnGlwUYdMYxlgm/4IPZhQYuKH+ZQ3tS4kqtMa0ePVHpVdqNmSxmMlbw0
         NIPSLFkJ3iOy+Y1u3biRqIyVVZp2sFLsixSN+yNkYGR7Q4JL7gF9NrIuhUz4eST7n48I
         yXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688639257; x=1691231257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjI5VncEJUo131PC1BdfMM1kZk+v4da39H8MLcFrQag=;
        b=Ethq+y5T0MKpVME0OFA2cZTXi9noUnck7fMgr7/3xnUy4/bOPgL6sQMmM5gTdCGCyW
         p36Vsp4gSDWU9uTZTiDN1VTOQ1yJ5ZvZpK8Ar7hJjwKKwoMj41OEkweQjg/B4tgjA4sX
         sf7qqqhtXRl2TBJ7C00/ufton33h790UGWDrystxzSzF4ixE1S9SiYsWUk/7LADkIDoe
         tcibXfsVgQwtcX0cJLnXwilyeIuukJpP2XxDR2uwVTPi9erRsko1jL/hAADGMrp7lTlV
         4P3fshm+o/nE0Og0+KGfjByzQGjWkOMmunx1sHeCJGzUPxADayH3AzFVlEjdlTV2UYID
         MrYQ==
X-Gm-Message-State: ABy/qLY1HqxaNPLrf+Q06h9JiF1ZhTC/MiW+Zo2+fT1rFLWoHx2y+nmw
	IPyL7rwy8KZNX5mwsv4tDNskpOTg
X-Google-Smtp-Source: APBJJlGPjYL0hxBofJhy+PuqZnONHGPqgm66Q/cu1PD5WUCJ3P5SRdkVG3deMQ2luqgjzUKTfdDrtA==
X-Received: by 2002:a05:6402:184e:b0:514:9929:1b01 with SMTP id v14-20020a056402184e00b0051499291b01mr1154620edy.8.1688639256875;
        Thu, 06 Jul 2023 03:27:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.199.225])
        by smtp.gmail.com with ESMTPSA id r6-20020aa7d146000000b0051df54c6a27sm604480edo.56.2023.07.06.03.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 03:27:36 -0700 (PDT)
Message-ID: <d26ae819-2152-ad85-efd6-425f0f9987af@linaro.org>
Date: Thu, 6 Jul 2023 12:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] target/arm: Avoid over-length shift in
 arm_cpu_sve_finalize() error case
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230704154332.3014896-1-peter.maydell@linaro.org>
 <87jzvffywd.fsf@linaro.org> <c90fd4c8-59a4-e4b9-544b-8eb6cd03b4d3@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <c90fd4c8-59a4-e4b9-544b-8eb6cd03b4d3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: s1wsgAChf2cf

On 5/7/23 16:45, Richard Henderson wrote:
> On 7/4/23 18:00, Alex Bennée wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> If you build QEMU with the clang sanitizer enabled, you can see it
>>> fire when running the arm-cpu-features test:
>>>
>>> $ QTEST_QEMU_BINARY=./build/arm-clang/qemu-system-aarch64 
>>> ./build/arm-clang/tests/qtest/arm-cpu-features
>>> [...]
>>> ../../target/arm/cpu64.c:125:19: runtime error: shift exponent 64 is 
>>> too large for 64-bit type 'unsigned long long'
>>> [...]
>>>
>>> This happens because the user can specify some incorrect SVE
>>> properties that result in our calculating a max_vq of 0.  We catch
>>> this and error out, but before we do that we calculate
>>>
>>>   vq_mask = MAKE_64BIT_MASK(0, max_vq);$
>>>
>>> and the MAKE_64BIT_MASK() call is only valid for lengths that are
>>> greater than zero, so we hit the undefined behaviour.
>>
>> Hmm that does make me worry we could have more land mines waiting to be
>> found. Would converting MAKE_64BIT_MASK into an inline function and
>> asserting be a better solution?
> 
> I'd be tempted to keep a macro, and use __builtin_constant_p to make 
> sure this expands to a constant if possible.  Ideally constants would be 
> diagnosed at compile-time and runtime values get runtime asserts.

Indeed inlined function doesn't work because MAKE_64BIT_MASK() is
used in static const value definitions:

include/hw/cxl/cxl_component.h:52:1: error: expression is not an integer 
constant expression
CXLx_CAPABILITY_HEADER(LINK, 0x8)
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/hw/cxl/cxl_component.h:50:9: note: expanded from macro 
'CXLx_CAPABILITY_HEADER'
         FIELD(CXL_##type##_CAPABILITY_HEADER, PTR, 20, 12)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/hw/registerfields.h:46:41: note: expanded from macro 'FIELD'
                                         MAKE_64BIT_MASK(shift, length)};
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This builds however:

-- >8 --
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -28,3 +28,5 @@
  #define MAKE_64BIT_MASK(shift, length) \
-    (((~0ULL) >> (64 - (length))) << (shift))
+    ((__builtin_constant_p(length) && !(length)) \
+     ? 0 \
+     : (((~0ULL) >> (64 - (length))) << (shift)))

---

But then UB is still present at runtime.
