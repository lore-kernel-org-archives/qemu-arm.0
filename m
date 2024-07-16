Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp46810njk;
        Tue, 16 Jul 2024 02:16:39 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV8SxeBHSYubjOg485Kpu7+kcukUEeHp7ELp7IC7IAVkee1+tSrS8jTIbaDhr4AjE5v6nYqR08/bjZ9QUgyZoqHq3TjFKS6
X-Google-Smtp-Source: AGHT+IEp99uvT5mOMQHaIIfxAwOmpLc3Qd4+T9nXBpvEe5lDrmnr7MO54wHnzHt4Un0hJuERVdYE
X-Received: by 2002:a50:cc81:0:b0:58b:35ef:88c4 with SMTP id 4fb4d7f45d1cf-59ef0ad5f47mr835628a12.37.1721121399656;
        Tue, 16 Jul 2024 02:16:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721121399; cv=pass;
        d=google.com; s=arc-20160816;
        b=xrD6/AFEsZUzW2nvkdwUutKjaI1Li5pwPmAq52cZOB+aj0CLQibpWpcSUpa1UvxMfA
         1rdGw+R3OA9CFcuK80+JQDP2SpHNLIwtNd1xfit+TNa6wy9ivgVRqeQG6PSlCA571Fy1
         2SfCo8FcD2FiNNT9JfQiyPggfkO4tQ66Myx8IrPP7kLydfhx6acpLXhLzZyrG+Cb46Gj
         apSvKIzze5L/FiL6m4enJRy0Beo1hGnmjRT57nPk7ZLrN4iF46Q/KYeKIT7BWmntHM1a
         kSw4EttQImBe8stIyePT2Nb7JU1CYlk72NcKHcu5LgxCE8yV530HR/o9ycbG05oKsX3C
         0mjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=JZJ2FaC1aColOK8m8UOtkXUAgeNFiyILyU4C1KWmjGA=;
        fh=6y/9x40YEwKvnOcDSW+WgCMKA+Qgp7l/sM2CpZI/gWY=;
        b=UDOwHLzXBkp7/YGi/2c9ENCmXs2b5RAMArj0KVQpYQN9nUpjbfAo3smh2JVTQ1GXPW
         dy+QyYz6D6KdA0Y+S1lcR8IIjA7lUsFmNgRTZnuF2/OKrK/K8FPYZRng1DnEZZcAe3E1
         wgC0IIpBv/z+ZtAwgHaTBdgYGkOeKJoRp6+1QlYKV4MNDFedSyt/haEkWnGFYSz9mwys
         TXFB9VtI0Jug2MHO7wHOcjy9YlUnUnfk0SkINq/7976hl/lwrRgSNKCgtwcjxGBMipYX
         q8o6hl0AsZnuSAdH+V1ps8KNkn9mjfFvpYc7zw7HwSjaYolWBzMiYB/rC+9mc3LxIfIS
         u2DQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MufWT+uC;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21693-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-21693-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-21693-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-59b2504b785si3436152a12.205.2024.07.16.02.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21693-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MufWT+uC;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21693-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-21693-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 353CD1F23253
	for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 09:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9E05FEE6;
	Tue, 16 Jul 2024 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MufWT+uC"
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7559233C5
	for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721121394; cv=none; b=tBhePrphMA50AfNZhwqNorhDhgTER2+F0IRz0fSBvrAtRFb4CNxOjXxqpDLiNSatiIF0ri8O49+Z9yl0aYPfx2AdKJmz6ndty3a6LBvglFeMxvZsIjPj1GKL9jh61KkpK+YLTUzI+LOjNLOPpygEltQpIC0eGU7619TajN/ywVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721121394; c=relaxed/simple;
	bh=ogH3Nf6vOXfIwhUABssTmuPLmnQwI6IBCF8jPU3gVzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kq8w/2b7FUmbbrdcy/7szLtL7NkvMZsyHfF9Kxw1jQEl7s3DRx/6cI9Hxdf+vEFFIBV+DpRxGmNKvkGQ/x08y0+qj3DS9Hqb+ManbXvUxXbKZwp8EqQyxJcG0xPCgLzfwjJjWd2HA7DChdy+ilT+RwL7u7LjhQInZuue7QmdpOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MufWT+uC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4266f344091so38087345e9.0
        for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 02:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721121391; x=1721726191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZJ2FaC1aColOK8m8UOtkXUAgeNFiyILyU4C1KWmjGA=;
        b=MufWT+uCPN2S+vN8krir72P/hnHApR8fl/RV/xu2idsu0dmHw9dqU1Llk4w8204qg3
         zkQztoZlOgNfP+rQR/vy2yJ7AVzwd9+uK3HQGpnLDFt311mPUfgIbQ2qcoExAKPUP1zE
         alZJtJsEEqS0JH5ZAdlfRMgezzeiaAsooYtA6lSJCDk/bueTneijUSRrt9wlSiat/9lv
         2FJcJr/OsZL1B3xLYsSLd7YddCCmj30r+dYyfcAz2dB+MPaFO4chgc7roPd+PPolFr3g
         eNvyTVMlVLSj0+l7F3vQWDIPIWzrvWf8lZiqIBO/GaMoxz+PcZSFU5Dz6JHmOgwqm7Ku
         9Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721121391; x=1721726191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZJ2FaC1aColOK8m8UOtkXUAgeNFiyILyU4C1KWmjGA=;
        b=wI/1qfTriY1ezr0c+xHTeeV5Qa1vTqP1x7CSEc7oCTKCahQKbnt78LsadFq3IoZWCZ
         NIuyigzjDdzbu9Iux7gpDacJTMufUBDsJWkcl/fRkubL3sYq4BEsvEqv5tNZlCwVXx7R
         /hGcDosw4LhE2ePH2XlMC8FF0vkPz7d7Cidi5Lg9dW8bmM++8shjfVjXCSy2VQCiOx0v
         E2mGf6MbNPuROV9fQtnjgZJYSv1eU8EreZCjnXZdq0s6O11BoTqFhfeS2ASgezHUVLL2
         dvmEkyrjQTVTlrVeTQuDDok9m4Ng0+X0QMuTzKZbHDTmnuHaP9HC0ZDw5NPDDE6jCbXa
         a13Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlfwrXg/dUUi45szgG3PlSFMLLVNnTLly1jsDS1BzGsHZ0tSX/NxzdbDFzs7W5BkLQBvR+DCcS3I+ESgadp1YsejNe
