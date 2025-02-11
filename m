Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp223738njb;
        Tue, 11 Feb 2025 02:46:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9wKoxMR3yXZJTP1RIjitFd9IZzNIWe0tvWqBi/22Mo1PGLTdHTJRRJJTI+5Lvv3BhHSGIxkwWppnA1g==@linaro.org
X-Google-Smtp-Source: AGHT+IG9IeBmoq5JwJhqo60iHFsUDwRfqRlE/hE3n2YCBQ98DoSX3AAe6aV9g5zOtbbGH9/TMXz2
X-Received: by 2002:a05:6214:d4b:b0:6d8:ada3:26c9 with SMTP id 6a1803df08f44-6e46785a44amr48873426d6.10.1739270811892;
        Tue, 11 Feb 2025 02:46:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739270811; cv=none;
        d=google.com; s=arc-20240605;
        b=FuKfAjL8S016n3R6LZ194TIgAkfH30Jbv7QqR+5QsgEwEidk1YSyfq9CC4mEBGNanE
         E9AFwY/mWBxOPTCcYhLm8UtAju4qb1ZRVR1/JlSPBtBS8Wcs/tGrX1+tka8WmY3QE3fZ
         UoCzJE7TnJ7cnmKmxP48mesDoKbvdFbbrTQYbZuhIZnTODvlRJUI9+75g4JQDPgY7Vee
         1/Ax4HRGFRLn0hcCiSL92JM85Aapvm3n3I3TS42Fq2l2BQKaKpQxSC3udWF0s3MYx3re
         iPzbkaP+Lbg42Ffxp223yxqyNBvxZ5ccuAY3t7BWMU4hJhUhJxRxmGVsnPeBMxGXOdvl
         JpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6Jzg9kFrFcq2yhGW9QTyXyEEJq+TsTn3Vo6KGuO5uyQ=;
        fh=INHftBK+eErPMA/c1qJSnbmgqy9cZkH7tn0L+zL1vN0=;
        b=AC3kwG3Pm+vQS7F/e1lNT7lUR1IYtED8boPYspyizkkgKXpjEe+qJEmTgPIt92s0k6
         /m7ZOrJkf0mkR+HZO+QitFCR/GIEsy4nPvBgiP/hkYW3P7LCtWp36ew82QGQ305NH7vW
         7A9CLot0pUGuCuGKSoDxgv4Pt5hzQlxtOiHmI0ovm20tC+f9ImIgT5YtIjmOiInp4rlq
         DLyA6gl5ByqZ+Epzc3XXUeOfmfPRhEOPJMknMFQW2yUqyLr6PAm9Kon2x2RzuJ9KdxJz
         pwQZ6z/l4fkRdP6VQj8E8d7bzxkgspo5q1S1Us5ASJ1k356mmH0m8SWEXtKPb3YfCg+K
         qCOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rDVpNrEZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e44b0ed93fsi86316286d6.120.2025.02.11.02.46.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 02:46:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rDVpNrEZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thnmY-0006u2-P8; Tue, 11 Feb 2025 05:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thnmW-0006tL-NX
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 05:46:20 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thnmU-0005qD-Ks
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 05:46:20 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e5b638d3f83so1710438276.2
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2025 02:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739270777; x=1739875577; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Jzg9kFrFcq2yhGW9QTyXyEEJq+TsTn3Vo6KGuO5uyQ=;
 b=rDVpNrEZCcOsXpWRc4Poqo75ajzWvDJnvwNQ2OOR0LD0BDuU6Xr76l7Q2zkzty5k6F
 Q26LBSoB0TEbrSOzeQndjErx3X7uBbnfFMBU2X2mkD9krpZN3HyVehK69qX0d7uZPDqH
 Cud4Ei5nXn0K6H+tDwxIGT9qY82G/RYNNQ0Ep9DpeYzulrfM2mXLobh/yPIwAOB7s+jZ
 YG1qf+GuJacoPkbm5xuHfwvmaD6zz+iBHQai8/5MGvfAJ1MX3m3boOXwlQGhFTfsDF3U
 7gPsFMylhw7rRvqZmSn4UU7bEgAa52Li3N6hGPycbmK8gm8L1KWJPees2Yshez4ZqhL9
 7BXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739270777; x=1739875577;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Jzg9kFrFcq2yhGW9QTyXyEEJq+TsTn3Vo6KGuO5uyQ=;
 b=OMXMsyvUIkl9xR0ZccyY/X8qF9IaIo44B+3WzINI+JUckwx8F/ufMGIYnguyYNvSYN
 Eoxmjz5tyn+/GPzRmHuV5EmkCjwdkgXEpdO8tkeOU3ynH7BXEuT8yC50IgdMWphqzYtq
 xalrM0+0o8Pp9T8Ci4JJ9zfm/EycRzZ4pcI27u/Rwocc4N4gIhUNWKlyvZCqKMX4uI/Z
 SVby1cmjke49pJUbtrK8csozyPYt+apfQDV0qT5aPjUbPq3VdVEugcff9zFdHEznaqnU
 2d2UkiTCz9ClrHT8rxqbhyIzI75umr4oLXMZqoX0qrv/BwFxPSyJeSeSLWa8bA24eDvd
 wkgA==
