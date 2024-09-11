Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp91524nji;
        Wed, 11 Sep 2024 02:41:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTfxOK8F8BzYMm5JrAwpY0bJ0jX+wedxqByzdk8ovtQp8Z3YodchyIp10dZ0qbkwGJAO9lVbV/3u6uDQ==@linaro.org
X-Received: by 2002:a17:903:2345:b0:205:968b:31e2 with SMTP id d9443c01a7336-2074c713a5dmr40935255ad.59.1726047667652;
        Wed, 11 Sep 2024 02:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726047667; cv=none;
        d=google.com; s=arc-20160816;
        b=KPozf0x8P4vXxYMa0oSrlTMZdjnmNXQBb30AsIpmxlytFWfT7eT+MDCmyWEyde727f
         W6F1zJHJ2GgZjdSG6XPAUouXsBZfj9ahNX7BzghD5FqcXtg9QgpWHW853U0JgynmT9Ko
         4l9rftLsFEFBvZ05Sdu/8SpOLqvSTxetOFIQvZzdZcqnLiKecUwNoDVSlflTqWjfOBzl
         37bQ3DAbeUsBKxTfDf1DEV6CSb/6LZqxFThBVD9kRXSJ+TqWgTZ95VQh4+X9w0r6H/nP
         4E3sttMtGlcebWByRyG/tGXvUhdGSlOcuNcw4jyYwPB03z9LgXgmBUXHPCZn0zFdY1UY
         SH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZH76peFaXLdICfPd8UUu5baYGOKW8r9xCr4PXI8Nk/M=;
        fh=DLWeB1LDwl5mDEruhfF9pmOdwfDGANlDPXMwGsvfjFU=;
        b=yU4reFi1Tim6i8Cf3atevIpvA3DNTtfn4XgVqbZDyXAwoIsj1STFlyfzsWxGdy6Y4O
         K2bwfC5cvCaFS319mjagUXZl8U7MSrLgNVmrcjqL9w+ITRsM5GmIi039Aeg7VYbV4hGA
         ZznAn5G0nIXUnTsu7PjYMys3SJID+eiYrzj4Gr4eZyWA0VyTXh9cYcqdsDWCX8lPa6cQ
         zlPvrau50oZE8Wu/4o3fueu5NJ1YK+hnErdF6E999WWF3ZVm2pfWfWKTEnA3AzEyf912
         bJacBsBe5GUGE+tAj5adF3GosiqUWMIsaOnucK7BC0uCrU3Z6B2GbBnToXusfmzcqBGk
         HVGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=pgH3ay6k;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com;
       dara=neutral header.i=@linaro.org
Return-Path: <dbarboza@ventanamicro.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710f36e57sor52642915ad.16.2024.09.11.02.41.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 02:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=pgH3ay6k;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726047667; x=1726652467; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZH76peFaXLdICfPd8UUu5baYGOKW8r9xCr4PXI8Nk/M=;
        b=pgH3ay6kEG4T6rAdDWGykMtw0sgbqEcthZF60EN59iyry0ork4A4g/hYUUugVUnjqQ
         VYa8w26N4PdHXDR+5mB/5a8Qy/iMymInC2DtP6JyqEjzvmmmVus1BLM56dSLMAFzLPJT
         IW1D3oLFOhoW6GGUyEVP2sTrnVGyC0qrZGYmUu6QSYoknUZ6pJbL/8tVkFrsOZq4CytV
         D3I2rDpQsVwNTumuMV+h1rMMifFAF6sLHJlhvM5dC+1snGGQ3okPTSuxhonfY5S1RXyo
         8GuHDGrBXgCx8WyjYAy5vzDDMjhC0XJLFz0b0u4lpw2+XkXnZMU5+wXqx3RxcWCzQqyP
         NTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726047667; x=1726652467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH76peFaXLdICfPd8UUu5baYGOKW8r9xCr4PXI8Nk/M=;
        b=JpIIkW7854GHcu7QA3E28qGDYn7hwj9bL3rd3CXSDOCV0auU9tlNqpyrIWAieuUrCR
         L4b6ouzWyni2kNFJo48YhfJKJrJzdo9eOBg0bixbzXHt8Mx+tX60FizBkfg7wa9YsmXC
         7SW1old5mzpiv9Bp0qinQ1rj4Ls6RTQMcuG2+lPIbpVu2HrPVjP5R8pkoeWn+m6RK8ks
         T3FvflgtPvqYfp4cwK58hcbZ6UmcWjz9MIiSz3q73F1/fqe+yYjQ0Q82KCpew08gFEgI
         H/7ddCTg/pUwQUjaxS+ePX0enC9OF8hDrqvVNCJHLOENyEo8vxRMceodc6kHteg/rvfK
         fWIA==
