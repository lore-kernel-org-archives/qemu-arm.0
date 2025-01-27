Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2419413njk;
        Mon, 27 Jan 2025 05:03:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWLHIY39jiSVFWlWF5tIgcaetT4FF4TF+H3lMtqsIZQebwQbOZYYtrmR4IuBGJHtcbZ5CT7juN3sMTjyw==@linaro.org
X-Google-Smtp-Source: AGHT+IE+FdcTshGtBX6Qy5uKgXisgjx0OXMEwsJoD2X0DHJ71viU7XSng4xMH1irA4NIR8X1HETZ
X-Received: by 2002:a05:6122:8286:b0:518:778b:70a1 with SMTP id 71dfb90a1353d-51d5b2f094dmr33414630e0c.7.1737983028139;
        Mon, 27 Jan 2025 05:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737983028; cv=none;
        d=google.com; s=arc-20240605;
        b=WhRxiSJB98QWnKpHHRzlxZh3KcTPm3cRJJVa8BjtK8uPKpTXNZJj+cgzAMn3xLYJB/
         j74/0jcbhFZctmpcw/H9d3D8lIJ4361s1IQ7PU/L+HpkjdVXkX/AQCKF+8PJ/a6Fia3d
         6bxxvdNl3enihvdz9wv6vvPC2B1JfQu/9HuVwSjEBsJrsNFRG/WUkg9VMRXHe4SfAjxa
         U3AmFriojw8lsiUsblR9g9WC9ViLZsuBp2i8BMCt+vpbQ+EJoy3MZ7EFkt/D7aeemSX9
         QbCRZG6K91sGX7Ls4ddx3EP40tU4sfuliSYRh4eue1kbAFV2SRI6vTr04OoC9f3YLyGL
         NocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3uyBwHzj2AVHRnrzQUCsaSjF7zSPrzS8gQIbg7umwpQ=;
        fh=/Rz3My8DPCXeahNDRMaCo7pMCaxe7+Asc3xFGvC46xc=;
        b=JTgAVQUXQc+TpW/Qv0Jb0Enurb/X6POEAKPLPKTpPsAJ2hYgpiplbmTTDUY0ifXgbm
         s9b4rwkAdBHoK0FEt+XrSr7uuAVyrAh0yW5VkdN1i6V78eIgYC8mvjmw+65PJUaF5JV3
         Ic4kS0+aD8SWNvZXigsrcAva1N4RtvaaTrRyuuIkJNvLHShAboav5fgVkjH76djC/5ls
         zA5M5u0yb3czQnj8cEhweqd4USmRqv3Gu74YGHtsW90jCJQVebs2G8TEmHj0uAo2eKIa
         qJZuhu5ILrvP8EMKEU/nhBsrZfKXW5JUYzERkwJanY/n3wT5ZM5K7EpVvLHVyxfS6kji
         WyHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WvQgMMpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51e4ec80badsi2913920e0c.180.2025.01.27.05.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:03:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WvQgMMpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcOlz-0001fk-RH; Mon, 27 Jan 2025 08:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcOkk-00015s-Kl
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:02:14 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcOkh-00006q-1M
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:02:09 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so7374782276.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737982926; x=1738587726; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3uyBwHzj2AVHRnrzQUCsaSjF7zSPrzS8gQIbg7umwpQ=;
 b=WvQgMMpTD52Pmqrl2mr9ejSiQsd6m42ygTb+WZdoHo5hZmpH/HdIcNAPJBs5VFgypf
 V8N0+y7SAEq3Hq88YnN3pc8jjO+JPOFMeQPxICW0gDYFOqxYiytzbtRS9KUiJNqqCk6K
 PouKPWYZQLxA7r9UopjCQLp9cS5nGD39x+L2okvJrfY4PjNRHUu+yO0LRa8kXldPoZWe
 nSpyfreqt/wyhscMgqRHI89eKy8jtcomH47pJ+MOBpiVQ0nXD4pyKsRbSRWEpAmY8yT/
 A9smP3ewVJFFktk6oqRh4MNdY27bUajoguLQBX3xPvwkjjWJ8Tx4DqzRstaUEXf9Wmjd
 AEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737982926; x=1738587726;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3uyBwHzj2AVHRnrzQUCsaSjF7zSPrzS8gQIbg7umwpQ=;
 b=dgswB6Xy1t3UOt7LY/KNLitT84+kEBFtuSONU3vaIIT/+bhF6L7iMdag0Q/hJAt7H0
 BHjGj8dVXJ0nLTP49h4uk7WNhSsook4HHBxIOmp/0wq9/RBi3jsNnSjvBAlgrIGS+WAR
 HYOYcLp9VF8UX7vGHOno6wlDgbYLxysIw8XZZJtKcwZnbZZRxdD5x3CeSrBDMO2fsTyF
 Rp2wNnwanroUX2naKHrNNYlEHGCQCd9FhJLzxD2yHe8nC2HeTaESg7uy5gxOvcoJiUxm
 ImLW3qXfAgfhw8s0K4AB4fY7ydOhDRZHLxxl1jZgAfq65qG8ZezaWtTiUS4Od1+LFdef
 PKgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnvAoHh3VCz70PZhrj+/m+SpvrD8JfRhj3JRMhr1AQulCSfVzV0MCz6l+KgmdRw/RvwN5LIOmVmQ==@nongnu.org
X-Gm-Message-State: AOJu0YxHoJ7In2l6Dc1aUNz+GDoGA7jz3KW0LHefXT/m/2SjLy9/pMyJ
 FieGM18U+4Riq6oVuvNEzcs882Y35b4fPhMPa700jH+bdBz2fuluiRc97gUa2t9h8DPOOT7fVM5
 hHenSDPD5x0tjsXLlCCiL1Wh2PPt/KyTFh1kgqw==
X-Gm-Gg: ASbGncuzdxeqoMwvR4hEj1ePF5R/nxYUDcy+FMWIsy+mciLpqv9U/qbffwVjmJWUC48
 TwguJSG9lrZEqAByvc5MvsDfm+nVwZOKyuJdAhXFf9RyEHCXbeK/YS5NombMthYk=
X-Received: by 2002:a05:6902:1791:b0:e57:327a:268 with SMTP id
 3f1490d57ef6-e57b105a86cmr28892743276.18.1737982925895; Mon, 27 Jan 2025
 05:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20250117191106.322363-1-kchamart@redhat.com>
 <20250117191106.322363-2-kchamart@redhat.com>
In-Reply-To: <20250117191106.322363-2-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 13:01:54 +0000
X-Gm-Features: AWEUYZkC4M_jBwBZ3x7bZR6I8U6BFNGyxbmG1rgt8gCNeoiYNKK_JwjTIFf0fpc
Message-ID: <CAFEAcA9k-L+XHKEE0TMp+NZDNj1P-CVj2=y4Lk=n+O3F8t2-Fw@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/cpu-features: Consistently use vCPU instead of
 VCPU
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org, 
 sebott@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7jESI19F1Oxh

On Fri, 17 Jan 2025 at 19:11, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
