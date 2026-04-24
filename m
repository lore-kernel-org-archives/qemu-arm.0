Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FFBFB44C4
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 08:17:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGBig-0007T8-MJ; Fri, 24 Apr 2026 04:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGBiY-0007RX-QB
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 04:16:55 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGBiW-0005Mh-4b
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 04:16:54 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6501d242e2fso6923471d50.3
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 01:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018610; cv=none;
 d=google.com; s=arc-20240605;
 b=L7LpLiYX7c1WBOHF6RhjhMSxC+Wl+M68x42H+yKwJAhG0FFJHOIRjKVvcMy+qILmr0
 Qty9YdXMQfaV1Hmb31uThjEDsji3d0poeO9laKBql9R6egLARU0fO2bHIJ9ToT7+5lZO
 Qa/srT3VD7G29c/LbCJ+wyxDGErUrJ5Mw2R+9OU6WMzDl74n8/TK4zOjeAp74gH9Mh0K
 D4Rze6/LZ4ZlHFelFXvC6//ZNsMMG0+oHDyHGVT6bgx/znO45EiMLIo7NxoFGgTPM7wj
 q9PCWdA2jCNSl6/ZEOEb+SeNPh7ha3LLdOu87GMeR2DpsgjqPDJRXHuyYo5Fbd6NCujo
 Z5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BZDj/uNwXjz9ciY7gP9yfKn6ZQSybqJFnCXISl5FlHs=;
 fh=i8mY1VFCbEOE96JwtQIuHOwOBU+trR+6SkBmOCIySRU=;
 b=LX2W/LI4wG034xLN1vw75kFqTVqmyhgvwBX84e/Z975DgOcvwRDNz/uaUqVq5XE7hU
 vznwKg9fptDOISl+JgGbhi2nTdffmeN9mMleOVnhXwLggarmtG75h+OzItHZW+ovi5xg
 jqCuvRpwJ5KWSXhCAr/4BbKYmkVhzrLQfO6uRz/OeOz8/lNfiHuUQIAaH16EtwFQeZYO
 vwF2iubNk4nsBG4yVAIHDZK+7wE4ywv+OhJ5n+dwDUV47xwZebUIKWMWxk1FfmdxPFyO
 jz0+2mpmQLKHhMvxehkqeJMx53kSvNY/MhDBBHqoKIRf9Y4JKXCNEdzFiyqMWBiq9Dlg
 QlQw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777018610; x=1777623410; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BZDj/uNwXjz9ciY7gP9yfKn6ZQSybqJFnCXISl5FlHs=;
 b=pjFuc1hfy6FTOoJUQIWFU54z4fWqN6XxIPfL7H/0gONiw9z5PWLTxnL+GiBwXOxIAl
 ziRxAC32POUM1bjigwIcBBD/t3SE2B+FpAS5YZR/Z3r+h9+E8vMDjt1DJXNILjxUCyQW
 4m8qHNtZ3Iq+5m6MOgBR7hFxdAqgpyRLzwEIo0KXkh33vUgybBkd9nYhAg0qwkAqO71u
 m1VEWLy4dNrLWYxn50c6vnmC6R9MB4lKyv8JtpMivmU+8kytktCisOb+qLU2CyRoNsDf
 9jGEugQYy7nXu8iTrdb4ul8FTr2+0bxPltqh0liPVc0BgEY/O0yf+0H6VA80kycD+uLG
 rrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777018610; x=1777623410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZDj/uNwXjz9ciY7gP9yfKn6ZQSybqJFnCXISl5FlHs=;
 b=mCp28m2KyV4bf6zdPwQ7dslMm0RD09R8oWZb0eXuZBoKrRBax6/RuH1taEABrk5JRI
 PzC55tMhMVqhpmkqCW2E6tIjgehrptGlYEq1sTY8lzqfpdEc5TQRAASLlvG3uGq527MV
 fHTD0AS60x+1jUeeXXLrqcYIgLMyYPcQzmDTiEPAer2AI8EHncGotjY8WZrzYW35H1aT
 omIRRMhnNizwWPMl+XPyAkbPDFpryM+sXFTrp1PxxQ1OCEID1jvkw6G+KWwvflPK/EtM
 xQk1QzIpPypssvac9gkQzhiY2ee3jb0wNQZ/yYaIXD3jscj5IIy2qlV0Qwx8mwAEgqk6
 WjMg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/i7zDgsSNdBgqrFI5jBZQrkwBSZe002qBvlxHAMtcW91X4Q5mMsiYx5/r/QuvbAvkxGmfOVDVQwQ==@nongnu.org
