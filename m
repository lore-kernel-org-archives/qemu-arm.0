Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2543645njc;
        Mon, 18 Nov 2024 04:34:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMzsl6is2RvmkQCmRfMDVokbtH4/D5wIdnhHXMjAYULeSKqTCYmDc1U1/pbdkrCQjLZx4a2za7BZXM9g==@linaro.org
X-Google-Smtp-Source: AGHT+IEAyY5DmTtqd2RW2o3O6fS6rhsuOZ/go4BbGwscOQhoZff4qKA2+3Lja8G+BGArLBPQm491
X-Received: by 2002:a05:620a:2495:b0:7b1:4174:ac78 with SMTP id af79cd13be357-7b3621c59f7mr1724620585a.0.1731933253984;
        Mon, 18 Nov 2024 04:34:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731933253; cv=none;
        d=google.com; s=arc-20240605;
        b=C5ii4ETQvfwAqeYIV89GIwMg65LWxJfYyrrHOUvEDwy8dJ9rM8+7RSCZa4e5Kr+4E/
         cZgLDTTajdzLZOxYSNFAKdgdxYZShC49Oxj3iXinPtVol21JXX3RkRtLrt8Te863eIct
         heA98R55NpDmeg/kDE/e5p4v+z8NkvUKluGAywF2uu5tdPG5FSvG8mo8kGNkS8OuR0g2
         +OajAJFH34z1uHGFwMkjzrpcU9fRXGGc0Uh5hvj3Tmy+109DVEBRGJ5Bwuk6i23szwdK
         ftBxxeVmWQTnwDj7TBV8Wq9ApX3emREQ0JzDDdTTaddETQ7CeeYK76KKV4LdSkHdk08W
         7TZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nGg2eK6wTyqA9lcCKvM26995UkQxhpHyN1kHub7HXIA=;
        fh=VrMFgI0saQN5DEqVQyLhzu1HNloooffzOJ2FPt0o9Yc=;
        b=dUNEMYZSDruwM+88Br7zKsTseku8BAIvSQ0+JEsYlgLAoRXBXMusOn1f+ZNKEdVXEn
         BdwnP5dH/mKVT71zIcn1+P0vyXHfntQWYL35Zv+jEcgesGk7UIOiwVEjAqZ/mgsiZHfa
         BYUnFU4aUVB+9vvPb0r6QTSQ9QmAlI7k+xSof86wKb7iSJrIqOx2Ipia9czpnV9cxhmW
         oq18/do/V52ecJAh9syjYyv8TMi6cmM9S7n1uW2ytj5QDFh8NVMYtNWOS+uzT3CNR/Nj
         De84LYcJgsUiQ37bfFIwr8bWc7chfBa/MyeYnECXxETgW0LBL5BoZtnhkBtRJxcgRT/S
         Qk4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lV4q8wqV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35ca2883esi1028063485a.221.2024.11.18.04.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 04:34:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lV4q8wqV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tD0wl-0000ub-8L; Mon, 18 Nov 2024 07:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tD0wk-0000uG-0A
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 07:33:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tD0wi-0003WA-FA
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 07:33:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-432d9b8558aso23533525e9.0
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2024 04:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731933214; x=1732538014; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nGg2eK6wTyqA9lcCKvM26995UkQxhpHyN1kHub7HXIA=;
 b=lV4q8wqV1FlRVNtQo43D+TiKobeGVip3kvFQmqi7TW1dqh8yIjK9dF+OjSPWzSsKn2
 j7enrtJAlE3MASndMg5nm0M5hHGQq1yjWpL95LHFpaFK0d8+WsSTen3ZFJ5U98Yz1WJF
 qsUEmYeNa7cwnGZ7G6MowAFfLdaJTtt0sh9r8YYSW7QLBtuQ7LuGt+AE8CoTlJQhb4wB
 ZMWY4NfUGPmGHLcrO01kxgROZkaiIVMiMgF14bsQrYxrlzYA/7dUhS0eCRKIpEt9hnJw
 3YjjtMe8VpeMHZFy+lbO8lKYIBXVC2n7NwR3SbTdu+uSty1jmI8uN3+7SAft0Kwxp0ov
 zYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731933214; x=1732538014;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nGg2eK6wTyqA9lcCKvM26995UkQxhpHyN1kHub7HXIA=;
 b=ukx/Oy3UXumm4mm9jMq6Larl/EbIQzYiBgXNS7eJrq8vbtjKtUh/WeSpwv/c5n5BzG
 kmtnwA+p4+oYPIuPGk5vCaJTpSACbC5deJaw10RjQoeuyWN/w1WvxeVgeYRuH/G2yU+J
 A8xyHVgp69iNG4Rfw09+L9vj7cTGPaPsfQheKwQISIX6hoPCuHuHNJqnB+arGciwQBtY
 xCavWQDW+7NPAsizolzWmQ3OQb4wM5q7gwELB9CxO8NrB9K+8/2j5CVk7mrqko1fTbTb
 D0yEUH+YKkfTYvdcIvr3cVGUWUyofV4NgG7XfnAP/WQ9gBcBPr0mIjxfbgxQYuAGuFfC
 Xwwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwENDgXaAE6DNB26JVvSvx5OVmQYdkuCIpV57jvmH1u6XGOfm1KkEEJslb+qMXuo1GESg0BtlO4A==@nongnu.org
X-Gm-Message-State: AOJu0Yz4qrqHF1W1G/Jbsk7bVC+gMPtZ/wtj8hb5IozmlPuqBQm5Hf6c
 KTmmdhK6cao+Kcu4rGZfp6cy7tN0yk5eY7JEbANFmD2nG/7kMM0O/gnEEh9VAb4=
X-Received: by 2002:a05:600c:1f88:b0:426:5e32:4857 with SMTP id
 5b1f17b1804b1-432def7e5e8mr96698635e9.0.1731933214124; 
 Mon, 18 Nov 2024 04:33:34 -0800 (PST)
Received: from [192.168.69.197] ([176.187.198.1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dac0aef0sm156980065e9.28.2024.11.18.04.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 04:33:33 -0800 (PST)
Message-ID: <c98e31f1-2017-48bf-bf3e-02594d58a8e4@linaro.org>
Date: Mon, 18 Nov 2024 13:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 10/10] usb-hub: Fix handling port power control
 messages
To: Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 BALATON Zoltan <balaton@eik.bme.hu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
References: <20241112170152.217664-1-linux@roeck-us.net>
 <20241112170152.217664-11-linux@roeck-us.net>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241112170152.217664-11-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: DUJEdgobDPQp

On 12/11/24 17:01, Guenter Roeck wrote:
> The ClearPortFeature control message fails for PORT_POWER because there
> is no break; at the end of the case statement, causing it to fall through
> to the failure handler. Add the missing break; to solve the problem.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Change from RFC:
>      New patch
> 
>   hw/usb/dev-hub.c | 1 +
>   1 file changed, 1 insertion(+)

Fixes: 1cc403eb21 ("usb-hub: emulate per port power switching")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


