Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC6F606A324
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ni/LrMjF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNpU6-0007UB-DY; Mon, 02 Nov 2026 05:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNpU2-0007Si-Vo
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:41:47 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNpU1-0007zl-GY
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:41:46 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8b0d63f60bcso21572997b3.3
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:41:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793616104; cv=none;
 d=google.com; s=arc-20260327;
 b=NMF3VzVOPedT9XakfLa7T6ihluFdPJa5DUEXRXKetvZeKQQ4ECJttU96r7OP/lNyfZ
 jb39iNgRtOoN6zZhIhFMvfyL58ca91YbF4iAMD+9hrJFBZ0b1gvn+URQiba/epbH59xt
 th8vqyifzayOH5tNDSH9eAdr5CXD6t0YH/29aV3gJpaII3FFx5KDr1Rqs9Q06lO039cj
 OYJKeOUmpuu6iUrdBaI9H+NRNHVPal7jEjS0jxWedAhrWDD9xz/y4U7wL5OQCY+NB5WK
 tpi+pdLGlHHFeFd/A8cTza2hz7D/jMHteKcmcRmLe3yig7dk4iXItC4WD1p7hoCraZrz
 UxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MhWsz6CZ7C9QhkKweSDnzDjgrdEAs3cdco4AL/JHOIU=;
 fh=ytLAalqf7NIQz4xqKMSLs/0Sc3QSn4Gs5WbvLoCAFnM=;
 b=nXTnoXxAuiydwnND4iqcuO19L1y3w5obe5Mhzx6oHaRxeoqHt6Aq6Gy+j0RDUYGYJd
 TRE7oC+AAaqr9mi0KbAtgnwhpu2yb048pPF1lwa1k2KwTRqOz/LJJhHf3YYm0mgomlwZ
 v5SNDUXRU81pm1KgV25NTy1IiUJiXx9F745NolYpSXCmEIoPZq4QSzN7YqfCQBnRAz3b
 8yHFnufErAIMSqGJka0D90Wgj4NZiGqxBwoVcl1rENwsxqsgR+L4KcdQw3wbRox19EZI
 NRKoTkqko+3lJmNCzNMWMVvVnOqdSkuNrEhnxxHj/5DA1yyULL/8oXavoVRsAP1NHa2B
 IuXA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793616104; x=1794220904; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=MhWsz6CZ7C9QhkKweSDnzDjgrdEAs3cdco4AL/JHOIU=;
 b=ni/LrMjFrYqtRUUAIAELb87PRe7Pp+CBNTXH2t9NAfDcFxJNdJBvmCYQoUmLHsMAaT
 bRWbj8dHelG+s3In64hZjLWQ+o6s2jsJ68yNzj8NkVhVBhzW9VlskbEjsYtdG6pKnzr1
 KkkbrGY8GxA1wVILupeFhBcvrhtsAzCv5pJ2mTzy2nOp9xug9z+3Bx4p05SGFdjgJbtZ
 DdfHRooJOYW6tTx8VDB95g7EvSNYiNh6IPzOFiGbxjKmq3VzMRBkYZDewUcIZTYRt1cc
 CoLk7nTECFMgSggGv1yy8ik7a42Qdj7vQV9R3GiJ1i0qeJVbJV7Aykqra/JSi+oFSP/m
 lk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793616104; x=1794220904;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MhWsz6CZ7C9QhkKweSDnzDjgrdEAs3cdco4AL/JHOIU=;
 b=NgUgmbNfU4JvwjRVbpOPDvAGEktVzouAzY5FEUNU39WyIcvLhNdF8mU6nqy31n3wmQ
 GTj+G/sHgrElsg19d3BhCsaQX4PVrnzvyfEUMyq7xlfdHLGFEDMf6WH0gx5LyO3HuTjo
 NIZ0rZnEFZrjgIWk1DurgSoy70uASU4qWwbOipwrSzL89hXJ3y9DY5ePMEUXD1IGGoyT
 us5QLY7g/PXuUZJKFIRJPPFZbgO9JQvjTZpaCR3Ac5uenCHxxmNf7tBS3YNAFm5RG7h0
 ghh8JJu08gkPFebrMwtp8CWiaLq//YmIlf6MCSpQ56PPs9AOSZzBhiINLHMS+8eBMIRu
 eqOg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzDN9fDhfj1FvVXrL47GD1JBqYzf69gRFnpYPJTchAcaXNuCxqPhw3ON381pDaWcHmTTr/mIoiotg==@nongnu.org
