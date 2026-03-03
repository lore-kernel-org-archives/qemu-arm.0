Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBFEEC1431
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:35:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxO1c-0001d6-TL; Tue, 03 Mar 2026 06:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxO1a-0001V1-Bu
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:34:51 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxO1Y-0000A8-Uq
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:34:50 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-797ab169454so53084137b3.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:34:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537688; cv=none;
 d=google.com; s=arc-20240605;
 b=BN7rZS/0bpNZXUrqg/c08MoNCIAkoE79JyYGer6Y8efG21MfpSb869Wqntq1zdTutx
 kH3VrdYr3oNxEX5A9Ojky4Btbj0mc4omBpxyVSyfO+HnhWJZzuCaGzK+7Il8JKyGghuq
 KGoQZKkWEgikdl0qiNRAutoKg3XuKFFWdRam/ls5Dwr3yawapwP8rsf6BmS05wU2wniF
 LAjKwH76LHZEjrRld+5kSNz9+qzM2pO67fJdo7EwYaLvnNrmSu+nAcBIF3ZF8GiUv4BQ
 k+hlgFpQie8pU71G6SbTiUYTL4R6+c6E3tOMoy3Qjkx1ivZ9rhK7FXvUWA7rxZI0UvhW
 3mog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5NRJS8Fmj6taE+ChlPXhko7izMNTfy88kisQKe4FMyw=;
 fh=3JBEHFWw8lcj+n2u66nZ0phzgnQjjUL1YmVkI+a2ToU=;
 b=Bezlnsau5n+tE63wIEyU/ewDfRGa9h192jNcoq4wFu4iiwMrvzOB7KAwMmJyKKYNAQ
 H3UmRpQrBJzuZXGrF1EYRuubAdBjP8Cvbx/PNbLhegsj/aUpDc2l1DgrWBJDrhpMPXAc
 FPG0+GugC3J8A3jaxpgs3D+yvaN3Vz7i5kU1CwYrYUj2LkUsQVU/WpMgPsCBVsl5JUxA
 g3d+SG0FZnYGptmRn47+AQP4uCWGPgmM5xZTU9+dspId+vwXxBLlzKWtzrBvRQycD9Yc
 zYFgqND7yHIP5nZak6za0Dlwa5wVsqATwgIHYKoEwNv1/7JeHxClZadRHk0DCgY4qgbx
 v+MA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772537688; x=1773142488; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5NRJS8Fmj6taE+ChlPXhko7izMNTfy88kisQKe4FMyw=;
 b=gSZwh/W1hpmmYKGuFa+pFTP2z1O+F7Ex28CW2NdL6RA65m2uufJarkev5h3xPtgZdG
 iKHKEqRaUs1+d4kAu9GKUjcUndMoOZQErgbWTfCNLcFN2qb5mg903lsR5jCR0ulAYMZO
 f1xX14aU/FkedZGCYPP4T9qmLJjygFDRLJPEgEIALuDtmN2+8dDV5zPpK5wgb6KfaEx4
 +NFUC8vtOTqo0jjzIVT4BLFMgbeGmqwwADarZgX/BfaegHy+itWQSdN0nR+2bVut4Tug
 Fj88mTHOfqftqlPcQwu4tnfg14z1TDdzQcAiZymH8gZnm9ME0I+BfjKa4eWcYvX+19vb
 50Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537688; x=1773142488;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5NRJS8Fmj6taE+ChlPXhko7izMNTfy88kisQKe4FMyw=;
 b=kO586E4e/pyyK9XkuDUtxDga/j3fjy0KwzBZZ3/W/hr0g52os+2mzC2foQddSVIy6Y
 inezamfTbGfWYSiTYHn4KAmQ35mf3lI8AGKFR094VwjgLNE4R0tbwnNO+TnMpUBNRoF4
 x4I1LRPJrohf4xm8jiFHupVf3KoBgX2jOMFCoN+g/rPB+/pj0vv9diKUi4TZimlkUGok
 ps4DpABMpiCuA/msK3gH+9Dn2W9CG55638P/tTNj9KdmxNhdzAuKAnTLrqXIHzfQBQE+
 xea8tgmeYd43wIBoDtIHai2mAb26hGXLKxVE5DX3h0REQIvU6O5wfvQfvSWqXBrF9TvW
 ayGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbyXeO8Y+OqEVssrcipbsn8tdN2vZQdXmlQDZGrP/1TWbFTtQCxnxGgRwOIwcn5sPGaoHhUqRktw==@nongnu.org
X-Gm-Message-State: AOJu0Yx5WOi8D5FFfbzP/bAl61lvSV6F0GCMte6Z9dJucU300GULRlZA
 Q8lRUB21o6S0hbcIAJuCuY2YffCgXm6viv7NeFvY3cMyQABwhkxCR3t+3/1wx3lSDrjqJWwSiPh
 LP8PCWDxtcKE1xjrfxihCxG1LP7O+bOyRQPod2Jehcg==
X-Gm-Gg: ATEYQzzjQ46Ss0Kv6jwxQr+7sI/KRwJCpAG1MPqrLLF48N1nRqtvtK3TLfcPw6gCMOq
 mkexVYwYeHE1h0sbdoj3LQE6zeZlzgTYEk4SXU3ukqSh/zDObM89LdBCKmr7GnWutn13eeAaIUh
 0piYSwplN/qHMq29FqHqBvpr4RkSoh/V+X6QffdQwaPCYcYF0F3fRfO0bvJJCShtc+Ugsy2olNW
 2ehyl1SbP2WmrrUudIh4UDU7e2h0i34kibttQeZGe4j9xAVDLAkJoGAMw1F7CVg9l1qm6fTitfY
 xKm+QlrIMsRY8YJX9vgA8FRx8sbbgreNkfH5BbLEwjx5P83PK0nFt/Mc843OpT1IQZc=
X-Received: by 2002:a05:690c:48c2:b0:797:bc43:79ac with SMTP id
 00721157ae682-798855d40e3mr140699477b3.32.1772537687809; Tue, 03 Mar 2026
 03:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-10-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-10-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:34:35 +0000
X-Gm-Features: AaiRm50vj068LkwKq08-bcjNnZxLXBQBnXjc0992kjCYPkAh0Tw_P8_7kU4mSjE
Message-ID: <CAFEAcA8u=V-hn1XLMw4Q9vvH-=q7aKq1wPb5C_82+EwbDAVLbQ@mail.gmail.com>
Subject: Re: [PATCH 09/12] util/fifo8: Make all read-only methods const-correct
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Allows these methods to be used in const contexts, i.e. where the parent
> of the fifo itself is const. This is in particular useful for Rust code.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/qemu/fifo8.h | 10 +++++-----
>  util/fifo8.c         | 10 +++++-----
>  2 files changed, 10 insertions(+), 10 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

