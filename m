Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2081170njk;
        Sun, 26 Jan 2025 12:42:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVxlS56z5XO+qk0smuMOMeNKz8kCDsUroluAocN9XtW6aTAjoBlpG7ZpbZhFw1K4C2Tq8DvYsL8NnpdiA==@linaro.org
X-Received: by 2002:a05:6a20:7492:b0:1e0:c166:18ba with SMTP id adf61e73a8af0-1eb69731123mr21598741637.12.1737924137582;
        Sun, 26 Jan 2025 12:42:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737924137; cv=none;
        d=google.com; s=arc-20240605;
        b=TKHSn7dfRpIF2Zz76RDD5SVfFRH/8C96EOR7wv1e4y7CPh/z5qZvQIqnmWFfdkakQe
         bXxT2HGCyGOBN4vgrVujAhnKTctAUD94WTSPi1X/t2lbJ18Tx3YwtTLVLtXpGxf5c83q
         JU0J6zBG16Yua3odbPdF3opuWNhFjCxPTyOq3AtJNE1fnVzyv1W8qa1tJnnHBbdteo+o
         yEa/MHqGZ85gP3rV8rg8OPIo+l1TO+RutJwnoGr2GDhvRRJgqDttXH9XoS1hiqAWnGkl
         hxAFlJXdixtYprNRCkuvNd0f55BdUCjLaT24qUViUUAq8KKm+gv9Dk2e5Yf9hddUe30x
         cY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=H48ko7PqBt1MRDsTfWIcWC8+CkMs626ufkIw2bc/5x8=;
        fh=CJ0tT6cAQ+Uzjx/5j6M1Y0ofKitx2gglECvhUgkkEg0=;
        b=JTFAQUJeZgijIh9xNnqEQOZ9dfVI4J0kcK5KpVCfyVFm3dr56uWhoJDpLfGYAzGuT6
         tQUA48wVLYPeuO/lGPVni8bNFrxeFOcQtZZGMtnaGOUS9XdP8lWAWtIzUBNrWpWKotZD
         qShIsiZCjAlfJz1ehPr9DBMVEebr1w7vSVGDB8GzNmbsJNygPOaZJdJ0jrmptuXP12Gq
         7aSgZQ6RoDbp2fPBRs0x6HeZ9Ne0gCxu8X9aAkrwcjBubok+FkmJThMVTxmoCP5LCloU
         yMPGp5wJC/mQgCDTdkWIuJGU+vMmQSBpgudwbIqdln5XorhM5Tj3L2bvoakVDYgXu43Q
         knDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yJWtKvUd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72f8a77b6fdsor2833425b3a.4.2025.01.26.12.42.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 12:42:17 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yJWtKvUd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737924137; x=1738528937; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H48ko7PqBt1MRDsTfWIcWC8+CkMs626ufkIw2bc/5x8=;
        b=yJWtKvUdokV42GRagpa3PYuaeRhzneWFU8dUXyaNNEP7GjrKGq1nT0Q5s0GolNc4Ge
         iOtvehUAF7SLHDjQ/wu1WXmFbnAVXoIZh9MEuIqOmgQNLxt3pi566HUSLxjFZTIkYJmg
         0Qpl3OvC1gkSnZRt68Ql+FiY/0JIdBcNpOk4405jtYQ4uTx+LNsBYb45COvgyueqPiHj
         /xUJoVCTseFE5w3WOcLOGd5rY5OsztsfU0qJVYClLLLenl8h4i6Cp/76VeKhi4s4MjI3
         NXLfayqOaoTqhmyLBpqRxQsYPV72kzPlFTrEnA5iipV/z9SS8aRAEo6569SXp066l0+b
         i/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737924137; x=1738528937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H48ko7PqBt1MRDsTfWIcWC8+CkMs626ufkIw2bc/5x8=;
        b=KRAe3bXxIi2+SG5WNviKEp6ZBCIKehzksnhN/pEBObhjgq0p5A2guIB2/Nykl2VS/3
         venwk5ZYja5FCWz+j56Op9Hp6CDWSDrxNnXcgEyxhrbkjb+r0HLFzbK170LTFc0OsZOU
         WLEjgiY9ydqO3+rjHnfaX3Xjx4BVrHbpeiRkAU8MkuJZVMMlmF8DJoaS57Zn3N9n3pAS
         mfTbfgmKpoxzJU3BqCZmDXDbZNxXI6ptK2IB4lIWgSm7G6VGPI4MLZMIms7i7+lBRvNN
         0HuJ3N+vTF4Xt5SvquAPAggiAnjUHPSPAIhKEPg/ooiMOvnOaoqpR0qqhnRWyVE9XFr0
         nSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy+ZnMCxUbC9D3HZ7E/JxwAmA7ePjc4kgkaRdYN63vxjmZjBfBuqjgDZ40n3m6CULZ5WLuhHWG1dTEsQ==@linaro.org
