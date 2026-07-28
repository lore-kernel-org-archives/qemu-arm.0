Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DD7C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:45:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woi7W-0004kO-IT; Tue, 28 Jul 2026 09:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woi7U-0004jA-KK
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:45:20 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woi7T-0000D4-7a
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:45:20 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6626b5ace23so1524612d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785246318; cv=none;
 d=google.com; s=arc-20260327;
 b=M30VOYmeiUNOBXdLRH1G8HmaMpQrttHHRjga1+5RUji5pmS3FiAfqwjW3WJ/V7U/Nn
 1rD/cg66dnN7wmLvfGd/c5OVvZZZSLkQf+wJhLF8QkLumg940IlIdJvGyJG9qAxjZrZ/
 0Y/t+xi7rIHasBOUJt6FqSJSm2OFl6SWJAJHzuEdyDnWirf4YpEy1HVrztuN1Sz/rDNN
 ekBTfSutJxz1HPNhO/KWEpEcWihZAjNOPGkTaIKfvEGgmu/BZK9JNumfFtXy2bcEh/+J
 ferEXakTtIYXVj3sVeDIZd9HYAYoD8pNXnf1/hJ2czIDGR++nkFbtR0DEyPbp0xLY923
 9xpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oWTksGYluHomzQY+4oVvYnKF49euD6wn1i5gDGA+5sM=;
 fh=6oshcccjfpLLFP3Jq29MGeLyU0I46/JMJrnk/TARE4k=;
 b=D1eK7h1VfN6ZaJsS4lYfDmTU0pMXBfKhfr8WYtyOmwl2Xn9jKtiv4vdD4yqMuT3y9g
 KXyyZgxP6Li6UczZfRlfzYkt/siI9WLaTfWAAgMiFYb7uJaoKXJvoG010vys+LiFoorU
 iBnC+NHVVGgjXED+lgqwshqdPN2aHt1otscNM/3bVjdSleoKw+4dHqSw/lKy6aJ6Wzl3
 mRWcBItwjJ2uGlBWX9USisuOGny+iEUok+IuacaQLVaarpIGylOXJgLJBc72A/WXlAHv
 UySXLmfy6dMeQ5Uc0G8DOp5UD9SGkvEMM1t5LzLxTwyapmFd5V3rtqvxS0kaJ7/AAwFw
 kqZg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785246318; x=1785851118; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=oWTksGYluHomzQY+4oVvYnKF49euD6wn1i5gDGA+5sM=;
 b=wtOnVKakbta3mYkDAFWWsBk8/Iq7JIBGgDVD5BUfBzhnDgZXeQ7n+WgPe70WxHdKC4
 sfET12KYgfikm9wtkhLn+SOBdb9woYlb8afWNa7Zn53F6hSu1IGYeU1FjPcQi8oLpOLM
 t5oZpKUXVNQLNQ1eah5aAtsMWVpL2LUtRZ+oBIt2zTW9YxZ5PzPHKR5raReHvOZR/XH/
 DkZPQYmxd1RLfGgh7f9sSS93+6PSAIK/6/lOCNV2cZAwKW/jAgs9S/CsYkm7DcG+oimp
 uNjCByU5WjJpJ/PF+Xd9uVmhe3YS6/lmS2vLAqC9GORUeY4hDAEOsA0AAoxHBJ7EY4H2
 t5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785246318; x=1785851118;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=oWTksGYluHomzQY+4oVvYnKF49euD6wn1i5gDGA+5sM=;
 b=ZgpESz1PcHOeynJGJv5s78M8B6MrA2dmh4I2Mn+UudPCjfP1h6kZozU4Qvr7BreJG6
 AdH59ZvySv6Ff7Yzx74gwfLM9z9npRCE0ifZa95KaTvHM/CBgTYzhW2fXs1PLF63khnm
 5b5thnoMldiKCTgq65PWyytwN2VPV/wgW/YIJeVlWUv2R/ShC/XGa85y3+TDEYEf3V7s
 G0ylA+E+kt5fn5aLXz9YMTNThkxqLmQq83dDLV+okpZntVBqFxg8XisJLMBYatKnIjAG
 w5q12b7ofIB25r3VAweCBC2JQ+3rwvxrfMZ2JLWjtWl4vSugjWrR4hNxnXsCEfHxsSdS
 WPtA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq5E3Yz/U6u/vNPOCZFuHkHURKzvMLTzUiZ8E7UvqpLyDowZiOw8rVag/e52WmFyLpa/dDi6BVgYw==@nongnu.org
