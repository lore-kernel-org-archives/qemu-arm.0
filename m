Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2946844wrs;
        Sun, 25 Aug 2019 09:20:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYTTTbwhHONBNKXtblUrBwUVddPQii8O9WxQ8X5Kwk+idhCPLNJ2jhbnrltUee4JjHAqnS
X-Received: by 2002:a0c:e907:: with SMTP id a7mr11716631qvo.35.1566750038876;
        Sun, 25 Aug 2019 09:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566750038; cv=none;
        d=google.com; s=arc-20160816;
        b=YvbA8MzypjbeEGZWO1aWcX/IvfFWgbjL/OHl+w1C9E9IYMZ5RGsMtfplydosbUIN3w
         FGfAA+SzWqMbOyoqHKCFl13S4i7rdBbgzJ/sHgCey3M1qzt+4U5Hbh0KW9mX4Xwt9IoN
         ObcVyG3VTdiSRHpUFriYjoBGZQEMhA0JnNg7JVuuEiLxAWShCBMoN2PCTu++k1ncGnw+
         m6KF8hY9pisIZYJXRK/h+6MICFol86TQPd9Jy/o2Gx3QT5rpPl75Y6W8HeSpoccTFPEe
         qiztGNGziIiY8nZ9kOxhlYdM0Kc7uoGT7PFYDsQm6lGtotuZEjqBL435Yul5zHcPCI3B
         SjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bthpOSkptiRcOaVel/B0pY+FzMDQ06IxESBvlkjlF4Q=;
        b=htgkwZiBea5BmYREiZDh/RKRxDgkSMvVNzXotMI64ycvIXpZkCBYMgvzkIHmZQiZL3
         iLPNtLhZ4zGug/TaN0c0SRJDfY5y8EpZgNv+nxdilLDfhYGkW7Ou6CzqpU0HtN3froZd
         Hijthp/LSt7Q52U1PcOYVzkQPAQVs7fL3XxPW0sVxsRQ425agJM1cjGpxB7iwnCxKGpH
         p/eik7XrmVn7E+dBxHOb17J+hPaloML8LBqpBWU48AEkvNyyl1RZOXa0MQxsZ07wGlsM
         IcngT9XMzYT4fpgxn4Zs7HrjnH9I5CzwWoee7teTnTSKzTxRQ995HWgVaorCaF30ac7s
         ZLrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mop84M4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si5781054qkc.144.2019.08.25.09.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 09:20:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mop84M4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1vFu-0007jm-AG
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 12:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vFk-0007iI-TK
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:20:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1vFj-0008AP-GU
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:20:28 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36674)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1vFj-00089s-9h
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 12:20:27 -0400
Received: by mail-oi1-x244.google.com with SMTP id n1so10422354oic.3
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bthpOSkptiRcOaVel/B0pY+FzMDQ06IxESBvlkjlF4Q=;
 b=Mop84M4Ypl18fn2SF6YlKzZfMJv4t6U2n23rVp4zfvpjjssrXhSK0P02TLkSec/KF2
 WcGBaR6zrIW6Fft85P9ng764zyHdnMprpJTYJJZlSPeQNd/zXre+EfSMKYEd7Ryk0iuR
 84CKD3dd/5NnP3n+A0VAQNbDujmKJZ8ktw8iKv69LQQkGbhFFFUz6l9DFVfuJ2SiFL+D
 iaakPNjdtAsLgeb2drqmgtVB43aW/yCt16Zj/hKlYchdz2ApaysidaDgoe+B1x7d9ljV
 Ec0PqLd1ck0m1AFq37Hf2ZbYpoQzfEQoha4G3ArvwVoCvgrIaflFGWi3mIqJbzqnRsl5
 cIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bthpOSkptiRcOaVel/B0pY+FzMDQ06IxESBvlkjlF4Q=;
 b=NzLIelSFGfBDaJIWiv9Wh9d1El09m5X+ZzIay+d+mqfFGtwSu3GHuFCDOx/RDtvr+L
 k1ZtGGVWuGQxDzkJr2njJGfF/PL5vPp7dCITD41A51tnl64jRjZv+Xybcn1sPxJJwSc6
 Tn4JJE4F6R9mDyZJ2Y9EtUg5ah8sgWxnl1cyMjzn3iX/Liif7vG+qTUBWwp6zDD1X+ZB
 8Tx7ZnvaFDSnCtwqcSsI4+HlOIRPfKBiakW6eLIvu0VGdVxsFEwePDK56XCWs8tE3qwL
 8UXvJNTFZbunCI3GVbPuvNlZI/zUVIPI620IMaBG1m+8Hh8ZVE0QPLgAkfrcoySGoJ2U
 /big==
X-Gm-Message-State: APjAAAXj1GFrNIxa3H2BnML2dce6ghzSTxMvNiyQMarQ5yWyzxv7LMh8
 nNGgey2sZY4xiv5xX0jA1dKPTbXfUSWcF5TEBg7jjA==
X-Received: by 2002:a54:4718:: with SMTP id k24mr9348351oik.146.1566750026184; 
 Sun, 25 Aug 2019 09:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-36-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 17:20:15 +0100
Message-ID: <CAFEAcA8JGUdM5v0MCb98Jw+iJNC+ZMD5SDrPVR0dHGgtMOdk6A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v2 35/68] target/arm: Convert CPS (privileged)
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
X-TUID: lJGx02u6WqhS

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c       | 87 +++++++++++++++---------------------
>  target/arm/a32-uncond.decode |  3 ++
>  target/arm/t32.decode        |  3 ++
>  3 files changed, 42 insertions(+), 51 deletions(-)
> diff --git a/target/arm/t32.decode b/target/arm/t32.decode
> index 18c268e712..354ad77fe6 100644
> --- a/target/arm/t32.decode
> +++ b/target/arm/t32.decode
> @@ -44,6 +44,7 @@
>  &bfi             !extern rd rn lsb msb
>  &sat             !extern rd rn satimm imm sh
>  &pkh             !extern rd rn rm imm tb
> +&cps             !extern mode imod M A I F
>
>  # Data-processing (register)
>
> @@ -340,6 +341,8 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
>      SMC          1111 0111 1111 imm:4 1000 0000 0000 0000     &i
>      HVC          1111 0111 1110 ....  1000 .... .... ....     \
>                   &i imm=%imm16_16_0
> +    CPS          1111 0011 1010 1111 1000 0 imod:2 M:1 A:1 I:1 F:1 mode:5 \
> +                 &cps

In T32 the CPS insn overlaps with the hint space (hint insns have
bits [10:8] all-zeroes, whereas all the valid CPS insns have either
M set or one of the imod bits set) -- why doesn't it need to be
in the same insn group as the hints? If we're going to put it
separated in the .decode file from the insns it overlaps with
I guess a comment to that effect would help so it doesn't get
inadvertently reordered with them.

CPS shouldn't exist at all for M-profile, but the legacy decoder
got this wrong too, so we should put that on the todo list for
fixing later (along, maybe, with UNDEFing on some of the
unpredictable combinations of M/imod/etc for A profile?).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
