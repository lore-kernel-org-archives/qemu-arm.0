Received: by 10.25.208.194 with SMTP id h185csp260479lfg;
        Thu, 21 Apr 2016 08:47:24 -0700 (PDT)
X-Received: by 10.25.40.144 with SMTP id o138mr4348475lfo.160.1461253644007;
        Thu, 21 Apr 2016 08:47:24 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x22e.google.com (mail-lb0-x22e.google.com. [2a00:1450:4010:c04::22e])
        by mx.google.com with ESMTPS id m129si1986131lfm.8.2016.04.21.08.47.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Apr 2016 08:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::22e as permitted sender) client-ip=2a00:1450:4010:c04::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::22e as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lb0-x22e.google.com with SMTP id u8so29391637lbk.0;
        Thu, 21 Apr 2016 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=UtxFG2m81HWJW2vpHgx2lqwent8h9dgGq57/e8CKjAY=;
        b=UeQmSvM+puDjtaghADpj3TV5gB4JEQCAljgMvRLlmJtoKMxBPIAV69laSH1mKM2Yw2
         K20GXhriSP/C2lXdKoez7itAORJYjDb286Km7MIoarXZ6xyaI3V10QcWT764U+Z+opG7
         3ba51vYY3jqkLg6yGgrTkDYJWWQ+FG6wWK+bIYMJgF2Sr4IlOHP93kZrMsAvpmP81Ldy
         Cnt/43kblzmbpuLzKaYBOaVhHEe6GQiiLju1IjIQYiPyFDLaEZS2y3pZWT5SXWELZzWe
         btIIODekJIqixNrCDPqA3TsLjabREVnKyWfoTauacI6cs9tYHS8dMfS//YXTT5JLCdFX
         dghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=UtxFG2m81HWJW2vpHgx2lqwent8h9dgGq57/e8CKjAY=;
        b=S16FQihq6GGahnwYtQyDOEiQls2JSr/NOxeD3Ik11JU/ctM4E/NevEPmoqMn1ZazlX
         fHMzaVdVcD6PvwuofpFntRVLzUjCh4rMFj67z8IT+tODmJm0CdHm6XljvE+SKjiIzqdx
         wSe1vJOEA0pnK32yj2JjbeS5uZpHgWQfBfnVFwPYt+x8kfbsMNqZnmnzM56LVYYRv1jF
         oOqpJAmmWW9gbJrlMog+Sva/3cfa69CwoEtG4umoKtFRM9GLxs+v2y4Y0M6z2MZHF/PW
         ILWEnP2OE4jyFNQsPje/gKJPURls/ysfSRaibHYP+zYhuuNoCX7pXVg5dCsARI4CPqBe
         0nkw==
X-Gm-Message-State: AOPr4FW28Nufk0mVR8Nc/gsG+4Jps8z87PYC+6+USo4+tEpRIaPKUJ+lBUcNxs0a5w+AsQ==
X-Received: by 10.112.34.161 with SMTP id a1mr6760036lbj.29.1461253643785;
        Thu, 21 Apr 2016 08:47:23 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.1.189] ([195.91.132.170])
        by smtp.gmail.com with ESMTPSA id k190sm665802lfb.34.2016.04.21.08.47.22
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 21 Apr 2016 08:47:22 -0700 (PDT)
Subject: Re: [PATCH 08/11] tcg/aarch64: Make direct jump patching thread-safe
To: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org>
 <1460044433-19282-9-git-send-email-sergey.fedorov@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Claudio Fontana <claudio.fontana@huawei.com>, qemu-arm@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <5718F609.7030401@gmail.com>
Date: Thu, 21 Apr 2016 18:47:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1460044433-19282-9-git-send-email-sergey.fedorov@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: MiLMugQUcwx5

On 07/04/16 18:53, Sergey Fedorov wrote:
> From: Sergey Fedorov <serge.fdrv@gmail.com>
>
> Ensure direct jump patching in AArch64 is atomic by using
> atomic_read()/atomic_set() for code patching.
>
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
> ---
>  tcg/aarch64/tcg-target.inc.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
> index 0ed10a974121..15fdebec921f 100644
> --- a/tcg/aarch64/tcg-target.inc.c
> +++ b/tcg/aarch64/tcg-target.inc.c
> @@ -73,6 +73,18 @@ static inline void reloc_pc26(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>      *code_ptr = deposit32(*code_ptr, 0, 26, offset);
>  }
>  
> +static inline void reloc_pc26_atomic(tcg_insn_unit *code_ptr,
> +                                     tcg_insn_unit *target)
> +{
> +    ptrdiff_t offset = target - code_ptr;
> +    tcg_insn_unit insn;
> +    assert(offset == sextract64(offset, 0, 26));

I'd better use tcg_debug_assert() here as in this patch:

http://patchwork.ozlabs.org/patch/613020/

Kind regards,
Sergey

> +    /* read instruction, mask away previous PC_REL26 parameter contents,
> +       set the proper offset, then write back the instruction. */
> +    insn = atomic_read(code_ptr);
> +    atomic_set(code_ptr, deposit32(insn, 0, 26, offset));
> +}
> +
>  static inline void reloc_pc19(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>  {
>      ptrdiff_t offset = target - code_ptr;
> @@ -835,7 +847,7 @@ void aarch64_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr)
>      tcg_insn_unit *code_ptr = (tcg_insn_unit *)jmp_addr;
>      tcg_insn_unit *target = (tcg_insn_unit *)addr;
>  
> -    reloc_pc26(code_ptr, target);
> +    reloc_pc26_atomic(code_ptr, target);
>      flush_icache_range(jmp_addr, jmp_addr + 4);
>  }
>  
