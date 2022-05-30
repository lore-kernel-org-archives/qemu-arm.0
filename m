Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2968164lfh;
        Mon, 30 May 2022 12:01:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz64V5CVXTiaZDtY3MzGy1H3emxwp0HVOTpAv/zxltHHTdOcPWBDDXQN4DMr98FYqVZoyWI
X-Received: by 2002:ac8:58c9:0:b0:2f3:d8f0:185f with SMTP id u9-20020ac858c9000000b002f3d8f0185fmr45229694qta.381.1653937289220;
        Mon, 30 May 2022 12:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653937289; cv=none;
        d=google.com; s=arc-20160816;
        b=dO/qp3isRggPZRQKyUVitI6OR90LzBdzBNfayuZxSKQ9YoxS7kQIJCNiu1W7c8BtBq
         25bHqq9GE+JJXvjvMygu+N4l38nY/6KLwYRj7gYxF+Zi2fN+0kILWClDNb74mtBdIls8
         ULqiQ0bZEpSAf7DmvF6rnMql8iASD4m9k81KSRQqUhKiI65ddjj2Vyh1Az/W0pgh0y5E
         ktzeXjDskocXNQWf3NvAUkRq7IALLLrHmgBKNVuibK2Z6JMF50/8KIw+bMkxKUtR5pSs
         MaYi0VyiOtSRDYWHzXsYVXeaEpKqZNtWeMFM2xx2lRKU12wUVAGw92oIoFLBwwc0gZb1
         gz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7BnUTAt872dtCS7tKctwL+YpoBLVhZEQFwqz14hxo3U=;
        b=DZVe/Ahpz1XWBowD/djFfDUCAdITeotW6OOMgT6v+tczVHv1+/X5SHolSjbTLRRLGW
         GTJbze+X1wa1abs0gJhB0mfc98zxRR2JrcY4rwsM5Sbpm2ifvbOm6Ejruo61jZI6b9/+
         B0YWbtyEW9O9XljhJB0c/awRJtVZfqmhtQ3YJ7nZSgp/ijJAT1ttR6UJ2HGAAYHTwMgq
         g20eRM403RDbhOVSZ+I1nsw6C+y5+h6fJz7F4QOk7ByVXDYZLh6/kVU7geXnnT3LNHoN
         wyt9iF6KRJyY65K0tcGztu4tOeHL3R6h85KozaOSLWDQoz+RKRYB80CnT2CWNfSum/dN
         vPWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xr1nKKov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020ac85f53000000b002f3b46c9b74si7932779qta.590.2022.05.30.12.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 12:01:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xr1nKKov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvkds-0007Cl-OG
	for alex.bennee@linaro.org; Mon, 30 May 2022 15:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvkdf-0007CE-SA
 for qemu-arm@nongnu.org; Mon, 30 May 2022 15:01:15 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:41648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvkde-0002mO-3s
 for qemu-arm@nongnu.org; Mon, 30 May 2022 15:01:15 -0400
Received: by mail-yb1-xb32.google.com with SMTP id e184so10848777ybf.8
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 12:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7BnUTAt872dtCS7tKctwL+YpoBLVhZEQFwqz14hxo3U=;
 b=Xr1nKKov3as2F8skh9jfCyO5BESGOCAwCxF+sGvk21pPv/pWMRbKOx8XwkIlc4e2/F
 TKekIfvYzQR8mCZfgUQ1XerGYG7YAE1P0hu+0/qC+Kf//40oFWOAqhem3IZdBL4Xs2rd
 I7FLs/N7CwWCGScLgomAnMOwwH93dhbmnynPdTqrNPuUkuiWN/kmE1aGTCZVPMPkme8n
 jS3joqP9cj3bce7mjWhm0lpFgotZcd8ZgcuQ1ISY+kYXdOi/VHI+6lP/mwZrAenLpkor
 gX75obOryfjD+hjOMSkuwV2CctU4uJTdDJTbVUhTo1tIW9+b7Yr31b0v+vpUqa6kExlG
 wQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7BnUTAt872dtCS7tKctwL+YpoBLVhZEQFwqz14hxo3U=;
 b=rPslwgvWao5aJXNLhQDN1stQnCM55QZtFYACxNgte41CAu6dla1Ql93fb8lYrGpTpP
 AG2J4sZewLOAJCrS32Mzen9AwKh1zTBGmkjvxjoAMSo3BgmfPRTaVzGRdH3zib1dMM8H
 KMIjuT9IG9jED1YYOHw4k8MlemW8QyKLDfUlFLjytS9H6GpUsVg7lyqQiIzgOWnbzpcX
 ZKx15t0Yg6Ez4w6Drczju7/IB+itkjNYH8eSL8n+iDWyid67FgD5mEonUqn+lLORWU4d
 xAF9uYg76iR7VTwNHMqhP87nZLhOZVs3JT3iG27UN8mLOl5W635x2TiBk/lxVjAJ3Ghu
 uszw==
X-Gm-Message-State: AOAM531AGXi9uHtEkSu1v28l5fX3c7QCj5ELMtG5P0L1MsOrSba/Moed
 EbDqavUDtgkZ//bPx/bcPMbAb9mEwjdXKlJomxZYtg==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr54986622ybq.67.1653937272933; Mon, 30
 May 2022 12:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-2-richard.henderson@linaro.org>
 <CAFEAcA9Q8FQpG6RF4rnMS3EXZqBXzOs=n-3oH8iq5gU2wV4Emw@mail.gmail.com>
 <da0ad208-948b-1da0-5c61-039c084d50dc@linaro.org>
In-Reply-To: <da0ad208-948b-1da0-5c61-039c084d50dc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 20:01:01 +0100
Message-ID: <CAFEAcA9bT0_tKH7vS+gt05rr+tskPh4JuzRTMvTN=CokQfFUdw@mail.gmail.com>
Subject: Re: [PATCH 01/18] target/arm: Allow raise_exception to handle finding
 target EL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: peNQ5HQMbEAo

On Mon, 30 May 2022 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/30/22 05:44, Peter Maydell wrote:
> >>   G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
> >> -                                uint32_t syndrome, uint32_t target_el);
> >> +                                uint32_t syndrome, uint32_t cur_or_target_el);
> >
> > "cur_or_target_el" is odd, because it's mixing what the architecture
> > sets up as two distinct things: the state the exception is
> > "taken from", and the state the exception is "taken to". I was
> > hoping this was just a temporary thing for the purposes of the
> > refactoring and it would go away near the end of the series, but
> > it doesn't seem to.
>
> No, sorry.  Most of the time it's cur_el, except from cpregs, where we get directed to a
> specific higher el.  There may be some way to split the helpers...
>
> I'll have another go at this reorg this week.  If it still doesn't feel cleaner, we can
> drop it, and I'll make some changes to the SME patch set building on this.

I was wondering if it would work better the other way around, so that
raise_exception() doesn't mess with the target_el at all, and all the
"work out which EL to take the exception to" is done in
target_exception_el() and similar ?

-- PMM
