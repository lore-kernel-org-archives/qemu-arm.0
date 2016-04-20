Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r10sm5815105wjf.2.2016.04.20.07.01.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2016 07:01:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3AC0B3E022D;
	Wed, 20 Apr 2016 15:01:00 +0100 (BST)
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org> <1460044433-19282-9-git-send-email-sergey.fedorov@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.92.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Fedorov <sergey.fedorov@linaro.org>
Cc: qemu-devel@nongnu.org, Sergey Fedorov <serge.fdrv@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Claudio Fontana <claudio.fontana@huawei.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 08/11] tcg/aarch64: Make direct jump patching thread-safe
In-reply-to: <1460044433-19282-9-git-send-email-sergey.fedorov@linaro.org>
Date: Wed, 20 Apr 2016 15:01:00 +0100
Message-ID: <87k2jsv0pv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: u1ECjKJMq3kD


Sergey Fedorov <sergey.fedorov@linaro.org> writes:

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
> +    /* read instruction, mask away previous PC_REL26 parameter contents,
> +       set the proper offset, then write back the instruction. */

This comment could be moved from here and reloc_pc26 and made common for
the two following functions.

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

Otherwise:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>



--
Alex Bennée
