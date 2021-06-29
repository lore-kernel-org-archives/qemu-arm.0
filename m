Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4949230lfg;
        Tue, 29 Jun 2021 06:37:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/V3zZzyVbfSX/DcgfbRyKdX3IpanyIA7obrj37jKonHXKnoi7Z14myvBmSXJ+VI+mC75f
X-Received: by 2002:ab0:2e81:: with SMTP id f1mr7835545uaa.74.1624973819919;
        Tue, 29 Jun 2021 06:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624973819; cv=none;
        d=google.com; s=arc-20160816;
        b=s1drfwUqQX/2ENnC3sdZM3fnvBul9XPiQLhPundwGU/ki1MYaLzyaa/5lIswsXXH6i
         CXCwfbx+MDEESMbY0WmAGNs/6voLLHkVcKnC5SHIaaHNvyQx2640uhhtxDr4Eo5NnrSz
         lkPYeq7FGi97L1C6SQ/A4KBu0/AjcP4uMYjV158RC5wuD3QBwVode2qzeEpbiIlibNqv
         tOjtbzLd0HTxMVbwE3HbMCCN5cx+1IKiGa27Kvrt1sPQHtW0lavtCqG5qpnOBl9aU52A
         SkpuzxpQKUknHSr2ujiBJnQ+h6rCCY63RfTFA4P3k2lW0HggbxzioMI3GN71Lzbnrrq4
         Am1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tKGD3Go6x/1to6gDwysVGeFKBWd0xXzMfiPSrKYc6g0=;
        b=H2WSxyf6b27pkOU+uQNMphyxxAgYuqyvO8mocLiT3xPilOXZlBiMCttsiFohyIhFng
         5fMSsmJTav9dpYoJt5Op1gBNS+Rv+9CYisJVt6dutCJSAzqUBKi5sIT2VjQnXuPF4KjH
         pYhr4U0yUWtgsgxbjvySJ3UX+pdXafVHXisg1cp+vvdc2TshM2OUKzf1yA3IJYL7drcg
         RIohehpFRWbGAlQnVGeXOepaWQVQ2/ek0J9nndtnL72dAIuYOgzl8L+k3xKswTwXGBZf
         8yN8Kp/GIQE5AtNxOAI+vHKRPehkn2Ik2GMPt2j43BuJ8AVSFwfk6JmDidR8/aEP3m5c
         3i/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J41YGTlI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si4161330uan.23.2021.06.29.06.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 06:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J41YGTlI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyDv9-0007DZ-3q
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 09:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyDux-0007An-R5
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 09:36:47 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyDuw-0002Sh-14
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 09:36:47 -0400
Received: by mail-ej1-x62c.google.com with SMTP id hq39so36402831ejc.5
 for <qemu-arm@nongnu.org>; Tue, 29 Jun 2021 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tKGD3Go6x/1to6gDwysVGeFKBWd0xXzMfiPSrKYc6g0=;
 b=J41YGTlIRlaX5uZ5nz294JbkmGa6N2s4bJDzfaGGKkjXlRjU8cVc5iwY8DC47rtqKh
 xYIo1AC6DyQwmC8CbmyMjwnch9UIqLWhzWv/gZs+t0m+zjRr9A0JXvNZ/AmSlwto9h8b
 zViZkZJAgtYdpzWya5bxzxAEiCwhbVMSRW1AFCh6RW6cHvQpwduu5oWZglRCBbnU+5Mq
 ud8v1jNYM8Hf1ZGyFZpSe07RAGSDaJcpsgorAmh9bWYjfMgj5GKQJY1y/oWQv2Dt1ttW
 2K3PmsIhLnmMfoXgaMjYLSqS9THP2NLFYQRmSJOXgNrb3YwoEZg/C2m1p6UopWba1kCA
 6rqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tKGD3Go6x/1to6gDwysVGeFKBWd0xXzMfiPSrKYc6g0=;
 b=Ew1w5Q9qLR1Yj0YX0D8LYtH7sjkafYrMeNbOY032ooN8B3Pyaz5jQ2d8ww/lL2AGY6
 i2+FxlmB079bJj5HdZYGqAo/w1+8tmLqd02MMQ6/yMgDMAB1K0TP6MMIupg6oG4HieKg
 gVsijJVg6S96kzT7Rc3Ds6hS2qQxHOMqBptp3Zg1jOyO9dyJbU13zXg3L5tpRbB9MhhZ
 OFj9pXZZ0ceXJ+f7OxoOYNWUclTk1QGEw6cd2wfCp8JqRLXK/LmAHcISNGln0xBqBRCs
 ytSEUBC/0azxFRO1gnEWek6wae8hVWLKl4/O6hPfj2CPg4oCi6beuopeuoBIocZ4tHaP
 DgzA==
X-Gm-Message-State: AOAM531uvYkgND1RzmSkK3Z47UIkNf3BKfXlXwJ0a6kL59B7JPDig9Tp
 U6JjWbmw1y8gAWdlVX2GyK6iWqM+FlKaDULGyQAs0w==
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr30347544ejc.482.1624973804056; 
 Tue, 29 Jun 2021 06:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-3-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 14:36:06 +0100
Message-ID: <CAFEAcA8pbG0kp_un++SzGfyVZw0FOMVU7zdyBCa7YKsCMeAZuQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/23] linux-user/aarch64: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6wI9A7WCmrdX

On Fri, 18 Jun 2021 at 20:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create and record the rt signal trampoline.
> Use it when the guest does not use SA_RESTORER.
>
> Cc: qemu-arm@nongnu.org
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_signal.h |  2 ++
>  linux-user/aarch64/signal.c        | 28 ++++++++++++++++++----------
>  2 files changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/targ=
et_signal.h
> index 18013e1b23..7580d99403 100644
> --- a/linux-user/aarch64/target_signal.h
> +++ b/linux-user/aarch64/target_signal.h
> @@ -25,4 +25,6 @@ typedef struct target_sigaltstack {
>  #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
>
>  #define TARGET_ARCH_HAS_SETUP_FRAME
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> +
>  #endif /* AARCH64_TARGET_SIGNAL_H */
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 662bcd1c4e..65b84eb04e 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -108,7 +108,6 @@ struct target_rt_sigframe {
>  struct target_rt_frame_record {
>      uint64_t fp;
>      uint64_t lr;
> -    uint32_t tramp[2];
>  };
>
>  static void target_setup_general_frame(struct target_rt_sigframe *sf,
> @@ -495,15 +494,7 @@ static void target_setup_frame(int usig, struct targ=
et_sigaction *ka,


A little way up from here there's a comment:

    /* Reserve space for the return code.  On a real system this would
     * be within the VDSO.  So, despite the name this is not a "real"
     * record within the frame.
     */
    fr_ofs =3D layout.total_size;
    layout.total_size +=3D sizeof(struct target_rt_frame_record);

That now needs updating, because we're no longer putting the return
code in that target_rt_frame_record.

I think the 'struct target_rt_frame_record' now does correspond
to the kernel's 'struct frame_record', right?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
