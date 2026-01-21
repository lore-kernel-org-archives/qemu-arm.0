Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCB5C44506
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 22:08:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vigMz-0004HS-5S; Wed, 21 Jan 2026 17:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vigMx-000490-FL
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 17:08:07 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vigMv-0006Zh-SV
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 17:08:07 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso1294305e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 14:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769033284; x=1769638084; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SIv4bp2wpMQDtsKgbBBkxlY2hyeheUNAlo9AdrfHiv8=;
 b=KeanbtG5PTAmOJ6N03EKHNkVgm3/76xYMra4MX+3vLcQsu125gcqqjTjRp4NXPeqjW
 H6LVyBJJJFfcbi0rsNL8aq6zkjYYNpVKYCE/m4AWj59OF4PRzjRwf3xkxQY0C3RmdugL
 tuGbM8ouopxkJsLmA1jTZInDJc0D13lNI859n7B1OwDJaVz2pkbmvm0gtPXZxO64ykeP
 ZikGhx24iaeR4TvCHvWWOjjKbzzAAdSz9ZIXzHK/UYa5MM6GxNlnNEaMsDM0mhZQARmy
 B1ayqH8sk0SWXrkLZMlpOPUxqRVrFFOPQ4iV7hn5wozsDYxZ1dTHDZuAg/P+S3s9Kgdn
 nUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769033284; x=1769638084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SIv4bp2wpMQDtsKgbBBkxlY2hyeheUNAlo9AdrfHiv8=;
 b=HFnbzN1njcjfVB2falOLjNVnugmu17fPhA3y01oOq5rRzQJOKzq7ompvlhViJPFAUl
 xJQ/gDHzd68oEH1KkvSYrEariNU+KjPC9rO6nDwV4NDq57pDHuUDN+7GhWb9BRRe9WIM
 6Cxm93EzCo4OCb+sZz9OcSZYhN22kqP3qtETpU/T14aOBXj9ZrZLiF1NuAMCrvWPjunW
 KbZQYspV3D3U8zzyY3cJLZLD3+Cwd3RLjePKHyT2LzM6lVrGYy0D9FpO7niNGr3hDRUO
 fteq6dyA+bYXXYc9CS1VNK6NKBDTfKtI7krcLcaZwXjBAKwo8W7mxN4xEN0/YwORFAZR
 0/5w==
X-Gm-Message-State: AOJu0YzJ/K9SxuyeZttis2g/aWa2t5oX/Lw+GBwF7YPFaHpnNkyKpgIr
 pO1eEQR0bR8ufEVWY4TLV6YIT9Cjc4raNK85ZMJzo5n2gwP2iAwA/oVtTjp4RQzoQPM=
X-Gm-Gg: AZuq6aL+JFWmlbEv4uzO6kkJZ5TOqeaMitaa/NR1eMTCaB3KSWVPtvnxH2SgDNUBIrY
 nVSRnazGYZb9N5XolLIOZfB8N/ph2WA6k+E/THQH3z8zTS/walHiPtevLVVJG7NiiL0syi+6leb
 sPwD1hbsfyFRWuOZK7zje7l6Umzo+aFYcorXnaCTwoT3BVXD0OJ8N23CFNlSYEMcOd9sM/hpLH2
 +11lziYS3dOQmSRBMDB4JOPG1TkorctcWkoZz4aoQ0si2rQWhG9p9ubJWzBo9Yh/NW8gFrZu10L
 xuz8xemF8NwLsQXX5swGIYdIvVMw3VHi6khNgd2/Yn6XeTtAq+uFBpxC4bvSPcvllvWlGPryoa3
 gdJLkzrZancxFsNcgSgiD8Y1YHCuS8a+DmGUqt1xc3bQLops7YFISZRsbWWf7CNXEQks5Lce8d9
 IdXX7+bhBUImBTKfqDZpEP2MVRzw2cSu1bVMeXgb8iprTG8iQseI6QUXGgWxA8t8OQ
X-Received: by 2002:a05:600c:4e93:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-4801e30a606mr270732135e9.1.1769033284372; 
 Wed, 21 Jan 2026 14:08:04 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042c1011esm32775695e9.6.2026.01.21.14.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 14:08:03 -0800 (PST)
Message-ID: <d00bd9f4-efb6-4fe4-a562-11baae6cfbc0@linaro.org>
Date: Wed, 21 Jan 2026 23:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/intc: declare GICv3 regions as little endian
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260121105932.135676-1-alex.bennee@linaro.org>
 <20260121105932.135676-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260121105932.135676-4-alex.bennee@linaro.org>
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

On 21/1/26 11:59, Alex Bennée wrote:
> The GIC should always be a little-endian device as big-endian
> behaviour is a function of the current CPU configuration not the
> system as a whole. This should have no functional effect as the GIC
> cannot be instantiated on a BE system but will help the single binary
> efforts.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/intc/arm_gicv3.c            | 4 ++--
>   hw/intc/arm_gicv3_its.c        | 4 ++--
>   hw/intc/arm_gicv3_its_common.c | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

