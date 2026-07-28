Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B4CC53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:51:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woiDI-0006rp-W2; Tue, 28 Jul 2026 09:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woiDE-0006pr-QF
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:51:17 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woiDD-0000yK-Eh
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:51:16 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6685483aad2so4837191d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785246674; cv=none;
 d=google.com; s=arc-20260327;
 b=ZkMMdPf6qUJXPStSdRHjFf+ABo9n18/24C4yn70OdsktAhAOKXF/1j3gWKIEJQf7jZ
 YWKt+m18mtisjATzNs9J3+utrf1MxjyUq9Bb7xWwS2Ch2k62D5tbUedC+CTu9Xf57Q5s
 9g2ecfu1CqfHc3KeQg79mrRwKoSqdlWcaXDCCchr2qRrkTiquVroJcJFbMF5DhyN8HLT
 7hyMQXKzt7sf3qiXMetKR43x5XonIU9MwEe5er5IczVNGJVh2Cs84GseuSxwuk+TLra2
 XZZ/nGSGTTYgyjExTSdsaTlDQ6D0wvLslRFmNWIn5WF8E8QdarJcN1C5c9h4RftsQOXw
 nBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VUF6gdhJPTyY3KgZ1fqwT3T8avqTRIo/g3y1DdJllsg=;
 fh=6am3nbR1iRH92NzZqtKHTO9+NE96MZYYTMJ2YwNXkXc=;
 b=ZwMsew4YZteIx0KAWn3PKZcWOOSgMd/NXu77IPr0NP2v7Vi38N97RA5rzqQCpJ321b
 1b9V/IwF48IgZx7Ds6l0FTLx9pu7FplYeycAm7NVpHDtNf8kWOFQY/Gai4oPG1i/tXiD
 optkB2KVT/jdp24Lef7RC45zmaetTACFB0v7IHg0whqlENF09P+PuTZSsfhTp5AD+Gn+
 tCeJLgZMiAjMarQkpM2zcXb19+u/HKvikJk9aX8VVKtbUh7zwpDwQtMmvk/Uo1zWEs6T
 OIVSirckvQhKhGslzbgq5W1Mgof4owtgGA+u3xAO4leP9k0WTKM5io8NLoJ1Rr1S4kaX
 TI7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785246674; x=1785851474; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VUF6gdhJPTyY3KgZ1fqwT3T8avqTRIo/g3y1DdJllsg=;
 b=pFBJsq0XxzZqosCdnoZh4KCBPTFk+UQuARlv1f3hYwnQDDPheTZtiNjjw5QbjCdRHF
 KIqOY9LAcywEj5wv/9VFJnhLfufLWgFfWQSXQPvFQlArYgsjvFN0rFXsdboCXrgU2zWL
 o5oSLK/hgtVbK+Ya0tsbdxQsrAnDOFX+2EhAPBhcI1/qH426P0/jUdrkIkc3hEk0h21A
 xLTu2sH+94FI+/dJGSSUR6PRJ5CJhUMW/nIgEr0y8Scm1/RHqx242hGzdgflmkBnmzAv
 kR5HaOCANF121BjyTHxrGr5NMpYwXjSr/LtHcmAo6zTumIHhaxTLZo/Ii7aoDMxF8sj0
 F+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785246674; x=1785851474;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=VUF6gdhJPTyY3KgZ1fqwT3T8avqTRIo/g3y1DdJllsg=;
 b=LAdr6NPq4WrGsS2ZKvNWODzRapBGSW3AG3SxQhZeYXZkYj8G6GRdIwgbeCPLPXtWx2
 5LT4DsXWfmRw85RuZbxzfKOsgkjQqjawHJU0HBpeFkrYGM1/xR3qx6wDXhJ/P8up/EfS
 qmWz20XSPdVT2ka7DDKbpTNhsaFfxrjj5jJ339KHIqQiIIkIaWHVSPFOGMlAvbDDFn5g
 uS1XQ9fCr3wvdMQnGGma2bELhzTooLTGRNemrGtzoRa5/C2tyTFQD73PXADoBV75WJVA
 HT760hEOy+VAvLJP8Br70WNxVCKSoELdYsFh4pycmb1a8+a9G1m1Gs8gDiXwqeoyUkNX
 29iQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpwfOdX06s8Qpdn5B/J/9bUzizUd8CG8n8ABfqC/4XUx+lUGGYDp6kSqc+NJLXIs+TowPkh+ca7EA==@nongnu.org
X-Gm-Message-State: AOJu0Yw3OxP8JIoWwgaLuzDUKf3XRhTKa1+v5xK8nTs+5skRWG48GH8q
 nFvajTEgl5Ak8TDv70rDQfFIHd+vjBR4xX7uIZ8rX+JAbBYQtNsgc0VWjwaylxoZzFg2y52+4is
 qnniMnlDJ3Fs6pRtxCGowPiA4GQR+XxbPYzT9ZdYsLw==
X-Gm-Gg: AR+sD108/jITdAVld6wmkeui9zPqES5OUQagW8FN5I4NscmHrBsIC78ZfbDxnStoHAK
 uBGz9t/xdw2H20oFa3SC8L/T0w07nw5xNXEbomd96qMNGrfs0xrxxsPRDzcwrbOasD1fmsD7GnK
 z3gcUWemNCGvhWrk/a1J/JlqmIRqo6hyG6oE2ifx/P6OGPg6tM2ed14lCsxgAq7spy77qEJGq44
 uE98auci8Nae1etl6xUPCv6Fv741zed4W4KwKwVIUv+u7/5ivkaVQGd1MtmUgsIp8bUaGSYJjAu
 b745BVAM5DYlprxNmm9mUU8KDzPZ4sC7yqjwzjgf8fNBfA==
X-Received: by 2002:a05:690e:4504:10b0:668:434d:a2f5 with SMTP id
 956f58d0204a3-669054c1f61mr688018d50.1.1785246673854; Tue, 28 Jul 2026
 06:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260717232306.378988-1-richard.henderson@linaro.org>
 <20260717232306.378988-5-richard.henderson@linaro.org>
In-Reply-To: <20260717232306.378988-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:51:02 +0100
X-Gm-Features: AUfX_mwjuassID0lfgcRUMuDaM1vYr8AKSAUTOYmTAfK7ifcHMjrmmzONJo1PKo
Message-ID: <CAFEAcA-BLQ00aC9tDpVGWoPhngC2UgXtVeBx9fepcGiQ8bRX+w@mail.gmail.com>
Subject: Re: [PATCH 03/17] target/arm: Move helper_dc_zva to mte_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Sat, 18 Jul 2026 at 00:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Slightly odd, perhaps, but there are 3 MTE variations of DC_ZVA
> and this is the easiest way to share code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-a64.c | 50 ------------------------------------
>  target/arm/tcg/mte_helper.c | 51 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+), 50 deletions(-)

Both files are in the same arm_ss sourceset, so no danger of
accidentally breaking in some obscure build config.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

