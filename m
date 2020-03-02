Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2357136lfg;
        Mon, 2 Mar 2020 04:03:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOydQQTm8zJyEHv34OPAuAXm7gIdGGDRLyqv7B8qVM8jtYbOGxqbvUAIIeWNT1zUrnRv5R
X-Received: by 2002:a37:4dc4:: with SMTP id a187mr15948777qkb.436.1583150623499;
        Mon, 02 Mar 2020 04:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583150623; cv=none;
        d=google.com; s=arc-20160816;
        b=xYyRkjI3hsZsE0Yd55KJG7W7El/GnOOqNEEZ/gI7kIfp3YKEOun+l7NF/R0NYgFGa/
         kqNHoL4X0Er9Fd0N6Uu8ow+DexkjMSGic9Dh1QpmifSkkfcr2bUq6R1hIn25afGQjvoH
         dctvXWsofzpmwQmVlcV1YlQ6ztiWWDzkdWAd3iQaM71QZXjOlgH37B7pKd/ubqnW4wRk
         9QYxTubqICdh9itBEBrPyDfz7KyT4Bx/LoF/Xgc683I6xz8jsP94ioi/RJOveDG6Nz3U
         xCPIvChNHL1FhKtuLm8iBSYu2SPmAzzUoUWzQ11t1IWieRR7ptsVwRj1Mqmg0gr+Z/6U
         nxgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xvrzjGN36cRh3bX+Msbr9VgDla31tI4bhi2vHnugGuw=;
        b=wNrRiGHLV+cfkGk/PEoZOcHwveC3PbcvyB987WPxiclWjtY3EjP2WOJ59pR5X8tuBg
         dXCO9hjJJy3L7B6vrwydSwCrs3Su302dxHyFgNOp0sMu6KYOmKNsQPE2vPWUFaZptBto
         H09hr6fZw/21mBuP5MfFExCpF+3H7Mp+9NthWBDIbQEKSMUOVJh0tIrYI45K3+toV6vM
         gb0BD2hEJa4Ybm1pBpo3dGcEPCt2zONFlya6BG0cH4BmDcaOV8n1/30gjrdTNc0ZYUs9
         bv7UWTcX/0DTNHi3bya+OhAEFF/D+M9tSdxHZidWmOrRnDmgE6yZS1xvtXe1M/es4Xoi
         y1Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H0fRD6gS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si1919964qkv.275.2020.03.02.04.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 04:03:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H0fRD6gS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8jnS-00045C-Um
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 07:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jnK-00043i-PB
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:03:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jnJ-00050k-Q2
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:03:34 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37427)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jnJ-00050N-KX
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:03:33 -0500
Received: by mail-oi1-x243.google.com with SMTP id 5so4417994oiy.4
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 04:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xvrzjGN36cRh3bX+Msbr9VgDla31tI4bhi2vHnugGuw=;
 b=H0fRD6gSKDPv2BOx/ac9o9dPrdEsor5fhwOfcDwDrf7AV9jxdf3K8I3kEYegdExbNr
 LnNzv7RMIZ5AKHppzPujmBZlyta89AJivMGajgGokKKZrFIzpDKgYgL8dP/l9MuNyyOf
 Yz765Oj4PU0VRrxEThZmDpCPxjge7EzK5GYcP+PVib0dG27IIb84Pu9ObDJ+CGVdFhgX
 x/Y0F76wl2QsEKgNnasmUTS/7fH+02/gPa6zYlgzGXuh4MJwiLmnAb9VokxqUmELZ5U5
 QVsSuurXmCxxMOvN7RA/ShYD3Jtah+mGdyG5j+GkjSnzYJ6f1mfiST+0aYJ37uzWF09h
 xhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xvrzjGN36cRh3bX+Msbr9VgDla31tI4bhi2vHnugGuw=;
 b=D/mSIYmH/ZMVcqx8A0gkN4KIIqdP5SbXWob/FznzjXxmZlJe232XTmZYoISTZjQlMM
 Of+wSmyQNq3MLRwWwlkmmvZnBO/1uLg6r4UM9gt8h4bTbiEIO5bkYAOeptnuWVLYVhb3
 Ol7gqxb004lRUDWKEHYghkprEvPWjghLJf+dHHdHRJ4mCc+kGjKlVRJicffGSp4N0zAI
 p5bhWXv2geb1aEDBq62T7cTV2b+Wid7URMPoZkEVYIeIQv8rwIuHKqjNsmcVE0NNW7mE
 5QLyGkssD0uZ8GRDEGlaEpRBJ1CKJimLMRyObQ/QEzw7mDAcfofuNcMNaGmmqvwY77Qa
 g7Ew==
X-Gm-Message-State: APjAAAW63nIycAwDh54hX1VvmmCw+A5TH6AAklbqGC7Ipb1M9xihK228
 dzMngLyzTA1suH/8+De+p3ibo05b51nq7NPmXiWAdA==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr10877091oic.48.1583150612880; 
 Mon, 02 Mar 2020 04:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
In-Reply-To: <20200225031414.15649-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 12:03:21 +0000
Message-ID: <CAFEAcA_S9SPLoC9E6naZi9pkfxzz=UTvUss=H4jDff4tgdToAQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] target/arm: Optimize cpu_mmu_index
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: J+bFTzh+Vhkx

On Tue, 25 Feb 2020 at 03:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We now cache the core mmu_idx in env->hflags.  Rather than recompute
> from scratch, extract the field.  All of the uses of cpu_mmu_index
> within target/arm are within helpers where env->hflags is stable.

Do you mean "within helpers, and env->hflags is always stable in
a helper", or "within helpers, and env->hflags is stable for the
particular set of helpers where we use cpu_mmu_index, though it might
not be in other helpers" ?

thanks
-- PMM
