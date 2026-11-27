Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FD0606A326
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yrn6u2cF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWzZb-0004tw-Qz; Fri, 27 Nov 2026 12:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWzZa-0004tY-Gi
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 12:17:22 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWzZY-0002p2-IC
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 12:17:22 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-67dae7d3f7dso9741147d50.2
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 09:17:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795799839; cv=none;
 d=google.com; s=arc-20260327;
 b=dvA8ZeO7xElc25UYO2oWkgr9yRfIsXa41/Oc4/TB2Qk5Xke8ysb/CifyerpTIjcmc4
 VW7/jBjcHTskYOgXsk+O/AwieNNMBxvUWqTCxyxS9R/OwBvUnH5uRhDhnpsX69jruccf
 fJATYA4OxJnoyWKrETc71U5pvm8tBrJPkHvN12ORTqETDzAs1megLbO5Pli0AWANdWuH
 NS+64EvJS35o0djhuVjZysXIGGsWxQpIZUO1xzbmy6KIi/cwzlVpNqnzc1FNMmMgRSqf
 tEiAIubuM34pm3MeYWmmruwhQCPP89k3NUa0eeiS3JDgKY3y4+q99Jy2Qq98GYCEZVZQ
 5GQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zqYWPvCQdhC8VkAwyAD3mqAxOAAIJTq9mssUMtc/L/8=;
 fh=sskA5hOBFmZnNz4sQlOts4tR+1/MFpCSF8i6CsomFco=;
 b=BiJTxGXaI0+zlESH+deSRjuwJVZW8cBMhEVIEohtul5n9QRILHTyIzvsnJCovaOnuT
 jpkBZMO3fXXhKoiqcW9Da83AFSkWk5fANjjVKmKGRtM/htJn7nGKxmN5wiTLg32aKSnx
 Zaatr+24Ps0EHVIRAhDCR6VutM0/7D9jzwTyAKsThQPMEHtlHcJswWxZJs9NdUvkt5+d
 b9N8dCWjKmmYBu93qb2IDlFdZ+4e1Y2r2cArDb6VGa49d0PiTHA5wG7iOacTDafHF6mO
 9Xyby2+MW7dI3cFFAo/TJ46U3sqRpjPbbKvOTfFA3MucyzoGKFQgVSoPqhw38iCzy4Rl
 yMCA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795799839; x=1796404639; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zqYWPvCQdhC8VkAwyAD3mqAxOAAIJTq9mssUMtc/L/8=;
 b=yrn6u2cFV+a0/ZZf0BXe6CJpvQKIXu3IWBN1a9I2iUR6sItRBXXUcUfrmBnzPQ3t7l
 qD/9+AiRvcqjM2i15T8qglHAJ/kePkZOmlJUBHR5XuX1dPPw9NaPLTKQfyNxNtQbj4ZY
 ljVz3c+q69JqDozby0GdQ2I2uayv/tV2JDTm0/169xR3CesRboawofpqUaCXJgH0RmKE
 GlU+5OWJjrPo/rk0cQRR6St+INxatB80Q30aP/gMgJOGDpstlCdKNBYXVRqSp4QMj4F1
 nSSwFEWZp3t53xf4sJovdOfFgpTNKGR9p+n8Lg0QaVzHQaiUbJAxa5uiUkoMEIo0q+pu
 SJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795799839; x=1796404639;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zqYWPvCQdhC8VkAwyAD3mqAxOAAIJTq9mssUMtc/L/8=;
 b=22OD9J/xDtXkyQl8Qf1k8on/p9XRDlKFLOK9VrtW9BrFtSQpALpjnJ+J+az1YuRjHs
 2pughRZg2v+L9Y4BytSV8Cpz02sDe/fcVWrVr161YeYtNn6gD9p0G5G/G5kV6N/EyYIi
 MWpUNUtEusKCMvye7UKq6p8OgrWHNyDLDrLzprTbi2lxLivK0Y/VU0xVFn9/wZVbJpNw
 ecW2XftcoLpmzpcJUT06pwv1rvT4nPs5OOFhpVJUeE9Y3zrF3wsehejOvfhxtDSgIl5B
 9MGqI5MpcavJaaNSH/rCIsxor+nXAfL0LkRP1mTORWUEJX9ru3+OLMBGImUp/2/dJA6x
 qIqQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHVJyUxd0Qj6oZAmst+VZBur9UZf17Wzxk4X/0hQh/M66cKQfiyjLbD/9Nv89y15ZHng6QVnamK1g==@nongnu.org
X-Gm-Message-State: APuU4Z9YLHuvnroynsxNJtbTvgQ0Zf3np7hJFYv7qj18RaXiB04hqmp9
 STdqfbTbGAPLvyf3rhuFZ1R5qzEdyh0vmh2+XMm8iAX6b5krItu6QTydiLswP3XiT2kMbZGXd6L
 pFpcQgQYOe4rnp6BQx1SDCXGw8U69pdqJ7ep//nhlSA==
X-Gm-Gg: AZFdTZdp2NqOscOHeJADVq8f0hItyL91Q/4WaTgOSRxCw4AaIwadegSYXvJ3D0ir/pg
 WaYK7Fp5guVe+wucT30y4NwWbC5YWXFlbjru3tuSoJ7azNzQyWp0qQrE8ycI46iLZz8UASw3Qe2
 B97Jgn7xTTgEcbBGcW0iv7VClxte9sQ2dEWrDwmwTrAtoIa5UiZZ1EUMDNrH+WRXWiElS7h5wnn
 7SDtLMD5LjF+MbbMzrZTl3DbRMcyFdx6Nrm36hsE180CZ4Vh+A0WT2JVAlvBrIN1F8EvnC/CHgq
 QkdFAWJBYSSiSoiPxWCAIdn+A6DKQ4NIi6c16quupUnk7IqN2YXy83/ehpMmKfAZhTiAkGriZ59
 sYIXmfWPjMDWjlwytHjYQcVBO1MLgqjqssQAJ8k5veJeFzlo7DgdkFOK/uX5qyYgcWv0kmWIk/X
 kvBfoERu5KZTJViIDEx24k
X-Received: by 2002:a05:690e:190c:b0:67e:58f:5736 with SMTP id
 956f58d0204a3-67e058f5a79mr7310752d50.77.1795799838936; Fri, 27 Nov 2026
 09:17:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030194318.319310-1-richard.henderson@linaro.org>
 <20261030194318.319310-3-richard.henderson@linaro.org>
In-Reply-To: <20261030194318.319310-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2026 17:17:06 +0000
X-Gm-Features: Aa3M54r8hSrW6uZe_zdKxjwKFun8OgkGk39dqVUmWGrhFUoCGdV5jF5gnlLf-Y4
Message-ID: <CAFEAcA-fgXkrRfN_pTNxoD7h+b=pr1X9OaGJzAiBkhE4PKW=LQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] target/arm: Retain btype in DisasContext.tbflags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 19:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace btype = -1 with btype_set = true.  This is both
> less confusing and keeps the state separate from the
> per-insn iteration.  Set tbflags_invalid when we need
> to read the btype from the page tables and therefore
> we cannot keep DisasContext.tbflags up to date.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

This looks OK, but how can we know when a TBFLAGS flag is like
btype (must be kept in s->tbflags and update s->tbflags_invalid
if we emit something that changes it) versus it being like most
of the TBFLAGS (OK to extract and keep in a more convenient form
in some other s->whatever field, no need to worry about updating
s->tbflags) ?

thanks
-- PMM

