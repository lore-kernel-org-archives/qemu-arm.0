Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3584506ejb;
        Tue, 6 Jun 2023 08:56:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6L1jPS4FQsPioWiBKRJ37xOxJkzkO03NUS8bAQh4j/FpMaMhQ7z+zRDfbIBWIXWlXW94Ps
X-Received: by 2002:a05:620a:3e84:b0:75d:51e6:dda5 with SMTP id tv4-20020a05620a3e8400b0075d51e6dda5mr27076qkn.63.1686066979497;
        Tue, 06 Jun 2023 08:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686066979; cv=none;
        d=google.com; s=arc-20160816;
        b=YRGalayl6lGmcIihQuMjoOVsZ827arMd1fwfuW0XoC9Jlzg3ZecI/38dexKhXbo/Xv
         o+Q8WIx9ny0F1JpfrqKmM5tjI1IVO9ibKQX4/U07Q4umP84Du0W41uIxmm1NIjesokZx
         E3qHvyMpChjh4rmCB0p0M0m9oxtt7lMMC31z/a/JnnMhkOefNbY/BCTnekQ/olh7mai5
         jlrbnDU+XMODyGzBB4MpiiEMyOIXdXEIloSOF66UOfBp9l+OKkKPtJqYXk0w0AQp1nJQ
         JMfCax50xBmkxjRA+kXBT98s1lfLEhLNJlh5BWpww/WbrDYT9MWfF5mH7imDWVkbJDHj
         owtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wnVLBSJrJkvKjIoaRlPQx57i/kQrByoAelFL0S3N/cY=;
        b=D/0/M9g5A7W+xTrsVq/mYKb6fQGKMFHzd81w8JaGC1PB+YzYFL9W2rONIpqjJbw+/C
         f5yG3MoGU5FzZPhq2g78+aNUcqrIqAI7+8LTbzzBNFGUjw1UQZzHXfytXYlD+kBTHbY2
         0lV8AEVeJPVih5mnhY8x5bjz8AQh9+pizsvSTk12FIRwpHKEbb/yvDBZ7+2LoWSCWrne
         5G4GU8TdyW4Mydn0JC3qSsKNpWtkU1oUjMESAQUpMSVjVJHDXoctGjNWA9zFCbPDsy/y
         gsll7NX95KucILFUqSHTXY/rUeqlbAqAeFuOQ+w+1sW31vOFlGT/rOqoLY6oMxA1WtFd
         +xQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k30HaP4J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020ae9ec08000000b0075b34b557cbsi5836857qkg.525.2023.06.06.08.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 08:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k30HaP4J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Z2N-0001uk-Ts; Tue, 06 Jun 2023 11:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6Z2M-0001u2-H6
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 11:55:58 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6Z2J-0004Ge-8q
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 11:55:58 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5147e40bbbbso8914183a12.3
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686066953; x=1688658953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnVLBSJrJkvKjIoaRlPQx57i/kQrByoAelFL0S3N/cY=;
 b=k30HaP4JXPvU/eRC1ECNiaPxM1Bm+1LcHRVwTB/IFrUhkJdo17OaN/81hid26PuGd0
 JczfFnWeXsqdIpgh+jULOs6ZsHoL0CXciGM82L3f+9FfNCAQw6a/5UYzvup72VSGW7ER
 s9rDwNCcZK7LEO1MznYiK3V9IzvuGreX6pXRuhWbZ7AEQiew3Tf6mWfshVFBP88eGmUY
 XzNBVrwHK155n7e5OQgbMAo8x4MPxtWdvFE+ZUZMFfBxOTNmVZcyrOntXJvNKTRnRejU
 CzoCJtRSOfTMWPXasgT8K585rtIFaeqzqCxWTRLS82JwS7W4qdizUDHBkrZRrvp1nYVV
 IEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686066953; x=1688658953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnVLBSJrJkvKjIoaRlPQx57i/kQrByoAelFL0S3N/cY=;
 b=jwNZ19IprVg6fkwR82sHhjOgV8PNMdb6E7d4shjcTY8NBpXNHcM9d3C0dTSz3Sxn+8
 AJXFJfDCrwXoFhGcV36CQc/iH1llKoFZAJYTaLpWniinp31WFAh1t20YZIpBvxf3EPBW
 +0rq84jFoavesL74KTH1K96rZZ147PwRrjC69kmK/slK4wXRZsZUGoJshnjmrGEFY8yL
 Z7hmX0cBW+gVVpn16hOs8bmlYXYkM/IGPM8ONkMenaIdZBavm7qUrUi5Yw3bmZmSxhEJ
 ittsl8N2Hgwa2Tx/hETNWJX/yjeAK1S2REEmGMKwau8k6vY0bl39BlUo2MFQpWxZVaTX
 7/1g==
X-Gm-Message-State: AC+VfDyInb8C03khOgJhShv94wr6VEpFPYSe+vGJEhNI4cC5Lg5TuEMd
 8VUogcloH0kbqCz1cWXDogbl5utUgS6C6d+3TB+Dqg==
X-Received: by 2002:aa7:dcd7:0:b0:50d:b16d:d21 with SMTP id
 w23-20020aa7dcd7000000b0050db16d0d21mr2089415edu.3.1686066953660; Tue, 06 Jun
 2023 08:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-3-philmd@linaro.org>
 <9ff0f082-1b04-8bf2-6a97-1e9220aa4509@linaro.org>
 <f991008b-015b-dcce-fe00-838a6ddefde5@linaro.org>
In-Reply-To: <f991008b-015b-dcce-fe00-838a6ddefde5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jun 2023 16:55:42 +0100
Message-ID: <CAFEAcA-Cy=fG0PZs2_O0cUrFHw65Tw3EzDEWPAKFg3ffs0a_FQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] target/arm: Rename helper template headers as '.h.inc'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: vCDIcgETYUOK

On Tue, 6 Jun 2023 at 16:50, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 6/6/23 16:37, Richard Henderson wrote:
> > On 6/6/23 07:12, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Since commit 139c1837db ("meson: rename included C source files
> >> to .c.inc"), QEMU standard procedure for included C files is to
> >> use *.c.inc.
> >>
> >> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> >> about includes") this is documented as the Coding Style:
> >>
> >>    If you do use template header files they should be named with
> >>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
> >>    being included for expansion.
> >>
> >> Therefore rename the included templates as '.h.inc'.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >
> > FYI, after yesterday's tcg pr, we can do more than this.  These
> > fragments no longer have to be all included into one common helper.h.
> > Each translate-foo.c can include only the helper-foo.h.inc bits that
> > they need, and the bits need not be visible to the rest of the front en=
d.
>
> Don't we need foo fully converted to decodetree first? Otherwise
> generic translate code can call foo helpers, so needs their prototype
> declaration.
>
> For example in translate-a64.c handle_msr_i(SVCR) calls
> gen_helper_set_svcr() which is declared in helper-sme.h.

That's unrelated to decodetree -- the decodetree conversion for
that instruction still has code in translate-a64.c which
calls gen_helper_set_svcr(), it's just in a different function.

https://patchew.org/QEMU/20230602155223.2040685-1-peter.maydell@linaro.org/=
20230602155223.2040685-6-peter.maydell@linaro.org/

thanks
-- PMM
