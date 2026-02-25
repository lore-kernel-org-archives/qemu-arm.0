Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEBBF55452
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 04:41:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vv6hp-0005lB-8r; Tue, 24 Feb 2026 23:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vv6ho-0005kl-M0
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 23:41:00 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vv6hm-0007mY-7e
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 23:41:00 -0500
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-45f053b7b90so4454473b6e.0
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 20:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771994456; x=1772599256; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/grfVgWGKdD82Z+UmJYVxikCThVfQdCR5f/kQEWb0h8=;
 b=dxG+0KQ69OIOBxSKW6ZJMJE8SJolAufUnTW1usZfyF50aT4wWumIjgKWHX3hRq9SZi
 Uf9DFpHq27SJZBRIsjXEi3b+4MRPca9NyAuTwmayCi2kx1MPL7TFmpPXoztGRDtBiMJr
 nflIFaczVvkfxDLPeFHBz2wt+vYGIX1ERCxBLB+dCH7L8Qg43Ypts9FSs9UG3dU/GQXd
 wZOzHySaMdZqzEHGQj0RR94FRNqLeEkBySshJT3aHULHH/LYi2KBnmCI3DR+aPu2xS0O
 27GDVtuTXk0uRIhUmz/Gcawn4VURRcP7nMWYQMIFEdEKbj4PV/FJB3n0ynfODPWIlj1T
 VSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771994456; x=1772599256;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/grfVgWGKdD82Z+UmJYVxikCThVfQdCR5f/kQEWb0h8=;
 b=ZY+s+M4Z8UH1STMpIPyqpeB1+VN3LrwGCa6gEthR20D8H/pec4Ai4kUZPBqoUxHM0F
 f/Rx5JKwiPzu6CLo2otD20AjzcUfViuVSlhAFJ7DutMsZsvFXVRdTtwlwkAOrfnbMlVx
 XZXJTyiN4WGPUK3tThCe/+aONRMDoidGi7jsntW5o5avdSl1KH4L//IPCXJuW8E652xB
 Vqn2vKmjnWU0F/nyjoUIML6uOFSJm1XLzDDjFLijFQEzq4GenmggHSyDHKTRAlOcQQQQ
 CUzVaiFU5IQXctt+U0XGPE6DuBhN+dES8jJaMi3NIPQQt0GG0SlpSJwYupMYneqh3F/3
 9/IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW47Prv7JLJ5RXuJjlSxNCfRtJRnzPzr3SiHBtrszoT2xrmc7r4hx3jcCEOH2jxwhjSkGSPNgv44g==@nongnu.org
X-Gm-Message-State: AOJu0Yz6VBu8iDhO2IlT5LlAS0+5SFi7j+J25QF54x4Z2mZGMkkbgePd
 xVPIIkmjr/nbaBL/UnKtCoG3a1PTashtt/JkKQzkNkvGoKWTSDLycWYIxKSjNAIv4c4=
X-Gm-Gg: ATEYQzxkMXxPU8G+28EvcE6TuBrpouP4ekvZMA2jOa6JFuhBONusqWTcVrq7ZXyT3FY
 gzV5uP9uHEAqPrBCiTByV5G4lXrIiNpe58kybhmXu0U2NLxOf3Rm2qYl9DkXXQra6Cd/hpoebee
 pxoQivCZGBfam5+NmkuuQTrE/fVS3uj0+ytCLUlbIDoFC+wPY0484HIFpvIYBuqfpuuA8U+iOON
 2Zvr9mv29O5HGI6O1/XkjqxiO0R3qltkOvBs4giGH4yW/jm+HRi9yrWpbYYL4GUDdF2oAcUHTLw
 x8OZd59HrDiVknx93KiSJ4oD6Zf9ibRW666EJihAHNnMGism3iIr73R3MvdRrW5Fo8oJJDRS0Fi
 DjKTUXss4XWTo4Z/VnKvWwj9lyBeDlRFBMVIIcFJ4xc8t1iex3dXUByrR21AC1lxh3EaF/eTb3g
 lOeh1LEEE/ac9IKyYDmYtPmzw55jquH/qrGAKw3zpqcnUpYbSFvqFI09lNiSI8oEs=
X-Received: by 2002:a05:6808:c1b2:b0:45a:769b:2157 with SMTP id
 5614622812f47-464461c691fmr8827560b6e.26.1771994456661; 
 Tue, 24 Feb 2026 20:40:56 -0800 (PST)
Received: from [10.34.149.227] ([172.59.192.107])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4644a010a61sm8484089b6e.5.2026.02.24.20.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 20:40:56 -0800 (PST)
Message-ID: <8480050d-d114-44fe-89ce-222a25b4b1fe@linaro.org>
Date: Wed, 25 Feb 2026 15:40:46 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hw/iommu: Avoid including CONFIG_DEVICES in hw/ header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org
References: <20260225031658.32095-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260225031658.32095-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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

On 2/25/26 14:16, Philippe Mathieu-Daudé wrote:
> By inlinining the stubs we can avoid the use of target-specific
> CONFIG_DEVICES include in a hw/ header, allowing to build the
> source files including it as common objects.
> 
> Philippe Mathieu-Daudé (3):
>    hw/arm/smmuv3: Avoid including CONFIG_DEVICES in hw/ header
>    hw/i386/intel_iommu: Avoid including CONFIG_DEVICES in hw/ header
>    hw/s390x/s390-pci-vfio: Avoid including CONFIG_DEVICES in hw/ header

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

