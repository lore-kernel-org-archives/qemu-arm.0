Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5532755lfb;
        Wed, 9 Dec 2020 19:39:31 -0800 (PST)
X-Received: by 2002:a1c:e2c2:: with SMTP id z185mr6037704wmg.49.1607571571132;
        Wed, 09 Dec 2020 19:39:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607571571; cv=none;
        d=google.com; s=arc-20160816;
        b=IO1ZJcVZDTlULrLlxeRoJsRUIBtTtVPxD77XuGMt/yr3tzsGaihxYyLvndmzVRG3lP
         Nvl58DjymsznpthzQsZUUwXmiNeud6KHeOxXhCxmz2hPirVtXqlact6u10tyA4NKnGw0
         9eJYQdojL6APJhmAzY/WLLDS/qtk6WUcRbLLC9ELm1POwrUYzAGVX8MvBuHpXu0CRuc3
         p1DIA7ShbweGeS4sfnvsaHrlybYMNQL5yFuyqeAN2wcrpocg5CDyCeSdM4As5Fsut/Kq
         hm4c2wtUzEzg7qk6Wm/iQJKXGoOLJtR9KwyWcDazcFqRzLnr7WPpzVJXomXr5NufIxDl
         ZvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z5d9TBTvx+BrjDrYNZfyHcLW2iP9KNHH88askXsDz00=;
        b=NUwIJlpAmQvvTrA7kazwMIgJWER9oST3mN2f/p6eHRbvbzf0+b+sSoDAvJuN6uDrQl
         kClr0pHbDuOoel0e9DXi9WEJX2EM17RsoC6SV/aOf3kX6XOKH9qUgJSx748W4pZRTIxA
         g9uzAP4fwfruudDoyToZcBeL2aOrJGxYgbvytPjVhJ9vKRDybqaX01xcUYnb3wHETlAV
         2DB9MxXW27ao+ZsbsPbb4iS29xYwhVVtDZgoCmNFYiGiAdiKBEJR0qFJ3FTnjVjwU79n
         nOGQHF0cJV+1DUP350s3YIhDzrIKIySIPdPHYh3fBT0UcOh7BmjgVHIRWj/cagm4UgzS
         JBBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CGSkPkaM;
       spf=pass (google.com: domain of npickito@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=npickito@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npickito@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a77sor2160932wme.15.2020.12.09.19.39.31
        (Google Transport Security);
        Wed, 09 Dec 2020 19:39:31 -0800 (PST)
Received-SPF: pass (google.com: domain of npickito@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CGSkPkaM;
       spf=pass (google.com: domain of npickito@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=npickito@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z5d9TBTvx+BrjDrYNZfyHcLW2iP9KNHH88askXsDz00=;
        b=CGSkPkaMNtXyAxAMo8w81C07vDV9Mz59tSefQT/Qm2FsCeetPYLREb1+pR5eh0SV3S
         EeLmJEo8ZCDYCIkrWqFqvy7SwnQQkFZqfUzpnzsA50fkymghyWTNOCjqMAsTQojojxj9
         ecKXqTerOBZZBjUYE1k3eCNhe+7ZWZgN0bYTJwhwNt+h51SouI8RyBP8owJteCIPjgV4
         w15Y/akQxX1QPZzeevPA/HpxS2xefQ3R6DvHZsav+Vn+MhqbcMVY5lpKGZ5AR6so/BZd
         fqpuPCFmdgBa2wOWQOdPw8pxa3S8oU8+xwBaR7eAmLZlBMkNXI5dMa2kXXdtrlJ93TC6
         ifkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z5d9TBTvx+BrjDrYNZfyHcLW2iP9KNHH88askXsDz00=;
        b=nI0g4yo3+c0/2WnX62FC5+s9XIxufXOv+1msZDxZTxATLx0xyIPXJwr32nJy07EdG6
         HYgxXn5NjM87U0hEIOU8tnBMobD22NCQnxVbkoPNRJtJHgqVk8zBYdZsZvNL/3hrL5TZ
         s1caLEfXSBPNfV36rH88m9eieOnySKAoOX28jYodDTScQHW5UUfR53mU9eMFwmio+vnx
         hEzQzPox7zc0Otodh7isOQ70tNA8i0GgXWRAGs6e69oWUT4T/JtdOzKamB7slw7s44B3
         68cP8f5I1q/QoutkEX4a0U4yv7Rd3pEbOzCA/xAyePsuTay3cPT27BaylgVxOupSenMT
         Qifw==
X-Gm-Message-State: AOAM533XidqNEC6cJm9XP0jtPtHWdVM4EDqc04A7IKAJvq9rxPZFESMP
	E6M7Zmc8r/NFGRNWys6szaQukPMMXtpJ/qfj9po=
X-Google-Smtp-Source: ABdhPJy3t0yqduZbqTK+CWFHcIMePNKlf1S6Sr/0F768Pq8MCEoOcfn5f+G2IJ9cxtu9Vjh1QAwSw3KojQAvffc7cnE=
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr5885750wmh.154.1607571570716;
 Wed, 09 Dec 2020 19:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20201125213617.2496935-1-keithp@keithp.com> <20201125213617.2496935-6-keithp@keithp.com>
 <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com> <87r1nz6iz4.fsf@keithp.com>
In-Reply-To: <87r1nz6iz4.fsf@keithp.com>
From: Kito Cheng <kito.cheng@gmail.com>
Date: Thu, 10 Dec 2020 11:39:19 +0800
Message-ID: <CA+yXCZA7XhLXDN7ZDk8D90eyXOLCzsrzwUyego1Sn=D9x3BGMQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] riscv: Add semihosting support [v13]
To: Keith Packard <keithp@keithp.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Laurent Vivier <laurent@vivier.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5ZnnyYydS8yr

Hi Keith:

Thanks for your reply, but it seems like we need some more modification in
 linux-user/riscv/cpu_loop.c to enable that, I guess I should post that in mail
rather than attachment :)

Patch here:

From 2f1eb5825a6dda177d3289106970eab05cb08445 Mon Sep 17 00:00:00 2001
From: Kito Cheng <kito.cheng@sifive.com>
Date: Wed, 9 Dec 2020 14:24:51 +0800
Subject: [PATCH] riscv: Add semihosting support for user mode

This could make testing easier and ARM/AArch64 has support on
their linux user mode too, so I think it should be reasonable.

Verified GCC testsuite with newlib/semihosting.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 linux-user/riscv/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index aa9e437875..9665dabb09 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "elf.h"
+#include "hw/semihosting/common-semi.h"

 void cpu_loop(CPURISCVState *env)
 {
@@ -91,6 +92,10 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_SEGV_MAPERR;
             sigaddr = env->badaddr;
             break;
+        case RISCV_EXCP_SEMIHOST:
+            env->gpr[xA0] = do_common_semihosting(cs);
+            env->pc += 4;
+            break;
         case EXCP_DEBUG:
         gdbstep:
             signum = TARGET_SIGTRAP;
-- 
2.29.2

On Thu, Dec 10, 2020 at 12:30 AM Keith Packard via
<qemu-devel@nongnu.org> wrote:
>
> Kito Cheng <kito.cheng@gmail.com> writes:
>
> > Hi Keith:
> >
> > Thanks for the patch, I've verified with newlib semihosting support
> > which is contributed by Craig Blackmore from embecosm,
> > and I would like to add semihosting to user mode, do you mind add this
> > patch into this patch series?
>
> I tried to add that already, but I admit that I haven't tested it in a
> while. You should find that there are patches to linux-user/semihost.c
> and linux-user/qemu.h to enable it.
>
> --
> -keith
