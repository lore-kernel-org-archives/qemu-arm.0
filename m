Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FB2F8E48C
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 23:18:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDVyM-00025a-8Z; Thu, 16 Apr 2026 19:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wDVyK-000257-6o
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 19:18:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wDVyI-0006Rv-N7
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 19:18:07 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-82f41fce3e6so52129b3a.1
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 16:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776381485; x=1776986285; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xOvuWlfr91UKP8ZA+tGsKjHiDHp15zJ4UWQTZcws5Do=;
 b=Nj5slFOFgcr1xfD7f1+IkyJLXxoQmrT3myvwl306sSQ4L3EtIqNG3biI68MmpaJUoU
 mVraytzfUyTOC37tk+yLUf0CKSnIyrx5vH2h+IHasC09N0IkHF0O2Uda56gosMYvTsTy
 Lz9pKBbVDeutp7UdNVZKovDs1tTqi56SJ0N1fIhkhOBrwmcR87fKywh6j+vgAjmqfR7z
 9oag6WtRX4FWrMtY4D9gxoHlB9gEDXP+FeyergGrj5TB5xYgxh+ClxV45WZP0PRVnwcT
 Q9X/7gQ5Vpj+JDjrt2mgnCGWqd5BfnV8hZ+AK2/qEzTMlqVoWT6Rz3jx6vSMKbHbpkku
 D5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776381485; x=1776986285;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xOvuWlfr91UKP8ZA+tGsKjHiDHp15zJ4UWQTZcws5Do=;
 b=DowwkbuQ+8m8cvu5/nzpPkgNz5IC+5VPdZV0o+eLQCNcBRRrAnxrur18TFwgK5Ghhy
 ISMdDWDk7ADYP2pI39/cTXj0i0I3UarwNB4btACkqtSnvEP5SV494dCNSycHYaIUIyZw
 Wg5B6n3BZNbh/WAakEtVdCUZlVwNnTn1KMABE+FMZmGeOeaDcGl8rLMqmsNRuQa0HFwE
 42ncpWp/UBBTXu9GOh/YOrghk1KhstWfHcj0lnUYKNYSNNRfM0uXqgJSrf3oeKfh5Nju
 sYJhFgO+MtECTPW7IzytEaJ7cFZZGy1qtz6JYc+Cwx0fqwM4ZAvT0nt4QfRpmCt7Kmee
 5bgA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+8JhrM4sXV9kjqb+zz50vz9ZMJ1cPkvdPTR38I6bNv/Hec+uzBL718S7WV/KIykgBL+hzYRZo4AQ==@nongnu.org
X-Gm-Message-State: AOJu0YxYUnOx0XHTfuIMTroZqw5X2KTgrJg3Riuf7/D3rwNEzIzVT/D0
 0SUU4vwlx/AYMpo8UJMDfnpiXD6wx594TgkPXn9KgtxySRUvojMvyF2ySOfYF6DcVok=
X-Gm-Gg: AeBDietMfMXshb8oKY1XXFCHviiZbm/CbKJ+iHpkTELy3gitjfdwJWRMDXX0t1fQvjQ
 8ChwviSE8fJ80DKhLeLoBpYBrv4d9h03/fPYYPGQ4rz55bL4oG6hw3kswl2+skYNcnUhz0avS2W
 P8qOg9Ln5O2zMj6tl3BFjA/tncPbDskEOw1Jnw0XSjGIr/MP/go2z8nvwEEW9jAr8U7Xy0TI5ys
 NHD7tOja+zARsRqaXxlPiKNTNPRUi6O7nBKmg1ok4MuOlMjU6MF+SglYKG1RVURixVnTcLbE3SS
 RptItlkMcsUVjyIkNae8nuuh5s+4WtC4OCzOhc31Cb+O1qIPyOoidAVVFh0HUVNuyZviDG+5DyP
 7VFGMgR8Eaoywez//vXRjQUQg2NP4LXIVA6RYrXLHg3K3+3VkPMWjd9EL7OxmhLVsr98lyRjxOv
 DcbooCmHGj83NpQHRQOQhAxRdHRsJ8e+Bdz3+QXjOwcUMn+y2WYkOsTwaYGOdfLe8TGTfi1+Hog
 yf0ViA8RoTR8fgVR2NBzHN20pzTFeYJvbjffjHllMmq9DZMK63gJgSL+oFaSM6VyA==
X-Received: by 2002:a05:6a00:3cd1:b0:82f:6b3a:8281 with SMTP id
 d2e1a72fcca58-82f8c84dfa1mr260467b3a.7.1776381484695; 
 Thu, 16 Apr 2026 16:18:04 -0700 (PDT)
Received: from ?IPV6:2401:d002:dc0f:2100:a60a:7c34:dd75:e66c?
 (bg30dj02y68bx09myf73.ip6.superloop.au.
 [2401:d002:dc0f:2100:a60a:7c34:dd75:e66c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8cbbe9fbsm101783b3a.54.2026.04.16.16.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 16:18:03 -0700 (PDT)
Message-ID: <477648db-9ef6-4128-a9f9-f021e9c0a18e@linaro.org>
Date: Fri, 17 Apr 2026 09:17:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tests/functional/aarch64: Add basic test of TCG
 aarch64=off
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
References: <20260416165353.589569-1-peter.maydell@linaro.org>
 <20260416165353.589569-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260416165353.589569-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 4/17/26 02:53, Peter Maydell wrote:
> Add a basic test of the TCG 'aarch64=off' functionality; this is the
> same as our existing arm/test_virt test, but it runs the AArch32
> guest kernel on qemu-system-aarch64 with -cpu max,aarch64=off.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   tests/functional/aarch64/meson.build          |  1 +
>   .../aarch64/test_virt_aarch64_off.py          | 37 +++++++++++++++++++
>   2 files changed, 38 insertions(+)
>   create mode 100755 tests/functional/aarch64/test_virt_aarch64_off.py

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

