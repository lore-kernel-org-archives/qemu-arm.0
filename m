Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1290711ejc;
        Fri, 3 Mar 2023 08:45:55 -0800 (PST)
X-Google-Smtp-Source: AK7set918bVjELfsjljtX1XPfk7ncx4i5vHJK3+H3F7Ier/++Q1X+/ahxiOawxssT0T+3b+1Xp1P
X-Received: by 2002:a05:6214:238e:b0:56e:a2cb:5732 with SMTP id fw14-20020a056214238e00b0056ea2cb5732mr3485695qvb.9.1677861955043;
        Fri, 03 Mar 2023 08:45:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677861955; cv=none;
        d=google.com; s=arc-20160816;
        b=kE6sIz/rab37CkdFLo/W2zF2mk96FQMJ1E5SQqpifVubLxi6+2m0rWKcLHiSCo5ho2
         jrPRikJ4Ew4WtC0cKhzJqufXu7YB9UHcWtvzEruUVA9+mGy5Uzfp6H0DEgY456Yot2F1
         D507KdkTkCrH6v6wZqPOltarQgXkUUMJaY3rai8nSNVkBXOu2Ty25T/zpCEQrc1GVxqF
         hWFOekXqvL5ckqY3dQknigWHFCfsxvkAO2sHviyOlWI/SH65lYNGpocO2NOM8PiTT3G0
         Rzl1+VeXSFFh4iSWcSCppdXy6uXdPkKRRXLiAOQnZYfrC9Duak6hHbY71kMmQb36DUjg
         qInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5AsZeK2k4xWOD39wHeOZN9susZ6CW+VBTmZIYhdUWto=;
        b=Kj6qY9quQS+cUc1Y6hRfABW2LkshF9/neZ5ys/U8KDB0ZHLpqX13D0Vfq9m0ImHJHy
         Sdq3pJHOclCdexzLlt+g6suki2zsqIfZqqk9PK0+kH0pNTZtZSnemrQrZkhXebWOF701
         YD274vIg6qHPklOBC+UfH94kR8cSXJ5PlazpvLH7YrTfxUwqu2s5bIxVtvuEarTW6HuP
         v1v7Ej15rFyiEpqgCmW4E4sLSIOwE67OWtyA0PYUKubEce+bjIjT1Pem4kYo3Rl1F2sm
         7t/GAiKrHm7CdCCT38XURZYCd6Vc2AkTqq3gvlEdHKQ5Vo6bBtIQE1AWqvosh/0J4VDG
         I5BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c0939mhK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h30-20020a0cab1e000000b0056f06d22323si1860611qvb.434.2023.03.03.08.45.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 08:45:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c0939mhK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY8XA-0000vn-9m; Fri, 03 Mar 2023 11:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8X5-0000v0-3G
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:45:26 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8X0-00017j-Ug
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:45:20 -0500
Received: by mail-pg1-x531.google.com with SMTP id s18so1867256pgq.1
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 08:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677861916;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5AsZeK2k4xWOD39wHeOZN9susZ6CW+VBTmZIYhdUWto=;
 b=c0939mhKHDK49UXpXz1UsdRe5K/Oan5/PcZrdPn63ZtJzqBFKXNr8R3SuZdQIbxMIA
 gyrrgyXT66khszlFS+5QdHdvunQaNl935bZvs5hGtJ22PdikKFcMfkLDTI0lSN7Yr3f0
 kJV+L9eduAqGjHYUXkaFKB0GW1S7unDo84h3vhDSvyXYpkc7aLgLkCOkzzPjdw2zcDuk
 TRFKMbCv8a+UdNAkUZCIeYD13hltwDPeWsu/ng+eW8lYnjU4pDkP+yeRKyYJbWeou4Vd
 tRjfwuye9NGUAC6GkxYHZJsha4Kb9AMKsGe9XCbTm9gky18ZOqppbEHEs0aIryVBYrNg
 ks5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677861916;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5AsZeK2k4xWOD39wHeOZN9susZ6CW+VBTmZIYhdUWto=;
 b=QpWG1NKyCBZesQGtxxz0NoT53DgjJkSLpK2ma6xRFnJXyP3i2kdaZi5I+m+NlcZiVX
 +66kB6Jlw/xDT1H8jhN+ANiXttJ/e1IrzywpLqS4+Q+HF9aFJJD5AXkJeVY8WSfqAUs4
 j3RcooYBnjA8trx3mhw/FYkX90q+E376fOD9bB8pt8moTs2MKxxWbYLyHvUFK97FZ+na
 utBtVjkstvFxL4kjc4qrJ0/j3Y4e9vSb0j1Ad6AGehqXZx/QuMv52IHIuB3HhsuqLeXw
 2nmmraeNUieTKpGjbcF/f6aYMBfoo3IbOf+TYktTg7v2w3guvZM7nCrMgv3qgtb4CG3T
 sHkg==
