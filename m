Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51E3FF8867
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:31:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSbx-0004rQ-I7; Mon, 27 Apr 2026 16:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSbV-0004gf-DX
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:30:56 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSbT-0002Yb-Hc
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:30:53 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so98237685e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777321850; x=1777926650; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wQexbKPFckdZQVJZzWkr6sHDQQV3+9kWN2kMdbtTtT0=;
 b=tLkU0h10LAjksBK1/Yc/DwCg2DXbCiPIpq61aHlJ9deIbQz/832do+Ayqaqcku1xh8
 8bk8JFwzKzvrt0HL+xqQljx66XPoTRjp0I6pTiNtgyHM5sRTV0HESLQogw+MX0BpAGDQ
 qK34s2dA/j8YbsuCpqvXdqidHf38s0p3cUrhAyVTrlZoU8KaomspzZJkqVOD0QvwKLph
 NuGv061dSo7uMY585+cExAQMBnXEWYMfyRqKL7waBguaIl+8mpaSy3iLbRLs36Agk53h
 E/SEMZ64dZ+YKSJ7uZXH3j3yE1t0Gabdqy29XpSFI2WCy3RxQhJYiTQWoPKvb322mG8A
 aeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777321850; x=1777926650;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wQexbKPFckdZQVJZzWkr6sHDQQV3+9kWN2kMdbtTtT0=;
 b=TAVSCoDrLm3UcLbnjxZLgT3g99DxUFWbAdv/3aDzHr8E1IWKnGaESmRZ2r3ub6+YrA
 y92nLrVwYsqq1YvDFsuL1xx1Y5HtH8AhlC65YtNYh/hy69EyVRAbz07VWSzlA+9JTi9L
 bYh4QqzSxY5/a0tOqISfjx5FAybCB5WyS+s/Gn8vcYCRonXxzq40hPA8/RGHi/Bf3+bd
 RYV7El9YaxGBw1iGJFQxdKCILHFIU2RFQkFCrUJr2AaqYNjwSaiD9ty50qcYJR8ilqeT
 rsKwqQaN4Gs4vSkjXE7fAB2HJYNJnr4h2lrxkiERrOlM5T4/UMB7AMbb7a75lNVDkOwn
 I0gQ==
X-Gm-Message-State: AOJu0YyFVylwbYWr7TAYXOrCroVv+p589ItUgms2cNekIjamFXaXtl7K
 sPGq4E4LEauEOXBM2js94e+IpwuUSrUUK6yAWD0Jl1t/++ZggPN2NdUEI2tYNE5mMQw=
X-Gm-Gg: AeBDievDhfrZbZRFZ5om1sX+nZOlYh4X/Lhuf7u8KHelZilpn343NH4f/p/kfzX/lWE
 YXM2vNHquMUGPX7BEGwLm9AQr10eulw21RipKKxQz3qAvRlg8hJctKdl4E9D+wPq5nUYmKRQVkG
 ZCeEELEDFVplCYGPRFUDRPWXBWIh/7g9yTgnn0Nn6P3nR+MwTO3dnUoLOBdTXcr2td3rLljdUEa
 5VXcl0X7ouZImNC+yBAfElmf7NiE0mSYcqEKzixoGVShKe1vQo3CZPxNJuRpb4R9Wm4XQGThaVV
 SBXMezoX+Tfe4WwRHQLyJHjFJaP9PCokaxtrl0tWqGmxpmPYDjqNjHN5t7XO3QkJ8TaFSkcDJVF
 aQZKqzcDW9iOO0V9Zbbt3FKU8caIQ/qcjrVjvQ+8P7SPr5F7uTjBG3P8JPDtEJOxFIMWq94g+HH
 RKmoQG/WKOzucDs0q/1dosPKmmMRhwNxQDIRGw1QBlElPRco6dhK999/TEg5H8Eru5T/VvbNhdS
 Og1jQu0QUk4mno=
X-Received: by 2002:a05:6000:2287:b0:43f:dc86:d61f with SMTP id
 ffacd0b85a97d-44647cda901mr556796f8f.14.1777321850066; 
 Mon, 27 Apr 2026 13:30:50 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4464004edc8sm782377f8f.37.2026.04.27.13.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 13:30:49 -0700 (PDT)
Message-ID: <a5c34e11-6d02-4aa8-b7e0-29d52633f63e@linaro.org>
Date: Mon, 27 Apr 2026 22:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/84] fpu: Drop PARTS_GENERIC_64_128{_256}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> These macros are no longer used.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 9 ---------
>   1 file changed, 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

