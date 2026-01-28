Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D78D3F098
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 16:54:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vl8na-0001Ag-Ny; Wed, 28 Jan 2026 11:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vl8nR-00017f-Pc
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 11:53:38 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vl8nP-00009u-T1
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 11:53:37 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so73218f8f.1
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 08:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769619214; x=1770224014; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y5bliGkFEbdQWwTAXpaZ1oV3QTb74LZ6bYq4dIU1E4Y=;
 b=m06R2SdWbrT2Prf7IXfNs20qgW9250sskUUJoE1z5jgszhP877v7RktbJAxKqAXuho
 FUQukTnVulRBka+GV0BeZiD9sU4dmHAW3RKmNkNVMmhV1H7qDuUl5UYJhj8T+O3y3Zr3
 640M+e4cdB+z6/sO9ae+XIgt1xBmrV9VnLW1oNzMaBCosJVb6hjyzJ4vZzYzgdNc3yY8
 y3u9/dXH+N2i+M3AzUheatOQkXtUeosAMR6RoLbxdU+Hqf630pnmGY9+jTfReNOczbys
 m12IkAYodnDfvy6kr7+2qM9+bd4wUYbXFxFdZnY1bQML1FroiZIz0ntjDBJZT8Kl7lqc
 RODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769619214; x=1770224014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y5bliGkFEbdQWwTAXpaZ1oV3QTb74LZ6bYq4dIU1E4Y=;
 b=TCPDquQ6Rp7AiHY3rQQjIWu1vooPWRuvh1K3mwyh8RX48VpTGzSIgqtSz65NJ9eP7P
 i1ACC5Ry3SW2jOWvEqoX9jeylchfteqIgjrzeV/2rIRpG7P3DlRkefDy29+tWbHlTRf3
 pPJ/QW1uVMaMEzDWyjml73LgUhmv70+MxQCv0FhBYyRf244wgjXZZ4I49/+r1A47chHd
 VIA1ApfOh+iW62xx5ZyNs3qul9abQxBIwgzMudcRRotpJmW+0oAsB82F1KGf3GWjVS3u
 h9H1CaO3IRR1BXTuAwUDGVroXLOBFmzNE/99TNvaXa+42nG7iLcBLcE/FKIstn3vpYio
 jYOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRMV1EGM5za1VDm0LwnQoA78zQJMwHh7/CQfuW6JWvZPxGCUoGF41hgHFWsaegTGlepbm4L2RFmA==@nongnu.org
X-Gm-Message-State: AOJu0YzMPw80a8WYcBH1Dpe7QNSx8L3bKXFkIowk/GfRfPIyEzApsWQf
 XE9Co+p8K8dHDqoWroYKxxuK5/tJaWkkRq7KPLn+mESVS3ARJm0AejreSxCrvyvitfQ=
X-Gm-Gg: AZuq6aKhAwIbBImD0VyJP4hYOxcxzS1BvuZT8FMZbiEyG3EvYbPcCNsDlHQXE6MvM/g
 HVvxJgnMx5ylIS8JMqzg/5WDR1lO7MlqwpLWcTv+xc5KtM4URwBJ/mMfhicCfJAecPEfNOAMXmB
 pfVwb6f5ZKArsIRTG6BBm7/eY/IrzVTJYSMwbwvLl5uRyHdPWr8N4sgyepLQ7P40lUhxErw4Qje
 RUYroEN/IW0KLE1ZVpsbLqCquSlnF8QtbMdc0oo8JqlhonNvSnQPblUgKtEn/kELJIKGZT8cv4i
 NU5NzcbHd8I+5vB2xE6oloHrUmaHjj65mzqhoibFOo48nskeocswwYMkZ3mMrkIkl1KuRSDWFou
 XUvx9Qj+z/trHIOX4xmFUTJyAtmyeicdjYD+raeSrrPptbRBxKd+yu11WXd3LJjiSSXQjuQnmq1
 FVkoeJ2Uu9gfeT7LQMCXUOf1qdcUTT9OL7o40U91vfcvGC4kLZpf4hSA==
X-Received: by 2002:a05:6000:40da:b0:430:f7ae:af3e with SMTP id
 ffacd0b85a97d-435dd1c1339mr8006306f8f.32.1769619214284; 
 Wed, 28 Jan 2026 08:53:34 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e490esm8178792f8f.9.2026.01.28.08.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 08:53:33 -0800 (PST)
Message-ID: <437948e0-2ad1-4c52-83d5-94fa3dc71137@linaro.org>
Date: Wed, 28 Jan 2026 17:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/functional: migrate sbsa_ref test images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20260128105839.3487840-1-alex.bennee@linaro.org>
 <20260128105839.3487840-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260128105839.3487840-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 28/1/26 11:58, Alex Bennée wrote:
> As the builds in codelinaro.org are going away migrate the binaries to
> share.linaro.org. As the hotlinks don't encode the filename we need to
> explicitly tell uncompress how to handle the files.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/aarch64/test_sbsaref.py | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

