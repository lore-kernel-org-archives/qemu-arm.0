Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D62ECCD183
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 13:56:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8J1k-0000yF-BN; Mon, 13 Oct 2025 09:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8J1d-0000wY-Eb
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:55:49 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8J1X-0000fH-C0
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:55:44 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-71d6051afbfso43392397b3.2
 for <qemu-arm@nongnu.org>; Mon, 13 Oct 2025 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760363736; x=1760968536; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DftGonkAzHtlkmvYZhjlN937hlcBu0rWVkqrG9vBxcM=;
 b=EPb0oHdbccMJHlMZ6Y0LNJE+EW8KymHp1W1WeSykKwM3XgDDF9gUqF0f/PjOvzGLMG
 VAi1YhQhue8GP30d03Yiyhh4kYDZQjYyVpJixqEOaD6C5DUr2jb22yP5BUD00W3pKoQX
 prHvC9id2SDE3796amzA5EypzmFgNqHBFJClVyx7jjLJEIxojDpcFl1kodv0ZarqptKw
 fF/Yi7Cu1GXU/yIQztoDMXnXy47SWIiFGSlbvelxEjUJddX7OY5FOgywnwqCilEB4eUs
 MHVawo69usskHh2C36sp+jI7dZpWBbav43/DXo7FR8szA0ft/8m4jqmr6178LrTHwkYq
 k2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760363736; x=1760968536;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DftGonkAzHtlkmvYZhjlN937hlcBu0rWVkqrG9vBxcM=;
 b=feF6GFtJ6iUoZ2w2jzC3jv67AjBVudD9KKK6sQRRVpe+QfH1hslcSGTmNdgFKI483I
 iBadFFH8njeYo/sXJ58J/NzZKGb7Z1tEE6YSg213MDX0Uj2R6mFsOtaW4H0D6WANIww0
 jIDtyw1FKR2DRkcvCT1iobJQHeOM1jwq7yiilb/Zboq2F35vJfwe5OqWWiaZA+D0Fe1E
 qIpGoXmWsK0j+RBuj/A4Ix+vasted0cVYFQ0mgcQpZrQCTZGQ4B/cci856c57rgmcdw4
 raUN3hY7AOQGIEd11WBXNlkeQZKt2AbLfvi+zAugu3aletCiH7LorHjJoT0YKKwgI6su
 qaog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXapGksUeVTfOs5VXU6Mu/77P8pIm1I3wiUfs6Vqzu7Ve1XB2COfOEbCB/OCn8JkcMATsSw7nk4DQ==@nongnu.org
X-Gm-Message-State: AOJu0YzO8BQcFkyjpGHDBnbtJG9rJdMUD2mwN9nOe8QUsEh0mOwOaoGn
 4OQrNI1Wm43kh72unppg98TiWy1KS0B8UF1Gwoi9m5g0+FGn3JrJCV+YHaZ8yRiBx3+M9vJMzo+
 DQK92/6O3PsvWqBUkLm2EuHsk8RBKQMbbX3EITqQqKw==
X-Gm-Gg: ASbGncvTCfPzSlCtunmqA04HmAiKCGfZAIcSEwW7ZApeUL6FZ5chw4yfktwHoH+yee9
 tFvh/nEM14FifDdX5wQb9dPZqm0mrmkc7lNVJmO0Tq71CsESSvR2WDNcGXJ7R4enGYK6drDD7S1
 M7l0BGQYqlKvaH7XBJIsnep7uwOtOo9mL4jFxiH7PrMY2bVmI/7tBcG7eEl8G1yBKaeIyQVgxtV
 CGNtlNAr8DEzSeNnnurSEhyKp+98xQjnDeLNGPsnymfMIQGNesN
X-Google-Smtp-Source: AGHT+IExt6YzVA8tW7MxPPEZLZCAw4fPg5Ot4Jo5VoItpi6EqSLHKlCkn3+4oLXNEHw2sOP9EVseTRwz967598lWxeY=
X-Received: by 2002:a53:c70f:0:b0:636:875:62ff with SMTP id
 956f58d0204a3-63ccb8fdca7mr14534494d50.35.1760363735513; Mon, 13 Oct 2025
 06:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201917.685716-1-richard.henderson@linaro.org>
 <20251010201917.685716-3-richard.henderson@linaro.org>
In-Reply-To: <20251010201917.685716-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Oct 2025 14:55:24 +0100
X-Gm-Features: AS18NWATUfE0kArlrrB_tsoUi5A_GVowUT2hboqI9sraW6OaFQBfyYueteHq32o
Message-ID: <CAFEAcA8_cotLWg6GTc+TFRJCPwVDG1743TRcXmH+LLJPEpSbRg@mail.gmail.com>
Subject: Re: [PATCH 2/7] target/arm: Implement MAIR2_ELx and AMAIR2_ELx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Fri, 10 Oct 2025 at 21:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable the SCR.AIEn bit in scr_write, and test it in aien_access.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h |  2 ++
>  target/arm/cpu.h    |  5 +++-
>  target/arm/helper.c | 62 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 68 insertions(+), 1 deletion(-)

I think we also need to set SCR_AIEN in arm_emulate_firmware_reset()
for the "have_el3" case.

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

