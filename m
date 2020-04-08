Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp58222lfm;
        Wed, 8 Apr 2020 09:27:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypImdYrbdaxNtjj5OyZdfSot1CUvd8Em8Ciz5GhM5Xk3g6BH/UUrg9PyStW3FChlspdPWoKs
X-Received: by 2002:a37:9a54:: with SMTP id c81mr532885qke.185.1586363248477;
        Wed, 08 Apr 2020 09:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586363248; cv=none;
        d=google.com; s=arc-20160816;
        b=cOSoWh9GbFYUU4b2721J1+OojssAyWov6/F5ZHsOYWBPPzrEYbjO1ls6N0iJqHK0ZJ
         cE8159rJyv4xi4W/xV8X8P7tWHobBJ73A/1lxN3JmhDo8PAu5fPfUcrzfKVDhyzSL5y9
         U0SGxYOqg8ai7l87txfCw3lFOBu6auV2ce+blOTRNtwMG7BwbCEseNYaE5CzX7UZVhTO
         nQ6rqZsdq9r6jkUytcZIyd2NUUJN5feRw+k6vqvivdhvsu2TItTbTEh5AUWV9Ovw4Eh8
         9Q3j/7mDEBBBJznEW2tl+a2lLvjxkiQMQmmnZpmcq5b43OT0J2a626h0YIAOccF+YhNl
         AK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bIri/yt0m1uy/qDkJOYMe+nJBkj0pSEqTeyqKjpnWuM=;
        b=LHmHRrLufqmqVyyTVbltX3Pkc82764YkSjjfxSYLZdDdyJoT8B37oiQpqCiBEksZ+2
         4FE2MQx1cZZjX1IYx42zKX2Ik3BeLBvG03ij2I3d8egemGt8dpvLXQ5lu5Us3hI7aoe1
         gVpJNki5s4U916rwu714pSetPook6JS8C8ZgcRupX+YGjYj0lzV/b8iguMeauVaXIAbt
         vKEcYrfI1s25ICOZ64WQB3bebZ5EvzczZeKpg4sBVqXy6vdjw3k4SXjpICT/dZp7AXnn
         mRK37zNekCt/6NCCFic7Gh0aYEStot5ojDNpa2+Pw6q5jipXnQ/rBj+YakU2MrJ/zqkB
         wBQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RcPvNu/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i28si4186373qka.276.2020.04.08.09.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 09:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RcPvNu/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jMDXz-0001SP-Uz
	for alex.bennee@linaro.org; Wed, 08 Apr 2020 12:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jMDXp-0001RT-93
 for qemu-arm@nongnu.org; Wed, 08 Apr 2020 12:27:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jMDXn-0006sm-Jk
 for qemu-arm@nongnu.org; Wed, 08 Apr 2020 12:27:16 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jMDXn-0006s6-7M
 for qemu-arm@nongnu.org; Wed, 08 Apr 2020 12:27:15 -0400
Received: by mail-ot1-x341.google.com with SMTP id g23so7379812otq.4
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2020 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bIri/yt0m1uy/qDkJOYMe+nJBkj0pSEqTeyqKjpnWuM=;
 b=RcPvNu/dNX9o/Hgt8K1NKEG2ameyzoSyA/2vaRVT8X9MIFwqbYKDWdrtW+dcvD/J4E
 MX0CpI9GNgApqW20LRascbKR5ODGphd49CSrya7bMnHfxtKuHbKiaBjwX7Wy4MuvbyBO
 14soc0jr64opWoRKa22MKA4paZ05qDIq6fsRcy1UsexrHCXFKMb+i7xeyo4TAV/b1/R7
 b9qAY9DSyyf6fomyvdljuYSY9qIYmMq+jmYuHZuhIdDoqj9HfF7KpAj4aKQl8xpXnj8a
 gEutw/BeDdNCHr6iL5UH3pOVzjOW38wTAETIczmW8xs+XrysweADHSBe0q6QOK52Qd3v
 L4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bIri/yt0m1uy/qDkJOYMe+nJBkj0pSEqTeyqKjpnWuM=;
 b=FrIT9v6G+LpQbrEC3dc/rs8J/b9iBQ0hMVawHgrgvzgDGsMOhJpGf9erTfS2Hs4zHR
 xuGsN5smB8NaXFeqBT/f+A82p9u/6aJcG9h4W3A/3PgjkmlEA0qH2JT7RWsYwrw2RatZ
 7c7Otzma/mtVF0/h9LCn7VnhLfoZkRxr4vt+JKt3jAFluvHd8+DbBaky+OYqiAfuL4VM
 lMgvYSoKabbIyGbkJj63B0foxE2DpEXzI1+VmwFBYgKS6Tcp5P5WXcgzK6CQsQebT4qD
 9CJPiDaJiWGsgJpkBED8etAVFdnulUZw5OWGV9TAKXkYPQZrbCyoxyjzHTG0vtZSbSZj
 ZbxQ==
X-Gm-Message-State: AGi0Pua8MLjNE2BtFoLm3B7eivaPb2aVbCG+DnjdnOJJGvwcdlg6X+rK
 IqKAcSwml2H9azOTL8iOsk1WHQUEYPv6C17M+D52iWW+xB8=
X-Received: by 2002:a05:6830:11d5:: with SMTP id
 v21mr6415013otq.91.1586363233146; 
 Wed, 08 Apr 2020 09:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200408115953.1158-1-fredrik@strupe.net>
 <20200408115953.1158-2-fredrik@strupe.net>
In-Reply-To: <20200408115953.1158-2-fredrik@strupe.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Apr 2020 17:27:01 +0100
Message-ID: <CAFEAcA_kVi_LWFduY241vB-nZn2rG0_13Y80t3CZVO3=u_pM-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Fail on invalid size for VMUL (float)
To: Fredrik Strupe <fredrik@strupe.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
X-TUID: V23XMZSt0eKk

On Wed, 8 Apr 2020 at 16:29, Fredrik Strupe <fredrik@strupe.net> wrote:
>
> Bit 1 of VMUL (float)'s size field encodes the opcode and must be 0,
> with 1 making it undefined. Thus, make VMUL (float) instructions
> with size=0b10 or size=0b11 (size >= 2) undefined.
>
> (U is 1 for VMUL, while it is 0 for VMLA/VMLS.)
>
> Signed-off-by: Fredrik Strupe <fredrik@strupe.net>
> ---
>  target/arm/translate.c | 5 +++++
>  1 file changed, 5 insertions(+)

Thanks for this patch. I'm actually in the middle of a
refactoring of this code to use decodetree, but I'll make
sure I check that the refactoring fixes this decode bug.

Also undef-checks like this in the old neon decode structure
should be in the switch (op) outside the loop-for-each-element:
compare NEON_3R_FLOAT_CMP; but it's a bit moot with the
refactoring as all that code will be deleted.

thanks
-- PMM
