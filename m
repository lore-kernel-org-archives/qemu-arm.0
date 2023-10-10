Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp323819ejb;
        Tue, 10 Oct 2023 01:42:17 -0700 (PDT)
X-Received: by 2002:a19:5044:0:b0:503:26bc:9ed2 with SMTP id z4-20020a195044000000b0050326bc9ed2mr12672386lfj.39.1696927336912;
        Tue, 10 Oct 2023 01:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696927336; cv=none;
        d=google.com; s=arc-20160816;
        b=rTsc4LgwBrNRnv/dO1YCEaHwvHerqNBBAPFf4xDOJpZvC+1/WHVZEbmyB+8RRmUbKn
         1wlUQKDSAYw3UkJqs1y30P/FQKnLuTvnVQfhXBsbnR/rXHt1NBq5iIXvEjd0DI/QSn9i
         UnOP8cXQOW0OaCueuvocm3QW0vSmgjs6raBOqZukt5y4ebUBEtyW0vCytq2orDw6qBhq
         KUqt8pDF0jfnJpnTPV45QQ6y9Ym2tVEu07SGQB3U+tsoYrutleeqaMs0JmFKmZ+oIMTc
         nXavMDpzQCaVXyVMEiPwfZpmZ2fVKCq8opHkvNFaTPDOy97wDFkhsQirVpHWPe1VL8F1
         +8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RiU0XrcaKel4UmncohJSLXbhs5Ek+d4oP0hUwEWnQKQ=;
        fh=ZVaAVxTGqj2+Fcapd3Jo0uT8BIRcJQB3fMGT4fxIBfU=;
        b=Vw6FOP+L7RenFZKySCfxW63nGW199bZNp0aZf8HJnjFs0jr+fTMbftHyzKCWvpm3GU
         1a1qgnIG6qNBI6MrCazFtwgrizEYOnkEod4CYurB2oqvyrTvFAd8SbxqsbyQ2RVgEYMV
         +3nCSwQcM4WFzmLuF68CtFI7AkP3DbuQTSgW0uHetd30HTjRnjTRiLOmo7478YLVbLxy
         LjTmcQB8nzl5MPm+GsnmEMuab19S4WFapzI8hxDNEHOMu9aI31w7SG8T7e6z8LoUP27Y
         vZTVmyv2TINCCQJdnxMBQefUZGEBUXmsKkjWpUE3i9BmT64nwKdLCnQZe21tNqUN+dwN
         +COw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O+5n+u8E;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m41-20020a05600c3b2900b004053a383023sor1038182wms.1.2023.10.10.01.42.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 01:42:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O+5n+u8E;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696927336; x=1697532136; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiU0XrcaKel4UmncohJSLXbhs5Ek+d4oP0hUwEWnQKQ=;
        b=O+5n+u8E3wEbaqcu/HEp/UGuGSVqZI+vm8Iw2rBtxsK/hxPMj0mcSuJXu0XvbMQu1z
         NnzEWN8lGi37CKARBHjC2z32MbGXNxZU99mkaXWu+yUZAsvVSFciPPkQ8x0HSTUpFysP
         l3n2uxm1zea6FtYc5JxBNoIen6POZxBz5pESEQXpx6vdgzUfp+iYuNA0Pleht/dd0rH7
         Z6A1v2/Ndd46otT+m6r3gpdaihZcg+WeLHfZLcSc0nZtk/L4as5EQmC/rMND3gjKWdT+
         pl8Sg2KZk1uvWJ8ChEEJnyPVyV3QMb6DqP8RNovka9+NYbnJjnpszXXskUYSJMtnEFUn
         LQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696927336; x=1697532136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiU0XrcaKel4UmncohJSLXbhs5Ek+d4oP0hUwEWnQKQ=;
        b=lYabbh/mOVvT4spyywKdYI82cWj0LxIssUC40IpNb5E/NqjWOtj3/w49gZzJBDQ89o
         b3Q2Kw3ZgB2GOuo1s2wfguFOMGbAnVdCijMsETxBA9oUVcpXAKs5KtUgCjhDHq2liy9z
         2ZHnvq8YnBlCEA7Uy7jtJe14raivs6qemAvovUyTnpNl/GINNV98MJ6m0CORbHSh0t7j
         eu0vYJUFM9SpcQvUrhuWuGW6lGi7sc9H9wpu9K0XhkXt0C8cx59cf4hfjGfDfKGYEgyK
         SH47NST2A5dh7H8R7v3e6av65E1pGWFjW75HyOghqm1E2AEh7/ks0No1kNehfPvjz2Re
         KGHA==
