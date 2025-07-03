Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp436644dyc;
        Thu, 3 Jul 2025 03:28:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2ccqL/29jp+w4cnMMihDrKP27BkCuiG80zvvMRfaDG2mx9FT/Vsg0nj/KjXcXUWMdZ3gytS0DZ0OyDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHt/wdftpRrUgE3K5YYQPVfhq/qNfJqjUZaKu9A8bYTQ12yOcvXins9xEldbPBgEbQH65vn
X-Received: by 2002:a05:620a:3913:b0:7d3:c381:f653 with SMTP id af79cd13be357-7d5d14b8e53mr454584385a.56.1751538532073;
        Thu, 03 Jul 2025 03:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538532; cv=none;
        d=google.com; s=arc-20240605;
        b=aUpF43Z6TT6e0pLc509Qni9j5vwZP1ctcgTau8uxODtHT6/RfOkWdi6fRK79OP+y3H
         ANzyEjePZEVkuk6blpJQ4XgM8bQtcjbwZktl0e+gGeVcQ8Q5KvO1bI5T+UG4VqlpNaDt
         BOrnDIyF9sQwt3x5gSGHSIKi6ESPxVUudCz8jOmHt8BgVY2r9gggClda9a525cV2EyaM
         pD1xeVFMXG4YjlatsZKzZG3LgAo/GLseRiPSK/aWwumEIvcci7SWZ0w+qSaoLUi0q3/D
         Q2adZrpn2S3z8bVvwmViE/vWhnlhom/P7oqz7Xp7nda3weH3q8uAfWrdjXn3fIxe2f1F
         jXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VLF4LAUrXSbe2p5iEiw/L4TFZFIHcrRHDsUgZdFn5Wk=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=Lf1J3vgJ+KV665rJ7nq6V5N1Hq9hVWpJ1xGDSbR/4RvWDeMfE4hfgJqi13QC8nfZMc
         a7+jtpHezoqE+6z3G8YJg8wEROuq4MncLMTzHSso2hwP4Ag9QM65bLUMxjDL7M7E3E/q
         e7cGcvE9ljpJyNgcYXzzuzlSck1db5d9tHbt83QoHMgNl2zNu9l/iFO3OQbSCQmd5FlO
         zHl9Fp2Qp/CN2NzwxxnCVENF7R20pR9I57biw4+1Epldh3CscLSIt+oeanl18dMkA6JE
         m+ZT79CjChBi8smYlu1XdT/KIkOwuNnC3edsy6eG2YrmYxMVkTVBawN8c0Qh+kerQzvq
         oN2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bR1qXxyt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a987ef6ed9si18830191cf.100.2025.07.03.03.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:28:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bR1qXxyt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXHBH-0004sL-Nz; Thu, 03 Jul 2025 06:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHBB-0004pG-OS
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 06:28:37 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHB7-0006jK-CD
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 06:28:32 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-714066c7bbbso88816797b3.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751538508; x=1752143308; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VLF4LAUrXSbe2p5iEiw/L4TFZFIHcrRHDsUgZdFn5Wk=;
 b=bR1qXxytjAjBIjYro2EtATUWcijo+SiRnvxz+Zl4/akoNTOO2Ibi7+KLn1QkrLB9Tw
 QbbWkRFaXkDQDkX0BVsJ/5oruxVXykLJk3lEkRsd5FskGas/fMPT5E+TE5vpqAmoUKa0
 hrI3iTkfPfuiF37Cm7dyjwe1awFde7FxeCi3MXu/0jJsryqJrBMxXv32mt8X0Sh6m9+x
 zePjkkbYmvkK+yGMAvF5bqiqnpUiyraVkn1xZRi2mSTc+r0hhYCHpvH8PAcDs0C5gYCO
 q8rm4KFU4bA0+Y1sAD3F2Mdd63wK9o/fe/QiTeRGtm56Goj5ll3dLlSr/E9dP8IZ6vZy
 6QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538508; x=1752143308;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VLF4LAUrXSbe2p5iEiw/L4TFZFIHcrRHDsUgZdFn5Wk=;
 b=qHA3+DJOX08OtIMmqyBvd5wO3hOFSqw5RcuYfrMvhxLsszvfFKR1Hngr2YhV5sAuK6
 hWqAWr4BnEejy2JFN3/Fq+BRFz+PDYFY6yZvlpa8g10BTxOCqfaCbsiqMB0X24aD1poT
 q6+tjYJxyHd7d9QjCZ8r3z9IC+micWSJrcTsF7m7PfDLb6aRYvvgmQ5gjeOIpZ1qqNRA
 26fYYUb2XRBdtkTbHtENKpXs6xgKUex9ep2zUyjxiDU0Pj3eC+qEa1ccGk8mej8XvdRn
 f2SHXUqJqj77eyKJ75JiLOz3Di9z/dJkW225qpqiRQFDX3X6YTV+H05biHr5E0zF6iTp
 BrrA==
X-Gm-Message-State: AOJu0YxCDh9LTwsGWfgZSwFGC1mf+FFH1ZyJlbXqQDW7OcXAi1fkqgcn
 vHWb+dHztSB6Bfvx3ZAcbYOtmKM/gSVpXmmPOoKigWVqAcq0UyPelePF1fiPeoGnPfQMsCOz+n7
 uFXQjvO/VqHQvHM0J5u+T43VZ9rz2SCA/7mRM5o2wm4hnMVbPDdkf
X-Gm-Gg: ASbGnctqaKBFAa0fKtXb2Okws2E6xZgstoIj8QMZV8yFl/r1ozCD1bXOy57it9RqsAG
 CVt7JojcYDDnv8v6ZUtuChzeiRMY9eBFr3uep4Pojg87eMGl0CANuVITTlWpJVSUjuqEZ3hG5MC
 H9/W8Sp5Syvr3He5ahJy7SuBwvwS6+KkOXbn3nJ12f/gdx
X-Received: by 2002:a05:690c:7349:b0:70f:83af:7db1 with SMTP id
 00721157ae682-716590ae5demr44497947b3.19.1751538507972; Thu, 03 Jul 2025
 03:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-55-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:28:16 +0100
X-Gm-Features: Ac12FXz7DbV4xPcqfft5dPRf7ZGrWiuPfmfYzyGjx54lfh6_wyzm0qks_Bvkrxg
Message-ID: <CAFEAcA9USb5fRreqGnEQHk8neLDCn8rAeMutjK5arvgkGu48zQ@mail.gmail.com>
Subject: Re: [PATCH v3 54/97] target/arm: Implement SME2 SQRSHR, UQRSHR,
 SQRSHRN
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HnrexO/KiNtH

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h    |  20 ++++++
>  target/arm/tcg/sme_helper.c    | 120 +++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c |  33 +++++++++
>  target/arm/tcg/sme.decode      |  37 ++++++++++
>  4 files changed, 210 insertions(+)

Bounds check and H macro usage again; otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
