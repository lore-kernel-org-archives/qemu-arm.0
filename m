Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE60AF013FA
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Mar 2026 21:23:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2FOq-0000HJ-Uh; Mon, 16 Mar 2026 17:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w2FOp-0000G2-56
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 17:22:55 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w2FOn-0004SJ-7X
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 17:22:54 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-64c9707fc11so3595668d50.2
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2026 14:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773696171; cv=none;
 d=google.com; s=arc-20240605;
 b=VI9341mOCgAyNBIJn2k2RGUNX0yK5uxCX+Yvb0VbwJ3f6hQgieWA+V6sN4q+BWBLPp
 FYnn3Oy195+w1XzBSzEQw8Kkbf/5S6bDFK2EJ+yffR+EFefEUK91GZAJx57y6stkGqFU
 D8P3qjs9qIzKau+8e0vgH/xw/BuZHobUingRCpqIFR+BcdCB+e1jwb489ALnRNhHOxM6
 NTW42P4CM8dTJBp0zX7vVwZxd210SQstv2MVfQxRmO87dnsC46pc7zprY81aCZVWBPa0
 RkRh6CEp8nSLf3YyikRwMfuP3H1Kn8cChMEMz2k0Slhvb12DIr4R/jL9cBIzrfDZkqZ0
 uxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+X0IXf58U41dGziQe90BMcC1pKBa41yxLUF7DHnpQNU=;
 fh=MOJybTXgRXwDDWiJy4gllsgSkO1Ctg6d77r/sbe1fes=;
 b=duNYjQ0uw1s/BjirXaODrjL2gFtR7heJXkvprIlQQavHf/bRekOpqISNBhCsJeOy0Z
 VzDJ04xkWzl4SLmumgaIJZeS40j/MGnVHBtarwVZWdS2bfJjnc+0P0iLQ58+eisyLZ8s
 nF1JfoVkSOrgydf9A5lRHXK3YhLWvNPFarHYTJ37JrSnKc1nVOEy2Tj8DFtE1jzAn8SW
 nmNEB/hqo9yyN+a5NUNi5Ymop8LzIHDLT+ZBMOaLN3WeDl6uKNJqEKliYXBGQoGGMfhu
 M6lAcGTsu0vKMWflelGKnUwjl8NeWzCkOmjBJmlyZD59wUxAh5Z0NjG+pVttLHJe+H2j
 fylA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773696171; x=1774300971; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+X0IXf58U41dGziQe90BMcC1pKBa41yxLUF7DHnpQNU=;
 b=ru7i1XIrT9JW78XWNi1E47hZdFw5os6wN9U5V7gAvnGhMGDYvXW+5Lumldrb70sD+V
 PkTsP6Bsp0N+F1eZ8kvypOR+mg1HtUudWveKBTdpOcHkJBgclERES6yTBMFSpRflNWWT
 CHAGg3es5OpymrBRfnkpvVbnilswvjXoUHTkCL0Ha49oLTV0n+P290DyA96z6Zzfbd5O
 p1B2NlYc9GjvbWk0GyFYercGWc89lIseH4XI2fu9GRUfVRNeMF0R+L5P9mwgIvSgw5tG
 XKld10pqVUv6xHjufkgIMWkKntww41sbXLybL+s6ybL7r+HbzR7xOdVhbJA6/yEniBns
 jQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773696171; x=1774300971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+X0IXf58U41dGziQe90BMcC1pKBa41yxLUF7DHnpQNU=;
 b=IRinQnQdPPFlHZCkvh0pI961g37rCIJmRNQ9XL8ToqiZXwR06cnsbNl1TFl+3IaYK/
 R4J8ljzTbjQgGjYEy4BUq9X3oLkh/eXtfM06Vf3pIF/wEoVMAI7cq+ASvgFZW4G1chSN
 GMcyn8qjyGJxQeeJwIU7EAZdjrIC+rbCvkCgKjNtVkNHUD1/HIDmmALzEKtwL3JrRhHE
 5lHuhCJjUPqrznK71t1qNmj3L2ne18gmlMG0UKYU1R0UOcFcmt9jgHFpj3x68IRRaKHA
 TIGGaG0jeIpT2ZYLAJ7aplfU/tzZ0CuYV7JWZVYoDLFDgGuQI5hgfZJ4g3jq3gNtx1L2
 YEwQ==
X-Gm-Message-State: AOJu0YysMI0J74Ucoxp5/rPt0W/9eWZl9YRjs3MJ6BdVCMu7iGm79SL6
 4VH9HDe4UyoQ/5y3MS+SUsUQxKA8Da/64ICppLSZbNkRW7jzakWo+Hge7zDv6ZcEYJ9mOy+7tgh
 WewYBGI7vxl+cKJ0FfAYbszvOgRIhbR7OM9jCds6KVg==
X-Gm-Gg: ATEYQzynrVKTFzXj8/+jYD6eD/ZLoK62l+A1bvSH/YCq0b3IqqrwWVTTkV6PQnahXfu
 KsKKYnEfRpdafyUzUyepjar8v/TkVZ0SkVEfBPoyhEav2fLU0WVuKtS+246PQmfOvAlKMJnQf5v
 DbUbdYMZKMA/7mvkFuj3l7TxH8QmCI59xBrtV2hrhu6tXttATLM6HgavIU/J/bi0rKoo9wvrOW0
 72FDoqhxVTsxz4sBkmX12HY38/6/BVFt03FUNOcKVuf4kLKDvfFPnJQ8+TJLUy+IqOdK4YlIpkj
 SoBB7W8J+dqM8T1p5lR543VzqRP+6ZUSbgzMKgRtcAXAXsh6TciZM9MKAo6r46U1yOk=
