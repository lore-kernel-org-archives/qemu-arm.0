Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1816ECD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 09:52:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSXPZ-0005Uj-0X; Thu, 28 May 2026 05:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSXPW-0005Pv-9i
 for qemu-arm@nongnu.org; Thu, 28 May 2026 05:52:18 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSXPU-0004KA-AK
 for qemu-arm@nongnu.org; Thu, 28 May 2026 05:52:18 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-7cd35604a95so121831517b3.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 02:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779961934; cv=none;
 d=google.com; s=arc-20240605;
 b=ET9dG297lLZH2xwGgMtGI3JTmDFjvBYTJBXDjwMEf+2OFT6lpUSKlIcdm77J0M/lCz
 n3rqluHaePRaA1UT/gIZTza6osWuV4+TCPQpJ8RcEMDzTNZgPd8NFlW62iOwr71NaEcE
 GpkTY85iNEfoQlQktlRyZXuTYSF2G+Qz3n66wq+2jyEYzaWVpBtIT9fT3d8HoIgRI3pU
 NZU4+utstoyVJiB9Rqy7obbV0vNM7G2eXtJyqWxQm2hjoFZUh5bIkIDa50nRTMxjoU3M
 uHyJldkIsypHfmOgP/h+00g/ukbyazIdocaR7tWQu6pg4tlnjmfelx/e+X0E6zKtpw9B
 tJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=yVnX1CvyMgiLMXnC6mLBbF00QNioMAzNA307LYuJ1Lo=;
 fh=s+xhdkpxGcasYv5WHTkLIFHyFtBtMZntESBkY2mx2F8=;
 b=JyvWsBMAqUzJS/wCoXL42KbvZM9MY2ljoLipTdTUV/mOdERFGI55LZEWa0Tp85jtcn
 e78Af+06VYvKhEvNcEfjcduUMb9Ao6Y+zLR1xj81u4qS4o9klfLkiW0SarV/jydDuBqX
 CKVOcZobyoHMCtl6Nt34r89fEaUW1ZfOcaRK3HFUpAysixXLjMnFIUNHTqgNM8o1ID6n
 HF5JS0U1wu5aTTpwrFgKWh6rirrJZNwOlwQITGygnGHNMQ82ZTEc+Hr5UfmM9mcJ7HV3
 WlxY+rcBYJ9qTgVYMCG0n9ymh08uBnRy+me/QZ5VwfH8NSElzO558Kl+iOV5S3v7eedF
 +2xw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779961934; x=1780566734; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yVnX1CvyMgiLMXnC6mLBbF00QNioMAzNA307LYuJ1Lo=;
 b=GNIC+Yxkk4oCrgNPIftB8+tPHhO8MUDNDpLV80l4/m7uL0Bq2BYxtVzL2nxq1OxSVs
 JdpNIYUZylFZbbi2OVu7AB6MEzfnViEL2mqy11yvk3IpporiGvRua0ElBU1SpNyJOBK2
 GeH6q5lm58JoNoMwy3ecXrCR5fxXmM67lJbrDIbX07lUr8kujHIPvFwfvtnDoEaBNhB7
 TbQtY7uhyceT7Sqw9AEV0afMk6pJ+m2KvEDhEC5qMRqNrWdlDYbZ2FebXeIKgnPEQc5N
 o0vG9/OG/XMtVzoPFv8K3SxKIaQPd3ZuC0om5qf0OWnMpTyxD3V7GiXIngmGPdIZfoZ/
 Vf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779961934; x=1780566734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVnX1CvyMgiLMXnC6mLBbF00QNioMAzNA307LYuJ1Lo=;
 b=aBWMowyJLLwXPC6jmUIEJz8ouNUzV0EE7kDNZJV/cRYwydL5IBunDwo8KspOgVmxz1
 te6+jRRIHna9htAemI3d+xF7tx/Jw52Lg4uc41+cxc1LvLRXFChwY48iPb14JIryRQVb
 tK2onMekN6bR/4ejyMpcihH8rHcd9Vc/DirLCBGfWHcxayY5AbbFNcf3ehNYVoAQdXf3
 digYwr9hiN8x22Au8ib545eu/ljAibhGliTDyqre0uEh/VFmESxsqRtHT+sPBPX1xVTX
 nk8eqlx3jAL9rNCa5EP1QauPLXKK0ycrAGAQKUQvaRiZ7MAVLPHLvDt8WQRARSpIdqua
 oDrg==
