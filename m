Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B91CCD1A7
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 20:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAwGn-0001E5-8W; Mon, 20 Oct 2025 16:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAwGl-00019Y-3L
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 16:14:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAwGg-0002jH-Rr
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 16:14:14 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso35242075e9.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 13:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760991249; x=1761596049; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HTlBXxT501vvUXl0VG6ZOeVeFMSbAeDpWnXLAE816iw=;
 b=Qy6xq0+HcuyKZu8n+VJ5QgEDseWuDlNNGoy+osqm5f88W55tWuJzaM06Bd6m4owGuq
 pzD83w3ctkblzFRTc8NHsDxq0M8shiUNL7nfjMfL4nH5I6Sns9HHr5fEmUWYonqcfTUm
 mZDbeZOBKPFZHr44vntleMJWRAI6oWWczADazjg8bNmMTFUEL0Jjt8I337+cAuXmgwcU
 tLzpICPlSboLP9lGef5Oa/m5G2GOwzFu7R0D9mBiPMMzDx2YvLfejWgu8ZautdmaVuJI
 sLrevQcW72JxWv81nnUl1WjfrH4esA5Kza0Ma7pCaVcwM517ePB1/1iX1O/padAOdgYq
 gcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760991249; x=1761596049;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HTlBXxT501vvUXl0VG6ZOeVeFMSbAeDpWnXLAE816iw=;
 b=u2IlSgWoOA85iyBCm6QGMAtLimuaXCkF4XeltbgX5Sj6wy0YbZVfuVa7z/LkeSX9p1
 UUGo5h5aNBCBrHOqEyhUQNUELoXUfX8NIPeIQTPbkhDgyjFzE000m+SQHfzKhlB6yv5k
 y87gDbhPpAM4pyd5I+uQh1UamL+1P+pkBYbwvGQlxHT5cQ6nLwtKFcfsEh2btjeCzlVW
 VKhzwwG8Qd1OUZ8Z/o0vmWdRvWD1sZolfi+wWm6L2wUoJ1XNgk48AAYoh+60eXV9zA9T
 yhJWte8KaPeCKkjKJ3D6lNumxdIwQt15FU7cBTUzJ2efGQ9tMfadOUPCuy2AYIrZmxsw
 IrSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5ZMxDXc3JqOGYWWY54B8rVyv3B1lulUqksNJuP8DR7UBaPIdUP2ZaKqrUMNjO7qk7Pq7ouSyssw==@nongnu.org
X-Gm-Message-State: AOJu0YwLtjdBDM7Ep5wETRlUGFbmR37J0d7rZgfCPtZLTrGSTsfNEmyH
 sp3RLxgIfxthcCJ8BgjCQKsUQjxl8dV8D/MHlVxht7TnHTNJxzgdbXHNAkJlLKuDtW8=
X-Gm-Gg: ASbGncvwWAIw4OvCgx8TtoGLYLIjPWG1lAmQRsLg+Oq5fK5NUdMNncSGXfPWzlDLcQa
 TMFGr+FAcR3+yrp7G8myxfgc+XothpIp5gDBq/wqKByEX2prtSVP/Iop7KGbCBryD2yOazg3l2T
 t/jJqwBRTEcAwe2H6QdXlP3Hz9GULUyjN/GWiJ8G5Z9il1bTdF64v4sHGi84TK2vDUEysqTD58w
 1v5CpaQDQbqeRuR9iIgKQf897+x/ukC7soHL3KSITwbhTlJggqaXqTRKJHZCnfq6LIIsJ9dOcUQ
 BGkTjdWkV7JRBOyHe64eSqsqwMBL+U9ThFj1/q+Uf6i6xH1RSjmIuUHfsO2wNcrGni+L05DMiSJ
 n5aKFPuu8RgFbKGqx081ln4srRBL7LtrA5X59Wpeoz9Xt4xsEqHsi0iiSOFE+a2sxq9feQtP4Qn
 GV4kBiO3PgYOnefXbwCZYEkd19Z5RrnnIdThTxmVoUfAmsKk6VSPTXyA==
X-Google-Smtp-Source: AGHT+IH1pBCu+tgFq81xuLDN55p4o5PQ3bBlSmKkx/x46aNevlNeNzrUGclWri4jW6CK1uXJnP/9Wg==
X-Received: by 2002:a05:6000:2301:b0:428:3e62:3225 with SMTP id
 ffacd0b85a97d-4283e6236f6mr6420531f8f.60.1760991248866; 
 Mon, 20 Oct 2025 13:14:08 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3acfsm16687432f8f.14.2025.10.20.13.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 13:14:08 -0700 (PDT)
Message-ID: <2cffde5d-e76c-4600-8f79-968581ab050e@linaro.org>
Date: Mon, 20 Oct 2025 22:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tests/tcg/aarch64: Add test case for SME2 gdbstub
 registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
References: <20251017153027.969016-1-peter.maydell@linaro.org>
 <20251017153027.969016-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251017153027.969016-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 17/10/25 17:30, Peter Maydell wrote:
> Test the SME2 register exposure over gdbstub, in the same way
> we already do for SME.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/tcg/aarch64/Makefile.target      |  9 ++++++-
>   tests/tcg/aarch64/gdbstub/test-sme2.py | 36 ++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/aarch64/gdbstub/test-sme2.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


