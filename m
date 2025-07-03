Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp546353dyc;
        Thu, 3 Jul 2025 06:45:46 -0700 (PDT)
X-Received: by 2002:a05:600c:6792:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-454a370308cmr82364515e9.18.1751550346018;
        Thu, 03 Jul 2025 06:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751550346; cv=none;
        d=google.com; s=arc-20240605;
        b=PdfTbgbZzoMaOkxYCxGirFz8gjFILOGvFbO8tLHwjqVtIx/xwws3TJBAcgssy435Yb
         h1iAyrutgGaZ5NQUO57QyUzsx7kc5M2do6DLxp3N9VUf9LYkPmyaKc92UbnaEJeGVQ19
         q128G2UO4c5d60TfF2md+H775Huxehy+5FOV8Plw1KnbgAoIrmkXZl066IkBh1Cr6J2L
         JDYWsynUOlHmcJMQqiiteDEl7RaRQbnYZ1sUY8rjXpG6yuuiiUO2y/Tjf3lsD8G4v514
         PigHEKFkzKGKimvVbUZsfOmeBWXoxD+ExyQjUfhrcIAJZeob2y/9qhEDMLN9Mwe8qa5t
         dEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bzgfIYKT0pu2euhC4Y01ktX+iPTZDzQ4TCdcNhT2AOU=;
        fh=l1Qp56R5L6Cd4rzhr8AK/gTURDudv5Ma4ylpxSHh0d8=;
        b=Hp2SWf/COYpO5BxZm3OM/DSFY++MswUSURhR1EjuolA7dsW5hXvTYzWEQHPYEBmGrD
         vfVxjlzgGAXyCFbjqsETofJEW10iQVbu44zpc7gQPZC7BwlEtnfziqmUMV6MgNIXXLIb
         uSbUJsGIJSB52gwT7C+Rzbtc+N7dtFkn2d93oQG9jvmeM/cN1HfWS3ziGiKaEGafjCkW
         PxY9vyjzio5opcK9JX4Tt+GdnQv2SwUS5I/tMm4EGM/4wX20lQoiGct9fAJVDVHUlo6Q
         jH18KUYj+ZJUSeHNH0hgDMtiFxaEZpcDRutzqfUqdRQlrA2egkcvBhBhf2KyQuImUr2+
         G0Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQTMM+bZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-454b05ab481sor1988645e9.7.2025.07.03.06.45.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 06:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQTMM+bZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751550345; x=1752155145; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzgfIYKT0pu2euhC4Y01ktX+iPTZDzQ4TCdcNhT2AOU=;
        b=qQTMM+bZFRyOriKJ3SD0Iq1LzoIAW1Pa9VGWRnotCr2E8GVz5ktJeXBJYK97Jm+Mss
         AzmQoZVgsWqRwLdp9otoz2LLi8PZ7duVh0+kIVizFNDj/fIxKv+lt0nX4hr2ixcnVgml
         RtGCWBxPvDPouREkcJhCZkDEJvepBCFrVZT+zE+E3tGAqXFYKIXKi/YS5vidFHTluu1m
         3pNXWNBHMDH+YjkDsDKrppYmfdHICfOT3rp4K7GszXNV5H+NNbBamKtO6u1fQ0huXIXE
         xt96sePje1fnPrHyLrUfqfwjGgWrnDCrt4YLdGrBmc/wPNHF7yMZbPi7bcHb/EI++PMl
         H+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751550345; x=1752155145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzgfIYKT0pu2euhC4Y01ktX+iPTZDzQ4TCdcNhT2AOU=;
        b=gbY4Yqb7ZH+5GJNaK7oEtCWTO5dOUlIgH5OhCecEWv2riuqhO3B6yQzjUrrdxwBu+a
         OSachB9jk++dqtyOmi/9mofqwdEnC5+s5yQ42zkZo4gPb8E9n72tZ6chpLXxB+6bodsy
         pP9kwU6xUfT1wO1qUlklEj9+CpFJIvNS/hVnZKfIXKr0qK8H49i1M6clyKBf0OWH9NU1
         nRNEOSGI7UFzKgU10S78MPaNUHyi7UkBNPmATDYGqhRlyYO2lVMOHTUWpBFemcvQQN1/
         7nLi4uKUnqZgcYyFM9PWlGxaLKATtxDu0tTV7N+gwBwyGGFaDCUDqDI09ksvFTgueY71
         krLw==
