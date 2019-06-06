Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp8069700pjq;
        Thu, 6 Jun 2019 03:13:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAyUX7pDGlRaPz9e3haJdfnO19CUq4DAOSGyA3nY5o/e3ZXqVuMLHXKKaS8WU9o67YeUv8
X-Received: by 2002:ae9:f209:: with SMTP id m9mr17472149qkg.251.1559815998932;
        Thu, 06 Jun 2019 03:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559815998; cv=none;
        d=google.com; s=arc-20160816;
        b=NJvXk86oG/PzcVMWA1D5wJQd2tyg+/q1Avr7AW7yQN1khIvYN0VoaMq/L73O490Grd
         Jct+z4UA4LtbfnoqLgWFPNPearIeGrRz40qy5PEv9pUFaRDeMi0evm0Y57DaH9JQ7D17
         GijIPInaoqPYxOu6gsG1v9c0mncSFf3wAPHfcTCa/zP9eAK+C2prj0kp9R7w8ClBfEjD
         WfUyhXf+5M8LJssHBfc8M5zgtWWdn/77fY4cnzFfE47Ex3yB3IEkcqA7iaXy1CfK8xGc
         A2TIafYr4U7zLAyDGNJ2wjXRK/Zx5igsMrLhVC4nLbeH/DeEi0owYm1uSXfh6fyqUfqL
         npWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=9wiEK2+0ZUrZwTk4sre81Ob3/vclE1NSYh/ADzzfXsQ=;
        b=0jASHLnoa8T9vjae1q/kx0hd1QvFXsFJVnsUkWNfEZcJ1W29NM7WLu3FnVq7FdV0Sz
         sKvn84gKaNVW+4jgIztz2gXnLjv9M9uACF/DZupkH7oN4erBsY1Seh0UcZLktYXKJxoq
         DNj6kCViOZJktgiPqQp47hTtTuh7NdwDiUiJwHfc2Hv4weKDpLdro01ZDcJam+iNXKAh
         2IHDkGE7hq1Nisb+5/TV6a+u5zHPlo3AzSGC+aVo7ulICg65GBvPNbVu9VHOBKVCUsiz
         qePxIUhFwfnYC+VduwXZ5JlVMeYzOh93pwWWhnfOx36/PJQkmquCE+8+jqRE0QAcIxNp
         ZnHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k66si1384525qte.374.2019.06.06.03.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 03:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57707 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYpOY-0000xu-FG
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 06:13:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>) id 1hYpOM-0000w9-9h
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 06:13:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>) id 1hYpOK-0007r4-UV
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 06:13:06 -0400
Received: from foss.arm.com ([217.140.101.70]:41330)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>)
	id 1hYpOK-0007ml-LU; Thu, 06 Jun 2019 06:13:04 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8CDD341;
	Thu,  6 Jun 2019 03:13:02 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BACDF3F690;
	Thu,  6 Jun 2019 03:13:01 -0700 (PDT)
Date: Thu, 6 Jun 2019 11:12:59 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190606101258.GA28398@e103592.cambridge.arm.com>
References: <20190605205706.569-1-richard.henderson@linaro.org>
	<20190605205706.569-6-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605205706.569-6-richard.henderson@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [PATCH v6 5/6] linux-user: Parse
 NT_GNU_PROPERTY_TYPE_0 notes
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I7tO1yF1VVW9

On Wed, Jun 05, 2019 at 09:57:05PM +0100, Richard Henderson wrote:
> For aarch64, this includes the GNU_PROPERTY_AARCH64_FEATURE_1_BTI bit,
> which indicates that the image should be mapped with guarded pages.

Heads-up: for arm64 I plan to move to making PT_GNU_PROPERTY
authoritiative for ELF on linux: if this is present, we use it to find
the note directly and ignore any other notes; if there is no
PT_GNU_PROPERTY entry then we assume there is no NT_GNU_PROPERTY_TYPE_0
note.

This is not quite decided yet, but to avoid fragmentation I'd prefer
qemu and Linux apply the same policy -- I'll keep you in the loop about
the decision.

