Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1597711lfu;
        Thu, 28 Apr 2022 02:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIAnVssbRs+gVrAm12LxTA6h+SAoxirr9mG2UpFQf8Jh9xoeTehKtTNwr2gxmFzH6zmbqv
X-Received: by 2002:a05:6214:27c8:b0:446:4b4f:ee5c with SMTP id ge8-20020a05621427c800b004464b4fee5cmr23807497qvb.3.1651138653608;
        Thu, 28 Apr 2022 02:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651138653; cv=none;
        d=google.com; s=arc-20160816;
        b=XAaPIIK0F18jXYMnc2gCXm7zCJ5m29/KPpnJCjjIDbxkd0BuOOtajr+qN9eiqM6P54
         oB7IlI1pFm8RwpQg+LHBinTjhTYPB+0EHW9Wa016HGFgpbK42pa8MphxG6Z71yRlFZq4
         NAojnjlWJJrjnMiUGsvUHBtUQBDYn7M4alQ5/GlGNRsZAEB9lobJSEpTWwGiM2okTj8s
         k7Bpp2Kg2KEbadZAVSI5OSk1afpV6JEw1TWeOHwbJXPCwpURR+s9aqBoCQGmLqph03fr
         Ry3WG0MTeixv7IeUmIL4Jk4UvYh3b5CtfGWXROZAh0OWQXOAObmiC0+fWkqrlWXoG4nm
         Z22g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/U8Y+5VJQJlv/bkcVEgTJN9v3lp9VOytkHG7POenUYs=;
        b=isBka7yMyjNDDl7RHuQFbJ+GxrMyc2R6M1/XGM37YTWO63R3miWUDdy8XaZ3G79hqo
         I2f030P4qqHtTaqsrIGNXBYFFCKt349VBUC9yh5T+K+sVTpH+kd2ZycwXzj1bUMfYY4/
         g743y7axb6XWuNwZLT9qk6fSlZTo7Wa5ATclQniFI/kaKUdE39ovelESJseQYjxXYVNC
         qRzuY07brVGexDV+sDRhlxAJmfv1VNlpCCQ4FFMYwNocKgiKuJcMb8wil7eA1bm0BtUX
         zRpOVgxf1fYEjxZ1a3rpFMmd2oaPEa9uLD7gTsy3LXFyg53oDg9Ov+rdMP6ht8wXyNek
         XFiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ntottCfC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i198-20020a379fcf000000b0069df30e85easi1355626qke.385.2022.04.28.02.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 02:37:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ntottCfC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk0aa-0007zy-4z
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 05:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0aB-0007xq-MX
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:37:07 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:37739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0aA-0006Yq-40
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:37:07 -0400
Received: by mail-yb1-xb32.google.com with SMTP id d12so7963805ybc.4
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 02:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/U8Y+5VJQJlv/bkcVEgTJN9v3lp9VOytkHG7POenUYs=;
 b=ntottCfCJHAQn/T2u1UePoZ+0mFyyZBRnTz/YBr9ywXCihx3279+yl/cghJ/7PFDZf
 jHu0X+GNTZnLAhVmCgId3z8T6m2dkRnPvtTLEqtowYY91CWZCwTVw3CFPIolwjH/8N9a
 ttlfPjjxWPFdnh3x2vl2WAnAq9glOCJRlcY8Ad7sR4yQP7uOiCFxNAhUjr/MHtQbV7HB
 UcTQ5KJgq8qvrVB5rWqXYsTS4qQqr+LGpwI4VwRkdiBwAiM0Ekb29WJcD9YjNj4IS2MN
 PUmIqiipzE7zJ6eWDG5Sif9RQR6wzuaD7t1JDax9ooWQiVJ16yh4/FeuLg3XW0nLhax0
 CYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/U8Y+5VJQJlv/bkcVEgTJN9v3lp9VOytkHG7POenUYs=;
 b=KY80DNyyY+YaLG8LKRIPjOFwg1SlAFldUS8f+YlckHeNtJ1QWM+33OMJy7kYxoa2MD
 6gQyhcJqbpxS+DlDu8iYz3hOH3CXmog7euv1F/zvIHpBmKDBu9jJGtLq4l2bSlz5LGw5
 Mr1urRdezIEl6L5VaadQgwdla3oyWHxDSs7PTOzkSUJ3el29Pt7gV+n+6FI7hakY2SJL
 B989jNJ9jGtUJMFd+K+Z+vLv3/iy+awrOB81dcepvWE2asJGDn5aZbA6viyzEh8UBkyM
 1dwqcNQ0/9aVF1/dxhik95e4H80ETzS8NJsUu6dauYWmC3+YD033oBpsaeGLTjoEbxSc
 kQ2Q==
X-Gm-Message-State: AOAM533l6iTt0zztTC3TvajfpBUp4BhdQiZOh3Ybm/6wvHIcf5mQ7LKi
 CwxpAbmrpTHHbzGeINfMo03hwbmtsKjAvAWDXaVzSzBclmk=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr28693339ybg.140.1651138625283; Thu, 28
 Apr 2022 02:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-3-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:36:54 +0100
Message-ID: <CAFEAcA-cSWRezf2G3AL3C+b1D3y8GBOn7Fm-FLHzm_xiGKO44g@mail.gmail.com>
Subject: Re: [PATCH 02/47] target/arm: Use tcg_constant in gen_mte_check*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EOekmmmzyT9H

On Tue, 26 Apr 2022 at 17:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
