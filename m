Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3126362njk;
        Tue, 28 Jan 2025 06:23:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUOzuv0hb+7VzdlmQGbpyOWE78295BAjw6nHksH5W9CWsbAvNsGtf5kI1uoJ7pRr+yNf/G8rngkhlFbEA==@linaro.org
X-Google-Smtp-Source: AGHT+IGT8JTpmJp6sdG375lRIIFs9rw6gQTsj4KC1K9Jv4Iq5mQBCBy/LSLg7V4+tOCQaeoW+Syw
X-Received: by 2002:a05:620a:6884:b0:7b6:d76d:3bf8 with SMTP id af79cd13be357-7be631e7249mr6585094585a.11.1738074190241;
        Tue, 28 Jan 2025 06:23:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738074190; cv=none;
        d=google.com; s=arc-20240605;
        b=J5ErSWet0pBTNaZDz6Rzv8qRJew4QuK9ygiDd1N5+1YN/QuVg10ERa5DNR4PI8ODlF
         G5BTJuoIhoLTGY6dCyijcn3+3yxSjYfct1GWqRoX8lKzn4frA8B7I3fjEe19z19WNPyj
         qcdi/jj5fsgW1sT9g2jO9Q5TNc17sM8OJCVXaAO5wALZujX5oku0F2NlOGjgvWaFHT/s
         XjSA0AwEN8+ZS2uzmyzmgBEk3lFuRAVnzKSizwIryQ8JwkxlIUMVPmTpTRPbyBHcAZoJ
         cnDsYSmXym5dd3zKpeIFsFOQl0lWBVxWQbsz14QhvYnj5xdaUugjxFjBwoaJBnVXfe+2
         oxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kaHVxl7vuByWpkORZ5+/TJjUTPhuNzyYYiswskPNg9A=;
        fh=pU5grrzmaCWTDawwaeBwfaukh6TRnIUtfWYXMRDnObw=;
        b=G4UTIz1ZbBySsGfPP3an08H9czN+DTOx5/hAQ4nw6ngsxthQfKvsCHCWgIpcsJcT5B
         GBqkhwmEFfdJf9iF0B5h0z1AsZEzcyrbm6cucahRhN2zEyi0cUR0GI4RPR7g8pJ6wa5N
         +b2qg834lBYBOoI+opNj0duVH45iuKT2/a2tT/j4SuzsLSptokoqcVCkId/cwmLYl8Zh
         v8ydj46+7TZJYn1e8yMtiLjvg5ZuaC8H17l8SGiWePPRvSK+fRDLjE+Yzoj+YyY/p0S0
         yDMlZ/YyD9gMtdUX8wbIHhKVTXa73TZixcB+zsZrsadK6p+H7Kd/0eUcGHya9eQ9ZNvf
         O03w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PHxMzgdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bfebc3e1f6si506796185a.550.2025.01.28.06.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 06:23:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PHxMzgdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcmTl-0007mJ-2H; Tue, 28 Jan 2025 09:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcmTj-0007lr-Tb
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 09:22:11 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcmTi-0002KF-An
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 09:22:11 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso10018654276.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2025 06:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738074129; x=1738678929; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kaHVxl7vuByWpkORZ5+/TJjUTPhuNzyYYiswskPNg9A=;
 b=PHxMzgdACBQ1j+hkbv+pG5d6U6FCnlA01JNdqWQaIOxXZn7WVTiJp/6xFA8Ms5rLyv
 JgYDcCauAICFaCcCrmJYc1z/hA3Xh56Sm7YnkJqAB5kSVeLSwUIKsqxHSzhSQ2i7TOFC
 8uZEKC4KUcj9rgTk4wwYiZP++WAv62zxrqpm7KdvdDofKIGXaYFNdrm4fYte5xNp9cQ/
 JAE1J31K9Y4RXGwhcM6VBvR/A0ZZWwW6mU1JJDVEWULQlDZSa0k3p3HnlJ7rYETUGYEj
 cIftdxbOgEu5enV9fcH7eEZ6JDhNrZ6FYSyq3J47ykZ2sLEClFlz8FzUNHEVDKk468kt
 vduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738074129; x=1738678929;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kaHVxl7vuByWpkORZ5+/TJjUTPhuNzyYYiswskPNg9A=;
 b=HGICLch5/NQ0ROKXrGHD++Qdmu3AAB0dO9Fyv6S90yU7N/6cxGO0PP0LyhDKHxbd7f
 coLQ5+C09iNgcR8CPa0Q0ka/2z/9X9eF0oP2su26R4qlJaQTuJQN/kz/0FmRmXaouyhV
 yUsHRBoiI4V4ELWI5rjMeTeBq5S3fIaa0a5s7o4ahWIa74lzCluRx1X+0Z/xfCClTMWo
 JvuuRWhilct/QN+SsrApgek0xKydhDCbADxu4vuKcQQ4NFr6F/TQ8xuXBGjcOHxkDXbO
 lAIaskk3CkXtXewpe28SzGpRe2Cz1eCGweYPLEG1h0nduqoaJNynpnhMwrAZbPv/JtKT
 ad9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKLcjvqYqRNJXDA9s9VqGlIpZLRnw8vJvfmwPtHJXi3wanQ0NA9wyJ2LCyiWcbta6miCKSoQW33A==@nongnu.org
X-Gm-Message-State: AOJu0YxeReMonXPuelSomG3J0++8ReAwY4DC+UK+ExcptyyIeLL7nNVz
 2uQDnHu24Ogusv7kqTAIa/m6vl6g8UB79hdmlkCOXUwsnLCQmcA/UCyJo8erjkyL+noIi8VrgNj
 LgQhaibLNj+ZGc1VsCxgrjm/z/QMDatcg2zrbBg==
X-Gm-Gg: ASbGncu9FummtA4Ed8YXh5Vvkvltak4QxIcY9KscjI3Ct+f6gLEuGBKZgmC5MyYDmfT
 i3YF/JGEAQMdxOTicdZh5rsH1mRQmwKQpndzFrVgJhIcROPxwCnEVCzmCNehSUtC3cVbd9x26sw
 ==
X-Received: by 2002:a05:6902:280a:b0:e57:fed9:4c75 with SMTP id
 3f1490d57ef6-e57fed94e07mr20864599276.31.1738074129234; Tue, 28 Jan 2025
 06:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20250120203748.4687-1-shentey@gmail.com>
 <20250120203748.4687-5-shentey@gmail.com>
In-Reply-To: <20250120203748.4687-5-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2025 14:21:57 +0000
X-Gm-Features: AWEUYZmi9lXA-sG-VLB_GFQV822NzwUmoAzAShj_Yg_oxOpUN_S3sWM0brgr1ss
Message-ID: <CAFEAcA_8wekDxQr8i-Yn1rkY_35awVyGSxXGs3UEuE4G9_NyXw@mail.gmail.com>
Subject: Re: [PATCH 04/21] hw/usb/hcd-dwc3: Align global registers size with
 Linux
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: xwXx2X1ktZ+N

On Mon, 20 Jan 2025 at 20:38, Bernhard Beschow <shentey@gmail.com> wrote:
>
> While at it add missing GUSB2RHBCTL register as found in i.MX 8M Plus reference
> manual.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
