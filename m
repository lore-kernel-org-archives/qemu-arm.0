Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2610063njc;
        Mon, 18 Nov 2024 06:17:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVexsKNy3xMca7s9PNLzjDcA2515Yj7N6EJbWTLPUfCCT8K4pVZyZUxx8FSs3eZuHMzr5Ha9IgJnJQWKg==@linaro.org
X-Google-Smtp-Source: AGHT+IEHCL3oxM4G3RBJrBetFrBiMzYHp5nwzeT2++7fgmy4pedeikcLpDKJ2kt7BwZZQIA5EZdw
X-Received: by 2002:a05:620a:4544:b0:7b1:55b6:409a with SMTP id af79cd13be357-7b35a5701afmr2549758685a.30.1731939470449;
        Mon, 18 Nov 2024 06:17:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731939470; cv=none;
        d=google.com; s=arc-20240605;
        b=YkQ7U40YfNNv83k443xnOj6hSWDzNlDHCYSwXpd7n90ehL+cx1APSz8ePaxyvgz0vy
         X1PdcxY+0cvqXXfujG5QZCb0UmQBsRK97UZPPt5Yxwp+rMjSkfy71c3AAJ3IQ6mgI23x
         HjtqJQWIRTYNLtishurRz1OM09FoFmiSmKBQfrhW4xq3H+peIppZqo65pEXgtNPAWbwq
         frMi+yg5EJtnJoJL8V3VJjuViRIkh7VIiRBQ9W0xxeV48yXgAaBMbfIqiu4du2l6l+xV
         T0xRid6hIQu2/H6WMtzDT7u/3voxIcnjhR5O0V/csMF/jD0xDP9657L4QLCuk98sAd+X
         l37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aqzGsTgtyA6Ez50IcLDrQTa93sp/XXFy2Ws6Vm2I8M0=;
        fh=adDlGcu0xHQur9DKbGnup3yOLwrFV1y0o7L74W+8hbE=;
        b=dicKlS0EXKXTI3GXEix2ve0c26I5iB4p3pKfkm4ysaD9tmkvgQGcfG94iYcVjgORZF
         nx40UR5NpYVlRcRlPkk53IkRvwcWeRT/t2LP/K1VYX1RkHAB1abhqcUnL6rWqAeLIWnI
         nYOBFQi4lQbsU759L7swXSEXhj5JpM7C4AOd8FyCFlxu7Fe+0hXDlwM2d76s3zupl4xn
         A8bD+6tmfe9dxtL72edmvtXDDTLfsIGaCbPk4YuUx3rNsovFJ8WZIkqJUdcN7rs8y2ks
         RgNEXDA0NHRqrMbwyF+Fbc4u7ah05Fyvv7Ye2S4eDlytA0Qry0yvYLjPkMll41iT3cNf
         G/Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWQzJKTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ad6490aa36si2114931137.622.2024.11.18.06.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 06:17:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWQzJKTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tD2Z7-0000oJ-SN; Mon, 18 Nov 2024 09:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tD2Z6-0000nh-6H
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 09:17:20 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tD2Z3-0002vs-91
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 09:17:19 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5cfc19065ffso1630063a12.3
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2024 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731939435; x=1732544235; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aqzGsTgtyA6Ez50IcLDrQTa93sp/XXFy2Ws6Vm2I8M0=;
 b=VWQzJKTxwO0aivulis3+3GQlu2xxf+L6UisJQxtaQ0cAHgBmHHCtd/jGNmhk2ulaoe
 vaZGXOKHQVCu4FkCxxvtOlkktQTDvimfSAmYg/pzfAvIHuefvy/luOlg/1N/9dMyb3mw
 AZlWHM0jpWYCLZCDeDcBu3apP8snV7JJpuXKmnA/iGpbck9p9Js3YiArq/NG5c+a/JLY
 XGUNmUAqTP30Z4wt50mVfQIY7ydTSN3PxMPWkMHZjuKakv7sqWna4v9AMR0XJmVhmx5b
 nBXjXjZfFEnjzgDhw/nKQ5EMMg3pFPoiPVxdpXdIzGnfusW950Gj5YtUsQKAiUUnt2r/
 8trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731939435; x=1732544235;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aqzGsTgtyA6Ez50IcLDrQTa93sp/XXFy2Ws6Vm2I8M0=;
 b=iHrhRvzPtEm8pjZJH/U6l5nOFlcwECpeekVBwf9DgfDNBY9GX5dUU+B4ZBJALOfl3a
 Ya9qQdNiVRUVFE8qtJtuD1PwB8dnER61QTBQ4AG9yhntOI4owUu/dsQ3Tzrl+l7/ypw5
 Rea6P54e5MwBuUKTKxtKCGl2XgZFY7CPIaiD+cpYPuJ/Jdctybl2d2sgqSN9HgzEojtZ
 swWJPSqub0+58RjyFC6dgkzWmCPZ3ZmpNXcoH5Z5Rzjy5xKX7G8utXWaNWGXjSe8CCq1
 qDPXBLtdg9xSJis+zpyPVm3IxbbL3XsNnX+Ioux62BUlcRtdpblBf+KluQKA1dpaZAo7
 nDBA==