X-Gm-Message-State: AOJu0Yz3iZ/+OserWGqvVB8uDRWQrQ8dKovJBah47793aHga6OEZiBqU
 Az2aNJE2Dy4ia6S+yrfX00aIGAlaWEATop6uT2arQaggBSPDmhASCfhn5jghunnSvqej0B1vIBw
 a0s8SkuztoRNnoscMx6/90onw/m/brY5YFfwRiBXx6Q==
X-Gm-Gg: AR+sD10184u1b9JOR9kVnlJ8S2L7GFZJZzd+PtFCkAw8lhUNCZrJNo9xaFMiProRKX7
 Xd9/R7vGasJkuiDrg+Z3dGXpzuQgcZyfLOxjcpghywAAggrGPJymT3+qawISLaVIVgPkRdb+wdq
 MgATNBHPMX4Vo3/N5DkdFC8DC7wSnFRPCr/4NuHAIbtzm66O1icmzTsu928b9KNFb3Oo6f9i3F5
 8b0un7vpbjSlsroA7mPcFNW0zUu91i0X2QzI9o/Pl6UIaf3haSpNw71ww2vHMiJPoQs+L7hILwu
 QDWxZ62W4O4XF1ltG6x9yqBSfIZS2JN153TXBBomNYsddw5ANb83Z4ga
X-Received: by 2002:a53:d84a:0:b0:664:d5ff:2856 with SMTP id
 956f58d0204a3-669056b8a34mr666743d50.14.1785246318099; Tue, 28 Jul 2026
 06:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260719174905.420725-1-richard.henderson@linaro.org>
In-Reply-To: <20260719174905.420725-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:45:05 +0100
X-Gm-Features: AUfX_mxz5GDWY3ReeGESaqLV6Gu7iHT0MPVjE7kafcNEYuK5GM82NcdI1dAJwYw
Message-ID: <CAFEAcA9sSHOFU8A5Z39dSc2KiytHm7NQtPWtZiqxgxQCc3Ah0w@mail.gmail.com>
Subject: Re: [PATCH for-11.2 0/6] target/arm: Implement FEAT_SME2p2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Sun, 19 Jul 2026 at 18:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20260713230244.70174-1-richard.henderson@linaro.org
> ("[PATCH for-11.2 00/10] target/arm: Implement FEAT_SME_TMOP")
>
> One final pair of insns, FMUL (multiple and single vectors) and
> FMUL (multiple vectors), which are not covered by a sub-feature.
>
> Finishing SME2p2 allows us to finally enable SVE2p2 in -cpu max.
>
>
> r~
>
>
> Richard Henderson (6):
>   target/arm: Split zdn in do_z2z_n1 and do_z2z_n1_fpst
>   target/arm: Split zdn in do_z2z_nn and do_z2z_nn_fpst
>   target/arm: Fix b16b16 feature test for SME2 BFCLAMP, BFMAX, BFMIN
>   target/arm: Split decode of BFloat SME FMAX/FMIN
>   target/arm: Implement FMUL (multiple/multiple and single vectors)
>   target/arm: Enable FEAT_SVE2p2 and FEAT_SME2p2 for -cpu ma

Given your reply to patch 4 I assume you'll respin this at
some point, so I won't look at 4 or 5 until then.

-- PMM