X-Gm-Message-State: AOJu0YwT9crPQ6FrSIWJlIHJSK1JgtjLLgYyj2f5Nx35sDU5R5eBjxkU
 1C1kg+61tCfJD/fkrgnGql1E7hK73zGFFO1b/opwmzuJ3CRiWtzrA2QBdtP52ey1Uu169W/Wi6p
 SE3g8Ug0f36pS85PC+1d2U1iVKzcvjYB4OzLRf4g/1w==
X-Gm-Gg: AeBDievXst6uphscyQAh3Iy3Ji34Qj6ZiwEEzrCDrHPPgkiYdR3YBJ2rLKFUcJDQlqE
 68i9sXV/Uyd4Tde62XeuxaMjLyTdHc1qgaSDnN1pXcIFz9hrncoatrEzWOYflU+QMA4cauNEipC
 m5Gf+o+xyT0gEN39w+yqMnak7RXNslOrX4VsfzwWXSblzodm1Yo5mYE0+xvA+HFdS/Gjf4Z7Ru9
 wXnZXmRckJIj1SytHqgUw/ozY5xvsj2594O3OBuCo2X8JUbAIA5trYsnjR7aWoOWoefGpwCBa5O
 tUnPxTNW94KXBkk0N7YTyw6wk8pseaXAmRCF3H1GIMvTBKRItnmru36in+d6tXH06nmk1T78Or8
 nmw==
X-Received: by 2002:a05:690e:124a:b0:651:ccc1:b4f1 with SMTP id
 956f58d0204a3-653107b883emr28442133d50.2.1777018610100; Fri, 24 Apr 2026
 01:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260212104432.4168886-1-kchiu@axiado.com>
 <CAFEAcA_u5B2RdVEaGycCQ6gCx1pQuT8rvGVGZpoKLTK+2s72+w@mail.gmail.com>
 <69691e3b-1605-4a5a-8ad5-0eec56ce3eed@axiado.com>
 <CAJy5ezpcvp0Qy-P9gE46oDtsxZxNO=xMV1k-GC3WF4yY3gARGw@mail.gmail.com>
 <CAFEAcA8mC4TkicLy9bcS8NYMDNcSUjsataGGmkMpViw4wBvmCA@mail.gmail.com>
 <CAJy5ezqTAMr=A3uAfmuWLepK66AdLRu4Q8AmFMh4+4q2HtDrkA@mail.gmail.com>
 <CAJy5ezogVjNxHLFVBp9wd332kwyR8peBHMEjoALg6pYfVk1q8g@mail.gmail.com>
 <cba7059c-9472-45f1-8fb2-06b26036f958@axiado.com>
In-Reply-To: <cba7059c-9472-45f1-8fb2-06b26036f958@axiado.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Apr 2026 09:16:38 +0100
X-Gm-Features: AQROBzBnnWSysx7Yz3VKl75g8CsUNz-TtcznwmdN73oG75bQJunedOsTrWy4fzo
Message-ID: <CAFEAcA_jAyW5a2uyF7r=FBsw1dx3CCoVkU3hkxqQzAgxThYJEQ@mail.gmail.com>
Subject: Re: [PATCH v1] hw/char/cadence_uart: Add BXRS register
To: Kuan-Jui Chiu <kchiu@axiado.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 pbonzini@redhat.com, marcandre.lureau@redhat.com, alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Fri, 24 Apr 2026 at 04:08, Kuan-Jui Chiu <kchiu@axiado.com> wrote:
>
> Hi
>
> Do I need to take further action on this patch?

It sounds from what Edgar says that there are multiple
versions of this hardware device, which suggests that
we ought to have the device have a "version" property
or something similar so we can select the right
behaviour for zynq and zynqmp.

Checking whether there's anything else missing in the
new version of the device might also be a good idea.

-- PMM

