Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08519C53219
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 12:08:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woK7x-0004uk-9y; Mon, 27 Jul 2026 08:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woK7n-0004u3-3T
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 08:08:03 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woK7k-000694-VM
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 08:08:02 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66804667af2so1866550d50.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 05:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785154080; cv=none;
 d=google.com; s=arc-20260327;
 b=PqVGi9af1k/ZxNj6LB+yFHdVK/VAIC0Z4hCxSU+S9fvzPsInNYoy8tjN0cSNbjpb36
 4y71jIl7PpgCNBPVmX3tbYqRuVrTng3nFihrPbZ93VNWZTMa0/QEsSD1DE25wzhlZPnS
 7ldb81tpKAOt1+Xdx+4FvxmU8eR7y015bYmH4xbI3sg8DO0hQ+W3bWZ1k13wBww8755l
 zwOgi2ZiKTjpC4JtqmK1zVOe9/ZBOL6weu/dQi6HZYhQIH5NCjmaa4hWDSWrz64vsPx6
 GJxBahJBTt5Up0Sb88S/x53nG3IGRTLrM7hNiyDWf6Sc1rriQ2K4TbCXq1gHS7Jf7WfC
 TLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gkmJj+PSYlZ/UYhIQrLFlknwuPIlAfsGZizlk1PsWaQ=;
 fh=X/0M8Hipi4oCnDiC1rXYRLNAP+KGnuM2DB3qE81F9Nc=;
 b=szRiZnCRNZQ2gc/fe6mRESTvh/DqyNKx1pT1V1i3i8R6CFTppKLj3gJJgwwZ0BKq4i
 Jybh4IRVClvY/6ftFeLVwgDdk0dGtb1nsjsjCPopO4PDtyr7t9nPxqE8ef6K+hkswspu
 6+uhkZTp5hMakgUCUCFyp1I/yyTrfP413KOwaG1tDJjDC61thUMiKERuqVGuaPqaGiaz
 bcnm0C1xX19CAhEP1C29LKNGgRX2KIUiUTcahnBQUfNMX2S8inl6epOaZo7ZKavdxIrw
 1QBSzKzhMMi35JWZcSkCd66dJpFtcwu2x5/h9RL8FxjsLubJ6Mt+kW+f1/+Cvt9AQXzD
 iWZA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785154080; x=1785758880; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gkmJj+PSYlZ/UYhIQrLFlknwuPIlAfsGZizlk1PsWaQ=;
 b=bgUq4U3hYATb7dcTl2eg7JGp3RRhAenORMc08wmNhMk+sdJH2VrlpGU1fjqfXAi8h6
 vhhhJcioA9Jr399mGxNurPioZWlCaqkaghnUM/AbEQyvxMZLX9C/EFriQ272+5MZpufC
 77cAzOm5dXzqr0WfqOMZrHvd0xH16+fRuJXbxS5rxA3EkvW0q38RkYn37rsW7d1JgMCp
 vbzPHt6T1WL9sRmmvT31cRCkDzz0EFJfiuc8ezOLTTVCMFRpRAb2Hi0d9rt9QNfk8K0s
 C1b4yVENX19tsPchOcAKdv0uDkrz4/U7DhAPkdSdpWYjVzI7kh9ZIvTm9uTc5bGmDyvP
 OPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785154080; x=1785758880;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=gkmJj+PSYlZ/UYhIQrLFlknwuPIlAfsGZizlk1PsWaQ=;
 b=V2gYsOoAOoOhgSn4qtFkeLyYv5bSZmZ7cjodN/UoyBjdmkGsrsudqrWMwwq2RbZh4I
 KTowzWv/K/wEKauTIi/FapNkZO44uakDnR49fLaDS64G5WTPWT38Pv8BvSW4e9GW5d3S
 3yarb51dSvZ/SDq21pUWSftWcjSdHtj4s+Lv7hyJKfHYaW2lE/l/AmWUB1AgksRfYZH4
 f984TxZuh3sSURxjSvglRQPLRvKHlaEhnKSQqRZZo1mwNEUI7jvL5fZRrnRjTFcND5Mz
 J6582aHgYk85IpyWkanLz1Zd22ZZEGASXAb0k4LhUj83tqfagmDR32uHQY9PjVyQV9DO
 9fcg==
X-Gm-Message-State: AOJu0YzA4D6w/PfV3dSE7TVzPN8facBvcX42rFN4bpWHenxQ+V2aq9N+
 ejER4bkPuatkq3alciL6dEzhY2ijaOzZR2BWGgKKUk13RPD4CjRT59IJgGd3jdiM1T535gS55er
 Gau6yMn8zRQ6SDgZEebyruSfSFzU0MIgG7LG6Dmf1qA==
X-Gm-Gg: AR+sD10t02Z0Bv7xYG+bppn0htJvLSdjUCZR/QVzqQUEvsi0tSaWaXFWcsValyvYrh/
 g+aU5laOlUAgaDbytPhXM9abBunw3kPWZoY21jfrm7TsbgQyG1CMfeTtpjhoupD6DgZ3z8V3V50
 ziHl+vKmRrO5vVrJacdgazm4KCPqvlZ5EaWSs9JSLovEZCaYh/lBbgfEN6EiJJQIilq/6YMh8J0
 9e5PMjMvhVRIrfif0BHVwi4OSzEymdoMlyPds5SWYT6IjQyGekd63IQBa3o6tzm6jTxq9Ob3G8H
 ulv//O5dsw5MCyxBA+Of1hPTVkqyDtXQgfCRhdseyGt2wg==
X-Received: by 2002:a53:e023:0:b0:668:9148:17ea with SMTP id
 956f58d0204a3-668c7ab6386mr1545973d50.59.1785154079713; Mon, 27 Jul 2026
 05:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-4-gshan@redhat.com>
In-Reply-To: <20260727032649.145381-4-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 13:07:48 +0100
X-Gm-Features: AUfX_mzup-mtlBO4ev92vW0h4hcoH24EJ--or0sdvnyDcjb8PhbjWdaNAFDIxrU
Message-ID: <CAFEAcA9-1ATVURTH9hK4a0YcgKy3G41PnYdO38c8UQjsJHUqhA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] system/memory: Make ram device region directly
 accessible
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com, 
 mst@redhat.com, philmd@oss.qualcomm.com, richard.henderson@linaro.org, 
 alex@shazbot.org, berrange@redhat.com, philmd@mailo.com, david@kernel.org, 
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com, 
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Mon, 27 Jul 2026 at 04:27, Gavin Shan <gshan@redhat.com> wrote:
>
> This basically reverts 4a2e242bbb30 ("memory: Don't use memcpy for
> ram_device regions") to make ram device region directly accessible
> again. With this, the bounce buffer is bypassed in address_space_map()
> when a ram device region is involved, potentially avoid to overrun
> the (small) bounce buffer.
>
> Reported-by: Julia Graham <jugraham@redhat.com>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Suggested-by: Peter Xu <peterx@redhat.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

