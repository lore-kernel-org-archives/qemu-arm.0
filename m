Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1912512lfm;
        Thu, 18 Jun 2020 11:44:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyZJvvnnX/gx2fG37i/Nn7pkPN09QCDCP6rA06sij7pXRKUndw6zUHz2QML1G7FmLmU8sf
X-Received: by 2002:a25:54e:: with SMTP id 75mr44895ybf.222.1592505893946;
        Thu, 18 Jun 2020 11:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592505893; cv=none;
        d=google.com; s=arc-20160816;
        b=LhBsF7tOxgkQj5ddkqoyHpqk+GebEwzJIq4w2nDgFGxKlEd2NaOOIYCa8E4N3LZ9CU
         LdDPyKxgJTfAcN3EwQLY67zgKQ2FnTyKge6FZDHK3E5PEtgFEuSBnSI/5l3Hwb6N2zxa
         epWK0wetEz+QURoU5Q0fOtKALbku2bxjJG8GhLvdEJEIgOnedkJzfwFp4AezOrqhCsyV
         lFvJp+Ycwyytb7HI36toDnBPzYdsD1njSF8ZpDEUK0z+UA/OBZBPwPRlwd2wgN370jT8
         4F1W8z19HohRXLFB3Liu6E0Pbl6+SkIYDGj7KTt8Z121o4TBrRuhIboXJtBJVo0eXB5m
         yDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sx+6o1FRMURxM/rnC6WvWk7o1ZMRJ9k60AmC58U6q+4=;
        b=vVjEqnp8uc9Q8g8J/nSGstgp//u+t0uydEG3Ui5YsjfKftEDVxJbr+/0mzkqluq1em
         2y4rvsE+TSVjOKfVzRKxl3EenoNfJ2qclD3XHIXNr2pgNc0UndwxVzGoWxPUh1XbJGOa
         l7mGuo748w5oEWqkW7EnxD8ioEO939YrM8Gut1W9BRdsw9ne5pc2c1PNl3ViVnygsBBo
         sEztdAWqWsA3QTmOPY1im9BKB/PLSxDGR/Y4G5bG9W5tphDwAex9rLEadRtxs2FIllji
         d833w6mpErPoWUlmcWv3efgkwPzigbBSL9vOM0hdD/YOKJh08YGTk60I6nuYItApbUUu
         Nb3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e52GCJGl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si4634124ybt.495.2020.06.18.11.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 11:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e52GCJGl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlzWv-0000Yg-93
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 14:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlzWo-0000YI-K0
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 14:44:46 -0400
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:41819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlzWm-0003YE-U1
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 14:44:46 -0400
Received: by mail-oo1-xc43.google.com with SMTP id y45so1388555ooi.8
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sx+6o1FRMURxM/rnC6WvWk7o1ZMRJ9k60AmC58U6q+4=;
 b=e52GCJGl2J9qXJwRQZo6ZHEzmBM8wEaPgRwsWWXEZJWPLuchkT/Sdl1LzwVBgsZaHA
 gwoiIcu+fzGhe2eFirNT4eLYKfXHUhEGeDie2iRW5LggD3NtpTPmqLkAGEjej6969Wf1
 NeRwOzWrvSNiPUN3ur4fd+lGFEXdo3ajyJkMQkP23CEz95oBEqF9n4QXEnC3RdzHXlfT
 G443/MToBywEFKsmjLWwHs4odMaf9GCbwK0OiTWAZAOdKys9GThSE2xT7YCN4oPCshki
 zRlPTsPgDVYOdvp9N3Zoan+e1Z6pOkVp/KG56c8d/DKtP+lScK2LXyzRYZ/zdAyjKQ13
 SaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sx+6o1FRMURxM/rnC6WvWk7o1ZMRJ9k60AmC58U6q+4=;
 b=d5vOqXx7IE6RESPxo+Nx3M6PtMue68eZuTTayosuRt1h0eo79glFmGHLuB8G+oXgg4
 GixQyrXBeHkIgjr4IguQG4xwvyoGjfxxacaIfLKr8f3go4Q/MvkGXKFM20m+2sDCZln4
 mLdgqe9hwIMSqN5VT3nEK+8Flou+wkoRmo23JlM3eSnjgJRaHXQ0Xvi/MjKqisD8WQVF
 xmBIwVEbV2A6505EAlA8DDjd6x3umwsnkgQdsDdaldHeQcKbsauHLauJ5PwdQyno/Pyy
 otIo6e7nd4i8L8ci3Tg5PJ8ncPUJ5uyAkxyxzOTxBeAVWkWxjnPK0TcK2C9PdKZBd9t1
 2xNQ==
X-Gm-Message-State: AOAM5314vdqrv4AJASaz8T8zZBId8L01g+R8zhQ+DTiI044bzmK4K4o/
 rRqZ3kQck4Q1TXF8P65BE9obyvyQg+2lFYFA/YvT8w==
X-Received: by 2002:a4a:221a:: with SMTP id f26mr181740ooa.69.1592505883703;
 Thu, 18 Jun 2020 11:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-4-richard.henderson@linaro.org>
 <CAFEAcA9bAt=cG9nSWP6JaVyx4jf2UGmYLKzvaJ7rVCdLVpw2ig@mail.gmail.com>
 <f2b5b9fc-0586-1716-e5bf-c04db454f745@linaro.org>
In-Reply-To: <f2b5b9fc-0586-1716-e5bf-c04db454f745@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 19:44:32 +0100
Message-ID: <CAFEAcA-RbaDWZfLt0TCxJ1Hrantjwomh96X2AXVZ3WjoYD8pbw@mail.gmail.com>
Subject: Re: [PATCH v7 03/42] target/arm: Add support for MTE to SCTLR_ELx
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZIe8W2ti5jPx

On Thu, 18 Jun 2020 at 19:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/18/20 3:52 AM, Peter Maydell wrote:
> >> +    if (ri->state == ARM_CP_STATE_AA64 && !cpu_isar_feature(aa64_mte, cpu)) {
> >> +        if (ri->opc1 == 6) { /* SCTLR_EL3 */
> >> +            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA);
> >> +        } else {
> >> +            value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
> >> +                       SCTLR_ATA0 | SCTLR_ATA);
> >> +        }
> >
> > Doesn't SCTLR_EL2 have the same "no ATA0 and no TCF0" that
> > SCTLR_EL3 does?
>
> No.  With HCR.{E2H,TGE} = '11', those fields are present.

Ah, right.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
