Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1044857lfb;
        Mon, 19 Apr 2021 03:48:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnwPbzV0xMQHYW8JALUwZKgzlsGATWGzZ3O9pr03ff3nLlak3lJmf28VKH2qlVyXAhSLTU
X-Received: by 2002:a05:6e02:2197:: with SMTP id j23mr17669414ila.269.1618829325260;
        Mon, 19 Apr 2021 03:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618829325; cv=none;
        d=google.com; s=arc-20160816;
        b=fh6bSjrbmiojVmzgzbv7OFmiyOUm3m27VraU39hltaI1O0qwc9LP/+D2iqs5AqDCgY
         T3rx8F6snfdyzTTKNTSr2WdKeotVEfzmiC+Tv2jCr8LMoiLCGGv7+k8ZQx0sd3BGhuZR
         g0u7t47cHD8Nk/Qq46/il/z8vtaXUUjF1RjTMzEGWSqBsCbWqNKBYvxBkdHQ9IoNpOLC
         LLPzx4rvNWQeYMOgzkrNkQ18+yIjceNcH+tSZtOF3r4Tf4k8UTFVYvw5+hRdwjD+DhsC
         +/2xdv3XAnElMoETZwP+UXeAn8yzJsWMUb0GR4Stl1rwHdMMKpR6Rmb6V2gjBbHTr66r
         tqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=thLCvsKF4JLLVn9m7XIL+hac1/cC7Oo0cvtR1zER0lM=;
        b=UYBam4T1VkOvsrL+hYomlS5lVtQGlbMSA3QBvladLXu8UZyQhehT4Zc3M5y7x6dnJW
         PB1qYXORj9MpmZEL9ptCVXXC3+rxM58z+j72tu6V7xMUWPHSfOyVVYDsLvaEH2urk59X
         JNjBXYNRpHo1i/xPrwq7+g/09tTLWld+L+XboNcFxJ9KKiRecN9Icg+gmYjB5Wo+SsyF
         A6BAUVaeZ+8HBRU9/yHPaLZLehFaMqB/z0njzjlS7oUFFjO46e+/TXtrSfbCKI6GQTyx
         ST+QI0OLA7634ryDTXbAPelTNwImJ5D96Ko1YwzrERfSCw2fHsnTuj3w7dQ9SRJGG40R
         DPYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nDSigT6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si16447382ios.47.2021.04.19.03.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 03:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nDSigT6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYRSO-00004r-Gl
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 06:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYRBw-00063K-1z
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 06:31:44 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYRBp-0007Jn-86
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 06:31:43 -0400
Received: by mail-ej1-x62e.google.com with SMTP id mh2so30545898ejb.8
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=thLCvsKF4JLLVn9m7XIL+hac1/cC7Oo0cvtR1zER0lM=;
 b=nDSigT6bobmRwnOGvC5JNCwpQQe2gBpV2vpcl3y3gJvEXYRNGyNV63rSnflMei5J0J
 5RbPFFPajo0xItDNoNhmd/G6vZjd44wp2wTUWv589ySBvEmIiGMOrl00ooIIKUb5p4z7
 k5q6qJOWryY+7MfPye21pr9F8fwdC40+LFLIq8few91nW7VqF8hgk2jWgU9whwhwqdqs
 16zLP+iLqvHmiSVT2QtK2N64uP7Hq0nUs0Vu/UFCPB82FSzEgKQSSTelPpINPRVdkrGl
 2cGPftwLF1n9Cv456RbvMXSvTIceIXpfjx4gHLKgztX/VzCDYQpJV+AMJ4/CKu17SZIm
 WhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=thLCvsKF4JLLVn9m7XIL+hac1/cC7Oo0cvtR1zER0lM=;
 b=aE4I3dSlQx3OL/EtKn4jR/H2xouwk1cD62YHoQxisygFHgGuf0BASxjLs/Jj7Bbsx4
 saIdV3cOlRIV9QIjxxsuLk0plncfx+d6+a8cfbR0JAoL8mdFTcOizZQxFIQtaYQ/4vbY
 0NryYaNGGQ65mshNiE5tQjvl4nvLD/J1sPOnzlZ/ADbGxulImqZfipXU7uEQHbghACsn
 XUbMJhWHMFl6uouvPLDlQ2auXFdbzGPV8jW3lAIF432BnWG2DK6W59fB6M/HG7bzoyXo
 /dlcKC+DTn7FmEs88a8zrjrVUB3IcnhPmpcKpqhpXroeqSpfMBdPayG0Rq5GaNRIcqpC
 GzsA==
