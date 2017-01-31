Received: by 10.25.77.65 with SMTP id a62csp89565lfb;
        Tue, 31 Jan 2017 15:09:53 -0800 (PST)
X-Received: by 10.84.233.132 with SMTP id l4mr43654588plk.15.1485904193527;
        Tue, 31 Jan 2017 15:09:53 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com. [2607:f8b0:400e:c00::242])
        by mx.google.com with ESMTPS id h1si17315001pli.170.2017.01.31.15.09.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Jan 2017 15:09:53 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) client-ip=2607:f8b0:400e:c00::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pf0-x242.google.com with SMTP id f144so30183651pfa.2;
        Tue, 31 Jan 2017 15:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=I3fB+XCa96QZJsOEU26XpeWkbIsPHFDKp2QU9ymopAU=;
        b=WmpsYfHzSAjvZ5IAut1E8qegLB3SfyUNo65Dx29wfSCJNXqEgs58V1N7Z8S0+x756o
         oKma7KhX33mjSZNqqb66RkMalFDurqfEDrVDZho/7Qdy5LR+zRVo0B+2YzHZHfwkglWy
         PYILEOHn1qwWlMwzVVEcqfCuyuAodvrppxN0R1XAP3MvV0A5aedoo4KKZz6dO6CTQRT9
         MQxqacl0AwzvplYLLPlC8m2KmEEuurdKxbfQZPzG0akM1zoMoJLFTh+2IdIXsHdwF7jz
         uAMW2cwC5VV9w3BqMMC+RZSRkuCOTRL3sDaoPCfWlhND+LSSSa21PuKcQmW++wY1896S
         pQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=I3fB+XCa96QZJsOEU26XpeWkbIsPHFDKp2QU9ymopAU=;
        b=NAttZay+MpVzv3BDoVxeP2KYP5z8lnvQ+sYo8sUMU+WblxrY36/7iuWDRYg4KsIQoc
         oLXOl2n909OQfITq7brLYtZllFjBoed4ht/FIjZwUwfhrG31YGIumnpqZ0lWFbRMvAO8
         Ov+iqpLivVqJGuOf8Xu6x4iHomZ+T/mPWfJLh2CgEOQgd+H8HswpapLaGGU9av1J6umM
         BkGiquWxYe1W98yrZvjiKImFjk+JxWOkr0zdFeQQ2Ge0TWQ8ZgSvxvk2zl1pFABSaEzV
         ocljWvpsoMyA+NlocHEMPvFXoa00djQSd6KLHhhSiWuaVxmUhTTaVMwoFrB8XCHO6OMZ
         uqFg==
X-Gm-Message-State: AIkVDXItWSF3Q+E9tU6yXBIZmuUmHjaMFfbc+TORlZAlDAJquZiq7500DHvVdMRRJRoSTg==
X-Received: by 10.84.216.24 with SMTP id m24mr43662717pli.22.1485904192893;
        Tue, 31 Jan 2017 15:09:52 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
        by smtp.googlemail.com with ESMTPSA id g85sm43741249pfe.38.2017.01.31.15.09.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Jan 2017 15:09:51 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v8 16/25] cputlb and arm/sparc targets: convert mmuidx
 flushes from varg to bitmap
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 mttcg@greensocs.com, qemu-devel@nongnu.org, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com
References: <20170127103922.19658-1-alex.bennee@linaro.org>
 <20170127103922.19658-17-alex.bennee@linaro.org>
Cc: mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com,
 serge.fdrv@gmail.com, peter.maydell@linaro.org, claudio.fontana@huawei.com,
 bamvor.zhangjian@linaro.org, Peter Crosthwaite
 <crosthwaite.peter@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <70fe24bb-c8f1-43c4-010f-a682bdd507ef@twiddle.net>
Date: Tue, 31 Jan 2017 15:09:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170127103922.19658-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dFrxjxOsoGPZ

On 01/27/2017 02:39 AM, Alex Bennée wrote:
> +    for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
>
> -        tlb_debug("%d\n", mmu_idx);
> +        if (test_bit(mmu_idx, &mmu_idx_bitmask)) {
> +            tlb_debug("%d\n", mmu_idx);
>
> -        memset(env->tlb_table[mmu_idx], -1, sizeof(env->tlb_table[0]));
> -        memset(env->tlb_v_table[mmu_idx], -1, sizeof(env->tlb_v_table[0]));
> +            memset(env->tlb_table[mmu_idx], -1, sizeof(env->tlb_table[0]));
> +            memset(env->tlb_v_table[mmu_idx], -1, sizeof(env->tlb_v_table[0]));
> +        }

Perhaps it doesn't matter since NB_MMU_MODES is so small but

   for (; idxmap != 0; idxmap &= idxmap - 1) {
     int mmu_idx = ctz32(idxmap);
     ...
   }

iterates only for the bits that are set.

