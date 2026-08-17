Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384CFC5DF66
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:31:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvzJG-00038l-FS; Mon, 17 Aug 2026 11:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzIv-00035S-8P
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:31:15 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzIt-0006Mo-Or
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:31:13 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-836c4474028so34483457b3.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786980670; cv=none;
 d=google.com; s=arc-20260327;
 b=L78UrNp8WiS4gnH6Otmusj/jizwPytEnZ8Fd0R1CWuTvn5QojIBKT4gqfOe0Bz1yVJ
 CfpfAoweFZ5bKnBeGJXW0ohS3RQcLSyBrWpaCGQ+1Clq08wujpqpzJQp6GruVvTDC1wG
 sVC9v9Cz5YVnHGcUo4p383hWaWeTdjgrF5N/IYKkF9qNdnHESbPMX/lv5r39BOaw9A5b
 1EGJQ1gUiog3rLLUCQEdXJTy9Z7uw+gPiZ0mhO7mhXWBin2BvdywkQ0R5fivJDJTX2is
 Lbq0QL/oZJGb+7G409iU+IcWzKivbRGwgFhQbwdzJ43XAlDsNCPMf8xDujhILzN2CCM8
 534g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=S6wGBVU06qe/b4pIsOtBQkIo7D1P6Ei01iPcP21zDQ4=;
 fh=8m7msiuMbSNQuV+aAv/61tGcvz4OeW7JnHwEfCfz7/8=;
 b=RxqSyionmUIebO47zWkc8ma9iISV9ONln5IZpDL4XzV09QODEjtav+8Kwh7qSTed7S
 Ki7R1dN/iNmUEpiBsgun8FVcfyI3gfe7/vcG99U+SWzBRX9pWkkv9sgE0FLepPZDFOmc
 XG5KYhkhzA0zx8+vo0niFa3Pwz88TsykbDmWOop8kMo1mrlwQ/IixyZx1MTEh3uFu90a
 0t2ckVEI1G64GNuXQPsMjJ0+6z5FjqXeLydgjoGDoC254Dk+88GXWLq/9Y7Q7syjfI18
 F2VP9BSYJKb21JHzGcteIA5/CyJbkKrtSZrL4tFQLFNmNRUILqcUFIFggrSL/HTZbA7c
 4YZg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786980670; x=1787585470; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=S6wGBVU06qe/b4pIsOtBQkIo7D1P6Ei01iPcP21zDQ4=;
 b=BctK1wiDBGc4UaFIkXXqQMdT5/x5/0BafuFVPYBPOwkxLxDbpg0/JcKgtnpRiVhZ7J
 QXyJ8/9FrP2zZhxg357n7b2z0RZPIjmWIvZouTUVTlyeNzKjCxy+wezsNkzLc2zD8VlX
 WKuepTLdtHIj3KCG6tDBdRX1edGtvoH+3lAeEeNLRsNyCGE5EXvuuVPiXSt7gI8cb5mG
 mobqcmM1nq+awzIsD0kez2qHOa7iABDvjuTvcJcCcq+rj7PuX9bOWfSLAFrHqf12ZHfX
 +40IBvHBBeDZqsIoV9yp8N5RU8XqY/oCcyI81cdDzU0eeQ6Da6oKbJlDE1sLHId93/2z
 l65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786980670; x=1787585470;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=S6wGBVU06qe/b4pIsOtBQkIo7D1P6Ei01iPcP21zDQ4=;
 b=Q9nhMPJdVmTl6IAFeg6Wc6sJcf5S10oCvrntaPS7L6Tl/vVBih9/zixZedaVIJsuAc
 C9TbfN5YGYhzPbSa1dZpmOEv+qQKShGCmxjIABsG6SJLX2g8HckW5Pu68PO6ZgsJIAjg
 qrzSc2ERShB2bSDxRS4Hs7jZCKkHYD2nUWN+hCsnACBafpauxuZ95lGlUjj7l3+nZMU5
 tJxfZ6DLmbMIShFL4ZUo/VX0Um9RNqKCrk8yplgersLM6gl5Q8IEwgnDeAmX5XSfJwSI
 +YkRlIkM5Wmt9F0LqkV5lsyb5ZMNukP0pELxQop+I9fby19GmnAmwzUZkMI4/6+0waZI
 bZ7A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpKosayAeiqomiL0lyL4zmalEm2TQwOYQe6JLQn88JAfu9V2ta4PxU800AlaliatfJqz1HZ9qwelw==@nongnu.org
