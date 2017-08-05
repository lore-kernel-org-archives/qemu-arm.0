Received: by 10.25.221.202 with SMTP id w71csp140966lfi;
        Fri, 4 Aug 2017 18:12:23 -0700 (PDT)
X-Received: by 10.237.56.170 with SMTP id k39mr5845503qte.199.1501895543828;
        Fri, 04 Aug 2017 18:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501895543; cv=none;
        d=google.com; s=arc-20160816;
        b=SMColrM/w0CERXUzLWwN0JnuIS7B/sKiTYziJbTqQzkh6sJf7hp5IjJBzjYWlqKegG
         HK64wcuWBtNeXr8cPDA89czOQH/oWeRY/n8TEYiZaWQFgldC6WpoQa2FVSl1rSLC77Tv
         YXlWI0AiXBftZtdkcPj7y9cQ937nHTKrci0wdm2Tj4wjXRXW27LEwJ4EJYGIoNb0iyvn
         Yc3lDdcF/OnBIXzjZp/2oomB3D/ojSBTN3NQzR1Zaylq2G18dU4jJXguBgu4PAlLK77i
         jZx5hDVnJ02SJ5vMpaMeBgG6tAuH+nw/Z3TLQUeObHs15ZBupIaNWNKc+AJROI+1skiX
         ffyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=Qs0jVTCab+QodIl4GQjZplgctPJ4HHu8RQ+yXaFkVHU=;
        b=wQiKTu63tMmIULw1fG/6IkXd2MzTdHYyg7H3YrsgWMTYtqk1oyxhP0YxTk2K1b84g4
         /utaVXUBEYXKEp029UxWRLUd8RX4DJSHQ/mQc4SHzTvqT+7Wfa6+tHTd68MZ2r1X/yGM
         WY1QTgh18TmTaZn+yhPDzPLb/oK+wED85mwnBzuzXIo6qXDX3UQSWJCT2EiJqYOPY+b/
         RBaKmUwzqVwu0Iz9H3r1pvf5Zz4mX3sZgw2bH5DkyujoOpZlm8eFI8aVZK9diQyyQRmW
         6tDDdJaVdZFUnpYSiHgPWDti9tZzOuzNh0GXE1KBPw4bhqlB68qTzOppYA1A/183JA4n
         uSTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FTYKsVes;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z60si2666352qtc.272.2017.08.04.18.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 18:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FTYKsVes;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddndd-0001ws-6Z
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 21:12:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddndX-0001wi-4f
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:12:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddndU-00065m-GH
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:12:15 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddndU-00063o-3R; Fri, 04 Aug 2017 21:12:12 -0400
Received: by mail-lf0-x243.google.com with SMTP id w199so2013764lff.2;
	Fri, 04 Aug 2017 18:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Qs0jVTCab+QodIl4GQjZplgctPJ4HHu8RQ+yXaFkVHU=;
	b=FTYKsVesGxRq/mVK4eJ+XDth0Mqguyr87Iewe7Px4wkdP/M7kvT3np36KebU9R+bwj
	4bRIot1dvx4tHtfgc64rpq1aKoyBUTYZCz1Je/L2VrV2qZNcp7Sk11VFfnifN7bm9c3Z
	/UTpJ5UWTd+Ua69RVOgp6VUB9G+SX1j3pPFhN2TIW0b367YfNQf8XCBduatMbF3ZdZbu
	GiQOGILPn5g+KmrShxIDDf2kynVRrRggSG4rfVAmfzW4GajmmiDsw7JFscbkT8anIlJi
	13ks3z8E82pCLn1n35OKo8GsmWVtCQVjUZX8I517uYrWHKQjEcjaGyoPLxdnf2t+KrAt
	eBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Qs0jVTCab+QodIl4GQjZplgctPJ4HHu8RQ+yXaFkVHU=;
	b=oLEice9G8TA2auHVIl2JF5vbEfrogz5WqxmDDYAffkgfVx2zJYLz7EV3DLaGU2kRWR
	TM7mp4mL9sJjjwVBOu3e5Ji9E/9Lug1PnBBZ/yOirfwq1AinmmbAV837ikm4fVU4cFN0
	Sz18Ynt/R8i9n3dtNn7QwsM1FoLlBpL9yKsZmdY6LX9WxoTpFv3lOdesf5zhGmpNRnRx
	Hhy5KdsXSaZY0Eepj0DP5mCAH7BvWyuSAb0dj4COR2NwABxdWgqEi0gV89fO+TsdGO8J
	E/zu3M0YSbiA3Td+LYYwYDGKNncKmkbAnR/LuIlYeb3bXhANNutZbZlp7oWwHEg6dwS1
	c1HQ==
X-Gm-Message-State: AHYfb5jvzUsqUZguV6vvx2zimDQkGeUIoSNrRItKcbqhrG01x43uMdU1
	6f+N7g0iK9yvRg==
X-Received: by 10.25.207.85 with SMTP id f82mr1442331lfg.2.1501895530632;
	Fri, 04 Aug 2017 18:12:10 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	o142sm799864lfe.56.2017.08.04.18.12.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 18:12:09 -0700 (PDT)
Date: Sat, 5 Aug 2017 03:12:09 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170805011209.GA4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501867249-1924-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
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
X-TUID: LIicEFeyn4jP

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

BTW, a question. I don't know of any from memory but does any arch
have the ability to report the payload that failed for stores?
I guess it's easy enough to add that if needed though.


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
