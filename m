Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp526368lfa;
        Thu, 10 Jun 2021 07:02:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIBTmFdXvAohycwimzF/5BBwwdaZIJxmTV24AV1PmHfGg9uT5vjLJuM32/bTxM+5Q56ZG0
X-Received: by 2002:a7b:c006:: with SMTP id c6mr15080527wmb.11.1623333742038;
        Thu, 10 Jun 2021 07:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623333742; cv=none;
        d=google.com; s=arc-20160816;
        b=MLgZZyR9IHs+3DW5pqUaL5J+h+V1dFSGCoRdljlYNCRoAAAq6qIksD+qNaMjpB+oOP
         XYNUdtolzPoTOhlCASY2e1IEBmh4oasY1NJkX37frX05v6evbMr6MvxiQtAXsJtT1rEP
         XqMJAU8vMTlkueGf6Wm8xfM8uwb2gjv5X5dl0+MguwmO/oVw4ws1KNCDAUwyP/InXCdw
         7+JLlz4qkFObh7woaB4qdTft+1RH377l2R5lg90Fv13CqbKQXAmf9/Dwy2ToL6N5akMD
         gg7/7b0pVjG5Vm5dY8z0RcHD1dLPM+oW7nOU6w7un+7jyQqCiFFOaTLpqi6pf07Xqi4w
         NWMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uyjeXn5TiV+zxz7pjj2dvqQKHz3uoHaAU8gkJ6NjSnk=;
        b=1AqIHrsLoIJytK506BD95EpEVuvM+mV2bDjCydyl3vtHjV2ll5vwKnlLXycFoHqh9T
         IHF0uNa8PWeNKwCMEwwlliXIOplFqc08B9UXMcoy+lxN1VwMz1KRSUiiCg1hYDXiJsDw
         de7PujJFZA2W+WOtjnmG4ccFJbIfFmU2zr09xZaHROCEy8ByM9W72DIvMBpRtOTz1QAM
         rpEEVKH43Ii3uI9XaAH3+CuxSpzFVeK6+2bhE/sfosY532iUR5KyP5VbN7nO0raflyrl
         I6J3AkspkmQHeLkSuzBlB2/22VGrgUAVtksad8v8hwl64ASzdBMuQkSq6KSnjJz548ac
         mpPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AFjc7lZ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os28si2854577ejb.695.2021.06.10.07.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 07:02:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AFjc7lZ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrLGH-0005Iz-2l
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 10:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrLG4-0005G1-Rs
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 10:02:08 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrLG3-0005md-6I
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 10:02:08 -0400
Received: by mail-ej1-x62e.google.com with SMTP id c10so44341532eja.11
 for <qemu-arm@nongnu.org>; Thu, 10 Jun 2021 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyjeXn5TiV+zxz7pjj2dvqQKHz3uoHaAU8gkJ6NjSnk=;
 b=AFjc7lZ1q1E6GI9VQHWhqoRQTG2hhwPsFJGdtMobi6zHP5Q5rzcm94y1EUaeUGZDU/
 sz2db7/nWssyUvOP17n+gYOJYGXX3lVuRcV0fTXLm2NppliCRYswYokcY9EXOdjb2hyP
 IuGUoXVTx4BdneE0xjG+ChCR7HRP6IVzf4IZ3XNqJkebifGhNJRGajmKkfwPKZPsQjab
 xWDW2Qfen75H4RvqjcIr6mbynyzV8ZWO719eLVyhGZwZHzfD5PZ9JeOQene9Ea27p0+u
 dHiNKSr6DjIGCG3W6Y3w8awf/e+zt/jAvMGwQ5NNUzwFS9RBp342fzewPL329aHHSA1P
 B//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyjeXn5TiV+zxz7pjj2dvqQKHz3uoHaAU8gkJ6NjSnk=;
 b=ag/kDtNkMNl2ZA7kTB/1KvepuCQAyYgvN29R9IlHKgfhcXfSmUd/tppPJxQa2XMfJu
 db5RXryrK7IakkZq2R/qLPO21XLq/pTzIs9Bixbc6PW/PKL6lRZVONzuz2nBaNhDwpWY
 QoGVSHsASdlwock2o6wz5mV42UxnNLUGuJ/OoS6jTGP9zBm/zJY1J9IXYYlyTkxVtFe5
 hmaC7IedkUxdqpDtT917qb5vOzilwmb8LnmacXb7uYH4lLDc3hiI/HV5eJVhlIxpeKSp
 ceJPo8vD8dKSvm8e+gf+ZoksGqmPJufIMEcP1iIAAkZCn+OFJEl1rQPHU1FOgM+kL3kQ
 lJWg==
X-Gm-Message-State: AOAM5315tOD3rWsKWhBG28DKvLCBR6y+2yqvJgrA2gWGJYUmQcSqHqRs
 20Nllt4bntokxWDyR8zKZFEeYf96SZAHaFuMRiuPNA==
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr4685084ejb.482.1623333723332; 
 Thu, 10 Jun 2021 07:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-12-peter.maydell@linaro.org>
 <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
In-Reply-To: <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 15:01:29 +0100
Message-ID: <CAFEAcA_7HQEwxeFcROrcGva5hYXswhp6ZVs6zXohpZ6pWmL=hQ@mail.gmail.com>
Subject: Re: [PATCH 11/55] target/arm: Implement MVE VLDR/VSTR (non-widening
 forms)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DgIkKNQusYRm

On Tue, 8 Jun 2021 at 22:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:57 AM, Peter Maydell wrote:
> > +#define DO_VLDR(OP, ESIZE, LDTYPE, TYPE, H)                             \
> > +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
> > +    {                                                                   \
> > +        TYPE *d = vd;                                                   \
> > +        uint16_t mask = mve_element_mask(env);                          \
> > +        unsigned b, e;                                                  \
>
> esize is redundant with sizeof(type); perhaps just make it a local variable?

That's OK here, but not for most of the other macros, where we need
ESIZE as a macro argument so we can do mask_to_bytemask##ESIZE.

-- PMM