I think you can reasonable upstream this patch in qemu and then
subsequently make it stricter without an ABI break.  Upstream GNU ld
generates this entry today.

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 83 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 75 insertions(+), 8 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index a57b7049dd..1a12c60a33 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2253,7 +2253,7 @@ static void load_elf_image(const char *image_name, int image_fd,
>      struct elfhdr *ehdr = (struct elfhdr *)bprm_buf;
>      struct elf_phdr *phdr;
>      abi_ulong load_addr, load_bias, loaddr, hiaddr, error;
> -    int i, retval;
> +    int i, retval, prot_exec = PROT_EXEC;
>      const char *errmsg;
>  
>      /* First of all, some simple consistency checks */
> @@ -2288,17 +2288,78 @@ static void load_elf_image(const char *image_name, int image_fd,
>      loaddr = -1, hiaddr = 0;
>      info->alignment = 0;
>      for (i = 0; i < ehdr->e_phnum; ++i) {
> -        if (phdr[i].p_type == PT_LOAD) {
> -            abi_ulong a = phdr[i].p_vaddr - phdr[i].p_offset;
> +        struct elf_phdr *eppnt = phdr + i;
> +
> +        if (eppnt->p_type == PT_LOAD) {
> +            abi_ulong a = eppnt->p_vaddr - eppnt->p_offset;
>              if (a < loaddr) {
>                  loaddr = a;
>              }
> -            a = phdr[i].p_vaddr + phdr[i].p_memsz;
> +            a = eppnt->p_vaddr + eppnt->p_memsz;
>              if (a > hiaddr) {
>                  hiaddr = a;
>              }
>              ++info->nsegs;
> -            info->alignment |= phdr[i].p_align;
> +            info->alignment |= eppnt->p_align;
> +        } else if (eppnt->p_type == PT_NOTE) {
> +#ifdef TARGET_AARCH64
> +            /*
> +             * Process NT_GNU_PROPERTY_TYPE_0.
> +             *
> +             * TODO: The only item that is AArch64 specific is the
> +             * GNU_PROPERTY_AARCH64_FEATURE_1_AND processing at the end.
> +             * If we were to ever process GNU_PROPERTY_X86_*, all of the
> +             * code through checking the gnu0 magic number is sharable.
> +             * But for now, since this *is* only used by AArch64, don't
> +             * process the note elsewhere.
> +             */
> +            const uint32_t gnu0_magic = const_le32('G' | 'N' << 8 | 'U' << 16);
> +            uint32_t note[7];
> +
> +            /*
> +             * The note contents are 7 words, but depending on LP64 vs ILP32
> +             * there may be an 8th padding word at the end.  Check for and
> +             * read the minimum size.  Further checks below will validate
> +             * that the sizes of everything involved are as we expect.
> +             */
> +            if (eppnt->p_filesz < sizeof(note)) {
> +                continue;
> +            }
> +            if (eppnt->p_offset + eppnt->p_filesz <= BPRM_BUF_SIZE) {
> +                memcpy(note, bprm_buf + eppnt->p_offset, sizeof(note));
> +            } else {
> +                retval = pread(image_fd, note, sizeof(note), eppnt->p_offset);
> +                if (retval != sizeof(note)) {
> +                    goto exit_perror;
> +                }
> +            }

Can we police that the segment alignment matches the ELF class (i.e., 8
for 64-bit, 4 for 32-bit)?

hjl specifies this, but it's controversial and sometimes missed --
there's a bug right now in GNU ld where --force-bti generates a note
with alignment 1.

Due to the high chance of screwing this up, it'd be good to police it
wherever appropriate.

> +#ifdef BSWAP_NEEDED
> +            for (i = 0; i < ARRAY_SIZE(note); ++i) {
> +                bswap32s(note + i);
> +            }
> +#endif
> +            /*
> +             * Check that this is a NT_GNU_PROPERTY_TYPE_0 note.
> +             * Again, descsz includes padding.  Full size validation
> +             * awaits checking the final payload.
> +             */
> +            if (note[0] != 4 ||                       /* namesz */
> +                note[1] < 12 ||                       /* descsz */
> +                note[2] != NT_GNU_PROPERTY_TYPE_0 ||  /* type */
> +                note[3] != gnu0_magic) {              /* name */
> +                continue;
> +            }
> +            /*
> +             * Check for the BTI feature.  If present, this indicates
> +             * that all the executable pages of the binary should be
> +             * mapped with PROT_BTI, so that branch targets are enforced.
> +             */
> +            if (note[4] == GNU_PROPERTY_AARCH64_FEATURE_1_AND &&
> +                note[5] == 4 &&
> +                (note[6] & GNU_PROPERTY_AARCH64_FEATURE_1_BTI)) {
> +                prot_exec |= TARGET_PROT_BTI;
> +            }
> +#endif /* TARGET_AARCH64 */
>          }
>      }
>  
> @@ -2358,9 +2419,15 @@ static void load_elf_image(const char *image_name, int image_fd,
>              abi_ulong vaddr, vaddr_po, vaddr_ps, vaddr_ef, vaddr_em, vaddr_len;
>              int elf_prot = 0;
>  
> -            if (eppnt->p_flags & PF_R) elf_prot =  PROT_READ;
> -            if (eppnt->p_flags & PF_W) elf_prot |= PROT_WRITE;
> -            if (eppnt->p_flags & PF_X) elf_prot |= PROT_EXEC;
> +            if (eppnt->p_flags & PF_R) {
> +                elf_prot |= PROT_READ;
> +            }
> +            if (eppnt->p_flags & PF_W) {
> +                elf_prot |= PROT_WRITE;
> +            }
> +            if (eppnt->p_flags & PF_X) {
> +                elf_prot |= prot_exec;
> +            }

Ack.

There are interesting subtleties with segment alignments here: the prot
flags on each segment "bleed" to an adjacent boundary.  I'm not sure
that behaviour is well specified, but we at least get away with it due
to conventions regarding the ordering of segments.

I still have to think about whether this works right for PROT_BTI, which
is a prohibition rather than a permission, suggesting that the bleed
rules might need to be inverted for it.

My current policy is that because and ELF is all-BTI if any page is BTI,
we probably get away with it, without having to do anything special.

[...]

Cheers
---Dave
