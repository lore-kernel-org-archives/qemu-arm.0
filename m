Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp457719ejb;
        Tue, 28 May 2024 05:35:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVR4Gg7XfsIPA9WXnvtEXIQ4hD/8Tvi8N02H26Pb59xyskuoj5pcyk2uVIPvSwB3pGZxob0ap3t6oBcN5zy5LbaC7leFM9/
X-Google-Smtp-Source: AGHT+IFmbb6huv7Z0C5uu55rRnnGK0sG4zZnexeINqOCfm36IPfDdGrOMxRzbCQ4ov2PROT96mOG
X-Received: by 2002:a05:6102:dcb:b0:486:5556:cbab with SMTP id ada2fe7eead31-48a666c60d5mr5522330137.11.1716899733789;
        Tue, 28 May 2024 05:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716899733; cv=none;
        d=google.com; s=arc-20160816;
        b=xTmx4SkXob4VbRPM4KrtDKCoovozU6yXFqTCkYXOCMUukYSnvJutbN2DjoIArjud/O
         5QSig+VR8Khds0xM3kJ0PmZURSFpuBDbma/MhF0kOCTd4fBHHqpBi0zwAQm6tJN9CYEc
         qzbrXUhV3JwKB2trREigZSMFQWszs14boatNYgbFCMn0XdhLlc0Jpo5hyGEh2QbB+4U1
         ggyHw0TkBujBLu0oyGz6WHLn91Rd7eQAZyBZfVYU3+0+z9LmcP5mC3xjMkWU8qxdpEM2
         HNLTDLAqZcnGyH2Lgc7pgxr/VE3e3Q1dW+FD1nvML62N3kmYA65eyZiK7husz2PHqHEI
         2tkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zPQJGZVkj+ZOIL77gz+4gcqhxWwm/fob5tu3Fa0fAL4=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=03CutZxMoZ8rbqMp129vYk2VExIFp5QtqC+4kUc48t8fY9T7jr45J3gYR+qMaTtNh8
         v/MSNIR919MmUdypIRkcAunT1dPvGHK7tjTwPBR/LXihAsYRrhO2pJ9pML+mHM01PaFl
         MaDRUnIFKzYNnRwBGsRBFAC8JzD2GNRYIcGINy9F2IyBmjbaWNW3S/AFYz0CM2ZT7CfF
         v4K+qMwLPyupf0P2b1QoclwbUkFswNbiwfYvKDgXl7GfzJ4sVmmFzewxku8M5CJz5MHC
         aMyvFSyFLky+qEj+xMKUrpNdbx8blmjUCUWJQdeDm7YQI5wPmbhyCu+W0bFHQzlqU5pF
         2dVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FvXyS2GI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48a3a352bcdsi2158567137.475.2024.05.28.05.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 05:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FvXyS2GI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sBw2u-0000n4-Ji; Tue, 28 May 2024 08:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBw2s-0000kA-FU
 for qemu-devel@nongnu.org; Tue, 28 May 2024 08:35:14 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBw2m-0004lv-AF
 for qemu-devel@nongnu.org; Tue, 28 May 2024 08:35:14 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57863a8f4b2so890322a12.0
 for <qemu-devel@nongnu.org>; Tue, 28 May 2024 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716899705; x=1717504505; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zPQJGZVkj+ZOIL77gz+4gcqhxWwm/fob5tu3Fa0fAL4=;
 b=FvXyS2GI9EAo0/FsvptXRRBKXfPZpEpfurhgtOxyFlXPjlgN6Swmjk2Z+4259MQRnO
 yTZo+V52LTBVjXQXQg4fCB2KDcpc+MJmFN4fja80iDOKU0aISKnpOVE9Lrh8ubyeX8QX
 6joKaRbX4Qj43InmbEhruEVZjyl4OxKHtn4hSy0QPpD2F3deyRCMYjg8MMwhYsk2jGF5
 ZIKgSlaWlVU+4FRm6U8mRXVTag2cct6M1UJ2Aw9/UrzJzc1X8zHZBjbpAV/OT3fJPvzq
 Asl/pZyUamamKS3bZD6PmbHheLbtzdxPwEuqjK/Mo9BlvnrYWfPClJVq9y3cOhBt0Mw+
 2bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716899705; x=1717504505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zPQJGZVkj+ZOIL77gz+4gcqhxWwm/fob5tu3Fa0fAL4=;
 b=Uo+qv3K15xPCRiM5k+FXN3y7XgvCj1RI+1j94oMEKjswBc/W03GglGHQ2P/ODonHtg
 /NJTs+XMCrE/cwnPtVquS7lECVOfDj1fOfEfRa57OK1xBi6ccnKI+zMMSGOGvZYx67Yv
 j2cp4+XqnubmvVdd0DIai6MJHe222VPvuf817SV6sUtLGMw9+wESWqex/QuaBG2aIGq6
 2K8JSQEiNZgwmxsfhxJUcBAn+0D9cCdG8WM7K2I3PvIQ2IcM9RthQSlaKv/RB0JF6BnJ
 HXwnLq4a4VP05ueXmDgee1pkjdYH7+lDIJF78PZQ0299Iyxn6OVIRvpcdeZ1qhxGSqmO
 eN+Q==
X-Gm-Message-State: AOJu0Yx6U+XgeJplS0/moAafvVANQd0+BYh8tTpzhplRnN1iozpL3fdm
 m+gIVu2HpJfokOPob+Thv0F3Ivqm9oMe1/GrGO55xoamSqs1lJzH0ThxdvKyuvQ8MM+FpqA8Krp
 cZvi48/FHCF7U7Zu/e+W64I5zzyWdP6wOAGgnpaFpFtEifIcn
X-Received: by 2002:a50:cb8c:0:b0:578:63e7:3bd with SMTP id
 4fb4d7f45d1cf-579c9753871mr3868052a12.12.1716899705646; Tue, 28 May 2024
 05:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-6-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 13:34:54 +0100
Message-ID: <CAFEAcA_LM_e-E8Ci29DxNSznq-T9SFARmUBiyqNJT454vxmQoA@mail.gmail.com>
Subject: Re: [PATCH v2 05/67] target/arm: Fix decode of FMOV (hp) vs MOVI
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ecWWA/508Iny

On Sat, 25 May 2024 at 00:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The decode of FMOV (vector, immediate, half-precision) vs
> invalid cases of MOVI are incorrect.
>
> Fixes RISU mismatch for invalid insn 0x2f01fd31.
>
> Fixes: 70b4e6a4457 ("arm/translate-a64: add FP16 FMOV to simd_mod_imm")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
