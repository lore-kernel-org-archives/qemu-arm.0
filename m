Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2262721ejn;
        Mon, 17 Oct 2022 02:54:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4rodIebLZQQc6VOwww5otYT7VDGWtbR7sxvaK7jiiy5dcUnVL4XkLsLA0IJFE1tTFm1ce4
X-Received: by 2002:a05:6214:29eb:b0:4af:b287:8ff6 with SMTP id jv11-20020a05621429eb00b004afb2878ff6mr7577345qvb.65.1666000453368;
        Mon, 17 Oct 2022 02:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666000453; cv=none;
        d=google.com; s=arc-20160816;
        b=VBsfJ7O5pBUyDtLJtLS7qEjv99wYPqKBNPPzsLWvARuB+TZ/hbz1qWSwmdUVCyRQqq
         IfWKYSmeUKGrPV1lKZ3UWjevbF2TungOxYmJKm6fxMDo1dcWdImVOTne2xUAZQuKubvx
         nFUWhmpwmNUnoqqojz3wM5bhW5PEU3ju0K9XPyWcxCvxnjY6TUW5N5z/A3v+W5OP92XM
         pXAX04gbyv8bEGkIXaHPPrwEC5Kk4H7bkKSezOJednM2Hq9kfYp6GNqYF3MKm2W5XErf
         OL6FJNwtFCjJQ3KzhHwseQMVc2pJVcU6xUeHeEQTXRe5M4bJ9cDmB7dD1tdQgb8KieI+
         vCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=InBEvrR5F1yAb7upyuC8RjxehX9cAs/sZp2Ps7/s6zo=;
        b=KIMUlZUBHMumUh80t4blV1PHr6WJXKGw9c7ydVi+8V1BeVeu2vlmRb/tK8a0GaV2g6
         jhc6OVuM/t9hW1ZAcCMvDSXzWxYBtUqAhz7xWNGbsm5GS3LoaNLqEaDVlRuLDQt99iw6
         LlYiSk70xe/UCsA6a4VdRLvecLJL8/CcnrA7Dck3CzMwWUnYeC6YrOtnLSVp2aeIeasU
         lNFHMGD3NYUOo2kKpQLpzZrChaX+WUPd+rDlmPhmLA4iUG7pnCTB6YHY6frmWxEqC2fk
         fpwiglhRDYu0P2huMmgu7r24TnFZ6MZVYlPqWrmoBPQtHI+pJiUdLZgupJJlkjHjl5vp
         2KlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cPCDLijD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85953000000b00399155bfd0esi6084206qtz.311.2022.10.17.02.54.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 02:54:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cPCDLijD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okMp0-0000C2-Jv
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 05:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okMoW-00008T-8B
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 05:53:41 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okMoU-0006qB-B4
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 05:53:39 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 129so9994983pgc.5
 for <qemu-arm@nongnu.org>; Mon, 17 Oct 2022 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=InBEvrR5F1yAb7upyuC8RjxehX9cAs/sZp2Ps7/s6zo=;
 b=cPCDLijDDwMfeSNPextX7P28t9c5f0uYHwJtvlpjh91pI5qSWuXvPYyNdF+xf4wFik
 MDmicUxq6AGpvsw8sEFv7YPrLNdcbajAi6puut9teHgkwZIM1OXOWAo8J1hmtW+jUWV8
 WWYzDnLWoSlCaZliB1Za++fDt/WbtnREOSfHJ3mJlJZ2uVqVyxfQ3PVWM6ZWvbnQ6cmQ
 K9eFz/P0wGEFTH24RWF44tojUdiU2eqpzVlPtkUEGfti4j1JJPCz85C/FxjWakl4stHL
 FJV6Xwyq97tbKXLF7fqg8GXyJEOar+50XvdMHCXywlaHneIF6Drhkx/e09O/nuAOkGlG
 NgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=InBEvrR5F1yAb7upyuC8RjxehX9cAs/sZp2Ps7/s6zo=;
 b=DZ8LfxhlsvJQDO/2SM22obe/3W+rcFhzdc9zbrSJukkamffOl7KvvVpfqzIPlyWfLY
 JltLC5QV8+Uhjenq9/sfEgEIGOk8kCYoH9QnTXgbdjP8jerf9RLB2N1rpvH1AIuOipAR
 tyheqPHjaky775qvpRz/JdB+LRRbF0YWghMPkVnH95AzoUwaCnjs0AQeXcmhmH3M6ZRE
 DlEYtTCMuUPm+fMDCGN7ZoGRxguUV24X63YOjOz+xk7GJGIjJAAWtXsR8PzH0atUjwxQ
 Nl4nAeQLnFHhqaBw1/cC1eszrnHCi6aZidpGH5HnAYLUnCHPTPqpzMd0ihv80zkk2O+X
 lgSg==
X-Gm-Message-State: ACrzQf3VkzsYCsIzbedSuP7aj13rUVhv4jhd24eR2fawL90idJr1crxv
 StnFKdzOwTvkdom/vZ8LgJkGPdoanjqnsDeA+l0ePQ==
X-Received: by 2002:a05:6a00:1595:b0:563:8fb6:ae53 with SMTP id
 u21-20020a056a00159500b005638fb6ae53mr11731076pfk.51.1666000415670; Mon, 17
 Oct 2022 02:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-8-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 10:53:24 +0100
Message-ID: <CAFEAcA-6foX1onAD7e66BDwYUsWmF+u0G=9KNjTtZepZ9ja_3Q@mail.gmail.com>
Subject: Re: [PATCH v4 07/24] target/arm: Split out S1Translate type
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lOdjMdKirZ2T

On Tue, 11 Oct 2022 at 04:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Consolidate most of the inputs and outputs of S1_ptw_translate
> into a single structure.  Plumb this through arm_ld*_ptw from
> the controlling get_phys_addr_* routine.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Replaces a different S1TranslateResult patch, and plumbs the
>     structure further out in the function call tree.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
