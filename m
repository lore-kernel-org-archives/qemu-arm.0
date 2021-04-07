Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp210415lfr;
        Wed, 7 Apr 2021 00:39:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeuVVzCFVJ1pAEbVNVh9JSTO2G9pMiSchToz3uK84JUuXePhqb1YGTht2ZBcUP7pr/xdWL
X-Received: by 2002:a25:c902:: with SMTP id z2mr2734305ybf.207.1617781166631;
        Wed, 07 Apr 2021 00:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617781166; cv=none;
        d=google.com; s=arc-20160816;
        b=aVGf1X2TgBRFIg+JnqCJeX45GR21HsgX6GCJIDTlP/6ZXj8htOKQGqxi42mrsl/VPU
         HxFQ8cIZsabTV7a1d1m798d7HacfxuuRb+SI9eeF5WI1eyU3Qh6SSLY23bqzVgOPedcU
         UmShWuOVcIs5rLJiKTOrSDkm3iQaHb6foM6MnyfoZfluw6XgfwOX6R5zxFd13nH2LhZS
         OIpDUHlmVg9O+K6tYQHlsY6Nrd3L1QJp/jbrkDBoubsdMlGdH86Nyszfuyx4xlFydzQa
         L4vMey/IPtXEKKATYqAOi5sgJPXuo04vRXwv1tRpqRlDRqK5Y1zntLTDrUTyGSuxWqkH
         R5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=15qO1vg8nCc0Pnz1fGixlajvjVxS2/akFygKEONtAk0=;
        b=HKw4UZInXvS15M+EE9DaArvW+XowLawbVTzOWrONzVLcYQB42l+KUrCZbu9Iomiw10
         t+IBVBRoCIytY+sB6brh2/Ho1uninv+EylZRsRrUAAcP9zUrSaUqlo/Kf9qQ37I97Bi4
         TJ8FYSVjKatK1vfzibYPnzob5bXFQYOIqkVF3dU6EMYMlcej+q42PWLCDKVFXa4vn+cu
         A5M4lqfXzWUOt3zMlwyqENB8rA/GZbcrXFCjjm0h3g5h2CCBTE9i4CZ9JGpwcnv+o/9c
         A5dqXwEGBZ5UXq0RzTRYqyVqGK48V2MRo0gpfXeLTvtQI9T4tQyTM6jJM8ZPhIKknZ/5
         PyfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LxACFvLW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si3253032ybj.161.2021.04.07.00.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 00:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LxACFvLW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lU2mb-0006g5-Vs
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 03:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU2mS-0006fn-Pw
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 03:39:16 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:44886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU2mQ-0006Uk-SH
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 03:39:16 -0400
Received: by mail-ej1-x634.google.com with SMTP id e14so25976644ejz.11
 for <qemu-arm@nongnu.org>; Wed, 07 Apr 2021 00:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=15qO1vg8nCc0Pnz1fGixlajvjVxS2/akFygKEONtAk0=;
 b=LxACFvLWNkjqD4sI6/dYDzEbIetFCjEgurcsq41l46QEsdb04Gz9A/zcLrysZPpMXI
 bQTSZU4WA/kEmmOHC7f4G3E24K7eGtj2mgXc/CFCzvb9FKDZzzCw759/bPqq52vw1x9B
 k5LmEaZS+npSFxXlYKYKuehZytc9dHY2ZqSOdI2DWbyQUsNWZ3HtrLPubNLJ/b1qKwry
 13Cp98FfEJ3yOdEoNZEL9Px5HAE706hu38e/RQ5+Eh4pTl3W3p2aMaxFEhtae4MTZOtp
 B+cKHSdOraHQhd1IKSO7M9QZ19u6MB6pZJbp6VmsTGdnErfH1xTpBrlXkj0rrr5Xc+jB
 sMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15qO1vg8nCc0Pnz1fGixlajvjVxS2/akFygKEONtAk0=;
 b=g+9yBhB0ihy9Rj5TET/A10grTBb5rHYbZP3oL6v3zfTPwvgPKtsbQhQfee+j4gSkBU
 xMKWWvD7hPk9zixiBRRTlMGzQBBe5DAUloH46sWnt/pSPlWPUGjkR4cI0DAr/q1Pc/RJ
 XJbAQk23QEdP8WO0t6Zl8dcMAGFcF3s5dzHFl7poQaOZVkuEiPcXVktm5iWGfT+zvm5n
 usa6T8xRbkzWmw+zzgdL2WOc/NbZhM3S122dkSODvoqkcFJpvqFb7CTa3wlIb3K/4y1M
 MYW+gSDdeNi6Ep0y77OmGm8cQ99nSP07b/mnNuE5xaaHgwVqfVEeuKUz9mAN9dmz3hDN
 k3PA==
X-Gm-Message-State: AOAM533dKoyskaBHP4xhYsGxRtRPUahiR2Ok44XdNBGtliRGlCMCTSb1
 3cW/JN0siTqUJ8ZoIgsczwp4IpIn9tHjRay2kzJwzg==
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr2222158ejh.4.1617781151928; 
 Wed, 07 Apr 2021 00:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210407040100.9933-1-gshan@redhat.com>
 <20210407040100.9933-2-gshan@redhat.com>
In-Reply-To: <20210407040100.9933-2-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 07:38:32 +0000
Message-ID: <CAFEAcA_-cmCFDgaqVsZEFT5w56g0LLr3aCzjCf1Od4iov6eWiA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Initlaize PMU feature for scratch vcpu
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dCY+NyFJMS3u

On Wed, 7 Apr 2021 at 03:01, Gavin Shan <gshan@redhat.com> wrote:
>
> If the scratch vCPU is initialized without PMU feature, we receive
> error on reading PMCR_EL0 as it's invisible in this case. It leads
> to host probing failure.
>
> This fixes the issue by initializing the scratch vcpu with the PMU
> feature enabled and reading PMCR_EL0 from host. Otherwise, its value
> is set according to the detected target.
>
> Fixes: f7fb73b8cdd3 ("target/arm: Make number of counters in PMCR follow the CPU")

This commit has been reverted...

I couldn't find a cover letter for these patches, so it's
hard to tell what you're aiming to do with them. Could you
make sure you always send a cover letter with a multiple-patch
series, please ? This also helps with our automated tooling.

thanks
-- PMM
