Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F80CFC5910
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 09:31:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvXiK-0002N9-1a; Thu, 26 Feb 2026 04:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvXhu-0002AZ-JR
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 04:31:12 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvXhs-0003m8-KB
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 04:30:54 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-79801df3e42so8420127b3.0
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 01:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772098250; cv=none;
 d=google.com; s=arc-20240605;
 b=eOPOY9rk/5+wg+ed02nm9UwFa1DFYTxtQtZqKcdVDSVQKTwdRVj73smPOKpen4qf1c
 fQ2AQmjH34xVJmkWJbof7ag4ngM/7vvUPLmVb+9/Xu7MyU7LoU86NsSCEP762SKA4coE
 kr/vd42Ezx4kUxSCRwBT4QIPtcfZaSAoF4h/qSDAXAPIIMh74Mbc6CWPOr57/gJm2nG3
 n1fr3c6AZ4BNmfeO1GQcq4/CW7s9BTov8M2ggaouxxY8Wwie9ovpdRMUGEVUWgaokzz4
 MW69lpAbSthleok5GghcDIKqWfJ8N21UsPIZSJPBHUw6sX6d+KcFpsms76RCnrs3zgLx
 vvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8x7ebrdeU+RdfsKMuJgi7+dTMqGBHTzYaiSIquK8NJI=;
 fh=AJSNhukgNgGJvXaJx9nq/jeoMxsFlzRshD6yiFRPXAo=;
 b=H4/JDyLq9FMulRXtcbuyBrvYI0SaJ7g4YdzE5yomk3ipODqy+KWzKrLHO9e1ewv+pi
 ftf6tt+cfKuIz9sEXHecf4wLzQRDqlZI1VZS+CKoz++RD6G1Rp3TOIFh24uiPLU6wlNg
 t8lcKLRK/HOZZrH8CRcJLBzp3TyILsrSvonWn9SlDUvdyKR6C8ZWOB4+Bifte2MSyKYG
 aRJSRa0EuMTg98RMugjZh35tcyYwl5CufN/6Z7DG7Qx7B0Lm0gUT4MjQV/i+L0EoEuuZ
 htHbFBhYBE6O/JfUHT68CVu95ecYsyJQuo5a4BwCTLsGcELplc+VZ0D81SRUT9PVbpOm
 MI0A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772098250; x=1772703050; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8x7ebrdeU+RdfsKMuJgi7+dTMqGBHTzYaiSIquK8NJI=;
 b=qllwJqykRwfdhhGG4dk01NS6uDmnplOIp1gDXxC3akGQIbnbQfrUTxEX0dR/cKrcJN
 Ox4xtVe0G9xmh0icFjhlUAABqoX09B5LQZtNcCQ1+zMVGScuMMQznltG7qL4cperIJ5L
 WY9EpoZ8SNNP5uiNVqw8RBEo8V+/Xz819sY6RptvCkxVMLpzShVVhoDN+f912+x9sBVt
 ly5WHwxhJPLxn2iu8Pf0jf8RKikRPEyIt87j8A0P6pm+xF5RbgWWjgeBN9/1UUQSzaMv
 lnwSLvKnid2fjLk0hQVVl0jeZpPDSmI34jzwPxMoU7+bwulGwmDg9MKAH3J0RxXHl5gO
 M/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772098250; x=1772703050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8x7ebrdeU+RdfsKMuJgi7+dTMqGBHTzYaiSIquK8NJI=;
 b=Vu3j4b5ynz3HQzxkXkgGTLW1lXgsYxkS14fKDpxDYWe0FrwG2HWi/hCfvFOaOEIvwO
 YGnoZMo1Qf8geer5jauFC7WanO8TPH5EuUc0KhpNXIDKkpR2uo4ZzTSm98n4iP+sG2aM
 MCQaKj/lFUBYuaHi7AzEhgEilnj9ihrwOgfHF7jx1Fa8zG2Ks5UozlprcsdeQlQbG30U
 6GFhwB41wQx8Gz/f3be/k5jEmY9YbfLLzMvKsdxLJ+Qww+basWfbmJQkXzIegfEnWtYb
 4v7jKlRPcNh9/nttrgk5B3ZP8lbyHpseEtxRdQ5w+IzaFXHhBeC3+PjYFzKiHAa9sA4z
 BgRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc4gVbZ5VFT8XL+7AaNe0T7fAHaHr/tv62xpYE7DpROlxxTRKYHhBIoPYCN6u2lwY9mjCssF2kCA==@nongnu.org
X-Gm-Message-State: AOJu0YxfKfHJ5WiVpw57dbVxW/Yzl7DrrvPyF6TlfSCnE4u+PdpaYAWD
 sepFTIjh3fNrHtczZGtXQAGFPztC0u1s8vbsULuqEzXkcl2knN6s6erOaWAnW58T4B/JyGKXH8s
 w569glrmGiIzvI0+9dtWVGMI1SM1zo14glZj/vQKvpw==
X-Gm-Gg: ATEYQzxoYvDjBkpPIyUdimVHrb+18IcqOuKWNf57CzsEDK5/ritxLx+s5dBm7M1muZ4
 ypSL7tpeR4AGi97ev4lwR1jiok7qfAv9j2VXEoRzFXnbytILw3pKCrfAEwxM+p1HKHfckYW78fu
 8R51krm3ev4d7dOgabb6Q5y/6IL1mkIMPUEnN3CBTHWto7jPGz7ZPG3kzwanK9/eGcDyvhfj/pD
 tICZForKiSnsY7kJr4phNrQ0XuFR3omzDNd2xIWE6+gvillq0s+k19bGLNpAnS0Gf7vE/fjM75y
 AclgH8wZAVeJP9sMYvN/4rHwgPUOdAXV36GGJpq3jA/DBbTvgPsefttp98AC3I8IsvQ=
X-Received: by 2002:a05:690c:c24d:b0:796:3d5f:a2a1 with SMTP id
 00721157ae682-79874d16077mr16961077b3.29.1772098250254; Thu, 26 Feb 2026
 01:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20260226090704.27699-1-thuth@redhat.com>
In-Reply-To: <20260226090704.27699-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Feb 2026 09:30:36 +0000
X-Gm-Features: AaiRm53ZYluDKvaljy1bXBIpRgOquPnAI0D9_xlgEqiVQZze-pSE3ENUWe28N2M
Message-ID: <CAFEAcA-8s+fryKmgU7U=B4Roh4YsQYdWr005Q4opNd-fN3LoQw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Remove the deprecated "highbank" and "midway"
 machines
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Thu, 26 Feb 2026 at 09:07, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> These machines have been marked as deprecated two releases ago,
> and so far nobody complained that they are still useful, so it's
> time to remove these now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

> -Calxeda Highbank
> -M: Rob Herring <robh@kernel.org>
> -M: Peter Maydell <peter.maydell@linaro.org>
> -L: qemu-arm@nongnu.org
> -S: Odd Fixes
> -F: hw/arm/highbank.c
> -F: hw/net/xgmac.c
> -F: docs/system/arm/highbank.rst

The xgmac ethernet device (hw/net/xgmac.c) is used only by
these boards, so it can also be removed now. I think that's better
done with a patch after this one, so for this board removal patch

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

