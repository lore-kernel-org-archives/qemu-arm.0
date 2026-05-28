Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31AFCD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 10:43:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSYCq-0000iE-AZ; Thu, 28 May 2026 06:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSYCo-0000hx-Nc
 for qemu-arm@nongnu.org; Thu, 28 May 2026 06:43:14 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSYCn-0002YY-83
 for qemu-arm@nongnu.org; Thu, 28 May 2026 06:43:14 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-7cb345cb5bfso104845897b3.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 03:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779964992; cv=none;
 d=google.com; s=arc-20240605;
 b=Y2w+pjmi408zi6e0XoaGGXFbzX0A+pf/GYUETuh4z9V5eTliWIIVGLui7ltv3ckeZA
 4L29vlktQsSM+TzV/w5nmXwqTXGLt6zSz6Is0D1uXhTN5rl4Fuv26Q/0kKDtmWBPuRy+
 DMua5Ki/OCDNYYTBDqxdVgkv5oTSSF18xRbmiNOVHDRI/a/TEK7k9KOiKzG+1mTX7pYs
 ZI9JNOk2sKrlOXT5CU+cmDI9oT3CZw06ZuF/bQpz3ZO4EnJJ2xDEwLaJ6hb78EJOT1Ty
 IcFCWPa2ER0TqhfibHxVuYJ1R3+vrI1i2hbjmOJ2DhZe22c14cNsrd+daxYmpggEOwwu
 aR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=R79pWmIrYPLNpX84U9KNTDN750bg7O0id2R334C+kes=;
 fh=ff0e+Ru5ikqG/16gxEhPK/ROGFSfeEsEb+se/mZHNc8=;
 b=j1636kaBrYLwMUiQqlF6rMVZDFL8TiVnQtL/bF/4fBWF3XPaTOkTx5ss7PeQw4lRpV
 zjqY/P2sCDOsZzaGELcPezHCQzvKlUTtIzXRYr3vhQVLzvXIFPNeaRfWDXgea55IO8rS
 hMtyn50jIQeCLTz/gMdFkB1VBIrEki5ubMbt27lRy95CLXX6Qw3S6iOiHINnHBHtc5XW
 9n/t7AfnUlB8FWBg8tWQVefeYEV/YH9IyjecLnni7rs3kcYbYjvwg2AunIzWxiylfCf9
 mq/+EMLALExAxbBQ2zHX2N/pnGmb/4h0DnMDnBQ2V3x2iOX3EBc6HBt4vGIPAVvXeSzb
 o5Rg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779964992; x=1780569792; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R79pWmIrYPLNpX84U9KNTDN750bg7O0id2R334C+kes=;
 b=zBtg519Fp96aF+lW/IaZy/Ico6siz5yvu+FAMQ/mO3SjzUQdfmlzaNOtoZIUwX0w9c
 TMq8ywLwjUzJDbw4o8B0gEhS0fPQQ5kENZexoYThu8VDMRqc8aWzxwpm+ZJB8QoWE+Xl
 mEaZTMwtDdC8luEj0Z2U4cHQj1I2S07nICzBqQC4GEEYsfps3hm7j0dvTGWzMP3OnuV3
 dDxT45GYs+rOW8XDKnaoBbBEA4LAzaxstLHY6NefaPixVYiWNTbSJWdTH3RXgiEGp1rh
 C9H9VCAB7kDonoKc8oZwpmg63P9ipqXHCJdUb48thafBLMHrQQtAPEqBkNp7/qgOZh5Q
 UJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779964992; x=1780569792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R79pWmIrYPLNpX84U9KNTDN750bg7O0id2R334C+kes=;
 b=HrSHIbqtcQigNXMtkLCS6K4ETn87JO4bonQccaGUag2ow44hXB7jBU1DZ6uPmEZoVo
 9eYHrfWRjm1WttUfPPHaaY035LUrlH6K6iQg228ZU4onuijT7Jhi5HikLXX/vW238lX+
 EW0GWhAJB5mtAh7KjI8oTVuHquQaxE2KgB9TqI6n2A2JYvg0jPQ0dlhR3mS3P/C/cfJ6
 Huz60e/POLCpO14kHKcqkz6+kJyaMuXL022jZOGKK38CQN1tGBc/QCtjBac6x7HqnST/
 jI0sXF1tpY4UwViAx5QAK8gFEhqxemZFfwk9MBsE4bGk3rxQ9QD0xN9jmv8fZsV977Tr
 2+Tg==
