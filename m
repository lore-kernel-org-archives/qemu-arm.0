Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1272817lfm;
        Thu, 25 Jun 2020 06:05:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7K6uOXNtBmyC9HWdgQ+8ohdhnw6yCJBe93QXzE7R2USF9c6+EczorDLtyL6xw/G5I+7d4
X-Received: by 2002:a25:a08c:: with SMTP id y12mr49364584ybh.259.1593090353984;
        Thu, 25 Jun 2020 06:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593090353; cv=none;
        d=google.com; s=arc-20160816;
        b=pctdEa8ieJjiCpilf063roY3KL+6ucznH+2apVAzsnYSyBDm9SBBkQrMGmClF6/OUS
         I8/Iis7Qop2zntdIzdg+PrnFvGXSHMFzxQKq6MrXJlKrwTDBii+QBLLjo+eYMbKFVzMt
         t72Uq1wWZwa8tlGf6yim2K4hN53LJHOOiRTYxk4LiEpK0Xa1DeQWhB1BXW6pfPW2BLxd
         OR6RBj165uQIKjr8Czs++Emdc8pAcNxotxIUr0I2yaL8LO/GXxwv8tznrvFmiR0rzXmn
         CKsEJq0SBzg5QT46mBImmhgp92Y/kpo1GB/3c+jDhmHoCwZbSMbDVQ8uykglePfGYYVS
         hZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6MosTpj0KYh6C5cIssDj8St0IhW66gRZAKbDZaqO7M=;
        b=uirsmpMLHiWyIm5CBdkxs7rm3AbRPyI0+io2mpqKCn1zGfhKx6+mW3tKcNOBxIM47O
         BsO1NoxUN/cQEPKc5aSSJcneceGxMpay7RyyCs+igYDOMwiQXiY2k+Dn+1NDfHX4a7Ir
         WzQXHXK898kvlR9UD9TlWrDqVO1IxWMVOKtsCkcBf2oE+imwyz7JC2o+WU4UXWT9A0lk
         0PA2VaIAUUsc76gDroRO2yrmBXIJceBiNxtcds+Ex93MjyuVbdeaHwKavrLfiu/0dqfQ
         evE/1fEYiqZ9YFCyiE8zMZMGSW46m7y1gQBMKTEUMcH9cdV+Bf1n9gLmLBRrpJrwXCjr
         t+gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aANHhREW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e125si22390189ybe.416.2020.06.25.06.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 06:05:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aANHhREW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joRZh-0001ZJ-Bu
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 09:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRTX-0001p3-Nt
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:59:31 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRTV-0004IV-Iy
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:59:31 -0400
Received: by mail-ot1-x342.google.com with SMTP id 64so5131302oti.5
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q6MosTpj0KYh6C5cIssDj8St0IhW66gRZAKbDZaqO7M=;
 b=aANHhREWKc5pGrdwknAJhQIC4q5evhN/auv3seX4ZChGrODEOKXWgmxVS00GiHnVr5
 6gk1GLY5E0I5pvSlV4NAtLRyBocEVb5oh0HwpLjB3VhI2VK0UZ9Vg38z8mon6P7tnudh
 92FNQ8Fr6WxCURWUEyAYsePOSBq9a7aLwmimAYovmwMS1JwKbH77u6jhJMFegg5jZYpB
 fZ4plpm19B/BM/5YG8Q57ehvtKX0HtWc/ZoYOuC+YTGEr0UGPaJj8Kz2zVL+191qgWVQ
 A5bfzo3XEWJUdEEbmImLi4Y5YNUy0PS6LHQtjUXru1HnMCY/uOBepln9FO68gTzcQ/+M
 XW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q6MosTpj0KYh6C5cIssDj8St0IhW66gRZAKbDZaqO7M=;
 b=RuzU+5D00MI81HuUOzd8pImXQRXSuzRU+Ec1ddMHBg9cU9JaHu/2TlZqhBvzZW81sW
 umAc63+1LbIvbLAJYhn599p9nburlkWSFzo6E1L7mx0/MC2nSQspVQk3QwgEHLlWdg+N
 l2tjlmTvL+o1hkVgoeaZVeAZXo/KzDr/BzigNSxu04Mdj703oHSNhtCf2K8By6UnQsJI
 5Nb3Mcs2SZexdx0wtwojscm+gC68f5SPO2Cij5jiqNExG2NyXSdCijJnv08T139UPwP+
 t6aoCVqEa3py+ZyZ3T/gYDbDwTfzwbVZDy/R2VXYUBipK37qTCQZcd8OY3v1x4XoRyFn
 lwhw==
X-Gm-Message-State: AOAM533mOVE7FUe8gps+BrYeNMCqp3igMvTEHKWiod5/W5uXpRDmjSgE
 hjMwwcaE63D5WmhVCF4VojdTUjMfH/ZqdXt4M/vhhg==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr26466760oto.91.1593089968354; 
 Thu, 25 Jun 2020 05:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-43-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:59:17 +0100
Message-ID: <CAFEAcA838PPdJp6JROufjZ0bhtKQFBVQxym74Z6vqAVFdF+ZwQ@mail.gmail.com>
Subject: Re: [PATCH v8 42/45] target/arm: Cache the Tagged bit for a page in
 MemTxAttrs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWliLBTKideU

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This "bit" is a particular value of the page's MemAttr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v6: Test HCR_EL2.{DC,DCT}; test Stage2 attributes.
> v8: Fill in cacheattrs for S1 disabled; retain tagging when
>     combining attributes; set mte_tagging in arm_cpu_tlb_fill.
> ---
>  target/arm/helper.c     | 48 ++++++++++++++++++++++++++++++++++++++---
>  target/arm/tlb_helper.c |  5 +++++
>  2 files changed, 50 insertions(+), 3 deletions(-)

> +        } else if (access_type == MMU_INST_FETCH) {
> +            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
> +                memattr = 0xee;  /* Normal, WT, RA, NT */
> +            } else {
> +                memattr = 0x44;  /* Normal, NC, No */
> +            }
> +            cacheattrs->shareability = 2; /* outersharable */

"outer shareable"

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