> -typedef enum ARMMMUIdx {
> -    ARMMMUIdx_S12NSE0 = 0,
> -    ARMMMUIdx_S12NSE1 = 1,
> -    ARMMMUIdx_S1E2 = 2,
> -    ARMMMUIdx_S1E3 = 3,
> -    ARMMMUIdx_S1SE0 = 4,
> -    ARMMMUIdx_S1SE1 = 5,
> -    ARMMMUIdx_S2NS = 6,
> +typedef enum ARMMMUBitMap {
> +    ARMMMUBit_S12NSE0 = 1 << 0,
> +    ARMMMUBit_S12NSE1 = 1 << 1,
> +    ARMMMUBit_S1E2 = 1 << 2,
> +    ARMMMUBit_S1E3 = 1 << 3,
> +    ARMMMUBit_S1SE0 = 1 << 4,
> +    ARMMMUBit_S1SE1 = 1 << 5,
> +    ARMMMUBit_S2NS = 1 << 6,
>      /* Indexes below here don't have TLBs and are used only for AT system
>       * instructions or for the first stage of an S12 page table walk.
>       */
> -    ARMMMUIdx_S1NSE0 = 7,
> -    ARMMMUIdx_S1NSE1 = 8,
> -} ARMMMUIdx;
> +    ARMMMUBit_S1NSE0 = 1 << 7,
> +    ARMMMUBit_S1NSE1 = 1 << 8,
> +} ARMMMUBitMap;
>
> -#define MMU_USER_IDX 0
> +typedef int ARMMMUIdx;
> +
> +static inline ARMMMUIdx arm_mmu_bit_to_idx(ARMMMUBitMap bit)
> +{
> +    g_assert(ctpop16(bit) == 1);
> +    return ctz32(bit);
> +}
> +
> +static inline ARMMMUBitMap arm_mmu_idx_to_bit(ARMMMUIdx idx)
> +{
> +    return 1 << idx;
> +}

I don't understand this redefinition though, causing...

> @@ -2109,13 +2109,13 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          /* stage 1 current state PL1: ATS1CPR, ATS1CPW */
>          switch (el) {
>          case 3:
> -            mmu_idx = ARMMMUIdx_S1E3;
> +            mmu_bit = ARMMMUBit_S1E3;
>              break;
>          case 2:
> -            mmu_idx = ARMMMUIdx_S1NSE1;
> +            mmu_bit = ARMMMUBit_S1NSE1;
>              break;
>          case 1:
> -            mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_S1NSE1;
> +            mmu_bit = secure ? ARMMMUBit_S1SE1 : ARMMMUBit_S1NSE1;
>              break;
>          default:
>              g_assert_not_reached();
> @@ -2125,13 +2125,13 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          /* stage 1 current state PL0: ATS1CUR, ATS1CUW */
>          switch (el) {
>          case 3:
> -            mmu_idx = ARMMMUIdx_S1SE0;
> +            mmu_bit = ARMMMUBit_S1SE0;
>              break;
>          case 2:
> -            mmu_idx = ARMMMUIdx_S1NSE0;
> +            mmu_bit = ARMMMUBit_S1NSE0;
>              break;
>          case 1:
> -            mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_S1NSE0;
> +            mmu_bit = secure ? ARMMMUBit_S1SE0 : ARMMMUBit_S1NSE0;
>              break;
>          default:
>              g_assert_not_reached();
> @@ -2139,17 +2139,17 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          break;
>      case 4:
>          /* stage 1+2 NonSecure PL1: ATS12NSOPR, ATS12NSOPW */
> -        mmu_idx = ARMMMUIdx_S12NSE1;
> +        mmu_bit = ARMMMUBit_S12NSE1;
>          break;
>      case 6:
>          /* stage 1+2 NonSecure PL0: ATS12NSOUR, ATS12NSOUW */
> -        mmu_idx = ARMMMUIdx_S12NSE0;
> +        mmu_bit = ARMMMUBit_S12NSE0;
>          break;
>      default:
>          g_assert_not_reached();
>      }
>
> -    par64 = do_ats_write(env, value, access_type, mmu_idx);
> +    par64 = do_ats_write(env, value, access_type, arm_mmu_bit_to_idx(mmu_bit));

... this sort of churn, only to convert *back* to an index.

> @@ -2185,26 +2186,26 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
>      case 0:
>          switch (ri->opc1) {
>          case 0: /* AT S1E1R, AT S1E1W */
> -            mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_S1NSE1;
> +            mmu_idx = secure ? ARMMMUBit_S1SE1 : ARMMMUBit_S1NSE1;
>              break;
>          case 4: /* AT S1E2R, AT S1E2W */
> -            mmu_idx = ARMMMUIdx_S1E2;
> +            mmu_idx = ARMMMUBit_S1E2;
>              break;
>          case 6: /* AT S1E3R, AT S1E3W */
> -            mmu_idx = ARMMMUIdx_S1E3;
> +            mmu_idx = ARMMMUBit_S1E3;
>              break;
>          default:
>              g_assert_not_reached();
>          }
>          break;
>      case 2: /* AT S1E0R, AT S1E0W */
> -        mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_S1NSE0;
> +        mmu_idx = secure ? ARMMMUBit_S1SE0 : ARMMMUBit_S1NSE0;
>          break;
>      case 4: /* AT S12E1R, AT S12E1W */
> -        mmu_idx = secure ? ARMMMUIdx_S1SE1 : ARMMMUIdx_S12NSE1;
> +        mmu_idx = secure ? ARMMMUBit_S1SE1 : ARMMMUBit_S12NSE1;
>          break;
>      case 6: /* AT S12E0R, AT S12E0W */
> -        mmu_idx = secure ? ARMMMUIdx_S1SE0 : ARMMMUIdx_S12NSE0;
> +        mmu_idx = secure ? ARMMMUBit_S1SE0 : ARMMMUBit_S12NSE0;
>          break;
>      default:
>          g_assert_not_reached();
> @@ -2499,8 +2500,8 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,

... and then there's this one where you don't rename the variable, and as far 
as I can tell don't adjust the argument for do_ats_write.

Which is probably a mistake?

Just define both Idx and Bit symbols and be done with it.


r~
