Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2149968ejf;
        Mon, 26 Feb 2024 08:07:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7F0EA36AtUm9pB4BP/ocpOMKL19FPCToG5LT29d3e9c6yX5Rt8O2YRGIMO8uzOsfbdZkijrTt47AfGEgm4vZd+jsi3Fb6
X-Google-Smtp-Source: AGHT+IH8PDWpTV5aabqv6pTd+3RcVld7mNc3mO04giW4eub6x0QmKDw5htkBh/tsJiBy2oUO5egm
X-Received: by 2002:a05:620a:29c3:b0:787:d7b8:dfce with SMTP id s3-20020a05620a29c300b00787d7b8dfcemr2230114qkp.4.1708963666163;
        Mon, 26 Feb 2024 08:07:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708963666; cv=none;
        d=google.com; s=arc-20160816;
        b=o4zdCyxQdP6op5UEv+pLJ/scJ2fDjyfD4ABpZX5uUtI/UGLh3zyPuUA61HgqkZ1f6q
         G25AL3rLX6eYCk5ETxOM7y/4sJNKeVFS/HfQPgSq4ooO4huckKzXXEynyzUmMLz/t9H8
         PvSEi4+gi6MwMQSJZ7G6JcHlJNwAu0g1E/fdGEoPoHItUIY8+1qr934j8agjFB3qQ9c6
         KyNgescM12XEwdbW1DrVmj4KjBQ9yRgTuHSXWfebo3yIYxhOBns9u+N4W8Tar+ioKFJO
         TNMWhNNCuTHSMXiJD8fgg3wspTUVXH2rdkbnAq8sCuspAZfQZrMogs8bU8mAkJTMyJbo
         CZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=W6RZ19sTM05Z+88w1NUGEHn3Dcz3i6pGJL7ASY0ZUGo=;
        fh=2VtAX4tuo1wAx3ShpyN1Mxyep54/GilG5RfQ2bAENVk=;
        b=cF524sJ7Qh3oqPjiGl/yIbq2V/WvJq6wsmEDqW0SDITSBxYULeiEFpcvCj27G5AamW
         BISBl0EqiY99J6/zrQ2wJ0ovnB2JimSOET8eSCeTTnLg88W0KvxVckbeCANwfaltJLcR
         TXY1w+nKrEsks7j2hxlVWLJ7V81mAxQdGSORUEg1lr6mAj/tiFZzskRn/yWH2YGC0GhB
         PxrPCdOJDjrrYZKdFiC21aRk368msiPAjuegicCb5rzQmHvw2zfbe00DZMkmzzM4JCyi
         gOFMSgDRGBlpKBZ1BJKPkCe+F8+5mxCqCrHnli5/DQMLBBieBn8weC+KQY1G+OUDsBW2
         578g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LBySo5Ua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4-20020a37c244000000b0078773b77629si5466544qkm.255.2024.02.26.08.07.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:07:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LBySo5Ua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redVB-00069N-Eu; Mon, 26 Feb 2024 11:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1redV3-00065T-CD
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:06:42 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1redUu-0005vJ-9l
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:06:41 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so5776051a12.2
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708963588; x=1709568388; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W6RZ19sTM05Z+88w1NUGEHn3Dcz3i6pGJL7ASY0ZUGo=;
 b=LBySo5UauXOVFIl5na25v6YeCpj+sIzwjjU6/qKMf501xHzlFVbqdHyqSrRLaptbqR
 Lwt0Wc++M58rNfLQnSYhmmaqH2ht4L8o5RLrr8yLzqeOlTtDx/uMugJt2ybm0ksLiA1E
 +qZ/XQdYTOcLNekBFXx9uIYHJ0Nh8XgJysXjNKJJs5H1JnDyzNM4eVVdyVudaBxh8cPE
 on1+ybDdXbSZ63nLnNRHKhrm4uWsQlj9CbD6HPPAN/JDZ/fcTlPxiEdeL0LXIVIpbVv5
 iSJUNGL4qT8SjCdkLzG9sPZ3rQ3SZEDRhRe94lbgqf3SC4p3ylBfaOC8j+6r+jUBVtuL
 mrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708963588; x=1709568388;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W6RZ19sTM05Z+88w1NUGEHn3Dcz3i6pGJL7ASY0ZUGo=;
 b=f64DyGTo1JhVr6l3NPUb6HmMItcymxmD94DWVWTU+R+BC9ltuZXJcjk9SvbDnLFX1y
 YXyAiiVOn0IVKCUKMl1VnwU7Cd1u5A4emp4bMDCW8H+rdMyc58ayU3jDzH7UjxHkKDJL
 BoChi4eQj7SicgIm0HFera0iq344pTaqgfCsLcxzOaW+d4C1A+PAbScvaoesyyxDxM06
 M2E+nGwd0Yzi6qUfPm/7xCsj7jLLIarL/kjUAr71k/EeyZnHmbNKn69htYlXV2tR0vMx
 tXSCwbYMixcYtTDgNNowyi8sA9RlKyO6/+HUYEijv6GPsDKAmSv7BNaAlUgaZ+EpTxDQ
 Y8kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGAm+5ILaw/CIfN6roUMEnmx8R4PrOkkQvXE32DcBOnuPmTWsp9+8Nc4xvnnW7Pfz/vKg0fmY9/zzVnRpCBOz0QB0M
X-Gm-Message-State: AOJu0YzApTUUmNZNtZ1r7OE8NKC2iBWwBvBjGr7qEpN58XrkmdYE7+NN
 +C2Xff7ECZ4+PSddXLh80bgLBryPqXmcQi3/hKKQkFTDsc5OCf8gRy29jpPajpU=
X-Received: by 2002:aa7:d799:0:b0:565:f782:10ef with SMTP id
 s25-20020aa7d799000000b00565f78210efmr1844352edq.10.1708963588092; 
 Mon, 26 Feb 2024 08:06:28 -0800 (PST)
Received: from [192.168.69.100] ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 bf9-20020a0564021a4900b0056626973bc1sm104394edb.38.2024.02.26.08.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:06:26 -0800 (PST)
Message-ID: <730fed32-0c79-4aa0-8ec5-141135dce2cd@linaro.org>
Date: Mon, 26 Feb 2024 17:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/41] Add clock_isp stub
Content-Language: en-US
To: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-19-sergey.kambalin@auriga.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240226000259.2752893-19-sergey.kambalin@auriga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ReDAZpe+MGWc

On 26/2/24 01:02, Sergey Kambalin wrote:
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>   hw/arm/bcm2838_peripherals.c         | 6 ++++++
>   include/hw/arm/bcm2838_peripherals.h | 1 +
>   2 files changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

