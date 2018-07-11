Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp283318wrq;
        Wed, 11 Jul 2018 07:36:52 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcMyS2twd0IvU6OIsHAd65OEdpPQrWS2pK4txIA7Fl2K1AIX92/ydT4lgiQsnKb3b578LD+
X-Received: by 2002:a37:9986:: with SMTP id b128-v6mr26033677qke.288.1531319812615;
        Wed, 11 Jul 2018 07:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531319812; cv=none;
        d=google.com; s=arc-20160816;
        b=TQ0jmqz2neLRrYy/jAHyvV0W3JrLQELcoD+wDTx4bw3bDLU6GOfDlgJdLjahu6oHuZ
         za1xjBg8VlTSmEICHmn/BTSTgbCxzYu6VEQepkz/TitgQi0jiPcTRNAzP3Ihx0TUtWHl
         xGjuRFSOaLpKroX+xvndwEDygcPeojmbWCCHlUNkH9ezl5aFP/lH72jt1hXSVUvitONn
         UwU+DS+LuQOudoTRxTJFHtmCyMlo74P0LfzQ26OhgIBEmFZnu83MOYkQQoEBg6D/kI8w
         yX0oyXudssmw8t5iXUW4+2+SQJeXaVPYMMokE69XSHGV8ncO7aDvgGyAlwZHM2sXCmIe
         1k4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=3T7mZEsULfiVm339tVXnbZQ+uuCJLO0CjFdVwUt2Pcs=;
        b=cz/M8P/HRC+xMqWF1rLrdMln3z4iY7nuzVprDj+tHYUiaq0/nra4xj8460nshT2pTU
         eMvQIylfAWBb8MYODg2TWOMD5mGdBwe9jGt5LD2rmZc3A9h+mBkb2svMpVtzN+4vErgs
         JvHbkF1nH41cFVthFd3cBsSgXCw1ykI7+yQ8i3XUnTcS3TzLtbJe5H4pAPklmTHlJHZN
         sbGTOXP5/3QjG5BCHbiavs+CzGJYLuPa937z+mTFGTosy07ZEbMtNiIlldDgzz9L6iwz
         2tnZywSWTlOBlC9IWJKwGTdTDPKXZW2C9vFgo7n3UeaDvzmYZYp/eShTYP/RICdNX1US
         acKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K3MBThg8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6-v6si10870120qtc.19.2018.07.11.07.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 07:36:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K3MBThg8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdGEe-0001kq-2c
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 10:36:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fdGEE-0001kb-3G
	for qemu-devel@nongnu.org; Wed, 11 Jul 2018 10:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fdGE9-0004Eg-CZ
	for qemu-devel@nongnu.org; Wed, 11 Jul 2018 10:36:26 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:41751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fdGE9-0004EF-6l; Wed, 11 Jul 2018 10:36:21 -0400
Received: by mail-qk0-x243.google.com with SMTP id d22-v6so13666587qkc.8;
	Wed, 11 Jul 2018 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3T7mZEsULfiVm339tVXnbZQ+uuCJLO0CjFdVwUt2Pcs=;
	b=K3MBThg85drWqEpN5znS+iaW4vJQ9jn9b81OAd/mQ8FyRcw4ME9tbAjtBPcTSI5sVE
	65KIoezkRdalvlp01fiGcUt/FEP2UEw4ZxOSfJ3e2WXjDasWCGpaC/QR1LTnnKe5xUpx
	eijanba8Ikds4jV7ATyDbzo+YDTu1cSdgaltNuhZRaN0s4wrsFGEOv8VDwECHhwqGAlG
	Unyd/LHZxED3aLc2pZy/CVJT4WfG8ewgkTrYwUDfN89k18fqxvjWBfb7kv/W1d6OndcP
	Z0Ih20itpzdGhQDTbyDbEQyUtZFPyd8xvRkOSu3lvKJGAVD5navBH7ph/cuE71hXvE/M
	ZsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3T7mZEsULfiVm339tVXnbZQ+uuCJLO0CjFdVwUt2Pcs=;
	b=q+D51tIWYQg4aBfrBnTAFt39tZjYIOy5PsVW3TUCpHzDrRuueHK6EaDENLpygIqI1y
	1WOR3qWNfHHDytjYOJBNySLR6mITUXJa0OA7WvV95VYpO8VMfERYpfdRnblIoHi+i6N1
	dVlHjPpmyC2XOO7RW19wJhcf7ZX4pYHil5n7Qj6s/KKFjUWCYAhaLynDjc4vQ0uKuodO
	SjsG8oKYm4v8TjMJjGijRIu8cBgC8BUFjFFWfD+OgpIU/A/YNPLCKlCoR35jFVfmlruq
	wLesRUzPYokvu0BQRpE7+Bap1qZRfpr8bzyVlcatOIVVKyOG+nvFgsDgHKDofUE4W/e8
	3oGA==
