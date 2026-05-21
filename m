Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC44CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:23:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3MX-00043u-1p; Thu, 21 May 2026 09:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3MW-00043d-00
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:22:56 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3MU-0002Dn-86
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:22:55 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7bf0b1a47b1so60834287b3.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779369773; cv=none;
 d=google.com; s=arc-20240605;
 b=k4bn6yVhi14KXBfRQTCaCX1/GqZYmM6hvbxUMM6KorLGnbN+7dYhWJ6WCUHOrhzbCI
 k0z9p6rVsAQ8wpHF0TC9skjWBK+cfCoCAI3Y8QOJZOSap+H9ih8JVfCC5p/NrBc+E3KW
 dTx3CtWD5/t30gWXlCI485zJMK/QK0Nly1z1Vi/bwOgnu+KF0V/e1+HA+ZoU8hRyD6db
 B6xFwDFoi72b3fSyFX/ouUuFcLfjqjybFdACTMtxCrYZPhsfyvbJd0godCh1PPfuWuxq
 pW7+F6SEMUsQOTKaEHspb/nUJX9o6KXz2wlSoOjMEgGErA6ylJ8nJvXY0uA0cgStf5MG
 gGHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=M0NmGdmCuabLXz4JcTf7/j2hDfPUmh7EdopHdn0sNmY=;
 fh=LL8KmW4ydZnYeXShqVzHnQ5p71mWBWBlGU3ZgkD60zQ=;
 b=H/MyjfULb79ongWysMh4qB5I2WoP0AZhtT6npliF1Vro5IWN9P/sgHk0Bn6AmWta/w
 vymLWG9Dg/Cfh+Fre0Ceh36ujMu/fviQqyu2LPiUyM+r61eHJIyz7NJItS2ucivHLDCR
 U1AFI74vT01Zi6H0T32FkCRKVrTgf4nk+VkofShCkhvLhlPvnZhFy7zQ0KLr4o91WS6V
 hkJ2jaeJvdQasjIqq7BAvJmf83fBPG6KOoMxvy+9z2aHZIOYMpTu8hkEbA/Xnau53IyG
 82BQvIRxszxTMBiAz1HKwPkKKdQ79Ls/81oBZWsbVWA2oOJf/pgyozQrdSy4SO22BrlW
 lROA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369773; x=1779974573; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M0NmGdmCuabLXz4JcTf7/j2hDfPUmh7EdopHdn0sNmY=;
 b=Cm3T6TOskADmYWQRiiidclMGY393rhoVqgPmIk4DC5FJfpTBf2PFhe2Mu3bAXjEXnD
 ynVjmVNqmOhiX3tEaK93ZIqw91D1IeIIvMmfEotTtjrml6lHVIFMGtdRVOT+rTf7rygl
 L9JTDjBOZe5s1BtK4bvRzva0UasIG5ldvz4BcWsrCduA+erunbdkkdSrXgJS8tgJmqQs
 O8+JcftDQA+QgPZo15klUhPyFekxtN5bGzQo47vXopiHBg5J+OgkhBuF6w4UIHm+JC4B
 YF14b89d6IipV2ZaerJhRrB4PJ8D3Q7OFOhGE0S/GuAb1Y2J+qG/OyOddYGW39NLyllu
 qbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369773; x=1779974573;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0NmGdmCuabLXz4JcTf7/j2hDfPUmh7EdopHdn0sNmY=;
 b=V+G5aDHZ9ApOk+CTamT9c3LmfoDf2GNzAHQOqMYIuhbGJm903HwkHu6GicrLXKZaac
 ef3CGVAkH/r+iIA8MJGlTqGbozG4ojAKB0iAcq81130viKkQQYVUSlN3oMeOa/A2c9le
 CI+i3pjFEnNhrfcazaTGRN4r9kVewsqzVH6wrul1aMCGSoPU0khqm6SDEBp6VHbCCVep
 z4NZ2pePgmUDt7hhMMTFPno4jV598b6XX9IAGqinLMLumFFtgZn+sxB7Ih8qqifTEyRI
 IP8Sv1APcKePrmCCQEBp2bJf2Vb3VLFUie7hI+ncFb9v9yvaizoOfVGNmsOy4phJBdf6
 Ew6w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+x3fCFvQdL5LeMouHWKDil2hZTkyhmdTbM8lJ1s8rYphjEvOy3WTO3ud2i5KT/qVeuuiRPXH/QcA==@nongnu.org
