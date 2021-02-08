Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1369309lfc;
        Mon, 8 Feb 2021 09:57:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1QbMAozoqJw1WHSiFMNkD1vRo//ijGEG2rtD16NamBP1xPcttmQVUEC8ayc86Ldz688Lx
X-Received: by 2002:a25:6c08:: with SMTP id h8mr26033698ybc.499.1612807037596;
        Mon, 08 Feb 2021 09:57:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612807037; cv=none;
        d=google.com; s=arc-20160816;
        b=YL6GjeXNDRXUUJ7giQWrPo8dYzrp2R31TKWRS0m6Z7yU+3UWEc+gKf5WNdE1ODvS4X
         mtU5K0vJr1OeX0JmC68WkW+yuLda5foj/eEX2RKiFOiQkeo6hRxOeOW45hUcEZVuXVeQ
         oXNKMw3lUIbBizzHs4LFtgQM57lpwi4dZjaZeI5dpc8ruXA9YCTCLUKgHixCx3V53SL3
         j6H8QxDF/wS88mNDlLoFNeoBAL68HS69/F1S3NENmnjY8/RAv80sYrVfNwFMYD2rViPF
         P0nTyt4hLCxk1dZzo0NA6Y6ap8vTB8mCdrrM1lAdP3fB6iKL3VLyzBXCmC188MNvuV5E
         A1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWjXdww6s047teLzesimAI0+q8BErK77u9WoURR4Kfo=;
        b=nXvI9Nu+FiKbFghxP6fuYCeRqoo+XhauvI7EItRJ8Ptw0ljDTBO+YJ9wJWvnP2kr1v
         ximah6f+vu2ut3y5/QUMeZEBeKuR0uDpRNhdBU7FdNeDhy7mLF+dKtrgugFidEqoqTPm
         l20kY/GRabd/Fg3wuzzcGsoAhaEvlxIzCLj0LakHefirWUM7HPYGYCd04ohkWkwXQ5FF
         VEQ6WGNOkb7LkkYeD+VVYQGHGF0TEuj+iuRf+n477lCyKQo63rA/4Dr2iTIxS2tRzOa7
         e7J0MBLyEupE8LcQZz4DJRkNVNKubR2K3zuKImFhs91IkxQORe+mWfFbvcEZAHat8MCn
         Jl1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yUp1fe+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si18188273ybp.314.2021.02.08.09.57.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 09:57:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yUp1fe+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9Ami-0005zx-VH
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 12:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96gm-0002bb-3C
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 08:34:52 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96gZ-0004KN-8e
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 08:34:46 -0500
Received: by mail-ej1-x62f.google.com with SMTP id sa23so24754050ejb.0
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 05:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DWjXdww6s047teLzesimAI0+q8BErK77u9WoURR4Kfo=;
 b=yUp1fe+l2KsKg0O4I/IUT2Bt3SWHKf2pUf93AucUIyAuNfq5PTsYEclIPR33aF3/Wc
 hfXKcHFPOpWvJrFrTEYLCoU2vy2OYZKyfeFPC3ze7GFatZKdCK+KcKHNLYZVv1iTJAcA
 19DGOa30nyWnfe2YFXxHj4SUXH1SE9Yit0gYgv7GX/Fsk49KQeX1KzmJXlF0tH5mCWAv
 llaCB1nmUOJvxlA0kOLenFLlt9roWqhGgfGA/A2CIiBl6UAARdhOtUetXVZziPMmz1yz
 y6/f6LM6lvoaAFpVOemziMl923OAUkRioxTK9556RSpIpp1eq2GoTb3RKOdUUrrNYo31
 rvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWjXdww6s047teLzesimAI0+q8BErK77u9WoURR4Kfo=;
 b=HfbiUXzH1YdV3m1o7Ygktnpji5fPYgdKog9XWZf4FTaE2cmu5jCRrfZDvYj7XQfYas
 Mbpnffx+njecgyRm2sa3g8AnEbCcGrig6XO2ToakSqqYJ5yjP7brQmJ2pbKYOjEXQTRB
 wnqjAAYjyIC+rvx1XcizOORbKFlctfLUsYuug0dfSGPvyoK0/NWa3G/7/iNDNFwneIUN
 OCC/6LSQyKG9O72AjFutZW4qkLJfqQIFoX0oNKnQe2rV+++5J49zEQ8ftp5K3yq37ymx
 nNohADsLt7qBEFYnbhKlqqCNTnqgsholeSOEA+vO0wRsBXFwyBQumCyNKUANpPUOyxNq
 Kqbg==
X-Gm-Message-State: AOAM533TIUrOeGKR+z4SC8cj7mx4JjFWZEIxkX0C9FH2BVNOEeEW9hgk
 DhIP9u0M43uQqEpBQ1/vFi1LIhSqMVeRwhJ29DCaig==
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr16932779ejh.85.1612791275828; 
 Mon, 08 Feb 2021 05:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-12-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:34:24 +0000
Message-ID: <CAFEAcA_aYKBMw+0br_qavLa9KdB67VH31sTR=tfd3Bd7iEbZdQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/31] exec: Introduce cpu_untagged_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 03lrR8Pr04XN

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Provide an identity fallback for target that do not
> use tagged addresses.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