X-Gm-Message-State: AOJu0YwBvvOTf7PFvard/H8frE/uVjN0XVCaX6OnBqoq8zz0HesQRnBq
 T4Vkix5ZkgLVmGAoPrt+FGAp5hr9ekFsBDgxbFuNycBa2pSLi6Q2N6DKx42LBaE9hPhrX/w2iHK
 sxf6KV8jIPZcxsdu0WyW8+87XBi6Gbdf+J1IT5I1QIA==
X-Gm-Gg: AR+sD13bwlh9XqREgQ2mpzDHFak//Mn1xsydEouBj61VJhE7l1fRTAkIu18HxhGFnFO
 Ynj0zl9C1eXPtOE2SKpR71yRTfvWsPlSH1s6VRuu4x9MavjOhaWxRjFw50bmuxizfqUPBDx29FB
 siVND6UXkiHN/mOsuX2Jq7TW15GN+IDxrZNDN9f+MvWXhWU4fUo4i+6y3dL/gZfCFCnIa3OAOk4
 Dmhy5XKb5DN/jv1bMvg2l62YKX2G4AwqhmNrMsu9xHEi0xw8hFK7QUjJ+gyqwr/ybbMhahODHMp
 tZ9Y/5btuGT0BxjXQZgX8kUsBUU7WIOd+CsyxHiZefj3CzO3u1MM+7js2AJZjhL3ymCmrdM5wnd
 +xl9qKfGP7YWiGxd42RvytCk3M3NX
X-Received: by 2002:a05:690c:6893:b0:812:996f:176d with SMTP id
 00721157ae682-8370d40c556mr80311837b3.9.1786980669460; Mon, 17 Aug 2026
 08:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
 <20260805153005.9989-4-simonxhy0404@gmail.com>
In-Reply-To: <20260805153005.9989-4-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:30:57 +0100
X-Gm-Features: AcwNN1XszKOs2g9pjFMLJkd0BoYPwf2SNBrcIcQ9MFVlPDArd6FUb87k52Jg0O0
Message-ID: <CAFEAcA-jYZz1Ak4w5vgWGuzJnP4N=ikthmxRswY5=ZZzXWiRzw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] hw/misc/iotkit-sysctl.c: add SSE-310 support
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Wed, 5 Aug 2026 at 16:30, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add SSE-310 case statements for reads and writes.
> Add new SSE-310 PIDR and CLIDR values.
> Add new SSE-310 PPUINTSTAT register as RAZ with LOG_UMIMP on reads and
> RO on writes.
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---
> v1 -> v2
>         Add PPUINTSTAT register
>         Make sure comments don't separate case statements

>  static const VMStateDescription iotkit_sysctl_sse300_vmstate = {
> diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
> index ce72258a84..8e1cf0012d 100644
> --- a/include/hw/misc/iotkit-sysctl.h
> +++ b/include/hw/misc/iotkit-sysctl.h
> @@ -53,6 +53,7 @@ struct IoTKitSysCtl {
>      uint32_t initsvtor1;
>      uint32_t nmi_enable;
>      uint32_t ewctrl;
> +    uint32_t ppuintstat;
>      uint32_t pwrctrl;
>      uint32_t pdcm_pd_sys_sense;
>      uint32_t pdcm_pd_sram0_sense;

If we add a new field to the state struct here, we need to
add it to the vmstate data structures for migration. That
means a new subsection with an sse310_needed() function
so we migrate the field for SSE310 only.

But since this field is only ever zero because the register
is read-only, I think it's simpler to just have "r = 0;" in the
register-read codepath, and drop the field entirely. If anybody
ever needs to implement the register to have real functionality
they can add whatever fields/migration handling they need for it
then; we don't need to try to guess now what that will be.

thanks
-- PMM