X-Forwarded-Encrypted: i=1;
 AFNElJ93CKfgexxhBACEV9yjK0EKIwyQ+zSc2YIwO21jsUnaeSG9ZmTxnUJjhKHBD/bJxA9Xf66lJVZ/aQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw1JR33whNXpK8x4t+8FA/FlgoFIdjH1URi0MZR5laMNlc04IjF
 aXdg3EqQmJMvHnrmHJxc/H4xM03zndeNot2rDch/Xxq/shKAPmkfhIOy0x+CM8vdZt5CSFEvWPy
 jRex3Dz2YmcSu0hGKuPlcfp9AQeTi0BvmzSlH2xwRVg==
X-Gm-Gg: Acq92OEMKyOSE6p4RRby1YthCLgaYZCnVflo8X0PQJsd3LHkXy7wYOkQ5sp14pvjirG
 bQ5cJWIe/qx/76rQAAzdhCBg5UDDxsudfQ8rsCHqrxskVafQRgGRB5/0gT8RZHlDOVrkMeM3BT1
 O5vKxY+TTm0PyAHX0WR9ILi3yPQa0z2wxQMZoCK4opsp/hQR1/b4HDNbpGj72Xou7yFz1K/+53K
 IrPNVJmCabkToPD6JAwpQjytjwsR8fqFP6U6l8vZpLd3Guf7BsrlaUtqqjWj483ERNSJAzgMh8V
 Ch/w4Ljb1obBmLgkpKYvu9MSn2zjEeoOpckkhhJ/fuTfBcTCTDkC8+Eg54mvkkOrJNtcVjh2CS3
 GDw==
X-Received: by 2002:a05:690e:4850:b0:651:cf77:f7cd with SMTP id
 956f58d0204a3-65ec963f9ffmr18022336d50.13.1779964991919; Thu, 28 May 2026
 03:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260518-pr-pacbti-v1-0-8932a885b03d@foss.st.com>
 <20260518-pr-pacbti-v1-3-8932a885b03d@foss.st.com>
In-Reply-To: <20260518-pr-pacbti-v1-3-8932a885b03d@foss.st.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 11:43:00 +0100
X-Gm-Features: AVHnY4JrApKQM4DjaDe_jXjzmka--d6osEi_jWFFlp8u8paJv5terBco9pn7m3M
Message-ID: <CAFEAcA-PByvCLEKJGOxi31YCiDqcTRYOG1X1hQWBj8AXNWeTAA@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: implement v8.1-m PAC support
To: =?UTF-8?Q?Torbj=C3=B6rn_SVENSSON?= <torbjorn.svensson@foss.st.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 18 May 2026 at 17:16, Torbj=C3=B6rn SVENSSON
<torbjorn.svensson@foss.st.com> wrote:
>
> The algorithm used for hashing is a simple XOR between the pointer
> and the modifier using the "implementation defined" scheme.
>
> Signed-off-by: Torbj=C3=B6rn SVENSSON <torbjorn.svensson@foss.st.com>
> ---
>  target/arm/cpu-features.h  |  6 +++
>  target/arm/internals.h     |  2 +
>  target/arm/tcg/cpu-v7m.c   |  2 +-
>  target/arm/tcg/m_helper.c  | 17 ++++++++
>  target/arm/tcg/translate.c | 98 ++++++++++++++++++++++++++++++++++++++++=
------
>  5 files changed, 113 insertions(+), 12 deletions(-)
>

>  static bool trans_PAC(DisasContext *s, arg_empty *a)
>  {
> +    arg_rrr arg;
> +
>      if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
>          return false;
>      }
>
> -    /* Handle as if PACBTI is disabled. */
> -    return true;
> +    arg.rd =3D 0xc; /* R12 */
> +    arg.rn =3D 0xe; /* LR */
> +    arg.rm =3D 0xd; /* SP */

Generally it's better to do this kind of thing in the decode
file rather than the trans function, so that this function
get s passed an arg_rrr with the right values filled in
rather than having to synthesize them.

> +    return op_pacg(s, &arg);
>  }

thanks
-- PMM

