Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD77CC54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:32:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojnT-0007kX-KO; Tue, 28 Jul 2026 11:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojnR-0007hT-Go
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:32:45 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojnL-0001g3-Fm
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:32:44 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c12614b81c9so677978166b.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252753; cv=none;
 d=google.com; s=arc-20260327;
 b=ADjKDzoeRzmeZe2TNTTpw/23+iN+lB//3COUXHFixwISUZYlf6g1XiXyzJgLxA5waP
 oxRd98njuiplUi98irFcrYXY9WcTyALLCm1ERcYwRyQa8Ku3wZ6Sq4uQvWQrdzAxSRdh
 kw5KTia5ETuZ3++uc6zuQkFC54Xc8ZDIyQWALQHKN8Z9H14hqD9/Fdw1Uhq8xU4IrUjy
 fj3z6WBCnx5RoJxq1rsZq1rxX1eh+BsNuYJqvcSxrWmmzVX16XvysQRNSdpTUCTI5rl/
 UZDh1x34XHsoaotYUjreKEkOAFVTFL4up7HLZrDjDSAKUheKAmT4t8AqxrFaC0uehXi8
 hNzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ent+e8+88shsT+f5bkRPSYgJV9ACUBBlL6QBTaEHXTY=;
 fh=9eVCtNqFbZlGdlL6/a1991RXdFZBw5EgmAFGrfHyZnA=;
 b=II6BD/nnScGkiV0gK7TOq7SVw57WQ4GTNmEMr2ZpgbJ4EJdZOPv+40zX0hMUwlOrnT
 DGYTtP0njAkh0DX/0ERum7FPZE/sG3PDkY0iBvoJJXzgpxeIEYvXdu765QnAPe1jCoPq
 WQ0it7H1v9jFK2UqMnzWBA4DTCLkBdRHybIVK7isyihzvSHXxx9T8vPR+ecJpINsiOno
 V66pQecgxsP71LEDsN0im2q7jseZi4Jlsi/fKQvgrBUgPlmxZG3X2p074pyYx/Q5W6nh
 MifjrHI4buvFPZ2zHEIxy1mjGx+BAMNYX4sWiUGM3BhzvOatlT7pkNFEuJORcMGb8mwh
 KOYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252753; x=1785857553; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ent+e8+88shsT+f5bkRPSYgJV9ACUBBlL6QBTaEHXTY=;
 b=L8mi2pDaeLCKkiPlcNSKvgHydYxYn2nui3puWeQtRTOPsqPgL0N5oCS2z2JBBAq77h
 hM79nnJN92xyFp3telef8ymAJjS3OVXJetpasqpZSICkjw26IzgaJZtSF9xLZuoyF5Ge
 RxTh7KL9N3LkHxTw7XyjnLZjIvNtkkn5gzunHUXt6WMU5gCeX/fDwjHDwz0IArr8GqOU
 sQd5XzBV3w48CL0KDrfN3Abh0xL58v28oFZ+OL/2z0qgpihsOQJEZhdYWjiYVCI9c5RR
 DIfIqs18I64iU+Bnii6/vmG7og0HWNs4wnP1gaoFCbcyIVJe5/43Zwm6xgXsLES79zJp
 mf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252753; x=1785857553;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ent+e8+88shsT+f5bkRPSYgJV9ACUBBlL6QBTaEHXTY=;
 b=bAwcCe/RPq4xJ7SUgUQg69PmDNp5T5TWc3NrfBlwlkjZLbF+TYEhypQnFEvjM5dDLJ
 303wUMwnlwslLJZEjLfuIH1IYLAJHCOEV6ie11BPhj9fX6lSlLEhDNDyFFVCt38ALhK/
 A+DYVmlNFMhuXWu4cw6nI/e9xpbcSf20kRoYxI4scFTe+GAQrVW5LPUR2XnBGidnUTCY
 TePR4Kv+P+oJ5gXq+td8+NEdQy+ihbEHnYG1Nc8RvCQe8Aa2BcMO+EjEQj7kv2r/6DaV
 nDnTeq43gsCxNZHJ8WZ4uQ6TzzhL/6FEbWbyDpisEC2BYbzPx90qQPobKeAvZkideVpR
 KXaw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpMId+s/qMPhXGYFMaKhiBlzLUCz3zm1RbZ/xaE6wSt/y3fDVIvAke99rf83XRw9rrpCa/X88Ssmg==@nongnu.org
X-Gm-Message-State: AOJu0Yzpag2lyiTybD74oyDx/9x1DnUKEyZoCjtfTmz9gKLCpiG/tI0R
 PiiFrzlF0aoGMOKEGbyE7MlkyycSfllgBNn8z1zW6JX9k2JO+9B9uYF8VxBbB2swXfUluywBBsu
 FRyogYI5HlrgahabZFIZRL9er85AaUNHjBvsDihAuwQ==
X-Gm-Gg: AR+sD13v5ZDRrVSwDEOxn0qFipJGNR4RWBqVi6JjY+y84YqpHU55JpJb6l3fkLAJuRn
 kZFVmkX1H5Lq25bu10Ew2rns11xGid+GR5g0P8/dpI+8uIDaH0C9/F7FtJROf+9ISGFoMqHaUKo
 97uV/kpN1GY0gTHBA/HiXEtqcTLs58VBb6amLwCrtHv39KQSs0qqpo874Z8Bo0ybWXdPKy8mbzH
 FrAgQ5i5YcL2PG96Regyr/X6qk0dmgw5/8NtX3dicIPJZHm1GWtfuEDkMKtXK39xabGv30NzxGt
 r1woegSBZF1zu8/WxGgiXKrBcrFTxA6A7+ZeAICJ4gtiGzCQ3IvFOc/w
X-Received: by 2002:a17:907:d7cb:b0:c1f:1267:deb7 with SMTP id
 a640c23a62f3a-c1f721918c0mr165339866b.62.1785252753488; Tue, 28 Jul 2026
 08:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-10-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:32:19 +0100
X-Gm-Features: AUfX_mwl52ruR1jUPYHSphL9m9mruP7Ko5pWLodRQXjG5rGqB-bhe_cVIx7wVdg
Message-ID: <CAFEAcA-X6mZU3=zU+0G+aGi9JXp3Okse59c7dMe2aHEa8EcptA@mail.gmail.com>
Subject: Re: [PATCH 09/20] target/arm: Enable FEAT_SVE_BFSCALE for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Tue, 21 Jul 2026 at 19:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 1 +
>  target/arm/tcg/cpu64.c        | 3 ++-
>  docs/system/arm/emulation.rst | 1 +
>  3 files changed, 4 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

