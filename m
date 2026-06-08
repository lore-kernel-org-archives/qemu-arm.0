Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D64BCD6E79
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 18:01:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWeIC-0005Sa-69; Mon, 08 Jun 2026 14:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWeI6-0005Rn-Ay
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 14:01:40 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWeI1-0001nY-BJ
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 14:01:37 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-66061993121so4385678d50.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 11:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780941690; cv=none;
 d=google.com; s=arc-20240605;
 b=bqT/InRGpHklvxS/JFwICsuVSlmyi7zEpn/QlvGfXv/byoEWY13tCNdvYLqjnFvfEp
 nrHFTdxtxmU1Na/q6WEL6zy0JaiXsxHUHzvd8f32D+cmMw2fCOuxT0QZ8fog0/U5Fjzo
 rjFwx3hEowIuTKr51YGSzlMRSgu+y4kDmsQG7ln0f8i9YgTm655qKyqxJ2lhZ5tlaVNG
 ZxbxrMXU+/uz9NPbko/9OAZ7opp128ODP/9LoteQglPsRU3hbbjMKpOiWfhBMPgLRQCj
 xE8+CTtyT2WTFZYEuVJuZ1DbNZ0IS0TXHZVc+FgUBOhDqytspBg3cu8qUtoZnvTq5klA
 88NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=z+3rgRPDQ/IIdqD/0n+FWqkkTMdu5eRseNUEY3+hvCU=;
 fh=Cz1lb46CWYW1bdn9+feUsUki79P1k7za87EApPHH4oo=;
 b=dHyszTxNk8nvoaoomsWST+dXCU8upp5WfbJQ34ATkiPJsKl0tJQCIc11MXJnTDAkdD
 6E5CI0A6Vub/Khi/N1x93UO0ahA2qMioovYSQejmUtWUjPr9nWd9kGQbg90CPJzk7Q5M
 nsxPTJqTd+8HUGpncH4LxFuL3I7ZrX9g69q+4YkfY/OYec0sSQIR5NBDTaDZL+e3tvSd
 6nJoYmyLn5pPvccACgyn0vgwSI4WJbPYq+bolz88hXm5XJvWayJqUT4zIf2cXM0ztmEu
 3di5L2zkLpJnCGENSu6Up6Pbb+f6R0m4cyekCvJ2YMBWHjtdMOgKuGZwUfkRjDbPdc4M
 Ntew==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780941690; x=1781546490; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z+3rgRPDQ/IIdqD/0n+FWqkkTMdu5eRseNUEY3+hvCU=;
 b=HPuBeEafjrmXvQlNGJWhGHdWPrjuRQN8ghL1ZwuYHM3PqGdvG4qBXLL66+Be46DIIq
 IZUAOqPQdvd0i3PpDFsDsWBL+bdO65uoS5WpQEqZmvB8Kdwk8/SOIcly/KciHtNnGsyc
 J2CuqSDcXG/CpLxOnIPxHHEgc+s6aHppubrN7yYPdwvGSSIbVBn4no0+kyUMxL3inf/7
 TmTN2jyZp5A2HerhB2kJCRcTheMRB5BVhd4ppuXaa3Hqs75ibBr++5SgyAGaGr+jh2gD
 wBy57Hbt3A9p+waVJXT4Jz8cTCzSMTWfWMLL1/sGF8daEJPOqwCNLJiZ+GQNGMI9nLTm
 JIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780941690; x=1781546490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+3rgRPDQ/IIdqD/0n+FWqkkTMdu5eRseNUEY3+hvCU=;
 b=WG/ftlXQO5FQIzIY9hUnhRjspGSK3Y4473PnuYNy+LPlxY6fiaXhqZWVl0h2aebY5/
 p6uXn7ujo5lTMlH1c+9J2DjQBfpCf5AzUqtLjR65HdtTAf3gW0uF2qnuxaj9GSHEFMkt
 nDPrpStJRe0zssUMXgHYU99Ii6EOij7p+rkPNbzKS7EGwLiBvCJKWgMi35PzwQD2iP7S
 bZ6YzIyU6GiUXhlxOctzc/AUkVJMNybrOTlY43eTNmTgd00nspcYSX+KOrMr+HUT+Pz7
 irmsqENJPNmMHZ8Jw+iCMJPmvIjKn9Q0p78N0OlHEump4f6wFOkyOqQkfdSwsM/tTzMa
 ecSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/m7W7aTdSKhu364SdhkwyuJLts3uNB/H6k7pctWc4d5qGI4oOuhjmLZssZyGkJHJbbNrqjuNIpWQ==@nongnu.org
X-Gm-Message-State: AOJu0YzXMFVj1LqoT80m6RxPHv6PcCssqb8/uAo10/UBWE0zJjVeyanF
 GaTYy2ZIYjclQLjN6oGjQaHfYSttz2lKmk/fJvRjkLKO+hLFgMNu6pFYTMJLBM0JSUdh0eeiIpR
 h5N7zKilm06b1bIRhg47j//vHW2NhFtmRD4pL5nhOcQ==
X-Gm-Gg: Acq92OFi2NB52RywGmQFfZ24eMGx4WG0RVwWuNhnLL3RHehwx7u8p9OAygkKmZPH8Vt
 BhnyCQEsaVWhOLNIvwiibVG9yCDqiU1kYwiKlvNi1tH/qYplG7MZdcjDIOWV3I8Mgl13S/1v1re
 HYJ+H1pDdq4vUgB+CFp2dY3Qo6DQ5by0Bz0YamawPKCpZmB34fv8weOnC2wowvXdxH4xMwsY476
 etKcdJzrxp1fnEgxljEIq312XTnw6QA1oceEaarOW8lf9ELUQR8acLeCm95zXjjNM5NtUN9zsIA
 qOIIECOLi2tCCesGIF6+9Lhod1yVdaX+YV9GLGvaETLH1gL33BGUazSuF6o7YRn9tmwUljWa2JB
 iRA==
X-Received: by 2002:a05:690e:4090:b0:651:b108:be59 with SMTP id
 956f58d0204a3-66106f66b0dmr14128631d50.44.1780941679333; Mon, 08 Jun 2026
 11:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-13-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 19:01:07 +0100
X-Gm-Features: AVVi8Cf2Sdnc9zEr7ddO2hIGNQRfx23wKcREY1Pfka9xKPJXxUP92K-A2PrLl4Q
Message-ID: <CAFEAcA8_GdbLdSQOGCNu2b7HuMm4eWR1eGVSvuCzUFExLT9SBQ@mail.gmail.com>
Subject: Re: [PATCH v9 12/45] target/arm: Implement F1CVT, F1CVTLT, F2CVT,
 F2CVTLT for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

