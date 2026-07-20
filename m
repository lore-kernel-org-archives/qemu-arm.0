Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303D2C4451B
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 08:40:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wljYF-00059V-E3; Mon, 20 Jul 2026 04:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wljYC-00058Z-KO
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:40:36 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wljYA-0003JM-Bl
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:40:35 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-80bb41f7f3cso61404057b3.2
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 01:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784536833; cv=none;
 d=google.com; s=arc-20260327;
 b=FnUfJMwvbcJmMb8vAHcI/235uTNIRWDq06ok3/5Ngoc4e24wcSuKQXchP3v92U1nCE
 enbAZCrQVg9CZo/9pc/ZztArWn/IuL7wj3z9F6wKISlDt6sAcyu4gQg2/bN4ze6fvChq
 O7a4naf6wZKBocODN32dq5Hx1E3He+PKuGcL/EC0NSJTxw1uI44+XJ1b2i7Nb066QSV+
 /vLCQZ05jHbpLABa4ZlVqqK4BSXyjpDOw0eAtf+tDZLRwGdT6gU8Z6rlJ2yWfofoiizA
 MxjG6sLkdj0mJzeYK+QajecZeWwdwr+PBiIzgqkm8xmTrVJq7cn0a4ZgZo3st2Ve0QDX
 e3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=bZxiAV9mmN2tKd8DiAqS6HbtAfvP1UumvFStr62do4s=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=POo2aK1U8pUPrc1mETXd1FQV5C48j3GQSeFUsdNhf5H4Eb7GfDtkJAE/bl64fFR0Ct
 C4wNpsiSuy+Kwn/JPiRZUkA7Rcd9ALkmZBVEdNQgHRozcdQgTteCpFXByW8IGmuqhMEl
 N/cRgwi8Dm5CSLid7EHBu2KIqb8ZWPNdsCFzdbKOKXRYbDaYzhgTkmpjgZqFohREKYuG
 XM6Ut6r0dZ3ExFC1PfT5gjOE/pjSI5L//LLPZ6DubMWudAqmAutyT5uJNstff9ur8BNs
 1LsgIDRGwoBSHdGA7KQiCX2HKRs4ZfeTO6sGBv5eyWn+7Ne0QTK4GBV5GEmwX7d46CcA
 NtqA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784536833; x=1785141633; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bZxiAV9mmN2tKd8DiAqS6HbtAfvP1UumvFStr62do4s=;
 b=I+rstk9bUPBVt3KY+VOO4YE8siAviZhFqNyVEos0LzdOlo2sd70RcL4tkRtNQ5FTlB
 M4nD1xW5L9SayX9ge1uFMWox/QtSKSCQxKg8aJ4EoGG5HapbpGsula9BZIG6qJocCCyn
 VlAOnmqpwyHQBK1u9YY5Kqu7wFPACi4UcC+md/AXRWGQwlclyGTQYtljde3imu19P8m0
 q/I7CKW3fSJhEZUu3ux3ZJPy4usslW1C/17a86XiPYtlxiypCN1sRncxYjvvs91O0sZa
 R1Y5X21QDeZrJIVDWS+QEmSTDSn2/TM3VgTRFVXHq+u98DIF5/4OwGa9SRv1NnSWdmy0
 ttaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784536833; x=1785141633;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bZxiAV9mmN2tKd8DiAqS6HbtAfvP1UumvFStr62do4s=;
 b=f1siWMnI6BgD6PsiQ9CYW4ImW5J7SslxsSnJb1N2G5A69sBRhpaHAWSAfC8Oz+PdXf
 eTyKQeKodG/EFEk7clLx9XGgdQVpGrUMCQq8DHADwhPheO/rEiO46aWyB+CLmHcRjXNC
 fn65cDxUXpK7xcKIbOYu+h06V3hYYRzddigkqPaje42txNNNIfZlP7UKLiJQeUf/2xzc
 HriGUVnoppsMaMqdZS90bz7/RQotRuaj7S+bnHS9ETf4L65+7qtYW7SvFpCYHDn3HpKQ
 Hg7fGEwzxrrVeMVnyzQGPXTxO7RihqX9jyLpsQS9I2oxLGajvNCRrVVOvASzIZWmein3
 VLXw==
X-Gm-Message-State: AOJu0YzyA97VdcndTU/a6FVHU7MSWWtmweFoVj9IH46CT976/VZ+0V2T
 DHXx0QUSVw/ODCOc/wZVcheWmy7teFa52HG201wO6Ey1MHK1WcgE8QIkUcEKtjTK8fT9yBynBdH
 RYsNvNtSBeaUpaJGMrUXYWYdoH+95H4V2HUbRB81al5aNOYILjUcK
X-Gm-Gg: AR+sD11GIwyyF567CuLewY2QpvBuovDVYx93dXAc5uXGhHB/LlFU6YtVNGU1eVUXK9e
 yHO5pv5ITqpgQg8zyHVD61Lb6kwGabnFjReiCNZ9mnTprWtKf5fT+EGqaHESvkEgOyEpkGl9bJf
 iVLiepWnEZwq6cYW3VWjyDxtprkhi+XBpErsQ2srEoqyWWe0p1Qdip9HsneIuhvIWuOtGRWM3Tj
 7qZc9IMvyzzUaQMzkiTJcJa7fb+2ZZT+UqLlu0b9FRzACBKKSzZAp9DsJ1ur2ZToYAGmaBUwQoJ
 1/K21tFv+zwjkh/BO/jSkeGXRSCwT0snxdU70wt3zWzZng==
X-Received: by 2002:a05:690c:e3c6:b0:80c:3848:bde5 with SMTP id
 00721157ae682-81ef22ca309mr40703187b3.13.1784536832835; Mon, 20 Jul 2026
 01:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260706173324.804340-1-peter.maydell@linaro.org>
In-Reply-To: <20260706173324.804340-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jul 2026 09:40:20 +0100
X-Gm-Features: AUfX_mzC09RSwO90MVs0Lc0hNhVQoye70CqtXuGEJju5bC9v4QVdZ-h38IgrMiM
Message-ID: <CAFEAcA-C4t+=KYiX5sk_Fj528u2MkB4AE74gC1yrWTzAxmTYew@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/display/exynos4210_find: Clamp windows to screen
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

Ping for code review, please?

thanks
-- PMM

On Mon, 6 Jul 2026 at 18:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The exynos4210_fimd device has a setup where the guest can program
> both the overall size of the LCD screen and also the corners of
> "windows" that define where the guest memory should appear on that
> screen. The current code assumes that the guest is sensible and
> puts the corners of windows inside the overall screen. If it doesn't
> then we will try to copy data to an address that is outside the
> interfal framebuffer memory that we allocate to be the size of the
> screen.
>
> This patchset clamps the window coordinates to be within the screen
> size. Patches 1 and 2 are simple refactorings to make the third
> patch easier to read.
>
> This fixes https://gitlab.com/qemu-project/qemu/-/work_items/3795
>
> thanks
> -- PMM
>
> Peter Maydell (3):
>   hw/display/exynos4210_fimd: Factor out finding screen width/height
>   hw/display/exynos4210_fimd: Pass width to draw_line functions
>   hw/display/exynos4210_fimd: Clamp windows to screen size
>
>  hw/display/exynos4210_fimd.c | 54 ++++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 15 deletions(-)

