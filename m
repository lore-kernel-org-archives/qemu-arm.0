Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2191193njb;
        Mon, 16 Dec 2024 06:03:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIucdTAJ1Qr20NaaFBzj3JrKfktTPfgz0hVTw2Jgk3lwLIyJIoah/mdanAw7/8Jc0tFBXzJskt0j+rig==@linaro.org
X-Google-Smtp-Source: AGHT+IG+GIFvQjARRfZozjANaKQR96ER5t7w1QH3LvSGWYxb6NnYdJaK7fEwnltjsg/X6k1K8dx6
X-Received: by 2002:a05:6122:8c0f:b0:510:3a9:bb87 with SMTP id 71dfb90a1353d-518ca3850b9mr11692389e0c.1.1734357800428;
        Mon, 16 Dec 2024 06:03:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734357800; cv=none;
        d=google.com; s=arc-20240605;
        b=Grb9/avoSE2vxuKC7pOD3az+A92rWQn87Ih2dvGFJs2AY9cVc/Ep8xNQ+1nX+wqnoQ
         +NBq+JsBXnY9mx+2qP4O6Z4Hqznc2AO3AX+PLBXgio5xyCdTgnJluazdYr7blbbEN8vv
         eVW1m2Wxl32GUHojei+4rSugHPTlQE4HWnMpTg78V9ywowvqK8BuImaAFDOjnWzVTObA
         klp0two2c0+tybyJCNsTusGTpVzkscA6QWLrCo4PXoOddRjLk5888e7iQhcn4uuSKhDx
         mWGmufAJ/XPpXpbZ7dLrBvB9AL8UoNmwXEdLURQxeVv/ilpleEMXAoFWALgirQCJvc6b
         5WcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RzNMTvisVl00JWzDIXfMvjdII9ZM6+cpVBAh6Ss7FO4=;
        fh=iJ84a8oX+ehJgsZtd+E6XBDW+U3USaFonKTV8Vlv4yk=;
        b=YCOdaQ4bnDA6Zqdnxgi70638cqtK9DtvpTzBFWRkzTe+rvZLcqSycdJxVC906jsrTE
         PwRldW6YD1jvZsYVRVl6VpWCCSYhxpUppWIfLtJtiLgK4farN8gPHxGwmy9ucdrdb88N
         0pVaQXf6oIW0KWVto/lHkhQNdHRJrPAYjfaDp6iztScDyitfHNSynfhT66CHfOo4rJ18
         AenogOv9Nss3ulBAIKEW3kAWGPyopzFon2WMofeJD67qY/lsGaRWKzbV4SW+P3WZ4xxs
         7GHC7kDodUTxCSS1WizRpmU4Qa9TTBesAwhJx4iEgJg+Ege8DhU3JMutOEKZt8OqZomr
         ZXtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DyvOOJj9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-519e30e7e33si1350352e0c.57.2024.12.16.06.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2024 06:03:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DyvOOJj9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNBgm-0006LG-HA; Mon, 16 Dec 2024 09:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tNBgl-0006Gg-9j
 for qemu-arm@nongnu.org; Mon, 16 Dec 2024 09:03:11 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tNBgi-0006Y2-Fx
 for qemu-arm@nongnu.org; Mon, 16 Dec 2024 09:03:11 -0500
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e39f43344c5so3106993276.1
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2024 06:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734357787; x=1734962587; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RzNMTvisVl00JWzDIXfMvjdII9ZM6+cpVBAh6Ss7FO4=;
 b=DyvOOJj9K/FEgR1ZL0Y2nF1dHwGQrNf/80bg/K0rCkGBx1VWri12Za4srgzlkKEGKU
 aVUgXnIgFutsiw/vhQyiFs0Cfys8C65fRFewMWGzP57mDWvqOnBJgd3TPsvYHZZugrsU
 qrAifGD44G3IFSoycNkbORXaqtl05hFTCVzXDTdvCXmKktf6azM7d0+oHbi7Ovb4jiTe
 iL5KdwyNNpHtm6W+3/yvspvTFCkdcVijqgGEOACMxwF5a3FwOdyuC12cGZbtGyPaCy8A
 7qUr4PGdRGTWzCMh3h0+rBezEkWL7eCXu159xs6iZ8dEYQVARvYJXh1HfhA3exnlPvxy
 /UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734357787; x=1734962587;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RzNMTvisVl00JWzDIXfMvjdII9ZM6+cpVBAh6Ss7FO4=;
 b=IcL7yMLDMT5C02h2FlmvUZjrwhAf6ob1ws8LqWIIOmj1wFnC+ZXjE6gfJbV3swm9sl
 B95NigDZ4Elhh8BSiVQaha6+grS1jHyLrBXy/v5dHhAAE2HQD81904GVH2alvzDib+9h
 76VMuVEptQZWvEcbHWCwiBjU/x+TltWDc154u9m0gzMKN4JgI6Rpa5v2dG09ltblDnst
 77b1dPvx8DI+x92KbFTFXcgnFugyyTM5UWlIfe1HX7I5UyFR+hLvjUzfsmWX4zuRtjT5
 2ojarNq2zMOPQOQVK0CvNln/3jjC44P0D1SclP+zx3nE1HT1J1qS2sYzzkkVy5QzBS5K
 QeXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS6Ru9kYU5IQ4oaYYb2jGLHjC/2XMjd/ISLEWoIRM7oE39baOylobH6ghAwrBidE6UNcF3CXvDVA==@nongnu.org
X-Gm-Message-State: AOJu0YxLZP1GNVb+DXnRIKyAZ81KHW9pt6N2znAiUx+UxXrujcH5f2UC
 HDH2DW+Gy2/ZNIgdrx5c+bPS39Vhr9Vrytf66XQQs3FQPHIzW0bM8qqTncoeiLgpgo9AmHlsSIr
 aD8FQGbNXub67K48xL15bfRCD9eBVPgvb+COlCw==
X-Gm-Gg: ASbGncurhj2vhrYoNXMNFtSa0mbgMsjYermHcw2WFLlb/d5xoxVmCEZan6zko4Mh33D
 8Y252jKZs+1vAZfqyzsWFC6pBFttl7gViTURRgmQ=
X-Received: by 2002:a05:690c:4b0b:b0:6ee:66d2:e738 with SMTP id
 00721157ae682-6f279adbfb9mr114447157b3.2.1734357787083; Mon, 16 Dec 2024
 06:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20241206031952.78776-1-richard.henderson@linaro.org>
In-Reply-To: <20241206031952.78776-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2024 14:02:55 +0000
Message-ID: <CAFEAcA_ERdrBHqX4nOP7L5Vcs4ZQownF4_=QxYjRfJEuRigfpA@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Two more float_status conversions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
X-TUID: nGs3m6Z0iKeO

On Fri, 6 Dec 2024 at 03:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hi Peter,
>
> You probably have something like this in your AFP tree already,
> but while I'm sending all of the other float_status patches, I
> thought I might as well send these two.
>
> Based-on: 20241206031224.78525-1-richard.henderson@linaro.org
> (target/arm: Helper type cleanups)
>



Applied to target-arm.next, thanks.

-- PMM
