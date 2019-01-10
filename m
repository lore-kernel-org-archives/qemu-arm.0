Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1930595wrt;
        Thu, 10 Jan 2019 07:21:04 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4HhJ9DdpzMsUbfMTr5hEpIk3vtXgCGFhT+jcpj5f8fI/FMnMqRRWSE7zZyTasTUthISTDL
X-Received: by 2002:a7b:cb96:: with SMTP id m22mr10526045wmi.39.1547133664827;
        Thu, 10 Jan 2019 07:21:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547133664; cv=none;
        d=google.com; s=arc-20160816;
        b=B8G0EMHsc4n7KfsMD1tutwqmK8q3OkoyO3d8v2d4tdViiqYAeQkhvDUBnEB1iKgovS
         0hdy7RM/45wRhAHKBcMOiBBQqc0/ielnZRtM/qIcAUzeqfKMEmtibRC7GWJKH7X5+ySD
         tiP9xs0zdXCZF5fkdXAaPKCbXH4HXWUP4cYMJPQopcN7uxX3K9S2/ibNV4k9yI69ZAwF
         rAz+LdZijzoCzkiw/HugXaW//DNXUNnUyuDYhbC2GVRUw+zMhXrk5+xxd/nbZCEDknxY
         JwMaED6DyaE2Xc7uh0POP74YX7l5kcZXSc6nf/mLX67bZVfAia9MxCwpmj2b1WJUtQ9B
         v6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=6errlYQHXZD3+TqWhBzLXfYBrYCFzp5c5Z8yj0PQarU=;
        b=V2+ZB00UFZpdRYfQxbYNK9OKyw7oTYxdMjpiI4XZDAPaSl3Ar5eLw/+IdKruV4FbJy
         aVrHV8YGhasYuv1vYnBEpLpZytQRG0ul/G6x2GKYYS7BBiUsx06jXr2l0YHnm7iCBoap
         9qNYcfKMyLplG12/sFYLXyZ5K0aLxn/Gt1kpCUqAyVZGosX/Kuow9mGmyjw64juFbtC4
         Iaij5D4jmMhfzN/0TOI+c5yyGKovxyg3jF2x60sgp/cprg0b0UP2qCr5YQt2tnxHaUaq
         nLauFgOy2voK0Sguw65/C6YV5WXr1RCN0J0CB5U4W0GpgZpLNu8lFGlrtRgnJpaocZUV
         y/GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=HnKGFm2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t63si11057989wma.109.2019.01.10.07.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 07:21:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=HnKGFm2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:48822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghc8l-0005DK-QZ
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 10:21:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ghc8Y-0005D2-LO
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 10:20:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ghc8X-00016z-Ix
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 10:20:50 -0500
Received: from ip135.ip-5-135-226.eu ([5.135.226.135]:53362
	helo=beetle.greensocs.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ghc8X-00015X-8i; Thu, 10 Jan 2019 10:20:49 -0500
Received: from [172.16.11.100] (tiramisu.bar.greensocs.com [172.16.11.100])
	by beetle.greensocs.com (Postfix) with ESMTPS id 0A95497062;
	Thu, 10 Jan 2019 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=greensocs.com; s=mail;
	t=1547133287; bh=7mFGwHdqjpP9TQbhRTeS0WsnL6ds/GjwBUe9aXPb9fs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=HnKGFm2R17x+97FLKM5Z+PUiU0FTbf6xuYM+rLIUUHAgOa7BHnx0EF3TFGvqlV4mG
	YLpftuihGqhkMYxehsH1q96wIlqJxEuemqw4dBnd/U20g+HrYNoRJqcwcRmFMKl438
	PQ7XuD8QCHCC3Ms1ww1L6TVM6G4O0jPmeHKjOh4o=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-4-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <ba240a70-d51f-96d8-5edd-1178818978e4@greensocs.com>
Date: Thu, 10 Jan 2019 16:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20190108163008.7006-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/4] accel/tcg: Add cluster
 number to TCG TB hash
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i9zIZQNPEnJG

On 1/8/19 5:30 PM, Peter Maydell wrote:
> Include the cluster number in the hash we use to look
> up TBs. This is important because a TB that is valid
> for one cluster at a given physical address and set
> of CPU flags is not necessarily valid for another:
> the two clusters may have different views of physical
> memory, or may have different CPU features (eg FPU
> present or absent).
> 
> We put the cluster number in the high 8 bits of the
> TB cflags. This gives us up to 256 clusters, which should
> be enough for anybody. If we ever need more, or need
> more bits in cflags for other purposes, we could make
> tb_hash_func() take more data (and expand qemu_xxhash7()
> to qemu_xxhash8()).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  include/exec/exec-all.h   | 4 +++-
>  accel/tcg/cpu-exec.c      | 4 ++++
>  accel/tcg/translate-all.c | 3 +++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 815e5b1e838..aa7b81aaf01 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -351,9 +351,11 @@ struct TranslationBlock {
>  #define CF_USE_ICOUNT  0x00020000
>  #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held */
>  #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
> +#define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
> +#define CF_CLUSTER_SHIFT 24
>  /* cflags' mask for hashing/comparison */
>  #define CF_HASH_MASK   \
> -    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL)
> +    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL | CF_CLUSTER_MASK)
>  
>      /* Per-vCPU dynamic tracing state used to generate this TB */
>      uint32_t trace_vcpu_dstate;
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 870027d4359..e578a1a3aee 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -336,6 +336,10 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
>          return NULL;
>      }
>      desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
> +
> +    cf_mask &= ~CF_CLUSTER_MASK;
> +    cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> +
>      h = tb_hash_func(phys_pc, pc, flags, cf_mask, *cpu->trace_dstate);
>      return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
>  }
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 639f0b27287..ba27f5acc8c 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1692,6 +1692,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>          cflags |= CF_NOCACHE | 1;
>      }
>  
> +    cflags &= ~CF_CLUSTER_MASK;
> +    cflags |= cpu->cluster_index << CF_CLUSTER_SHIFT;
> +
>   buffer_overflow:
>      tb = tb_alloc(pc);
>      if (unlikely(!tb)) {
> 
