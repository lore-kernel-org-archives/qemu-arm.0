Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp907214ejc;
        Thu, 23 Feb 2023 08:54:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/LdqAWCZsmcKfKmtoK3uo1QKjVqukq/Sh/r0K55F+qlkDhDWFWS2PkCwOLTsbQ2zclMYOA
X-Received: by 2002:a05:622a:189b:b0:3a9:818f:db3d with SMTP id v27-20020a05622a189b00b003a9818fdb3dmr9932916qtc.53.1677171273806;
        Thu, 23 Feb 2023 08:54:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677171273; cv=none;
        d=google.com; s=arc-20160816;
        b=vXN6HEfEHAYHw9L1TWKc2pplRxKJ+7Lw7H8wvU1DwI4YhXMHutBOzfZncnolkbu/HH
         OCfjJdHLcshCpjHVzcMmwYIVcNAcPTTlk9nJZikRK4qsNQeQeV9pznaBbN0b16Ak4Vl4
         /7QgGACCuWYIZDoR5su4gfqFOTf/v2pR3qCC9mI8k952FNLq3OHzsXclE/PLm0B4Uoxw
         kYGyFJIPSdQ9eylSz2U8+BXjap09guqlx7b32FdkzwUNs8ZFbsukv09whoLpprVuafsq
         95xQ8uwX8w9AycvTjgu7SiqDSFgEYkR5Nxx7bpA5Or5UsY/puxPEASbjCvbcJqJ19MYc
         6REQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2juJJqmlf5ooe6Mkgg0ysrobkoIHUgWbjPnYQomFRo4=;
        b=pHZP+q8ajYR/6CjBoJG0QXjfow53eMPeYkkMhBroZngPC4sKat0dqtkJX3PDOeSue/
         v7d6WVqI+91d7M45zcnPmnFbqHey7fk2kc5VJiaITGwa3jm4w/Bhj7sdoMbI063O2tuI
         e/qaDQmMVc8G4H1tdlY8ndISxbea9goRWSouWJu1doNwvF5dhqjAlUrzpjgLBYkFYNL/
         75f1X1P6QlLhArHD6uE95S27i+V1no9WqExVAyFz5UgdkkRqYeEBp0zOmxfQfxROqg8i
         RZb9TGwSxyStTgCMNuUp1Lew3FXVmvvruVWx3p+LsV9b3YluWTWGbwP4oAhERkYniBdb
         suxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kz6R8wvm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020ac87dc6000000b003bfb72b6c83si373614qte.734.2023.02.23.08.54.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:54:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kz6R8wvm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVEr6-0007k1-5v; Thu, 23 Feb 2023 11:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEr4-0007jW-Ny
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:54:02 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEr3-0006MX-AB
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:54:02 -0500
Received: by mail-pg1-x529.google.com with SMTP id z10so5857606pgr.8
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2juJJqmlf5ooe6Mkgg0ysrobkoIHUgWbjPnYQomFRo4=;
 b=kz6R8wvmhn/cPUgO9ABpfR991AOK83TOB5d2mj8x3FPrriNjU7UK67M7KjkC5MkRjO
 rRfciQdPLnwI/x9RvpTd4PrDNqjNRsLtzywoHGOZTl2//szB/9olDrLccKcOiwziBhGO
 s7AEGzWtbV61vn8yMGKd3M4+xag66tjFDLmsMuj3rayL2KesV1ipq+MuddkPk8T8QJiM
 9HVF/4YSD75JWCvmqZceYeKmy+vIFdnFux60mvIqegxtMAl5hxvp1TdBxi6n0HW+7nL1
 YaBFs2HLSUTz/Z7RsWFjOZnF9faXqXWIsdKJZU6/EOb8XrL9fyKaPpVeBqyxn6rTrSNp
 hVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2juJJqmlf5ooe6Mkgg0ysrobkoIHUgWbjPnYQomFRo4=;
 b=pvgufTju0eVF+7UDBBjgsR/rL3Wc+fUa/4VruH2XRdckDrwj/ipIoTXQI8Jese31uD
 8QEmdIVC5X0BCSMSGDrC54hvkjMkw08MC1BtYneMDkD0CYLwKl83GsbTwX9KKkRWYoPc
 B1nJv4q2w8bi+dsZl4STLb2uMShkM6q5iHTwW6oxoR1zBN9hkNOH2HR9pO2fjPKFp604
 5OaAEzqpZKd0ygkB0f6ZcqU+NyAXpZEUBZZHC2snI7sVmUxnNJjq+llli0Ny+uHL+bjS
 suT8eEv+rXPpHNXGzlLkDtimBFlF8QNp22ZJipu1gOSTJjhsUTBN9fmO42k/4wZYW3U+
 aOWA==
X-Gm-Message-State: AO0yUKVlnzU50gyEgbGPNOwM67ZoGdmboC6/uUNNd56OXhQXatPmmUxj
 eWnEipOvuCOjy5oDUZ4sWPhqC25kJ7Ya9eHys29wPw==
X-Received: by 2002:aa7:8a0e:0:b0:592:41a:1054 with SMTP id
 m14-20020aa78a0e000000b00592041a1054mr1976498pfa.5.1677171239723; Thu, 23 Feb
 2023 08:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-5-richard.henderson@linaro.org>
 <CAFEAcA9RGYhU3wryevfPQcn1xKSQk6MVaCgfhGpPUXq=L5=_LA@mail.gmail.com>
 <d08b115f-ecf3-c71f-ab10-d7b221a262e2@linaro.org>
In-Reply-To: <d08b115f-ecf3-c71f-ab10-d7b221a262e2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:53:48 +0000
Message-ID: <CAFEAcA_D4+Z_6TZyC7goXKuqkLP30jvzwjFtAKs83TcSJthytA@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] target/arm: Use tcg_gen_qemu_st_i128 for STZG,
 STZ2G
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: dyEs9Av8o+uC

On Thu, 23 Feb 2023 at 16:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/23/23 05:24, Peter Maydell wrote:
> > On Thu, 16 Feb 2023 at 03:10, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> This fixes a bug in that these two insns should have been using atomic
> >> 16-byte stores, since MTE is ARMv8.5 and LSE2 is mandatory from ARMv8.4.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> >> diff --git a/tests/tcg/aarch64/mte-7.c b/tests/tcg/aarch64/mte-7.c
> >> index a981de62d4..04974f9ebb 100644
> >> --- a/tests/tcg/aarch64/mte-7.c
> >> +++ b/tests/tcg/aarch64/mte-7.c
> >> @@ -19,8 +19,7 @@ int main(int ac, char **av)
> >>       p = (void *)((unsigned long)p | (1ul << 56));
> >>
> >>       /* Store tag in sequential granules. */
> >> -    asm("stg %0, [%0]" : : "r"(p + 0x0ff0));
> >> -    asm("stg %0, [%0]" : : "r"(p + 0x1000));
> >> +    asm("stz2g %0, [%0]" : : "r"(p + 0x0ff0));
> >
> > Why did we need to change the test program ?
>
> It gives us a test of the stz2g insn.  We still have other instances of stg in the testsuite.

Ah, right. That should probably be a separate commit.

thanks
-- PMM
