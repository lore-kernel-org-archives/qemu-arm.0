Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1597442lfu;
        Thu, 28 Apr 2022 02:36:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwimR8nMMQPubXPBZZlNaDIjttlBR5MrWUadqbRZcn1nwu6hQWOiyDefpCwp2Zb9AJcvfUs
X-Received: by 2002:a05:620a:4590:b0:69f:622d:4b2f with SMTP id bp16-20020a05620a459000b0069f622d4b2fmr10189808qkb.387.1651138612858;
        Thu, 28 Apr 2022 02:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651138612; cv=none;
        d=google.com; s=arc-20160816;
        b=dE6l2g1a03BvrHIvVEYm9yNDThS306mE2dPEek+D+EZA2ik+MR5fjtCTlh8zFBhcnY
         ALX1mM9B7TXPjCjx7pHRQ8/R1EEOSExU7AcFEvPHM/aG5Ef6/NCq9ZePTXQAZfyjQoX8
         VqWWKcaUY8fdjl3tc7773QlHuXzUH6Uh86VS/DmKCXVXkSBvo+a7lIV0Dk0+DOH0JeCX
         IAJFKuB9EpWanqnPxGH9TVbdvnPYOuGb0maICNu0V8f7bT3SO0VZcyiMgijQuqHGl0xS
         fUfbykwt5KSmvSsEvTPgYgpzhZzH/iFSX4aaozBFS1CYYo1bipBDTpINoo34I4EOZ6CN
         Qdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LEy1KS3T+65P49y83SSLj5HjpPbyHRIx2dV/hngyifs=;
        b=M3sWa+0/mtkB3SZF5QAuTXdcQwOS/zgxWb8YEmpWNO7MBvg7jF585Xvv7HIrTR9xVy
         WdP0djxiRgC1ynm8wlh3RyDSsNcm4pIOIk2VEPloaIQBiWAwgAbH0b7mmTyoxSFE10DF
         enuMNuMuZVjMXRvqDgeLCfkPW/2cwuT5wRAW9uVJGtnFRkT/Ww+iSHljGnBJ1Ny1KOFZ
         zzw8L0Xp6loEOspMXesoH9jqoVoENMT86nnS4vAAjDgETXTmQ9Nbz7t2Psxoviqs8TkF
         XMo+HTiBWDb4BCWUeo2oKSMMuUvnXnVB+Y4jjU70fge52/4SYifeeonXCM4Ego0bnNdh
         K26w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="wHtbwfS/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq12-20020a05620a468c00b00680ffd297b2si1516733qkb.89.2022.04.28.02.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 02:36:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="wHtbwfS/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk0Zw-0007Jw-Bz
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 05:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0Zh-0007JQ-Mz
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:36:37 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:40752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0Zg-0006WC-1r
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:36:37 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2f7ca2ce255so46184607b3.7
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 02:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LEy1KS3T+65P49y83SSLj5HjpPbyHRIx2dV/hngyifs=;
 b=wHtbwfS/6GUlL0oD9uaKnBO1Du60fCcDuBqb9Im1/s2HagKnopCCbhYdQ+w3AH1pbz
 Yo5/E1Iu4vnehZZWA4jY9/Rna2RoSouni6eoNuNycYKb+XP4DLiDAYsdKOF07Ufr6kbu
 bJ7TkJ2p6Z4C/LBB6x6hnpu4E1/qOnG34+0ejic1OcXeBvqMtJHzjF1alse2pOBlu+DL
 b39KaeyDFXppnhdIBEr8PJyyLodl33W1mH0oojHi4OPN2jvXPClVKHdbNdbfoymxnqBB
 6QaZ39vkdF+6PDHHo3dAtbYkPKD9gggeS+G+F+sMbOKqOP/3NMOEDqYAGqLlBjmMLphO
 5mVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LEy1KS3T+65P49y83SSLj5HjpPbyHRIx2dV/hngyifs=;
 b=0qCco46KCnsNaa+YlGtIDmrLSDM86eurVXWp5+s9ciTalnpKP7IGuHoRKIY7+mp8an
 ALvL3RiouIyWCzyJ9WFbW93d9cTkiMPjmyIvR2Qy3vkE+CBo00F56avLnEgyrAvnaa0i
 RRI4Cr9v6+UKRwwqmp6XWgcQaRiCd+d05BXT5YEWESSSS95wV6MnLCSS8fL/KYr8OtXq
 RFYPTsCkESLRrAK3suwVPZNaMRS0sg4CzI5C+8v9QHoqfIkxVBhGlvDb5MOTV6puRol8
 K5hRnyf1geiI9MpREv5uF5QaJRkwzCUHHZyaMJOoHSb/hTgIwUL/6fvvhHlmccpUqHep
 zipA==
X-Gm-Message-State: AOAM530BjNjHYI/XMfk9i3IEsH5t3S/sBbmEqb2/KQHphShS/sY7Jswr
 BiL6g+v8YMPhiSWOFB/XRXicnI2WT00SwseRjO7SqA==
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr31872687ywt.10.1651138590167; Thu, 28
 Apr 2022 02:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-2-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:36:18 +0100
Message-ID: <CAFEAcA-6SaBzELAQ6UePdBTdNH5C+1nuhRUu6QCQQs55Kt=OSg@mail.gmail.com>
Subject: Re: [PATCH 01/47] target/arm: Use tcg_constant in gen_probe_access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kxBg++c/aP+M

On Tue, 26 Apr 2022 at 17:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
