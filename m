Received: by 10.25.221.202 with SMTP id w71csp136734lfi;
        Fri, 4 Aug 2017 18:06:47 -0700 (PDT)
X-Received: by 10.55.139.68 with SMTP id n65mr5183276qkd.172.1501895207051;
        Fri, 04 Aug 2017 18:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501895207; cv=none;
        d=google.com; s=arc-20160816;
        b=m5O/HZriZdplQBWBjfzDa0xAba9FEtoAFBiDvrjugh4OQkJmOEfDh5nvjoz4acxUWe
         nlwx91I/LBQHNaF6E36hVEo1PjSqKsXnYXrI61UJ3sbCQdqQTjloVTRiSBJqFIOB14OV
         SZqD+yQfqvXXk8GZPn68Uj8b+ySYKHNkMvfI3iujtul0FPUaK3X+oU/7DB9G7D1TvRdj
         n5DDit/zZBvcsVHQFWLWv3qeQQyqPs31JG0XzGxILvYKhwQjeh2CiNJWADt26S7jlh64
         qwzbvzAv+h1KEtStVdItiJdN+vN7p11FNgszgtO2D0QZmTHjR3BN6txovrhIwH96y5Om
         zAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=aBRatPUIDDPs6YOB+gJNHluek13IRbxV44ptJa0ULJ8=;
        b=m+9dbgfLzwHs3PZXoH8cGnwSJx8HKY4hDKg1ZY2al0Mxo0wafWmRufM425CcjqTg6Z
         CKpUd/gmsmfTSWSE/hTQrup0tnIYSBvh1VWP3dh1b1TqShLTsONd0f/Y1qs6W02Ai1ci
         zE+yHt1LiGL9h2ze6GgaAydvAhPzc1AF2LU327psnBtHKUVQf3RVy4pme7+r3cCzKM+k
         0YW9ZQr8U0xLyFaz1OQsKNcIcZ4EiaqlrFxW0sngu2lJAEIwe5brOUrjisq3nQ34xv46
         62/7MHgBhMt595lmXfbWMJivE/y8qtWLtpGnv6DliveqZWCKp2LNx8Hcd33mRqt+olsr
         bTVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=rK7hfqth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e5si2570260qtd.124.2017.08.04.18.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 18:06:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=rK7hfqth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddnYC-0007na-Br
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 21:06:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddnXz-0007kB-EB
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:06:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddnXt-0000bq-FU
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:06:31 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:37489)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddnXt-0000aL-30; Fri, 04 Aug 2017 21:06:25 -0400
Received: by mail-lf0-x242.google.com with SMTP id x16so2009301lfb.4;
	Fri, 04 Aug 2017 18:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aBRatPUIDDPs6YOB+gJNHluek13IRbxV44ptJa0ULJ8=;
	b=rK7hfqth+gRFc3R7BWST3zOzdz9Fk2ZZhPLlam0zCG2wuHYcUvLH/Bj8jaPF0xnaN8
	LmawrLLak2QSl/BEDYFuu/I3BTsND30J02LDB9W0BBsWcmeUokwC4CpqWnNxuKjg19Yw
	43kh+OaJfGn8Dkvr1EZE3IQETcDPL9NRdxxuluP7wQoZ17UuzNxMv1wDYsoEXfLbTIFV
	a7Dh94jQa+ADTJt72kskA4ldxtfuXg8C/bFeUXvOtXWYu6felwy24hCFFPIpDXmtgK+X
	vLjnznzenJtBWGM+3ozijktvQf7UchHxJDKQe4R+vDnbha1W2bQCzQaHG+PN9/MGmeUK
	G61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aBRatPUIDDPs6YOB+gJNHluek13IRbxV44ptJa0ULJ8=;
	b=FkZrOPD8ZA1dPoLpZAcTm0R5NG5DZOwagbyHvCVeYIY+y8Po3LMThJvchRqy3JN27y
	rg8IDqsGLVhhNR30bfLt9kini90UtLQRbH9PVhIF+N12Dy14opQFj94IvnkVce4ICXLe
	AGQOvon3e4N2JyQ/IO7130oLBuuvrh2K1nOliR3kNIPXZmziF2PSy7MsrjODeAJp2N61
	Y3O9GQWI3TMqX5xmLgcMtfoWOunaWe2PhWZLrIuroC14UEsLHe6cLjgY8yFYb+sesiQs
	YBwpVVj19eY0zcllW9C1vmqsJV+vOIOyihun8fWLliuLmN9VuiD+pqS5AxL81fzWMVWU
	08RQ==
