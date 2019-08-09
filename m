Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9367995wrv;
        Fri, 9 Aug 2019 08:52:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoTymxVY7DqjrQDQjwcg9v0aEsnAZGhdwLEI6yI7/AzDqct6r0iK8JmHlYeSesVv+nCEjQ
X-Received: by 2002:a17:907:2114:: with SMTP id qn20mr19157758ejb.138.1565365949350;
        Fri, 09 Aug 2019 08:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565365949; cv=none;
        d=google.com; s=arc-20160816;
        b=HwJpfIWKR7PG8zIn0Pw1QGHRW0uBzAQimvxHfeCqcqsIBkAIB+ClMlH3wLolzM2Vi1
         ceoDC7UbPJSNQCB6UDAasTHwhNs/sM+zT0HjbKpwskKtBWxTZ/WC7mx/KjWioUMT7Nsf
         ZO1xtAk47OFATojiFfXtT87GGchioJUZeieX/BkPRMOwNO/P3liPP5wSU/usYfnZ/Xf/
         MbNu3g/yxiOKAkbPiAsU7z6qQM1B/8AEQe06nFBGiczLnGiyw0x30VllNXbUA4ngvUNV
         kX2CKTWATk/iyuyjfEI4WDKzh94NnrIQPs+wyxis7t4tVPu+ky9ByhTcuZWdiLbR8ak7
         AqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z/M3Z95ldVTYoS2h4aUFqxhH4IZo7mkV0bnMYYG8lnY=;
        b=QL9rci7aLFDXuAOhAVoQUa1GQo7/TryZ+VZI4lps3qOzF0oydDuhnCJMl0rF9fFHja
         l5rQMb1onzYvnzyDxn64d4FGcz+ph1gl3rCgjc9jvjGBPeDlNG0xZuikCN0/ZfbgM+oI
         NDh6nrNXcCbxSm/UaLEXKTZzDaChpxGYP2ObqXpjsPUJyN4/3qZltbuEfz6r8NP+Ql8t
         z9Sd1EZSw9f/GYiNbTPCLsf6lYL5NfnycP+EgyChdVijo3celBKeFdPCjfwe6Wew5jyZ
         7bBBbbutFAy8ea+WsxXTRBNrnH0zwTc3VGaxaGGS8vhP4iKwOKp5fmkxHLzeW+dxV4Gc
         MFcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m0uVEGHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w27si40896513edw.366.2019.08.09.08.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 08:52:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m0uVEGHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw7Bs-0004OM-Fp
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 11:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52602)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hw7Bm-0004Lf-49
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:52:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hw7Bk-0006kK-Vo
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:52:22 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45731)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hw7Bk-0006jW-PW
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:52:20 -0400
Received: by mail-ot1-x343.google.com with SMTP id m97so945644otm.12
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2019 08:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z/M3Z95ldVTYoS2h4aUFqxhH4IZo7mkV0bnMYYG8lnY=;
 b=m0uVEGHVZNSQrrj6Qp8oBm8eUbyWcDMldorCdJPFHGtWDmzO2N8NRkWIHEt7ZnobCq
 rfVwzZlN+Uy6hbfgs3oneYlMNghASSs9JfWbssRlW0et8xuYCq29/mwShDwIFbYNUIQI
 8epP9lqgxMDJ5xu8XaCPBryVy2YEB3e/mOub8vWVVAQPUFohPgabKl1b6NsrRc0eKsIi
 P/YahcGrN5bhAfVcrgaOEj28emQ9Qy5GjSs5AkIfd+onOXoSPhey+tB2DYKHOCC7vG6g
 DZz+bjEHZoND0I7cR75kxxoYAsI0UXp+h8xleReDZZR0tMIOGJD//JDMJBqQNJKnV2Or
 ttuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z/M3Z95ldVTYoS2h4aUFqxhH4IZo7mkV0bnMYYG8lnY=;
 b=mSbJ8FvdFI8p5zceZgmHd2zc3+z+FVEYYG4eGzGn7nkpYYyMx3Eeb88kIJALcNw3MV
 B8kY8yFOVJGuj891QPMbIrsZcpDA3Z5Fndduvczzivx2mNzqcfDxWQ1rgNkNzzGUeyS6
 gqVZFpZWd0GxUa/NtqF7vRkECyPhiE97/SRQ7yYfx8aNLwDH/YgcX4Kzn5b+Ka4pQBTM
 MzxbyaNXJC6kEOclGZP9QRrPjH9CyUC/v5rO5TW9bo6ZiD8nqhD4IFxkFHktuag0aQ1V
 0FAbPBPdzVhkmU5/9lE4to3CXbE42wpawtBoJa/m7ATsMYcJWm/1DE10kX/TqY9xCsuL
 FW3A==