X-Gm-Message-State: APt69E2i3TWfiro9EE5dh2bm8XJ53LXTHWFfOOqqbdKWaoPJA5xE7DY6
	Gfmr9Xc419/3iMIG525mems=
X-Received: by 2002:a37:a310:: with SMTP id
	m16-v6mr26771705qke.254.1531319780546; 
	Wed, 11 Jul 2018 07:36:20 -0700 (PDT)
Received: from [192.168.0.109] (rinv01.quasar.net.ar. [138.117.48.1])
	by smtp.gmail.com with ESMTPSA id
	k8-v6sm14418331qti.4.2018.07.11.07.36.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jul 2018 07:36:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <544c91ef-b30e-a597-8f2a-59bd432c1b99@amsat.org>
Date: Wed, 11 Jul 2018 11:36:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 5/6] accel/tcg: Return -1 for
 execution from MMIO regions in get_page_addr_code()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7EMo6dAH1i+Z

On 07/10/2018 01:00 PM, Peter Maydell wrote:
> Now that all the callers can handle get_page_addr_code() returning -1,
> remove all the code which tries to handle execution from MMIO regions
> or small-MMU-region RAM areas. This will mean that we can correctly
> execute from these areas, rather than ending up either aborting QEMU
> or delivering an incorrect guest exception.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  accel/tcg/cputlb.c | 95 +++++-----------------------------------------
>  1 file changed, 10 insertions(+), 85 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index c491703f15f..abb0225dc79 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -741,39 +741,6 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>                              prot, mmu_idx, size);
>  }
>  
> -static void report_bad_exec(CPUState *cpu, target_ulong addr)
> -{
> -    /* Accidentally executing outside RAM or ROM is quite common for
> -     * several user-error situations, so report it in a way that
> -     * makes it clear that this isn't a QEMU bug and provide suggestions
> -     * about what a user could do to fix things.
> -     */
> -    error_report("Trying to execute code outside RAM or ROM at 0x"
> -                 TARGET_FMT_lx, addr);
> -    error_printf("This usually means one of the following happened:\n\n"
> -                 "(1) You told QEMU to execute a kernel for the wrong machine "
> -                 "type, and it crashed on startup (eg trying to run a "
> -                 "raspberry pi kernel on a versatilepb QEMU machine)\n"
> -                 "(2) You didn't give QEMU a kernel or BIOS filename at all, "
> -                 "and QEMU executed a ROM full of no-op instructions until "
> -                 "it fell off the end\n"
> -                 "(3) Your guest kernel has a bug and crashed by jumping "
> -                 "off into nowhere\n\n"
> -                 "This is almost always one of the first two, so check your "
> -                 "command line and that you are using the right type of kernel "
> -                 "for this machine.\n"
> -                 "If you think option (3) is likely then you can try debugging "
> -                 "your guest with the -d debug options; in particular "
> -                 "-d guest_errors will cause the log to include a dump of the "
> -                 "guest register state at this point.\n\n"
> -                 "Execution cannot continue; stopping here.\n\n");
> -
> -    /* Report also to the logs, with more detail including register dump */
> -    qemu_log_mask(LOG_GUEST_ERROR, "qemu: fatal: Trying to execute code "
> -                  "outside RAM or ROM at 0x" TARGET_FMT_lx "\n", addr);
> -    log_cpu_state_mask(LOG_GUEST_ERROR, cpu, CPU_DUMP_FPU | CPU_DUMP_CCOP);
> -}
> -
>  static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
>  {
>      ram_addr_t ram_addr;
> @@ -963,7 +930,6 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
>      MemoryRegionSection *section;
>      CPUState *cpu = ENV_GET_CPU(env);
>      CPUIOTLBEntry *iotlbentry;
> -    hwaddr physaddr, mr_offset;
>  
>      index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
>      mmu_idx = cpu_mmu_index(env, true);
> @@ -977,65 +943,24 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
>                    (TLB_RECHECK | TLB_INVALID_MASK)) == TLB_RECHECK)) {
>          /*
>           * This is a TLB_RECHECK access, where the MMU protection
> -         * covers a smaller range than a target page, and we must
> -         * repeat the MMU check here. This tlb_fill() call might
> -         * longjump out if this access should cause a guest exception.
> -         */
> -        int index;
> -        target_ulong tlb_addr;
> -
> -        tlb_fill(cpu, addr, 0, MMU_INST_FETCH, mmu_idx, 0);
> -
> -        index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
> -        tlb_addr = env->tlb_table[mmu_idx][index].addr_code;
> -        if (!(tlb_addr & ~(TARGET_PAGE_MASK | TLB_RECHECK))) {
> -            /* RAM access. We can't handle this, so for now just stop */
> -            cpu_abort(cpu, "Unable to handle guest executing from RAM within "
> -                      "a small MPU region at 0x" TARGET_FMT_lx, addr);
> -        }
> -        /*
> -         * Fall through to handle IO accesses (which will almost certainly
> -         * also result in failure)
> +         * covers a smaller range than a target page. Return -1 to
> +         * indicate that we cannot simply execute from RAM here;
> +         * we will perform the necessary repeat of the MMU check
> +         * when the "execute a single insn" code performs the
> +         * load of the guest insn.
>           */
> +        return -1;
>      }
>  
>      iotlbentry = &env->iotlb[mmu_idx][index];
>      section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
>      mr = section->mr;
>      if (memory_region_is_unassigned(mr)) {
> -        qemu_mutex_lock_iothread();
> -        if (memory_region_request_mmio_ptr(mr, addr)) {
> -            qemu_mutex_unlock_iothread();
> -            /* A MemoryRegion is potentially added so re-run the
> -             * get_page_addr_code.
> -             */
> -            return get_page_addr_code(env, addr);
> -        }
> -        qemu_mutex_unlock_iothread();
> -
> -        /* Give the new-style cpu_transaction_failed() hook first chance
> -         * to handle this.
> -         * This is not the ideal place to detect and generate CPU
> -         * exceptions for instruction fetch failure (for instance
> -         * we don't know the length of the access that the CPU would
> -         * use, and it would be better to go ahead and try the access
> -         * and use the MemTXResult it produced). However it is the
> -         * simplest place we have currently available for the check.
> +        /*
> +         * Not guest RAM, so there is no ram_addr_t for it. Return -1,
> +         * and we will execute a single insn from this device.
>           */
> -        mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
> -        physaddr = mr_offset +
> -            section->offset_within_address_space -
> -            section->offset_within_region;
> -        cpu_transaction_failed(cpu, physaddr, addr, 0, MMU_INST_FETCH, mmu_idx,
> -                               iotlbentry->attrs, MEMTX_DECODE_ERROR, 0);
> -
> -        cpu_unassigned_access(cpu, addr, false, true, 0, 4);
> -        /* The CPU's unassigned access hook might have longjumped out
> -         * with an exception. If it didn't (or there was no hook) then
> -         * we can't proceed further.
> -         */
> -        report_bad_exec(cpu, addr);
> -        exit(1);
> +        return -1;
>      }
>      p = (void *)((uintptr_t)addr + env->tlb_table[mmu_idx][index].addend);
>      return qemu_ram_addr_from_host_nofail(p);
> 