X-Gm-Message-State: AOJu0YxHiq9lRB0+ag1p1vVnHW5CCQS47Vhq0aNeD0fk/k9XypwH5M6h
	D0En/NDbZaXuIYRUBrup4iraLXFY
X-Google-Smtp-Source: AGHT+IEHKoCRKZDaipy/Sqys90c8HPqcuBUykYzNKGBebJvKIr80UUbFwsIWk1wie57rP4hVeKxVOg==
X-Received: by 2002:a7b:c45a:0:b0:403:e21:1355 with SMTP id l26-20020a7bc45a000000b004030e211355mr14670702wmi.36.1696927336477;
        Tue, 10 Oct 2023 01:42:16 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id t15-20020a7bc3cf000000b00401e32b25adsm13554901wmj.4.2023.10.10.01.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 01:42:15 -0700 (PDT)
Message-ID: <c3b6a3a6-a320-f2f5-c200-da5b11e18c86@linaro.org>
Date: Tue, 10 Oct 2023 10:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] tests/libqtest: Introduce qtest_get_base_arch()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20231010074952.79165-1-philmd@linaro.org>
 <20231010074952.79165-4-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231010074952.79165-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jhke1glu0WG6

On 10/10/23 09:49, Philippe Mathieu-Daudé wrote:
> While qtest_get_arch() returns the target architecture name,
> such "i386" or "x86_64", qtest_get_base_arch() return the
> "base" (or real underlying) architecture, in this example
> that is "x86".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/libqtest.h |  7 +++++++
>   tests/qtest/libqtest.c | 28 ++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
> index 1e1b42241d..54071e74ec 100644
> --- a/tests/qtest/libqtest.h
> +++ b/tests/qtest/libqtest.h
> @@ -654,6 +654,13 @@ bool qtest_big_endian(QTestState *s);
>    */
>   const char *qtest_get_arch(void);
>   
> +/**
> + * qtest_get_base_arch:
> + *
> + * Returns: The base architecture for the QEMU executable under test.
> + */
> +const char *qtest_get_base_arch(void);
> +
>   /**
>    * qtest_get_arch_bits:
>    *
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index a643a6309c..51cc92af21 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -925,6 +925,34 @@ const char *qtest_get_arch(void)
>       return end + 1;
>   }
>   
> +const char *qtest_get_base_arch(void)
> +{
> +    static const struct {
> +        const char *const arch;
> +        const char *const base;
> +    } basearch[] = {
> +        { "aarch64", "arm" },
> +        { "i386", "x86" },
> +        { "loongarch64", "loongarch" },
> +        { "mipsel", "mips" },
> +        { "mips64", "mips" },
> +        { "mips64el", "mips" },
> +        { "ppc64", "ppc" },
> +        { "riscv32", "riscv" },
> +        { "riscv64", "riscv" },
> +        { "sparc64", "sparc" },
> +        { "x86_64", "x86" },
> +    };
> +    const char *arch = qtest_get_arch();
> +
> +    for (unsigned i = 0; i < ARRAY_SIZE(basearch); i++) {
> +        if (!strcmp(arch, basearch[i].arch)) {
> +            return basearch[i].base;
> +        }
> +    }
> +    g_assert_not_reached();

Sorry, I forgot to commit this change:

-- >8 --
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -950,7 +950,8 @@ const char *qtest_get_base_arch(void)
              return basearch[i].base;
          }
      }
-    g_assert_not_reached();
+
+    return arch;
  }

---

> +}
> +
>   unsigned qtest_get_arch_bits(void)
>   {
>       static const char *const arch64[] = {
