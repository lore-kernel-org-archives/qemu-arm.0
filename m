Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2314225njj;
        Mon, 5 May 2025 02:32:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtbMEQ8n4L6zc+9boKvesg5vOAOBmG+SLCBdVFQ53ghE5QfJ4yBjrRC0ZP7l0nSefTPBQkS2Fobt4GvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGucIJhUVA/yzTNahlQkyGkWefOFoKOvuOARjjDX6YR/Sg86vz6zFjtkF0g9KgAROSYo8EI
X-Received: by 2002:a05:622a:5a0f:b0:47a:ea2b:4a51 with SMTP id d75a77b69052e-48e017435c5mr105703731cf.43.1746437519985;
        Mon, 05 May 2025 02:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746437519; cv=none;
        d=google.com; s=arc-20240605;
        b=E9pqJkm17Orsfr5K9lIccmKwYpw6HtCu84HgWXU3zdtyAPS5puFsICrJvJGc8+VCef
         +CLGWVTGPYnOplF4obFGCgw1Zto9FqGfrpyh1Bj8MkMeVlyuePMIfyuUIY9LOE7ZUVUn
         1jKwduyYh3vQ4B63KOB/B5H//qq9ewtEoOLigPk2OlKrCUPgjZ3ktGNi6J13vBNkL6VP
         PPsTObU+HzkkJGQB1zKGMD65sZdkc4cp5ShiWss99Ah/6fdUlpkmoeCpg2oQ0NIZIUux
         hVE9jpjeRntqRRqMVOUUklQQspcCmJ7C5UthQyN+Sww5RB8qogFhVOPSW3741yOrFCv6
         serw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xxOahBVVY1blbQDPPW6PhTQvzs75iF2p8C59bNlCWf4=;
        fh=5OS7JyswMOOMpBhUJY9sObTClVX60XvyDIupViybo6g=;
        b=HsR6s3qul+mph+VhJh9Bf4e9/zoTxW0tk7zN+m4rIoklMptsLqBCcKd6krxt/Zwltd
         mxn3YDA10gf35FM7uMfrazSHNziFr1c1Ke2n2omOedJWNASryZ+5SfwZECAhat+MFQD+
         IM0XWJxSrqOgNK2BRMyhlw4h4s5KBlXc350r0bsm6t+IT5+DWW5k9u/AIO9gGrGG7jNL
         cHjtQc4HYhjv76IXkST/kVfuQWU3bDonyql6Qah1FN+PpLwsVBoH70bnqBj7BZTtWy/u
         8+3bL7aL5QRwsIT2NRzG5XwfFp9zthtU3tmKvEuu+IU0lS+dVzu4aJ6AVuQnA5PYrrVm
         q3ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uzqI/kSo";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98724594si82362211cf.420.2025.05.05.02.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uzqI/kSo";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uBsAr-0006lj-CR; Mon, 05 May 2025 05:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uBsAp-0006hy-0U
 for qemu-devel@nongnu.org; Mon, 05 May 2025 05:31:43 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uBsAn-00026C-C9
 for qemu-devel@nongnu.org; Mon, 05 May 2025 05:31:42 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so34245605e9.1
 for <qemu-devel@nongnu.org>; Mon, 05 May 2025 02:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746437499; x=1747042299; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xxOahBVVY1blbQDPPW6PhTQvzs75iF2p8C59bNlCWf4=;
 b=uzqI/kSoC01yAa+FyWKKMaCweMTx7TeAlU6g9s1nUYvChdz2YsDhZQpFUuAX1LoWpF
 FHhM6qjqT2YDXfg0PW+BMC7m7iohne0tA4DCeSMLz06M305g/pcI2a1kmDmVWgYpLxmD
 m9HU6lBkVMJiayipXw/DusbVUPODH9MiB8CFPMm5C1VpJU+Fq7KvZg8f6jlTuM3ehK3v
 a82xIZ004m4EOcGm1dglH3ox+KzjDLg7w8JwMF4avPoDNDI6DoB9o3eA32+8vTa5PwRB
 GYAiF7cVmmZ+JPAbJPN8qMgYIcr/A/S4akczsOpXB7MPutRaqTcSNk8CagGww5Zj/Mu8
 S2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746437499; x=1747042299;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xxOahBVVY1blbQDPPW6PhTQvzs75iF2p8C59bNlCWf4=;
 b=MucVDBf+5+jX9KNmIFtAW4YPuT3uXApqNvvvvpmW14zj5+sJy2T299AdY0Bxkg/m5Q
 UGcp/dIU2OISoUdwnbFrTYzE+QGq8sTtqQF+e932jYBj8JLnl3Sl7WbbfjhOAzViZngg
 6hV5AimXWttKivNmjx3FHWUvKUjkIl9kN9Hqdy34XQWZkHOyeHTBW7s41kUich6RbEJT
 AMqeUIWLFT1w7DybX9naX6DZMWBLR5j1qxI/qpMMH2vVvZClkRj3rky2l+G//5sVa1Nh
 a0a9nFWBIVyWj3457VNRyXJLdJcHD2Ion1Zg3Av3GY8NqaRTCzoPogaQkb/E24LfiOON
 BMwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC7ThZQhgCLQFoOfeOyd2BrbfQRYSQzQWt8SqloaF6xWR/93CKHsn0sHwETaObTyo9vIUcdmtVmHU8@nongnu.org
