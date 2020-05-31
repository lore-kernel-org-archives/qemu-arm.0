Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2447673lfc;
        Sun, 31 May 2020 12:09:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuMcB/0m5YW4U+bweTTN2z0vDf3nJm3zaCBfcXELJPUEw4YCD4GlexZih5uTBIscEhvPt7
X-Received: by 2002:a5b:78b:: with SMTP id b11mr2127752ybq.42.1590952194445;
        Sun, 31 May 2020 12:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590952194; cv=none;
        d=google.com; s=arc-20160816;
        b=ms16S81JCcfTICqKLAC+MmTdpHblJnHV6rTf/f7F3aAgbZ1JKiPNzlOkPFTVkP/5JG
         HbjVHZ63KXKKohL77mnoue4skX+bufUmBfzlW/+7j+HyCajXTg33cMn5FgRPZhz/xsFF
         z/Uz/YgGquDY54bzkUVTcnV4MTXCU4JeFH2pxNJ+65PEzEhfGAgJKocJNawxUExL1lKY
         nXMumjrjCJUy+rNcnPWWausicX5IET7E5MOhfthGwa/Pqti6hrd60TdlEJ9jCRXr7/ev
         8IKblD3YJ0DVOi8Tp2JKcciBSp1FxYhKlNRZ2u+YfAFghm4gtkt8s+yLRj1dInEMrxfk
         KNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=n2w956jMdsw0P8qO81PAt7xkN4qJuBxhJ3z6uUclMiY=;
        b=KqmlvPYBOKJDQagOOtJU6Kw/S5UvSXJQaWU5lii2g6vI/47hVGyPfN7AEbD+N4KMpC
         Y42u7zKK1Ko1nifOZwSwCPrGSnnSLQKPxHst7JO1554A0IFhms3WfJqaZLk4Me7hklMS
         pf83khh0JU5nR03Ep+XKrNgVJIdxo+TABIoKgthwsU9XuSXXNyCHTwUUg8+sAVscM9aQ
         t8SgClGdgIMnb7BprrIZUx++FWUofX3unsZ58yDNsl/HJX+muTSKFRffg3aUeTmfBXCN
         BGSH73bWotvv3uClPNi+5xwZbIAnItKst8nzgiRzMoPd1TDVI93ezouQB+aBWYrJtP0O
         W9aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qXs3PDcE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si12393868ybf.393.2020.05.31.12.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 12:09:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qXs3PDcE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfTLF-0006U5-RL
	for alex.bennee@linaro.org; Sun, 31 May 2020 15:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfTL7-0006Rf-NS
 for qemu-arm@nongnu.org; Sun, 31 May 2020 15:09:45 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfTL6-0007U5-I0
 for qemu-arm@nongnu.org; Sun, 31 May 2020 15:09:45 -0400
Received: by mail-ot1-x344.google.com with SMTP id o7so1786620oti.9
 for <qemu-arm@nongnu.org>; Sun, 31 May 2020 12:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n2w956jMdsw0P8qO81PAt7xkN4qJuBxhJ3z6uUclMiY=;
 b=qXs3PDcEIsr00VmppHIy8ksP0cFD7Pqej1UQ+PLdpVloFNJC9YpYqjABIQ17gwUH08
 qgw2CG7wEdSPdc63UXVQmAJNvHPfE/6ojahsu7UTZ5gKLZq6d2vZih0MsveqyEpiWi2K
 ZwCssbdPwMXDG6Nq/iEs/uknC2a9TK6//qv2BzbADY0is01LouB+8LFhkQoUI0OlTBOf
 qyc1KiEzHBLqRjpK22Vy6iOc+ETjprEl7Dy3J66SmRo0XucmxoibF84ukgc7Qjq7yAYQ
 xVh0sX+d/ZaMIu/XTsZpxkBl5IHrcMVS2r81TWqR9BF1Wsi5Vey7naA3TgQCOG5xouyT
 +oqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n2w956jMdsw0P8qO81PAt7xkN4qJuBxhJ3z6uUclMiY=;
 b=c9qG7J6cT1XluSiEr4USIkcONhQ1nlWwmPDYxqQGMcBCoJglOM1QXdYPWFWLleJsZ0
 wwbvDFfOM2jwNF59CyTtHUjbZEfgK1N+3Iy25ajvG0r3WHGnrP97d19bSBcmjxbeLnML
 TrIo1Ue0NlP+BO43nDqzRpcB2utK2FMAJHGousbiEakJzSz0oP7pnVBkYIbWJM+6Gw9Y
 SJZ3+x26K5THeRTmUSDFY0md7WEe8pgzJlrewrKOzPjZWGdm0DXT4QlOPKhSoPKbooqQ
 5p54dC4UNDIhFrlPtYM3lk5Uwkm3q2ZPuu7POR1baxPLuwx0mov0s9ZMnpo7J49k3+pS
 VGDQ==
X-Gm-Message-State: AOAM5334e6pUJttHZeXU6y29HiMTPNO+kFnWc0n0hPtCp8ozwIHqqFaY
 utyxRl+ObUVWNdbENHl+t+oSkYfGPf5DMbcxZW/FGQ==
X-Received: by 2002:a9d:b82:: with SMTP id 2mr13378596oth.221.1590952183170;
 Sun, 31 May 2020 12:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200531175425.10329-1-f4bug@amsat.org>
 <20200531175425.10329-6-f4bug@amsat.org>
In-Reply-To: <20200531175425.10329-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 31 May 2020 20:09:32 +0100
Message-ID: <CAFEAcA9CkBy=e3EmJhKko9XGbL7A_E_vedm8jt_H3+Gr6yzbhA@mail.gmail.com>
Subject: Re: [PATCH 5/6] exec: Restrict 32-bit CPUs to 32-bit address space
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HSq1ZitZm8N+

On Sun, 31 May 2020 at 18:54, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> It is pointless to have 32-bit CPUs see a 64-bit address
> space, when they can only address the 32 lower bits.
>
> Only create CPU address space with a size it can address.
> This makes HMP 'info mtree' command easier to understand
> (on 32-bit CPUs).

> diff --git a/exec.c b/exec.c
> index 5162f0d12f..d6809a9447 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2962,9 +2962,17 @@ static void tcg_commit(MemoryListener *listener)
>
>  static void memory_map_init(void)
>  {
> +    uint64_t system_memory_size;
> +
> +#if TARGET_LONG_BITS >=3D 64
> +    system_memory_size =3D UINT64_MAX;
> +#else
> +    system_memory_size =3D 1ULL << TARGET_LONG_BITS;
> +#endif

TARGET_LONG_BITS is a description of the CPU's virtual
address size; but the size of the system_memory memory
region is related to the CPU's physical address size[*].
In particular, for the Arm Cortex-A15 (and any other
32-bit CPU with LPAE) TARGET_LONG_BITS is 32 but the CPU
can address more than 32 bits of physical memory.

[*] Strictly speaking, it would depend on the
maximum physical address size used by any transaction
master in the system -- in theory you could have a
32-bit-only CPU and a DMA controller that could be
programmed with 64-bit addresses. In practice the
CPU can generally address at least as much of the
physical address space as any other transaction master.

thanks
-- PMM
