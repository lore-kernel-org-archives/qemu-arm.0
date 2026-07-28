Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96925C531F9
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 16:19:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wokWN-0007U5-Ay; Tue, 28 Jul 2026 12:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokWM-0007Tc-Or
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:19:10 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokWL-0001ea-DB
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:19:10 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-667f1390f58so4408209d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785255548; cv=none;
 d=google.com; s=arc-20260327;
 b=puN/yewHEwd8shPkn3CFiAdMuMz1VbVU46aSXHJ8SRnxR98S3/LSHRlrsiz3nIFUNM
 TJ+woRDLHw60PueLE/B0b0AoUD925K0rkPajHkcPwPU63GkPaZLbEiZvQnETAPfDVPhB
 ssuA5AF4FQHjMSWHPexscdi3L/d7V5McL6spIEOgn9zafSDV1EFChBLA7hVMlT2BAbnd
 dK2wydwVc7hI+FGML2//iSN4GzBDkhy1q7QV8+Oq/SEFHvms4YVmKKB/E83t3E1NFiYD
 JuyYeAuKBr0jK2+TU6IObVwNM/lvfZuiGQqDOg8Xj+QXYB0+yj8bYjifvJ4ad7ow8add
 6prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fHk/7TC3HZl9S/mZJw1oYBpSSU1S9w5VOIz67VDbGw8=;
 fh=diV/zWfsnGXQe1oiDVJfZ6Uhjjo0Y4vaAk2d/cJ3xrA=;
 b=IrosMqVm3xclo/BO9mJqd+uRqjfZc98/ycrZhe8teqqZG+spSfkxarUJqT7RhlkQCN
 NtIUFE1vN4Ui8rFonPzi6L1eVs8Z901fr+A/wYFAyO80j3gH5DGSgCCiGC/yvswM/Pqd
 ulb8ou352TCWSkPFizt4fHaPt/6BdSciXqv3ySm6BJMXa1Z2If9RFDx5Az2Zlezux2qq
 cMBsJbOIaAYy177Y1AOQOAl5Vb87FotIo76lyTu+ai702EUIJUtHf8ixUhYibrvk0mNa
 dqINJWHNjJjtzNNi51Ag9KmOCyzDwzqixXYxDXQ1Bz3mKUCkUDX367ZF8ClBmjMzGyMb
 f9eg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785255548; x=1785860348; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fHk/7TC3HZl9S/mZJw1oYBpSSU1S9w5VOIz67VDbGw8=;
 b=E/lwNGc67m1IJlNCtcX2LIr02Uwfs8PVIvR0HcwZfuxsDE9Nizy8WOaINjbjQSwFsw
 p6d4Ce9j+Z8/ODfyH9790mE0SsGjJbTu4eXYRKEhI5nqZBdXgTWjd5bxWGEPFlt3XQ/0
 fiygB5Gj67r1kDzMTl9qaqwS5Ktl4sVZqQomB230jAKs446qMxY/c7Xd23P/jK2vY+e5
 H+EKticJLzRfVAMVBb+be2cHC4ajZyPJ6kKOmrCzy/UAKMaeln+IUbDjpTWTbK4HYNWr
 Jw+nqlo6G/oEg/M15OJwLxvxp1KyOPYuw0k6wAhtoY1kCfFM4wSCJhg695HlUV8+8sNw
 5TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785255548; x=1785860348;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fHk/7TC3HZl9S/mZJw1oYBpSSU1S9w5VOIz67VDbGw8=;
 b=nx+BfID4cfmWnpM7CyrrWa54yLByE4/xCOnbGYE+x9FfJm1/IpBMZrc7n0o7xrDcGq
 ddG89XrZtbDNqAJvwYQNLJqfV2aMBXv+KoM5usqFloof/gaWtJ9wBOkvPILkAwdg+KWO
 B2Wc9TYA6xUUqaTJasVC3zJCnFtApPVaZBnu/a6deRKgYdc/Li9XYGUWaQymJdV43M3o
 k68cn/0L1fqM9p2NNFur/ByvQAoiBWj8J1uXbi6+y+NZsIlkEg5jTjQvz0tFeRIZ39PC
 meKAd9to5OmV4kJ6nUe5XJwHrV5uJ4MqafZwcmKusAfb+7vaH957kA7g6cS6T2+CQrzb
 wUuA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro+JSU1dZ4BdBOe0pFLtZAvh1L9mT/GdecKSurHl+nQSrvdd5ICMrVYFjdG9qowWafSpMP5YTpgpQ==@nongnu.org
X-Gm-Message-State: AOJu0Yww3doPQuyeTG3nUi5WFg5VwPuwAEItErPJMUUfEBw9VBasYYQ6
 uKFoaFaaaR2xefutDdYCkdb0Px3v8T9Lc7+tbluu3yNEDrBtxroldqm6b5UVv0UXE6xbqAMTQ5r
 Bes4DNYMujShZ6vdxMpktpSTLB9jNXRsr/hzWgq8DfQ==
X-Gm-Gg: AR+sD11GBi+XoVNPJkxXtRgBoIiZByf+qmYB8cPyPyYJxxEhnnn0VJsT9+ZGyJYwSiH
 xrfqv6fGGNJqzxLazBXiHQifPg/qeYiSftAhMiai91dpt8NQPoKuHLWumiBxFn7j5hmqLQKFn2Z
 C473d0y8e6p4SqE/SfFEBs9odH23WCIHq1ZrkALFY5KPnn/6vKMZU+8r7TedVChl3vU0WIuRnp3
 kuhm34g17VOlqQsbCXiUpPKWT50r5JvMwFSQuPKCOOwggLcQm3PYMH/n68c/YkWZfff4rrfDwaJ
 z+4MvL5uSKH/Fb0xtDckAVe/seYRBm8vLZRRX9Xwg83KKA==
X-Received: by 2002:a05:690e:4402:b0:664:ef34:44 with SMTP id
 956f58d0204a3-66905828477mr679502d50.77.1785255548203; Tue, 28 Jul 2026
 09:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-17-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 17:18:55 +0100
X-Gm-Features: AUfX_mxnLjyroR6gMg_ZLt7B4SCY-3UgzLrhxbDEqv--JB1xvBDg4AryHbf0QxE
Message-ID: <CAFEAcA-wpd0CeUSSko2NSb8W5DUR6VNODv+0AVV4E847_HCu6Q@mail.gmail.com>
Subject: Re: [PATCH 16/20] target/arm: Implement AESD (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Tue, 21 Jul 2026 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-defs.h   |  1 +
>  target/arm/tcg/crypto_helper.c | 47 +++++++++++++++++++++++++---------
>  target/arm/tcg/translate-sve.c |  2 ++
>  target/arm/tcg/sve.decode      |  3 +++
>  4 files changed, 41 insertions(+), 12 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

