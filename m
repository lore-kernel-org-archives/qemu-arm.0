Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BCA10ED674
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:15:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w67y5-0001vx-IZ; Fri, 27 Mar 2026 10:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67xu-0001qw-1T
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:15:10 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67xq-0006jA-Sa
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:15:08 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64ca423ad53so2142378d50.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774620906; cv=none;
 d=google.com; s=arc-20240605;
 b=DapyWCuE8FaphGt+F4KAJ52pOE7nP5q4v76r89kTwJSJL5XFBg/mG0IJhFa1xTlDhJ
 8gBQJEcTn9ZOdPz1SkAuNdor3BuvRnFSELIXw5T5qPOQGA4Y6pJzIX6v6U6nKhejOb2G
 aGgOObw4/rk0mVgPMmnC3IGN/23upP+KlKVlSW1iQD8gypVPDq3uBdETYyX8gGlX2iIn
 d8tO/lnvyvWt1nZO0wSveGeVKi3DQFsBnyReyAAZJePS1frfs7mJP9gpcFSUe0YtX4gK
 ryipg9YJPvoUXJ1o4HSRAeD7gPhe6hwzxoaEf9k/LSdiZ0zrq8EXEI+kKWdSbzsWTEeh
 bfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MMoCz01d3cmlBMF4Ojv1E+E/bWckDcyAWJZe1tRwo4s=;
 fh=duBhzIeZbse6kOh+LIdGNfUw86icJkAvklZtn0r1XkU=;
 b=XQDsMAFxoYeeA8J/FBElVdq0rfjaKenpMsYzCOBVIOV+3YAWdQgUl+TBSmzTTPGngU
 YOQ5iuIl6PYeEHwpaox77tufFv7H/ZJ7eNvDBxyeZJHfE8aCr5Y0u/He+3BJbkYiSKyS
 8ueQon4sZAHBevOfTZ6j+CMtsNgDQZKJuIPAZTa9BZPlUkfZ/W4cwOFYBVQOfzyPUYvE
 ME4yyt/JxUwgLBGGeBfBolX9s+RA7AGjyKqmBV89PE2e3fxxq3hHkzPk9tetJQZOLEhP
 w+AdCLEC32nL/NqMSu7orPKIJgCByjPZumBcrZnJx73F5MT9L2Sys4nD51lYu6KovTxQ
 1pEA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774620906; x=1775225706; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MMoCz01d3cmlBMF4Ojv1E+E/bWckDcyAWJZe1tRwo4s=;
 b=PvbzwMJEsgI1u3rp4g6kU79O8SBXwKofEjUhmWBkXaWHt28aH0CgtjR9V+wQfP2psP
 z6P+FpBt2XoBn1Kew12XBfOpOa6fXKUwazBT7ppDp/KR1JbXovDgW65dqLri5oCkCjZs
 2/sVbarxsE2Udsjg+xQlkwXNowJ0IY11U9b0ggYqrVzDaO60Y/AW1oJAPdekp8F54EQc
 jrgfmvlyw98ZoghUI/B1vFCCkoewxfOSHZWJRO/KQYjWVXYEUU+uKfBWnIooDrIahfOE
 p/0B6Rh+QQvZoGIRbUYDFQ1GUDPi8zw/EPEhVYfllHHJLGIaLlwvf0O3wuZn4JNGj0VB
 5ATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774620906; x=1775225706;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MMoCz01d3cmlBMF4Ojv1E+E/bWckDcyAWJZe1tRwo4s=;
 b=mpBy/wk8B8BbsbVoDQQy/dNE35LGqHvSA6JRswVGwwAJhvuzg/ycPHZ4lnU3AVaINX
 9laAZ6bIusarS9KZyp6smpmiQmkGSw2WK+aXcbyr6a1lH29EdALNN6Cw3xZZqm5XKM9p
 00iCSitE27yMppz+nL9en2MnXYltaOxow6hq4YuPjB37KJQr/veTzeF7eVQcue28q7mJ
 VcTKFYHlv6wPcZj0s+mtCyKfKeonasRJZ5e82PPQxz1bnjmznHc4ba4FDyPiNbVQQTos
 RH5d1MAJ06ja2aOebl+VY91ugwIjAAresyMS6C47UNT2NFNzR4Jk2ZcRPKms8acuo5lj
 Blxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKPjVGjHB1Y4GaxHz0fG23j5dl4ljsixreI5osfwD6rwZfLUGcPDbu6YljCOuyIuAaiwsLwXGA4w==@nongnu.org
X-Gm-Message-State: AOJu0YzImK2vilWKwkFISrQHaYSxcgEAIilNAfpnmonSbXKcqZQXpJ9W
 t5mD3WTPE/0yztNgVPrK8kUL/Jw+h3rURNYoDotTgrnDKR6ZnA4y0UR1QD3njdoRzVACoud0KoM
 fEwEZGccc0VGAfERWobqphV21MD9bGOOd5nOnMKiAoA==
X-Gm-Gg: ATEYQzx79Da5JXBG8hfw7phzdu1fJX8+gjynloFMTZ37UzG4eMk1khKmSazEjh4hXow
 3X2MpGHVAOtJ7nIhPL43JCJRXuPKvqWnaWrpxnLnBxY++UPqWdZ9yOvhyW3d7ev/i0EjJybJ2Us
 jgFWm6kQQnQZsMDbH3rOU52PSp9o/HxEmbffJx5OaPPpM0yXgHE08cyIKmn/bCkG9rLo4Bxxczo
 H4GKVOl7q71VXgq6y4iNK3Qvi/qcuWhXmYjOAnZs6XJIF2KOFM+G/qyomLCqMcgpTzw+8gWvUNr
 iYu2CLqyEKasgmwOqfjMeeh7jCkvFQjEyoBb54Ep3q9PhQd0QRPl1BOv43zINF16+6fEzn5AnEP
 yJw==
X-Received: by 2002:a05:690e:169b:b0:64a:d04e:a340 with SMTP id
 956f58d0204a3-64ff71ae9fbmr2663602d50.11.1774620905698; Fri, 27 Mar 2026
 07:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-7-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-7-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:14:54 +0000
X-Gm-Features: AQROBzAb9vsQ_kkEVN2eAQD5ljCjhhyX1HQ5iCE0-l3o0akiYD6zlpbtJhMxPgY
Message-ID: <CAFEAcA_EeyGk3TuUAN9doe-rN4gSD1Gvm=N9x16MZ5HvQTZFGA@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] target/sparc: Use glib2 instead of
 strcasecmp/strncasecmp
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Fri, 27 Mar 2026 at 13:45, Kostiantyn Kostiuk <kkostiuk@redhat.com> wrote:
>
> This is a change in semantics. g_ascii_strcasecmp() doesn't honour
> locale but strcasecmp() does. But this is OK for at least one reason:
>  (1) QEMU always runs with the C locale so there's not an actual
>      behaviour change here
>  (2) we want the comparison on boolean property value to be a plain
>      ASCII one, not to do weird things with "I" in Turkish locales,
>      so g_ascii_strcasecmp() is better as it's explicit about that
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