X-Gm-Message-State: AOJu0YxHhDOZpkX+kvHVCkjdzhDn9DtPXhVjDBX5RceGh9BseTrH9Cvx
	ngon2QiMUctOQZu4RhHkm8ufAjsGiBwrYe3J/qtJG/+rQvULByQbRLSQeiip5X6zHg==
X-Gm-Gg: ASbGncv3G3DDum8kxtpwYCVwa0/4dnOvpQKljPeUCjrZMuv1VmrwLObHDO5CQ9YjVvT
	RuULlzFagIemG54KwkmW8p31HORhhqE6/L54FcPr0kCsjb24Ps5NIBKpdUNZyGR6qm31B6MAku7
	TfpPsDCwwBCJZJ4F8eLgJc9L5ZTUuw74lnAeW1TEkaazAJEl24cj/7BAc0/50ReTvlQEsA3QR79
	YIsRkgyYuPbgggBWXIotoFySgEAndwoEoVPKSK/2Ym60ACpyga7YmejhZddWXbXgF5Mh56oWoJn
	MhcwrydJPRuMb4ImaeXNsHh7qC1Gfozru7wR4FNfLgZZCfU=
X-Google-Smtp-Source: AGHT+IET1Hgf5DlFtTnLB6zbw3cCOrZlZ4h4Z0Ht47r+OhnvTjZQY9E5YHFS64waNnu9A7EWzAD+mw==
X-Received: by 2002:a05:6a00:2719:b0:72a:83ec:b1cb with SMTP id d2e1a72fcca58-72f8adf4091mr15476076b3a.0.1737924137118;
        Sun, 26 Jan 2025 12:42:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b3233sm5836919b3a.61.2025.01.26.12.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 12:42:16 -0800 (PST)
Message-ID: <fc81002d-b169-40f7-80e1-c93e55fadd30@linaro.org>
Date: Sun, 26 Jan 2025 12:42:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] accel: Forward-declare AccelOpsClass in
 'qemu/typedefs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-14-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: halHvH3NqH0x

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> The heavily imported "system/cpus.h" header includes "accel-ops.h"
> to get AccelOpsClass type declaration. Reduce headers pressure by
> forward declaring it in "qemu/typedefs.h", where we already
> declare the AccelCPUState type.
> 
> Reduce "system/cpus.h" inclusions by only including
> "system/accel-ops.h" when necessary.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/qemu/typedefs.h           | 1 +
>   include/system/accel-ops.h        | 1 -
>   include/system/cpus.h             | 2 --
>   accel/accel-system.c              | 1 +
>   accel/hvf/hvf-accel-ops.c         | 1 +
>   accel/kvm/kvm-accel-ops.c         | 1 +
>   accel/qtest/qtest.c               | 1 +
>   accel/tcg/cpu-exec-common.c       | 1 -
>   accel/tcg/cpu-exec.c              | 1 -
>   accel/tcg/monitor.c               | 1 -
>   accel/tcg/tcg-accel-ops.c         | 1 +
>   accel/tcg/translate-all.c         | 1 -
>   accel/xen/xen-all.c               | 1 +
>   cpu-common.c                      | 1 -
>   cpu-target.c                      | 1 +
>   gdbstub/system.c                  | 1 +
>   system/cpus.c                     | 1 +
>   target/i386/nvmm/nvmm-accel-ops.c | 1 +
>   target/i386/whpx/whpx-accel-ops.c | 1 +
>   19 files changed, 12 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
