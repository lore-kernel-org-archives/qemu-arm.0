Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9F8FF5136
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:22:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABon-0004sE-LP; Tue, 07 Apr 2026 15:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABog-0004lc-0J
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:10:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABoe-0002nl-L5
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:10:25 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-483487335c2so55996515e9.2
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775589023; x=1776193823; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QLMPykG6lfcrNa00ISi1soNyoXLxQUOTl5+omE2304A=;
 b=W7jo7chFTHqDjFQWbJjY/TctKnk5aLFMV5I2VcBMQ1RzFXFgS9k6cOnicxJzmfIK9X
 7LnW0QI/RWL0I2aqsQYdXnNbGuzRx7B38eN0gx7NkuxBXY6OqEO6AC2KyVGMrnw5mji9
 rbs70rKuvG25nUa6Xeg5SJGtp8CMwc2zq2p0E4urmMIr/Fc+PMNxpefRpWi6118rpJ95
 hmwQvxSflw89b3L2izuosITtpQeq603gWyi2gI/Zv9CYv89ism7hp93vKpdfKrJvqn2H
 wCdhcIGx94oOvX9E8SLV4azhaaM/pRhiqhBHHts+TLHZDrYXlbGzfOv6i4gtYxHHse5b
 FdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775589023; x=1776193823;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLMPykG6lfcrNa00ISi1soNyoXLxQUOTl5+omE2304A=;
 b=spTBcnIaeLSP6GsmSiI+OD62YVO4l/Di3QFzcPyJDeJQ3SRvN/r85BzRmpb4cZscoQ
 UhUh9FecCD0rGxXwEWUoAo7GluapbFmrVWKXA7zU/WZ0fHcPsQ19mV7qPCCnvXUsE8NZ
 lrqw+YfX0/W0zJEUIIOYcUt5DQCd5NQrZ7KaauH0O77MXIkPoi4i9cg/IaUnQoZ5ZNiA
 Rc/7TLxfmNI7D0dPP+5ENSdOQyfnqXSQEolniRjNw4T9xnk2GJ5GOEKUHn8K0YVln9qA
 3URc4Ep6LxuIUBolpr3/C1l+OwrBraijIRPorRNnnj35fkt+fErmHooP44av6hy9d1G4
 izTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7YTBkynvIC631WFtcPzN8HrZhK9Urx9Swls7z0wxIILTPmZ7qtxboHmf3tENyE00Uw2l7OUUBvA==@nongnu.org
X-Gm-Message-State: AOJu0YxQUmvWs4JidutuHLOAXSeG+TAPNBMOiDr8qkW1Uy2Y59D5YYr7
 rz34CUomJWtf8FwLXq6MRfz0PCU+jerWkMIaqTFGyIETTFsMVqGcbMcwdw7VQ3Qqhk8=
X-Gm-Gg: AeBDietuYt+2nnjqF1RS8BwE+YhsrdvYapZH7xJOMfP+l5lknzjR/aPGndKA+QwkZep
 SL08lyxruSvIGjYxQ3Icsuac8lqp5zQgHAetlxPVd9lfzqagTPGGOIzV6fMcnDX5J457N7sTA+I
 Dw+/WuKZzxRTESEv5++jBD/otMNVmT4gZghjpgyM9/tpSQz3xq3a2jTAr/e+TTKuHuw06EKT/zt
 1SfbgJyuMAACzXJpNIMcV+8+u6c2Uey4pRyN71etTCI8FPWGrQdjAr8H7OrBPjoUBUxd2BxxbTH
 kpOUt5Gs/uj2Rr+FYv/rDZ1ikY26y69vzx/vzlDPYEx8MYd830B3Xb0IkA2ieKHrj4zgdrQAHZR
 09B3qTSIwfO0Q6XfXIKOaiSHIhyNcgaBdOyjVAXiCtjstsqjOjaIhARzXcKkt1U6IBrYVhFATc9
 GGyJq5cMzT+tUo+FWtbdfPiLXiDYDRdaAN/NJCQow5xnm+aubhYQ0CE0oLOOnoVBWyxg==
X-Received: by 2002:a05:600c:1f96:b0:483:8062:b2f with SMTP id
 5b1f17b1804b1-488996e142bmr256112735e9.6.1775589022842; 
 Tue, 07 Apr 2026 12:10:22 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488a4b2e111sm309589695e9.1.2026.04.07.12.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 12:10:21 -0700 (PDT)
Message-ID: <546a4f8a-dae1-4f4a-a77f-6414fffb56ef@linaro.org>
Date: Tue, 7 Apr 2026 21:10:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/20] target/arm/tcg/translate-mve.c: make compilation
 unit common
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-8-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407022748.57629-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 7/4/26 04:27, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/meson.build | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