X-Gm-Message-State: AOJu0YwwRkwvHLPDxCR13a+gsOFgGpgcJz1oCwZS2MEKmV2aGpEPW7Wg
 XznXlc7S5A46O0FE9chJhns0ewOaFZVj2Sc4p7qgM7dB3hJjH+2nvGy+aSImNHIVe/c2vO/izqE
 aC6fE16eO/LZTSgckQZvl4AndcYXWQUQyRJPauGh9xQ==
X-Gm-Gg: Acq92OHcagPzYafcNhqEgGOkWpiykj6yy/3HplKIYvYLpROWY2NHEx3g6CqcMvsp7Sf
 hyKRxd9jz3Gf/VD0H6BfBTNvDTPWAA/ZiakzZlk5mFiNrZS7ZEhvNp4Z6p5HbOs9rWjAXRKMbaa
 /XV1EbgIsZEWTEm/Qu1WsT96lEAQraSG1BM7KM7rXb5rPPv3N8axTeQhEklUszQ1cAJqcIy0N6P
 pPiD12eKjjPSXBZX1FFvIr6HKEC6B0A9/FrIu8mjY74evZVe8/jGVbqK9SzmhWgUrjh67RbFEtT
 Th/1Sisdhh0+sCkekQRaf/hgZnUBjxi7eGLbiw3rrufCLWnzDH4IVwOAikMoCPpR69VVB/l3DqT
 4dQ==
X-Received: by 2002:a05:690e:419a:b0:660:329a:38d4 with SMTP id
 956f58d0204a3-66044a12dbbmr402048d50.10.1779961934120; Thu, 28 May 2026
 02:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260519153249.31100-1-wrigjl@proton.me>
 <20260524002617.69593-1-wrigjl@proton.me>
 <20260524002617.69593-3-wrigjl@proton.me>
In-Reply-To: <20260524002617.69593-3-wrigjl@proton.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 10:52:01 +0100
X-Gm-Features: AVHnY4LFyxZW4UjOWOgre3DES04JrDW6CnCoLpc7D0IBED3yVD48t5h5yNymrLE
Message-ID: <CAFEAcA9qc-uLROo7K=fMbRn0mKUrC2GQgi6_SiJhMmUAqPSs-w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/arm: advertise FEAT_RNG_TRAP on cortex-max
To: Jason Wright <wrigjl@proton.me>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 24 May 2026 at 01:26, Jason Wright <wrigjl@proton.me> wrote:
>
> Set ID_AA64PFR1.RNDR_TRAP=1 on the max CPU model so guests and
> firmware detect FEAT_RNG_TRAP, per the Arm Architecture Reference
> Manual for A-profile architecture (DDI 0487).
>
> Signed-off-by: Jason Wright <wrigjl@proton.me>
> ---
>  target/arm/tcg/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 649d854a65..8caa06ecb7 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1291,6 +1291,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
>      t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
>      t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
> +    t = FIELD_DP64(t, ID_AA64PFR1, RNDR_TRAP, 1); /* FEAT_RNG_TRAP */

I think we try to keep these sorted in the order of the fields
in the ID register: RNDR_TRAP comes after SME and before
CSV2_FRAC.

>      SET_IDREG(isar, ID_AA64PFR1, t);
>
>      t = GET_IDREG(isar, ID_AA64MMFR0);

We also need to document that we now support emulation of this
feature, by adding a line to docs/system/arm/emulation.rst:

- FEAT_RNG_TRAP (Trapping support for RNDR/RNDRRS)

thanks
-- PMM

