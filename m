Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3013556njk;
        Tue, 28 Jan 2025 03:03:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOuSFNvgMRwEa7+w2iPDICDDUjIKNBV0FrNSbFCG5DBUJBxhdCqa4e/RfGOl5egzmqovEhqs4D0TPNig==@linaro.org
X-Google-Smtp-Source: AGHT+IFRD6Qo1H3qThX97Alt/UuLizFaCtYUvrXgEqiP3bXpMto4QZWu1XxBRDB1Na5XVaJdELYS
X-Received: by 2002:a05:6102:50a5:b0:4af:f630:7216 with SMTP id ada2fe7eead31-4b690c85e73mr36262040137.16.1738062201301;
        Tue, 28 Jan 2025 03:03:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738062201; cv=none;
        d=google.com; s=arc-20240605;
        b=fqynxsnO1NJxGCEYnneLY1J3bzWhJqonjUj+oqiRMEb1IJXrsdvZyO4ngIXIekL/nK
         piuGQ6PJe+Da+pXJtb8rRJEyqAEzsIrH3VZ/VWYp9B8LxjKPailkC3ipAcKecF4x0hUL
         tfxrV9bK64Gwgyj86gY4+9BgaIo8espQydTdrmSmIcXqXPkg1xbbUcjV97CmnxXFsXQ6
         RJjYuYmV+AMsRPpTxeU3PFfFdXY6mMPiwObmYtwV2UmovrQ4hoqEjvASjapBGnYJAFab
         7Qovv+/JKc+2QM2PAKbRKhgcMhuoNVLVA8td48Zm6YIBYsonpEUjHVE9idDnT1X3dmHs
         Rq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=V2I2NjmN3Mq2+zaxHECDvWFrfzR/EWpUa/NXwTC2lBw=;
        fh=h/NGAyv/hnDdsTRbX/HdYWoZGKUaSSMJ0dd1jEgqOtM=;
        b=kd43yw1UaS/xQ3wGLySbBo1scXoa+G483E2vjqBorKNslV2oeFqjn9slOdsnzNRRda
         ibVGdPqJipDp3WK9UtYGwF23xTRqBkCbHkGdLKdWVjLTVubjIIGdLYJjvI+yMTBuoSz4
         h/J2veAhsn+pERb3eKAdg33WXdjElwr0S5uu4PBvGimOFmko5Hp6hzsTKB8b5o44e4+4
         L6mS1lx3VvjDZCkatLK+iQDHQsdUDcSkeEDIB8ffGsrMeXidW0jYz/pKJTTd5TqChUql
         cwh8rP0wtF9qC9Ztc2FmsPn824pH3JSlay8TlrxA0+hfbCLFhFFEbanAGuRF2fFLmyzq
         RORQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPSdM2G9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b7097586fesi2928213137.64.2025.01.28.03.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 03:03:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPSdM2G9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcjN4-0005X1-Hn; Tue, 28 Jan 2025 06:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcjMk-0005Rf-4Z
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 06:02:46 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcjMi-0008Sm-Jl
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 06:02:45 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e3a0acba5feso7526323276.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2025 03:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738062163; x=1738666963; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V2I2NjmN3Mq2+zaxHECDvWFrfzR/EWpUa/NXwTC2lBw=;
 b=nPSdM2G9VoXayD/3KcTZAs7ngw8V+NjPTRt7ZJ62PMJY/3qj8l0gZH9H6ys2U/COE5
 5LHcsITF2Ogc7SpNRk3aUoTeE6Znu1tVtBgT8JK/d8PUupwJljRifh+e1/cwlEyDMbBM
 8COMjW2qL6QfInlIZ00Fkm0gc86Dk+LaRL4UEgNuWuMneVIBtAeqGjlBkxUO8653tq/Z
 Lj5fKebz5f/cMdJI6yzZu9GqUkhPiKTtpu1wDChP3ujHcXUaDxOkKGdpEJHiXiDzcpmW
 oTOOF9lcnolsMOxtW6Ev1eAua1UpQCN0dzmjw303rLlzEWG9O7AjFgIsNWAbj8OYwX2s
 slxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738062163; x=1738666963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V2I2NjmN3Mq2+zaxHECDvWFrfzR/EWpUa/NXwTC2lBw=;
 b=lJqDUcqw+ZUlcOvquLADV8ZK6ZPOK91M/XECGBgmVYp9bTtHcVmAUaFjuKWfBbTDGS
 nxs1j39UKt/0PWaOq+8ht5DvpExKNmO9qy/en5l7QuuDNZl89E+Xgn/ZXwn3RwTc84jq
 LyHEBcUWrcKjJEkaRg32Xw9oCP6tEetpdvST3//FbuUTx0+3H04qIE5b3IypoEAkVSHD
 H1d3aDoQwUGuYNehIb6QNBehOv+gW44p24kJKDUUIV0GmnualX23Q6aUzAS+/T5Fc5JT
 4+r0roj5kP5PCDPOWUk+LvydpejuONkQfegl+YYoLa7y0IbLYegSOU3Eo/rqYRG9VBGZ
 8HfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYudBq3qgVDazZTYDFk0M3lUMvYMURf+UyaCyRgoAEgbHPgbSp1Y1q1wtk7wQ9TE2QR3gNTRneYg==@nongnu.org