X-Gm-Message-State: AOJu0YzhDMvzxFtvRak6HNoUn2PaRSRWzsBL1xgbLS+KYfaDPUj/EQfu
 y8QvkoJZOs/N7Shiv+0UBXd0OomS14poCy0YclyvobKa21n/Xs2ejfv7Q2WF5DddLu71L53cfw8
 RTkNQpnYKiUpi7XYtDQcS+B+sOq45GYHJxdV60Q==
X-Gm-Gg: ASbGncto67WjaVnYpxEO9O/xXBjpl0qK+oK7/xLIAlOLyoBOkKRjHToAHDMr97gg7tG
 nz6XHWIFjrlp2yExsFjlVLETXVmUAd+qTb6BWn1SapMNsI+oxOff1NWPX7YMgktul/cdz/NlY+A
 ==
X-Received: by 2002:a05:6902:15c7:b0:e5b:42c7:8f2b with SMTP id
 3f1490d57ef6-e5d93c7e67emr3687348276.2.1739270777168; Tue, 11 Feb 2025
 02:46:17 -0800 (PST)
MIME-Version: 1.0
References: <6866d6b6-24af-4743-8407-26ae2998dd21@gmail.com>
In-Reply-To: <6866d6b6-24af-4743-8407-26ae2998dd21@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2025 10:46:04 +0000
X-Gm-Features: AWEUYZmXoXVHnHq9LPzS6lynLiO-kLDFUvuKwC-EKkQKjHyDnzJnvPPciByFwsM
Message-ID: <CAFEAcA9B40F21r9RgeDd7k09juy35k9QWewzgkmyNkYVK_K0-g@mail.gmail.com>
Subject: Re: ldrd implementation issue?
To: Stu Grossman <stu.grossman@gmail.com>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 4KCyYJ9oZKn0

(added qemu-devel to the cc list)

On Mon, 10 Feb 2025 at 17:26, Stu Grossman <stu.grossman@gmail.com> wrote:
>
> I've been getting SIGBUS cores with a bunch of user apps running under
> linux 5.15 and qemu-system-aarch64.  These happen to be 32 bit (T32?)
> programs.
>
> All of the cores point at the following instruction:
>
>         ldrd r2,r3,[r2]
>
> where r2 points at four bytes prior to the end of a page.  Eg: 0x10ffc.
>
> The bug appears to be that we get a page fault between the accesses for
> each word.  Prior to the fault, the first register is updated.  Later,
> after the fault is serviced, the instruction is restarted with the index
> register containing the word loaded prior to the fault, which is
> probably not the desired address, resulting in a coredump.
>
> So the conditions for the problem are:
>
>         - the index register must be one of the registers being loaded.
>         - the index register must point at a uint64_t that spans a page
>           boundary.
>
> I understand that the uint64_t spanning a page boundary may not be
> allowed by the arm 32 bit API.  However, the ldrd instruction definition
> allows for four byte alignment.

