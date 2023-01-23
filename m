Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2751336ejc;
        Sun, 22 Jan 2023 23:30:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvc7L9tpFTOnyPvQEaYp7Ha1j4X0//g2sQO427Dom0nO9WffF3HZDY1Pzx/Kw9LZ27bwMzZ
X-Received: by 2002:ac8:12c2:0:b0:3a9:90d9:58be with SMTP id b2-20020ac812c2000000b003a990d958bemr34815548qtj.56.1674459014948;
        Sun, 22 Jan 2023 23:30:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674459014; cv=none;
        d=google.com; s=arc-20160816;
        b=aEa/c3C+nSyl4s2yJW1Zik3WhLMszqQrrmrlZYMgfIDY9zM+FGZBTSjr+GCCufx7uR
         zh0I2H9WzFNx8pA+KrTTdrMeuStvqYjRktTc4XsDel+Htjs2xSO8dCXMypr49tyLCXgU
         fhY3YoBobDfuGUdu5imR7PFl7GoyZD02fcx+y+hvuFS3fm3wrHvKNAb1yEnqRGEU00Xh
         uWaYVpGhDRItWuW5LKvhMgVZPDxdpv2teDrbhvzT9yTU65fixR+G5Z6o8qISDzxr/ohT
         CIAugK0VcdNVjVOoEOV/ZFwBbDPb6vveEYPTASvVIrB6hBA8WQ5JFkqmEPKphiXnt2od
         3Jog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BOUisgqUlNpSS6htmfq9yKyIBS8hQAph5eip8NaHiyY=;
        b=X+dFfDr+5nH70Y37tEUdP+snva57RiVLr8GaFp985gLpFOpje5QI6M2mfwlT/fHWiu
         awUsjZmiqI2fS6XjZsQ2LTsHKvbNv61h/zmu0A1ZpMVZXSHayiiscBRCFreS/p4s2wBb
         VD9rBgUXSdrQCGToP8EoudqGIVri7mvJwDuxZT3Jh9dBOHulF2RRDfiGin020zzf5sUb
         WbsDFxc60iXlLuKwPREiRwefyH7WgyD5SqaZ7kMiRW8npWgOByL8NRGsYXCAhpklTsis
         +e9tncHQG/KJqzJBozmIIRPzdvJD85WPKwqorRG7bFrqx3rkeguorOXjrST6+7xhe6bs
         z1yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jVCtm2qg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10-20020ae9d60a000000b00706321c7cf0si15579270qkk.580.2023.01.22.23.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Jan 2023 23:30:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jVCtm2qg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJrHC-0006bX-Ul; Mon, 23 Jan 2023 02:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrHB-0006bF-9c
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 02:29:57 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrH9-0006lW-Gr
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 02:29:57 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so7815526wms.2
 for <qemu-arm@nongnu.org>; Sun, 22 Jan 2023 23:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BOUisgqUlNpSS6htmfq9yKyIBS8hQAph5eip8NaHiyY=;
 b=jVCtm2qgZH6MYn4A5rDH7sbZJu7wmlB7S2SMmuVIR87HgQ4FnxK0xIyCNlUq3VbDZr
 M+WsFO3+5Yyt5IDBiSzeV4BFZRqaqtgWI/WkZYFg3dnRKnK7EK/HKk1Wtuug73mez4WP
 xSo3Lw2D+d4uZdKUPcZrQDcFmYzXUH6KpAv8GJWKoD+u3Anzl7OSFZ9EsBKGlitrvP0O
 uW3uk52b8ueTEvj4vlG2XkzL5oCcDR5xRxNBNLoNE70EAJtRQ7znONy9hA7Q2kVAoMCz
 +xYZRpJYeoLBccRrPEaDdQU7DRIfS09NABaXwIQmFb6BR6dIouV0UrDzod4OVkXh9Bj7
 XIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOUisgqUlNpSS6htmfq9yKyIBS8hQAph5eip8NaHiyY=;
 b=VqxtkNpxdf9hU6sF57X5AgfQ6sazL9qGji20rp1/UBQby0j3Ezz5yO4UVGBZIW2pBQ
 k0SsyX7AelsUt3+Q5PXHq0qdCGpIb4b89YwPS4gVlxAD3N7g3NUv7omCrZ/k6xlI9z7T
 n2bsy9hWzJ+CitdS6EzoDjhdTa9A4ADcbw+oBPr1/ORa6tujpS+rmXhDjN7AeUlbDngX
 k50OWiVVDRFnXqe/ksvek4oAfquBgOOxysf8tg4il53gG7aKPb09s9ok0IoV25BgjcMM
 j53ZjiHH0a6J3Z4n12pHRnpoSf450nzDi4T89jUjWp0qVlwoSRXoCY+LUJQidQV+E+1T
 yNhA==
X-Gm-Message-State: AFqh2ko1+yqt4HJexqMi4jcPbt8GUj3QNqtpxMORdq/xnNl9biaKFB4e
 7IpgCX8g8ppzRiszkwEv7HCCNA==
X-Received: by 2002:a05:600c:16c9:b0:3db:222:3e0c with SMTP id
 l9-20020a05600c16c900b003db02223e0cmr22765247wmn.33.1674458992795; 
 Sun, 22 Jan 2023 23:29:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002bc7f64efa3sm33996593wrw.29.2023.01.22.23.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 23:29:52 -0800 (PST)
Message-ID: <08362288-ac57-6d96-d9c8-aad708001e43@linaro.org>
Date: Mon, 23 Jan 2023 08:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/5] hw/char/pl011: refactor FIFO depth handling code
Content-Language: en-US
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-2-eiakovlev@linux.microsoft.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230120155447.31702-2-eiakovlev@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
X-TUID: kp7ngFfHvVwd

On 20/1/23 16:54, Evgeny Iakovlev wrote:
> PL011 can be in either of 2 modes depending guest config: FIFO and
> single register. The last mode could be viewed as a 1-element-deep FIFO.
> 
> Current code open-codes a bunch of depth-dependent logic. Refactor FIFO
> depth handling code to isolate calculating current FIFO depth.
> 
> One functional (albeit guest-invisible) side-effect of this change is
> that previously we would always increment s->read_pos in UARTDR read
> handler even if FIFO was disabled, now we are limiting read_pos to not
> exceed FIFO depth (read_pos itself is reset to 0 if user disables FIFO).
> 
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>   hw/char/pl011.c         | 30 ++++++++++++++++++------------
>   include/hw/char/pl011.h |  5 ++++-
>   2 files changed, 22 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