X-Gm-Message-State: AOJu0YyOEW+N+7yMpGBBkPrXrEGnr23r12/BmhVkBTk02IALyYiUKe4f
 gLf58Rv2Iq/NKZSUC+n2hOEvEYpkDhELlQPBXwgwrARneLeLdM3a1/706xol94c=
X-Gm-Gg: ASbGncsbPn6xn0Ct6mU+4AWOLNlMa73K27NuziFC1cvA9WT2jX1q278bDTMqaJOCeQO
 3SphMvCr7KQXatf7PZ6papC2dLcMnBo6YwxztvWU+pwMFhoHf+ZUAwB3x1efyrMXPPOZ8sJlrSf
 ltda8qU3UZnjXzF9zzbN6zPVWeo4ocwe9TFr8sIukwx8qjqoOh9QIt0aWSpvJnF7Y1i5N66zohX
 agZbBzFeZH8oa9yQESdXhGRT2+zpk0t23S3LO+88BT+9k2nQS3ZJNXrXRNMPYA7SDpMeGdSWjrM
 gO+cs40yn+EtQjgp5SvvLd/82WT/B22yuNQm3TEH7e2Oyg6jMxhCgUQlcJ1Dx/9+L1y8an1myo3
 nyMVg07p7LEaliE4o8g==
X-Received: by 2002:a05:600c:5290:b0:43d:fa59:bcee with SMTP id
 5b1f17b1804b1-441c49340e5mr47267275e9.33.1746437499584; 
 Mon, 05 May 2025 02:31:39 -0700 (PDT)
Received: from [10.194.152.213] (29.red-88-28-18.dynamicip.rima-tde.net.
 [88.28.18.29]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b16f9dsm9983710f8f.93.2025.05.05.02.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 02:31:39 -0700 (PDT)
Message-ID: <3b430156-a542-46fd-83da-092b6819df9c@linaro.org>
Date: Mon, 5 May 2025 11:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] aspeed: ast27x0: Correct hex notation for device
 addresses
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Steven Lee <steven_lee@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, longzl2@lenovo.com, yunlin.tang@aspeedtech.com,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20250502103449.3091642-1-steven_lee@aspeedtech.com>
 <20250502103449.3091642-3-steven_lee@aspeedtech.com>
 <bd2c7755-7662-4b18-9bea-e019955bd645@linaro.org>
Content-Language: en-US
In-Reply-To: <bd2c7755-7662-4b18-9bea-e019955bd645@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HByUEChJiUob

On 5/5/25 11:30, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 2/5/25 12:34, Steven Lee via wrote:
>> Corrected the hexadecimal notation for several device addresses in the
>> aspeed_soc_ast2700_memmap array by changing the uppercase 'X' to
>> lowercase 'x'.
>>
>> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
>> Change-Id: I45426e18ea8e68d7ccdf9b60c4ea235c4da33cc3
> 
> What is this 'Change-Id' tag for?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/arm/aspeed_ast27x0.c | 28 ++++++++++++++--------------
>>   1 file changed, 14 insertions(+), 14 deletions(-)
> 

