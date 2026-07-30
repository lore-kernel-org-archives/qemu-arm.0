Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8AFC55160
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 12:48:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpQBH-0005GP-51; Thu, 30 Jul 2026 08:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpQAu-0005Es-HY
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:47:54 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpQAp-0006Q1-Ns
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:47:46 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-81dfdbd86d1so22296437b3.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 05:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785415662; cv=none;
 d=google.com; s=arc-20260327;
 b=b0A4TBQm4/+HIc+eQ+5kKN5KAMYjri5CIGaeWQsdsa2lRTNoX8fdWTO4Q0PEt4xxVl
 4FZOEOVv8+IL+2wJdMZ5Lp6UFPIqs2T+g8c9L3Z4Ia7OpoYYENvgyUIfIa4aqY0vk8Ri
 6+K0ZumCManf9kTp/m+iVRn2uqCkzMUWU4dO0ybvDTRc9V00sK49pB1jDkNNXq5DOHK0
 5W+mQUGhSvSQBOdc1rxpXpK7RF5AULFzqv4HIwafa0RjuJ53g59u0W7S7cvXPHIt0ik0
 FY0gtp10CKk1wreqDn5llueBqroxwx7R3UjU8yFpLublvHlsNM4TjQx80ZuzfS0IpQuj
 82jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bxFdje7jjR+zvKahWORqDVEHGclh6x66ydhbsiz7wmg=;
 fh=MY+RTGlDZBw1hjx9sCas5mVeVTtr+VfM/WJHDpsZ79Q=;
 b=SKWOcfeYCS0Dh1UL+3XTbBMICKXp+LcHhOGA72TaXf8pm75fiW/ZZXnqv/tSLzK6sc
 /KKTsxZUQBiYy1pxN3aYVXT79Cn4BEP5fwnyjmiqX7doMn0DeWbyVaxqUYOOgVNsk8zF
 J3L6KlX3pGboH2wvhuiEItdeA3xgZkiuf5pC9tWW+M4BNTqsOcZ/vFFlj7ZheCjHzx8/
 ud73MGrnKHOZvDxhmILvfrO0Jgjc1YUbtjYaD8Ji5hu56tYvJkGz/GEqgjeQrN/U2V+w
 cisjUOEYRVirrDjz5JDJ84H0MHsx2Ju65dngiR0q+QfTFognlb00UP4tDRUYepmdCOE7
 /Aow==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785415662; x=1786020462; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bxFdje7jjR+zvKahWORqDVEHGclh6x66ydhbsiz7wmg=;
 b=kBiKj0r86LV/XON9DFSS/ZoHogQRNUTPjHBQc/Q0S/5RtbRfPuRZB5Ix2h9REKyhxT
 NoHh8oAGgajXvkIioZpWmuEOV2OkcQLHXIlsIxQzGGhPnIT9pVl6Xtg6Qn5P7I/8vXDM
 UdvshEC+o6Zfqu4UA7K4oUSTHfDZkoP2/aPjXzq2fvM/fvRqISHOXaAUYG1qIUBoa00N
 GspxCPL8x2eFTlPMYokxCaxnKQlmDPQtMEavF+Jmfb/xwR0nRh6E9zh7aMxefRtFL0gl
 L5nALqISqvUOfxacxhLYhirnIdrFiiEzGY9Id/GjeVPClXRPuIHHDYUXZhfFfVfl4Nt5
 RaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785415662; x=1786020462;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bxFdje7jjR+zvKahWORqDVEHGclh6x66ydhbsiz7wmg=;
 b=YJUedcP6ElKCpdHNzptFnUn47hlxXHaxoKZYc40B62ehKCoB9l7VrHnDZoebBEeuoC
 yY4LPtGk1uvWC1at9JkkNuCrFUPO55Wzm71eIx9gOTOxIbQjiQmMJWUh7vX3odcWnW8A
 ekiW3q7JdG4NtsMW7ouUP5Cbm73Kz8/mG7mP397328kO9J+LyakyjNd1H6dy7LJA2JBR
 +x2XwuLEeUpA3XpV8YkhZjArGTV+GL+DVHIYjYes0/t8Lm4nVQXa9/FJj/BdontHlxPU
 VaK2Pjn1MRx8gFlckCarfwS8LC2048RCLUfRGpDaI/I8tczkVxUypVdNZb2qD2GmXe37
 MOgQ==