X-Gm-Message-State: AOAM532/++kA2hTsSfFel/wx7YDGxlj0/C9ssXio5Vgp/UkDw3rz8VNe
 Yx/+L404L49kX90zAJ91lsIGALU5wLlAdrO3FWSplA==
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr21890580eje.250.1618828294173; 
 Mon, 19 Apr 2021 03:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-4-shashi.mallela@linaro.org>
In-Reply-To: <20210401024152.203896-4-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 11:30:42 +0100
Message-ID: <CAFEAcA-bYWYhvU2c4JzQUx_9+S9z+GSa+D1gkG3V=Y=i+n6cGg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] hw/intc: GICv3 ITS command queue framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f+TlP+NISBVP

On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added functionality to trigger ITS command queue processing on
> write to CWRITE register and process each command queue entry to
> identify the command type and handle commands like MAPD,MAPC,SYNC.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c  | 347 +++++++++++++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h |  41 +++++
>  2 files changed, 388 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 81373f049d..fcac33c836 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -28,6 +28,347 @@ struct GICv3ITSClass {
>      void (*parent_reset)(DeviceState *dev);
>  };
>
> +static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
> +{
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    uint64_t rdbase;
> +    uint64_t value;
> +    bool pta = false;
> +    MemTxResult res = MEMTX_OK;
> +
> +    offset += NUM_BYTES_IN_DW;
> +    offset += NUM_BYTES_IN_DW;
> +
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                     MEMTXATTRS_UNSPECIFIED, &res);