X-Gm-Message-State: APjAAAWllh3MdyUjOHkkJQJDRL87HffQSTIjdrlgJAdEyK3yjX4zhBTg
 rp8u7rh49VFzZkMWxbOuNfEVctPDHwyUgMha9jomCw==
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr19047916otn.135.1565365938986; 
 Fri, 09 Aug 2019 08:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190809154153.31763-1-richard.henderson@linaro.org>
 <20190809154153.31763-2-richard.henderson@linaro.org>
In-Reply-To: <20190809154153.31763-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Aug 2019 16:52:08 +0100
Message-ID: <CAFEAcA_4jCdh94MUbmA9wAxQ7UajC_8TxEeD0tLpZRfn7jMiiw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 1/3] decodetree: Allow !function with no
 input bits
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +XFNSg3C30dh

On Fri, 9 Aug 2019 at 16:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Call this form a "parameter", returning a value extracted
> from the DisasContext.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/devel/decodetree.rst         |  8 ++++-
>  scripts/decodetree.py             | 54 ++++++++++++++++++++++++-------
>  tests/decode/err_field6.decode    |  5 +++
>  tests/decode/succ_function.decode |  6 ++++
>  4 files changed, 60 insertions(+), 13 deletions(-)
>  create mode 100644 tests/decode/err_field6.decode
>  create mode 100644 tests/decode/succ_function.decode
>
> diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
> index 44ac621ea8..ce7f52308f 100644
> --- a/docs/devel/decodetree.rst
> +++ b/docs/devel/decodetree.rst
> @@ -23,7 +23,7 @@ Fields
>
>  Syntax::
>
> -  field_def     := '%' identifier ( unnamed_field )+ ( !function=identifier )?
> +  field_def     := '%' identifier ( unnamed_field )* ( !function=identifier )?
>    unnamed_field := number ':' ( 's' ) number
>
>  For *unnamed_field*, the first number is the least-significant bit position
> @@ -34,6 +34,12 @@ present, they are concatenated.  In this way one can define disjoint fields.
>  If ``!function`` is specified, the concatenated result is passed through the
>  named function, taking and returning an integral value.
>
> +One may use ``!function`` with zero ``unnamed_fields``.  This case is called
> +a *parameter*, and the named function is only passed the ``DisasContext``
> +and returns an integral value extracted from there.
> +
> +A field with no ``unnamed_fields`` and no ``!function`` is in error.
> +
>  FIXME: the fields of the structure into which this result will be stored
>  is restricted to ``int``.  Which means that we cannot expand 64-bit items.
>
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index d7a59d63ac..a2490aeb74 100755
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -195,7 +195,10 @@ class MultiField:
>      """Class representing a compound instruction field"""
>      def __init__(self, subs, mask):
>          self.subs = subs
> -        self.sign = subs[0].sign
> +        if len(subs):
> +            self.sign = subs[0].sign
> +        else:
> +            self.sign = 0
>          self.mask = mask
>
>      def __str__(self):

Is this change to MultiField left over from the previous
implementation ? I was expecting a zero-length MultiField
to now be a bug in this python script (ie we should never
try to create one).

> @@ -245,7 +248,7 @@ class ConstField:
>
>
>  class FunctionField:
> -    """Class representing a field passed through an expander"""
> +    """Class representing a field passed through a function"""
>      def __init__(self, func, base):
>          self.mask = base.mask
>          self.sign = base.sign
> @@ -266,6 +269,27 @@ class FunctionField:
>  # end FunctionField
>
>
> +class ParameterField:
> +    """Class representing a psuedo-field read from a function"""

"pseudo"

> +    def __init__(self, func):
> +        self.mask = 0
> +        self.sign = 0
> +        self.func = func
> +
> +    def __str__(self):
> +        return self.func
> +
> +    def str_extract(self):
> +        return self.func + '(ctx)'
> +
> +    def __eq__(self, other):
> +        return self.func == other.func
> +
> +    def __ne__(self, other):
> +        return not self.__eq__(other)
> +# end FunctionField
>

thanks
-- PMM
