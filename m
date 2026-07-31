Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47019C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 16:31:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpq9C-0000dn-7o; Fri, 31 Jul 2026 12:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpq8z-0000Y9-L0
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 12:31:36 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpq8s-0003Yl-Eu
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 12:31:32 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-66893db7bccso1733551d50.1
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 09:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785515484; cv=none;
 d=google.com; s=arc-20260327;
 b=lGCyb34LQYwKK8fcGYFCbqs9rFnDO+UEm2QQFb0TiDQeoebsDCZBAWFVuoWls5d85y
 P3uTp+Sir18zv2EL0oWjKTvAS+6b4ybn4pDOtXeoGy8dISb9C1mxH5q/nchRTqb+/r1n
 WeSTjBF0Hsf+N469a0CONZTpajKpkamtlyVIOjp+cPRsulDgzgR9VnbIh6clJvkHZod8
 8sMaQFD536Q+tVPoHlErZtuQPHHpRwIJ4HyWUs9OfdUMnGyUOBg+XgxNTqGsKQimhdT1
 IEzKwdbiLtHbj/1h6v8zjG7qBYQgyqMCK3Sha0Ryi87AiPP7mLJgKGHGefz2oRHcUUsl
 ZVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WJaBpZj7vITykyjMbJ3XucRmr/SMCWinouZDtxWz//c=;
 fh=fCzKhao/NR/UMzQl27EyCFedMiFKKK8mQl5Kk5DmTds=;
 b=omfQbnZpdCoDmTv0S1u01TxzkPOooe6caR0Smzk+Tp64nDd2eB9z7W7/6BvZhy3Yge
 xfWn8z5ZQ4VEY8zt7LvxoJpMjoQKBGMKKlXXdomPU74JbWmb0RGnLkfM4QpBD6Q75ubO
 bkXoCHFhUwHl7gXvaQE/9/llVOp4CfE50gvBkGJtXo1rudvkTNKiV0SOWfdmEZ9to3EG
 Rxf6hXakRsFJY/sedztv/uNtbqe++GrlhxDUxuQ+pegBxI6Iz4+5AUe9/oukZAUZhvyu
 A3T0DAEWCyk9ijIYb0UqDEzVLaikZ69Sfx6AMFvcnm8SKqVPwtlNT7S64dSptvRBpajO
 0w5g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785515484; x=1786120284; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=WJaBpZj7vITykyjMbJ3XucRmr/SMCWinouZDtxWz//c=;
 b=cwI1tmlSn7Yw6um7V+q4dIVPejAY0Hvr+WY7kKYBipYu8ZhbTfod5kp28M6nnWWGps
 MRPXgeLF/aZIsCRsF8AYw06ot1Yygex8peWp9Q+jnzr/Im9HKJ+rf10roxFTUZ/GK4W4
 grpcXs1aw0UNBhFS+E/nAun+STQwoRSlpA9ZzTAPS0DzA9ByMRscps9BySL5PWDc8am6
 /CbuZgAjS4+MDJMyA8rc2sTxsZPxN58JOpMgPi/JDSSsY9h3brNkVhP1mgClP8ihJz66
 t0cBWsESrualoUK3ooS8mhvU6sRkF453ugT9F8S+L3Ic2BSrbZe0rB0WdyFjGiZ8mFDo
 PWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785515484; x=1786120284;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WJaBpZj7vITykyjMbJ3XucRmr/SMCWinouZDtxWz//c=;
 b=i0FK1U+Q57/CdpcuZkdaHt/JOESBT+KUKni+A+aXuh85xUd1+9irzhDLHUbeV9BpaD
 C8coCuMAiJdeQU3kTzywyfip5xxnmtBh8rjB5CHI0e0W1IcVuJpn/qHPRetr4CZha7ql
 2Jn/bQKUwjHwKtpEfI6UAMASmLvIhODuQizLN1GoCPlTspiXGHFMzbSlkaJJdJRvuWPh
 ylqbx0K3/a7z0r3awl6KHwhdW7M37RU2cQRXzcWw3dZnKD1UNfrKRhU60KyPwJ+Segao
 lfhUYQHpFSGrf9zC07sgHFsocgyrFGmnSUq5biKLR15RCUJL2JT41C5EbyXn2lAsBqB4
 7KyQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RorT03DE6rxAa4Sk4HqyfQpaDzXqU0nQwDPqGbX9kVn8kPQgf1T/vVUoOIVK9zmDfQJ3tjw8zvaKQ==@nongnu.org
X-Gm-Message-State: AOJu0YwDtKr8+ODciPDEdXsmBcorR6sUV9BYHZXgrXRx7s5V9ii7Bo6W
 X9tbf53oPbOkoANoOvE16bzBHsBv2WXwKG8Anv34dICbdLl1+0F/6M8KjYrL6R9wuCWvXFTwZaK
 DjVFazJUSu1QlVKvJQ7d8E90EiQlBTR/VQfPieHi2xg==
X-Gm-Gg: AR+sD13UwSh1lVSzzgdSZixuUBC7/hWsws/vKDO/1Lc108w20SCzg/AvRUsBcOMtWSt
 GgkGtzuatj9bK4PIvM0rmwe3AOrcMOXUZ+2vqTolm0UFAGgiZ7ircfuzQ+mjelXJAD2lYtM2TTi
 ALRUFIuEPKDXaglMF2bEnsL3sR7jLrC9M9x947ParH3OrXeGGT8z99D3hDQ1WdbpHKJLUm6TKXA
 GjHwOmo862OG9KloA32Z1zTeoFyhxjxSVRZ786UkoarY0yi83gedlSbvhyTjmkhaV0vbn5V7uH7
 jiZ2Au6g01RqV+hZ7H8akb6ElUTlDnliImpVDeho3WXxMo5rzHMnFVWUK+M2lO4YDXnYs6L/bpP
 ydMjYaTpY7vhmv62XP8UVpmh+4x/V
X-Received: by 2002:a05:690e:4811:b0:652:5567:b3ec with SMTP id
 956f58d0204a3-6694f1baaeamr565248d50.37.1785515484016; Fri, 31 Jul 2026
 09:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260724030616.76180-1-richard.henderson@linaro.org>
 <20260724030616.76180-3-richard.henderson@linaro.org>
In-Reply-To: <20260724030616.76180-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 17:31:10 +0100
X-Gm-Features: AUfX_mxLHB5ABltfNlSq-57T1Rq4pmbG8pGpLlePJrbDN3ZQnXVAxvhw0BiRGUM
Message-ID: <CAFEAcA8eWkwe8FME2WePZ4sdcVVQMtOVVsFYJVejB+TChxEufQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/arm: Add FGWTE3_EL3 bit definitions
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

On Fri, 24 Jul 2026 at 04:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

