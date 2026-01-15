Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A928CD4116C
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 11:17:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgLLN-0000ZJ-Io; Thu, 15 Jan 2026 06:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgLLL-0000Xg-TQ
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 06:16:48 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgLLJ-0004YE-Vh
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 06:16:47 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-7939e7b648aso7755877b3.1
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 03:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768475804; x=1769080604; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcZF/7GWxixuSqAgv6ZHAwCssT4mDSUi4FgpBykfzsQ=;
 b=S6uXIkoJvUT/ooUovFZ9t6rZv3xSPWNwAjTXz6mFDPQzDIRGPkSb22ypbD1B8Fih35
 48ona1qZHo5XDxhdTyViYEcY+4lVrEgl8YMrWEwsT8682lNyEKW5UK1fckQ1XWUjkZdB
 s1Wg/KEMCD0UAM61HnK7oHP8sG4xwd3w0J4H5YCIYP/s4jCOHim7IYic5pOnqdEBq1vi
 J4WE8E2u6LMe/XDmnyKf4wMEJq3Ea5meSZvCEKcYnIyz9pA5qG8FpjPkKS3hNJauWguE
 /uFGAH1Cn+61godjGBBSsm2V767AKZJIBloCAn46StX2/DByukf5qhqpWr/Byj6TvQPK
 tEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768475804; x=1769080604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CcZF/7GWxixuSqAgv6ZHAwCssT4mDSUi4FgpBykfzsQ=;
 b=Cf4MJOX3wDJtkRQ9VpeKtMsGEk/BIbDSmXRGQsZgZykzJttxGdT4GW2f7Y5+PTd5iE
 mkJWI3zaQ9E3XSq36633WuiekwAp+a0FsbAzoeVt28SKcStiWQzpGwgJRtCGAve3Ojuw
 UGFXoxAUA+QUeJFRnEsHCcp2igxSp+rYXDIfi5vk0r+4NQ3JzZQtkh84BWLNQlMkRENF
 7rELMW35+W/oJg1lAy9Zv87CZdYr8XzXLaKXsGDjxM+6mxbqW/n3Bu0+yCl58qOFEwEm
 osOv7Drd5YuUf8SU4uCOa0acWQkbpDxXbJEjSOUz2vuiMF4dz5a6ieiOeM7+XezlLJTp
 6fUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0A0LlHEkI2bOoWUj2tI66TPbAShBcRAh/IUDpDlEyI0mXDzVQqOhb787lrCWrwvKfOeEmKjGOdQ==@nongnu.org
X-Gm-Message-State: AOJu0YxCNTr8krsbNZ2NYuCLHSTpT6elhx/WJHJ7Tb3/gujTSQBJIaaR
 eQqlQe44kXpzb7XQvT/eAL8uayq3NIKdkpEJ4bBH5tycDY0jlqPfj5h5kfzur1gkxUOUs6TX3av
 It84jF8C93rsDX3+gGQFXaCbONZhE5uy2CLPOFi7Rpw==
X-Gm-Gg: AY/fxX7IgKyJbeaUCA/7hAru0eKh3wAuCOC0vNrjYEYqZqeROfnyBbiB7He1UMLb533
 HfqaISPt5NADU5P7tdBjK4eIXqYB/4kyc1skkkj5XBX69OSq/6Dlqur2wQshhK1j5F6fmD0eCNN
 ZP/RSy0SWZc0lylZNOKLZNqz7Lk4rRlgcBFT7BL21qzrRU88bxJxW3JEWpIOELRfZPQ8kSLQsGn
 zH9OnLFspuPHYQAH/uB9eSi5DGKVNl4RGDz4chicgI0T8tAqY58qZTe/c0CjPVt3ihBJhOD81qu
 49hvkkmrcfJ/2nfRRcyFkps=
X-Received: by 2002:a05:690e:d08:b0:645:5540:2cd3 with SMTP id
 956f58d0204a3-64903af906amr3520014d50.3.1768475804147; Thu, 15 Jan 2026
 03:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
 <20251204093502.50582-2-corvin.koehne@gmail.com>
In-Reply-To: <20251204093502.50582-2-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jan 2026 11:16:32 +0000
X-Gm-Features: AZwV_QifDk-lQRCx7or8kxbFwFChpTNLSImgbJvR7xHAVS8PMBOdqymYrls1M30
Message-ID: <CAFEAcA8UB1yc5t71s5bYWSANK0t-Cgd_e2CntZRfMNqq-QEooQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/15] hw/timer: Make frequency configurable
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Thu, 4 Dec 2025 at 09:35, Corvin K=C3=B6hne <corvin.koehne@gmail.com> wr=
ote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> The a9 global timer and arm mp timers rely on the PERIPHCLK as
> their clock source. The current implementation does not take
> that into account. That causes problems for applications assuming
> other frequencies than 1 GHz.
>
> We can now configure frequencies for the a9 global timer and
> arm mp timer. By allowing these values to be set according to
> the application's needs, we ensure that the timers behave
> consistently with the expected system configuration. The SoC
> configures the device correctly.
>
> Information can be found in the Zynq 7000 SoC Technical
> Reference Manual under Timers.
> https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