X-Gm-Message-State: APuU4Z+N6FH1UFyzKXG5gD3JDJtHmN+Mvg3UoR07STtBaag6fo/4H7pe
 c9fDbfwlJfXvdoB8wC3yEcuHgcjOVRT99sO2wAFKB8ayQw6tfDWHZ9AD6hojwm7kXKVN0AReMMZ
 8EXOPEOPmU45wnfSgPliSbzOS8ANRnJbTcZn9eMoCYw==
X-Gm-Gg: AYBFou3HxI9Efu9A0Wth0dEMJU06IGmmYpe56zfN+3eWC5G9ZPiK6ALAUQX5J5jHBMx
 G/RFaVVCQwr3NrR84N0OtEU+Rg2CRfb/YDDdocVgpVGxUD5chjugfwUtb5oMWCY8skY45f0DDsO
 yfdpCcmTRsXNmRYg8J5J6k7TpsFlzFcHB+DiYBxieWCOe16K+IjJoN8Kq6AeRtpPjAFY188IiHb
 SFq+VNff5viY0EPhJM1z6q88trvN5+P+5fc9ZTWYFYsTau3/iVjLC9qfReYxfEas4JPrVlWopU3
 5NnNkkYZfU2WKsAvJxp22qe180SBanClRBS3b1iSHtGsXf7On/vqMJAvjAQtjQqkzCezMKhynC0
 u1k4plFQe2rJpqlrL0gUXZ3EyW3VuiCZqGyoeek+me0fOpJms8O/TTML0OsgMlztdHPm6sK2Lq3
 S3WhJRG+PP6nyTLshy/5CD
X-Received: by 2002:a05:690c:6d12:b0:8b0:e7df:dd4b with SMTP id
 00721157ae682-8b2b671f3a7mr67672897b3.35.1793616104156; Mon, 02 Nov 2026
 02:41:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
 <0deb097d24128afea6839a2d6e222c2cf33de45d.1793613972.git.lorandmarton.dev@gmail.com>
In-Reply-To: <0deb097d24128afea6839a2d6e222c2cf33de45d.1793613972.git.lorandmarton.dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2026 10:41:32 +0000
X-Gm-Features: AclHuK_y_5ZeKVuz-2dYgJchdvP6EIYDiDoH_ZGI4-YdqXjeCnOYnoOjBSkpOh0
Message-ID: <CAFEAcA-WTv10G6PZmKke8CZWrMJ3L8pUwVYqJCY3QPVSHkL1eA@mail.gmail.com>
Subject: Re: [PATCH 1/5] MAINTAINERS: list the BCM283x qtests under Raspberry
 Pi
To: Lorand Marton <lorandmarton.dev@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org, 
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 10:13, Lorand Marton <lorandmarton.dev@gmail.com> wrote:
>
> tests/qtest/bcm2835-dma-test.c, bcm2835-i2c-test.c and bcm2835-ic-test.c
> test Raspberry Pi devices, but no MAINTAINERS section lists them, so
> get_maintainer.pl names no one for a change to them. Add them, and the
> BCM283x qtests that follow, to the Raspberry Pi section.
>
> Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b12ba90f2..fd08d80aba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1046,6 +1046,7 @@ F: include/hw/*/bcm283*
>  F: docs/system/arm/raspi.rst
>  F: tests/functional/arm/test_raspi2.py
>  F: tests/functional/aarch64/test_raspi*.py
> +F: tests/qtest/bcm283*-test.c
>
>  Real View
>  M: Peter Maydell <peter.maydell@linaro.org>
> --
> 2.56.0

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

