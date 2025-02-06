Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1692414njb;
        Thu, 6 Feb 2025 09:26:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUV3WzvAC7/Q85KrpVo3xZhqAPfTJihn2j7pnsaQ0WdQj1bjjPIsC1wGCAU5EDqj6I9ujzUF7B/r+oSjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHkiDAJCQiw9qy4DgUJGQC/W7hgKEQO859pZGqxtll37XYnh09gypxiO6LOa9arDJtR4y3r
X-Received: by 2002:a05:6214:20e2:b0:6d4:1613:be3e with SMTP id 6a1803df08f44-6e439b9a213mr52986266d6.22.1738862797315;
        Thu, 06 Feb 2025 09:26:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738862797; cv=none;
        d=google.com; s=arc-20240605;
        b=EzeobB2DYey8LBUYO+pLfZ6MtnAnuImyzT0Ig6zViBhFeL+9Hvs+FwxTmMVZ2PGsES
         a1yCP240B4YcrsuEcTVp9wx4xK1V9gTIp784fvB/8xlW+6dcZLkRG8r2+mUmJoCaGNCu
         ZOO+JSF0OxUxp/S/gLbV82EwlGjjn/clNixNkyseGr9IjDuWKXStGEnWCX7CScDV29cW
         z032InAxw+WG/U9Lx+FuqrG9OkvyygytNoSH4q0QDXxGz/0qCJuJLVjVTaBu5Tgbasz7
         Ktj5r+P/jGFSdS4Wtqyk5RbXSnkcp5oydfLgaGxYSLrW2RjDBwF2Kms/o+u2+NoetEUZ
         +x1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=B8HFdeEuQRCJWf6pwtsuzHBb7GMosUbfkQ6wqkwk/Pk=;
        fh=GsMrk/Na9PPOrrHetWIKAgHtRxU5TI0pkh/9Umy0+8Y=;
        b=elLXuqkyQbOtkuiZ63eNqenbVM1J37CvjO6BNZ9H4vNdPTbuV/sBD4FcCKxPmOBwRO
         XMVMtz3HR9tqcWt0CqsgL+6C8crippkEsxknrOMRw/Q8DuqhcYKOckFQFGn+VXdinO3h
         uUlfMPWf1Pra1ChvGVrRDkDo2E59te5GlH3pZuan+hpdcMn2vc0rkjkReQRpxHAXtQj9
         Rn1eVXFtG4U0NHhx4uS5BL3bC2h53bUKDUkYKAK+47/BFe7P2W3VvUG9e7GUIqGJTgLW
         L4ObVkcbkX8dwVB2cU8vTKqmqwCqibthghTyytMXjDAFn4y838Qv4xV80rcbVRqj2RFG
         JFrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZL3oVmeQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e444eaa930si25566d6.26.2025.02.06.09.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 09:26:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZL3oVmeQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg5e1-0003pP-La; Thu, 06 Feb 2025 12:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5dw-0003eu-Jr
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:26:25 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5dt-0000Nd-BD
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:26:24 -0500
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e5ad75ca787so1035194276.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 09:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738862779; x=1739467579; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B8HFdeEuQRCJWf6pwtsuzHBb7GMosUbfkQ6wqkwk/Pk=;
 b=ZL3oVmeQNzWdDhT84VNVOu68CFuQlD9XjlJ6Wxm5G6p65VzS1QKy4TOnse3BR0kxFQ
 ni1xv/TNtUG5AihGQ3VRWvgIaYYEBEb7JLhbqaLUYPZ4+fryHfXUhyVClJpiJdUJO3q8
 VN1LRRvWb8g+LtdcLn63lvcXm/tmTuiDtUq+MNGd2LruYmOiO8weJ3P0k/QfRgnvDuLP
 xIbT2KU0NR5KXbOFUZ4vwXpXUkHiMOKuw/vlt9RJmwnZlemHOIWT3sPFO7F0SFZmN0L7
 B0WjevZMsI4/TKOlYGzlKBy6GeULrAes36PInRt9j6WX+GYn192WCn2yP6XNT4KJVVrU
 Z+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738862779; x=1739467579;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B8HFdeEuQRCJWf6pwtsuzHBb7GMosUbfkQ6wqkwk/Pk=;
 b=c8kk/RWRIbp25xP8Ol9EC9Kgj8GSKP3CXUz93NHVqO1Q9M/2flYjoi8dqtsNOw1XYq
 cG8Ieyhajv30JFBoi7hZaP7Ljz8pIeG1wnOIG06yxxUjXy3K0Vnn2NisBO73gqv6mTHy
 5HPiPEhNVYtQOxdpN22MMX12Lst52Q/i12GERRXMzH96zfc8h26bWJ/fDJeGTzoyJHEy
 tNz4nq/Fw5fZgvcXNmmmkpgoVetlnQE9u7MspHpoyaqWrIlVyJZCAtOHnviOvRgyaerr
 IBR777XBWSp9UZiYv+aH5XOKt5tUAh7Oqg0+SiBBTMxqMCmhNZe50WTMD+uI+3izIEbW
 WMCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyYaWTEtq/xU0Pv2LGjKVDJcyVvbPcFv2tQWVUn74yiFcnRvBbpX9e9VM4fcAQ2Q5EtDfAafhMWw==@nongnu.org
X-Gm-Message-State: AOJu0YxB8JykjRSKeZ8PAiwSzAthRhkeP5Syg4TB/V5RCydi6eza+U4F
 rLcw4vPLlTZaLM2G2g8LnSGONoVkPomIiiCRLSUEAvbNYa39N9i5kCTcjHxPVvfq9/KgAioke4D
 FvU0viZNZPqSeXi6KqSdRrDxbLf2v8dorlnIzEA==
X-Gm-Gg: ASbGncvlUz/1l4AIXmfayzt4okSJyKljde1TR8u1VrnwQutEAoWXqSmtEzT1FGCQsrS
 9Dm3IJbseX9ZL+ZQIgVVu0dWY3lFgncvwvbTF3NHr7Ehvc6ONJGKjfbDk18A98AwAlnGKD2dwow
 ==
X-Received: by 2002:a05:6902:1791:b0:e57:87db:22b5 with SMTP id
 3f1490d57ef6-e5b353554f2mr3891389276.6.1738862779240; Thu, 06 Feb 2025
 09:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-10-shentey@gmail.com>
In-Reply-To: <20250204092112.26957-10-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 17:26:07 +0000
X-Gm-Features: AWEUYZnGRDFhmJWMjCmrxXqYZEB9VNvT0zSCG-xtw070TUF9N1zDw-Suszm_dL8
Message-ID: <CAFEAcA9KihqeayB4VsS_ogEKhEk_PD2OdV13i6LP=hXUnsw_Lg@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] hw/arm/fsl-imx8mp: Add GPIO controllers
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DcLOh6wpmgLU

On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
