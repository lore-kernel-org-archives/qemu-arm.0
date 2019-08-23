Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp807570wrs;
        Fri, 23 Aug 2019 09:48:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOpi+/3q0ncw8OfUBsVZs6jnbMNAt2B/Tg+0m2NCywTV02+QXer+4l9VM1txI9buWap6tf
X-Received: by 2002:ae9:f441:: with SMTP id z1mr4973140qkl.211.1566578881489;
        Fri, 23 Aug 2019 09:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566578881; cv=none;
        d=google.com; s=arc-20160816;
        b=u14UD1aNnu7v7BJxnB5cwAGy6TBfKASuGlyqaXJuDyjyePwjXOkfrtnHydjLUUoqch
         p8N5zliqJH+2kx+fUIM7cSKd+yohKjomAOe5FUGfp3XIp/9sHYKaBytsxFnhQrEldr3q
         ubv9Bv40T7gqBPhRIBdycDYEg6eoxRa3QWht5+TaIb1MdKFheJy8viyRfoV5PVib0an6
         3yOhQUYowBhDX5hGtrBuDbko9StqDO/YN5gIQ03tZpMtzubCb6dTFxQMiwAV/0OQllrs
         OGAcwAWgLGJXDOJZ4BxHGZ7Kv8tr2EDbF6EifAvbaPRBvYZWd/TvAZXOMSEQciBNlJSu
         JGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IuAe64Q/l5LN9VgHYx6UYknOlef/jaOgSWIEXk7OMOw=;
        b=wPL0ETEko6PJbND6E7SLUDZp1mJmKZcoOA2sslPnkup8v6+hI4Q6kU/wkspk1h97mm
         mhK5Tmdc75j22epvx9g3M19i2g0ZQM1l2oQtKzDIChix9rRoWxMBEAUG6K5qKuKzlrHL
         XlI1A63L5Ud7OgWC2C3V7qPxnOw2kTvk7IvHEp2pnKcYgq8avFr8ENe7bv61a3ihVVYe
         gq+fpbPHQZhFZ527djCrrma93SZsc7XKnI7Pc1NvA9q7y0u0iNduQyhP20O6XceOyhQ9
         S2F3OunRGTwNEWopKh5/6UIKrCpJ7fSW0rmintXF80n/XFpxSpiLMy9wlVotQ+E6n/f8
         dtwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sxG6ZFMM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p134si2163330qke.312.2019.08.23.09.48.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 09:48:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sxG6ZFMM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1CjI-0004VD-4z
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 12:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Ci4-0004RP-Nv
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:46:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Ci3-00012F-Ac
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:46:44 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46436)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1Ci2-000111-Uh
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:46:43 -0400
Received: by mail-ot1-x344.google.com with SMTP id z17so9291209otk.13
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 09:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IuAe64Q/l5LN9VgHYx6UYknOlef/jaOgSWIEXk7OMOw=;
 b=sxG6ZFMMvFdBG6r6mbLV3zB+R1zkav6tnpbXBHZ8ddQEpQWIYxTtAUuyqctMQKsb/l
 HmiW6S65m9cD8UcJioXut1CXUHPnGIvFeC2Vd8K93X0sayABtuIRAYiYeGfukUWkMIaa
 JUpX+8ioRhLX3AT9rRDNSNH/JTZvYsIc7NZ1knKNxqLMv6OGnKreQ4DyiugfJqklxx5S
 y6OfBImb3wt4kW1wfRa6PRZygZ2+Htrb5abTaOJpgPN7tNS21pVE6cgzj0TRiLxNViki
 17tYMc6ZayAX7Yf4oRa933XkSj/o0WG6e8mb6GFn4sAB1e92YDBY7DG/hIPWNJI0lQrH
 A0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IuAe64Q/l5LN9VgHYx6UYknOlef/jaOgSWIEXk7OMOw=;
 b=AhD2WW80rnmiqhYBBavtHQvyTJn5Nbr4rVvaCjTp4vxFIRygW2USS9kYy8hkn5JlOm
 aVqGs+Lx3/MgJ1NUSfJKdZd6UVlL6Iq7XaPy5ceW+78o1WWZFmat942KyD8SD1/QrPq0
 Zmv6INK39AwvyxBOJLsi61Sv8LXlkl4+xZjBE046Ooz2+3WYF2zb+j/ijwSLiol641G6
 LDx9VUnjRDUfggTmR3ULvYz9SyczggvC2jB7HNU7fB2ZLSMBeuX2mIFx3SNudU6Ycnj1
 Cti3uEXrl+lC/CzD9JnBMVjeyBWLElYa+6NpHRukHrBiv08I0mSmBDLqK3gcpgcB7meg
 ie/w==
X-Gm-Message-State: APjAAAUGIk7IXMqIL6RdPP8ZSgLy+GlY67wPnKgOE6pPTJNOZe5nKC+S
 WXK5EWvgBAwFMG6RM3BcvEwCjgKQq74YO1OGWDn0LIGY
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr5165513oti.91.1566578801327; 
 Fri, 23 Aug 2019 09:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-25-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 17:46:28 +0100
Message-ID: <CAFEAcA9gADKuxy41y4THYozTvOEjqpg+wXFjfH2m6HNr0gSC6g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 24/68] target/arm: Convert Packing,
 unpacking, saturation, and reversal
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
X-TUID: QA0w2eRQE2ED

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 541 ++++++++++++++++++-----------------------
>  target/arm/a32.decode  |  32 +++
>  target/arm/t32.decode  |  37 ++-
>  3 files changed, 300 insertions(+), 310 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