If the ITS fails to read or write DMA, it does not report that
by provoking a bus error for the CPU's write to GITS_CWRITER,
which is what will happen if you just propagate up the MemTxResult
from this DMA operation back through the register write function
to its caller. The spec doesn't seem to define a particular behaviour
for "I couldn't read the command out of the command queue", but
it would seem sensible to pick one of the options from the "Command errors"
section: ignore the command, or stall the command queue ("treat as
valid" is the other option there but doesn't seem relevant here).

"Stall" is probably best as otherwise we might loop forever through
a region of unreadable addresses.

> +    if (FIELD_EX64(s->typer, GITS_TYPER, PTA)) {
> +        /*
> +         * only bits[47:16] are considered instead of bits [51:16]
> +         * since with a physical address the target address must be
> +         * 64KB aligned
> +         */
> +        rdbase = (value >> RDBASE_OFFSET) & RDBASE_MASK;
> +        pta = true;
> +    } else {
> +        rdbase = (value >> RDBASE_OFFSET) & RDBASE_PROCNUM_MASK;
> +    }
> +
> +    if (!pta && (rdbase < (s->gicv3->num_cpu))) {
> +        /*
> +         * Current implementation makes a blocking synchronous call
> +         * for every command issued earlier,hence the internal state
> +         * is already consistent by the time SYNC command is executed.
> +         */
> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    return res;
> +}

TODO: review process_mapd and process_mapc

> +
> +static void update_cte(GICv3ITSState *s, uint16_t icid, uint64_t cte)
> +{
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    uint64_t value;
> +    uint8_t  page_sz_type;
> +    uint64_t l2t_addr;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t page_sz = 0;
> +    uint32_t max_l2_entries;

I think it's worth having a comment here:

/*
 * The specification defines the format of level 1 entries of a
 * 2-level table, but the format of level 2 entries and the format
 * of flat-mapped tables is IMPDEF.
 */

Q: why have you chosen to make the level-2 and flatmap entries
64 bits here ? They only need to contain the valid bit plus a
16 bit processor number. (We know the processor number fits in 16
bits because the GICR_TYPER.Processor_Number field in the redistributor
is that large.) Is there something I'm missing in the spec that makes
64-bit entries a good choice anyway ?

> +
> +    if (s->ct.indirect) {
> +        /* 2 level table */
> +        page_sz_type = FIELD_EX64(s->baser[1], GITS_BASER, PAGESIZE);
> +
> +        if (page_sz_type == 0) {
> +            page_sz = GITS_ITT_PAGE_SIZE_0;
> +        } else if (page_sz_type == 1) {
> +            page_sz = GITS_ITT_PAGE_SIZE_1;
> +        } else if (page_sz_type == 2) {
> +            page_sz = GITS_ITT_PAGE_SIZE_2;
> +        }

page_sz_type == 3 has a defined meaning: must be treated like 2.

If we're caching stuff in s->ct, maybe we should cache page_sz too ?

> +
> +        l2t_id = icid / (page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->ct.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, NULL);
> +
> +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +        if (valid_l2t) {
> +            max_l2_entries = page_sz / s->ct.entry_sz;
> +
> +            l2t_addr = (value >> page_sz_type) &
> +                        ((1ULL << (51 - page_sz_type)) - 1);

The spec text could be more clearly worded, but I don't think this is how
the physaddr is encoded in the L1 descriptor. I think that the intent is
that bits [51:0] are the physical address, with bits [N-1:0] of that being 0
because the L2 table must be page aligned. Your intepretation (that the
physaddr bit 0 is in bit N of the descriptor) wouldn't allow L2 tables
to be anywhere in the address space.

> +
> +            address_space_write(as, l2t_addr +
> +                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
> +                                 MEMTXATTRS_UNSPECIFIED,
> +                                 &cte, sizeof(cte));

Writing the CTE word using address_space_write() like this will
do the wrong thing on big-endian hosts. address_space_write() is the
"write a string of bytes to guest memory" function, so it will write
the uint64_t in whatever the host's byte order is. You want a fixed
byte order, so use address_space_ldq_le() or similar.

> +        }

> +    } else {
> +        /* Flat level table */
> +        address_space_write(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
> +                            MEMTXATTRS_UNSPECIFIED, &cte,
> +                            sizeof(cte));
> +    }
> +}

I feel like there's a fair amount of code duplication between
get_cte(), get_dte(), update_cte() and update_dte() which could
perhaps be refactored out.

> +static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
> +{
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    uint16_t icid;
> +    uint64_t rdbase;
> +    bool valid;
> +    bool pta = false;
> +    MemTxResult res = MEMTX_OK;
> +    uint64_t cte_entry;
> +    uint64_t value;
> +
> +    offset += NUM_BYTES_IN_DW;
> +    offset += NUM_BYTES_IN_DW;
> +
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    icid = value & ICID_MASK;
> +
> +    if (FIELD_EX64(s->typer, GITS_TYPER, PTA)) {
> +        /*
> +         * only bits[47:16] are considered instead of bits [51:16]
> +         * since with a physical address the target address must be
> +         * 64KB aligned
> +         */
> +        rdbase = (value >> RDBASE_OFFSET) & RDBASE_MASK;
> +        pta = true;
> +    } else {
> +        rdbase = (value >> RDBASE_OFFSET) & RDBASE_PROCNUM_MASK;
> +    }

GITS_TYPER.PTA is a read-only bit where we report to the guest how
our implementation behaves (ie whether these are processor numbers
or redistributor base addresses). We should implement one thing,
whichever is the easy one to implement for us, not both.

The specification is giving implementations a choice here because
there are different ways an ITS-to-redistributor interface might work:
 * the ITS might talk to the redistributor by literally writing to
   its registers via DMA (in which case setting GITS_TYPER.PTA makes
   its life easier)
 * the ITS might have its own backdoor or internal communications
   channel to the redistributors (in which case it wants to know a
   CPU number)

Looking forward, in patch 6 you add a comment:
  * Current implementation only supports rdbase == procnum
  * Hence rdbase physical address is ignored

So we're the second type of implementation. We should set
GITS_TYPER.PTA=0, and then this code can simply assume that
the data is always the "it's a CPU number" format.

> +
> +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +    if (valid) {
> +        if ((icid > s->ct.max_collids) || (!pta &&
> +                (rdbase > s->gicv3->num_cpu))) {
> +            if (FIELD_EX64(s->typer, GITS_TYPER, SEIS)) {
> +                /* Generate System Error here if supported */
> +            }

Again, GITS_TYPER.SEIS is a bit which we use to tell the guest whether
we're going to generate system errors or not; it's not a bit which
we read in order to decide whether to generate them. For QEMU, the
CPU itself doesn't have system-error support properly yet, so for
us SEIS should be zero. In the ITS code we thus have two choices:
 (1) just don't put anything in the code
 (2) add a function call to an empty function called something
     like its_raise_serror() which just has a comment noting that
     it's a placeholder to mark where we would need to raise an SError
     if we wanted to support it

I think I would favour option 1.

> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: invalid collection table attributes "
> +                "icid %d rdbase %lu\n", __func__, icid, rdbase);

This kind of LOG_GUEST_ERROR logging doesn't need to include the
__func__ string:
saying "ITS MAPC command" is more comprehensible to a reader of the
log who doesn't necessarily want to look into the QEMU source code
than saying "process_mapc".

> +            /*
> +             * in this implementation,in case of error
> +             * we ignore this command and move onto the next
> +             * command in the queue
> +             */
> +        } else {
> +            if (s->ct.valid) {
> +                /* add mapping entry to collection table */
> +                cte_entry = (valid & VALID_MASK) |
> +                            (pta ? ((rdbase & RDBASE_MASK) << 1ULL) :
> +                            ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL));
> +
> +                update_cte(s, icid, cte_entry);
> +            }

Put the s->ct.valid check inside update_cte(). Pass the
various parameters -- valid, pta, rdbase -- to update_cte()
and have it do the assembly into a word. That way all the code
dealing with the specific format of the table is inside that function,
rather than being partly here and partly there.

> +        }
> +    } else {
> +        if (s->ct.valid) {
> +            /* remove mapping entry from collection table */
> +            cte_entry = 0;
> +
> +            update_cte(s, icid, cte_entry);


> +        }
> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    offset += NUM_BYTES_IN_DW;
> +
> +    return res;
> +}
> +
> +static void update_dte(GICv3ITSState *s, uint32_t devid, uint64_t dte)
> +{
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    uint64_t value;
> +    uint8_t  page_sz_type;
> +    uint64_t l2t_addr;
> +    bool valid_l2t;
> +    uint32_t l2t_id;
> +    uint32_t page_sz = 0;
> +    uint32_t max_l2_entries;
> +
> +    if (s->dt.indirect) {
> +        /* 2 level table */
> +        page_sz_type = FIELD_EX64(s->baser[0], GITS_BASER, PAGESIZE);
> +
> +        if (page_sz_type == 0) {
> +            page_sz = GITS_ITT_PAGE_SIZE_0;
> +        } else if (page_sz_type == 1) {
> +            page_sz = GITS_ITT_PAGE_SIZE_1;
> +        } else if (page_sz_type == 2) {
> +            page_sz = GITS_ITT_PAGE_SIZE_2;
> +        }
> +
> +        l2t_id = devid / (page_sz / L1TABLE_ENTRY_SIZE);
> +
> +        value = address_space_ldq_le(as,
> +                                     s->dt.base_addr +
> +                                     (l2t_id * L1TABLE_ENTRY_SIZE),
> +                                     MEMTXATTRS_UNSPECIFIED, NULL);
> +
> +        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +        if (valid_l2t) {
> +            max_l2_entries = page_sz / s->dt.entry_sz;
> +
> +            l2t_addr = (value >> page_sz_type) &
> +                        ((1ULL << (51 - page_sz_type)) - 1);
> +
> +            address_space_write(as, l2t_addr +
> +                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
> +                                 MEMTXATTRS_UNSPECIFIED, &dte, sizeof(dte));
> +        }
> +    } else {
> +        /* Flat level table */
> +        address_space_write(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
> +                            MEMTXATTRS_UNSPECIFIED, &dte, sizeof(dte));
> +    }
> +}
> +
> +static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
> +                                 uint32_t offset)
> +{
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    uint32_t devid;
> +    uint8_t size;
> +    uint64_t itt_addr;
> +    bool valid;
> +    MemTxResult res = MEMTX_OK;
> +    uint64_t dte_entry = 0;
> +
> +    devid = (value >> DEVID_OFFSET) & DEVID_MASK;
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +    size = (value & SIZE_MASK);
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +    itt_addr = (value >> ITTADDR_OFFSET) & ITTADDR_MASK;
> +
> +    valid = (value >> VALID_SHIFT) & VALID_MASK;
> +
> +    if (valid) {
> +        if ((devid > s->dt.max_devids) ||
> +            (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
> +            if (FIELD_EX64(s->typer, GITS_TYPER, SEIS)) {
> +                /* Generate System Error here if supported */
> +            }
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: invalid device table attributes "
> +                "devid %d or size %d\n", __func__, devid, size);
> +            /*
> +             * in this implementation,in case of error
> +             * we ignore this command and move onto the next
> +             * command in the queue
> +             */
> +        } else {
> +            if (s->dt.valid) {
> +                /* add mapping entry to device table */
> +                dte_entry = (valid & VALID_MASK) |
> +                            ((size & SIZE_MASK) << 1U) |
> +                            ((itt_addr & ITTADDR_MASK) << 6ULL);
> +
> +                update_dte(s, devid, dte_entry);
> +            }
> +        }
> +    } else {
> +        if (s->dt.valid) {
> +            /* remove mapping entry from device table */
> +            dte_entry = 0;
> +            update_dte(s, devid, dte_entry);
> +        }
> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    offset += NUM_BYTES_IN_DW;
> +
> +    return res;
> +}

Review comments for process_mapc() and update_cte() apply also to
process_mapd() and update_dte().

> +
> +/*
> + * Current implementation blocks until all
> + * commands are processed
> + */
> +static MemTxResult process_cmdq(GICv3ITSState *s)

This should return 'void' (see comments earlier).

> +{
> +    uint32_t wr_offset = 0;
> +    uint32_t rd_offset = 0;
> +    uint32_t cq_offset = 0;
> +    uint64_t data;
> +    AddressSpace *as = &s->gicv3->sysmem_as;
> +    MemTxResult res = MEMTX_OK;
> +    uint8_t cmd;
> +
> +    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
> +
> +    if (wr_offset > s->cq.max_entries) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                        "%s: invalid write offset "
> +                        "%d\n", __func__, wr_offset);
> +        res = MEMTX_ERROR;
> +        return res;
> +    }
> +
> +    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
> +
> +    while (wr_offset != rd_offset) {
> +        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
> +        data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
> +                                      MEMTXATTRS_UNSPECIFIED, &res);