X-Gm-Message-State: AOJu0YztkkSHJ0nE3OnGu/I1t2ku3EBEqH+5ZL+peFcwIyRpLfuOW0pA
	eJfphUXXuKX9rMXcAQUsmhH1LrVePMRyzAUML4qFqQPJn9xLaeuNqeUWgLVvuwMKBltWHw==
X-Gm-Gg: ASbGncuO3skkPCF2CJ5l+zqkgldvH2qnE+SApmHy45riklX69CNCva+INCU61sl7MyN
	0N95kyA4kYZRmOrNZUuFAOwFEa+AzhnqPLHJmZG8XtXDBVPnYQZo/XYrXwHSLWElMBwB3VKtTOj
	gknorHDR3pzcjuJ+pFZQ0yKJ5ak/X/0fsRLUbWcRD90v3f3ApNMP0giaFz071439f7xl12Un3lu
	LZNhsQ3FeIBNNNut5+oZjbAmUPJinhXoCq9GaOac8HXWhkykvii6RgxszySgL4emu2O6w4GV9Ku
	FFLpIbhUbxRPpqNesbkf/9yHybDR7AO1+/OysSjKZbjiTmEketOm9SJn3wa1XLp7tr1bj65mU38
	Dsla9o/CrBcCaB4w+fQ+oym8xmBTJ/w==
X-Google-Smtp-Source: AGHT+IHIBfzPNtmnIof400Agn8RwX1HvW/bLZV3KILkNnKHgCIfoputch4xZsSGQwe362Ldh+mT2Sg==
X-Received: by 2002:a05:600c:8b10:b0:453:745:8534 with SMTP id 5b1f17b1804b1-454aa80da70mr34354995e9.12.1751550345370;
        Thu, 03 Jul 2025 06:45:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f34csm18323235f8f.85.2025.07.03.06.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 06:45:44 -0700 (PDT)
Message-ID: <364dc354-ba78-47c6-ac65-2c0282e28733@linaro.org>
Date: Thu, 3 Jul 2025 15:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 47/69] target/arm: Use generic hwaccel_enabled() to
 check 'host' cpu type
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250703105540.67664-1-philmd@linaro.org>
 <20250703105540.67664-48-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250703105540.67664-48-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7bVHHAZ/3rAm

On 3/7/25 12:55, Philippe Mathieu-Daudé wrote:
> We should be able to use the 'host' CPU with any hardware accelerator.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/arm-qmp-cmds.c | 5 +++--
>   target/arm/cpu.c          | 5 +++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
> index cefd2352638..ee5eb1bac9f 100644
> --- a/target/arm/arm-qmp-cmds.c
> +++ b/target/arm/arm-qmp-cmds.c
> @@ -30,6 +30,7 @@
>   #include "qapi/qapi-commands-misc-arm.h"
>   #include "qobject/qdict.h"
>   #include "qom/qom-qobject.h"
> +#include "system/hw_accel.h"
>   #include "cpu.h"
>   
>   static GICCapability *gic_cap_new(int version)
> @@ -116,8 +117,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>           return NULL;
>       }
>   
> -    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> -        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> +    if (!hwaccel_enabled() && !strcmp(model->name, "host")) {
> +        error_setg(errp, "The CPU type 'host' requires hardware accelerator");
>           return NULL;
>       }

Consider the following hunk squashed:

-- >8 --
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index eb8ddebffbf..bdd37cafecd 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -456,7 +456,8 @@ static void test_query_cpu_model_expansion(const 
void *data)
                   "ARM CPU type", NULL);
      assert_error(qts, "max", "Parameter 'model.props.not-a-prop' is 
unexpected",
                   "{ 'not-a-prop': false }");
-    assert_error(qts, "host", "The CPU type 'host' requires KVM", NULL);
+    assert_error(qts, "host",
+                 "The CPU type 'host' requires hardware accelerator", 
NULL);

      /* Test expected feature presence/absence for some cpu types */
      assert_has_feature_enabled(qts, "cortex-a15", "pmu");
---
