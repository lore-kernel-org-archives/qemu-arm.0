Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CABC54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 14:56:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojDq-0007NA-W0; Tue, 28 Jul 2026 10:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojDo-0007MS-Io
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:55:56 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojDi-0003o0-MO
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:55:52 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-6688dfaed31so5179215d50.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 07:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785250549; cv=none;
 d=google.com; s=arc-20260327;
 b=HAPwbYp8Rqb3fJ45e96Om6apGznU5Q6UHsRKlPcZQ9dgzVI04duswVRoiaSH88ynV9
 1BAG4eY3rqiqZCplLTjr+9L+1KQYSNBx+QjNxgJpRwy8/3jadiGbCY51pDt8+YNz6OOp
 J8gJfPETy2lFV5dtAGwWaLG1estCjAxDSuMLhRSPJxeOLNYTyUB8x1BV49YuX0ZRgLSU
 Om2a4G2oZWBIylON6UwZAIhAJrr15JzUPexs5TzOfrijmuch/yyGkPz1sJmU5kyUTpz7
 b0aqEjHvcPj4arBfw4e+U4cOnYrHcUHLgtayynz9anhHd8Y2qNnOiydb6umRw7cVQsIj
 gLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=GJQ1TGNrc26Y6TRupENn91JffWnGjrQT1m5IFKf5YG8=;
 fh=6TXRtjlf7L9OAMAA6gsjuKTOorxMF4PZLQp6jvujxtI=;
 b=V/CfS7qkzGjOjc+9RErosX0TbJL42a+IYWDJuUHDdofDQ/kL4351dQ7srZmYPSXQK1
 c8TGk6Zojp6O88LFOzyUPYdtDe/6uBj0yLQY+rw/V6x5u3ppMzM3HGSIU1TXfAE5E/Q9
 QOW0NLKXBOlrUq7WC2xEdecAM5dDUbgj8MyQLZK4lhmsh4KuTusPkCWSZU3s9a2mQvj6
 SCCizrBItA08qTQ0JYtcJL3cQPvpYTXDV8Ups+XMIjVTFjozmFSl/8F9YyiYVBRRyM6h
 amXQF2LSRF0XbIvk5qNJRccAi9RpA5FU2Gksf0TF+AfGSeJlCMnZ1lubKnsB1LdVvanX
 E51w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785250549; x=1785855349; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GJQ1TGNrc26Y6TRupENn91JffWnGjrQT1m5IFKf5YG8=;
 b=Kxwb7j1Mb5bHKkXhx4Mrzy7lkrCUj0yFaH5W77DUobmlGnQsPtADDqTvnHUyLtvTPO
 gEwZeplRaS9d7oem1SBQxscwQ2oXUVQ+fAO19+mUJEdypV74ZWcaNGz9feVG4uugE/7z
 0FhVirA34z+4O7hT3krInnJ3QnV9EYa9tJRePGOFIPWl66wYkidciSg4kRsZ2ezlG5Wp
 dI/KQhSs82V/s2LsJ5dEYpjSI48WDML29n8T4+YhhFcDN7iswKHdodvaeseHNYAClw2a
 wNhqhmfcUmSuh5iZKMmZnDwr/tOWbfuCFGwrxDERNMb+tVxSEmI1as4E74d6O2+eUQnu
 Nscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785250549; x=1785855349;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GJQ1TGNrc26Y6TRupENn91JffWnGjrQT1m5IFKf5YG8=;
 b=hwSTYatxsVZ6+KuOOEriB4ToXzTiBjhb1vGx+xVbmapzP/WprejUYxi4aOWs8LXY4h
 sNR2xtBNSbBtIUO4yAODZLv7Jjzcz1ZeKm4CVdpsv9GBp1xcNnAkVZt/67+rPmaY5wAz
 6UTs1s1q7qki7EV82hYJXBXsAzB1JCEp80LybgxdYkTbQUFIKJjpppdWMr/vtwN/o8GO
 HtSt52nujsfqcE4kO9kzpcMg3PyZ8pvFs6hI2pcL19wpBGCK8Av2j3X+9xpYdimZrCUf
 4Ak3kqqjtnOFLWmpQ2w1hucSNo5Z9QNFQOAdgwpu119v018Dac2N/W7MAD3jBwVYeNUp
 17SQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro/lMqI63C36+hfpV8m+6iUh4UneBpFuMXP8QOyrrLWkB9ryQQZ/2+mxr9pMURSmDFtAILhLm7XSQ==@nongnu.org