X-Gm-Message-State: AOJu0YwDpnhvgudOP7dYbToVhfEuTyeqlGF5bylpnuwmxYx1bko1nqrF
 SD0BVL9rHkBgVlBlpT65evE4we9d0OnszMyh1aRAuwpRG2N2CIrdBSnrm7ho4eDNplZjOAWYVf6
 nGwJ+TXxP1miz9NUVm0jLFR2q5GZlZTwlyhb2DcgGdw==
X-Gm-Gg: AR+sD10PF+6q2LXbsdjngG8nGwcamUzaGTmp1tcJSWXs46xanBhz1u7W9kzFav3ZCTa
 JXXzc4sI8jBe8rnhss2HhhsriIPD1QFaYUgq5t4yyKqqhk/g/GodrKpJvOkKPDW+T2RHTYBn2+r
 C8K00IyGgMyskm53vd15sqzyJ+v7k3WmqjiRtp/+OtlFtBEPRauiTBc5T+Kaqasbwf/DRjeBCzz
 s5vMtqKxgCiwoMPE75gXb/Tmcz+2gSc3Rr1UoPY1fEk/F4fNH3KgsX1zHcUMovaKKrUJRRmVYlH
 lJBLbvd+woTZqVlbp9hgzmyj1ax+NAjuhIkhIQ83Lc0xY1Rrb9Kx/juYcf2GNmx1yf+kd/KSd7W
 DZo0enx5zjD5oe+Ww24itTERAcCrx
X-Received: by 2002:a05:690c:9a10:b0:81e:6a10:f904 with SMTP id
 00721157ae682-81fb8acc1demr15752097b3.45.1785415661447; Thu, 30 Jul 2026
 05:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260729231325.3808993-1-titusr@google.com>
 <20260729231325.3808993-5-titusr@google.com>
In-Reply-To: <20260729231325.3808993-5-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2026 13:47:29 +0100
X-Gm-Features: AUfX_myktQa3A4Ln_TqTYZyhBnV8C3Zs9A7DubEX9NAW-SgJPwRN32D4fSLMQZA
Message-ID: <CAFEAcA9JKz6e4j6+-14EtpWs=g_c-EYE2Ay3OfyikbWOiyX8Ug@mail.gmail.com>
Subject: Re: [PATCH 4/8] hw/sensor: update adm1266 block transfers
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com, 
 fanjason@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Thu, 30 Jul 2026 at 00:13, Titus Rwantare <titusr@google.com> wrote:
>
> Fixes an issue with reading the MFR_* registers on the ADM1266, this
> device has an unconventional access pattern where a block write of
> length 1 is written to the MFR_* register with the length of the data
> to be read back. Simultaneously, it is possible to write to the contents
> of these registers so long as the block write is longer than 1.
>
> Signed-off-by: Titus Rwantare <titusr@google.com>

>  typedef struct ADM1266State {
>      PMBusDevice parent;
> +    uint8_t read_length;
>
>      char mfr_id[32];
>      char mfr_model[32];
>      char mfr_rev[8];
> +    char mfr_location[48];
> +    char mfr_date[16];
> +    char mfr_serial[32];

This patch seems to be doing two things at once:
(1) fix the semantics of the accesses to the MFR registers
(2) add missing location/date/serial registers

Please split it so we do these things in separate patches.
(Notably, part (2) depends on patch 3 in this series, but
I think a fix to (1) does not; we might want to mark the
bugfix part for backports to stable.)

thanks
-- PMM