X-Gm-Message-State: AOJu0YzeCD9xI1S1eXzUwdwEeUQPDea1hZDIm1EPRXrNoN/mpz51hrBw
 f0M4PTTqX+bCbAi0aEQxorXJZnyH9x+G5nEATKl24XpWQ/vsW3vEuunB3OPGLGGLiX0AVSwXRxf
 /S7SNF8+1BudywrAGV6QReYfHaEL+4/qRDQFuag==
X-Received: by 2002:a05:6402:90e:b0:5cb:7295:49b with SMTP id
 4fb4d7f45d1cf-5cf8fd26620mr9026304a12.34.1731939435280; Mon, 18 Nov 2024
 06:17:15 -0800 (PST)
MIME-Version: 1.0
References: <20241117134931.37249-1-paskripkin@gmail.com>
 <20241117135010.37410-1-paskripkin@gmail.com>
In-Reply-To: <20241117135010.37410-1-paskripkin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2024 14:17:04 +0000
Message-ID: <CAFEAcA_N+Vs_oxLXtw3Sz85GYg=xeNeDMU9oCu7mHJCYyn1PAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm/ptw: make get_S1prot accept decoded AP
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: srHeb/0Qr36N

On Sun, 17 Nov 2024 at 13:50, Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> AP in armv7 short descriptor mode has 3 bits and also domain, which
> makes it incompatible with other arm schemas.
>
> To make it possible to share get_S1prot between armv8, armv7 long
> format, armv7 short format and armv6 it's easier to make caller
> decode AP.

Yep, I agree that this is the best approach to sharing the
function between short and long desc.

> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  target/arm/ptw.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 9849949508..50eed0f811 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1357,25 +1357,24 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
>   * @env:     CPUARMState
>   * @mmu_idx: MMU index indicating required translation regime
>   * @is_aa64: TRUE if AArch64
> - * @ap:      The 2-bit simple AP (AP[2:1])
> + * @user_rw: Translated AP for user access
> + * @prot_rw: Translated AP for privileged access
>   * @xn:      XN (execute-never) bit
>   * @pxn:     PXN (privileged execute-never) bit
>   * @in_pa:   The original input pa space
>   * @out_pa:  The output pa space, modified by NSTable, NS, and NSE
>   */
>  static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
> -                      int ap, int xn, int pxn,
> +                      int user_rw, int prot_rw, int xn, int pxn,
>                        ARMSecuritySpace in_pa, ARMSecuritySpace out_pa)
>  {
>      ARMCPU *cpu = env_archcpu(env);
>      bool is_user = regime_is_user(env, mmu_idx);
> -    int prot_rw, user_rw;
>      bool have_wxn;
>      int wxn = 0;
>
>      assert(!regime_is_stage2(mmu_idx));
>
> -    user_rw = simple_ap_to_rw_prot_is_user(ap, true);
>      if (is_user) {
>          prot_rw = user_rw;
>      } else {
> @@ -1393,8 +1392,6 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
>                     regime_is_pan(env, mmu_idx) &&
>                     (regime_sctlr(env, mmu_idx) & SCTLR_EPAN) && !xn) {
>              prot_rw = 0;
> -        } else {
> -            prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
>          }
>      }
>
> @@ -2044,6 +2041,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          int nse, ns = extract32(attrs, 5, 1);
>          uint8_t attrindx;
>          uint64_t mair;
> +        int ap_usr = simple_ap_to_rw_prot_is_user(ap, true);
> +        int ap_priv = simple_ap_to_rw_prot_is_user(ap, false);

Doing the calls here is too early, because after this point
there is a FEAT_NV case which may change the value of ap.

Also, could we give the variables the same name as the
get_S1prot() argument names, for consistency? (The return
values from simple_ap_to_rw_prot_is_user() are not ap bit
fields, they're rw indications, so the S1prot argument names
seem more appropriate here anyway.)

>          switch (out_space) {
>          case ARMSS_Root:
> @@ -2114,7 +2113,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>           * Note that we modified ptw->in_space earlier for NSTable, but
>           * result->f.attrs retains a copy of the original security space.
>           */
> -        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, xn, pxn,
> +        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap_usr, ap_priv, xn, pxn,
>                                      result->f.attrs.space, out_space);
>
>          /* Index into MAIR registers for cache attributes */

thanks
-- PMM
