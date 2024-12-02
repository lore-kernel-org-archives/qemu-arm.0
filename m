Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2878566njk;
        Mon, 2 Dec 2024 06:32:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU4/90yRqi2sHB8sUpn/YOIRd4byXRySeXXd0h3RCEoEOvRRNc+okujPCmIjYopAasBoaC1JjyDZc4Mqg==@linaro.org
X-Google-Smtp-Source: AGHT+IE+fXGWWzpeo3OLd2+MWeWWevILEUXjjL0sQ/uc5jNZsDc2Sh6h+u4A/sc/BUUEhiMkE/bF
X-Received: by 2002:a05:620a:260b:b0:7b1:880c:57fa with SMTP id af79cd13be357-7b67c483791mr3707125485a.52.1733149935250;
        Mon, 02 Dec 2024 06:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733149935; cv=none;
        d=google.com; s=arc-20240605;
        b=Yo83r6Vo8Td92b8JSKrXMfCk1DsvfRHbl2dJRDsxPGl2cih43Q1woVwW4MHtWMcYFV
         pLrzy5yn86GEyOU03N860Jd/NlhITAYII+2jdOBfGeXQY+NtXvvZTqPu5oBkB0BPFLnR
         T6kkYlnQ1ILuWGfWazmHWjaYR9VcScNc+6HISrJ7u41YxrWr9vDmU4clpRSNGMEc+dE7
         in61lhQdIkG+dFJR5qNgF+KEiuyP2fhTvbmXCPcDEVDQmzC+ofoozV7jSZV5zZEATdaz
         U1y0+lokB6QMz3BQ8RvNPqIkpztdB/aFAimQTntvUN2R5Ye1WEhveu78IBSVsWPojjUQ
         gCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1FYSXYPJcRHSBi1DPhDtMCSULWcP6bgBEGvBAIkPXvg=;
        fh=oBWz5o3wmwO90hO8/05Y46a0A6d4ZG/ZWJjQNFVuDao=;
        b=B1JYwUAgC3EDrhwAKzjt+zkybJsB9q2wjM+9Vc9OvLURhA/llc1wO3BWHUlPCn/PyN
         5A7cyLnkN1PjpdKPQkxT/5FVZZxw5lwugNZ1OViDj9LvFy7DEtBn6kVwPnsaykuahXBv
         +xrcmtu1dQHd6YQf7BHQg90WVsuHBwmvdu7NpE8SpOp1OmAWWj99B+CW3n6VBveeThPa
         HtKBoW06kBOLOLopvNhgtYDTLYCje5ok2KRM9HFavx1w4+uYFDZKrCO907faE13088vX
         hT6ydYhUxnSbsbsCgiPus99PsYiNeW4v/yB3Q3jPrVSNOptzwC9ztSrLPRbViuiVuhzn
         hbRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkkIm1wu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849f778dsi1153790685a.671.2024.12.02.06.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 06:32:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkkIm1wu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI7Ss-00022x-Ob; Mon, 02 Dec 2024 09:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tI7Sr-00022f-GC
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:31:53 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tI7Sp-0003nr-Ur
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:31:53 -0500
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ffa974b2b0so42563391fa.3
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 06:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733149909; x=1733754709; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1FYSXYPJcRHSBi1DPhDtMCSULWcP6bgBEGvBAIkPXvg=;
 b=dkkIm1wuDml5gIL6ashUiUKdj/82+mDw+zwHabRt1rNUHIJspNiR1LOC6rE1y9H/6z
 dlzhJDAtWCT7sbUMRxGsw+kr9sAcr5QmCl/xUNMxeKaSccE4uVo8iiGSOCi2ENXHBi+q
 Dx9IX/0xWr86tdKGjLcLKxnkMDgOieVPzSk9AVAoTlNYvSsGSS5AhNSc5rwdCYP+T/NA
 +T/fNaDnX9iUkHDlHyZyjk9EzCvI7ZF0xOQGPJMJw1PwkcQsspwS5eJXHg78H6cAnwZ/
 arPPqaHozDQdDjOl1PiON+TLK1iECQADNxjL/m5I5J+lAuIQrsOheEgVSJe7tpWhYQR/
 CXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149909; x=1733754709;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1FYSXYPJcRHSBi1DPhDtMCSULWcP6bgBEGvBAIkPXvg=;
 b=COyOMRlWdXOQukQzLBMqiMyg6nFmZy74QuXOB8XhGlq+qA9ucMlLXbp04fKKb4AodG
 7nOkALn/jmKPZYNrzBzw54HQQdAIepe2JvXaGlqgApNAFbzOK2CZyIAl1HCCTWwvD7j8
 naQzIRYRfnLs5FaEaCNPj6lyjAnwoOmrHEsWzsmD+JE5JmdDQCUBzjSJZCUhHQdvfewh
 J8RiXklIGw5thdQLuRwpXMsDrhWVKBCXn8uiySY5VUlvJVdu4CpgmlMKWkW5T5jR2alK
 txv9K8Y35bnB009K3fZ5bsM5rw741COrQ5c0VK/3nTd+5roHvBMsIfxtvUwLLLUbtDbY
 vdfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCBY/hEQ2frp5P6jWuKmswfJJMbLF5nYtgfCrnmg9DwtjEWGXRYsn7zNWpzY5KPsBh/8TBeYdd6Q==@nongnu.org
X-Gm-Message-State: AOJu0YxL9SZhXWlw2eIwLRl3om94rlrLKc+zy4pEsjdADCp8ZNf++yeE
 kf3Jl2iF7VBOrwOihs3h+EkhE7o1B2lR2cZhuuy+8YX538PXUmoJdfJDY7XqResB6/DTH5yiERO
 nS0rxlh1EKRAtwbJ7oG7L10PdtU6Fx0etRoYHBw==
X-Gm-Gg: ASbGncsNmb41kCeCrZ2fEXKS28YybsILN0I3bfoWPbN4vhDNlrhmOdP2vZngtHLaTni
 P0ok2A+sRdC/nzGIZCCz0mRMiLbgqXCp5
X-Received: by 2002:a2e:bc22:0:b0:2ff:a5cc:3ede with SMTP id
 38308e7fff4ca-2ffd604a2a6mr127309661fa.6.1733149908623; Mon, 02 Dec 2024
 06:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20241102125724.532843-1-shentey@gmail.com>
 <20241102125724.532843-2-shentey@gmail.com>
In-Reply-To: <20241102125724.532843-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2024 14:31:37 +0000
Message-ID: <CAFEAcA9xzkP=RmrHuKkXLRHAc5PXBVgPPRZ1KrJAps_OWt=s5w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/net/lan9118: Extract lan9118_phy
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 Guenter Roeck <linux@roeck-us.net>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
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
X-TUID: Jf3asCyCEO0s

On Sat, 2 Nov 2024 at 12:57, Bernhard Beschow <shentey@gmail.com> wrote:
>
> A very similar implementation of the same device exists in imx_fec. Prepare for
> a common implementation by extracting a device model into its own files.
>
> Some migration state has been moved into the new device model which breaks
> migration compatibility for the following machines:
> * smdkc210
> * realview-*
> * vexpress-*
> * kzm
> * mps2-*
>
> While breaking migration ABI, fix the size of the MII registers to be 16 bit,
> as defined by IEEE 802.3u.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
