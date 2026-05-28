Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04603CD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 13:48:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSb5l-0000Nx-Vf; Thu, 28 May 2026 09:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSb5k-0000Mp-Pj
 for qemu-arm@nongnu.org; Thu, 28 May 2026 09:48:08 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSb5j-0002gn-3F
 for qemu-arm@nongnu.org; Thu, 28 May 2026 09:48:08 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7dca5a81be2so6712017b3.2
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 06:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779976086; cv=none;
 d=google.com; s=arc-20240605;
 b=XhLrrbbsTB2Jq6H2rWfwUHND2yzgt/GjphGq3rkP/sbvxKeV1/sPvOmnk29eYgvnr2
 ElMd276oUceKMrn+KWtRW4OZyWF6//DYrvG+hzAingGNqzJ6sPzYpyOFsVW1rllvAb2k
 FHOawVphOS7r7Phl+8Vcpfk2n4hgn5fZIh2DQB5pAfDe/WRdIp2qRNn6L8Uc2cVyAucz
 uCuiM+iEYoQzida6/4eC2GCRKYCZ9R/074IuQvYEq752ZuFnct468+waROcb0Dg2CxrK
 JbRkCCnutTGqkgVh+GjMSeZuZDY7wkjFkQo5KOEKarXRslvYFUZzrXPa0LIUbg8eqFve
 CAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=25S7mPtTDqCSCc4SGEugjzYunSx5dQSHktsrAHYTncI=;
 fh=YbfI89LKWEuDSojNs1T7Vj0aX7lpJs7F0GV5dSpCf4c=;
 b=Fe/lvVi+EGDojSAeyL7NUyW8oBaP3VpL3Gd4D5huHdfgjcDOyB6iYe69qYcqBaKbYN
 Zb1q5BDX/b/BWtcnUj+pve74ekzJcXOHAEVcUB+JQXzpRKBwe49W2Mtdt+WPebyfB8o+
 bBmJyFPIOhf3rOkgJNT+l3swfbQvygaSZl4WV+gev2gtWZRlQ/pt8T7zhQvV2sffZh9d
 x0vgO6DRRhovlQn2stcG0T0CenknT9zkNcKAuCTUIxGy7vNbkcZ0eGdUJFQt1K4kjQ/4
 s5kHJJ52t60XxYLEtApGAfTBYo31LqWXkdOb/ygS9YprFRi3QuMYNwdd62GOuas9HRTS
 qybQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779976086; x=1780580886; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=25S7mPtTDqCSCc4SGEugjzYunSx5dQSHktsrAHYTncI=;
 b=oVHL8uyHkiTv5G9vuQRASPOIiEqnejGgUsTN8/BTfeXJNLMm5uDR0VUmEB19gtf1ZY
 /ia2ns90dVkBNXkuGl9It+u5heZ8vnlxDCrcR2hn1CptXffXDMSQUE0boPu9ITqAjQZv
 Fs3nMhb4xHUzYFbv0QK3njIW5CEUH8mIaYflsdP6FWBOycnCA4xE9sC5r9y8pIv+V5Dt
 wfFPG7sPZnCRfBKf8EtlTWsaQ7eiifbZpnJsFXLe2xddMQzt5Jyz23gEObdooNFRPKZS
 15FGzRJUXSyOey0tOfgB5xxKBPY+601uF5iErcSCw/XyTp3tL9NoC1V+advwDSJkU8DI
 cKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779976086; x=1780580886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25S7mPtTDqCSCc4SGEugjzYunSx5dQSHktsrAHYTncI=;
 b=LTpOSdOyRHnEXpFAinyGnvH1dh0j35i/kk9CMoNn4Z8esUnsLOo8wHfi/iaF2wZwE5
 As6Rhb1rX+ABA2PCXSY93cMry0dGvw3Fm1uwWee/rHsWGym8cD/BzrttPEmvrza5KjXA
 puXgMkXE2ejDUanX+Lr3fbMCl7p3gtsOm6idIyTYEAIKwzpHyFLe/zZ+Qc3b89rLN+/X
 xrfpCAvxszpnrO32EWQJXYJ2Z1x2Q3skyU+dOCFK0S1qPq9l2PBj7nLwtCaIFUDv6y4K
 94Eg/lAxugcuGvyBfNZmU9T2dB4PDzW6HMoQcZs3Wtc76CrYZAo79SLSp9CT/ESyLbpP
 YsZg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FZvOTiU8jSy/QvYYczlutCjDDAYx24fCuMgf1+WbB5HoAmyHPjblecRu8v01+2rzt19E4RFRJNw==@nongnu.org
X-Gm-Message-State: AOJu0YwFlZA2SlV26RdlrWuYfHJNKc27LBTglR9rnbTwxXnVmzyg7uU+
 d2bPugCDublWx7BLwN+3Uu7YUHH7s0sLitBml5ak+EgDSbsKNqpxzoUz/TAcGREqJqGGRSnBiry
 n8DjUAJ2F6k7SE3kMdpG1kFGx2ryI/8qC14T1yyzuqA==
X-Gm-Gg: Acq92OGXs+LkUzDsCPRAq9K1gyCMdXWeGKVPVnB2VfS6KWB6nhpVt5T5Y+PW4F2yUOX
 rUx5ml3rKozQVLQ7eQTmacX4Ui26gvtT3syirCMAmaFgLhnOr3uW8QIsAiUGvVAGajHzqlJh9e1
 a+zT+AF4lnDHKQLCIb2QoAuUiea9310fzcAt1XBITeKm8/uX9BkmVY/7/eZdBveT3m2IhJ2TAiA
 Ri5ZNYc9jO58GaO1olwGhOCdl1wpAuJ6gAF77VFGvnuuO8ADrOquhix68nw5kYEyQJMvwl7T7KK
 2ga2kDStfqVmuQE4LCxJfBxGM605LlriqynfKTj0/OAXX2XtUjBhI/5XyPmHOdMLxoK/tK8YJiN
 2pxmyYKzIcCNL
X-Received: by 2002:a05:690c:7202:b0:7d0:79f:339f with SMTP id
 00721157ae682-7d33a665524mr284688497b3.34.1779976085615; Thu, 28 May 2026
 06:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260518174750.660258-1-richard.henderson@linaro.org>
 <20260518174750.660258-5-richard.henderson@linaro.org>
In-Reply-To: <20260518174750.660258-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 14:47:53 +0100
X-Gm-Features: AVHnY4LnkpkFX-vhsYoBl2Wkixg_Xwuk0eVlTXlL6bTAcU-tiyNvz5LQh3TNCo0
Message-ID: <CAFEAcA8_drG1oxrPyuzJGuduPvThuZMGSzDNWtZDE8ThXL5ugw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] target/arm: Enable FEAT_CMPBR for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Mon, 18 May 2026 at 18:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 1 +
>  target/arm/tcg/cpu64.c        | 2 +-
>  docs/system/arm/emulation.rst | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

