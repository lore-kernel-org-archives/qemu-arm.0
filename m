Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4435004lfm;
        Tue, 25 May 2021 05:35:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe0sV/XU5b7P17fltBAGAHqj0HvoBZ4e7D7Xm4l57I8kBxxcJPG+olINGG5v92YHqTxZ+j
X-Received: by 2002:a67:eb53:: with SMTP id x19mr24001389vso.28.1621946099312;
        Tue, 25 May 2021 05:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621946099; cv=none;
        d=google.com; s=arc-20160816;
        b=MQuHoJ1MvkPgqMOgEdGt+yNB5Fwh/lYBBKpiGY5bOPeBqniiHzfvvSPxtJ8q1k9q8M
         UCZMHkW0un2yx5gDkMVFxXomi050k+BwfuYgCxRMsYwQJISQB7z19oBdA3MF5G3ss1wx
         4t3Q6frv/V7yMFzxb3QmT+Hdw3OHO5z8O4Q179l4QuHt6EnwnsUEZsbuZbr+GS8VL/jF
         G4t8izNYn92d1IHj5u2Iz7Hxf/B+HNq8T5kv43P5WXUEPMIKZdrGUmx/hQys4JKC4Hl+
         1ck4e0ETMq8k7SmJMJXd8wPGDbpLpKWFa17czDSqG5nCt9i8CjVjZE6svhEqJpH7JLwr
         UPIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mmmwMRaz9Wf79lG7wsU2BHRoMM0Aqs887we5fHHQH0s=;
        b=Lgin8k2fHAgv++UVdHhvVvCoMnp7Ccf9cWWyG40UYu3y45WjaZe2uVUMfo5Ev6GYrx
         4AAsIxF9byv4LSxbXRgDi79lQJQtErvVD4Hks0Id4kAF1IWbF8lp0QjYGiHzmk3f2GO0
         uC/mBbHfATF9ED6c8YL4l69a8kSOqA5IbvLzdW3k2nrpTXOmLq1q2quDpiAxiPIwNJrf
         NKF7noMEZnIiGETtJQjNGxhMshTwzQGQNErNvyjHb7wCt0/9+LNr2ZfXUk2Cl5Z3u+Aq
         1hCoinEtGWYoMfwUNPQeuGxYvFw0WLdfTeZVwafsdKFqlkkecRvs8ipVBI1lVroUckfv
         k8Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FpWvb6gD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si3989494vsr.375.2021.05.25.05.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 05:34:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FpWvb6gD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llWGw-0004Qa-KR
	for alex.bennee@linaro.org; Tue, 25 May 2021 08:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llWFo-0003jv-6R
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:33:48 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llWFm-00037Q-Hw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:33:47 -0400
Received: by mail-ed1-x533.google.com with SMTP id h16so35950914edr.6
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mmmwMRaz9Wf79lG7wsU2BHRoMM0Aqs887we5fHHQH0s=;
 b=FpWvb6gDbGGU+tF0zuV/hN6y89SY0P8r9tmwFa7g75vQNTqkKTCQjuD7FtKXzZoEFn
 yaRQG0q2ANwLnHGEu6pF5G+Kv+ktctZ8gnmglX/wevb+uYC3dwYl9l++zfrFDrZmhUex
 vbi2f4MIGyH1/seZViyPsWfbGVbX1oGKgik9rFSoMxIIUBVokI/dtrLkGpzr3U+bJWfK
 3tNAU4fRxschLrOUUnEPtOQY0ABsmMcoPs9uUdZZZ0evv0LuhBtoXwsopQgfLUu16MKw
 afmn9VVoZ21Q1R3G+S8u5YdhMY2x8/Ue5XPYuYBJ3+i4Tacwe20okw3RTHQbs4TtqbWQ
 PlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mmmwMRaz9Wf79lG7wsU2BHRoMM0Aqs887we5fHHQH0s=;
 b=aZEChadBSH6bOb8eBqFrkSfpGwDT+UeNe40nUFNlEGRyfJGOF/AGLHBT3qCFx1X+tw
 qa4ai8KeztAzPoWO+kxVsOKCYsgIRa2CZDzDFKdPFTCW6r0ur07zY0bxvJVWA/sliGWj
 LToc4XpvTP8HJ1MyjGc9Ju2Kxnqid99OaQr27yRnB+RnoMpMUlhifmKs+lyZJR7y4qN+
 jYTsPT90TA3ZbE+8bsQgAcaYDORo66yP9RdgCOwZyDFccZd3XncuwazAR2zHwbccSVJy
 Bo8VYCGMXKkaGl4J4C+i1WodSUveBC+YsOi84ZKgjCmjQLcACEoXXNLV0o7Et1TltDxH
 es0w==
X-Gm-Message-State: AOAM532DWOyDSALwMoM0dY3WTwrQ3hADw0+gi97IL+0xmljYcNNzQOfx
 Luo00yDWtc/6dmiIXaw+sSwcuHtuttAvWavJG6Mphg==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr30778409edd.251.1621946024976; 
 Tue, 25 May 2021 05:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210525010358.152808-1-richard.henderson@linaro.org>
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 13:33:21 +0100
Message-ID: <CAFEAcA-t3bCVnzDnUZzvYTf3Wi+GHO6Q3SHDDHybtJ8s6eW4vw@mail.gmail.com>
Subject: Re: [PATCH v7 00/92] target/arm: Implement SVE2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AQfhR5YnWyJW

On Tue, 25 May 2021 at 02:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v7:
>   * Incorporate patch review, some of which broke out new patches.
>   * Recover 4 patches which somehow got dropped during the v6 rebase.
>     This should have been caught by risu testing, but I must have
>     thought the rebase trivial enough to skip that step.  Oops.
>
> The patches lacking r-b are:
>
>  06-target-arm-Implement-SVE2-saturating-rounding-bit.patch
>  48-target-arm-Use-correct-output-type-for-gvec_sdot_.patch
>  60-target-arm-Implement-SVE2-multiply-add-long-index.patch
>  61-target-arm-Implement-SVE2-integer-multiply-long-i.patch
>  62-target-arm-Implement-SVE2-complex-integer-multipl.patch
>  63-target-arm-Implement-SVE2-complex-integer-dot-pro.patch
>  64-target-arm-Macroize-helper_gvec_-s-u-dot_-b-h.patch
>  65-target-arm-Macroize-helper_gvec_-s-u-dot_idx_-b-h.patch
>  75-target-arm-Implement-SVE2-FLOGB.patch
>  76-target-arm-Share-table-of-sve-load-functions.patch
>  77-target-arm-Tidy-do_ldrq.patch
>  81-target-arm-Move-endian-adjustment-macros-to-vec_i.patch
>  86-target-arm-Fix-decode-for-VDOT-indexed.patch
>  87-target-arm-Split-out-do_neon_ddda.patch
>  92-target-arm-Enable-SVE2-and-related-extensions.patch
>

I've reviewed the patches that were missing review and applied
the whole thing to target-arm.next; thanks.

-- PMM
