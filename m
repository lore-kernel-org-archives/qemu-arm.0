Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp961973wrs;
        Thu, 22 Aug 2019 09:02:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWamInxxxl1EKYfD6WD8mzs2zXQiRTovF2p02kwGXITEP+kE6Rp60vgMnjhJtgckindWLH
X-Received: by 2002:adf:e452:: with SMTP id t18mr9005500wrm.0.1566489724031;
        Thu, 22 Aug 2019 09:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566489724; cv=none;
        d=google.com; s=arc-20160816;
        b=RtU8oGpLOK1YhFu48YpMCoZPesgS3DfcsKt4i3DJfygx2C1WMgyW64XCeBa56OEdQ6
         Zf9tWckt7a+2x+OT0/0oSFulZvdWDRT1GZgiL7O8DCf4sq6cg0BhuLWOznfxrnoi8K5O
         taFOH2L+5Gc+0wN1LsTFdPN7HSeXGzmPijl4VnMSvBdfTmzltazOVl6jAhz6UkAgPgfQ
         Ui8V6yiFR+yNeOqbfqfoDXFzHYBaDY6rKj432DdrQZk42LGRYudwNyO5tk5oaYnFTScx
         cBhPu/rd3kWY+gY/wyLLquWyL83i9/wgye70S7VB9CcFFnICGDEK+52hf6T8prApqfYT
         VM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7B3CvyEYOu+pNQ8AYNCbT+h5aS1c7aM+mXvf9WiQoR8=;
        b=bO+okHEsCrsF+p/KvD9pJBq0Rbs7/+3O9swW+ld9bbGxTPcDzyKNAxE/oPvyDLojCF
         TGo8s18rwhxAUCfk9ITa3JRXTkLQSdk8JzIbcudseKDEDjWjM5xiGpBRpWWMOo0bkMY2
         6DaulP1vFUvAtFzG3hxi1LFMEj0waQBNilSs6A3TvPXFlDeapDFiuwVin1Z+ZUUqWKcN
         8edYmsFOa7CMxrCnoGIOg34MpUBmr93PU8wnt+OWoBe19Oq6YClge/B6TD2eK3Z9EmHi
         BiSRCenCSrvpy2Hjf2/pgtpysGer1Qilrx4je+YtBtXgUFssLKO1rJcviA2vd3TUZ727
         NC5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wVnYSTU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si53126edb.341.2019.08.22.09.02.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 09:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wVnYSTU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0pXG-0001AK-6U
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 12:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i0pVt-0000d4-Gz
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 12:00:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i0pVq-0008CZ-87
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 12:00:35 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42427)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i0pVp-0008BN-Ed
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 12:00:34 -0400
Received: by mail-ot1-x341.google.com with SMTP id j7so5909163ota.9
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2019 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7B3CvyEYOu+pNQ8AYNCbT+h5aS1c7aM+mXvf9WiQoR8=;
 b=wVnYSTU+VhYQHl9PmxnSBtDOTPBiHcxzCix/rjiLflA5oYCtlJ5wIEPoO3XJU1muby
 NBNDoJwTFWMflaIceXXKoM/94akMYlmKHIBDSKz8skV5Igk0Yug4JHzggcJTzwaHkoxf
 1DBZNJfct9VVe9nlwFwZ/EV/spEyEZqbzxEG3xpgeltsbf5ljy0O1PRe0XKJYAZhlY1B
 RLBb3h1vaxi6E0H8CyVBCv7WP7RgFMs68HsNy/f9cLiACOqUexfaIt2+uqJY7xm3loKN
 FDw1JPsnE/ICffSIWdmBnj3s+jjW0TuCNOmCajdDo6xXibUgFKn3HpxaBlXffYA44WFG
 YkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7B3CvyEYOu+pNQ8AYNCbT+h5aS1c7aM+mXvf9WiQoR8=;
 b=eropcxZJKXm2OGnLjh3sdLIOLXOqRT/7h8MwO/odSKvw1CNwRWnWiv/gLjwiKmzUVy
 GrD025jGPdQeRN80aBVmwdFCQwo9Gqe45FMQxkPx2ACGuCKKbZYAc0IwHvBCJz2m60ya
 8rGTNBJb+cppDrKAZpInAuPvb5NFLte9weZblVk1PebBzGfPEO6Z5NZjYH0YiCXYE9v7
 pSS7BCVyg32l4rG1O949/P9biwMGsuwKuGnzOgrT1ltd0BSel0gihD3RKRP4Pbzl37mS
 gPtx6BT0xW8RHcE+JwEaiCQtq4Jl7z0Y7B0KYYBRG7E8Ol4Hkr6jJzw0fRyjJq5I4reZ
 VUgw==
X-Gm-Message-State: APjAAAXNmvkX9eujf0KDYOjUdl3MHdRQ/ySEF+JLmgNkysQ/s4FP0gnp
 9PIgXcTKa87+FCPSIvFoehdKYvfySVjO5pTMrY5tlQ==
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr208768otq.221.1566489630622; 
 Thu, 22 Aug 2019 09:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-4-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Aug 2019 17:00:19 +0100
Message-ID: <CAFEAcA9abuRJXTXkEE+2M4tHQuKc+VwsqfJqEmw-w_+Fcwh0rw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v2 03/68] target/arm: Convert Data Processing
 (register)
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
X-TUID: gn3Ve/eoPkt3

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Convert the register shifted by immediate form of the data
> processing insns.  For A32, we cannot yet remove any code
> because the legacy decoder intertwines the reg-shifted-reg
> and immediate forms.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 229 ++++++++++++++++++++++++++++++++++-------
>  target/arm/a32.decode  |  28 +++++
>  target/arm/t32.decode  |  43 ++++++++
>  3 files changed, 264 insertions(+), 36 deletions(-)


> +#define DO_ANY3(NAME, OP, L, K)                                         \
> +    static bool trans_##NAME##_rrri(DisasContext *s, arg_s_rrr_shi *a)  \
> +    { StoreRegKind k = (K); return op_s_rrr_shi(s, a, OP, L, k); }

It's a bit non-obvious that we can return early via the expression K
here (for the "trying to do an old-style exception return in usermode"
case for SUB and MOV), but it does put the check early where we need it.

> +DO_ANY3(SUB, a->s ? gen_sub_CC : tcg_gen_sub_i32, false,
> +        ({
> +            StoreRegKind ret = STREG_NORMAL;
> +            if (a->rd == 15 && a->s) {
> +                /*
> +                 * See ALUExceptionReturn:
> +                 * In User mode, UNPREDICTABLE; we choose UNDEF.
> +                 * In Hyp mode, UNDEFINED.
> +                 */
> +                if (IS_USER(s) || s->current_el == 2) {
> +                    return false;
> +                }
> +                /* There is no writeback of nzcv to PSTATE.  */
> +                a->s = 0;
> +                ret = STREG_EXC_RET;
> +            } else if (a->rd == 13 && a->rn == 13) {
> +                ret = STREG_SP_CHECK;
> +            }
> +            ret;
> +        }))

It turns out that the decode for Thumb means that we don't
need to specifically check that this is Arm mode before allowing
the ALUExceptionReturn handling.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
