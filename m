Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp250731wrq;
        Wed, 11 Jul 2018 07:06:39 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeKKgWLCvbZYGTtiUkM0h0WD45bCTxzGioGjzSmGfmbIJ0YRb3UAhDDBN3mm265eir9t7gu
X-Received: by 2002:a37:b085:: with SMTP id z127-v6mr1850644qke.376.1531317999535;
        Wed, 11 Jul 2018 07:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531317999; cv=none;
        d=google.com; s=arc-20160816;
        b=sz5XqF/P/EklYh83DWECecvyjZKVOe2RsiZDm3cS09FwBo4tG0ndX6Cr3dbLyEMDgD
         A/A1ufJgMp60uhaQZlrDSe6ipoKpvGAjpqE4SXn01pXslM+Dp/spr50MYaYuocv8yIGJ
         xTcYVCLS444b1hmSwJqSn/VxR3RNtdiGwV+RCZC2JXdwVW0Hsxuz4iARj9vkvhuD5mf7
         lwVhJx9FxAQXLzlgdSkpAj1lKxau4wchfU1tRcrz7wdhGdLPSkdYmRSStAiOSq2pcYZZ
         3ANC1446/SpCz3O2O4jspvNNqAJbW5fEqUDNTz+qcEawzhP7uclRcBjyPZLeLJNcyA1Y
         rEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=prlyLDxWy4UnLap6lNz8tlzu5hfHonpAazTJkqip+no=;
        b=lqhycaHu3IT6pilqCRQNcOw5xad2pJvizlPZW3HyV3OfslUiiPbPhirbrjhcgf9sTH
         CrnC4Dh4Iz+jO5s33aBtAo0+b1miw0Y56yKOth98SooPq0wkmM4DDfBEsBhmaRZeMCES
         1NDW42mpxOvqkCcbxktfBlZ5NyK/dH1kVNAU47co0NXzK9Rm1GoYFN2AZfNPG1+dw1/u
         VRrSbscG3/xktccBgQQbNw441SbouoqH7Y3ASM9f5ZvNwzzsqhFOwZIoDtZ6wR4Mxvva
         MgSM8mcKxVx6oQ/UeRR6n6BBB/CsdVzY0VQLQDN5I+idfIksXUzzxeioC6od4Ujzc6vD
         xQCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YMEoJ2sP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y39-v6si753455qtc.351.2018.07.11.07.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 07:06:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YMEoJ2sP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdFlO-0003gs-Uf
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 10:06:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fdFl9-0003f9-5j
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 10:06:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fdFl2-0007E4-TD
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 10:06:23 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35180)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fdFku-0007B7-3h; Wed, 11 Jul 2018 10:06:08 -0400
Received: by mail-qk0-x243.google.com with SMTP id u21-v6so13610770qku.2;
	Wed, 11 Jul 2018 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=prlyLDxWy4UnLap6lNz8tlzu5hfHonpAazTJkqip+no=;
	b=YMEoJ2sPdIaBRtwmljctjmFVelSWyhiHEQV3qk8GPEaIOCtqD2C4vEbJuvllxAEvgH
	cLiPHZ/PzaZK1gLUx5aHZfts3gZT6EjgpwywLEhBuMtcS5Rak7aGJgDq4FgjwF6IRFTw
	ief6vX0LDuaki4nEoFSpo6yTvU1k3qX+E9i1xFO8tk2+fL0hXFg62t6qgW8xRNsJKNml
	92eWnr329dCjlRDC70Lex/9zHQX2iT6iH9l3pZnga/pudokOCZbLIYKyPGdNql58XlIH
	AjHLqsvpMaOH465P9+Yp3TsEdvQe+pqFWmc3/fEmOiCbPrSlZ4+LVbx3NLkC5zaG1Ebt
	m7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=prlyLDxWy4UnLap6lNz8tlzu5hfHonpAazTJkqip+no=;
	b=oMrM5biY6pArKjZ1K+BtI8IMkdMKAGlsJkcwpSQgf/vVeCPHT/4E7vUsdn5hGQO/dj
	G1NNRrQBr+bnseZLMPuFHHYvjXrPU9DOUBxv0Z/F/aAcwMEKLP8BABNfS+iZ1gfQYjbp
	S1X2vm9vkAy6QZ87/fUOXH4BxKrfd2baldBnTJQJiKquvOnZan8jbTcy3twiiodxni6N
	djfQ3FUc0IfkEvEMlF48oHB2qHWJB1hDExZSet4u4rjyl6kbJlPhqgYUcNP60ctvk/Wt
	7ljd8dLdSs/cWKEd7uepy8to+xBSBIi9t7UjuhYY9zPGPGKGN4DFUzRGhlccA0d/yapF
	OT4A==
X-Gm-Message-State: AOUpUlFizaLfGXBj7/icikVwHuOo74nD9O1o9qvN8BCNn5XYxeuRQ4NP
	o4mSxB2Z77gvlLeufFInfeA=
X-Received: by 2002:a37:3a8a:: with SMTP id
	h132-v6mr11553682qka.352.1531317967346; 
	Wed, 11 Jul 2018 07:06:07 -0700 (PDT)
Received: from [192.168.0.109] (rinv01.quasar.net.ar. [138.117.48.1])
	by smtp.gmail.com with ESMTPSA id
	t11-v6sm16415053qkt.28.2018.07.11.07.06.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jul 2018 07:06:06 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <95a3dddc-0d90-c380-3f87-a9aa53968912@amsat.org>
