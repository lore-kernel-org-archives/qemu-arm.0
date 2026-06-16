Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB43CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 13:18:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZTg1-000232-6t; Tue, 16 Jun 2026 09:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTg0-00022r-E1
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:18:00 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTfz-0003Jd-00
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:18:00 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7dc2b658544so31955507b3.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 06:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781615877; cv=none;
 d=google.com; s=arc-20240605;
 b=ijFiWMN+UO9LtJ8K/SvBjSaOVZLJo4QPaL0rDTZfjDt9s6csVMrVLgPnWCNGPMdWfJ
 Mc030dnCBatCNeYP+IDE04zAx7l1ItBGn7j2q7NVROM4EUQAyuhPMyNQXSNu2NHBG9Iw
 /Xs71kMPUmFWN39qPqV198EsFYugB9VQLHtP1Tz15QXP6y9oVcYumzuWnFKkIWWueTMr
 sIeEvIHWGX+iW7TPNheGZglVjzZbd4bTaGUrKWLGj5NxiKIRbihdpoPTH5greC+5/7tt
 7RIxVaRCAQnn/f5vLqkNLApbjnswOj9Gze9fH62FYAfngonI34DIF73Ysx/O5cXM/BKw
 FArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Xgln+4eZtdOVW8GLr2c4M7v5K66yf/zJeHmKKqaT2NI=;
 fh=TpQScuyzcmNAmR1awQooi+6jae574Yj9HhvIXWYQubk=;
 b=DxABLqII9tW46v2yxESQ+t9y4x2QueiZ2Do6kLtRvYba9/dlzfl1cQMTcfxSe0MADr
 z6ycyAMNGNyRa+vHKmqhG8R3SdwHBFOc7eaBmPQjklg20GA8JZNtDw1+XUqJyJqbkqDi
 dyTvM5gjo87FLJlsWOXB3xz8Rc+sdWu9FY3NZrUIsvT1666Be9ghEFrwPfE7DNAfW/e+
 R3DSdBmjwXVWcNGQdoiwJb96axqGq4AFFv/OrM/61M9et61PLjcw+iEWcMXLEwpA4jrg
 C4i+PG5HFERkyjvL1BcZjr+v0N2feIthUTV0PvydkiL+egih/XvgD+/zwbkQX6UcNu38
 ZHvg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781615877; x=1782220677; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xgln+4eZtdOVW8GLr2c4M7v5K66yf/zJeHmKKqaT2NI=;
 b=jXda83GBEnAxxlUURM3L0jszcNgBxwJzUo7PZIwvpv7Fa0WT66/d1UMuCtgwSFt1RP
 GwSZXvL3A0IYTLkA5vXc4PPpheHMAwgpRX2wZngUNS4wQuqavHZjFYZhYwbfMVn6muh4
 rCSV/IlYRNjYmJ8MWdDhR+Ca+X4jdsfDiAgKIhAKoMBUYbT260/mbFm1649VR1vdO8T5
 ChMQBvUh2M4ErodAm91I2O8/v2/PiifYDoAkxNwqOskDL0JxYJlVuFr5m9hbqi6i6s6q
 Lurn4ICPgrQGGIqXLed9/QQds1Nw5XUlroHWChHVmurlSeWAinQfB06nn9WMZzn1mlUR
 mMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781615877; x=1782220677;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xgln+4eZtdOVW8GLr2c4M7v5K66yf/zJeHmKKqaT2NI=;
 b=HAi52Ac8dVwt1g4g0sB0npF7puy3aYeqpBy4ORCF3B75c7UxXijdIo0oZhflHRBRoA
 iARAjonL/qyQFPRjykJlkgnaVlUp6A5AEVzhwh6Pq3FwYJG/wJlDFpIgQ+o8cta+l4uD
 sLvOc4KiI0ZG2Dk2Q0ZRFA6FElNpoK43smIeAadk4IzQV2XiP289pu5hycSu6ZfVnAY+
 4twm0ZbRzpiVrkdy6XsNPdVgRu1NFKYiqiBnUpDIYHj7YbaP9fE35YEUaPetIvW0q598
 1xb1MHX0CWZhUaK6ZCdvRUIlE6O0XBIt62nQ821+buu9wvIsILR3zW4yzfkQoTPYFgUc
 qSvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8BVVnonm0rVFLYWhrYIgQal7TY2hbBm4AUwiuJgUU8iDoUTfefQhKRoCdKefs83lTZJ7khcn14wA==@nongnu.org
X-Gm-Message-State: AOJu0YxWMBNBvBMlYqGrGuImP2AL4VpgfVVQ8oYhkQ3vZv5QORFCwTkx
 MW12D+sICPU26/puN9xp/I0zjvQqze0tNNJ8lHRbIxtDVR/duwyFk3iQsivJQbaLUJDhpgNYgyl
 WjUHez4UmNAFNMgDaMHg3vL2fqCGKTmn0qS2CYWl/iF8TaiAcSPKt
X-Gm-Gg: Acq92OH9WGQLWiQ7javrlJW1V7hIL7go33jPaktCyrcHFABzQp5yb7djJGOp2QM/saV
 LxC6LeiTU7VrQThYrrSlN+uhLGwcOwjKwI2B+srnhjIUS+32PORYC0zcpYYfTuffcASrHuhkGaZ
 f2OpzZfwDQUoNzx86wUpShv4gHvQ7uT3p+H3NSdS6j2Ltv/ZoG0m+DgrbNu7pamvTslokCMn+/f
 tthl8mEiKM5XJGzQUn0MGVcyS56Z14ZjSrt4rJyF1QMa5v2NDb7SSIKl+229SKQ8miQ7FYOfRBR
 GGRejNbZCQ5FvdlAvn2wsDoF6X0FLL0t7DumbqaCX0huOjT4MwheLALWKKHx13fqreQ=
X-Received: by 2002:a05:690e:d09:b0:661:75a5:3b5 with SMTP id
 956f58d0204a3-66277f19a0emr15892349d50.4.1781615877389; Tue, 16 Jun 2026
 06:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-18-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 14:17:46 +0100
X-Gm-Features: AVVi8CeT2BeVspAfT1y84eoumA3QpGcNNi6z7V-UNY1ea22-X-1BeC65-18FOsc
Message-ID: <CAFEAcA8Z6fRx7PdGgZ1rELAFsryQHnVY9TdDZPWAj00EgBjedg@mail.gmail.com>
Subject: Re: [PATCH 17/25] target/arm: Implement SVE floating-point convert
 (top, predicated, zeroing)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Fri, 5 Jun 2026 at 00:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes FCVTXNT, BFCVTNT, FCVTNT, FCVTLT.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