X-Gm-Message-State: AO0yUKXA8o/YmqAcTFyTNEMmM0NJY7toXJ2ldS0JbPTwiQV6XAJOFKLj
 l39NL8GPjWW37dmmdhdLBfiBbGXVHdv8kxNySqCWuQ==
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr730337pgh.9.1677861916379; Fri, 03 Mar
 2023 08:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-4-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:45:05 +0000
Message-ID: <CAFEAcA9jhHX7r9FcB8ZyGimN3XGLX=rEONC3jYK=n2JTmj+SSg@mail.gmail.com>
Subject: Re: [PATCH 03/13] accel/tcg: Store some tlb flags in CPUTLBEntryFull
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0jqlZjPcxjWS

On Thu, 23 Feb 2023 at 20:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have run out of bits we can use within the CPUTLBEntry comparators,
> as TLB_FLAGS_MASK cannot overlap alignment.
>
> Store slow_flags[] in CPUTLBEntryFull, and merge with the flags from
> the comparator.  A new TLB_FORCE_SLOW bit is set within the comparator
> as an indication that the slow path must be used.
>
> Move TLB_BSWAP to TLB_SLOW_FLAGS_MASK.  Since we are out of bits,
> we cannot create a new bit without moving an old one.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> @@ -1249,36 +1265,27 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
>       * vaddr we add back in io_readx()/io_writex()/get_page_addr_code().
>       */
>      desc->fulltlb[index] = *full;
> -    desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
> -    desc->fulltlb[index].phys_addr = paddr_page;
> +    full = &desc->fulltlb[index];
> +    full->xlat_section = iotlb - vaddr_page;
> +    full->phys_addr = paddr_page;
>
>      /* Now calculate the new entry */
>      tn.addend = addend - vaddr_page;
> -    if (prot & PAGE_READ) {
> -        tn.addr_read = address;
> -        if (wp_flags & BP_MEM_READ) {
> -            tn.addr_read |= TLB_WATCHPOINT;
> -        }
> -    } else {
> -        tn.addr_read = -1;
> -    }
>
> -    if (prot & PAGE_EXEC) {
> -        tn.addr_code = address;
> -    } else {
> -        tn.addr_code = -1;
> -    }
> +    tlb_set_compare(full, &tn, vaddr_page, read_flags,
> +                    MMU_INST_FETCH, prot & PAGE_EXEC);
>
> -    tn.addr_write = -1;
> -    if (prot & PAGE_WRITE) {
> -        tn.addr_write = write_address;
> -        if (prot & PAGE_WRITE_INV) {
> -            tn.addr_write |= TLB_INVALID_MASK;
> -        }
> -        if (wp_flags & BP_MEM_WRITE) {
> -            tn.addr_write |= TLB_WATCHPOINT;
> -        }
> +    if (wp_flags & BP_MEM_READ) {
> +        read_flags |= TLB_WATCHPOINT;
>      }
> +    tlb_set_compare(full, &tn, vaddr_page, read_flags,
> +                    MMU_DATA_LOAD, prot & PAGE_READ);
> +
> +    if (wp_flags & BP_MEM_WRITE) {
> +        write_flags |= TLB_WATCHPOINT;
> +    }
> +    tlb_set_compare(full, &tn, vaddr_page, write_flags, MMU_DATA_STORE,
> +                    (prot & PAGE_WRITE) && !(prot & PAGE_WRITE_INV));

So in the old code, if PAGE_WRITE_INV then we set up the
addr_write field as normal, it just also has the TLB_INVALID_MASK bit
set. In the new code we won't do that, we'll set addr_write to -1.
I'm not fully familiar with the cputlb.c code, but doesn't this
break the code in probe_access_internal(), which assumes that
it can call tlb_fill (which will come through here) and then
fish out the TLB entry, clear out the TLB_INVALID_MASK bit and
use the TLB entry as a one-off ?

thanks
-- PMM
