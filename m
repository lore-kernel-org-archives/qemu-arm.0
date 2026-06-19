Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCC3CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:53:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZf3-00052m-R9; Fri, 19 Jun 2026 09:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZf1-00050i-5p
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:53:31 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZey-0004kz-7q
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:53:30 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-662bf1dab83so2606723d50.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781877204; cv=none;
 d=google.com; s=arc-20240605;
 b=ifAYmN9xAi8rgGFEzg84lg6037mHb97AnTocz1+qXDnnkSLgl4+HxmpH2YR03IviBz
 nbSEnrnFngvAYoRRsR76CyRcc0JkXl90NqTlyD1yLyNt2KYFjV2yEjOP79WaiLNg0rng
 y7x+i7hGQTZf/15Qb8wCTn6K3iohTENYvsPapsMEYnrKCHSEn2HX1JCqyHm+G1km5VlS
 qPEFznz+u/ebpYW1+bpkFQ6csvdYP6ZBR9yEcOQ7S1NKJJ4w57RcZuLLdlm7fRQjahsT
 sJh0dpW3iFOagAduemREr/yO51Hp33KZcUdfKJi2C+3UjlkX3uM00cJjfyLs16C1ZsRs
 0qtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9lcw5Y+4hzPxq+A6X2LntP1wMGafpivrk1HVEb4wOug=;
 fh=Wz8m0ZzwxKGeMtQm8IZ7kF+FDVQyQNWnSqjf6NGF0Jk=;
 b=AJ7mi396E51CIMDWT2UtqD7OOykoP21/zkYm89Qa5JRA0YlpuEMw7FlO3r2r/Y01g8
 uITa4PV/Ul3O92YxfojVamXyRGZ+TeM/coDVh/pfkcmmanwDMnvoqW4ZqIOvv5vC8eFO
 tbSUqHzemhYgnly22gKfYRTbjd1ut2l7rgYW7ia7zNMXvfJ5wGxPzZjiYLx2ZgP2zym0
 hlH7RRdQMGRdfD51huOJuYafAeKeyT8dBNxLpL37TfTLAlctoJuljDHuHCj9P74hRmWm
 bArVYKdwT4AG8Nj6zjBK1GXFtJFyhGMsjSoslnQ4M3730YHxZGL0Y2Ru83ZBA3zCgRam
 dFWA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781877204; x=1782482004; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9lcw5Y+4hzPxq+A6X2LntP1wMGafpivrk1HVEb4wOug=;
 b=kbx20Qro8EPhxQUJzbwys1sfB4QPeC/upKZ5n9RP5IddBBJRPM5BqdttiageM55J/k
 UOo92sb1kFqXrWfyw990b91sauwQ6Sza6o3rRC9sEVVqI0De4kLRvewWWFgGDp7W4N/D
 4W8/gmBWW8BZ/Y2K/vdPX10AEYg3YG6gE9Hy3XWSUBlxyR4J7CHsMJbqzdFAE6j1p2IK
 YRZIJa/Z0slxIsgxjfqI7L+oYua4PPM6zmLpMohpYMJK+PqJJbAUT2+gfyRKAAnMrQ/m
 3SrY1hOYKT3GkVecG7sxD9IO2fWkSIssJq90HgpVpNhfGMawiIhhgvGSQH6HvQQV8ZoS
 y6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781877204; x=1782482004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9lcw5Y+4hzPxq+A6X2LntP1wMGafpivrk1HVEb4wOug=;
 b=RiqtQppwUQw3GrA3x2VObVpB7G5IIm+OqDtDCAckC2nGUH9orA/CZQlSkD1cDZZU9U
 wh9kLPL6iL/KRxgfkOH+VGvj0NnYibMcEn4meJEeXOG0Rl4QHnQQ7vhByfVP8W8WlO6j
 pdpbYZR4PwTwQxWFItD6LTQQReIQnaPsMvhrvmFJr+2+IzFKLlJxti17ChgLdsLOR7CT
 BsMQRQI2OpWyp22jv7rxmAv7f9HWXq3GT/ZZsHoAsWpPOrLYRa8BGExdGmuj8yV4ufiQ
 tD2kl55CsJPsZqB3egEfRpNXy9hsKZDzf0xUeRTLAOJavN/ZjDGPxxpgMyjtlRoLbBsf
 +YSA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8v16/vYa8VbF3IkYDPwgjkc6dlg1ep8nTx9/qmKwKkIfLRmEwC77guy0v66MvSLdgcjniMLyoNZw==@nongnu.org
X-Gm-Message-State: AOJu0Yzcr7PjzChdkSpuUvqCfj7R6W1uVe/3yb2lLXFww40tS32+Z+dL
 DmYZG43U8VppzP+eZ49VpkO/JNacE+0yxiOuY+Bt/oQVnp+jKkXxjt5AnECToufPKtZQyG5/w9Z
 uNSqoe3IdhP873fq/mGsEBnKooWQX0VAuTR1q4HuHTw==
X-Gm-Gg: AfdE7ckD2q1ypHSEFJjwytAEMfhRpfpu/reDnYm6PcCSJHHQKA6XhAHGfzs/QqLupOS
 lsvLM3Q+TBB0vuaVYBJ63kajGCrneJdAjuEFD/E2Q6jjmUCxFf7pqQNhqD0b+NDccLRhcS+V0sO
 3WWbrcY4haE99YlS+aLJtgMUJtBgYsLiYBAGzazv0OUVzMUYvQAArhgdD+YQxqmM6Tq5JhMkC2G
 FqPDNP8j+9ERI4tc6S5TM2Wvg6AWht3hK+rWzPfgi2cNzAGTqQ9TvQmhE746uTQ3uuiKLNWJdSZ
 XbftTLOcj//m9IQmbOfX8qGQhVmOLseoNeXW+3ypWP3sMW5ezvat9mmJ
X-Received: by 2002:a05:690e:2250:b0:660:e9ea:17dd with SMTP id
 956f58d0204a3-662fc9053b9mr3238302d50.28.1781877204062; Fri, 19 Jun 2026
 06:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-10-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:53:11 +0100
X-Gm-Features: AVVi8Cc7pPiuBU7eFiiUkdiKNH7SmloGhD-eVKlKvu_F0d4XkhjyiZcVl67zXJI
Message-ID: <CAFEAcA9F1fVWv_iV-Kb7w3tKFnMP8nD5fO3yyHsuSV9o41CzAw@mail.gmail.com>
Subject: Re: [PATCH 09/10] target/arm: Implement FVDOTB, FVDOTT
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 18 Jun 2026 at 05:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-fp8-defs.h |  2 ++
>  target/arm/tcg/fp8_helper.c      | 23 +++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c   | 10 ++++++++++
>  target/arm/tcg/sme.decode        |  7 +++++++
>  4 files changed, 42 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

