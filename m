Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp63018njb;
        Thu, 30 Jan 2025 14:16:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmhVDSkOtnANtxW2sF2FWhk8nzAwzKJPKrZzslgjVC4dm8AUhlhCn1muN0v2pudIlgaupzyCFd49YclQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGvm6aZPdwJTWlUDHegSQAn3uaRlEBgI3sngxx+ofUBTiAer1GNuzquwHSqlIa3cfowmpy9
X-Received: by 2002:a05:620a:2a13:b0:7b1:ae6c:fc60 with SMTP id af79cd13be357-7bffccea1bdmr1453232185a.8.1738275365309;
        Thu, 30 Jan 2025 14:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738275365; cv=none;
        d=google.com; s=arc-20240605;
        b=YyJO/L8thhNs5BuSvLptxphlPhpT2SEzsNIUOfYaRTXSv7VyDwn83FHND2XtD4wSmT
         3BCcHpJm+rmY+m2sBIWdUAB7hI9/gst/PCOIXpNyrkEzwbCX9JxOmLAJ2pUMBv9DqoqC
         yqFGRMKZK1bQNNR4fOerxIX8jevZbcQd421Cq5850JyPG/5ZK/nZLdC1Tmd97PqZL/wv
         dxOqq2X1T9Nu1thoJpymJdYF09U86keLiuJndgfguhJWscQV5CVDMwZj+P2fi5TzwbuS
         7K8akhufaB+FtuSkHrDmyzS6/6ImjmEjGdLpkpo1f1SiIUPqNA9HWNgIahQLj5+CgV0c
         WHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8OSVaKQ3JvAJ3blBdcWlqqwr3YtG9QWmvfHJA5UHTYE=;
        fh=A1hQnfp7a4cauDTu+RJnvNF4/5OJ/9kwHHdEg7qNzvo=;
        b=FW6lNCqJ1nGXY1zKMaMY+AC3GYj/gIEXnmr8ABzQ/63+Xqf95ZE3hqHG0z0S+zwMoI
         qydIm4Uf9xkj03EzrUk4Qt82xE1eLz3yKts8Ql1SsO6B9f1EXZktPU0DTohB7JK63Ouq
         yq6kiwTGxntvww+1xFq2+fhwFbHuGQJJDyi5krhY8JXfAdj/9daSGG9aq/P/jnOyEKAO
         4js2hNsUHAPuWVWENFJE+824Wvc/QX3Y1/jzRgOxchfPBiC1+KJPIxW7rWwwFJjCVIb5
         A/VmCn4lJ6yz+sZzRF5QwWa4DUPamcRCk/T/Qjpr97wzXyvjaO7eTSOTifvn5uDk0uUU
         P5gQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F9rwKZ0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a903970si257307785a.270.2025.01.30.14.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 14:16:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F9rwKZ0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdcpG-0004yW-B7; Thu, 30 Jan 2025 17:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcp5-0004wH-Da
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:15:43 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcp3-0007kH-Vw
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:15:43 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361c705434so10287425e9.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 14:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738275340; x=1738880140; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8OSVaKQ3JvAJ3blBdcWlqqwr3YtG9QWmvfHJA5UHTYE=;
 b=F9rwKZ0UHyYEObG9xRErJxlK1uSTBp/+CtZVTD690rC6OTKBuUGJduwFs1DX2i7R5t
 uWk7hv9rnLGYdMjNhPEQkHhmTz8Jm9hfSJMVQsEx8UXih5ebbxu9PDSHIT5lGTu1SSYi
 R3SKG9R9tvjJQ3+IBriTSTYGZjB/ecspi+CqWMqv1miGkcr0qfc2ILYtK1VZDFo71fNB
 TQ4CxwI1BiARpk8Qbf/IVh0dIDu/aIw2/2K7Moe9/NpPX0I+iFFhxy3j4/+GMDwcHBSg
 eMzxgEsQ5jYW419G1Atd2YcJDLNEGBH2XBt3ljJlYhzY3BFl2Wjk7tIoVcHBSXhGe6XF
 tdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738275340; x=1738880140;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8OSVaKQ3JvAJ3blBdcWlqqwr3YtG9QWmvfHJA5UHTYE=;
 b=dTX2pEslOGfY+U70qTKpMIcX7FMFSf4Fo5Ko21qhIreysaKC5KhPjz2ZdVbU500gNK
 KsHJDmPAY5OSuCf4oJ1ZtX3W5JAYEUgI7Fp3V2P6x28ZXipmNRJFhVJe67X1T9HjPJ/L
 4eMCP6qlTorooXz2lOjam8P7GlIOhRyO60Kk1ps2J3QXmqBGzzqd+kE5VimhJq3/tqpI
 cObnhznGT3AbCXTo4PrJ6amc7tGTv8Zfvap5DFRcSMDMrr27Z75mFzrerAqD3u4D2UnM
 CXuK7mJIswsUhmit2cadgnLyWEA3iRPOn0rBlBVHCnCZ3gN69skJMQmVZnTYP5t1K+Gy
 czXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN2ZCOf/G1+qy31tPfaTD/hQuBHQZ70g5igdSXf0oZCjwRPz12Z4KTb6wcgi+ZziHWGcix4WNcsA==@nongnu.org
X-Gm-Message-State: AOJu0YxTwoFy75AH1+PoTT3D20baoVooJlc8TyKq9A9Je8dXfauZrycf
 gIEc+mdL+pP8CgfE0wbs61Fn8GukEUOWh3UkGUpc7poJFhF6b+ureqEbtrxtoGg=
X-Gm-Gg: ASbGnctTklOsZujjt24AMF4/AQixG9ZKSMHp9F76OWyt0LeKli4rHW/IvN8VJO8RMcB
 iYauHGDonrDH1nDRxW1F+od9PVNjKI9wPSSDhNZm5XxzUilcTo2xp8yssQOas9rj1+eHGJmwoe6
 mQ0VoW85fSikM9eDHvFYBQqjazO5SpcBtHveN/G1ZOXxgbtSZba/98Noh8zPuloZERWnK9g2Jtw
 LcqS+ssHRMyl+lyP+p7FhfGfRJsRxT519xkf7+7vY1cJeDk9MnCcCJp4W+Hg1jQCtM9Dc1lL80B
 U4lBxKHuI886nw5gZEoRBVtPUzc6Bbp51RVbSTHD1khl36wIMCq0EyPCmP8=
X-Received: by 2002:a05:600c:1f94:b0:434:9499:9e87 with SMTP id
 5b1f17b1804b1-438dc41d8a3mr70794545e9.25.1738275340267; 
 Thu, 30 Jan 2025 14:15:40 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102bdbsm3036290f8f.28.2025.01.30.14.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 14:15:39 -0800 (PST)
Message-ID: <d62e2e08-4b17-43b5-9ca8-ee3e2755943d@linaro.org>
Date: Thu, 30 Jan 2025 23:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] hw/sd: Remove unused SDState::enable
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-12-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wDPximFd/LoV

On 28/1/25 11:45, Peter Maydell wrote:
> Now that sd_enable() has been removed, SD::enable is set to true in
> sd_instance_init() and then never changed. So we can remove it.
> 
> Note that the VMSTATE_UNUSED() size argument should be '1', not
> 'sizeof(bool)', as noted in the CAUTION comment in vmstate.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/sd/sd.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

