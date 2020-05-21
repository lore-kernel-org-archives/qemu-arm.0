Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1766106lfb;
        Thu, 21 May 2020 10:19:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPcUeY0bXt4d8e14e/cmVL1x8ocMyO4G0SOjkAwqcBFOpJ48dqzY4W5lHIqLFmPLSKHArP
X-Received: by 2002:aed:3009:: with SMTP id 9mr11644490qte.191.1590081549478;
        Thu, 21 May 2020 10:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590081549; cv=none;
        d=google.com; s=arc-20160816;
        b=yENBwc+79CAkD/8K2Sgo6MmuMfG7OXfSA6rYi+hT5gEbkSME5cPiRYJmoEpMy5VrsV
         O1m3V1VJ8uNFmT1fi7f647YgmO3yge1bSZX41+Al2a7/VSq7mFeVJBm/H59x8dMQTb/V
         4DWcunkMcvHImwBmstD12ElBq+rCmjfLPb72KkapJQKy1KxX7NLXtyV5f/GNqDLeSdlZ
         Rs1tjWHGCYCLm5Y6tVEvhImNFY/lJKHRI9EnY8TXOjpc3oqYbdM8HBqtnPQ0gdAzczUV
         S2OuL+28A3ed4HPO49jIkdZv+bt8tDDwM6ZOdjlXDzUiYA0FT7HzvvH7nqIema2TF0zu
         Sbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RRVNm8yyLwG+jWu/U7zrvE67aC9THe5XI6GoogL1M/M=;
        b=Fc6syfhcs2HDRCsnEpZdLgg/O9oEIl9YLRq0iOd0XTGlMBhLM3O7TWAD6+yyAhVxxC
         DIXnq/BUGLoQEIyUy47+CBw0TpA9YIAYmXB2I0it7MUt9zP2v0if3pE99NvYwRPUdcod
         1YTlztNsovKDzGX+blcMkFuGkW08lVjpVUDflO5kimcDmIPdMcehHH4A4yhzIrD5XDZc
         Ue7SEfDk5Cm2nJtbzL8V3x1TkfI9rN8IU8IiRtnQ5tCEwFm8OwhoYZyQKoYJ9UaAko5v
         gnMsw4F4baaRuezXOWIOtWoa2pxgw/OR4AwFRH8WNcuaqmEBuJJRMNJERBmmWqhDsEh1
         9E4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JZUko1Ew;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si3847201qkj.116.2020.05.21.10.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 10:19:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JZUko1Ew;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jboqa-0001H6-SY
	for alex.bennee@linaro.org; Thu, 21 May 2020 13:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbobi-000876-P2
 for qemu-arm@nongnu.org; Thu, 21 May 2020 13:03:46 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbobh-0002SG-S7
 for qemu-arm@nongnu.org; Thu, 21 May 2020 13:03:46 -0400
Received: by mail-ot1-x344.google.com with SMTP id b18so6078026oti.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRVNm8yyLwG+jWu/U7zrvE67aC9THe5XI6GoogL1M/M=;
 b=JZUko1EwucyUqV1BeC+Onn7zX0mWd5uLsM8zMmv03bZdYvPhbSel0e33ZXc4LbGDNf
 WiLyz3HBtU1nfwtH6HpNEAimVrtA65l3JeObCGcLtzuWDywGf8VwB9xqKTMixqSzrP0p
 ifAbKLBFklQpIzO29lc6zzYJS43T0cNHvNhueFxtgW6psSOWrb47v5/f1QeVB0tR8Fz9
 7FpX+G7xYS3qccDhYcf3i0ASgX4o1rNUIsxjvLyU0Xe5UQpjHW44MUil4Y1vWx7DBt02
 zjuG3dfNHOpCctevFWvlS+IsyMxhfnmhhHNi37GCLZMvIbRlbHCtBRTIheWzHE6VDETB
 TyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRVNm8yyLwG+jWu/U7zrvE67aC9THe5XI6GoogL1M/M=;
 b=WBjbxz6UKXFY4yesW7NvPLH/sbmJuK2mpf7aZvXBnUhjZUKd443UHs7B3GUdBn5IjC
 araMEEnIIcb9wosB5A3m7zhwAhKlIHAG3Vf2vVKlagkUB37saBhzjsXkWWeS9QWGB8WJ
 qWNWcRgmBB3GGVJ5U5kHNxDVmlRJEG2+4B0MPWIqzauVF/j+BuoP7R+fFJfgV5uQ0VdO
 xHRWb9bPcWliUZLRam44YbDTXS7+CNQ/wZsOJKXT3rlvbb1audGVIJwfy0rnhFpVj2Gn
 xfcpyuFcHEftpIM0ImoapYmnpUXQPjdzXqcx2sT/1zt5auepL4yQIJTSCFYHLWN+s+/8
 j9lw==
X-Gm-Message-State: AOAM532xkivAYxudqA7xMB5zYWSvQ8F9iIqYB+gBFKLCEsVhvqfzuYaB
 MXHzynGgJSyD6G5D3ai3cQBe4mj6Hq0vr4e8gr7W1Q==
X-Received: by 2002:a05:6830:158b:: with SMTP id
 i11mr8034778otr.135.1590080624595; 
 Thu, 21 May 2020 10:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200511131117.2486486-1-amanieu@gmail.com>
 <CAFEAcA_2X2CY3Z6Pwcd=p-vboPuYZPJOfx4smoQCoWtjo5sABQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_2X2CY3Z6Pwcd=p-vboPuYZPJOfx4smoQCoWtjo5sABQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 18:03:33 +0100
Message-ID: <CAFEAcA_C6Xv=-Lqq2xsgXWCUYvzCLiM9ZtZvV6q4kO8g-ugUFw@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user/arm: Reset CPSR_E when entering a signal
 handler
To: "Amanieu d'Antras" <amanieu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nL2gVJO1VfKT

On Mon, 11 May 2020 at 14:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 11 May 2020 at 14:11, Amanieu d'Antras <amanieu@gmail.com> wrote:
> >
> > This fixes signal handlers running with the wrong endianness if the
> > interrupted code used SETEND to dynamically switch endianness.
> >
> > Signed-off-by: Amanieu d'Antras <amanieu@gmail.com>
> > ---
> >  linux-user/arm/signal.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
