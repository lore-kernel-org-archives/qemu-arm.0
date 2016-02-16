Received: by 10.25.208.211 with SMTP id h202csp1471840lfg;
        Tue, 16 Feb 2016 11:04:41 -0800 (PST)
X-Received: by 10.112.138.166 with SMTP id qr6mr10635315lbb.106.1455649481514;
        Tue, 16 Feb 2016 11:04:41 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x22b.google.com (mail-lb0-x22b.google.com. [2a00:1450:4010:c04::22b])
        by mx.google.com with ESMTPS id 89si18751151lfv.9.2016.02.16.11.04.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2016 11:04:41 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::22b as permitted sender) client-ip=2a00:1450:4010:c04::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::22b as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lb0-x22b.google.com with SMTP id bc4so103088904lbc.2;
        Tue, 16 Feb 2016 11:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=fw5LcD4ZupDy4IqW0IUx3Uo4edqrHcjJwEAOkHgKI5A=;
        b=SQRmwZUzANSHJCPLZVAfJtYFvfE66KYvmgBsqdzcsVvfLytBl67oupPhowzvZXg1hs
         xuw0D/iMpKSPCVCizpdYJ+pZsAfBJrs23nMmk0yi49zbAMJxqc+kjKtykTlZE6u0wbv1
         zPQWs3M6WclgX6bEssqcedEf/nXG4nLtfPjyiHw+aebvc2xf6ruJm6Sjybzx6ls6d0Mb
         +PfeTjup9KQjCp0u7H+JgtHbFlazrh1URDw7B9Nyts24beioZhhVEQyc802STxkHpKkg
         j8XiZZhZxVgUsdr9RteNI0BZKaN1GxuzgZQFKnrfW8yTlMsmEKSNIy20AOtiqH2MSdk1
         4YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=fw5LcD4ZupDy4IqW0IUx3Uo4edqrHcjJwEAOkHgKI5A=;
        b=K7B7oIpVavqCMIF9eFLnh5LHw8a8vuYXb+R1fvGyG+2j3Va7+kov1FRFaMhe1607tz
         vSET0onHZ+FXzX4Sa9go2be7/jqBLjk6T/Chbzek8YunDHjo4x3JAY7OixuQdZdReVJf
         KRg9OMi1N/4ruduL9obbyuybD3aDbwwzRrqW8WkOREXhsK9a3czdffAP6wTIOeYodZ4c
         cNgps3HoEu/4H8vDZxIIiAR76zaf0IBcXLnay3T7+BR5rydJ+xhFbb4vBJB68sfy/rgU
         5okwy1/n1t4Nvjm8lyUhpynbmJSpAbMoJiPIgdXqfWs0TEwkBy9dEzUyoPVjhcRT8Zdj
         xxaQ==
X-Gm-Message-State: AG10YOTyQop+5Supd79h7GQBTVcn/E9aJVGt5XjSVhEx23+k7Bxnjn5DD+UKtL6ee9zQRg==
X-Received: by 10.112.129.233 with SMTP id nz9mr10518242lbb.82.1455649481217;
        Tue, 16 Feb 2016 11:04:41 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [10.30.10.50] ([213.243.91.10])
        by smtp.googlemail.com with ESMTPSA id d131sm4548937lfg.27.2016.02.16.11.04.39
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 16 Feb 2016 11:04:39 -0800 (PST)
Subject: Re: [PATCH v1 3/9] target-arm: Add the thumb/IL flag to
 syn_data_abort
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
 <1455287642-28166-4-git-send-email-edgar.iglesias@gmail.com>
Cc: alex.bennee@linaro.org, rth@twiddle.net, qemu-arm@nongnu.org,
 edgar.iglesias@xilinx.com
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C372C6.4080909@gmail.com>
Date: Tue, 16 Feb 2016 22:04:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455287642-28166-4-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: C1icddZ8f/L8

On 12.02.2016 17:33, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/internals.h | 4 +++-
>  target-arm/op_helper.c | 6 ++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index 70bec4a..b1c483b 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -360,9 +360,11 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
>  }
>  
>  static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
> -                                      int wnr, int fsc)
> +                                      int wnr, int fsc,
> +                                      bool is_thumb)
>  {
>      return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
> +        | (is_thumb ? 0 : ARM_EL_IL)
>          | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
>  }
>  
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index bd48549..4e629e1 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -115,7 +115,8 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
>              syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
>              exc = EXCP_PREFETCH_ABORT;
>          } else {
> -            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn);
> +            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn,
> +                                 env->thumb);
>              if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
>                  fsr |= (1 << 11);
>              }
> @@ -161,7 +162,8 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
>      }
>  
>      raise_exception(env, EXCP_DATA_ABORT,
> -                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21),
> +                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21,
> +                                   env->thumb),
>                      target_el);
>  }
>  

ESR_ELx.IL is about instruction length. Thumb instructions can be
32-bit-long. In such case, IL should be set to 1 even if env->thumb is
set. Additionally, a data abort exception for which the value of the ISV
bit is 0, should also set IL to 1, no matter what was the instruction
length. See ARM ARMv8 A.i, section D7.2.27 ESR_ELx, Exception Syndrome
Register (ELx).

Regards,
Sergey
