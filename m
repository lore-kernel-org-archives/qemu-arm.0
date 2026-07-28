Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0625C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:03:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohSX-0004Dh-9W; Tue, 28 Jul 2026 09:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohSV-0004DB-Ug
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:02:59 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohST-0000We-1s
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:02:59 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-668432fe416so5159005d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785243775; cv=none;
 d=google.com; s=arc-20260327;
 b=jE2i7vFcsHFOHf/xz8/PkSltNjMonMDTynfe/GLgWoHzya7rKEpk7uuGLwmzwlHz4k
 J9JzMrZr0Ib25IWQgu9HKnA+qL4/ShF69ozN2tW24QJAqFNdRg3SdVL2fjIWHa2MD3ps
 bBEC2eHjP7K2M9W3xzTHwdmuHSuSFmMwtIBjt4/2ZXXAxvTacEngMU1J2JL4Q6nUMhUy
 tndMc2upogl6JQOzhaCyX78wLTeQtZ9jzQ1LT+Cj/HJncpFBJ2GVqlrRyWQ5Ofr1BLpZ
 sry26yeepttb2lghFKx2ohQrc0jc3bHa6FToTIZqjv9S/6OxW+NVkpwrekNc/Lk5l4Cc
 xk1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=92d6TDnM0T6Xk1fttE7A1YNiFfPbLs+kxkNozXcZSVc=;
 fh=Vv6fUbX92p+zgLQUcsTuwOgsLXvs3pyxwpitrck0XNg=;
 b=iAXUGHb+9igQr9DbHIcI5lcfZoeLaPLqEErydxHJGOzqwDCtu11jFxWcWscJ9S2Tvy
 qo4B9I/1ATDnxXvVozM25rO/FfLPQavjlBSSbRhm+9eTKNNSFobSqdzrJjTHufotISKH
 XFEa3dQCBAVmnp2iexMus8brRDlvNRUF7WSw/p2syiSStkMBVrVmQbZqoQ/6J6mFPQix
 UfCyGeZ2eRrzjPogpiI2dMF9g7KH8mfLaMSlH9LL5NvVH0KtiWywRu0TvdjJ2Tub/hMq
 6oM/W/NzWbiSpK3PVxOxjHuBamK+MTcAMP0K7mF11hhQaMg76gMtDSEXhgWZNYXitc6i
 zITA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785243775; x=1785848575; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=92d6TDnM0T6Xk1fttE7A1YNiFfPbLs+kxkNozXcZSVc=;
 b=TuCZHXHVupnjBB6WDINug51UQchRFMkqIID7j3rYTbBVBWL1CeU8mVMbqQmxg+QLNA
 dhQRpZ/cgsmkzVGXt+a2yKwWRGAgCLkGAbV2hchEsn1DywmaWsIhaC4txcSujz3yoldv
 2EI/oLi03oBhGH7Z1n6RDygW2cSH70/yRoQqQN671oP/6rOS9/QBAUtlJCsQmKwbMx7X
 Om6nhpFoWvqQQoS57aCpGWrSS/hx3H6bBbTS/Tb7QGZYwS1lxEAfZW/8bbjokKwg6lMe
 t10pjPyAfrG59AuHWhhWEqpFocrdLaSm/4bQKfOZNtb4d7wW7X+y13k+o0tZ3ydiub8E
 dTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785243775; x=1785848575;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=92d6TDnM0T6Xk1fttE7A1YNiFfPbLs+kxkNozXcZSVc=;
 b=GVBXc+kPbwDQN9hN5ymnqAPVinyzv1P2cdZBqJZeGoVOKw+QldLddBXGuOjhYMtMqk
 Q7eGK739OMvbKJ0MscfpkkPSLjZx2UEYYRM+TomEUI2GjxTz6uVBsSCTLEnui8Q8owvW
 O39+LK5KTUQgzOlpk2HXK6UqZKv9V6h6zFdP8vdzQ94IeEA5ZOF+03KexFSGkNBIUX+2
 l6ZSzjzK+zX8EL7E1xsxBqQSrsYqeNRfIEzoCIs7i6YcwPwEXZZnftT3ycDkC6q8+Jg0
 u/CtsVFldnZn4OxB7Z5mtbJUgRUMVb80YV+y1FJW4BanwyoHdo8MaZvf2w6iSbWO8p7C
 tkBQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpOsUr10kVYdiFwQurefCwobm4uVNOiQwfbYZep7jo6vzniStWVW16cgzSGKvRLq7zV+Y74p0pxGw==@nongnu.org
X-Gm-Message-State: AOJu0YzJfW57xkwa1lglYdnIAXveZ1aJK9bT9XROWX/yNl9jUISXS9vm
 ljOjM3Ts3mguXxy1lTV2OO5peUcb64yuvk6i4uf9hyTLp1JZxduklLMBY+G4O+gYm+u7vGTxZ9+
 SNrtXZVEPPY4538EVhoB7lgiJF+SAcIaXKt4bTj58gA==
X-Gm-Gg: AR+sD12qF0OUBsCYfYX9WEQE9uEGveT4atFGRJ3FfEV3JuXiCD6Yxcsl/4ga+c2AOrv
 2V0IV2mJFwbNjemIc63XhNFklk8IYqcPTaQ+Dif/HzYQxbzEsNMryh3GjNBmN8wujBiey1b/gyC
 oEJk1VPLTWHuqnzb+dpYu8dH6+oTsTV/tnz38u8fTk19zSGMH66FLmYoIwQ6bUu2nSQ6qUchEsp
 jvSbBIRDOjf41B+srkzOGAtjZ3Wf1qrQpCeThFBJBxiNtlVQMcILD9xx77JWUHmKzofxo21TZUx
 9E2zQeudlij3qBLJsVWpwfZifQeFHCLfQvtg9ZpvVUJDJtay+pIw5qmA
X-Received: by 2002:a05:690e:4091:b0:667:911c:54eb with SMTP id
 956f58d0204a3-66905822048mr743138d50.74.1785243775236; Tue, 28 Jul 2026
 06:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-3-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:02:43 +0100
X-Gm-Features: AUfX_myPczF3v7ca2fHMma94uowCAgdOeraJqwlYTmBoUc9sjoKYpjIAHR497tY
Message-ID: <CAFEAcA_g_7oqTVb=9ThdDY49Q4r78dAMQK1v-Cxuykmv4KTFKg@mail.gmail.com>
Subject: Re: [PATCH 02/10] target/arm: Implement FTMOPA (non-widening, FP16)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Tue, 14 Jul 2026 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        | 5 +++++
>  target/arm/tcg/helper-sme-defs.h | 1 +
>  target/arm/tcg/sme_helper.c      | 6 ++++++
>  target/arm/tcg/translate-sme.c   | 2 ++
>  target/arm/tcg/sme.decode        | 3 +++
>  5 files changed, 17 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

