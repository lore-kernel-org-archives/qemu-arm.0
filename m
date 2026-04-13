Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D55F531DC
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 22:54:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCQAM-0002Nw-OQ; Mon, 13 Apr 2026 18:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQAK-0002N6-Uw
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 18:54:00 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQAJ-00024L-9j
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 18:54:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso59994065e9.2
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 15:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776120838; x=1776725638; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I6SyLIs8+nCm+Z5V5HlN214+IQrNgoczgPddffdg29s=;
 b=C53oW9Xo/au60sL8AjhqD9e7aC0A4dOtfnxjGi4YeUgua+d2FShBML8fcZzu4vUwlP
 zCD2C8AO4YXTPlD0dyrzRjEw/frurYgYwO2ZZkNVb7oI+FbxABUHNwFPGjCoLm0juMRv
 MBwlZ2dJtEKWJO0rQmiv/OlsM4eJtD00sW3l0mICSmyRi27X0Tmrvn7q1S4DlwZKP98A
 u9cQZn3uhbbK+ilGfknhftMTymv9aBlFvlop+pntHogmFoHezSGDtiNSj6I3zuS/ijzn
 4t+MwluF+zPQ6PyEdKvmGTZaoN9EMo4qS69uwBqjM4wMUY56IdspwOmbPwuRtZHF46B+
 YUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776120838; x=1776725638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I6SyLIs8+nCm+Z5V5HlN214+IQrNgoczgPddffdg29s=;
 b=APvdAWEb0f3REV83oKNiRLBIIoOlN/aEmF57CbP2/bfokvmqlg6bd5Apms6dNA/af5
 deqIPspzZkUl0wTxB0lVmjFEc/eU5G8jjPDVE1r3rh7pi9t0AKKD+IdMKixs01CVDTzZ
 ue8AYRXaTxtlCBauvqCnmTOxe2Kr846/Y9OTi1Q3LqXgYE5iTz8e2SBtHzWMovf5VrRI
 j4NWB8YFQeAL7AFxzsIEAPuJ0wxmsOadm7zDCjPaLjp56UQjGUmXBclekH2sKMAxWKJu
 0E9oMKH98O0LvzV/jw3Rpc9DHzqB9i+SFYuWLbqxMRI+RLcZPIfbRlt3WdZTLfpfxsHc
 n/Mw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9tqOoqoxVq9nuHsRyexdirAhS5PgXZVSL2zVpwKDYpYEdv+oQw8GxroMJjlfEzzJfwQIuEvceklg==@nongnu.org
X-Gm-Message-State: AOJu0YyH9yW4znF+DSuQW5/ik2+yuth4fEMVEef2wNwwCvGhd05wYgVO
 9N2HRTHG6hcfm30eeZ6HVZDueB25gjmbdSz424bwkdqSZJPrl1UQfxVEp5NXArZyNSYLErItAqq
 1fJBJ6AM=
X-Gm-Gg: AeBDieuJ1FcrD80JUoskWQ6xjmP8+L+345IMWg1M+/w58ovAH22fsZUxsPc7Ug0Hvz7
 5WGr86Id19u2H4xEa1Yc20tC+CPvOcJOb2Mhy656MQlgXr9DMvYgNezirO1lhNSYGZrtC4/dXR6
 tFj/5KyT39ceIV3YHxS85emYmupmBdp/2ZvMI6UT5M1AuuLHt6G/Zq7m73qwQYUGuyes5ppQAoq
 dV8zPFIQlaPUkHcn516MbiYcKgdZ8qGXMq4xJQroE7P6xkLaPSLeDIhLBX97D734lcWgbIxGUir
 vfbeUWd8oAiM0JJhKU2DrQais8rfx9W2yV1V6kugXBQoEZr/gsG1n3/deZb6jLN1JoN+3Lg1yDH
 6eWgq9N3nypHIdpPfGnx2qkWAuk6nlUAFtz4sYrtVkxd9zZeeD/K9BIlTMxQR5ya62bCEFTJVFm
 Q0po4oh+MavcCDkvimnMVs3RVQxZ8m4dXsF4QsL6b9r2SuNu2vAYBrjylvUeEGuVBAgw==
X-Received: by 2002:a05:600c:c088:b0:486:fa35:aef2 with SMTP id
 5b1f17b1804b1-488d67bf744mr146730085e9.4.1776120837638; 
 Mon, 13 Apr 2026 15:53:57 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ee018b34sm887285e9.13.2026.04.13.15.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 15:53:56 -0700 (PDT)
Message-ID: <5dcb14ae-64ab-41c3-9ff2-27ed6d42db50@linaro.org>
Date: Tue, 14 Apr 2026 00:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 57/65] hw/arm/virt: Move MSI controller creation out of
 create_gic()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
 <20260327111700.795099-58-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327111700.795099-58-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 27/3/26 12:16, Peter Maydell wrote:
> The create_gic() function also creates the MSI controller; however
> there isn't really a strong linkage here, and for the GICv5 it will
> be more convenient to separate it out.  Move it to a new
> create_msi_controller() function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>   hw/arm/virt.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

