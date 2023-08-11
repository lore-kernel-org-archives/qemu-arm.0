Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1272954ejc;
        Fri, 11 Aug 2023 03:46:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbL4orLzK3GTVVroanWHFLhHMOyaiHIvfybfuTyOr4f+cmrvH+75USDvPfYcAijlmtIkRk
X-Received: by 2002:a0c:b205:0:b0:63d:77d:be74 with SMTP id x5-20020a0cb205000000b0063d077dbe74mr1275152qvd.59.1691750772012;
        Fri, 11 Aug 2023 03:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691750771; cv=none;
        d=google.com; s=arc-20160816;
        b=J94Pozb35jO5wpC0j9uzqSveoTKy3Sw2MZ/MVqdXineIcYTxdjVKs6Acem6a4WvTVx
         ctjOQYsPSVAeY6B7wtxIXbMKcvT9kuFFD0ifN5rRhGbvNWzaSWf+ArOWHVehdAtCfiR0
         LEMjLl0Qsx2dJOcLIGyyJEcPOM2VO6Aj414Jon5658z0RI/KriT9veSnZjj5V90y500h
         LJV5u71PuqsFzm/J2lcaIdNXhsYqSpcXk+d9A78Gx7fY0RMcUaEkPOCDLyre+Vic0kst
         1aX8WEWXzpB0IW/bMhlIcvIZG60vVcT5lXeYgUADtCM4nrheYb+wVMsADHQb/sSZxA7Y
         Z7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=N2FvBgkiIdUsjB/FxaUZBa1ZB141qaGSBWUTFySHBvs=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=oR0ZNBB/FtMQI1ahSRREvbZZK0zN2l4bTFJxaMY5o5t0eF38W1Aq38ShAbWHH0ulAn
         GLF8tUboD3Y+DxvcIe2A7EWQn5UXEGLHV2iX6Q/3dcE+h8IcY+eeuv8d+L+OPsaFvBV3
         tqtF4lWwecJlcPMmfbM/gtKi9RTdFO307tWC8vOn5nIJqR/eTNQwC8iduWRbmliIe+ZU
         Rl0qyUaz4pJGBKs0mZoj/IvAvMiTVHN3scdhlHITVwmH+9rS2PUmn/+egPPh0Bz3OhX4
         LdrjumFDq1MzqJzHTwgCi6kqAE+0A5umgZQ+XY2MeKypo8WHvsTlfIPWZdjLb/KPxxxi
         J/Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=blBPD6HD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020a0ce40c000000b006418a6cd14fsi1332243qvl.245.2023.08.11.03.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 03:46:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=blBPD6HD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUPeV-0001J0-KA; Fri, 11 Aug 2023 06:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPeO-0001Gu-3T
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:45:50 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPeM-0002bf-F4
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:45:47 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52327d63d7cso2322130a12.1
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691750732; x=1692355532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N2FvBgkiIdUsjB/FxaUZBa1ZB141qaGSBWUTFySHBvs=;
 b=blBPD6HD8/SYnvzrcjkchCddZQJyt0JDrSYgcCnx9gotMlBW5gmYWVLDWqOWZOWYFY
 4hG73rLMNShtzjl3af52L6v9ZVYsYoJSrZ40w+t/UnkXWMnG7QgJQfivV1eIS5RS9SjH
 4ybPMGh86PXphuatyJYmYTstWQMq/AA3NJnZeVG44zaVD69N0uhcZLZEN+1M1kZ8WHb2
 CJojja2Y5hhcFzEt+3FKykoeFC5uyibJ/IY7m4KnrdwOjOed4gfSBblXNL7xOFJkoPpu
 7YPiVeNih+VhGg0W3zb/w3gIor9ZeBhwvEa5B/8jHB0ChQ8lGyI4X29hBaNSk/3Np6Mg
 TvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691750732; x=1692355532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N2FvBgkiIdUsjB/FxaUZBa1ZB141qaGSBWUTFySHBvs=;
 b=TGe2zxtqimUld24nGdyD5+uJcAaGZlAOmxjdD8e6SpmjqukiV6hfmO3JW4iX4yYz8D
 MUMA0MGy1JBwQzfDURiE633BZxDvuCiD3TRI/19c1u3Xx2Jocgj8NYGrw5giAUNIOmm+
 hd1cUZVa9QJjvPPboN8RYLEYyIJW1/tetAygfAeymfZ/FO9PfnAJ/hdKankeYGRYyhDV
 7OF6eZDol/A59tgChvi4BYyeW1mMJXnAtqYz/s035xKQMFmdSz7qyw8W98LnH51Xbyxu
 A2y+PTNK45b5n7zD8Zhh+dCgh9JyBHJHfPyR43SRxEWIqJnB6apI/YMmyjQSsxFIIpuW
 haWA==
X-Gm-Message-State: AOJu0YxJafH9hqIE55VKS+1g8TbI5EWhW9oWYRVu2a3z+xDFdp5a9hYz
 AJeEn+3Aatak1W9GtVO1o8sNnt4MOjkrMSqHhUceFxcckrzYOV7e
X-Received: by 2002:aa7:c557:0:b0:522:cef7:83c3 with SMTP id
 s23-20020aa7c557000000b00522cef783c3mr1291540edr.8.1691750732278; Fri, 11 Aug
 2023 03:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-21-richard.henderson@linaro.org>
 <CAFEAcA-N-QWQXcHgMNnXTr+Bmf7fhdSKYQwS-kkWGdR+UHvT-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-N-QWQXcHgMNnXTr+Bmf7fhdSKYQwS-kkWGdR+UHvT-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 11:45:21 +0100
Message-ID: <CAFEAcA9xsPHOeorJvjfO7mrpX_TfYHMNcMHi3dyt41+CktyXsg@mail.gmail.com>
Subject: Re: [PATCH 20/24] tcg/i386: Add cf parameter to tcg_out_cmp
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x0UoG+38/48N

On Fri, 11 Aug 2023 at 11:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 8 Aug 2023 at 04:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Add the parameter to avoid TEST and pass along to tgen_arithi.
> > All current users pass false.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  tcg/i386/tcg-target.c.inc | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> > index b88fc14afd..56549ff2a0 100644
> > --- a/tcg/i386/tcg-target.c.inc
> > +++ b/tcg/i386/tcg-target.c.inc
> > @@ -1418,15 +1418,15 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
> >      }
> >  }
> >
> > -static void tcg_out_cmp(TCGContext *s, TCGArg arg1, TCGArg arg2,
> > -                        int const_arg2, int rexw)
> > +static void tcg_out_cmp(TCGContext *s, int rexw, TCGArg arg1, TCGArg arg2,
> > +                        int const_arg2, bool cf)
> >  {
> >      if (const_arg2) {
> > -        if (arg2 == 0) {
> > +        if (arg2 == 0 && !cf) {
> >              /* test r, r */
> >              tcg_out_modrm(s, OPC_TESTL + rexw, arg1, arg1);
> >          } else {
> > -            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, 0);
> > +            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, cf);
> >          }
> >      } else {
> >          tgen_arithr(s, ARITH_CMP + rexw, arg1, arg2);
>
> I don't really understand the motivation here.
> Why are some uses of this function fine with using the TEST
> insn, but some must avoid it? What does 'cf' stand for?
> A comment would help here if there isn't a clearer argument
> name available...

Looking at the following patch suggests perhaps:

/**
 * tcg_out_cmp: Emit a compare, setting the X, Y, Z flags accordingly.
 * @need_cf : true if the comparison must also set CF
 */

(fill in which XYZ flags you can rely on even if need_cf is false)

?

-- PMM