X-Gm-Message-State: AIVw1115Zb+YGHcweq7sj0rC6jZEnMzjRxbeJwpR+PlnTnIGGLEkMYUs
	NhlOI8S7FAlTjw==
X-Received: by 10.46.5.141 with SMTP id 135mr1568229ljf.95.1501895183527;
	Fri, 04 Aug 2017 18:06:23 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	x133sm774127lfd.58.2017.08.04.18.06.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 18:06:22 -0700 (PDT)
Date: Sat, 5 Aug 2017 03:06:22 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170805010622.GZ4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501867249-1924-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH 2/8] cpu: Define new cpu_transaction_failed()
 hook
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v+eJkxEFIaMf

On Fri, Aug 04, 2017 at 06:20:43PM +0100, Peter Maydell wrote:
> Currently we have a rather half-baked setup for allowing CPUs to
> generate exceptions on accesses to invalid memory: the CPU has a
> cpu_unassigned_access() hook which the memory system calls in
> unassigned_mem_write() and unassigned_mem_read() if the current_cpu
> pointer is non-NULL.  This was originally designed before we
> implemented the MemTxResult type that allows memory operations to
> report a success or failure code, which is why the hook is called
> right at the bottom of the memory system.  The major problem with
> this is that it means that the hook can be called even when the
> access was not actually done by the CPU: for instance if the CPU
> writes to a DMA engine register which causes the DMA engine to begin
> a transaction which has been set up by the guest to operate on
> invalid memory then this will casue the CPU to take an exception
> incorrectly.  Another minor problem is that currently if a device
> returns a transaction error then this won't turn into a CPU exception
> at all.
> 
> The right way to do this is to have allow the CPU to respond
> to memory system transaction failures at the point where the
> CPU specific code calls into the memory system.
> 
> Define a new QOM CPU method and utility function
> cpu_transaction_failed() which is called in these cases.
> The functionality here overlaps with the existing
> cpu_unassigned_access() because individual target CPUs will
> need some work to convert them to the new system. When this
> transition is complete we can remove the old cpu_unassigned_access()
> code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> ---
>  include/qom/cpu.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 25eefea..fc54d55 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -85,8 +85,10 @@ struct TranslationBlock;
>   * @has_work: Callback for checking if there is work to do.
>   * @do_interrupt: Callback for interrupt handling.
>   * @do_unassigned_access: Callback for unassigned access handling.
> + * (this is deprecated: new targets should use do_transaction_failed instead)
>   * @do_unaligned_access: Callback for unaligned access handling, if
>   * the target defines #ALIGNED_ONLY.
> + * @do_transaction_failed: Callback for handling failed memory transactions

Looks OK but I wonder if there you might want to clarify that this is a
bus/slave failure and not a failure within the CPU (e.g not an MMU fault).

Anyway:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



>   * @virtio_is_big_endian: Callback to return %true if a CPU which supports
>   * runtime configurable endianness is currently big-endian. Non-configurable
>   * CPUs can use the default implementation of this method. This method should
> @@ -153,6 +155,10 @@ typedef struct CPUClass {
>      void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>                                  MMUAccessType access_type,
>                                  int mmu_idx, uintptr_t retaddr);
> +    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
> +                                  unsigned size, MMUAccessType access_type,
> +                                  int mmu_idx, MemTxAttrs attrs,
> +                                  MemTxResult response, uintptr_t retaddr);
>      bool (*virtio_is_big_endian)(CPUState *cpu);
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>                             uint8_t *buf, int len, bool is_write);
> @@ -837,6 +843,21 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
>  
>      cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
>  }
> +
> +static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
> +                                          vaddr addr, unsigned size,
> +                                          MMUAccessType access_type,
> +                                          int mmu_idx, MemTxAttrs attrs,
> +                                          MemTxResult response,
> +                                          uintptr_t retaddr)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    if (cc->do_transaction_failed) {
> +        cc->do_transaction_failed(cpu, physaddr, addr, size, access_type,
> +                                  mmu_idx, attrs, response, retaddr);
> +    }
> +}
>  #endif
>  
>  #endif /* NEED_CPU_H */
> -- 
> 2.7.4
> 
> 
