Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3719371ejd;
        Sun, 21 Apr 2024 09:45:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCnGyrU5OCtcZ4XXbJWKDaj6B0zgCnW7shZFAFyGrH1Q4UGS1rNLwLe+EVMhSswDhlcVrlrd3ct5ZFYgcUvVnnZkhjHB5j
X-Received: by 2002:a05:6a21:9189:b0:1ac:663f:9efd with SMTP id tp9-20020a056a21918900b001ac663f9efdmr6584208pzb.19.1713717943197;
        Sun, 21 Apr 2024 09:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713717943; cv=none;
        d=google.com; s=arc-20160816;
        b=N9TbJ5ZYqUR09zvQyf+pjDWKdkFuduhNr0BC4Fs/s65qVU5wJOcEJJ3DU45BsiAHuY
         zg39PUMoAxgstWlVcfx3yF526cEpbqe4y4TjOocP15S1vGOTFprvAcVqpM4ePBmuRcdF
         mHAQadjmBm6dknvzmzke1o+HX5d3z9BwVB1rR6T4vBthDMcfOeEP3ysQRB7K7lqW1Yfz
         J4WycDgERrHsHh8QBdXbQ5EdYCdcryaOonYgxLC6mNAatizHSCJn+RIsRT+6E47lZ/Az
         7L4vEdRnUmFVF4kPdEo9wvcLB0CGrZHelXgwjWgtiJEcJgdvsdOT3z7QkYERNc3pHxGJ
         ol+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XqloDR6JsK2Iw2I3SwNxtQ6VQIK+ro3QdjLtZn15xnY=;
        fh=tuNavBZPAEeO5b4U3Jt3Fcih3NYsfDtq4r0gtCbs/Pw=;
        b=O/qhlWJb1qLyrXrdxpidnqekIKi6eQIOUAW7DA6loCZgH+JXDwxzDy3Rpv0253bDtU
         LrxU4TtudnapLsR2jznAJnaLuwicuOdbLnWAh+Imhzw9xmSwyBSMFMiCcQmM2wzwwXnT
         Lq4XrTqgvjub6+/tYjeZC8IuPbW92G7hGg6eMuSQQZRZB4yCSL2Bf6uo5FNDXjSuU0xq
         JEhlVL8H61zHhw31MmKhRI0BqsYDpUG58P0eU5qpcK8QyxfL6p81iFxZIjfUbWI/6RjP
         3er/EONCtZ+pXxW494V2Ar7M2y5lt7ydYkMXm+FU7IeJJGOjtbYESdm6IyNxkfhaWTM5
         +NBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMYg+WBB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e15-20020aa798cf000000b006e743757360sor7580291pfm.6.2024.04.21.09.45.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 09:45:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMYg+WBB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713717942; x=1714322742; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqloDR6JsK2Iw2I3SwNxtQ6VQIK+ro3QdjLtZn15xnY=;
        b=PMYg+WBBAAF5JnGMj4JmAYlY9ZJNh1kSUNcYAOYJ+udQciW3oPsZLZaqoFgAZbwaNr
         ROtQY0c+Msbozdd2VexWjrjmkLh8LO/Vjd89QKGAKY94qL2CSg4FxGxXSZMKg6iRj9d8
         8IQ6ZUlZtbfKmDBIB46OS+Ze1A5tJxr8YQajnJgAMqlYM3Ul85kJ9eVJigLGsuB3xTeS
         0XX3PgXY1uBME+f6K4Rbxvz3vIRxmv3gzN8Sfsl4lM1T1z6YoQANRHmzWOLK0FaMMraD
         G5k5SuC0e028o+Cx1ga7eWHCKJJPzyK6C7qzN8/RrO87RFZ0ze/o7XkUqaP0SJHGp4iU
         Ho9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713717942; x=1714322742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqloDR6JsK2Iw2I3SwNxtQ6VQIK+ro3QdjLtZn15xnY=;
        b=GT5cca7+hEUJpDaN5oMUgtDegbM3JFbm/ccwXxuTv7gMPo3Dk2Jht/nugdgcRx2RBg
         QfXg8O6yelWJnIZC0O+cEmQigQkE4Y9JO8dfZKTXEPMFFTc/l4qFOXpZtyeLxI5CxhQD
         tVQ8TTjciRMMyRV+wFkEo0UMNVn2Bua1d0F2jLReX7un3FrU9MxDWt4z8lfjIrbgfFIk
         X+SNAJBy9RAuOw1KGAPUohlWgfo7zN2Hve/OvLUcqIT/SpbWhzS1Q6/FaGDEQsA03XRN
         NhO+lqCRFTAkZ09e4Zj9KqvEllXCc9gcLg0mXsLYOXybfi4lD9GKMz+gSem3B6QZZOAR
         ikNw==
X-Forwarded-Encrypted: i=1; AJvYcCWoKI7uZKkaclCIFYMKo+Kgfi4bwheJvISXdYeUrEfFRqsjG4jQIStQnu1q/dwP89D3yHx/phhOYWb5Um+wmD+hObc4HBg6
X-Gm-Message-State: AOJu0YzVzvfCSq0moGmC6/5zXARd0Ct8Qo6/8TRyiwNT4gBXEDkDZ8Dj
	zfZtCqChEt20QeYZ0izSXFryHW4IFWjuvPPqdyGgaIMHc9jqrjQJUfrOV5hYKG0ErQ==
X-Google-Smtp-Source: AGHT+IG6DOXZP/ObKsKG/7I0+KifVXQujh5NZwrjVmUfh5wYhRDh1Vw+q/zI/eLtf3WOZ29XNLocaA==
X-Received: by 2002:a05:6a00:3cc3:b0:6ec:e733:c66f with SMTP id ln3-20020a056a003cc300b006ece733c66fmr10587194pfb.0.1713717942623;
        Sun, 21 Apr 2024 09:45:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id w22-20020a056a0014d600b006e6c0895b95sm6342357pfu.7.2024.04.21.09.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 09:45:42 -0700 (PDT)
Message-ID: <ce2b8954-9560-4de6-aa2a-0dbcb6fc7469@linaro.org>
Date: Sun, 21 Apr 2024 09:45:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] plugins: Include missing 'qemu/bitmap.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-19-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: j89UamzTZX7h

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> "qemu/plugin.h" uses DECLARE_BITMAP(), which is
> declared in "qemu/bitmap.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/qemu/plugin.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
