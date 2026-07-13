Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3EDC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 08:50:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjCN4-0001MA-VZ; Mon, 13 Jul 2026 04:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjCMq-0001K0-Mr
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:50:25 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjCMp-0003xF-7d
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:50:24 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6679d88abdcso4057417d50.2
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 01:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783932621; cv=none;
 d=google.com; s=arc-20260327;
 b=WPNQFoMWHVQ3Bj6PiFLjUbH3KPI3gDyzU6Yve2ryi26QZp/n9gzFI+eP0i5rGsT9Dj
 W/kuSPOU2GxjSL32SiOSvO1h55JE9rqyQzyps7eZgzOm7491VeH8XTbvRLW0TP36B/i2
 5M7XMl5iH4yxMA7ZgoclZy2CYKjo2mIrh9CSVZcciq9aJ4SrkZzsKr8qu6vVfuKBZ69K
 gN0vusnj2xjoutRSap7gx9qh0V3IRut4f+CsN9J9xUgULESQpHPQwtf+0p/eGeVAe8DV
 RyCzrLXL1Kk/yJqfB4B19+JRuR4u/TbLMzfoGX0nsYPuQy/Ya3sTpkGgon2k5Le9jd9i
 kJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wdIe0QjZ7IhWqXYYbiQdPLRJP8InRI9h/Lt8YBcv/6E=;
 fh=XcCAsCV1BGBgayZq3XFnExBaqpMaT2ZzfSmzmU3oRkE=;
 b=F0JVKcVbLjFl82tYhIgFYXdmJs0OleLer9FAWjCpgoUnCDbMKPWcZRKVsInuKU1f6P
 pbTgBjRxp+lP5muyBriWyYGxz8/BDTvWvfTAKMBVZtJhUSjW7wymcpgPok/fP62Zan1o
 1zyFGIqHYs5Rccsgha9J773JlTaFnagzf2tDRDKB5JKDM3jXOUahk1W0Te2HLtcKlv/r
 7dbXUzW1Gu7KPxw2yOlnFvYhCm87u8djQ33XdeLJ/43QVccl1t2+BZcdpepQH/2YrC01
 ppfqrEiWpwljCCQVG+8kQhGj0/y5r+lA92UagAVivLR4W8pzSyaWzBNwgm0i7ajDVuef
 /wGA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783932621; x=1784537421; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wdIe0QjZ7IhWqXYYbiQdPLRJP8InRI9h/Lt8YBcv/6E=;
 b=fHl+0Ry5aq/eKAEJY6y5ngXUvYclI4JBbd/Boaatl9DyL5tiEF2gRUrxFMnY/OUdAa
 LURHNtqSqsrjdP/gMnEe4rq28gKm3Z9d1NfUx7TPfZao8mM6WRZ3kXJP5jEhyBWJrAHx
 /opUZbtxK9jJkFTIug+juT9wNgcJ4U5/4n8HS2Yuu40ouYtxq8pSFpgSo4zZolspnKZc
 IENxLedGwB7aSArWwTbneFIhM73iPsDvL8xiJ99KTTluh6RapAIemZsCwDUCNtG9qYwn
 m7/Qsusc4fvLVBt2HpRjXox5GI6mjJvYTC+jABJXXzEgkr98h3aVWJYr/Ijb9zw3TvPq
 qACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783932621; x=1784537421;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wdIe0QjZ7IhWqXYYbiQdPLRJP8InRI9h/Lt8YBcv/6E=;
 b=V4UI3McV8BSHWNqqxU9wThfwkY9AzEM6IZwKDsy6UWOjRxzvC3ItttxaLMvUEpZXa0
 WfDXRTFJhXaqRc4azQnbChQsbQIXZqrW+vw7K0+VQ1G7R9TzKE5KprYw2TkQqDOzJ0PR
 yAaRk+XO8YNJl+m2MWCtnWmXO/FobzCuYUprdQ6RXNNZQHs59AUKVPIYwhWBixfii6z0
 zx0tTKbfCkjjLtj6PAyQ6F8qUqBGyZKQvVYwWxUqtPtJ2x9DzHpm77SE9aZgMf8DKlTY
 7GktUXIVu97U8KDQVGb1HMrzbwprPzI97YagCGa1zEvU2vPIhxTyMGZYrxaa+1mf+NdH
 fDTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RooGxOxYwZj3+AisQj6jiRi+D5U0R/gF+xqKIL4m8I1ekb520vFZ3qAC87Q9U6LDGusJMN9/KcVWw==@nongnu.org
X-Gm-Message-State: AOJu0YwvVbaqgpJE83JmHjxDr6fqpP63FM5easQbHao4Yzbx9tgY6AFU
 6dv1JQpB/fmYbOSkXJzBEH0PSCmm6Q7vOGWHrjU2I36vmm2VFUiRsK7kLxdNidefNcXd0dSvoBy
 wohbdUKSaKSIhfyGN6b+wWqenjKgx5WcaNJNmNoyeLw==
X-Gm-Gg: AfdE7clqJIC8ZFxNxVUb/NVV+XF0+YY0dDlcxwpYXpsj2RCw5KTfKYm24lWbOZnvDAy
 USca/q40H1mwhE6/RuKXatJYXdht3Lb7KQgpiaPzw3644JWOLcsDUkLN1jafx5rVwWKQtrZCz71
 i0NKPdG/TPhxIDl0rLWiUnVlbt9zbtM2HexO51HS4gAzrXkS1NH6azXPWj0odxMXrSTJ4YejmCD
 SwieV1+yWNn8jqvf490AeIUrKr1aWvvR2X6FS7ElI05/02V4/OtvFtCkbpxC5xLBfvz4eB9d0rR
 bvZUPgK34IQJ20zVD8Pgk7TB3l3K9J/xdZC/C6LgCcc/yAdEDdm6p7/J
X-Received: by 2002:a05:690e:169d:b0:667:d8b8:9033 with SMTP id
 956f58d0204a3-667d8b89b4dmr5313759d50.16.1783932621031; Mon, 13 Jul 2026
 01:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260709111225.1106856-1-marcandre.lureau@redhat.com>
In-Reply-To: <20260709111225.1106856-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2026 09:50:09 +0100
X-Gm-Features: AVVi8Cf6jC1_ob4a8bkaAOwDcd24VZ37deqrImYU3De28ExSp3zvcHLtjpcnnpQ
Message-ID: <CAFEAcA9fN1o68y1iG6O_1pWhNqrFFOZXye6unBZ=uvy0OiSgXw@mail.gmail.com>
Subject: Re: [PATCH] arm/virt: fix smmuv3_devices leak
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, skolothumtho@nvidia.com, 
 "open list:Virt" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Thu, 9 Jul 2026 at 12:12, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Fixes: 92e340997f861 ("hw/arm/virt: Use stored SMMUv3 device list for IOR=
T build")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/arm/virt.c | 1 +



Applied to target-arm.next, thanks.

-- PMM