I think I would just read all four quadwords of the command here
into a local uint64_t data[4], and pass that to the process_$cmd()
functions. That saves those functions doing the loads and handling
possible errors doing the loads themselves.

> +        cmd = (data & CMD_MASK);
> +
> +        switch (cmd) {
> +        case GITS_CMD_INT:
> +            break;
> +        case GITS_CMD_CLEAR:
> +            break;
> +        case GITS_CMD_SYNC:
> +            res = process_sync(s, cq_offset);
> +            break;
> +        case GITS_CMD_MAPD:
> +            res = process_mapd(s, data, cq_offset);
> +            break;
> +        case GITS_CMD_MAPC:
> +            res = process_mapc(s, cq_offset);
> +            break;
> +        case GITS_CMD_MAPTI:
> +            break;
> +        case GITS_CMD_MAPI:
> +            break;
> +        case GITS_CMD_DISCARD:
> +            break;
> +        default:
> +            break;
> +        }
> +        if (res == MEMTX_OK) {
> +            rd_offset++;
> +            rd_offset %= s->cq.max_entries;
> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: %x cmd processing failed!!\n", __func__, cmd);
> +            break;
> +        }
> +    }
> +    return res;
> +}
> +
>  static bool extract_table_params(GICv3ITSState *s, int index)
>  {
>      uint16_t num_pages = 0;
> @@ -282,6 +623,9 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
>          break;
>      case GITS_CWRITER:
>          s->cwriter = deposit64(s->cwriter, 0, 32, value);
> +        if ((s->ctlr & ITS_CTLR_ENABLED) && (s->cwriter != s->creadr)) {
> +            result = process_cmdq(s);
> +        }
>          break;
>      case GITS_CWRITER + 4:
>          s->cwriter = deposit64(s->cwriter, 32, 32, value);
> @@ -416,6 +760,9 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
>          break;
>      case GITS_CWRITER:
>          s->cwriter = value;
> +        if ((s->ctlr & ITS_CTLR_ENABLED) && (s->cwriter != s->creadr)) {
> +            result = process_cmdq(s);
> +        }


I would move the check on CTLR.ENABLED into process_cmdq() itself
(which is already doing a writer != reader check).

>          break;
>      case GITS_TYPER:
>      case GITS_CREADR:
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index b7701e8ca5..7e1ff426ef 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -253,6 +253,12 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
>  FIELD(GITS_CBASER, INNERCACHE, 59, 3)
>  FIELD(GITS_CBASER, VALID, 63, 1)
>
> +FIELD(GITS_CREADR, STALLED, 0, 1)
> +FIELD(GITS_CREADR, OFFSET, 5, 15)
> +
> +FIELD(GITS_CWRITER, RETRY, 0, 1)
> +FIELD(GITS_CWRITER, OFFSET, 5, 15)
> +
>  FIELD(GITS_CTLR, ENABLED, 0, 1)
>  FIELD(GITS_CTLR, QUIESCENT, 31, 1)
>
> @@ -284,6 +290,41 @@ FIELD(GITS_TYPER, CIL, 36, 1)
>  #define L1TABLE_ENTRY_SIZE         8
>
>  #define GITS_CMDQ_ENTRY_SIZE               32
> +#define NUM_BYTES_IN_DW                     8
> +
> +#define CMD_MASK                  0xff
> +
> +/* ITS Commands */
> +#define GITS_CMD_CLEAR            0x04
> +#define GITS_CMD_DISCARD          0x0F
> +#define GITS_CMD_INT              0x03
> +#define GITS_CMD_MAPC             0x09
> +#define GITS_CMD_MAPD             0x08
> +#define GITS_CMD_MAPI             0x0B
> +#define GITS_CMD_MAPTI            0x0A
> +#define GITS_CMD_SYNC             0x05
> +
> +/* MAPC command fields */
> +#define ICID_LEN                  16
> +#define ICID_MASK                 ((1U << ICID_LEN) - 1)
> +#define RDBASE_LEN                32
> +#define RDBASE_OFFSET             16
> +#define RDBASE_MASK               ((1ULL << RDBASE_LEN) - 1)

If you want to define these by hand, you could at least use the same
suffixes that the FIELD() macro does: _SHIFT, _LENGTH and _MASK.

> +#define RDBASE_PROCNUM_LEN        16
> +#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LEN) - 1)
> +
> +#define DEVID_OFFSET              32
> +#define DEVID_LEN                 32
> +#define DEVID_MASK                ((1ULL << DEVID_LEN) - 1)
> +
> +/* MAPD command fields */
> +#define ITTADDR_LEN               44
> +#define ITTADDR_OFFSET            8
> +#define ITTADDR_MASK              ((1ULL << ITTADDR_LEN) - 1)
> +#define SIZE_MASK                 0x1f
> +
> +#define VALID_SHIFT               63
> +#define VALID_MASK                0x1
>
>  /**
>   * Default features advertised by this version of ITS
> --
> 2.27

thanks
-- PMM
