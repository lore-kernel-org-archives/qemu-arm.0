Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4059DEC01D4
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Mar 2026 11:53:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w4dpv-00074O-FZ; Mon, 23 Mar 2026 07:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dpt-00070B-JD
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:52:45 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dpr-0002ae-P2
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:52:45 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-794719afcd4so33474357b3.1
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2026 04:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774266763; cv=none;
 d=google.com; s=arc-20240605;
 b=WQai7XFh9aa/GOV52gVI9j/iFfN4zUWiIp7DDKhjlt7mwV513JlCx20aEzfAN6NTrg
 E6LBknKYU3I1jQruqltC0/TUgPFWxUBViYdRFVoUpTWpjHOafevcpLLYsh2m3FQtvOif
 Atevm/c59WU6+3xKjAC6tzW4mJL/iBQno4LNd+qfE8kN4uicnVNuwipFwBXMy+tiOkPF
 3Q6pGz5vEPx3yl2Onaxt1jfj/LJEKYgIsvdDqyjJ/wBFktAfF2fG0IB+H+m2hYyBQVOa
 1u0arOwpHhRlEZ7agQ+lv7sTg0xSGdu12zMW5Lf/uJe+CCVG3CXV1iDS0+Fz91micTJK
 nfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gGqQMEt2AfULCoaSIfJ77Iq8a7/3Li/Hgp3I9lr/Jf4=;
 fh=HfUzUDJ6+4k3aJ2R0vOBBFDPGHn2bxcHRgMvOmphbl8=;
 b=DeccwiVGN+aGS7eQ61RTI1Jl9k5a47piOBGQBBRBEHkunkEtdycQ+PNb4H7emQI1bx
 yV9dAL8YFpmm9PY7KpH0AKRggjorD8DkOLCHs6g9Dxhwm7lL6EINrSs5AI4EORucof6B
 I5zSthHn35v7Xb3011im18mlI9WsNp8spbBIVauYBLgPE7tPUDImFvzBxJYOGM7Sw52r
 Coel+Qg9EBWBt3o0LJowxsLnX4azFhVQUT3wkg/pQ2x3IXr3881Y1YXGiqsyfFpOiDTa
 34rAf7mrGTBeurVa4IE/w47LttGBK5PKgLBZl1XfKLVAag3DQuheCtyN1qeBijIbI+Hn
 3nKA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774266763; x=1774871563; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gGqQMEt2AfULCoaSIfJ77Iq8a7/3Li/Hgp3I9lr/Jf4=;
 b=rUi+liPw81kgOR7umV3zZZBspGztcLJO/08Jq+39pfTxiViPg80VLddK6/Z85yYyxZ
 sLY0Ivm9FU2nuon3OZ72RW2uHkc8TOL9WGQgiNqZHRhsvHjyDaadNVnjLXG9J17J6YhQ
 0ILHMrSmvhGWD5g6XD+Sou3T5t8PcRx/6gycSTaF3XDJHqeK4VXCjvldQbF42IwL6iVs
 NtjRwJQsArCVkFKKaS8E6zkSuqKRCO7ANWq6BseQeTNv0aQeDD2V+FNmzN2Q8UKgVIcA
 FUhRuBvc/Zu/2vnI+K+S9HBsNQFxSeeTUSzdoa3286OjUt9oqbcKkVA5cWEQL+ZF3qbF
 D1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774266763; x=1774871563;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGqQMEt2AfULCoaSIfJ77Iq8a7/3Li/Hgp3I9lr/Jf4=;
 b=SArE7oGl0DitzhkYfqRjom5+AqZpSJGBoDLL9JHzNErg9E4DY1GbgopM/zyW540oga
 YkCncSrjus5gUMnKfC4F9de4gEzHvsFl6dgyJ8z9jp+dFhUwC1p1NLDOkHFxJTgbaSEd
 g64GScrW5iEGxlxvjUPI9hSfendy9zNKCtTmRNXHUCk/Fg4SlcAj93eTggR9hZlXt6uG
 IZKuZhUUYW5xCM7J48Icl/ogpvabZuCYOY75Ho5U+nkMZW7UBJyPRgXKDwkTmOQvv2C2
 RlRRnt8xz+TbRQhX+WjmUwPgY4mLh7HB6WPmtsADaLHvNqBxvlGfJuBN/W9BNP6Ug774
 PbWQ==
X-Gm-Message-State: AOJu0Yx06UPlavFT9mCZome4f4F18Zc+qZgvkFi2ul+GBjUsu8WRLpoV
 HQWk45ZdhXhFnkK7hBm+/hzQgPj0witxplpIe9I3BVeibA3TEPaQcDk7/jTJXX+bX0+c2TYpqqK
 pDnc50SxvkXkYjirGx8nQuiJRQAez/AE+m0fMGxiHFg==
X-Gm-Gg: ATEYQzwcJgmg7wbbjkBSjeX0lkhAmvMfD7LkbB7hfbjSvXH5p2i4DNgDbUr64SBIgBy
 IU+4kzOBpZayh37H1HVHBT7rV1krGwbEABLs4yjXFGlN4eZRlKAH/0Jp1N0AANm6Jx729jYib1d
 mLAogcSbO74d/FH/eu2/APRxNG6tZgI/nIrO/oIRz1CHU7rh1pW92Aveq8kqY+oxICUBOAJmc3K
 BJjIai4PFzIOATJ0/yl1wC4VVt0wrkSTgjJCuR6BdyCXex8uVTbnNcP2D2ozpVncGOywjgxcwvf
 0cnBbBclRmU/pveid6oJU66zmb3e/tUlgkLVFjMfSgwLmMvzUN0PVXE1n8eXWbg24uenr59ElXF
 48Q==
X-Received: by 2002:a05:690c:348a:b0:79a:668a:b6e8 with SMTP id
 00721157ae682-79a90c567f1mr122755107b3.61.1774266762655; Mon, 23 Mar 2026
 04:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260321231916.2852653-1-josemartins90@gmail.com>
 <CAFEAcA8N4kMYW1zNmSpiMPXG-MUjh2awiZbZuFtOnqzRW+ir=w@mail.gmail.com>
 <CAC41xo14hePcRU_=FMug5tCfJjygo052EZc88MzBEukfcMxUyA@mail.gmail.com>
In-Reply-To: <CAC41xo14hePcRU_=FMug5tCfJjygo052EZc88MzBEukfcMxUyA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2026 11:52:30 +0000
X-Gm-Features: AaiRm51umNr6rLDPvUu6ZQ15F3-mpRe7_Cv-jpPhu2Gh-38BEMxr0jJD4Egl5JY
Message-ID: <CAFEAcA9Ntz=9_K00JtAz-JYUzBZfQxphgtG-iNanCXjvAeZvcA@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: fix s2prot not set for two-stage PMSA
 translations
To: Jose Martins <josemartins90@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Mon, 23 Mar 2026 at 11:33, Jose Martins <josemartins90@gmail.com> wrote:
>
> > Hmm? That commit doesn't add the s2prot field or touch the
> > get_phys_addr_twostage() function. I guess you mean
> > a811c5dafb7 ("target/arm: Implement get_S2prot_indirect") ?
>
> Yes, sorry about the confusion.
>
> > The code change looks correct:
>
> Perfect. Any other actions points on my side?

Nope; I'll pick the bugfix up to go into the 11.0 release.

-- PMM

