Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8ADCD5BAA
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:22:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlYb-0006Vd-1e; Wed, 20 May 2026 14:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPlYW-0006OM-Fa
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:08 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPlYR-0000OH-2G
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:07 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-65c24be9e4bso5525150d50.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779301319; cv=none;
 d=google.com; s=arc-20240605;
 b=A31C7mUtJK+FACWaUhbKf4LG9A6pn63CScZFomjCmpYFeG6fGyMaMMQFoiPdz/C0Wt
 Rl9/kCYkEokO3z0ugp5eKOdYHqxb8IrDTKvHLSCMLK2B7TPEeCwY9cKDUbFzMcPK2VZl
 F3kUuRPuxl/d818pTh2pVezMllAa1ucUIfothbT6w46g4oYyMhQDDhmaqMIjrDzJ6l3h
 ssrqo8xNq2nS5Ip6NrPXcTqEoD6CIPztVOxum0LfNS0vVO9eNhaYAsly0frlkctKOxW6
 /OwSGGMvc2I/uSrY2Cu3N9L/g9mcVcjjHB3UPq1gpb/E7DRUGht8nITxgeiQvPgyuDRS
 v+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OFXPmkXtgd29xqoCC9GVo5rZeGQcUrbDM9GBnhd4uVs=;
 fh=P1hanWlwF4OdjAmsJiMAbGLSSN7doKwaKNmpcNML7lw=;
 b=CE9RXHfK+qdeYCmDJFk1XlyabnR5Pb9x8xvpwu0Z5oLUUICeUS2U+SR2tYYXZrvj7H
 TYcsqaQSRU8yALW2cpJrIjwRdxmV9XLGgTisV2aMK42Ng3dUPukBGJYoTF90pfXiPq4z
 MnQttbWNCSNOlWd9Rb+zYRpMAZW31XZJLY0Q1XNKPrEis6tHVctZ3Gza1ZMnH/wjiQfy
 rpT05nDLp7p/jcjLELl0UQhodeWVlPfZrRhSwO1WFb7HYr8jU9DRTrSgRiIiZjmzLDQV
 xHALgZ55gjZyx8z4IlkMHiQKlLc2ffabWN6j1/kLjeR9qnbotip7dovgfIzPszcwn61R
 WJVw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301319; x=1779906119; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OFXPmkXtgd29xqoCC9GVo5rZeGQcUrbDM9GBnhd4uVs=;
 b=Uo3CVMlu1ppejn7Hvs/oRRUomHzRIyhxpySJWGdlOuX1xJogBU2gCjoRcstopljYI3
 YL8uEc/0t3mhNiIMc361IZqSXGvPnykMusWRmOVsTj8RPrXxdZRUyRrn/KLC656z6DWS
 uVwuQNQuPLfDpjhgRWT14PggBcoa9dl1fzU2Oe0N7W5Mg2gpUtHODRYIfEuPU+4p2A93
 haL43oHpV8nfmw4bAzAyPfn1HSa7G0IvNlrrC/g9fh4m0PScLQCE2I1knrlT23/posFo
 NgV/2RKxlcBri8Wn0kjs/iPXWpUKgyDyLTXiJC9l7oI12BvPP6TcK0Onze1I1+0r0xjh
 HXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301319; x=1779906119;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFXPmkXtgd29xqoCC9GVo5rZeGQcUrbDM9GBnhd4uVs=;
 b=kt48ooLomUEVbltDzv1PB7ItPPkAWinwg05FWJo7Z1y1YGxfkMpXYKeLj9kgIcomUD
 lEi252l4OosxIYmJUUOwGuafGOCBv1cfzEz+Cl0vhAqgDzknIXtT4sq9a728Pqxrqxef
 pjHOx1lTIfdbNEoiFbdr/OdNy/+GbfeE/wG4hq+w1UVJvrSY4DFjbAP8t1Wky71Vgw+L
 T+Tw5Krw55bmmXbErruwSpuhLllb7jGo5VnKY0bolefsaLzC0hmw5QRBKF8an72MOHyN
 6pvrUQR/76m9Rn0MssJ62WGtam7DXvwL5xPD512lED6KhAhOzuesZl8LprVIxj+2eLRP
 8UlQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+yNelpu/eciEapbE6VmoB6UgzI16K/YKKuxKfWryU2b8JaGu5FJmzVp8Yyk2swAjJl7kTJl9JyxQ==@nongnu.org
