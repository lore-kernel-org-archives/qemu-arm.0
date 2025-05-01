Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp279114njj;
        Thu, 1 May 2025 08:23:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWb8/ZIDicpvf2hpw2FnoBYPM9zdG1DsMcAhK5psFYGg8342Jb5TDsWBsfeFq97BwjSZP3CdqKYOzKB8g==@linaro.org
X-Received: by 2002:a05:6a00:2e9d:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-74049198213mr5326511b3a.5.1746113027303;
        Thu, 01 May 2025 08:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746113027; cv=none;
        d=google.com; s=arc-20240605;
        b=WeF4tdGM+ibKhBMGyc6JveHMRxoggIyAo95qoBYJ88IY0/rJ6Q6NayKi/M5GZh9SSd
         zcMeJQphRB36WrRgO5GS1G0d+2BzNZzFJYmKDJcJLMGvdCSM7DaYzzGjm88yDVDYdrsr
         0Jz0jbIgqXFNukCvgdfSW66kPCEuHl5MlOzSDwj2t4DuIWwCHT1VV5UaLej1WWoOC/Bw
         d5r8AcYB2p1oAI1ZFr9BnXEvrrhgJjT26zTBlDSGvXGW5lGfkk9xMfC981El4qfz1jHt
         2sbuXwGQ1Mvi6Y1tBtOrHGbvoAFPStpgKFd/SsZidYSD5OOLtAG14qlBNRMRDhq1TfmC
         z7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        fh=RR1PE+61AYNOcNHNeTXR1QXg1OeiLldifwynNgYuGlQ=;
        b=eDHKFEHQGN1AlV5GSeB1+mlY6XJX8LVmrBjwrHY1TeN9MQvWv2SHVP0+9anM2/UO4R
         2zi7EA3yLRRG5xbcw6Sk52NwV7UkHgZF/QvW5xZiUgejSli6vuPj7+iZvVVBbVXYv2+g
         LUNyQS918FmF/CWxPT9N2nP6mi2hYjJ6EXagybJzgRODArv/Mlbx8G1RiAbHZYryhxZr
         NZoPVGn8RymmGpjOFoQW55wb5Iu7U0Dk+OA3tjxnMmJMBMXlMJ01bmkoJ7zf0XKk/6WU
         x1osZj2Ljn7lN0HXki0IFFi2bj/ODOOAqNJ6XeIq/zWmjoAa0KfBMnqdiLBeaqGwb2LG
         05cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibAsLq1Z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7403a77bf0bsor2384641b3a.0.2025.05.01.08.23.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:23:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibAsLq1Z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746113027; x=1746717827; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        b=ibAsLq1ZKrZ473+/Tv2E6A8vQETKuQ01pj+a0SKOoP82iwOJ5XdhjhOcxkfxCoZnf3
         DP4z/2gGth4wbvbYEnE2oZqD6jDXTYXHuTJt/zKVLVeX3VO0BN/O5RlKDLcgB1admuBQ
         EkmdwPjFTA6AYgyI8utrmg8wb3tBSJSqfITH5Dgp1pLbJBMdY5yNGscXwObMqM3a0C/J
         30S1nRzKxeC06SUpf+I+A0Q6sAMpx3g/1SEtgTuJ/q4FDnR/WAr0mAb7IV/4RXg5CBmA
         y2J/JU+BldSvMs7ZWFBUwKE2wyK0RaVz7ecp24xFTCiAi7Dk7kz6C2FCnRicHZtkIolE
         0SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746113027; x=1746717827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTb37Xh3764UHx4GkunEtiY4YocHVNCV/2Hme8te8Ks=;
        b=YW51AeyCip3EaTBhrQNKBbkNt7HyBe4FoLoDeAPu/KIvW8/wdJzrAZWrYIUC5vpXx9
         HV/hmWKKwkc7GAR3CY9BRz6W00xQDnVUD/HUzDFyfhMceblmLiAIS6L2OqNd2/kGUE+N
         ZlygmKpfzxo/A+mtfN5T9uhFGRfnhPkJ1pEq392JQ123SZ9PoNgSDavxPCjkgUd9tEhs
         YlRr6/gePjPD6PanGa2XKXQpTAJLzzmEy7bzJabCMVXgIhKwDrUr+/GV3CwUQJaeudm6
         1SgRg/GhWW46pHPYsC9WE2A8IcAZK2Zut8iw2nchA3I0Z5j8hxWvHFA+KCUwJR3L6b2q
         U3bg==
X-Forwarded-Encrypted: i=1; AJvYcCXlj8gM5dexXS3SG5CcCEUc0V+Dpyd0XHnmym1lkhV0qLhjEX7pcc9hcHy2C7JCXAcqL97T9j89zDTkyQ==@linaro.org
X-Gm-Message-State: AOJu0YxwGO8cXvxWaCKjv/WdCozIJ+OTUuOGdCROXAVAU8/9bwFca7fO
	mIw/fCW1LCix8BE07Mcoy5BT9jySKXj6BQB9F+uVGdKWoLwRAs5c8afR7cp78YQxfg==
X-Gm-Gg: ASbGnctMrlUUn4iL64PySpsfrrIMnUiwnSkMsw1u2QmN7C6lPTnR/22PaaGe8oWD/I9
	++hV4NnNCULtxYf2Otwf+Bqi0DQwMcV2PCl4Tsa3IYqOOl5okkiCM6S1lVFC9wof9oYR20qONyu
	uE8UsnXWXLtw5Cr8UcuohCtAElTOrjt/QSGQMnRU0615YkvRTsmEARY7gpLu8DXWmY8z8zbeEmq
	S3MIoxxMwjWE/dz79xNNRhPoIs5DGoOFBtQ5oLZ8AC99wRiMewDx9jJzo0NOqgmetTYEECRA8fl
	3Nxd53RI8i5JccXdAcmzeHxqzVs9Di8rGpAK/x5Eovl3R0HWpGrZFc2fmwXvZeeE1yzA5liIw2/
	GYQE+oHoKX0MFPs/GuA==
X-Google-Smtp-Source: AGHT+IGeIGOXpxe2jTOUCDPMZOtd+K4fLjVDkKah9tXMcswEOyenkaTjPmkGiWjX74LVyS7YdNXcsQ==
X-Received: by 2002:a05:6a20:9c9a:b0:1f5:8cf7:de4b with SMTP id adf61e73a8af0-20bdcd9eabcmr4194086637.16.1746113026817;
        Thu, 01 May 2025 08:23:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fe120sm914753b3a.86.2025.05.01.08.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:23:46 -0700 (PDT)
Message-ID: <f3fc3946-a191-44df-a610-fb636e2b314a@linaro.org>
Date: Thu, 1 May 2025 08:23:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/33] target/arm/arch_dump: compile file once (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-27-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-27-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Si2AaPU4jKXM

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
