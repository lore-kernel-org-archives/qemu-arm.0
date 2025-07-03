Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp404145dyc;
        Thu, 3 Jul 2025 02:15:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRMAWg35Wcl2bCK8IjYr4Kdu+9DTPEzz8oduLEg5NSDONtb0/5wYeCFhzjS1qC+DC9PIcUTqv4j/JSvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEinVC7iMAlMB/ZbybzpAWyPtl23VijfFXjJBr7VDgQPDmBEb84hLw+xQLaoyyOydv0LsEx
X-Received: by 2002:a05:6214:20e6:b0:6f4:c422:53e7 with SMTP id 6a1803df08f44-702bc8a38f3mr46436296d6.8.1751534122010;
        Thu, 03 Jul 2025 02:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751534122; cv=none;
        d=google.com; s=arc-20240605;
        b=fUcEvJHAPNHOaMLonwRewgkfJr/Y8nvmUKNUN4QLbYS85dsnq6e+uKZh1OVkQ64etB
         jYWRIUaGQ8SmQcUPYKF+7xxKF95f1/7OtgvDC4CJg7CcMHI4+VrnP6hFqHJm+ey51bDF
         NFuvuJ7BKyqTOs6rXDBmQuGHG3HT+U5B43eo3xqejP+xWqKOwIPmE9OGt6+Ci50XpsCK
         d6dSPpkek9dTCFTbCSQvLRiTMw/yUbYzs1abPhbu5pRTUUJwjHfGdw2VRkbtyatUlgLe
         ETwd00gdQIMPqTnC0eEOFBUu6kUUdssNOqolhGVmbuGb6x6dEfOtt7WaNIayOO4slFQh
         hz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pGSkVMNGir5NqYN9mf3Je1X84Aau+Zt/mS3etMOmdhM=;
        fh=DbNNWI5YkwNRcVmMJvdQw67KWRbPYfyodZ5+dJp9du4=;
        b=EnJGbRrroSzOhb6ZtDaT26BTxNL6Igf8JV0xe31ae+RTExDzZIUFK7ruWHrYWVU+GC
         v2gaDsnC+FZMNZQ44uwcziQCFV8/fqR0UnfbmqT3p8xBsTY+DNqlVKYw/G6kNSuOvwUZ
         q0A0RxSXBa4zLLR/TfMb0WpqF+CISqQRqVJe/eSNt0f1Asahm64TIVIsLjuOnN27IRyN
         FvvZZnSaNmTV5gSJJYshLr6SJp4cdicHuvCa+TNnsXdQZQ9wOT1s+6PCMOPmSgjJAd5Z
         9uUsUdGfV2Z46sN6EDKU/SfJUEqR6rNhMO+LhSmVb34UwI62mkBXKOsgIsqFa+vsiBdh
         KRgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qgjx55Oe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77389c98si166392866d6.372.2025.07.03.02.15.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:15:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qgjx55Oe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXG1w-0004Fo-Rj; Thu, 03 Jul 2025 05:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXG1l-0004Ab-U1
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:14:46 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXG1j-0002gP-Dg
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:14:45 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e8276224c65so6891540276.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751534082; x=1752138882; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pGSkVMNGir5NqYN9mf3Je1X84Aau+Zt/mS3etMOmdhM=;
 b=Qgjx55OeqKAdq1mFJ/tGYZlzj16lcjOXibp32ykZAGWGc8YpJzfz+hKcbQfnCsRtob
 3v5QqUFSO0Hgh2FF/9sQMcoUnqtwd0Ng1vUJTCCj/NFaIajzSfUA08RrJH8EPfx6z+Qt
 Wm0qqhPQ7/bUUSiJ9Bj2cNJt/ZiM8dZvjGIcoBJzpCaKr/b5X23g+0xjRWr6OeRmtHv6
 uVLcNOtBseUkm5kfL/bdPg1Jdr6+joPM/y9hVN9VPym8Pw09wg3ip4Q/SAg9J8aLniCp
 CoI/wkyxK6oIIj0vXUcrOVNxM/kWpUnRR4Co8bYy+UWhjdzMKFadQxXKCTQUkLdFcPMp
 HkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751534082; x=1752138882;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pGSkVMNGir5NqYN9mf3Je1X84Aau+Zt/mS3etMOmdhM=;
 b=KLrCITOfuKSarvdYAVTyNgKazHM7kk1iutyCke3bplVmr/yBFzEzEsBr3d4wWPxPzz
 y0DMp3k4xgDKkTXBR4Q7HgZe1ZhreL1LhIn3D49p+rMHwq7Wo+7NXrBiXf8Oe6UtNmrQ
 kBn4lQWY9nPuih4+l8L9DHdp6qt7oLtXJjl9opn+KxeuDKzo5OB8ABtCq6xCIn9GYDWk
 rjVQRAYMfItJSHUPnk+u1WboB0IbZBobZE4EpSi2tZ6Z2E087VQhfRl9hN7HZjqWYITh
 WeUuzj4HuNdlgyIkNyWEpXjovrnNqarwQP9q/waFKV9PHsnvuTJFyFc2XaD7tcUv5Pag
 SrAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwCVlGkihOZ77vwaE2J+CtE+ilSpqVRxheyMEEpF6pzXOG8A4piA0qgmUMdPM4fGS4ThWSGSqIhQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy3QYl0BOyKXOrs/CDDqqtdwbrlFYcXs2+glKU7J9RsQ1tlDgh3
 XAlSLwTpoHln79egZp/VRHSMgcMqHzGXGXWIGTlCj90VfGzorwPrQcp9EQlsz6g5uGKhRsTd57m
 ssuhbLKUN8q+1MRZC9XE5AVF2fFl0dreZIWSSIvTQAA==
X-Gm-Gg: ASbGncum+fTsSAmOlALdPVcrES7vQtYldF5ge1G5vxvudrOz//LqdTPfrie50TqvdTl
 NUW4jEUdQkrRtssJyZWFUy1jkY9YJfokqKEuk9LGKk1pzH0VXj6NKLPpH5eZfRilqjNhpytz5W4
 cLjQkccbC8xi5Y6HJADGjVeyNasrcvLH2DPJ1fii6wBhC9
X-Received: by 2002:a05:690c:9b06:b0:714:691:6d1d with SMTP id
 00721157ae682-716590aecf7mr37960847b3.24.1751534081741; Thu, 03 Jul 2025
 02:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250702122213.758588-1-richard.henderson@linaro.org>
 <20250702122213.758588-5-richard.henderson@linaro.org>
In-Reply-To: <20250702122213.758588-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:14:30 +0100
X-Gm-Features: Ac12FXxydFfAJhHEDJzEFqG9DNUxbnmZQQLzqXDCJyLzg8-KyLgCHT196slmn68
Message-ID: <CAFEAcA_72=K-DZmkTMCjsL9unRzTFu+DKGKNFpw7-bvNhvu-4Q@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] target/arm: Replace @rda_rn_rm_e0 in sve.decode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0mfze6jJs07k

On Wed, 2 Jul 2025 at 13:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace @rda_rn_rm_e0 with @rda_rn_rm_ex, and require
> users to supply an explicit esz.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve.decode | 48 +++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
