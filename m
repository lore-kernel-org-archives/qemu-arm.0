Received: by 2002:a17:504:3c0d:b0:1be9:327d:8ee3 with SMTP id y13csp78954nji;
        Tue, 15 Oct 2024 07:47:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkF+WJzKiQvnk7cWu7qbr/lcIJAv4XYoj7DppYNrXG4HqlZKs6zCeHZw8tmCiqTC9z7tBpUlmX91e8VA==@linaro.org
X-Google-Smtp-Source: AGHT+IGVkF/BHleR98aH6QCipniLIMunXeAePu/VyRIzCXotQ+k4mid5FRubGYP14UqQFRKbuPqu
X-Received: by 2002:a05:6214:3b83:b0:6c5:1fe5:f84c with SMTP id 6a1803df08f44-6cbf9d08a54mr152158596d6.20.1729003674595;
        Tue, 15 Oct 2024 07:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729003674; cv=none;
        d=google.com; s=arc-20240605;
        b=Q3qBYxv/opkP6Rn/wr9jh88MAHaahj5+MjymOczy3zLmwCVKxvH4SmO96wxS4ONYa7
         EYtRy9Lczymeo8TX0aolaWoi7siNFiZ+jGbdMhH7+FL9I7jW3Nui+rp+jFkHuYYyGjxL
         LnS0gtNj/7Z+WoBJpqCuGb7qyXRRlKGsqAOTXScLsXPkecka2/IQQpPUi9MhB0+WN1t0
         658G82RgsB0fx25P6BzEnLErelWKn0Ym268Y1PiPKcxc/Qo1kUqHWd4OufFUKz4S95uR
         MWiu+FOBLNEo9iJE5FxsBTV82u7heAAZn4y7PO+BKvHAmpguvhy81veIkpuoA5Tpwztl
         3BEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=90HvPRdExlP1+TSTD1mRd2RVhTifk938gAnosHnNG1Y=;
        fh=SVYOKyKxHSmXz8nW9E/IDxA4NRYXVA3Q0qylIk837P8=;
        b=GGqo/24yx/cuJAK5xNOXulJbQMJeHustgqAClrDEhST4/Vq4Hes1eBEVrUWMtQhhpC
         Z880+4Gaa6OGHPXVJ19n1tBXQtwHSqvqkY+62Etg+FRn+2qoyn4+mdnbet4IlSiU+KoW
         cvgs45tm2cqCX7zvtP3bKv91aPyBQeonUdQRz536ibDFmjU9lMuBsqstIzXrZokwxNw8
         UDHENgXGG+eQSVp6je1pqPoxRG47+whkFFkBrv4x1rKj5VrjgkiOx7JelFoiHbP/5Zua
         uhIYEXC59TBBbu4kTQjGxiJUlMaFUMkor2pPwvRV/+uHefOmBoiFGkfJ/n1GEMC0aFN7
         KU3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KJw0uSpC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cc229e263bsi15767396d6.165.2024.10.15.07.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2024 07:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KJw0uSpC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0ipw-0002lN-2f; Tue, 15 Oct 2024 10:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t0ips-0002kI-Dj
 for qemu-arm@nongnu.org; Tue, 15 Oct 2024 10:47:44 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t0ipq-0006wX-TY
 for qemu-arm@nongnu.org; Tue, 15 Oct 2024 10:47:44 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-71e5a62031aso1820351b3a.1
 for <qemu-arm@nongnu.org>; Tue, 15 Oct 2024 07:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729003661; x=1729608461; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=90HvPRdExlP1+TSTD1mRd2RVhTifk938gAnosHnNG1Y=;
 b=KJw0uSpCz64uLnjXmJZcW8URnfGiT2IQ7225Xh4pMu+vagahhPoKSmpwI5Sm3bbf51
 ZakqclR27EY3Pnu3ibkx/EihosSqJjGHx9uV8yz2nq/OlHynvB5OEXisYvcYpIVUddfM
 zmBZyVkACqddgJQoTUTbghEbyjcYGEaX3q7lsVwRHlQFFSkuE8E8pWS0uFn0sJmIGdfo
 yAOZqb91fYcQ+AHWAJdqu/Gy40ke2p/WN5SONao9g8Q0D5SgqSB+hV47pe1+eUuBgGIq
 5rwotrnHlSFJ+hKc6VMp4E8oOubBpHKS+WA+t35YrDSAGKPsVW2b0ZGOr8rwdxQfscQV
 pxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729003661; x=1729608461;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90HvPRdExlP1+TSTD1mRd2RVhTifk938gAnosHnNG1Y=;
 b=hbTt7YhTjGEb0ce8/Oh96Grzsne0pHB2IzYb+dSW8OZlweQqpYoHTtmM71C/grWgF4
 D5vJusIrgOvgKhZ2/3iMnJR6EnhfrfDqdAwT5vOyw9sBmAXHHYQqnAQXA3xW6DTu8YN9
 6/+Ur1Z0AqAGiq9ISj2mCvpSQYx0gy2fLuhoXkJg0vUVXsaFf1ydYKw6XmB2ccQMo5G4
 oIv697zn0LDx69lRYTFNUXLZL9hj4KFZq0vQogVpaESjEYwLvr07Bei64i5+PU2BIDzX
 EZYCFhGPy8C6WtrTSxyvMJkXBLvBO9srITgFbJivV/DIhGQqEDxV32MmXLEv6ofKVljW
 ch1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4rZMT+7S+DN3zVmLIDEjAAaFq9swO4RWdOB0DaFpcI68Sto8x5ju7eOrzT8/JwxUc19w+TkIHZw==@nongnu.org
X-Gm-Message-State: AOJu0YxvADCR1/tfjdEmJ7/zU4u1wInmgwepXkTp5hmtL3a/k4/WGPZP
 xCGhLdILQYXU2XGVk/OgL+Alyh2hXUrVcO38P+tS7rKwefd6h63EsWZCSoP9Hug=
X-Received: by 2002:a05:6a00:4b11:b0:710:6e83:cd5e with SMTP id
 d2e1a72fcca58-71e4c030597mr20511485b3a.0.1729003661431; 
 Tue, 15 Oct 2024 07:47:41 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.167])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ea9c6c11f2sm1429916a12.23.2024.10.15.07.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 07:47:41 -0700 (PDT)
Message-ID: <cf6da6d3-f8b4-48c9-aba8-9593951c2e73@linaro.org>
Date: Tue, 15 Oct 2024 11:47:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/tcg/aarch64: Use raw strings for regexes in
 test-mte.py
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20241015140806.385449-1-gustavo.romero@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241015140806.385449-1-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /phNP1pxqzp2

On 15/10/24 11:08, Gustavo Romero wrote:
> Use Python's raw string notation instead of string literals for regex so
> it's not necessary to double backslashes when regex special forms are
> used. Raw notation is preferred for regex and easier to read.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/tcg/aarch64/gdbstub/test-mte.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