X-Gm-Message-State: AOJu0YyJhvH/DO1F7nCoIDlgGp9OLRNMUPZ45sPOJ6wdWxc0nkANdQeq
 /lkuquBwuJmPiZwrCnj8jvQhpToZ4dixnGOE/OYNddM2FHMKzAF5zfNx/Pi8DG4xtgIsjOcfC4j
 X66g1hXY3VgQexKF4n0oh97G1NR3USWBnEPt5BEYaew==
X-Gm-Gg: AR+sD13+Q/3cbMTYCc8cQ6PdUmYMdu+esqZabHyA44Rgo6wPuPlOZsdTToITm6Trc5b
 AQAuh1gIPy0/wEwV0aXkHJr3RUHLhdMOWhq9mp02J3g5FgTsnvlYpK8bRez/7sFgcq3D1RPzZEI
 RrgTYyIzjBOrZO0hvvhyBv0xDA+RNFgVjYIfac0vuLMCicvr1P1hDYmgCAznMFpnsdN5Is76oe6
 cSs8vierMKZg2EhapD4pt2gMTAJJizzRxGoToAGF2Xtz/O+q+b8zFsaD49seD6m3lAHNYywpRDo
 9MpZO/AJVHhOCl53lD6gapqYB0Z+uBVN7VBkx2/Uku2NBg==
X-Received: by 2002:a05:690e:4005:b0:667:91ba:9bdc with SMTP id
 956f58d0204a3-6690545d1b7mr1186972d50.11.1785250548823; Tue, 28 Jul 2026
 07:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-2-richard.henderson@linaro.org>
 <CAFEAcA9DCByPPCL6fSnuMYmpBALNJaktyEB8ywAU2BU39GnaNA@mail.gmail.com>
 <151be7b4-3a86-44c6-83c3-31c01dd47654@linaro.org>
In-Reply-To: <151be7b4-3a86-44c6-83c3-31c01dd47654@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 15:55:37 +0100
X-Gm-Features: AUfX_mwhNThjJW91I13_jOgsShRbYMaOORCAwpS01-NW_WNv4LmH-7a9e-2-Dp8
Message-ID: <CAFEAcA-NonwGRDc7CpQyz9HwOn-1ZVyqDra3wg7ODRvfavUotA@mail.gmail.com>
Subject: Re: [PATCH 01/10] target/arm: Implement FTMOPA (non-widening, FP32)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Tue, 28 Jul 2026 at 15:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/28/26 06:10, Peter Maydell wrote:
> > On Tue, 14 Jul 2026 at 00:04, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >
> >
> >> +static void sme_tmop(void *vza, void *vzn, void *vzm, uint64_t *zk,
> >> +                     void *fn_opaque, uint32_t desc, MemOp esz,
> >> +                     void (*fn)(void *, void *, void *, void *))
> >> +{
> >> +    intptr_t oprsz = simd_maxsz(desc);
> >> +    intptr_t index = simd_data(desc);
> >> +    intptr_t esize = 1 << esz;
> >> +    intptr_t host_adj = HOST_BIG_ENDIAN ? 8 - esize : 0;
> >> +    /* Base in bits for op3[index*:csize], csize = (VL * 2) / esize. */
> >> +    intptr_t ctrl_base = index * oprsz * 2;
> >> +    /* Create a zero for use with the largest esz. */
> >> +    uint32_t zero = 0;
> >> +
> >> +    for (intptr_t row = 0; row < oprsz; row += esize) {
> >> +        void *vza_row = vza + tile_vslice_offset(row);
> >> +
> >> +        for (intptr_t col = 0; col < oprsz; col += esize) {
> >> +            void *e2 = vzm + (col ^ host_adj);
> >> +            void *e3 = vza_row + (col ^ host_adj);
> >
> > Having just read patch 4, is it possible to do this with the H
> > macros rather than a manual host_adj, as we do in
> > sme_tmop_2way_sh() there ?
>
> Not without making copies of the function specializing on esz.  Of course, it turns out
> after the fact that only two esz are used, so perhaps it's not that bad.  But the element
> selection logic was confusing enough to suggest just one function.

Ah, yes, we have a variable esz here.

Since this was my only query on this series, I've added it to my
list to apply once 11.1 is out.

thanks
-- PMM

