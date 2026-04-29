Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89447FF8875
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:48:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI9wp-0002aa-Cp; Wed, 29 Apr 2026 14:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9wn-0002ZU-9V
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:47:45 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9wj-0002rf-GI
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:47:43 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so701815e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777488460; x=1778093260; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=22BwYy5fyUrUnbMMOyoWBwhH76+BD7nKY9w56wCGtX4=;
 b=eRcOvWZRDUkegyAw5dREMAbkAyx10EaPAzTO+I9cxs8jcri0tSPooNsc9KZIEuB+gs
 XjgeGETMhw9GzzB0cWZ1ELtXM42G7zr802S3xcZb1SgiTJZPkUEyAuuDqpEH/XoQ1Xss
 ILK113kSntLhe1E3R8UHU9mL3z5lXFDzkMNxG7uVpCYAHpHDRKX3Rf86xu+FWbyorZCg
 NzXE3fJfzkoBtByBMcWqI7ZJlBf0RERX9U02pt4m/LGIhzP5tD/Ff78ocKXFjRhHXy3q
 GIflqdzZliBG/xAIFBWH+GKV9dyHk8WVuDQHlDLaw4TM9iyTyb5MpzIOxBFy7NKa2Vcq
 cLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488460; x=1778093260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=22BwYy5fyUrUnbMMOyoWBwhH76+BD7nKY9w56wCGtX4=;
 b=JZ9CUOtVfeltSdSD8j5YTb+EFRtUc9yvpT+aiq+L6PMAt+sFADmPLvQB0tXrNOrAP4
 SFkPaYD5Mte+xf5HafRshcCKcKOVAErCXcjoeNbUz+CWXLHLjJSCv4qFCI1tbptsbMec
 E7GH4/94e0sKl22Q7H40ol8CAWsLa5QypKYsKGA59S55NBTIw48SfsOSuSpDsUefgNX4
 A1hsHtlalPgv7FcwLukJqPrREeJ+hejka2iAYboTzEX++Eo1Axn4dHH9wIui2FBx1m7W
 NZhyakiJo0UR+D7OQ3aEs/lIrJprfegB/FnL1PCqb76ZINaFyPvK5S2fbjSGc8p6Gwoo
 WOjQ==
X-Gm-Message-State: AOJu0Yxccx3cr/lPsCsi6ajjLmgi8BLocYPqAYOdnL483rrktFQEPfnV
 djqolLG1v5+hdP7hPKNCWlyfav51YFASrM0eEMrvjddjzUkxjk0ujNS2QLBZenQ7jWAOBPLgRBN
 6yartGBA=
X-Gm-Gg: AeBDiettSlCCe57jrL1sI0aZ0v/0iTq+QmFpdaUo3oNqfhVwMmEfs9CLoEtRrNUAllg
 QEZjPp2BoztATFwvEsdg+ph1Fh9hGFcFRBNulOcKyjy7hlgO8oN7JgbBYqPfwy1+seNBprUhxtO
 lxpx9F/YY0I0d7re6o1kMi4P/8xmd/MquCX0qYdeCXVCumQc+kFmvYVS1mm4eN3SJ4xkf+prYwk
 64fPZCsU7IxH77VIiwMeBPE1ejY+8AaLWVh1t1HevwAS8VEp3ebUszflWQ+Hlv3GvYpXWeoKv+E
 Lau5sMU+AMwJ1McJOhxZyIa3DBcsAHnn/IFzNLEzrpVc8/nNg47ooDusLuOggf7Whe0oJNrmmEP
 ON4vMm08qmIF5sd5n7mBxeCyqUsDLPMheKbQNzVzSHlD1augf+4YOUAf8hXIdWTGcxntZYAZZpE
 88E34joL8stN6gzVdwV4l2ssJwI3CfsJoza9AwBN20KC5y6EwCbx2fHiuPvthBiT8cSEx5UIq6z
 iCV86ZcE12O094=
X-Received: by 2002:a05:600c:34c4:b0:489:32b:ac0b with SMTP id
 5b1f17b1804b1-48a7bf99294mr59099855e9.6.1777488459697; 
 Wed, 29 Apr 2026 11:47:39 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81b9493bsm8889355e9.0.2026.04.29.11.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:47:39 -0700 (PDT)
Message-ID: <59b2c362-7788-4e52-9582-e2905fb9c492@linaro.org>
Date: Wed, 29 Apr 2026 20:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/84] fpu: Return struct from bfloat16_unpack_canonical
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-41-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-41-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 108 +++++++++++++++++-------------------------------
>   1 file changed, 37 insertions(+), 71 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