Yes, you're right; this is a longstanding bug in our LDRD implementation.
The Arm ARM defines in section G1.17.8.3 that if the execution of
an instruction generates a synhcronous Data Abort then the base
register should be restored to its original value if the aborted
instruction is a load and the list of registers to be loaded includes
the base register.

> Note that ldm may have similar issues if the index is one of the
> registers being loaded and the words cross a page boundary.

I believe in LDM we get this correct: in the do_ldm() function
we have a case for 'i == a->rn' which stashes the loaded value
into a TCG temporary, and we don't write that into the actual
register until after we've completed all the loads.

> The fix is to defer the register stores till after both words have been
> read from memory.
>
> Here is my fix:
>
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index 9ee761fc64..78ad0ed186 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -5006,7 +5006,7 @@ static bool op_store_rr(DisasContext *s,
> arg_ldst_rr *a,
>   static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
>   {
>       int mem_idx = get_mem_index(s);
> -    TCGv_i32 addr, tmp;
> +    TCGv_i32 addr, tmp1, tmp2;
>
>       if (!ENABLE_ARCH_5TE) {
>           return false;
> @@ -5017,15 +5017,16 @@ static bool trans_LDRD_rr(DisasContext *s,
> arg_ldst_rr *a)
>       }
>       addr = op_addr_rr_pre(s, a);
>
> -    tmp = tcg_temp_new_i32();
> -    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
> -    store_reg(s, a->rt, tmp);
> +    tmp1 = tcg_temp_new_i32();
> +    gen_aa32_ld_i32(s, tmp1, addr, mem_idx, MO_UL | MO_ALIGN);
>
>       tcg_gen_addi_i32(addr, addr, 4);
>
> -    tmp = tcg_temp_new_i32();
> -    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
> -    store_reg(s, a->rt + 1, tmp);
> +    tmp2 = tcg_temp_new_i32();
> +    gen_aa32_ld_i32(s, tmp2, addr, mem_idx, MO_UL | MO_ALIGN);
> +
> +    store_reg(s, a->rt, tmp1);
> +    store_reg(s, a->rt + 1, tmp2);
>
>       /* LDRD w/ base writeback is undefined if the registers overlap.  */
>       op_addr_rr_post(s, a, addr, -4);
> @@ -5153,19 +5154,20 @@ static bool op_store_ri(DisasContext *s,
> arg_ldst_ri *a,
>   static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
>   {
>       int mem_idx = get_mem_index(s);
> -    TCGv_i32 addr, tmp;
> +    TCGv_i32 addr, tmp1, tmp2;
>
>       addr = op_addr_ri_pre(s, a);
>
> -    tmp = tcg_temp_new_i32();
> -    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
> -    store_reg(s, a->rt, tmp);
> +    tmp1 = tcg_temp_new_i32();
> +    gen_aa32_ld_i32(s, tmp1, addr, mem_idx, MO_UL | MO_ALIGN);
>
>       tcg_gen_addi_i32(addr, addr, 4);
>
> -    tmp = tcg_temp_new_i32();
> -    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
> -    store_reg(s, rt2, tmp);
> +    tmp2 = tcg_temp_new_i32();
> +    gen_aa32_ld_i32(s, tmp2, addr, mem_idx, MO_UL | MO_ALIGN);
> +
> +    store_reg(s, a->rt, tmp1);
> +    store_reg(s, rt2, tmp2);
>
>       /* LDRD w/ base writeback is undefined if the registers overlap.  */
>       op_addr_ri_post(s, a, addr, -4);

Yes, this fix looks correct to me. Can you provide a
Signed-off-by: tag for it? We can't accept it as a patch
without that. (I can do the other administrative tidying
up of it into a commit, but the signed-off-by is what says
you have the legal right and are happy to submit it to QEMU
under our license (LGPLv2.1+ in this case)).

thanks
-- PMM