X-Gm-Message-State: AOJu0Yy4dTFAoPHogDwPGNA0Gdzr6/gi9hgdwEblL5QsEWnpwHn/HHBH
	JLg6S5ouuEm+yKlG2Xgffc2/9oostJr5wkx3H87cDwo4zMY4a5dIMnMs6+60N9U=
X-Received: by 2002:a05:600c:19c7:b0:426:4765:16f7 with SMTP id 5b1f17b1804b1-427ba654628mr8920065e9.21.1721121390848;
        Tue, 16 Jul 2024 02:16:30 -0700 (PDT)
Received: from [192.168.86.175] (233.red-95-127-43.staticip.rima-tde.net. [95.127.43.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427b8609d54sm27755325e9.42.2024.07.16.02.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 02:16:30 -0700 (PDT)
Message-ID: <066eef24-c136-4b18-947f-64ded0c77b48@linaro.org>
Date: Tue, 16 Jul 2024 11:16:27 +0200
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] tests/arm-cpu-features: Do not assume PMU
 availability
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
 <20240716-pmu-v2-1-f3e3e4b2d3d5@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240716-pmu-v2-1-f3e3e4b2d3d5@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vu1Y5ReqPPhF

On 16/7/24 10:28, Akihiko Odaki wrote:
> Asahi Linux supports KVM but lacks PMU support.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/arm-cpu-features.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

