Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46827CD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 09:34:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSX86-0007xz-MJ; Thu, 28 May 2026 05:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSX85-0007xT-Er
 for qemu-arm@nongnu.org; Thu, 28 May 2026 05:34:17 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSX83-0001TV-8C
 for qemu-arm@nongnu.org; Thu, 28 May 2026 05:34:17 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-6604176b575so306439d50.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 02:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779960854; cv=none;
 d=google.com; s=arc-20240605;
 b=AE5jLCCJwTQM9BU6jatWwA28k6y9gpkvwi3zrql33SV/NyXhOel3sUght2N/fseVwI
 oXHtmSObcab30vFEsT+JCQ/46dxRuUURwwOhcrEmvZ5VZh60/+qsFWk+iZL3h9gJolVh
 0+Gsib3oaQ8aizZsKwkY8mNRqCfq0g3Qt4NWLw6Z6UTVATLeYcl2rq5zKd7HGl+m2dZl
 HO9W+2KVmLNfOdcOJlrFDS6JzTT5xkFJOQp/JOLA5M91GmV8DlELgsxEA5TjafQh+fo0
 9SUFAk9GGP6Gi/95dUGgSkJAkk1/oVcAp3CtWfzAW03n7vG/+UguHe3Xik08r3Bw8IFH
 K/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=flneZco2VhUbFZjyWPcundk2HJMZGLAmVXpGA/heQZY=;
 fh=mqPTb+nhsZ52O40GzUK5Sy+AilFYylpEBmw4wV9idkk=;
 b=aj9XGco2oRbq+OANB0NanIwm1XTomnGPcT8A1zaBaWIXVyVIakeE+8EmTBnXe1hRM8
 V5mPCx2GyF0B60Mt9bn2PdQ/ZDDgnYBAFGwy6ZSj9sy1MjWzy20bdesncW+m1k0tWbX7
 ljsa9o7adMqR1oqHVqoYUkbvYXdJXRe9FyUuh6EdDBPGRtc/yh1nN2mr1anSW0kyTtY5
 JSwCz88ZtXvH94ZPFlANXuqCe30F2fXZ7TXW4A4iS6RKSVNEn+CCA7rZ8jcjol88Bt94
 hcpaT5KN5IPIbkEDGfC9eqWg8SHroLBO6E9zaCxTAWCfEORiNKLBF3WHbFSRfnd/hcZf
 QMaQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779960854; x=1780565654; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=flneZco2VhUbFZjyWPcundk2HJMZGLAmVXpGA/heQZY=;
 b=ExhjNOdrKqJVGzJ1Kd8B7vke1RJJpOxya2g8WbEes/iplTgPCTHgzgePipWrPyMVpr
 qDimyQB2a/uG1LzZTHkrriTYSd3U06j9Rw9buLsLJbqu+zXN2eGSXT5SL6ZnI1mDzVMu
 20Z3CdAtTyuGrk1asWX88bYO/pp2s2HIOSHvt9/WHfEL3+wQpcMrnCkfDoKtpAV2m2lI
 RP8vlOwua4Siry6dk8Yqh1IhXwDESq/4jmQ9g4AJPMWuEekj/Qs5sohFIQjyDxa/50Wj
 LWsexuSIMbG2ICpTSrCH9eSGlYposI/FMztYqSp0VfjZLb1H3vkfvaXqgoojiS9XhFqp
 2fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779960854; x=1780565654;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=flneZco2VhUbFZjyWPcundk2HJMZGLAmVXpGA/heQZY=;
 b=kbPW8p4kqnAVMqMKmLT7nIX9o7AignkSU6eS3xEDdUAMK9BOLXsoz4VvQDnfMQ2gH5
 rHFAPOwVf0hP58nWYBW5z7mBX6cTeUt57hVrBX2Uk2wO6X5BdaU/IUjlX+iJK/67rKCH
 2m7OAoiNoJVWQ2ZA1Lo2uYLN6ugERnAo7xyT6Z8i8H2kbRaoXtDKTFa59GO5L6KyXOnD
 UyaMXf0EverFl7MtfPpFQTUPZSlLMn4znO/fy34YXedOaIAOskEqEhGwlaPclVkZymdE
 aAYGFL6oHmVIDnUxxawdn6pBXSOgwQG0QShTV82E2UMWC9Tx0qEB0rarEBuBdGEUDFch
 pvkg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/nq07t0p7MUJ3Tvvl0n+AnRiZfNcDGfjLm+5B67po5C++Hy294iKbZ1gLpmDbLIlNLJ5icLZnY1w==@nongnu.org
X-Gm-Message-State: AOJu0YzzJKMt4hy7Bj5MEXrB9nbb4Mj44or8M4tXnfSsJ/3TxTvls8pc
 0IuTu1q6/mnk67IVnWW547p/ws41aFamGVls96ljAkkcUbsPZbyEhyzT+6XSLqoW2XXtcjTwhBz
 axL8MztDNvVbXG/xjPRCd1fZ6ltG+cWqUVYfW7l3Gdg==
X-Gm-Gg: Acq92OGbGzGsXQzMcDcdBB/DGe30FtZAzuYwT4NCM5OpBUb2fzv1qPRaQEzTBix4Y4e
 cVYefZT07J7EOb+61V4+rpu2HcllnFshEurcTsyQMdwCdNZ7Hu/+MWjkN9qIiqMMGr6HtymG3+Z
 RE2BJiQLZKT/S2EVNYc2Gi8TJg4eZj5LUSeys1skyRXBnLMtoMpZDnXs3ZeNb9yyRfJZoRJ1GHl
 0vPesTxR1xfbARS/WQAcFH+C5zmciCD9V15y353CpyygsxFU/sdcris+LK1Ad7bsuf8maAdITyK
 73lgknoaHlOfQN1lRk+7+9mBXMoYdhrqQiU4ASBoAkAD/3XCVbOhjBq3VBfqdYtOG1Gm4iwWc4P
 VSA==
X-Received: by 2002:a05:690e:4186:b0:65e:1bf6:1386 with SMTP id
 956f58d0204a3-65ec97b904amr21464174d50.17.1779960853850; Thu, 28 May 2026
 02:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260522220408.235438-1-richard.henderson@linaro.org>
In-Reply-To: <20260522220408.235438-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 10:34:01 +0100
X-Gm-Features: AVHnY4KRE8l0zjwbPuNsbzG6Og0pifgpBVC_TBgNfDLBSzb2d64qwj_BM2lRwRs
Message-ID: <CAFEAcA9A45z1rmDqDC4DzC2rPErwLEgk0EFk-Qdsd1kGWfvp3w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Enable REVD for SVE2.1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
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

On Fri, 22 May 2026 at 23:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

