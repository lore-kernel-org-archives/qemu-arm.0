Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp402961dyc;
        Thu, 3 Jul 2025 02:12:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXelJHa3KLl32rzWlwWDrLftjA5OfpX+pTBPKBbordUHqNh4BLe5cztqWRzvFrpNlZ/VHCNCDGicWDn3A==@linaro.org
X-Google-Smtp-Source: AGHT+IFnpSZejuU4cB4MlcBrOHYM7BdnfYN7Pss1mm1pH6QBHNgHMBPUmuJ7/t8frxW0aaY2a4xJ
X-Received: by 2002:a05:6214:4ec6:b0:702:bd47:c83b with SMTP id 6a1803df08f44-702bd47c846mr25017796d6.45.1751533957981;
        Thu, 03 Jul 2025 02:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751533957; cv=none;
        d=google.com; s=arc-20240605;
        b=GSl6oV77yZAgL9KTaj+Tftr5YevrK5ftOtEUoJ8znh+597bmmZp4aK3a53VdwX0pgi
         9RmutplE9kHI0u6XsNjY2XwZi7Lx5vmBbWeSw0IWBtL0F+yHKD84Ux3EAdwFI8Xo+wIa
         RpomPVb4ROvvCw227wAwZHS8C8wzIQrmByhVdyCOYdHrwtzF94zHuUhH9cymJCB/pUe8
         HvLBff7cw1PbppNsyywnI58EYPxoWJhff//bs33RuHUTX790MLhkbw6Y4KJQ8pvWHePm
         rRK8g803Bx2O6AMWqU7HvAXY6Mt7KqZfPNjIF8fKrYZAIFl83HxWCPqBlsR3w/iCztPH
         LVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5KZmfKLAghyQ9OAoHmOFIfvZzaLpAgJw9UT2s2c7Npg=;
        fh=vtPvnbOHQfkJip3YfrGERNnwb9/Hj25z8Xgkt9ehWi8=;
        b=QUPrc0lmfhCwaa4frNsAQJqkAS22LOkbDXgF0VIW2X4+pVQko2EiT84vK5zAP1XwG6
         0QcWqBzU7aAjLzC9e67fBu6p88RM7ILqQMwUhwgWxbLhr1lH2fyuhNQjctNLTtuTj1ea
         /A2T4S+WRCkBxV5VaKJGoqN0EwBp9YsAlTegxXlXa5+zNswd2Xf1k52shsQkt0ZMAtxz
         LJKCr1APlCgoA6+kfPKK2M2o5g3hkelieFyA/LDSTTCyJ0xgKF6Zla91z5CsRYgSSR/5
         C1BDqoy5QmxCpkftMKsWI8rH1XUDqsTKbSsamnZtoPRMCbVEEI6FxHsCTeTNrhGBKkRN
         y1CA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FrN9lNfN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7736ba62si156551966d6.307.2025.07.03.02.12.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:12:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FrN9lNfN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXFzf-0002D5-Dp; Thu, 03 Jul 2025 05:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXFzU-0002As-51
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:12:27 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXFzS-0001sT-FI
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:12:23 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-714078015edso57985267b3.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751533940; x=1752138740; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5KZmfKLAghyQ9OAoHmOFIfvZzaLpAgJw9UT2s2c7Npg=;
 b=FrN9lNfNymJLza4NWu/VAfPeWrYlzTwI9wfjCb1BrWCcd4Cagww8UdcxO0b/SOS5cv
 uyGup7aDnG1agYmXNr7T/kLJGVu8hJdgLqrB1BTQe1ICCFLf6zyyEPtXMwwzkGnLiyPV
 sd9NhWRs0xNxRLVQluZu95Iz3/H37PyMC3rS75bvoRVn6xiXymWPT0FyS1dLz2bUysxP
 hYtohIV+zqIqeeYjw9hiebv+TdV6L+6VzdwWVoQCsBdEMFyss2Piofqxuv/3rkRaA7/T
 sMuWvWQmr5MRSFldXTZhFEl+8G8KTq1vHldEFQOmWWu6+BOfzx7K5mUKhUUuY2qqvUIU
 H16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751533940; x=1752138740;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5KZmfKLAghyQ9OAoHmOFIfvZzaLpAgJw9UT2s2c7Npg=;
 b=mjNeRK4QKrAz7mPqhGbdYaK9NXBv2PRjo4e5Fhbb2661L2c0mhKJ6yppYUK610vxdy
 qvvmjWWzmrId4aC8jrdjOBYoEM31ddxAwpj3kMAMHy4KcTE5qz0+Ck5Kck7cj7Qe0LJI
 xALIufs/1Xv6CD+Flr+/HDJ+hw1IWZjwhNt80slYzSdcxsgzAPyiOn5xFbcjxg1GKDU8
 4RKtYZtvhGoFk1OqQgUfmhROukWxqYaudYX04s6Fts/auRFwAkCXjPWt0H5tdXt0R8iT
 covjEJLkjjuuwpdniWMIrUP+Tog6s2823s8vhYX70zbFze7UMfiW78zhpKZTU2WxEVcE
 WB3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8xpzax/Y0mkh7VwoOIXSpwaEhpW4pjs7dBtXiPhlfY+fEYyejh/W/DZstEfFkQcOqeFPtwduisQ==@nongnu.org
X-Gm-Message-State: AOJu0YwAvNguXzyoF/DOC7x5fTrFqrZ+1WvWzB7zQP7GGxdrpu/MoXwV
 UAp9U095RGwo2E4O7bUaGYzluj+R0EwTwVFkTXOVGKVvPMFYdN/AdSkZSJ+Z5fRmUXUe+lSCeDv
 XgHnLgjjj6y5qAuJzn/OLP3wQznGZtcgVJ+ujbEcGWxBYkFwH2tc4
X-Gm-Gg: ASbGnct2tR4srQtT+7/4D3vjMAR6JpCuKURo+4aozap4XjYmRrVfuM7dtjDKvrbgPoh
 WkPVBmCJjM0mYOj+q8YoyZGdDCMktskudBqYbRV5Ty595KtJjNyLu0v0xrZVI91rbhG5oXZDbGa
 hhxciDH/Sa3X+YHJizNWnqgO1EKBOESvCO+hvlTVktAMr3
X-Received: by 2002:a05:690c:6710:b0:714:586:86fc with SMTP id
 00721157ae682-7164d2ca1eemr91668167b3.16.1751533939863; Thu, 03 Jul 2025
 02:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250702122213.758588-1-richard.henderson@linaro.org>
 <20250702122213.758588-9-richard.henderson@linaro.org>
In-Reply-To: <20250702122213.758588-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:12:08 +0100
X-Gm-Features: Ac12FXy8Te81mhgz1hJmN_W5ZPnJk3-Gh_HF9ZXA-1TQXsu70ZP73PyGbH2tJcI
Message-ID: <CAFEAcA_xThNK=V1_bVS7nAmqSsQUrtk9TY7mxmFwM58wTnyf_Q@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] target/arm: Fix f16_dotadd vs nan selection
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Cv/FFFr8/S1P

On Wed, 2 Jul 2025 at 13:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement FPProcessNaNs4 within f16_dotadd, rather than
> simply letting NaNs propagate through the function.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 3916841ac75 ("target/arm: Implement FMOPA, FMOPS (widening)")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sme_helper.c | 62 +++++++++++++++++++++++++++----------
>  1 file changed, 46 insertions(+), 16 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
