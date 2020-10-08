Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1312236lfq;
        Thu, 8 Oct 2020 05:55:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQm+sUJdJ+yxWcjFxx8ov/zb9x8W+dog3UgBkNsKL5SoH5HODQLyXZvcnbYqAooWPnVvV0
X-Received: by 2002:a25:d94d:: with SMTP id q74mr10814858ybg.452.1602161700682;
        Thu, 08 Oct 2020 05:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602161700; cv=none;
        d=google.com; s=arc-20160816;
        b=hvTErVPc3igQIFoxjMA6VD1S6zCRcHPIK0KIpysOdJOhkXGdQFKi/C4psVFoOol7iS
         dtmrPDigpafnLW4uJrkMe53jSSB6Ii7oWw2UXz7G6Qqzktp8msj1XdnZEao+ep941SOe
         u9OiXaGokiEc0xrT/C48ZPt9Cjjlajzx+PzkhkklCnDEqlctRuXDZXZapzY5/9Rlnk8w
         yMqjuJbf8ecRYzd83L2NjAa9CuZCoYY0rQODtvToRlXqm+iJ0Mx1ymVdBpWQNJz1n/sh
         vgjZuRGXXZx3x36Uc9W2b4DusvY8WvHsA5byTWvemphoWbVLO+UQz14TEEBW3TjTIn+L
         UTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yls9ZC0VO5ylKhPi7qnP5iii08Gb+4vluiuZKcCXoIw=;
        b=Ueddqg6k6EYJPZMq1a2AbpEKaI6fFDCtxE7atXkqwT+7AeQ9uzyDEeaVJZToSy0Mht
         hAvfcKKNOvLYhV9nzw0xu8iajXWjwo23v0BOttQDDi8/hCNlEUM9GD0NRWZZZYVO7IKD
         MJ0wgVdn3dNAIgvnR9Iv13HMl2WtdKOiag9XewwA3vy1VxkW358jop+g2vuuk5GYQLdD
         cPpEp9tI9Ow2sMasSzYNgGpKpxImbnyfzV0t1Yr9T8xyTfuQdM3yr76x9PY/h7BN3qO5
         YV7IFkfX0r+PgUT7K2U8Z8Wg11Bo4bAWLU/MSFSm6ZIjFS27kfa55RWu7RnsyWQlhGrD
         phlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i8VIieey;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n132si4601553yba.57.2020.10.08.05.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 05:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i8VIieey;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQVRk-0002AI-3M
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 08:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQVQo-0001hl-Ci
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 08:54:02 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQVQk-0001Pq-Cl
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 08:54:01 -0400
Received: by mail-ed1-x544.google.com with SMTP id o18so5725927edq.4
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yls9ZC0VO5ylKhPi7qnP5iii08Gb+4vluiuZKcCXoIw=;
 b=i8VIieey7xCEwnsQb0gUlPinVo0aiaUmHqp/EeDzidPhjC9Bhz2TUbJauDj79rMv9z
 h77oikGS7xEbsANKkeHN+HcuRKpKst+GgGCTuIuDbO7QeBiKwfUloAMxWAEt3narKfQh
 hwSidfvESaIFPwK2SGpHAmjbOyHCNH5nX4SpbgEejCkeYEltl2nIbsauunRhCfCA+5MK
 hTdbZ84+Ik3gnaq4UmUeq6Ze2J1O0e8xNPBq8kZNg0ZC/Mg5a4kUVDvH/+Ojoq9cxlky
 Aji3du38LNnXIskr+DbeAzljxG9zk+i8vdj8ovKWJERJWJnYRpEIOuIbzeYfIlj+f35q
 zqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yls9ZC0VO5ylKhPi7qnP5iii08Gb+4vluiuZKcCXoIw=;
 b=jGnq4jmeAWDGnmCk3ZPPtgF80W5ijMHYggUc151Uu+yo91o6DSF9HCxG4071Y64hMj
 oV5N1PRNcS6jJZJ8mBGgK8oyS0HUOXU+sqbv7vV5KTjSPZtEdU9MKM6DZ8+0BS27IGYB
 ncYrZYEQGVHRBEeuknnnRwKPpQpbDGcpeURn9nTT752minUQ9mMNEERyfcOHd3uNQXiG
 gkKSKj1LKM2ucbStbqdAOrH2hIsNfywkpFvuIr2xdmmo6FWhTi9iM0f8v3qUx9DA5C0e
 WFvh+6pqVmOFy+4z+oca2VGqlOM2Tio6n6NFs0tQ6zhhoSKfhWOJTKyQ6PdodjWGkLXb
 kjPg==
X-Gm-Message-State: AOAM531YCdFgkYrbksqRd4trWTQCYmq1QOBwmO3/pcw6oAPIgk6Uh7OX
 I4p+XKmJZp4NH3L8SyPv5DFtnMk/bXQQt5HtD1atCg==
X-Received: by 2002:aa7:c7d7:: with SMTP id o23mr8756577eds.44.1602161636491; 
 Thu, 08 Oct 2020 05:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201001170752.82063-1-richard.henderson@linaro.org>
 <20201001170752.82063-2-richard.henderson@linaro.org>
In-Reply-To: <20201001170752.82063-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 13:53:45 +0100
Message-ID: <CAFEAcA9JbDSVA5rCNbdAXsytLcpAOJP8bnjqbugYL-EicFUXNw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] accel/tcg: Add tlb_flush_page_bits_by_mmuidx*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jordan Frank <jordanfrank@fb.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RQKisdjqRu5o

On Thu, 1 Oct 2020 at 18:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On ARM, the Top Byte Ignore feature means that only 56 bits of
> the address are significant in the virtual address.  We are
> required to give the entire 64-bit address to FAR_ELx on fault,
> which means that we do not "clean" the top byte early in TCG.
>
> This new interface allows us to flush all 256 possible aliases
> for a given page, currently missed by tlb_flush_page*.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> +static void tlb_flush_page_bits_by_mmuidx_async_1(CPUState *cpu,
> +                                                  run_on_cpu_data data)
> +{
> +    target_ulong addr_map_bits = (target_ulong) data.target_ptr;
> +    target_ulong addr = addr_map_bits & TARGET_PAGE_MASK;
> +    uint16_t idxmap = (addr_map_bits & ~TARGET_PAGE_MASK) >> 6;
> +    unsigned bits = addr_map_bits & 0x3f;

So this is unpacking...

> +    } else if (idxmap <= MAKE_64BIT_MASK(0, TARGET_PAGE_BITS - 6)) {
> +        run_on_cpu_data data
> +            = RUN_ON_CPU_TARGET_PTR(addr | (idxmap << 6) | bits);

...the value that we packed into an integer here...

> +        run_on_cpu_data data
> +            = RUN_ON_CPU_TARGET_PTR(addr | (idxmap << 6) | bits);

...here...

> +    if (idxmap <= MAKE_64BIT_MASK(0, TARGET_PAGE_BITS - 6)) {
> +        run_on_cpu_data data
> +            = RUN_ON_CPU_TARGET_PTR(addr | (idxmap << 6) | bits);

...and here.

Could we do something to avoid all these hard-coded 6s and
maybe make it a bit clearer that these two operations
are the inverse of each other?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
