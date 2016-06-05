Received: by 10.25.27.66 with SMTP id b63csp1130703lfb;
        Sun, 5 Jun 2016 09:54:36 -0700 (PDT)
X-Received: by 10.25.38.73 with SMTP id m70mr312494lfm.107.1465145676650;
        Sun, 05 Jun 2016 09:54:36 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com. [2a00:1450:4010:c07::241])
        by mx.google.com with ESMTPS id d6si9197036lbc.192.2016.06.05.09.54.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Jun 2016 09:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::241 as permitted sender) client-ip=2a00:1450:4010:c07::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::241 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x241.google.com with SMTP id h68so11640105lfh.3;
        Sun, 05 Jun 2016 09:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=C6PMiCEJbXFwg/pXcd6lFYtg5Wo7oaxoNL6voqv+4L8=;
        b=S3gs4unvvHTAW7x0BYfwh2p0oAKVF7386vja/mFljN4R/NYqQ8zLNQotbOprnCPRyn
         XAfdRFsDunoXNesKyWKroOz+CRUn+MtUQAwAatRgx2MpZ7afzpLWZC+0t4Sl1XPkhmIq
         8xxxjbG56xVDueQbonS0RrrDmtmBjaPDMJ71JRbSw5GSPg+98/Xg/Y0AX1023zVCc2/Q
         IDmw6j0cF00xOYrxPm761qyqZSNpUMLVJJkfoYLvqbRd04Mxl25AVzlh0O1G3LScerUh
         ebPmbA7N0qCS7v/15Z20AqIttg6T0OptPOWk/xEYK2gVCunZd/jsYQu4hU3NLrr0wICR
         h3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=C6PMiCEJbXFwg/pXcd6lFYtg5Wo7oaxoNL6voqv+4L8=;
        b=YRqQMAeI1pwq18GRlYA5mq9X0Fuj9Jm7UPrwOnfcA6yfFkvdIhON9oJ9Ixz315cSgi
         NoAHORDfAygqujFAzzemfHKFgcJKdpsTz0xbHRAZUFv1IMKBNKKmVxdhEBZgkUnq6KS+
         BHuvV+ULFhf/oLipAnxSsQt8D2QHpMhs7dodocjE7b9gRBfFaW643Z/7sBk/UJAfJhii
         2YfPYzR17L4D4TuuJEnwB/zPMUdI0D2c55rVw2ZkL+8GHPRG+IllDbuB8HRDzTlJQqj1
         kgVM/vhbgMPY1f04kn/sEjWBFGpfthyEUNP1oKu9er2zx5brlJSGaWXumFHNVab/dMVe
         0qOQ==
X-Gm-Message-State: ALyK8tLFkPU44dnZ4uL+qUbrvdl7qsjtHA5tsjqHnVOLajLcyOyOvltUlFTrYbc7YEEWbw==
X-Received: by 10.25.84.80 with SMTP id i77mr335710lfb.88.1465145676335;
        Sun, 05 Jun 2016 09:54:36 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id m6sm912730lbc.28.2016.06.05.09.54.35
        (version=TLSv1/SSLv3 cipher=OTHER);
        Sun, 05 Jun 2016 09:54:35 -0700 (PDT)
Subject: Re: [RFC v1 10/12] arm: use tlb_flush_page_all for tlbimva[a]
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 mttcg@listserver.greensocs.com, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org
References: <1460730231-1184-1-git-send-email-alex.bennee@linaro.org>
 <1460730231-1184-12-git-send-email-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, mark.burton@greensocs.com, pbonzini@redhat.com,
 jan.kiszka@siemens.com, rth@twiddle.net, peter.maydell@linaro.org,
 claudio.fontana@huawei.com, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "open list:ARM" <qemu-arm@nongnu.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <5754594A.10304@gmail.com>
Date: Sun, 5 Jun 2016 19:54:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1460730231-1184-12-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: dWMcrZHhFgOy

On 15/04/16 17:23, Alex Bennée wrote:
> From: KONRAD Frederic <fred.konrad@greensocs.com>
>
> Instead of flushing each individual vCPU use the tlb_flush_page_all
> functions which is async enabled for MTTCG.
>
> Signed-off-by: KONRAD Frederic <fred.konrad@greensocs.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/exec-all.h |  3 +++
>  target-arm/helper.c     | 12 ++----------
>  2 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 858055b..bc97683 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -208,6 +208,9 @@ static inline void tlb_flush_page_by_mmuidx(CPUState *cpu,
>  static inline void tlb_flush_by_mmuidx(CPUState *cpu, ...)
>  {
>  }
> +static inline void tlb_flush_page_all(target_ulong addr)
> +{
> +}

This change belongs to the patch which introduced the function.

Kind regards,
Sergey

>  #endif
>  
>  #define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 19d5d52..bc9fbda 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -554,21 +554,13 @@ static void tlbiasid_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void tlbimva_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> -    CPUState *other_cs;
> -
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_page(other_cs, value & TARGET_PAGE_MASK);
> -    }
> +    tlb_flush_page_all(value & TARGET_PAGE_MASK);
>  }
>  
>  static void tlbimvaa_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> -    CPUState *other_cs;
> -
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_page(other_cs, value & TARGET_PAGE_MASK);
> -    }
> +    tlb_flush_page_all(value & TARGET_PAGE_MASK);
>  }
>  
>  static const ARMCPRegInfo cp_reginfo[] = {