X-Forwarded-Encrypted: i=1; AJvYcCXko/aYpldAijR0OGlXTxMweIS8oazHURCY/2TG9ALbIorW1d5cGjFQuLqpRqnbB3YNxZP9GfLjBnfuVA==@linaro.org
X-Gm-Message-State: AOJu0YzCafMuKQ7cR12VDA0lUmwmcf2IabHEfUH5rNpLedpKJLVZoFqT
	BfPPc8hioJ1xnoQxJM+wzshwyRkCeSj0TolYxASE1sYxwgy7i43bKaLQaMtHAC0=
X-Google-Smtp-Source: AGHT+IEhfhfwdLuRZa1ZT7Igq8vngKhwD8/HCRKJeSNTq/lbR3wSLZkiib03oBLW6DRrs0H9qvc3sA==
X-Received: by 2002:a17:902:db01:b0:206:88fa:54a6 with SMTP id d9443c01a7336-2074c5e5c4emr43558915ad.21.1726047667021;
        Wed, 11 Sep 2024 02:41:07 -0700 (PDT)
Return-Path: <dbarboza@ventanamicro.com>
Received: from [192.168.68.110] (201-68-240-198.dsl.telesp.net.br. [201.68.240.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710eef1e7sm59845355ad.120.2024.09.11.02.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 02:41:06 -0700 (PDT)
Message-ID: <b0b9f930-ac79-4710-ac43-6a26bb9dd0df@ventanamicro.com>
Date: Wed, 11 Sep 2024 06:40:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/39] target/ppc: replace assert(0) with
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-12-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240910221606.1817478-12-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: tMGknTnzJbro



On 9/10/24 7:15 PM, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/ppc/dfp_helper.c | 8 ++++----
>   target/ppc/mmu_helper.c | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
> index 5967ea07a92..6ef31a480b7 100644
> --- a/target/ppc/dfp_helper.c
> +++ b/target/ppc/dfp_helper.c
> @@ -249,7 +249,7 @@ static void dfp_set_FPRF_from_FRT_with_context(struct PPC_DFP *dfp,
>           fprf = 0x05;
>           break;
>       default:
> -        assert(0); /* should never get here */
> +        g_assert_not_reached(); /* should never get here */
>       }
>       dfp->env->fpscr &= ~FP_FPRF;
>       dfp->env->fpscr |= (fprf << FPSCR_FPRF);
> @@ -1243,7 +1243,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
>           } else if (decNumberIsQNaN(&dfp.b)) {                  \
>               vt.VsrD(1) = -2;                                   \
>           } else {                                               \
> -            assert(0);                                         \
> +            g_assert_not_reached();                                         \

Need to realign the '\'. Same thing with the other 2 instances below.

>           }                                                      \
>           set_dfp64(t, &vt);                                     \
>       } else {                                                   \
> @@ -1252,7 +1252,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
>           } else if ((size) == 128) {                            \
>               vt.VsrD(1) = dfp.b.exponent + 6176;                \
>           } else {                                               \
> -            assert(0);                                         \
> +            g_assert_not_reached();                                         \
>           }                                                      \
>           set_dfp64(t, &vt);                                     \
>       }                                                          \
> @@ -1300,7 +1300,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,          \
>           raw_inf = 0x1e000;                                                \
>           bias = 6176;                                                      \
>       } else {                                                              \
> -        assert(0);                                                        \
> +        g_assert_not_reached();                                                        \
>       }                                                                     \
>                                                                             \
>       if (unlikely((exp < 0) || (exp > max_exp))) {                         \

Otherwise,

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index b0a0676beba..b167b37e0ab 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -316,7 +316,7 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
>           break;
>       default:
>           /* Should never reach here with other MMU models */
> -        assert(0);
> +        g_assert_not_reached();
>       }
>   #else
>       ppc_tlb_invalidate_all(env);
