Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74963CD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWzFy-0005jP-LC; Tue, 09 Jun 2026 12:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzFt-0005ef-J2
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:24:45 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzFr-0004pK-Cx
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:24:45 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-bebc80100efso624079866b.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022282; cv=none;
 d=google.com; s=arc-20240605;
 b=LesY3RaeAdsEHPXFaZv5z9LzxSLMUcEUuuuIsfxvnQFt+0CHw89N7pNjBrcFj3x/vV
 XD4FD5LtnAUTvD0/zH3YTADhf4e/JjjbQg318XYkuEFQTqyLrJEaLBR+tJVZAZT+SoxU
 kIAJKkf9X2NwdaCaiZInPGr5c8uYVZrw53f8Hgm2Gr0JaX0vYGzsW3fycHEC4746zGw/
 VZP3k9EFnsQKhOfjpLJHsKTY0BbOPnKHzo1knQpVnAxqpUm4HwwtrRyxX5J/t1NNssJa
 pn6FvOuZFy1J4m7YZMETJo4NDfYYxLQoWVE0Q5U/PkKvAyBf2aPeloSD2EK8WCIQsAZJ
 huSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FoGAFSjXle/G/xJsDCtMxGFsjbAaOC8QDzGVKIdsCPc=;
 fh=Y5tsJ002QbpEFTNcmrJyYCod1Xdiq701kxtNOkc05so=;
 b=ONTFmmNT2Q/d/W25GKcYmCmkR//2TtkCGLslR9/zFJviuuwo/wkjaAHz7fHF+wednE
 X97oT2fQtCozsXW6VUyTa8Q1j3JfhiLM3FvWohpfkfC83CmVQs5kQl8E+bVXmxx1Vwc8
 i+ZZX3LGu/jCoAQ7oz9NFkcv0sU7SWyY0+0gpXQtQjFgr+87bDp3TVdgjXX/skJw5YsW
 HNOm+FVOCGqxkejrpOQXhwr8C1D8WkfftH9rapdUZ14SsY8OYw07le6U3BJMJG+KAnHs
 WiTGHSy0Eg/4TPXbITlfF+jpwe0Vn7HeI1nIhXxIupQSuKbACRtMgQKZPWpXYHTkZ/hC
 vDyQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781022282; x=1781627082; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FoGAFSjXle/G/xJsDCtMxGFsjbAaOC8QDzGVKIdsCPc=;
 b=JUa3Du1v4N01GGe6PLMYPsuiMupgUCq07aQxi3f9CqlgAvYA/M7FeuI+Z65HlPkGEI
 4EgdwcpnhFnBT2Py7abUSXL4cKwL7l4tEoNaGcm723znTVBzHe91eyp4o8jSI3oqcLqM
 vZ52C1/NxVAZrkF+e2CnvMhf6fKvt58aUB95XapCPyxI8uLRsiw22ERnof7MiCC7sV8X
 KJys63VedGJUUspMXpEQpZCJCD40THqzz87rHLaPdx5zunbLTjvZT+gdnOnH+FD/0epd
 c1UY+ma5Cc4fkyFAnf5cYlVnYASEdeeteqqTcyhrlondJ/F3U/NvLVJUwG/S6riJRUDl
 eLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781022282; x=1781627082;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FoGAFSjXle/G/xJsDCtMxGFsjbAaOC8QDzGVKIdsCPc=;
 b=Ym5Wup7OcHcV0f1qM4OGmwIgDk4ZmLtrcv0i60LSxzHW4VjC79sjBjy4tJLgz98xu5
 qbY5t7bvoxTKdtVGZEPXuLy/JpTRHgBcNLrKTvAE524J/3cZ9/BIxJoKgc40IK74clfH
 WSCCZrMxWcNRg21Pf+loeudj42EKYx/Xj5EN+uzZ7jcq5yxoJhOFgAsuiJG4AfqH/8sP
 ydCnhhikx3Wwp2jj1IdElIJcrCq5Ea/gfGruI9gvD1TMHjFGjpd8tALkZjylKF80CQsm
 GxxFM3gHvAAIjdJSLco5W2n9z0kfI1ubMpq16AR9lMOGyaNf5wlAF1VtIFLw8zznJNfg
 84Jg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+s4JbPPm+va/T7bQRFZp5D4xp76xes137d49Tp1oyWZQndpFKvC+AevaTtXA9gXf/jIOho5YxKRg==@nongnu.org
X-Gm-Message-State: AOJu0YwjVVFp9H3Vn0Ui6ep1JfOeZBqMp1RSyAhlgKc7dnoWGFqR/maX
 Gr2l1tb698VrjyTiLKYCGZtC3J5diEN2txMltxt4SBKHrWqYePy2PSBvAfz0H920LGXrwqPf4k5
 m6A9a3+ZdTCKCJ+L00eRjAqufYQ7BtRNGXugKxyd5pA==
X-Gm-Gg: Acq92OHWonc69Q8BnFVvpgQdzP7+TAx8AHYlBpcPQF07axaA3f47DRisNlxC/mhamcu
 Z/9dbwcsir13ELqAEaUguHeJMJPFIw2v/GaK3dHrEFRYxSqJtQrSklHoh+9g/xgOJ8fryJNHEeU
 2BMZPw1/Nwg1W16YsqWJOwdieaAHxSl8sLwSM3pvo8MjUZlv4vHZ0MZlZIhNOSQdzlTxu6RPnDg
 NtZPebv96OTi+jplwXhMv3x1SO9VjFpifbDtW6zBdvT3mu5JI/aJgqziKJqvqWL+qHe96swW5a/
 Umr5v3gbG+JCEuu1RvUNA1bAWl0HMJHjXX1bun6uMviYGmBhC3d8sWJMDG1OeIfXl7/Bb34JoRi
 9fw==
X-Received: by 2002:a17:907:75c2:b0:beb:9be6:f249 with SMTP id
 a640c23a62f3a-bf3737ea2fdmr748068766b.47.1781022281874; Tue, 09 Jun 2026
 09:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-46-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:24:27 +0100
X-Gm-Features: AVVi8CeX-yO7oS88h5XGZMXhbwFakSiXs38MGDlwdzHPb4P20rGbIB3EKid4Lss
Message-ID: <CAFEAcA_asdN42t9ccCVGc8FU+QS4s78PQ-9HOrncGeUTDm7i3w@mail.gmail.com>
Subject: Re: [PATCH v9 45/45] target/arm: Enable FEAT_F8F16MM for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Wed, 3 Jun 2026 at 04:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 1 +
>  target/arm/tcg/cpu64.c        | 1 +
>  docs/system/arm/emulation.rst | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