X-Gm-Message-State: AOJu0YywvJ2RRS1XAyLd19bpKMszMpy/e+l0GiUIEnK1aKDaMXzSUy91
 eKwQTxlevYqJe5ctaSd14X2izwvOeO0KJHI9elaCkiehI3yUUeIyprJNpSDvd1c9s18rYgUD/Yb
 TdqgEEY6/8VaRdvtsQ/xohsKG86lkBW/kYNo6rwrzqw==
X-Gm-Gg: Acq92OHqd0sH/RJhoN0kCGR3XvMA8xvHoRSCfZrR/zSMUlv0epIMKL//5BOGPnnGMjQ
 5QW6T4wyYTU1j3he5DJ9F5CGUGnw4pYYHsXJ5CrHUuhGIAnorCBgeHtPKcSWMFgFtW7AMkewIRZ
 GwWHwV72pWD2aRVCuOPCUutoHagamJLyDSSHpyMm6A387aMyoG5Y8iupeurbMuwit1WPN3IO7K5
 Jn80hB/RRb+TpQm/xFbit0Ld/rMyAxmGLITZrZihKbiemq9g2vRUtrimbPeusu/e+HWB0MfZm3X
 kzwK+RAcVMEM4ZL+VLCAd3Nl5WOfMliqe5AhukwyvOfD6wmTShSW8pWWQztHHuJny+IUsNhugE1
 bQkrKXhdO+4z0
X-Received: by 2002:a05:690e:151b:b0:65d:4429:b6b3 with SMTP id
 956f58d0204a3-65e227d4852mr22817051d50.30.1779301314295; Wed, 20 May 2026
 11:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260520171820.848839-1-richard.henderson@linaro.org>
 <20260520171820.848839-30-richard.henderson@linaro.org>
 <CAFEAcA9tXNossXoMC=LSa7Aw0CZzsmtkppKqEGqcdSgy-X_GOw@mail.gmail.com>
In-Reply-To: <CAFEAcA9tXNossXoMC=LSa7Aw0CZzsmtkppKqEGqcdSgy-X_GOw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 May 2026 19:21:43 +0100
X-Gm-Features: AVHnY4IlzUXEspB9u5uBQk9j99NK9VcV36cR9UnuBGVXhxXalr32yGXDT_Dl1sw
Message-ID: <CAFEAcA9X-2+_LgGaT3Jf3tC7p3RSH0qRQ0CK_3BhySzS_cxqWg@mail.gmail.com>
Subject: Re: [PATCH v5 29/30] fpu: Fix NaN encoding for E4M3 in parts64_uncanon
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 20 May 2026 at 19:20, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 20 May 2026 at 18:18, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > There is only one NaN fractional encoding for E4M3.  Retain the
> > incoming sign, but force the outgoing fraction to the unique value.
> >
> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> > @@ -507,10 +512,24 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
> >              return;
> >          case float_class_qnan:
> >          case float_class_snan:
> > -            assert(fmt->exp_max_kind != float_expmax_normal);
> >              p->exp = fmt->exp_max;
> > -            fracN(shr)(p, fmt->frac_shift);
> > -            return;
> > +            switch (fmt->exp_max_kind) {
> > +            case float_expmax_e4m3:
> > +                /*
> > +                 * There is only one NaN encoding for E4M3, and with a
> > +                 * conversion from another format, the input NaN fraction
> > +                 * may not apply.
> > +                 */
> > +                assert(N == 64);
> > +                p->frac_hi = E4M3_NAN_FRAC;
> > +                /* fall through */
> > +            case float_expmax_ieee:
> > +                fracN(shr)(p, fmt->frac_shift);
> > +                return;
> > +            case float_expmax_normal:
>
> We used to assert() that exp_max_kind wasn't "expmax_normal",
> but now we don't. What does it mean to have a FloatPartsN that
> says it's a NaN when the format says there isn't a NaN
> representation ? Either way, the "break" here means we
> won't treat it like we do NaNs and we won't treat it
> like we do normals either...
>
> > +                break;
> > +            }
> > +            g_assert_not_reached();

...ah, I misread it. I think it would be clearer to
have the float_expmax_normal case be "g_assert_not_reached()"
rather than "break, and rely on the thing immediately next
after the switch to be g_assert_not_reached()", because
it more obviously says "this case can't occur".

-- PMM

