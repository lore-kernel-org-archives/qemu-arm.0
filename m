Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6798CDE00C
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 11:55:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd59L-0002pN-PF; Fri, 26 Jun 2026 07:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd59K-0002p1-J2
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 07:55:10 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd59I-0000Da-Vy
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 07:55:10 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-662dd616cdbso1032751d50.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 04:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782474907; cv=none;
 d=google.com; s=arc-20260327;
 b=fDh2Q7RPOgtyfaMBgVi0cDrpmxECFV2OtJRXCKzMwy+XleCeYpWkPORWOFTF2jCqDh
 xHH8GhztCbtt4mcCMMM4F6BsH+MlUXtSa63JHIUkwM/9ns9lI3YyrafyoH9DAwfjIFMO
 AaHe0hmzvBwcnojItwM+2AuCPYTsuV7YMZJ0o4EkM0dpGg+TrAws/2Bs62msyvqbtryG
 H6R9R8roaZ+pHnQK/dtSZ/vQd/UK8bmI1IOBNRdRon6bPzt7uW17sbsF2DKmDhmAEOUc
 lQ8bl957VY7IPtKA7g/VZZMH3j+fOFz13Lt3RgcNl37wDaA1Wi883nYug17f846qjHML
 hZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8yz+i8f6mXle9DeAFygw+Xg//mpzoNUwELr24iqk6lw=;
 fh=25OVtH87Grw6QcTenhysB5g7uPC6Y5MHASow/xaFV34=;
 b=Z6R+ilhhx1CiPuLV/A7g4WbkT4nPJkTxKuhUVaN6mViCNZTIje3/EY/Hwkbh8WDXSR
 +9xKh9KAXXpTJq3KwbTWuWzt5SLephSPkSG5I9Q+oWtcOfq5V94MH3xTFolyd9wUG72z
 GWfhgPqABsve/0tlSANPWeJ+VzshcmZy3kRQhKlaG5FfSsITN174961NcVdFEnBjhfgr
 GkXXjqsgGA7nsdds1ne4akdS7ay59MR6r3LYks7R2D3pdh5Xi+OH5sdeQEpXyCqmKAFu
 cZb3hbu+Jh1z4iUHqIiwhj7f6FCY6YxD3QgqtCR/al6oXZOM7KPCdZE9rl/2gJdCv6Yu
 3oIA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782474907; x=1783079707; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8yz+i8f6mXle9DeAFygw+Xg//mpzoNUwELr24iqk6lw=;
 b=OKHtt1kEaeRLGsGaTTNt2SrbblW9fajhtSNCEl9Arsz+8UZ9rQYQHOvEMwhEmMzk2c
 G2O/39VwvT8mtZcIw0QzCnP8eVBGm+Wot7LT9wCS1rnFi5B9l1FAJHjSGM2mRRph+jVB
 SyUqqiDBAVZ9UHs02hUy7q1Dj2jiTiYExgIq3BsqDyBLGdAyIO9ihO4E+rfTMqHC6znO
 IcyZR2nV8lPPd5QQPTYLSpxi5kLQLVXvsdhMakwL7tgDOE/XSiOBRxGT/NA1RDfHYW8e
 j5rzMc2YTT6FyjASi3hu9MEsCGJbiryvZ/lZP6ThCiZFbkCm19JFvuddaOx1RsdxZtUX
 N75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782474907; x=1783079707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8yz+i8f6mXle9DeAFygw+Xg//mpzoNUwELr24iqk6lw=;
 b=TkjxdnFrTeBwQL2v375stcTZuYB1/DjRRAYwORZYGLrY8nQceJcwBFWwIuFn7cJeZ0
 /Y/uAovxGi6RbQ8VXPcyqatw6I/eyFND8eFd1qFvH8gFJvGxcS7UeBlO4x9g3OR0B08x
 R9FZj9TUYnj1PWE5OusZPz1z4SmNZu1cgpWUku8wVJGXRGbIfaPzIY+W4jI6P8QThaAL
 GCvnYhB/8yWpVngtfP2L2TVfAVB483Cxmaa8uMnICVxXHlaGQYhNTAsieBOwFs48c6Fz
 +YBb1yNW1ClbCJ3CubvUZMDwU1BeQQjqh+J3qn7jUCd2fCY7Ree7Uk0KtD4Ke7/5XX8M
 kG7Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoCj2uiMZTct77QrycC+Xe0BTmA3m+P3oQzKno3Xh1tOFMm+BBc8U29QNnMC/p+O6HFczMXQ5O13g==@nongnu.org
X-Gm-Message-State: AOJu0YzPYJo4xkxdr1Aygc65isnqaTAkOZgFjmkMHCH0EqVztQ9OsUaP
 FlWpTaYYRvD7VvKcXQTrn5kVCIzO/P00qjrNkBhNZ4YEIgO+/0nAdNy7Wj9K+npaSMKm68ygk3T
 gXJJwFVKNU1hu8ktfgdIgxRt5ALQppMfGw8In/kB12A==
X-Gm-Gg: AfdE7clNN24hgMaEMVKj7hU8rxMdykkvruT/VjxLrco/O5j3BqlrbVjnEKPURmdw1Wg
 RRxWkyCuqd6bOXJcsakdT68vAAWjqRvsw6N5vQ07TQL7oGgahluMJCiAfDF4g/jMCM2VvZeRnco
 WExLrlpTJGDsOy+ix1JDrlIw052mzO4YyQl7uryIL28MFVwSLt8IA1HQcbtmnuThky9ObBKuAjb
 pSIElmz6aIzUVJ0q8QE5kL/1gG4BzyjT06QBCxVX6NlF8GXzRrBtqfFUA+CLFI2XbhaFhnjpaaH
 fHXPXYFxrBqV6BLetCgeGVPapO/CIkJNg6Kje4O1l8SKg99i63yrNvH4
X-Received: by 2002:a05:690e:4081:b0:664:a341:4534 with SMTP id
 956f58d0204a3-664a3414862mr1028002d50.16.1782474907339; Fri, 26 Jun 2026
 04:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <87se69haxi.fsf@draig.linaro.org>
 <CAFEAcA9fR=iZ0tqk2xBQixrMdD-JJf6LZCLCArUwWZtQTW_UiA@mail.gmail.com>
In-Reply-To: <CAFEAcA9fR=iZ0tqk2xBQixrMdD-JJf6LZCLCArUwWZtQTW_UiA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 12:54:54 +0100
X-Gm-Features: AVVi8CexCmzHv4FOB7wF_1aUN3EuZo_CX8oubuLcI5vM8qUzlGlq5asGIwJ7np0
Message-ID: <CAFEAcA-co-_x_py1mQwfTiYQKRyN1hoc_OffN99TnuFsr6gVfw@mail.gmail.com>
Subject: Re: [PATCH 00/10] target/arm: Implement FEAT_SME_F8F16
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Fri, 26 Jun 2026 at 11:16, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Fri, 26 Jun 2026 at 11:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> > Richard Henderson <richard.henderson@linaro.org> writes:
> >
> > > Another minor feature working toward SME2.2.
> >
> > This conflicts heavily with master - did a bunch of stuff get merged
> > that broke it?
>
> It'll be based on the F8F32 series that's not yet upstream
> (it's in my target-arm.next queue).


https://gitlab.com/pm215/qemu/-/commits/target-arm.next

including this series.

-- PMM

