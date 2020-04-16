Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1815838lfm;
        Thu, 16 Apr 2020 06:30:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypKHBUvHJweCqHp+LOhg1SVSlBG0Rl2t3d9Z7gQElTyR155QQEYshhDOmYtn+nlvxy8djiDR
X-Received: by 2002:a37:cc1:: with SMTP id 184mr28580922qkm.254.1587043857519;
        Thu, 16 Apr 2020 06:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587043857; cv=none;
        d=google.com; s=arc-20160816;
        b=DPPzqXYbxnTovWYpMsoiW9tfzNjgatXPPcN8JjWamXKNWykhqGyF2LxD2RTPXP2VbN
         5cNpOpmcogycFx0avJKDEsLJyNlSvLz0u+JQsEsxBquMwY0ZjnuSuq4kyWTA9pyPJds/
         y0v4EZpp/qcF6HXwkONRgdaOHablRRybX8Em7mZCeoG8DjAbRiNF6ZzQGVVO+bPzjgN4
         XagP+SnxrlO/B6DJseeBfXSV6PfwDe1lOhRM1J0qB0u2HTMyz7Y9K+uxqYe+hWUqyfU6
         90ZNA1NhFGWlj2WVhgBKOqpZv1UmirRacBWxIA/xH5tcr+Bt9s3UQdM6EYEtV2BIqIJ4
         rr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mYIJr/NIUn6tB5qz4UxkwwM9iCHMtjun13/tTPeokBY=;
        b=kunpz5Pyj1FjrIoiVAW4whBI9uYQiHi6P+O/H4VplyXcWIN2goz74h4VjgYu2axqwx
         iTFV7ntnqye4ngctg9xJni/mhuIYmIAUrFntA16WXuw02ya4Sho5jfD6eJbm2+vWPa61
         rpxuU2YwMjGeOjovfX99LoKEm23TGXpjDh0+/4xzQaiEgM0Sk2AuiKNBlYVKPzV8Dxt2
         EogKI7Ki5XTNtV1V0zg9qYlClTYx+dX6rxTiIJsJM3DGdgMXvGSHH8lRB9NfYAdu35Wp
         KxIXgNl7jaC7lX6UudY7gtXMx4U0ERqHVfw8I0YZVqDWJhGLVNspGnGmhtTbeCi5/iLl
         NH+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QThXN+f4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y194si11025044qka.90.2020.04.16.06.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 06:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QThXN+f4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP4bY-0002Z7-Qy
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 09:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP4a4-0001S1-My
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP4a3-0007rP-G1
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:29:24 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45108)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP4a3-0007rE-BM
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:29:23 -0400
Received: by mail-oi1-x244.google.com with SMTP id k133so15820692oih.12
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 06:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mYIJr/NIUn6tB5qz4UxkwwM9iCHMtjun13/tTPeokBY=;
 b=QThXN+f4PljllfBo/OFU+sui7jszqbYno+ZD+drZ7IgdeEghFZefiNGQpRsg/FIGJW
 7KEe7hR1Q4rfV45xHM39KF0yLQYXsU5edxKBfB+oDytnz7pvepRkuZEXxIQANQGL8EcS
 Zoi+0PUK8RqHgMBKY1+GDN26nsfAc1sZnK1qiREXGw2UQWAaVxvCBYqxGj3bx+es0FJT
 y4DA3M58zdiNwtIRWQvq0VaIGMrFboVfMUX9jUfwqxFqhHrzjdh97cERZvdb5KINukRK
 ki3izOZ8OD3SbG/QCwiy3NZBTjU6+moyPQGHuJNa2r/gXV016iu7fa6cACuXC1M5ZZmD
 1BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mYIJr/NIUn6tB5qz4UxkwwM9iCHMtjun13/tTPeokBY=;
 b=WLQw9IUyhKvDCTvlWKZ/9fdCuAAlav6E4fNV5NmIp/Nh7rOP9YV+RnzorbLOu80zWi
 FZ3eGjoU6xaApjzaL5Ah240rk5H8DyiaT+PPzEsREZKr8zce4us5Au8gjJVxjGILJdr7
 Uw64f22dpwcHSJTGXtQJ/zw9EYQyLqM6nFyNcyaX6fKBJHLQoeQKpGJR91Rwvzn7DrY0
 Y4bTj/LtdT6eQG23rP9O/nEYxbLfxRT+jwwotlC7wyk3vebCsYZeBPf6U4fPgEFgtDNk
 Va0L+3DIChKZwYxPsMHvtbX3y2bmAIJXc7kGEPYGKxhHWttYeQD8iv6bgmWARp5CGOs8
 Dh1w==
X-Gm-Message-State: AGi0PuaXB5fHRIFQcadupB2gotYqiAQ5GYgoZjx+5AbSD4QZ9u/nOCr4
 EnGgYbGa4WBh6lxNqxuqhdP2JfwSrQu23U7iBjKk0g==
X-Received: by 2002:aca:170e:: with SMTP id j14mr2864832oii.163.1587043762467; 
 Thu, 16 Apr 2020 06:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-10-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 14:29:11 +0100
Message-ID: <CAFEAcA9+sx8fpMBtTre2otKFY44pvJMuC7Pu9aEDAO5t7kg4tQ@mail.gmail.com>
Subject: Re: [PATCH 09/16] target/arm: Handle watchpoints in sve_ld1_r
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bnKxgotdrN5M

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Handle all of the watchpoints for active elements all at once,
> before we've modified the vector register.  This removes the
> TLB_WATCHPOINT bit from page[].flags, which means that we can
> use the normal fast path via RAM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +    if (flags0 & TLB_WATCHPOINT) {
> +        mem_off = info->mem_off_first[0];
> +        reg_off = info->reg_off_first[0];
> +        reg_last = info->reg_off_last[0];
> +
> +        while (reg_off <= reg_last) {
> +            uint64_t pg = vg[reg_off >> 6];
> +            do {
> +                if ((pg >> (reg_off & 63)) & 1) {
> +                    cpu_check_watchpoint(env_cpu(env), addr + mem_off, msize,
> +                                         info->page[0].attrs, wp_access, retaddr);
> +                }
> +                reg_off += esize;
> +                mem_off += msize;
> +            } while (reg_off <= reg_last && (reg_off & 63));
> +        }
> +    }
> +
> +    mem_off = info->mem_off_split;
> +    if (mem_off >= 0) {
> +        cpu_check_watchpoint(env_cpu(env), addr + mem_off, msize,
> +                             info->page[0].attrs, wp_access, retaddr);
> +    }
> +
> +    mem_off = info->mem_off_first[1];
> +    if ((flags1 & TLB_WATCHPOINT) && mem_off >= 0) {
> +        reg_off = info->reg_off_first[1];
> +        reg_last = info->reg_off_last[1];
> +
> +        do {
> +            uint64_t pg = vg[reg_off >> 6];
> +            do {
> +                if ((pg >> (reg_off & 63)) & 1) {
> +                    cpu_check_watchpoint(env_cpu(env), addr + mem_off, msize,
> +                                         info->page[1].attrs, wp_access, retaddr);
> +                }
> +                reg_off += esize;
> +                mem_off += msize;
> +            } while (reg_off & 63);
> +        } while (reg_off <= reg_last);
> +    }

Another pair of almost-but-not-quite-the-same loops.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
