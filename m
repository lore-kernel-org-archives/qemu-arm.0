Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10066369lff;
        Fri, 17 Jan 2020 09:07:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNPIaqq4NbReOn4JIs2VfRY0aZlW2KlI+MP0MEiFBVosjexuJldvrtQCP9oYjfVQlQQMlD
X-Received: by 2002:ae9:f442:: with SMTP id z2mr34643445qkl.130.1579280832593;
        Fri, 17 Jan 2020 09:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579280832; cv=none;
        d=google.com; s=arc-20160816;
        b=ysuH2R1joTqV0pIaXtEctI1Pm04aSJFRu+/iB8Dl2hyu3VpzJo0K3dx2pPYKCnwNJK
         msi4RHxNiHAd5VXwwlCsdpc03WCU3gNz1Uer43CtaejxImTGC3Xv/6Mxna163wdTfiYR
         jfXCyeqww26H/T1WrQCXL2+dy94PHqqexe8fO9hTe1cxO3r/uk8TXCMkbg3xjN4iTUqx
         TCBkkvS39r4nV2jN5jxgYL0ZRmLU8NnjCW+RZPP4U4/OVrJ4mWvWpnBm3Wk9XB7IeR1/
         5E1RYDqcOoXlXgUiCoUu7zDWTPZ4DaH/wdxNwGcQyY7nSJA2TD1q5cYxDCxYoY50uoPh
         D0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QkcEsRCXBCVuA0A+wxOuzUf6iDH2mmgP/Rgq98b4r1Q=;
        b=s8mDCQuDK/ubatJoCv7CBfEpgBKf8KzAD8sTM9Aja9pwtUpezUsesub9FBaLGqUcyi
         5tUOQwHAGsH5kse0TOzfLMmHkNQaqUqEqG0nm8RBQ9nVb9QgzbeXTsKuUBOQG+CqLLpL
         L3KiS4eArh9lymdyuQczVZroQqlWlERQB0BgbzbhrdL/X3pqz3hGenW7qOw5P23zIFwh
         KADREFNtBFTbDPVqiiHNHSKNDJmIoipb7esBPKcn66Beq8P9oTackwkkHY2caOIz0Tgj
         qR8Z93/M6r33Uw9u6S64Hs3MhoYqJRHOHVnY1UqOlMAGUh6Xc10yfsj38WzFWiQW8+oY
         bd0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bk80x+5L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si14976394qto.214.2020.01.17.09.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 09:07:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bk80x+5L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isV5S-0000dQ-V3
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 12:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isV3h-0007C3-4M
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 12:05:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isV3f-0004xQ-Vk
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 12:05:20 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44616)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isV3f-0004wg-RK
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 12:05:19 -0500
Received: by mail-ot1-x343.google.com with SMTP id h9so23064168otj.11
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 09:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QkcEsRCXBCVuA0A+wxOuzUf6iDH2mmgP/Rgq98b4r1Q=;
 b=bk80x+5L+S5AnFe9ICJexaR762FVqyvywA3Y0mKwvd/qoNOLPeDNjjz88Va9NZuauk
 IbpjC8HR3L9Zt4lafc2fOqhCjBnhjooIm7R2SKCVWvQ2ChPc5Qe1AzSlYeflIZBvS+uI
 qdostKmXJuCJo+u5Afzj4RpRIJS5LagA+OO50GWoJV7lZp3libMVAH0yUoMx5Jc7AN/q
 GQc4RA97YaUOgblhMVSzIlYbr3AbmQxz6aMZ+7RVyhLTAfv8FU4sHHajZmMQTAC/6I7v
 04+lk1GWyeOwbz7whaPX6xRg5DJBnJFTxo45VlE1g5PlCqr41fYVb78m1JDlU0pTF5Lb
 yFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QkcEsRCXBCVuA0A+wxOuzUf6iDH2mmgP/Rgq98b4r1Q=;
 b=plGA2z++NviDVgOcm543AysZo5RKS0bQ/yEq2uU+Ua9x8qDfrQ8Op42Unf92x9rRaJ
 4Z1FpZDVDqpDGcfdvVyx/T/a73KxrXnZPK6BDg9tEEHD6bNLuY3zkPOTtldssvaDxHwe
 1PPOFXqBAfNJwbcKZ9rml/wmAJ0y2hanfqcknqrzlfThxFyhogyHxhx3KK4HVuiVRSoE
 2xKmJmjcl72AcB+Uh5u/ZSVuneuv+2+Qi+rkBDMgs1JAXu0Uw0+JlOo4MqQC1eMTV5UG
 PwVJZw3ae2Jf5hvOVuByQg/0Vj2lWk3+xl5bciCF6qgx0b3E99nhrSmlr9RIvC1hv4Hl
 G9+A==
X-Gm-Message-State: APjAAAUzFBUMhCbQj/wEO206cwclBCbEAyTq+rOsKp6pAct7Qu7z0VoX
 XHKRbNhqqGAq9zagNrhDHj/tiVbY24//aCQggcjsVQ==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr6448812otq.97.1579280718778; 
 Fri, 17 Jan 2020 09:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-2-linux@roeck-us.net>
 <CAFEAcA_k8xdzmsgMK+m6wSgnBN53UjCNU4nTBx=hnHnHz+Su6g@mail.gmail.com>
 <20200117164625.GA27197@roeck-us.net>
In-Reply-To: <20200117164625.GA27197@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 17:05:07 +0000
Message-ID: <CAFEAcA9dvOQpPxkjG4XqYiMXbVsZ1VMCZWEWegeTu-GNW0Znaw@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma/pl330: Convert to support tracing
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FSUpxtpLDotS

On Fri, 17 Jan 2020 at 16:46, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Jan 17, 2020 at 01:23:46PM +0000, Peter Maydell wrote:
> > Won't this now do all the work of constructing the hexdump strings,
> > even if tracing is disabled ?
> >
> That is correct. Can I check
>         if (trace_event_get_state(TRACE_PL330_HEXDUMP) &&
>             qemu_loglevel_mask(LOG_TRACE)) {
> directly in pl330_hexdump(), or is there some other means to handle
> this kind of situation ?

It's not something I've had to do before.
docs/devel/tracing.txt says "just use the TRACE_FOO_ENABLED
macro", but looking at what it does that doesn't seem to check
the runtime state of the trace event, so maybe those docs are out
of date. Stefan, what's the current best way to guard expensive
computations used only for trace output ?

thanks
-- PMM