X-Gm-Message-State: AOJu0YxMS6Pzhfxqw2dmAqAlwdKEFD4qwczKpqG7C9dOBMTtqgZUGFmC
 L0fk/Inf8EsfYkOwKCssDzD7+UFS0R0+Q8b9xB6yA2Q9l06WPp3m9CrRp7o5+1Q+afaovnvyovg
 hjosWyxXE5EGoXOZ+Qd1Qedtz1ohoVDGJvbE1KA==
X-Gm-Gg: ASbGnctsDwkmc57h521n+OiL8O7ODzjhdnP9Dr4PTEVsn3TUTYB4bXPmW7eRfUMvDM/
 Ixm2n/bd7tGGp0aopgWS6jOziPM6snvE8ZvBylRdKC8qP8PNXb9A+f3PxH2PXb5FHHY0T6QS4oA
 ==
X-Received: by 2002:a05:6902:72c:b0:e58:32b4:4866 with SMTP id
 3f1490d57ef6-e5832b449dcmr14727103276.25.1738062163125; Tue, 28 Jan 2025
 03:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20250127232604.20386-1-richard.henderson@linaro.org>
 <20250127232604.20386-2-richard.henderson@linaro.org>
In-Reply-To: <20250127232604.20386-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2025 11:02:31 +0000
X-Gm-Features: AWEUYZmFKLyyX3nrLHgttrWoWZvbCOJuRJ0yA24pa5A78USgOfr-8mV372KHqwM
Message-ID: <CAFEAcA9Uy9=rWXNYiWoXhwyhDu+6p162_EKTX3kksBdmmvBwcQ@mail.gmail.com>
Subject: Re: [PATCH 01/22] target/arm: Rename FPST_FPCR_A32 to FPST_A32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9nz1C0dXezE7

On Mon, 27 Jan 2025 at 23:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate.h     |  6 ++--
>  target/arm/tcg/translate-vfp.c | 54 +++++++++++++++++-----------------
>  2 files changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
> index 59e780df2e..6ce2471aa6 100644
> --- a/target/arm/tcg/translate.h
> +++ b/target/arm/tcg/translate.h
> @@ -674,7 +674,7 @@ static inline CPUARMTBFlags arm_tbflags_from_tb(const TranslationBlock *tb)
>   * Enum for argument to fpstatus_ptr().
>   */
>  typedef enum ARMFPStatusFlavour {
> -    FPST_FPCR_A32,
> +    FPST_A32,
>      FPST_FPCR_A64,
>      FPST_FPCR_F16_A32,
>      FPST_FPCR_F16_A64,
> @@ -692,7 +692,7 @@ typedef enum ARMFPStatusFlavour {
>   * been set up to point to the requested field in the CPU state struct.
>   * The options are:
>   *
> - * FPST_FPCR_A32
> + * FPST_A32
>   *   for AArch32 non-FP16 operations controlled by the FPCR

So the reason we had "FPCR" in the names here is, as the
comment notes, because the original distinction was
"operations that use the 'standard FPSCR value'" versus
"operations controlled by the FPCR". But I think with the
profusion of float_status values we've ended up with,
most of which are sort-of-but-not-entirely controlled
by FPCR bits in one way or another, that the "FPCR"
part of the constant name has outlived its usefulness.
So I'm happy with renaming these to be shorter.

thanks
-- PMM
