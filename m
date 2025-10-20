Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AC2CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:41:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAzV8-0000n4-In; Mon, 20 Oct 2025 19:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAzV6-0000hX-IE
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:41:16 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAzV3-0001rW-Cp
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:41:16 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-33292adb180so4939704a91.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761003671; x=1761608471; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GS7O0192Qv9N26NRgo68O6LAlrZ/Oq8n4C75eLBK7D4=;
 b=ZXQjpD5QddXlQ6pf6SgZIl4fUdQ54fnnCgm6ydmeCsAxChimWCiofoCffJMJvCRWdH
 i51hHnYkRgxtInoxakwDcHdGKz/AjPWpgNUcXtrnNvU2dkl+6n+gyP2Vz+ZRZtd7JeTy
 80f2hZ1K7q349P4qudoNCIT4XXOcJ7gXVf7nYXplf6hXyGYclLFIuj3m2LG4zAHvFJRK
 OYOCbWSRKwVlsc6bLU+lLYxS1h3nUpKyB3Hm+a9mOJfn5IBOyye1FKsqNftzbA0vOebh
 0P1T2j1OBCZAftkQSOfvhnfLgkpCe+RcDvUGze5Brb5Gc3xAS7MNXtCKYbt2yPkJEEAw
 aVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761003671; x=1761608471;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GS7O0192Qv9N26NRgo68O6LAlrZ/Oq8n4C75eLBK7D4=;
 b=VmlPYY0jULUy4Fm97JrZSQrg/ixJ3+iVLKJSVJEcZ+F5XjD2Gr2FeIeNxleykGuePc
 EurSkxmkEi/EguMfUGJlaln0fk0bMpf6yTNlatYSHToekVfWwErTvZqo9HKf8GGb3yKw
 Uts6x6NkaaJiWca0kTUBVxLN1AWWZaSnHzAcLsjxFBbW6Vc9TtthZQ/nd0ULynjD07y1
 TqVGfsAT8GUfF5JJTBBkVQDTjwQcByT0JqXkDKq9nSgaksIOiUKdGJQi3VZhK2cdT5iV
 g5NgwZbmaP+mWYF6zGPnu8jUK+zuYlj+uXeZ4PuU/lwrs8cuWvQesi5oLbASoDZReJw2
 fNCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/2sQSaLkY51GDhbfb4V8AuwM8OEWVgBmCJjPByOcN+IW1XdEkUnSL2t8vloMLeQq7xRNkZPtwzQ==@nongnu.org
X-Gm-Message-State: AOJu0YxDvSmo7TnOvQYWAPq+/UDl8/YcnCo9HtEhnGz5DdCcQAaOfpUW
 YapO4xC/6gzisIXyfLnd8L2FhKUixeaZhz3zGMtMGfRFCGLas/VL/vqhuW5YAnCZJ5o=
X-Gm-Gg: ASbGncsIBuPMnFefJ4Y2ODe8XCU72u6R/GFljf50HeesLbBSgl5TPlCR06C6xiz4nrf
 JAhfdYmTHRbCVgn5jQnrtRV5gp6SSm0KX61kuCw//2uZNtUJ/KwmbHOJF8Xk2bWDByl+pH86j0Q
 MSJnetVSCO6N0tGak9LwJWbZihCIqvruQmb/2d8ehicF3qPuBLX/ZXAjJBuUj2tx5troW5lVLgz
 Id2T5xpAt+lKhxK51ArZdVuiOVwmGhnGnQwNESyCpfZFj1HeW91D/Vk1PIMUIC/aUuknhvKIJmd
 s0+eriFKGvouWsw9oxWmjL1YXZGcV+7eQ+VMWK/0VUOyY6uRwYoM5apFhmKIDYZSKBGcqKcethh
 AqlzcEZWyc2zf5rB+zzyYpuas85Cox2fcCpCnxCePNFaCYCoCWCOR6wbx2k0R3CBn8BT2pJJ7U9
 Az0H19SowRkQRbVw==
X-Google-Smtp-Source: AGHT+IF2W4qJudZCHIa8GBLubG7VEnFsja11/z0exAmRjTHm0UoyvZGZQ0QmD5S9OWCUIjJU5O1FtA==
X-Received: by 2002:a17:90b:4f:b0:335:28ee:eeaf with SMTP id
 98e67ed59e1d1-33bcf8faabcmr18264409a91.29.1761003671449; 
 Mon, 20 Oct 2025 16:41:11 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33d5ddf086bsm9144050a91.2.2025.10.20.16.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:41:11 -0700 (PDT)
Message-ID: <d314c9ef-7c17-484c-8e17-88453d9705b2@linaro.org>
Date: Mon, 20 Oct 2025 16:41:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 29/30] hw/arm/meson: Move Xen files to arm_common_ss[]
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Luc Michel <luc.michel@amd.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020222010.68708-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020222010.68708-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102a.google.com
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

On 2025-10-20 15:20, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


