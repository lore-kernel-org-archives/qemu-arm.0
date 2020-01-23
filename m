Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1003269lfp;
        Thu, 23 Jan 2020 10:41:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNmw9IRDTB9zYi0EUkZg4jmAQzCXMZZehX/FZspUR2dZGFkc/J8gKyA9N6O1GPkilwRQK5
X-Received: by 2002:a37:b83:: with SMTP id 125mr14363870qkl.107.1579804899772;
        Thu, 23 Jan 2020 10:41:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579804899; cv=none;
        d=google.com; s=arc-20160816;
        b=0WgOpmABkozsvTKVG24W6+xnwx7wXt9P5hjeT9zdSx5MI17scL0VP1KwrcBqUOV/iq
         JtwxXJshpSkAJRuxE8h2v9e6CfCjfq7vsiCVNJ9YTGQIHEFgAbWQglGicHJL4u1UxIA6
         /4lBLJEMhoP6mOIVUjTsaPp9nqGa9kiFUs3Na/vIfaXIPz74+vCfHfTFiAJkJfu9iprG
         1iwZZ0hiR8QnG0Q2ZYy/8xI0mUXQ16dSUKwXyR3h3mcrcR0beA3XyESvi8iQEo8DTQCW
         +h66gQfRC2ml6GwI6avL6+5oD2QSX4q2gH/aXSTSoVs+ef2MHIWKs7XAf+TW59zM8+pM
         wIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MTG316SXjD3XRVIEALV11CJVcTGvbR40Hq6l/pimWy0=;
        b=upoN6UP8whpxrJ8lAmKawuiNgPX3nUJfOrRfZsek7zJ8yUh8eIXu5UBNHoUxIEMj3R
         34kcWGNmP1nDZS+/OT+y/hKhjHm36g0IELDD5cix30qpUgeO6UVJqsNjOQOu/2zIdcTj
         ENjLSKVJfq8hyXZMF2YkRZyYzxnDbIwV9L1SAsrCXGNeGlQ9cI3Y07bWiw9nfYVLHBLr
         LYmR2yUFxdcnOF2yi4JXFv8xOWhMMNSYfJYM4TtnNShouIJxCAegQJ3Jc1YSvtNq4BhU
         OqfwskUZYL/cyuu4wvOPizXTSfOd3msmOxIwLYOqlpitPxjQpsY0yTHdwDQG0p60LQ21
         mqAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khKZO9LB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si2078621qtm.382.2020.01.23.10.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 10:41:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khKZO9LB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iuhQA-0004Yo-QF
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 13:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iufHA-0000OB-L6
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 11:24:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iufH9-0006v5-D2
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 11:24:12 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36953)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iufH9-0006ug-83
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 11:24:11 -0500
Received: by mail-oi1-x242.google.com with SMTP id z64so3446097oia.4
 for <qemu-arm@nongnu.org>; Thu, 23 Jan 2020 08:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MTG316SXjD3XRVIEALV11CJVcTGvbR40Hq6l/pimWy0=;
 b=khKZO9LB6LdTDy/WqES8LmyJgLTBwchTqpoiqfc/AUUqyeIw57+fGi4schXSlYf636
 +P2+cUb6xPqcj+3dwifcEcegT2Igv7YVQlD6FsVPgSmbb36aHTBSBTwbRUHZ5H0kSiUu
 xGFWYvxD6ggp0PKgvZGiR8f7IJSRRvrRtAgkNFZxKEt7Vg5QgecL/VjfJeCtqpxQSTXK
 0HiyYpl9/fLhj3urdxFmdkTgVUT+BDLYGTTSUhjoyA36oKGRaGvIT2bDog6rko/Z5WGm
 lz5Qzf42+BmTEOxbl5Np1wDJia63nE0m8dykHRXV4g3WItUTMLkzDrwpuhPeUfuBOjNB
 MAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MTG316SXjD3XRVIEALV11CJVcTGvbR40Hq6l/pimWy0=;
 b=hNZhsgXUSG03HnEBwKmLfvD41kPJ2+ym4413yPHjooTIURjXVeFwu5Wobq39SdYHL1
 FnRi++qqwdzAzHTMTCGLMk0ab7sFQg2y8+RV9xEKLhloBU4K7PnQnlvbRCZkcZ6xiJuP
 G9ETOIKBvbeU5w/PZj04x2cXDsin6DWMDIcMNLMUwgWi1axVKSgFM3CCXlIdiVhKXNlL
 YrZMt6Jh3r1BrBAfk3Maf5Gf9/euV2UXdhj0f8N3Eu0Mov9ROPfINafJEbkoqqOoJ0eC
 hAyOpib8/nNAqWIi+7RHxRt460UJe5UFPmz3XK7wFDCRPUtMAIJRF0bYDl1pSngHMWE6
 KLvg==
X-Gm-Message-State: APjAAAXzrB5Vnbhr8itLUiG7HxQHgn6qIZj47ATOKZ1yU282I6jfXWb1
 hI85js3S+OC58yR1Qi5sibNnnVKYys7KBtI1Mc0nOg==
X-Received: by 2002:aca:570d:: with SMTP id l13mr10851072oib.146.1579796650373; 
 Thu, 23 Jan 2020 08:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20200123052540.6132-1-linux@roeck-us.net>
 <20200123052540.6132-2-linux@roeck-us.net>
 <CAFEAcA-SPUPEcV4Uw9=8-5EJmLztVorV++ypFp=vYxasncBrZw@mail.gmail.com>
In-Reply-To: <CAFEAcA-SPUPEcV4Uw9=8-5EJmLztVorV++ypFp=vYxasncBrZw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2020 16:23:59 +0000
Message-ID: <CAFEAcA9p7Foko17jTB_GSGLnaQwpJTcf0-qTrJkVWje1jOpq-g@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dma/pl330: Convert to support tracing
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nTKZkO/LUb6V

On Thu, 23 Jan 2020 at 15:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 23 Jan 2020 at 05:25, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Replace debug logging code with tracing.
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> This turns out not to compile on OSX, which is a bit
> stricter about format strings:
>
> These two:
>
> > +pl330_dmald(uint32_t chan, uint32_t addr, uint32_t size, uint32_t num, uint32_t ch) "channel:%"PRId8" address:0x%08"PRIx32" size:0x%"PRIx32" num:%"PRId32"%c"
>
> > +pl330_dmast(uint32_t chn, uint32_t addr, uint32_t sz, uint32_t num, uint32_t c) "channel:%"PRId8" address:0x%08"PRIx32" size:0x%"PRIx32" num:%"PRId32" %c"
>
> both provoke
>  error: format specifies type 'char' but the argument has type
> 'uint32_t' (aka 'unsigned int') [-Werror,-Wformat]
>
> because of the last argument.
>
> Easy fix would seem to be to change 'uint32_t ch' to 'char ch'
> (the argument is always a literal constant 'Y' or 'N').

The 'chan'/'chn' argument is wrong too -- should be uint8_t
to match the format string and the type of PL330Chan::tag.
I'll just fix up the pullreq rather than forcing a respin.

-- PMM
