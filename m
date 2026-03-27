Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F9D10AB830
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:18:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w680j-0004t4-LG; Fri, 27 Mar 2026 10:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w680a-0004qn-IO
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:17:56 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w680Z-0007FY-6R
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:17:56 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-64ad9fabd08so2334803d50.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621073; cv=none;
 d=google.com; s=arc-20240605;
 b=bUirKFyZLhxAVW9sASZl0VoPgZJQTDkLJtizCWFjbzUSjcVjOWxEwscgSj7DtF8VMB
 7PGd2aFy/jbj7HVw4z7zPh29u5SqiaJJhIGopFoTFqLEKAxjQop8785+gTl6kQGCC18f
 t1SJ2EzsJASwoEuCRxQHlhflO8TLaZX+vweXRvjM/OUUZoJIfSe3EmjMDghZgbXmb4+F
 OZq5cdr2pxpmyUBW3xXr8p841aai4ov/7XeYXm29aeTTqP4QdueDvkfLr5oi7CWCFw+J
 RNcQ+sx+v5s8DWy1FkSUOnNRE975WzXMLKFWcq+XqIU/5HQXcPsbsiOUYTGRjOkrX6qN
 nydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MEShb315a/WqubF6hmDoT8f+2MwTWDMAyqGOip7+fjw=;
 fh=BS7akrAUaJUAKl+NVWWo+5g44EMVVbSJSuNu2yirZfM=;
 b=Z7MsbyAkC1PE3nnlDK41EE5IIR+VjAMuR86dyGOds+FRr9Px7ySmkcB/pbfkPFMzOS
 2UEVAh99Ri/kjcnT3VdcfDu3RBG6MgsaPMycFiqmkcEMIJ16vWvv6NYmipDqnXFoW1Dq
 3HzIlrrlsejn6IIUCJZtXLZtrVGwLTfmZiHD/IdFV5/7QhSe7zl17tN4+R3G1RCgXD7C
 2IWvf42N+3PhMuuVInqig2JlA0/OfqlZoel508mDnnoHTot57CyN1gDEKw8RWQ3/l538
 u7dJILT2vOwyIUTZQCR+Wr9VqggQJiCujtblRmzjmXUmEob7YEB8Xaquk9WxAe5WQwVL
 iQyA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774621073; x=1775225873; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MEShb315a/WqubF6hmDoT8f+2MwTWDMAyqGOip7+fjw=;
 b=KIfIPPZmGWC6Y+1T2g8l75A7FP+hThruqNjJzAlr0dbg3rRT5NyVhTQ0uKVuzJKbXX
 bg7ZHTdRJIx7nv5+IM+V3/HEQuIXyqxD72tNUfIk58cZMCI2tEGfWe/uw/Lh0wn4YtM5
 Gs0u58CF6rImNGsx1jjqS3fmh9Ji0eYgsL8mfwGnkDDzwNYkcZ6OLms68db8oWOb0ZjX
 wTJc0Ck8mc5AaM+qTL1V2TVWSeIG7NSJ/z/rJwFC+u5V76LmeA9vcGY9suk9sbNMAhxr
 xtMvXJoqyy/ID+aBgImXAZ0tCYlw08ZjPeJoFDLMGiX77hJZGRuA2+n6OUqeankPide5
 X8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774621073; x=1775225873;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MEShb315a/WqubF6hmDoT8f+2MwTWDMAyqGOip7+fjw=;
 b=GtgMyP70SmBuEzMfEzPolL7yCIynuH8C6gYCQXa5j84Rd/kzTdE+wfOM0soAWqnlb9
 cjItcKhKaymYcPa8ZGwTUs8NB+wSoADU8HMDZMs4QtRb7/R6ULLtgoGuiCuYIC2B545q
 ErvbSyqOo7jB9G6Iey9+H8FFbJq7PGn4mOs6d2iVbpdWGWGFFCn5uWuHglvgx2GsYk3s
 Ms1SMaQ5bpt0WCNsP/1Ktf735zoLIRO2NFLjAnkFl7Dh2LkhTQzdWR1rjhmS2O9HMXHm
 rUJoGlb/bRQeAl3U8f5DuBF3vRna2+qRsX7LTQOMxQINh6dWaRqlJP2IAtJfy8uPxhKv
 4D1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo9x5zUMcu2zLPGgckB9GkyrGCqbn5KSHtezQ4P71t+tyjJeGyrCWBmw9gc8baZrCpRCL+ACKA6A==@nongnu.org
X-Gm-Message-State: AOJu0YzL0VvUr0bIq7VqbJ/dqlMoPXaSxGcrDO7T5Wsr/Oqq2uHKffbg
 RoawE+9DqifZDMPtR6MQpxRiSXeCyxfUIpi/abEX7YUnmiBspYz1CTqdQFpYp/xRLYDf1V8bd1b
 493oxjtnSLNvqf3kRCSU2KiZoatCjV14PFws0WmCLXw==
X-Gm-Gg: ATEYQzy0ww6T6LTl4FP38POXvzaM7O4Fa1OvgGZ5J75bEudXh6v3skgR61jUjkeL9IC
 l7MEaggGa36D4hBOMBC+Wd2eGoTm03Lm7f4yzgEZGPkuhmPOANwe1Cm9RXBLKokIX1N4/59gxac
 k/C4goOVwyv6FUPIYsOp13l/ct4vDyZe5mKs+EkQTvANWnxqIycaSOPQmxDoNJivdFOFD25jeko
 tif7KIM5yxW+QDLxC0bi3Du2H8PmP6M6vu0V7ZrcEY2b9wLfrwX7hdlIfYZUpMhmzkTnagl99iK
 MujCpJOBv9U3UEUHHHL9FDyTh8HU5YHcCUOFOIzgZWpPFGEOkVcchLPQ6YTZiD8MzOw=
X-Received: by 2002:a05:690e:1c1c:b0:64e:f712:4301 with SMTP id
 956f58d0204a3-64ff71d888amr2694629d50.18.1774621072659; Fri, 27 Mar 2026
 07:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-10-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-10-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:17:40 +0000
X-Gm-Features: AQROBzA1x2iZV0aRuSLuZIZdL_8QMnXQgU2W8vy-AEPo-qqdgbcI30apQvxGOXQ
Message-ID: <CAFEAcA8b_18LNshyvOR1cfvHDVVBbA_=5SjOUJ+kxu=Jq2X7fQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] target/xtensa: Use glib2 instead of
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Fri, 27 Mar 2026 at 13:45, Kostiantyn Kostiuk <kkostiuk@redhat.com> wrote:
>
> This is a change in semantics. g_ascii_strcasecmp() doesn't honour
> locale but strcasecmp() does. But this is OK for at least one reason:
>  (1) QEMU always runs with the C locale so there's not an actual
>      behaviour change here
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> ---
>  target/xtensa/xtensa-isa.c | 4 ++--

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

