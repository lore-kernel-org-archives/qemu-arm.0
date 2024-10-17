Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp60910njb;
        Thu, 17 Oct 2024 02:32:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNN5NQVLUDSdMWOMzrhC6cqMkBFg1iKOI3otpffaYD5dpNP4uyrfkazPXpJTE+5f9Y6+vDzUCHeWHAAg==@linaro.org
X-Google-Smtp-Source: AGHT+IFc+QWDF5+aoMCLEzBNwawmJnX2pXR0uyaCjeFDGuOt6iDvaQmb4grDi8PxnRRTNkfI3UPO
X-Received: by 2002:a05:622a:4c83:b0:45f:804:738d with SMTP id d75a77b69052e-460584b0025mr322810051cf.37.1729157537849;
        Thu, 17 Oct 2024 02:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729157537; cv=none;
        d=google.com; s=arc-20240605;
        b=YCxJx5Yr2ypA85cxzke0ji1/TcmuXkOZ9BjibBhfYFaU/PFkviW1T0OW/QYpHbaY1v
         ZQTpjJFsfd9myiZ2LfhAsMbK5O4UIsilDHM3jXoEvxr1LTJ1F2harzgW3Y5ZAU+95mAq
         4i9Hufw/IEMOl1hrzG2Z64wo/nYdQSGhsL8vi3kMlWyGmGKtn2Y4qax0GQy7wTGespEy
         03Ur7H5iQr7lwVRMT0bQPgHSK5XwzdRv+3cGXXs42IJ8qBvQ9N0e+yZ4KAhCkoquN7qC
         Wfro9vXiUaSxSnfceZO4u1jwNxZWs49Nq0R0MAtxtxuXNteH+TZ7hDuKqQOpRRo1pxdN
         3fbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tSUmQ+5UahoSL7J+r+hrCJZoKTaSjN8KDYFOwxiJCEU=;
        fh=t8Okep5hPLgDBbSotLK/q/MSgEwT1tCy9QpJY7LEyog=;
        b=U6k7RJJ/8FKE/UrP0PiqSdTeTYIhr1+Dm5qRl7g/GFmVHjHtHHrKakbVsQQ8ExW3Zo
         pupNjPz2RUk/QNeOdaG3czwjWaSSFvBoLTUaxdjHJHuORzu/YuqLKKGgrXNhSEhATxW1
         tmLjhLQeM1VdGFMcBs+rUro+9n7VlsowkJWxjVXD+pltoUxZSkzFTdMPMZlQavl7OTlR
         FxICzHGgYLhhX/BKTolgFWRI6vDLLTr+8/XchrhpxP44bmGJqJFk0RTjeOI5BqtdhTK9
         op8t3mNaqZ1yOdkEPZ5Nb2400SkCdLjKICqA24RA1nbAcPmGm21TQ4VdKulNTDb1ZQ4w
         wH9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P5fahgx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4608e8fafacsi36563071cf.328.2024.10.17.02.32.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 02:32:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P5fahgx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1MrQ-0002UB-Bq; Thu, 17 Oct 2024 05:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1MrO-0002Tg-V0
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 05:31:58 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1MrM-0006Ku-QP
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 05:31:58 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fb5a9c7420so6996171fa.3
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2024 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729157512; x=1729762312; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tSUmQ+5UahoSL7J+r+hrCJZoKTaSjN8KDYFOwxiJCEU=;
 b=P5fahgx6oBiR9KAHWn4E+oLUnQMbboRs+yx8AF/xnut3e4tgHcD4qZYvIxCMSz1UgH
 w18IPiD6+hpmD6MZ85/5pKAu0mk3wH3+XcTbjaZnUqOa0cvsxkl1gK+CxkwlFjRU+sty
 xqXIINO/OXnkaMp88CCuqoAOQc6MnPUWq5dvGMKz++zeBtBZQpKQmHW5Q/d8a+Dizkss
 cqVQ3cHFsprU/R8tcj0WpuXrtvmAI4KwDCv53mMiKULflunb0uza3uayJVh66lnqMysq
 fNkwiOH91qJI9H1DV+cKX/19FqTdsAy66CmUd6olKfuD2bbS04nCG1LEJASgKji/RcPh
 Pp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729157512; x=1729762312;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tSUmQ+5UahoSL7J+r+hrCJZoKTaSjN8KDYFOwxiJCEU=;
 b=fQiwYQc8bGvu1TW5ZX92kH+akTAdpVD9sjQg8mgApwMHrAnskN2ElEbj0SCV4BJSrA
 jft65Bzek7QuvpyVFoKtCV+056c6D0tLgeYIer+rg79U+e7Qa9Rr4TMF/AKjqZFsJ4Q3
 3D7nfQAJTKZZHT4C8W72BYvxuoGxE97qKEbtRkMl8zYJLO23kmVlbSHLsi0b89ePkCXS
 iHQkJemGH3EpJj37FzMwytI3xs7wLFbuEVR6E8TnkaMLQ8mWHGJLd8KvOGkPkaIAFPX5
 IjdWHWJvH9dKxPBEaMdjphhp34IZuWfrIhGp1ErYwJdoFHEuQp7v16bRsDBQj8ormsrw
 9A1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwnT/1kZpUtsNqH1hCS+YAodq4RtqhYJlSYv9C+QKn9/lUdYscXsNywsXRcpXAQLiNaHFdSoqNFw==@nongnu.org
X-Gm-Message-State: AOJu0YwosP6fgBUQnk3fmThlaqTDdY15y2JReGGNmKO7DmMEWjXs0oLU
 8PEiuvO9uI+N0dm9zVQZny+lk/unkYrwZ8m+CuKzlbG7opRxGrfZMNCYEpQXv5o0L0HLLUZkAPb
 CET6trZqAdYOS7+qAQ9Pt+vmgt6RCSME36VKZAw==
X-Received: by 2002:a2e:702:0:b0:2fa:d67a:ada7 with SMTP id
 38308e7fff4ca-2fb3f1b764amr79485471fa.23.1729157512018; Thu, 17 Oct 2024
 02:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241016212407.139390-1-shentey@gmail.com>
 <20241016212407.139390-2-shentey@gmail.com>
In-Reply-To: <20241016212407.139390-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2024 10:31:40 +0100
Message-ID: <CAFEAcA93N-44Xi5hDgcA2iOJ=RD=4jRuJoHkZJ7ViRnaq55zeQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hw/resettable: Add SOFT reset type
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, 
 Guenter Roeck <linux@roeck-us.net>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x233.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hM+16VhouZO2

On Wed, 16 Oct 2024 at 22:24, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This is a preparation for the next patch.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/resettable.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/hw/resettable.h b/include/hw/resettable.h
> index fd862f1e9f..0f25beaf21 100644
> --- a/include/hw/resettable.h
> +++ b/include/hw/resettable.h
> @@ -40,6 +40,7 @@ typedef enum ResetType {
>      RESET_TYPE_WAKEUP,
>      RESET_TYPE_S390_CPU_INITIAL,
>      RESET_TYPE_S390_CPU_NORMAL,
> +    RESET_TYPE_SOFT,
>  } ResetType;

We have in general been avoiding defining a "soft" reset
because it's not clear what the meaning of it should be
or how it applies across devices.

If we want to define a new ResetType then we need
to start with the documentation which says clearly
what the semantics of it should be and when it
will be triggered.

You might prefer to avoid entangling that with this
lan9118 refactoring.

thanks
-- PMM
