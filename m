Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5735262wrv;
        Tue, 6 Aug 2019 14:43:43 -0700 (PDT)
X-Received: by 2002:a5d:4e8a:: with SMTP id e10mr6829419wru.26.1565127823601;
        Tue, 06 Aug 2019 14:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565127823; cv=none;
        d=google.com; s=arc-20160816;
        b=Pcxqc0EbIF0Nwo07L06g7bV3Uw2iwQoYYYOjD2i6HqzOk8nrtiP4ErD+CRxvdVL7Mk
         sutgNfAJ3+UuXS9NVxtMfxno0SHIEuEN7esOw9JpPZkjnlFm3EasH6QIVA/mEv4pQ+rW
         ANHLMlM6KHhONh/nrQ3JYdy21PIgfXpXAn9DSPtYXH04hmmn5sCaWJtQnqTQKWG0i5Py
         ep9ZQFQ1II+73x/2WrhaWObt0K+umkfzI49DfjpCj5nj6e316v7Ur101X32l0K0Dobmu
         ffU3qDyxCIovTU1AQfWUFquNkzNIqiDH82a148esMabGJPtmcqaPCHimF+O6zziOR6bL
         rq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=IX6nPM56vk/25QrLXlB3ikR5cSVcOfF8itYoe/f7z7Y=;
        b=EpYdB2KU6MlcxFoK37KYtx6mnTAHZPvIvpHEH/QkYiZi3C3do4VTfhg8qxbeB6pu2Y
         VSxm240YZXNotv90GDsXAYKxCZLHUvmjXntmYfgfv26vykpwYi+R56e2cwFzlyEYuHj5
         AWWMXxR7rhz+uOT9hSdf1A6UEa/LXXwLyjnmrcjhBQVvxejnHeZYZ9Q/9dFEPgceswg+
         55DfSgS4B5IbMvFCGE0G+4vvB2qUKFrnahgtKHk0vaKBzAG9LVX6ociK+AjxxJnjd4kO
         lOjDSzS4pRawk4BEgEbzcj6973psryub9GCJlKAzgS4YJdBWuzmXDTz4LJNHl4wM+zaP
         lzNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v14sor2243238wrn.23.2019.08.06.14.43.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2019 14:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IX6nPM56vk/25QrLXlB3ikR5cSVcOfF8itYoe/f7z7Y=;
        b=i4ds/3mWaT3yf/HfsneytkpoGSddODGwBcreZoh61mytqHMUHNBATH9CkCiuvAA3oj
         O1EOWjRTgrSjm0DXMEN/mIsm+rJlqDszOtb7pjGmu7rIUgHwhOktJNBrvJt55n+YoEx7
         DCRr9D3+O8ZIXPJtwbVJD140drYWkhCbmN3vFH3oyt7qpeDlj+9KD9lmtwX/YYHcgPAz
         AaeVH2FfKKTyI2lkqePv2hep4zLFhNHQXPRs6fRfsDi4+LjIPiRiTNfNXwB7WNT5Emt9
         +n65cEXWbx/Clu9XPCHzMGbLmr0G/jNU2WIDuk+XP0QW31HyIEtu1OWhb8uMOdnDkfSI
         S+2w==
X-Gm-Message-State: APjAAAWGxgndr7FVR9FgjLPHZZ+oQzTCz4JBkco3qJEdi57Mfh1ITEhB
	7tS/MbtE0c0fliKXxseFLBibsNAnlso=
X-Google-Smtp-Source: APXvYqwzImpm9iTGfKHmmdH0gWqSE4XD0019SL5uT9rQUSMP/cCSrx3dqT9ldpHmzi40kviK0p31tw==
X-Received: by 2002:a5d:4602:: with SMTP id t2mr6447434wrq.340.1565127823211;
        Tue, 06 Aug 2019 14:43:43 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [10.0.0.124] ([185.102.219.36])
        by smtp.gmail.com with ESMTPSA id g2sm80116964wmh.0.2019.08.06.14.43.41
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 14:43:42 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 12/67] target/arm: Introduce gen_illegal_op
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <61c30a12-110b-7c89-3e29-3a34ac699358@redhat.com>
Date: Tue, 6 Aug 2019 23:43:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190726175032.6769-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: rFUueG4AWZgA

On 7/26/19 7:49 PM, Richard Henderson wrote:
> Unify the code sequence for generating an illegal opcode exception.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/translate-vfp.inc.c |  3 +--
>  target/arm/translate.c         | 21 +++++++++++----------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
> index 4066b2febf..1b08930649 100644
> --- a/target/arm/translate-vfp.inc.c
> +++ b/target/arm/translate-vfp.inc.c
> @@ -108,8 +108,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
>  
>      if (!s->vfp_enabled && !ignore_vfp_enabled) {
>          assert(!arm_dc_feature(s, ARM_FEATURE_M));
> -        gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
> -                           default_exception_el(s));
> +        gen_illegal_op(s);
>          return false;
>      }
>  
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4738b91957..0f21ee9ce7 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1279,6 +1279,12 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
>      s->base.is_jmp = DISAS_NORETURN;
>  }
>  
> +static void gen_illegal_op(DisasContext *s)
> +{
> +    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
> +                       default_exception_el(s));
> +}
> +
>  /* Force a TB lookup after an instruction that changes the CPU state.  */
>  static inline void gen_lookup_tb(DisasContext *s)
>  {
> @@ -1309,8 +1315,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
>          return;
>      }
>  
> -    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
> -                       default_exception_el(s));
> +    gen_illegal_op(s);
>  }
>  
>  static inline void gen_add_data_offset(DisasContext *s, unsigned int insn,
> @@ -7631,8 +7636,7 @@ static void gen_srs(DisasContext *s,
>      }
>  
>      if (undef) {
> -        gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
> -                           default_exception_el(s));
> +        gen_illegal_op(s);
>          return;
>      }
>  
> @@ -9299,8 +9303,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>              break;
>          default:
>          illegal_op:
> -            gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
> -                               default_exception_el(s));
> +            gen_illegal_op(s);
>              break;
>          }
>      }
> @@ -10990,8 +10993,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>      }
>      return;
>  illegal_op:
> -    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
> -                       default_exception_el(s));
> +    gen_illegal_op(s);
>  }
>  
>  static void disas_thumb_insn(DisasContext *s, uint32_t insn)
> @@ -11816,8 +11818,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>      return;
>  illegal_op:
>  undef:
> -    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
> -                       default_exception_el(s));
> +    gen_illegal_op(s);
>  }
>  
>  static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
> 
