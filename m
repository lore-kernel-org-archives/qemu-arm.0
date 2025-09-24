Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7628DCAC5A5
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Sep 2025 04:09:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1GoL-0006xT-JW; Wed, 24 Sep 2025 00:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1GoI-0006x2-Ms
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 00:08:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1Go8-000262-Qk
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 00:08:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so4472145e9.1
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 21:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758686919; x=1759291719; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1oxpu4dJ4U3KjmS0LmC7aXY8jwwf+1hefUCOSY1JS9Y=;
 b=VrKM9kvCl4+OGY/Nmcq/qJ7VyO0Ypq3g5esbdS8tfZGbS5GOTYH5tebFLyg7lweok9
 Im+i1a2X/ThH2qYQpx4KUDUV3L5Argl7YNmqWwacF0fjBxJWGnn8h9+cwkFD3z/M7XW+
 xs+HQse9WBGDUzh5w+3V/zfhHGodCX7W09dBmNlKzhZcXyHZGqQuMLdyqvBMc0frKb/S
 UFpNeXxfdrJEXqHAvEmBLIaWQ+oPcmCHhkNa9kpYg2wZz3gCAv8P21/ZsfG3ghvegrqk
 uYLMVsO0BhLqcU/xheDJMKh3Q/1W/ZgO/d6dtqckgGaozR7lOAG9+dC+Ddw1KIT1HtZF
 EJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758686919; x=1759291719;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1oxpu4dJ4U3KjmS0LmC7aXY8jwwf+1hefUCOSY1JS9Y=;
 b=BTgHkvD08zwel4VFDDuZiwAvG4AQxJ+N1hahZdp38IJlm6VdT90UdFx7vNHbmRGzP+
 7pgDobaVL9DHJ5KlXzI3zZ5FhTPCstva7XeZ3Wdn7Dk9cYmwUUa6ZnmODy+chIfM0NdU
 M2GjlfyCsjfgr/b75w507OC169UoBcO2L8JXk2uEET7G6xKQGHiIchN5gNJpzUqDI1O2
 sezh77J/F5qD486nglmZGoKL43X0G9oDKzbWV0E2vZQy4bKWfEfKjKSswTtljg9dYXOJ
 rHqQbjwPeBHLEWbAg+tMmXU6oRUcTojqQ+j0ygD2UK2zr7i0S8OzVfNppz6b8VlWLMNN
 zElQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHNfwPcoCF/F/0K1Vncc7A7ia8iye5GdaX29bxxxibFjV9GszVEdUfLF0FofyuGTzEDkCcjUwMLw==@nongnu.org
X-Gm-Message-State: AOJu0YxYU57whDHzOHXZ/ex5quaR1FntZc1pyhnSinV06lyZ8UX00I71
 cU6TijpLkfr+bzGFduT76g+IKfYFrL4hdyX+/Yj1v5Z1WhqH3Pt60jeZR+pJBZ2Ryu8xDUgIv31
 v80t4dbZgvQ==
X-Gm-Gg: ASbGnctBpdxp9Bk1K6WC1/PqzX3Gu0he0iQQ+JOIR/uppfXGkkXnJU3ydCQD7jfQ88p
 K3lNqVTvskreN7p+RyH5b2OUWcIVjJ9PAtRSYSOAKYm+TFTskRIS9gVHm7JF2WOSDiBdocldnZw
 7HaQRG8tVoI61DpnIByOMVJL0vZvbbMIzTyzsVyfDQ2yvGmroiTBtjOh9hwDjg39H0bcsOHko0f
 eEb9SmE3d+dYdjcwjnpCoMRJEhQReTkQB89kGrWHFRVG4dRv8tqh7ph364YDX6MJe3SWnPKYPC6
 fy/XrUJuN2ccWZdetapKHqWgaRycZSY2QPJDCG5HYB3VhstduP+IP5/a3KpvHnHGvBZpoC+NP5l
 7e0KgPu6gJN1gSmMoipFWKM8MM48Pl2//m7NKuD/iCWqM7rSjDwJ7cqFVH3D2+H99cA==
X-Google-Smtp-Source: AGHT+IHqdD3V1g/FLBSXkcQBnnMW+DX0W6ReUZ5u7IKkqu5FaH32MeFjWf4vn7xKXMyxUPJ5+/wb6A==
X-Received: by 2002:a05:600c:c490:b0:468:7a59:ee81 with SMTP id
 5b1f17b1804b1-46e1d97a48emr45219335e9.3.1758686919196; 
 Tue, 23 Sep 2025 21:08:39 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3fe9dbf13f3sm10257068f8f.50.2025.09.23.21.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 21:08:37 -0700 (PDT)
Message-ID: <4d74eba8-dbdb-4560-8c4f-90e9074c1069@linaro.org>
Date: Wed, 24 Sep 2025 06:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] target/arm: Implement ID_AA64PFR2_EL1
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250923175751.966795-1-peter.maydell@linaro.org>
 <20250923175751.966795-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250923175751.966795-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 23/9/25 19:57, Peter Maydell wrote:
> Currently we define the ID_AA64PFR2_EL1 encoding as reserved (with
> the required RAZ behaviour for unassigned system registers in the ID
> register encoding space).  Newer architecture versions start to
> define fields in this ID register, so define the appropriate
> constants and implement it as an ID register backed by a field in
> cpu->isar.  Since none of our CPUs set that isar field to non-zero,
> there is no behavioural change here (other than the name exposed to
> the user via the gdbstub), but this paves the way for implementing
> the new features that use fields in this register.
> 
> The fields here are the ones documented in rev L.b of the Arm ARM.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h    | 5 +++++
>   target/arm/cpu-sysregs.h.inc | 1 +
>   target/arm/helper.c          | 6 ++++--
>   target/arm/hvf/hvf.c         | 2 ++
>   target/arm/kvm.c             | 1 +
>   5 files changed, 13 insertions(+), 2 deletions(-)

To the best of my knowledge,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


