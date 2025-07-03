Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp503094dyc;
        Thu, 3 Jul 2025 05:33:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8GOdVghrBcDriA0xbqcflQVmCLz4l6qy/QCQJEU+5YV3121neKy4fhu7nO5idaMqI8XmY3wpukKhNVg==@linaro.org
X-Google-Smtp-Source: AGHT+IHOrTHXSSNpUGXC0UW0TF1RojnfZC82qyopDtIx7kxo+MirTTbfM3epzqFfaWwRM+axK5k9
X-Received: by 2002:a05:6214:76b:b0:6f8:d223:3c32 with SMTP id 6a1803df08f44-702b1a6b1c5mr128296946d6.10.1751546028163;
        Thu, 03 Jul 2025 05:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546028; cv=none;
        d=google.com; s=arc-20240605;
        b=OorzUw36GlejvLlq6KR1e6xdIpwRwPOi0wMxAylpXTbWxEtw6cNL94L+rmiV73o1f7
         JTRV8JTQAFotfmFDmWTrsC6fBmoFOkylHboPQpsulpNxC35jHGw+hDk+uUp78QuJ/teM
         5WA2jdjIvspdANHH+gwSYoq74OEU7Rhro97Pb/xJSyhoZKSfdkuw8zLkoQ7VhM65Z1yL
         snb7K4dULqAoIoG9s7eIoX53+wbGf8C1Dc5fGagJX/RCfQBElTp1V6xfk2ux7tbiSF1/
         SdJGtJivouSqexNHQklETx6zdLwz3+ZAG7A9ElK24nrgDLelkwbB3Sjb7wDku4CchyRd
         B+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OBj111wfkFbpeXvKQEzQfGQco04hXtrVSeXrBgZ1R+s=;
        fh=4sv6Gg59ogfQkdYX1lCvPO1Z+WE55kWLJ48F7dpmBMM=;
        b=AEFCQWUNPCqsQkYntc9kF6/nPC0U0Rv4wXmQgffp5Zb8TthIaalPPIP6dzUTbrDgrL
         87JOAiIPFknqCjwicqFRWXymvqJ4PPjC558BZgur+afLXlWBeVBoCdyBi/Ojk2mRp2i/
         8sTzE7cTyy4a92Ct/rM66zpONRNHaZYpMbEgHs6jzX8MnA8qhOh0X/Zlbktmv4iaWook
         +LCDWVHpHckRnX4uwE2AKT3J1KJdMVEEOLE+gtWsTHHPtaqH2v2Ly4VojTswxSCWP4Tk
         D1a1H0VCszHEI5w8RWv3W5Lf5uLcqLSsMmQq5YqBoO2jcD25tMWy9LwVDR3DvsoaQacb
         rt6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3lC6Tvm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702b4c86432si37543146d6.344.2025.07.03.05.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3lC6Tvm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJ7y-0005H5-U9; Thu, 03 Jul 2025 08:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ7y-0005Gj-Aa
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:33:22 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ7u-0006oJ-SI
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:33:22 -0400
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e81f311a86fso6188686276.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545997; x=1752150797; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OBj111wfkFbpeXvKQEzQfGQco04hXtrVSeXrBgZ1R+s=;
 b=b3lC6Tvmyt/f4izwqelhh9MUYYCzWlSCP+6JvwTZmtZw9ZHWZWtAt5uOsTGUZZOgkN
 4KSP7YZ9ijzvURFN6zMkfzOG33hFEY5VzISiLpdS9dqFKrb8aDy8tLMLkS4s2wC8oQkH
 OAK45blvV5xVJqNzFFuYsQq1PZ78GIBbwaE2O6kWg3jejaNoK2/hMK3GKu7sZm8BoXQJ
 y/PS7XYCO65O4GoBtAf3a0kztc1Oc3K1VvBRCWYS490OS1dVJR6+uO5QWx5uTuQFSDWC
 +iNZ8EV1IQFFesMdhaZbsgHCSBtU5rQCb2Tkc7TyeAdPhAJ1sCTXsv98WSse3+KIBc4m
 Uxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545997; x=1752150797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OBj111wfkFbpeXvKQEzQfGQco04hXtrVSeXrBgZ1R+s=;
 b=BnSE90kdV7VA90CqgpTOzJqZ//Lf7A8oR0voe2JFfSAyeJYfHP3Du1mK362dHFCJpv
 LYRb9KyRCn/sq4atTbPfAV/GlJQ5lxPjKXOMyw1N7ZIrAuSkerI3C3KzAvQ2AHjCCQ8Y
 kl5YMSqXDfZ+XDlSNqGwoChAmvi4c8IEcDsz3xuveWdgjdqf5XMTSmwHmvHtXe415K8J
 kyr/mlxD5VuYLYE5bvkqd63ritkW/yxSYPKoj5ESYf69JdSN4YW/GSjaKsvJTqcnjlr7
 SSCo0/aU1z/qBC0rIVT+gdPLBZFu9wMuWDA6v4CGHS7lulhA+6tvtD5ZRLsbx2ecSrZO
 WgRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTCjdlUwsTtw0YSEqk6DL/s5vc/B6t+4VzqDswqkWrbd3oQrzsE6UyxO05GDi9vYlEQecMhFjbNw==@nongnu.org
X-Gm-Message-State: AOJu0Yxa3SnZr4o3l8E/RIhW+gKPYjDD3Lmarj8nv6JewJFpjBrGZF8q
 UQImLeSmJbiY3EzDn3S8NPJpJeof6C2BT23QUT9dAibDy7F7phwqpLllIuq4tsSm6+QmEGnnJp2
 /3S7n6fBNDR5kseGzMZfXAdv3QUw2dfJ3eob6jybV3I+hzNPI18b1
X-Gm-Gg: ASbGncuZEC4MoYN2v3L77eIt2Vf0BDSdom42wS2xJcGitoD4+IYLjMh4oDswQ3Y2Dfs
 Uc4fq+UYFKOAZHa1I6z86RXhfUnpm2Cyt74P9coxMUEwXYpdnuqVUwO3FGmdYKrABEqmUYAUTGT
 wZCLXaJju74d7InM+8G+QoLD8+t+X2DHRm+CaT6aDTCH43
X-Received: by 2002:a05:690c:5:b0:716:3dc5:a35f with SMTP id
 00721157ae682-7164d4d84f7mr98841637b3.19.1751545996800; Thu, 03 Jul 2025
 05:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-85-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-85-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:33:05 +0100
X-Gm-Features: Ac12FXwSEO0yMpJM65OHhfiiHH9XNvX7fTU_611tzZZU85_IOBQCd0cTlWtSxNs
Message-ID: <CAFEAcA_Ad-nvFwvj70de8qsXBK808eLm-Wiga+_Ov1TmMhaBQw@mail.gmail.com>
Subject: Re: [PATCH v3 84/97] target/arm: Implement {LD1,ST1}{W,D} (128-bit
 element) for SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-TUID: xb9gwUhhhHUt

On Wed, 2 Jul 2025 at 13:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve.h        |  22 +++++
>  target/arm/tcg/sve_ldst_internal.h |  26 ++++++
>  target/arm/tcg/sve_helper.c        |   6 ++
>  target/arm/tcg/translate-sve.c     | 134 +++++++++++++++++++++++------
>  target/arm/tcg/sve.decode          |  20 +++++
>  5 files changed, 181 insertions(+), 27 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