X-Received: by 2002:a53:a78d:0:b0:64c:a4ab:e4d8 with SMTP id
 956f58d0204a3-64e62f725d9mr10564270d50.20.1773696171149; Mon, 16 Mar 2026
 14:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <CA+npmebHwcuek2M_Rx=raez9LNQu-gPA=Trn2rmSyK0SJxXozA@mail.gmail.com>
In-Reply-To: <CA+npmebHwcuek2M_Rx=raez9LNQu-gPA=Trn2rmSyK0SJxXozA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2026 21:22:39 +0000
X-Gm-Features: AaiRm52rB1gsM7r-5D2pkC7FMW5wPabEi6AzcMuBx0raGpfsX3tEhWaWIwGc5UE
Message-ID: <CAFEAcA9z9Cb8q9oRWV=4gxiab2BOvaTTLGPDWg7hQ7ORJr6wcA@mail.gmail.com>
Subject: Re: Question about ARM condexec_bits
To: Piou Piou <fuzztheworld@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 16 Mar 2026 at 20:34, Piou Piou <fuzztheworld@gmail.com> wrote:
> I have a bug on unicorn that uses an old qemu version (https://github.com/unicorn-engine/unicorn/issues/2309)
> I thought I might fix it by looking at how qemu evolved since then.
> Unfortunately, I did not see any fix.
> And the more I looked at it, the more it looked like a qemu bug that would still be here.
>
> Code
> The bug happens with an IT block containing a conditional load (executed) and a branch (called) in it or just afterwards.
> For instance, I have the following arm code (with thumb mode):
> ```c
> 0x72   93 bf           iteet      ls              // The originating itt
> 0x74   00 68           ldr.ls     r0,[r0,#0x0]    // executed
> 0x76   80 68           ldr.hi     r0,[r0,#0x8]    // skipped
> 0x78   28 39           sub.hi     r1,#0x28        // skipped
> 0x7a   2c f0 93 b9     b.ls.w     <some_func> // called
> 0x7e   2c f0 79 ba     b.w        <other_func>
> ```
> The IT block is finely translated.
> Then, the first ldr at 0x74 is executed. In unicorn a restore_state() call is forced on that point as I use hooks on memory reads.
> But I guess it would be the same if the load led to a data abort (as hinted by the comment in function arm_tr_tb_start())
>
> Bug
> This restore_state() call restores in the env the condexec_bits of instruction 0x74, so a value of 0x93 meaning we are inside and at the beginning of the IT block.
> Then this condexec_bits is passed through cpu_get_tb_cp_state_arm(), then arm_tr_init_disas_context() and turned into condexec_mask and condexec_cond that are put in the current dc.

That's correct, because that's what you want for "a TB that starts
at 0x74" (which is where the PC and other CPU state should be
at for the "first load hit a data abort" case).

> Those condexec_mask and condexec_cond are then used when translating
>the instruction pointed by the branch at 0x7a (new TB), leading to bad
> emulation as those instructions are out of the IT block.

But why are we translating a TB starting at 0x7a ? We just took
an exception on the load, so the next place we will be executing
is either:
 (1) the entrypoint to the exception handler (which we will do
     with the guest CPU state updated by the usual exception-entry
     handling, which includes saving the condexec state to SPSR
     and clearing the condexec bits in CPSR)
 (2) 0x74, retrying the load (this happens if the reason we
     abandoned the TB was something like icount mode saying
     "this is a non-RAM load that needs to be at the end of a TB")

Neither of those are 0x7a.

> Explanation
> There is a very explanatory comment at the beginning of arm_tr_tb_start which says that the condexec_bits at reset at the beginning of a tb.
> The case described above is explained as:
> ```c
> /*
>      * (3) if we leave the TB unexpectedly (eg a data abort on a load)
>      * then the CPUARMState will be wrong and we need to reset it.
>      * This is handled in the same way as restoration of the
>      * PC in these situations; we save the value of the condexec bits
>      * for each PC via tcg_gen_insn_start(), and restore_state_to_opc()
>      * then uses this to restore them after an exception.
> */
> ```
> But once this is done, the condexec_bits remain and are used to translate the basic block pointed by the next branch if it is close enough.
>
> Solution
> The only solutions I see are:
> 1) Remove the restoration of condexec_bits in restore_state_to_opc
> 2) Maybe do something similar to arm_tr_tb_start() when restoring an instruction.
> 3) Decrease the condexec_mask at every executed instruction.

If you clear the condexec_bits in restore_state_to_opc then
you will break the case of "an instruction faulted and we need
to fix up the state to what it would be at the start of that
instruction".

I'm not familiar with the internals of Unicorn, but looking
quickly at the bug report you reference, it looks like the
problem is that you or Unicorn are assuming that
"restore_state_to_opc" is a kind of synchronizing function
that you can call to update the state, and that you can then
continue executing within the same TB that you were called from.
You can't do that -- if you call restore_state_to_opc() then
you must abandon execution of that TB, and later on generate
a new TB starting from the CPU state that you now have.
(Put another way, restore_state_to_opc() is a key part of
that "abandon this TB" process, and is not designed to be
used outside that.)

thanks
-- PMM

