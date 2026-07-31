Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E15EC55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 17:35:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpr8V-0000IN-RF; Fri, 31 Jul 2026 13:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpr8S-0000Fz-8x
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:35:04 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpr8Q-0006JY-B7
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:35:03 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-66843536f94so1324373d50.3
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 10:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785519300; cv=none;
 d=google.com; s=arc-20260327;
 b=ZDRL4qh1UP2VPZVxspaRa3XWVTJ3b2J1lp2P+aQMMCclq7VjSwUKpVR57Pl/YEJMIl
 0ojgPkec5LHyvcj/q6PwWHap4SD89TZJ/QnzeiGtPGNxrLq4zZDdYcqnS9C1UwNWIx6F
 Gh5qwnObkrhbBkMw4dn/PJXaJ+o6eZsiJJSjJwvhmIK+t6jFFNwK9PhMHmZAyK4dtL4s
 3+rcJNUnqSEsZiUsRAVL1fqCEc9h29t/+aY+RDYL9gtPztJWoR2G3k/2xPpXnNHtVBUJ
 fS41oD7YZXYHKfPst+O3zWjx2AZBnR7ZXvab+ssTJ7bSuBGVsmC8IvM9u2+RxiiqzquT
 M45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lpGFXL4zpppFmspHMM4JCVku3tmOtHiMqL8nH00KZtI=;
 fh=QQTEdxw/PGiktLi2mTb+3e6Sx4ouGfDCTdDW1+Z8o14=;
 b=SLlZdKJuhaNflyTmi8u7Kjmsw6IXlU/arQ6xHtupDSiRk+Xqqg209BtztWENDWbDqo
 E5wJXNLlkXNrEcnA13mMex6WuiaY7tiyEerWYsYpCkQzkbEUsRR/ZQaEF6MIdMu/ZJvm
 5q7PhKJmvClAFsDTltT9gN9/QKYidPIONn2Rp7cbGImU0uLZHxN/WsX/cFnQlnLZqluY
 orCzixYEBLOBeyonnsmWSD5hyT0peSXCp3C0Y60//7pZnNbbZsyhYoU9uVXokURTP/eh
 2TNfSi3nOPGhdXjpOFgrqjuvtYMWaWTgxzQoEmoT0bcm28cilGLYAC69KwP+/PDKENh1
 20mA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785519300; x=1786124100; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=lpGFXL4zpppFmspHMM4JCVku3tmOtHiMqL8nH00KZtI=;
 b=A5dJLWjQ66oi0TLYKQjv/2/nCJWbnyjcpWDXcqenQUAyw1vST/NsuHnw9fVs3RfjNI
 R7DRYIFwDehp6qxwlWGrqG77emELH7kkZAbfSMZBYlwD0Zfxx8guw4ZIDzlNWVjaPVf1
 wL/dMu58iaicOsWhkJtKpeZPHZ17nvztIpWwJ+00fNuMAqfFs0SKS1UxhF3E9+oh/+EU
 lqTS5vbLiwsNKVFcxx9ZsFWKsIpZ4VMsjOKqKbLprvC4OLt73lBChJn/l6w8bSNUAtxI
 9y4Mmjib/T2v8oK+jd9dTTakAeEixg6cwYktx4NnXgCGdGWQpnlIK1c/WiGvV627BxvY
 4wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785519300; x=1786124100;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=lpGFXL4zpppFmspHMM4JCVku3tmOtHiMqL8nH00KZtI=;
 b=D2xPlHgzpIHyjTFuqE1sQ1UdQpfDCzQBcTtNsBHo+F5ewH9GRDFTI5nKMfX+Rtf4mL
 j8HYpGFsi1ZhsvoEtX+T2Dq9gJvWJY1j6M6W8EG5dyUbJjcD2NGZu5HXs4/OuYIRSTyz
 9ZB9+QFl++1915kcswJjg4OfaaLc2+9NXzuZgkLRr6eZMnQCrmY4fwpoKJSL1YDZC+ud
 IKj7Car/klcnZBXmW1SOHML6CJBRy7x0eBc8lsMPoQvKNHVVYUC1Pb5dH2CvbIEXlzoN
 2+yRzYrZ6AzbkJPT2QzB7ULNGd9+KRyU310fkEDxaZuzPcYPtC2DJ96NpKyOhESTdU8L
 4fjw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqLoEpSgybHtc+U1qSauaaJ2LvLj/eXHMRDFPwg8ofNgU4+V1wMzk+quJbzz+KulCTsS+b1buq2rw==@nongnu.org
X-Gm-Message-State: AOJu0YxFKLXkWmqtdys/5ZHRkyFpIT67cbICZaIkhyc4Md1Ha/DaFl5a
 /XCdyBWwUEP+xXJtaeRztE9ccP+RcHX1VPbOmzaQeUer8YPKsXfGg18Z2CGRyX99T9YqVG1jMhm
 QYD8PGL/5DoI1V1VvK4CXoLSiVQn3h3DYXkQwnurmJg==
X-Gm-Gg: AR+sD13DajiCzulhdE9xipYnEKjqI7mynbvVDwMqJCN60CwpDWf4X4rUuTG0+KqfgHr
 GTyRi7HZc8zTEniPGFUsrDGsfgcAm7qJ+Htmo6bj4+tk1GwouBSvxXH0u5nbw3eQfuSw61G3XW2
 RkT0v7P3IUDzboPQ6gyvZhroLRGRijND4KXoQ2VvN+AazpfRKxggwLI1DPNHmAFOLnzZUkkqTUO
 9s8Uze1AGTKkSfT9+6kcrCaSzjnGkiAWT8gWKYKZ2x90mK5WAni0QMLe89CfcNs7hkxvksEkuku
 d3VTvouroWaZLQBnA5HNWnd8X9GIbAcGhU2KHWmhtEPrDzMMP/YyKRMlTMRo//dgQlGT6EpC7bj
 Jyckk4I6mOSjroPVcwdvSGj+mYrLK
X-Received: by 2002:a53:d683:0:b0:667:bb60:78a5 with SMTP id
 956f58d0204a3-6694f26964fmr807480d50.52.1785519299978; Fri, 31 Jul 2026
 10:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260724031123.76597-1-richard.henderson@linaro.org>
 <20260724031123.76597-3-richard.henderson@linaro.org>
In-Reply-To: <20260724031123.76597-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 18:34:46 +0100
X-Gm-Features: AUfX_mzhHTKt8XWwrt62Mo1VoM4odOPBNmu18-6VG5gyoTFs7mWf2F5IvPRgBws
Message-ID: <CAFEAcA-rG6Q=oNCw07u1pojxHF74AA1xXE6ej_u6zZeBBeHySQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/arm: Enable writes to SCR_EL3.TID{3,5}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Fri, 24 Jul 2026 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