Date: Wed, 11 Jul 2018 11:06:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 1/6] accel/tcg: Pass read access type through
 to io_readx()
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
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BuQ3pHXQgmWX

On 07/10/2018 01:00 PM, Peter Maydell wrote:
> The io_readx() function needs to know whether the load it is
> doing is an MMU_DATA_LOAD or an MMU_INST_FETCH, so that it
> can pass the right value to the cpu_transaction_failed()
> function. Plumb this information through from the softmmu
> code.
> 
> This is currently not often going to give the wrong answer,
> because usually instruction fetches go via get_page_addr_code().
> However once we switch over to handling execution from non-RAM by
> creating single-insn TBs, the path for an insn fetch to generate
> a bus error will be through cpu_ld*_code() and io_readx(),
> so without this change we will generate a d-side fault when we
> should generate an i-side fault.
> 
> We also have to pass the access type via a CPU struct global
> down to unassigned_mem_read(), for the benefit of the targets
> which still use the cpu_unassigned_access() hook (m68k, mips,
> sparc, xtensa).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  accel/tcg/softmmu_template.h | 11 +++++++----
>  include/qom/cpu.h            |  6 ++++++
>  accel/tcg/cputlb.c           |  5 +++--
>  memory.c                     |  3 ++-
>  4 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/accel/tcg/softmmu_template.h b/accel/tcg/softmmu_template.h
> index badbf148803..f060a693d41 100644
> --- a/accel/tcg/softmmu_template.h
> +++ b/accel/tcg/softmmu_template.h
> @@ -99,11 +99,12 @@ static inline DATA_TYPE glue(io_read, SUFFIX)(CPUArchState *env,
>                                                size_t mmu_idx, size_t index,
>                                                target_ulong addr,
>                                                uintptr_t retaddr,
> -                                              bool recheck)
> +                                              bool recheck,
> +                                              MMUAccessType access_type)
>  {
>      CPUIOTLBEntry *iotlbentry = &env->iotlb[mmu_idx][index];
>      return io_readx(env, iotlbentry, mmu_idx, addr, retaddr, recheck,
> -                    DATA_SIZE);
> +                    access_type, DATA_SIZE);
>  }
>  #endif
>  
> @@ -140,7 +141,8 @@ WORD_TYPE helper_le_ld_name(CPUArchState *env, target_ulong addr,
>          /* ??? Note that the io helpers always read data in the target
>             byte ordering.  We should push the LE/BE request down into io.  */
>          res = glue(io_read, SUFFIX)(env, mmu_idx, index, addr, retaddr,
> -                                    tlb_addr & TLB_RECHECK);
> +                                    tlb_addr & TLB_RECHECK,
> +                                    READ_ACCESS_TYPE);
>          res = TGT_LE(res);
>          return res;
>      }
> @@ -207,7 +209,8 @@ WORD_TYPE helper_be_ld_name(CPUArchState *env, target_ulong addr,
>          /* ??? Note that the io helpers always read data in the target
>             byte ordering.  We should push the LE/BE request down into io.  */
>          res = glue(io_read, SUFFIX)(env, mmu_idx, index, addr, retaddr,
> -                                    tlb_addr & TLB_RECHECK);
> +                                    tlb_addr & TLB_RECHECK,
> +                                    READ_ACCESS_TYPE);
>          res = TGT_BE(res);
>          return res;
>      }
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index bd796579ee4..ecf6ed556a9 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -386,6 +386,12 @@ struct CPUState {
>       */
>      uintptr_t mem_io_pc;
>      vaddr mem_io_vaddr;
> +    /*
> +     * This is only needed for the legacy cpu_unassigned_access() hook;
> +     * when all targets using it have been converted to use
> +     * cpu_transaction_failed() instead it can be removed.
> +     */
> +    MMUAccessType mem_io_access_type;
>  
>      int kvm_fd;
>      struct KVMState *kvm_state;
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 20c147d6554..c491703f15f 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -789,7 +789,7 @@ static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
>  static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>                           int mmu_idx,
>                           target_ulong addr, uintptr_t retaddr,
> -                         bool recheck, int size)
> +                         bool recheck, MMUAccessType access_type, int size)
>  {
>      CPUState *cpu = ENV_GET_CPU(env);
>      hwaddr mr_offset;
> @@ -831,6 +831,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>      }
>  
>      cpu->mem_io_vaddr = addr;
> +    cpu->mem_io_access_type = access_type;
>  
>      if (mr->global_locking && !qemu_mutex_iothread_locked()) {
>          qemu_mutex_lock_iothread();
> @@ -843,7 +844,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>              section->offset_within_address_space -
>              section->offset_within_region;
>  
> -        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_LOAD,
> +        cpu_transaction_failed(cpu, physaddr, addr, size, access_type,
>                                 mmu_idx, iotlbentry->attrs, r, retaddr);
>      }
>      if (locked) {
> diff --git a/memory.c b/memory.c
> index e9cd4469688..2ea16e7bfb0 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1249,7 +1249,8 @@ static uint64_t unassigned_mem_read(void *opaque, hwaddr addr,
>      printf("Unassigned mem read " TARGET_FMT_plx "\n", addr);
>  #endif
>      if (current_cpu != NULL) {
> -        cpu_unassigned_access(current_cpu, addr, false, false, 0, size);
> +        bool is_exec = current_cpu->mem_io_access_type == MMU_INST_FETCH;
> +        cpu_unassigned_access(current_cpu, addr, false, is_exec, 0, size);
>      }
>      return 0;
>  }
> 