X-Gm-Message-State: AOJu0Yz6C2XPNDPY08R+QigPKILzKpBNYhPfF5etqM142jMs+XtoUFmb
 N2+pjuvZWSQ1fiPUaonIzJHplhCtGEGO/D67H+ZVGJhPX/m56UY4lEIlig94EO40MHyvOHPD3D7
 HDFRRkTQ2+2y7nOcWezXXFpXhCrP2VbsMTHXT4W8VZA==
X-Gm-Gg: Acq92OH7rfTddrUAfJwvd4Od2aOo/52WJsTE8b4QkKz+qqET9jojd4TZRy+LXWQbxZz
 e07hUn4HYs2kKhL9IzpRD1gHOeJL0v+02GQ29BMUKkNueWgdBZP+m2m0v6zr3oJljiNxuUukvjS
 RD/+U004mE80SZrgcIVHvVNcG6i75gvSc4OovSUqUVrdQ3DLH0PBj4eBgItwDD+6Lyr6lU9dfjV
 tpM5DKhBaZhEaiLaY/3cwqej9MgH5ZRYq6C5CdrpHHL8vTxIdJHae6ysFI9Dt+4mr9sqDZXFFJ/
 Rxaho6bjI824XGKthSr8um0Iqb2VQhFNE0PyiAopfcxnlIutE0/AHFi1qtwoYseX6hg=
X-Received: by 2002:a05:690e:bca:b0:65c:6220:5fcf with SMTP id
 956f58d0204a3-65eae3caf3bmr2370087d50.62.1779369772768; Thu, 21 May 2026
 06:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260520171820.848839-1-richard.henderson@linaro.org>
 <20260520171820.848839-30-richard.henderson@linaro.org>
 <CAFEAcA9tXNossXoMC=LSa7Aw0CZzsmtkppKqEGqcdSgy-X_GOw@mail.gmail.com>
 <CAFEAcA9X-2+_LgGaT3Jf3tC7p3RSH0qRQ0CK_3BhySzS_cxqWg@mail.gmail.com>
 <498188db-167b-479f-abec-1e7967f0b967@linaro.org>
In-Reply-To: <498188db-167b-479f-abec-1e7967f0b967@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 14:22:41 +0100
X-Gm-Features: AVHnY4LLIGe_lxxBlkXeoMrU9u45OAVfXdroan_MjIh313jkxPh6E9kp9V2M8L8
Message-ID: <CAFEAcA_nSN92zazbZ6LT43P=9PNwy=Qtix0n=bJgBxWnidqmzA@mail.gmail.com>
Subject: Re: [PATCH v5 29/30] fpu: Fix NaN encoding for E4M3 in parts64_uncanon
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Wed, 20 May 2026 at 19:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/20/26 11:21, Peter Maydell wrote:
> >>> +                break;
> >>> +            }
> >>> +            g_assert_not_reached();
> >
> > ...ah, I misread it. I think it would be clearer to
> > have the float_expmax_normal case be "g_assert_not_reached()"
> > rather than "break, and rely on the thing immediately next
> > after the switch to be g_assert_not_reached()", because
> > it more obviously says "this case can't occur".
>
> Mm.  I wrote the switch to let -Wall diagnose a missing enumerator, rather than
>
>      case float_expmax_normal:
>      default:
>          g_assert_not_reached();

Since this is the last unreviewed patch in this series,
you can have my

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

