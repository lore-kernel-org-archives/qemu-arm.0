Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCC7CCD1A4
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:34:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAqyB-0008Kq-QU; Mon, 20 Oct 2025 10:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAqy9-0008Jc-H6
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:34:41 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAqy5-0002Bh-RT
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:34:41 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-7815092cd22so57532407b3.2
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760970874; x=1761575674; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7UwMaxirHap1HZypl22fJti1ssipPMA7weTK45fA2uU=;
 b=pyTLZVUNwQW4Jx3CFyS4S+34Tn4olq4W37a/+7TRF0P6ZMTLRx1+Fw0YnfwyzcHex0
 5AUDZd/c0SduJIxd1jw/uTvzJUzJQF7thf4MfnQmnyzLtJ1Ai3HVswnMCSnSRy23VGFe
 2WwBLMo0+1kyZnsgmMcl6LoIc5uSOAAtN6Un+3krp/RoziBN/05fTpRUCpHnc/RfkaiS
 VdKOXQdWX7pCegnDnXsLZ4cLXCabh82QY95k+TJrPB2vMb39jLM+blir6xwX7mu7n6OP
 ZInrvNtps3eNnCa1SGdEZK2rUOXAG8HA0odWxr6Xgs0WXP6nJ2o9c+MBfDv7G9QlxbZE
 jNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760970874; x=1761575674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7UwMaxirHap1HZypl22fJti1ssipPMA7weTK45fA2uU=;
 b=gOcG97E2Y7jhpCputIdDdiwu3WKS+xq/PTvQCpVLSszxk31K/qHkSr5s5Xs+/bKkuB
 8Tx8wyM3rzi0tRwehQfox+0r2CAunlss5HDDdrB2D6ZWpmBLofFyH5pCl9sSvjSfuWOK
 jH0gREJcJG0ike+HnWPpGQGM9YGTeqm4vxkaOaKTOr9xv3ZnPrwlxSCAfhzWdtBkHAn/
 4b6Ra5iWhFJHejU+2eJRLfn3byUGQz0kc/RuHhdF8ZXoCs5skTMaV0fsd8VrAYDwa8pa
 9iVJ0p6TokSd8oqwVyL+KuVGWNYcH/dVspieVKfPvJ1Rf7P28miwhBKOx88mr9WaFrDr
 uG3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCC7GtDueg/ROWbzkH5pfwv6GVouiKMBqoFMN1NP7jn+CpLCSpsUa6GUEcZaUSZ0HM+I8BOWH77A==@nongnu.org
X-Gm-Message-State: AOJu0YylfR+ZhXr3sXo9HSzYTWHKgLrD1R/g3ODEWhaRiRjfZjAj22Xx
 S381NPmQxr5N2KVpbCpRAgeYf4hHpRZI+yffbyFsKwOymNiSg8TLWaichUTuXhEMnpq8RIgWMLI
 OgRgxmcoTX2qs7JTeIA3QzFZ5lLHi6q1XEc5rA8tHCioK7lZyI7Za
X-Gm-Gg: ASbGnctHuZ/kJtPuiUNm32ehYohTpI5ePQ9VTixXZaCo9Mfh7qNXNVUGGc7zHh+UvXd
 8IvfOMQJbIVNJjEJtuNYRr2MPX7f6LIu5sXXEiS6qplNgwlvFmAKVnrC3SZwyoc1M5lm+gdS5o9
 Vu2In+u2cFyiHmwOpjedeSSS3Hme4yVrn1B7lAafDBoL8cR8fzYN4Wp0FJtWJDX9B3LWdra75Tq
 c9nRxoJYOeG+71PuoCzn44JK+JD/9VOGs2kMf22uoVv3H8/6wAlNPNAd5bHZw==
X-Google-Smtp-Source: AGHT+IGWG0T7+WHOeVgwf6/s4jgRPK7qnnyrCYPlKE2niqLLNqGkozk5lCUJbgxrrZfQAkGwmX7f6FATbQuxngkXa9g=
X-Received: by 2002:a05:690e:241:b0:63d:a5d0:f30a with SMTP id
 956f58d0204a3-63e161dacd3mr7971787d50.52.1760970874205; Mon, 20 Oct 2025
 07:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-27-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:34:23 +0100
X-Gm-Features: AS18NWAyEo_TezdXhexZgv_2ED9AUS1iJWrcFDQNaMTeDO2_3vBUj47XCTA5APk
Message-ID: <CAFEAcA_8SNoUhPHROyDEPH4y58Kdiy7bDhCF3kPQsNFLAkaMNg@mail.gmail.com>
Subject: Re: [PATCH v2 26/37] target/arm: Implement TLBIP IPAS2E1, IPAS2LE1
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

On Tue, 14 Oct 2025 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/tlb-insns.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

