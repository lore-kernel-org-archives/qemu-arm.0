Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A871CDE008
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 10:18:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wchA0-0004k8-Tk; Thu, 25 Jun 2026 06:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wch9y-0004jb-2P
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 06:18:14 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wch9w-0000aj-Rx
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 06:18:13 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-662dd616cdbso2079964d50.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 03:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782382691; cv=none;
 d=google.com; s=arc-20260327;
 b=BgAvGK4vNx4uiOyZ7Rlq8nXkYDkHRdPPu8P4dt/HUpseikajscA7dso65r2IKeglvL
 4FbcQfpNvJMF6+uDR+9DPfCf4vJ8t2ldY0JTdSrQcyixbNw5YhOrj5Nwk0XSAZm6NwXw
 /2bA4d5IOuUx7hGyia5N301w/gh+WMc9A3W0eK1i+4MWdH2Bj+AH3ct+hCPwBTtffwCV
 dLXxC165plg8rzdcx+a1nzy60mE7gvy88k/nF7ReDqxqnkiPcUOf9fiRWIAVSg4UTaQw
 0M8dJc7VXIaFyLo3x0mEaQcI9oawAXmbkBIaecq3ueK13P55NZvBtAAtcNpCz2Ix0zG7
 kdDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oAkhTbS+6AKp48dswyzdQNYeGNYYIc1VF0vVL/Zr1vM=;
 fh=4CYTRKYsAAkn81W7L113j7TQzZSB5Wp+LOeWrMJyvcg=;
 b=XrBHKdyCM7Xr+r1dOmi0/yYLtKt5H9Htj/JxKWVPfk3M35HmLL8FsQmcWsEBCjGd2u
 +XHqUGfIXYZiHAGWtS6vn3dVpCM355BZMzzFoUbRjMjUv4EFSs+I/2+UZsQM86EsfteS
 lQ8i+xxo4uFw4phyCWubrn7ux8xedfwHFjemOzuIITaB8H3prkbKm9rp7FqqiM3iGuV3
 jTmLHeZI9QmOH/wIP2InlMTZHfDkxuFPkqlceJL2oBGKJqHu5MY+YVvhzi+QiyTHNo6t
 IZ6dM29VhVoFylc7RIRKLQOB5vMhoh4k/shM9ICabBps2GglA+50rLGH5d8Zdjnb6Wmp
 0Iig==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782382691; x=1782987491; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oAkhTbS+6AKp48dswyzdQNYeGNYYIc1VF0vVL/Zr1vM=;
 b=Y9J67dAdHCd+LAypkoO1ngbirjJzxp2RRM63ZF+vt+TnlW7elAKgRY2xGNqpbBqGeO
 5ouAtcwC8n2cPzqE+tCxAkUVvka7M/3wDssWa1J2T1CZPHbDhtKKnZR5zVa6Ljl/NqZg
 uAJm0ZXkmFmjWWDtZNhdDZJT02HiVdRsM1sfLiKkkfWC/uz3BkTs8lXSBqmNuO1/wwBk
 9kmPsZ5VMbQbiuJxE+exvp37DqBrE58tQW2ONcV5paq1iHSk1tKvR25zo1j6gHV7zbqK
 Jhde+1K0j8w4usw5desv5xBWmKZchV4x99IJ8RYJRg9w9KBFz/i11s/P4MweeCCMKlnA
 m6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782382691; x=1782987491;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAkhTbS+6AKp48dswyzdQNYeGNYYIc1VF0vVL/Zr1vM=;
 b=V6pX/hFVD0F0U+fjckkCEdF5y+/3hS/wbRpLq9n5wzZKKNdtRRcLE0mCXNOqFhKHY3
 yosQqAZc/lBooDImvC51krcPmUW91MZnB4XJhZxQUv+hD1O7r9SjlAwq8qz4E2rcvaN3
 ewTtSkawkY+a/pb5nsBM2PFKm88C9VdZ8PMAhkQTJhPGqX1c9c+xUc3weG9Uxk8BQRwD
 5biqLnynjbPRG/uIYsn79yJdK3llpTl612HcZzRWjJWJZm4ix5xJ9qFg/fCeBjOHBPkF
 yhxHncgbtATejV5TUxKlXayHHbGZAitCMZVSm1hLHqslzzBiyKwphq5ebfY6jRqD2Mv9
 hpUw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpns3poR4szHwMebI9q9ryYROdbYv9GjVyEv+x8C0X9vgNDNCyARyT2KLKrtsA0E9JfTvYandDvFw==@nongnu.org
X-Gm-Message-State: AOJu0YxbBdymlpGcxOUHS9UWpZ7Y/TLmpv2aF6TNyVu3drzbrk+ecrKI
 LCajav54Vydf3ivwfEz+clwXC0bInuRGVgPER95kFYEGJwYDve6zSybxz+XV+s7EoV+FCXu/SC5
 iNMjJNFxjYfX03H/1zOLIXIZUCYdRkU3FP7WtpV0rEg==
X-Gm-Gg: AfdE7ckU7XJbQ0oiNu/t2oX1uMpmFuArDEBnOyIIHXK9+pU3l3Slojk6hBT0PPzVjHh
 Ps6blK/zGbE1WPQuixWNIdD2fQBedHpmWWWDIqAh3rZbvTY3HZHiMxdk6o/3QceYPUs7fgRh17+
 IP8q4PKNTXHls4VOK5yemDQBcNADgbE0xX9sCcOAWiNIuUv4Oq4rk0UVAwOsU+7iPfgzPrCX+og
 BOZDDlmI622EWgNg/Xaj17yYomN9PhS5u7xrOOA44tSYep97Rr4OI/NaamAcAUxOMIwdumD9dnw
 D4hdzks1o8F2d2VUMqXta081zvQDmRuMkIXeye/Bt8U7wA61u1Oj5eSk
X-Received: by 2002:a53:ac96:0:b0:662:e688:ede0 with SMTP id
 956f58d0204a3-664882de747mr1300143d50.50.1782382691264; Thu, 25 Jun 2026
 03:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <20260625015159.719300-3-richard.henderson@linaro.org>
In-Reply-To: <20260625015159.719300-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 11:17:59 +0100
X-Gm-Features: AVVi8CdMPBJ15mpbRziTidrdciQcCB-TuYVRLSol3pU4soOy1kKpNUtI-ukdvps
Message-ID: <CAFEAcA_DjQBBM+v71E7ain4CXs7K8erj8b8=h6c-YxpP1wV9Cg@mail.gmail.com>
Subject: Re: [PATCH 02/10] target/arm: Rename SME FMLAL/FMLSL patterns
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 25 Jun 2026 at 02:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename patterns to include _sh suffix, so that we can
> distinguish insns of the same name from FEAT_SME_F8F16.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

