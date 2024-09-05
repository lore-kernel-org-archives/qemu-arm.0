Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp459346njb;
        Thu, 5 Sep 2024 04:55:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMgg0Ge4KtFMnlGLOC7r+KfeoM6o1mWW8pCQCOhA40bkL1BtFuSNDlrAdm7CD1LenzHR43B6pTJtY24g==@linaro.org
X-Google-Smtp-Source: AGHT+IG2x0w8aaDDri9KFPAKioOP0J31+OpED5HmmrFXbi1U1dyGSZt1ltG5s8r4dUhjODGfDoMh
X-Received: by 2002:a05:620a:f06:b0:79f:57b:f633 with SMTP id af79cd13be357-7a80427797dmr2491359285a.56.1725537336773;
        Thu, 05 Sep 2024 04:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725537336; cv=none;
        d=google.com; s=arc-20240605;
        b=LywXm2NHX8vQDdC3QYXp1ZRoEUGeRCrNZugJtOemy+xfqWi2pDKUz0nfZvzdze4Jwt
         9UdFlqdzwc9XmI2Vy1ZeeD/vkmVzlo958MtH7TI0yGmr+oJwIXr3VPW2wylZgpltU3iB
         NzFLvKk5H9MUkrxwJt8i0esWbHbxhw655GFz2PFHqo0l2Dx5IubH9kHt9wowZDcTcjbD
         cYABTo5T8O1q7XYtTdXftyYlLU3WuTeBhVbkMBKl9Xq+8PRHMxTAidu3wvW2BnCuIDQX
         xm3XliF3lOlrNE/52JQAc2aIpANUE0Yq8BEYFMueBq4UFDu47DGTSD3GNd1lrc60oImg
         jHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=sfHmpBluUEk97UorwiKAMCpBaYBXciQ16mUNEEIlTbo=;
        fh=jr2mnbFAjigZPatw9fTylAEjCuCCcmNH1mQpnDzqNig=;
        b=e9aOofb6BmP5OMNg8HfxN8q4yLNaES7md4mZgea6HTEyuf3buK9m53f0uWNPlTg523
         TsSxzq7z+Y9q7d/dvudwZQrC+4x/TmeBEBmd9e/VW04wC+1Ap6VvUkAa16HTQTad1sRQ
         sAOBOfMipK7WQS3PQiZ8sBxLh/m5a7n7rGTqi2jFUeY8pcMLe8EgNy2m1pyuoBIw0IwO
         V6s+6MOZnhEWk1oLJAnjOMt/H8leYL51nTKaoXCroDco268n2kxibsDBmJoSMQvSBTtU
         MeNTm4i70i1FMSpKy0ECl9l2moV7pPbca6MIYmTng8m5R6nu3jd7Eh2OrcrobFhmsJLk
         nj/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F7GWWYKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a98ef1e65esi180423785a.143.2024.09.05.04.55.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2024 04:55:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F7GWWYKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smB4r-0005qG-2r; Thu, 05 Sep 2024 07:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smB4f-0005my-Gf
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 07:54:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smB4d-0002ax-QW
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 07:54:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3780c8d689aso391432f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Sep 2024 04:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725537289; x=1726142089; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sfHmpBluUEk97UorwiKAMCpBaYBXciQ16mUNEEIlTbo=;
 b=F7GWWYKNav2/2VIqtDGC2jVh3j4en7XqJ4keInNmMxkCAR1YY48JVyd2WKg/vHsAfM
 f6rXUV4WqL1+3nfFNN+SHyfe9r+tOSZJjFMiv5SqK5/2g2vRwIECk2OI0WkSGY4gjlbn
 +prJjEdDm/YUsTOBqU4vnJ/ag+c4UnZyTn8ftHBw1tOUcQVyU0Io33uSqBpKxCFoXv+y
 xNDP1LFnu0oniaLfYgz6Jd+sf/NipNEHeEwhHmbTdxpU4mWpk4ZlMkR9V3noPJ+5h9p9
 mS6iXGbAzlOpbDuwBUwKQEZ8Ud3Db39mFt5Y9iWZDfvIkFTH0glbbzXONe1bHpl6h9cd
 b1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725537289; x=1726142089;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sfHmpBluUEk97UorwiKAMCpBaYBXciQ16mUNEEIlTbo=;
 b=oTZBH9RxWXmPbtkRWfCZ017JpE2v2IGTD84n9wy02iNl7AjdSoFNlj2zF6ltsjblBh
 iXhYsFxklAxOautZoYc4dRufvkxG/7yNMx900mQ+5XgPR3R6e0366vkHd+nlF0kGJLFl
 HIuTZjR0THsds3AivmtW4aVC32fW5CYqgCPSIOdTD2yrdwf9W8HZmTmx096UxiVt5EWO
 K1TAaoN7tH0x1DO0JIIM/Hqw7IADXQxO01QOhY9zJQD5Gs/Y0Yr2xQEh9+RUmzeUTznU
 f+cgOmCjOakY1lZ9k8S3kicl4LBnEe/g8ZDBQBZXxLmNsdYjf5oc8JFkfpdkaPFxM5vD
 IGpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUancsZGZgq779d5HMKw6ekPwRsJsb8U2tmY7DN1X2k7ghl4Hz9+SzlhFzIRs6ry3MFi51chHwZjg==@nongnu.org
X-Gm-Message-State: AOJu0Yy9qcHNsX8xrPnsgb3RJXkD6XzFU9BB+fQe0cuE76FyNaE/CLvX
 9fVFnbYgGm5N+ro+6YHJNWXDF3SJ6ERn0NqjUncZ3Pc8BUORQNgYQAQJl9Y3pHa2mxbD0rbFg9w
 flfw=
X-Received: by 2002:adf:f503:0:b0:376:37e:2729 with SMTP id
 ffacd0b85a97d-376dd71a9b5mr4455547f8f.31.1725537289353; 
 Thu, 05 Sep 2024 04:54:49 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba7b4271fsm266038035e9.29.2024.09.05.04.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 04:54:48 -0700 (PDT)
Message-ID: <6dd42fd2-81ad-460d-946b-ab1afdcfdaea@linaro.org>
Date: Thu, 5 Sep 2024 13:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 12/53] hw/arm: Remove 'z2' machine
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-13-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: gFYL0vDpVAB4

On 3/9/24 18:07, Peter Maydell wrote:
> The 'z2' machine was deprecated in 9.0, so we can remove it for
> 9.2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                             |   1 -
>   configs/devices/arm-softmmu/default.mak |   1 -
>   hw/arm/z2.c                             | 355 ------------------------
>   hw/arm/Kconfig                          |   9 -
>   hw/arm/meson.build                      |   1 -
>   5 files changed, 367 deletions(-)
>   delete mode 100644 hw/arm/z2.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

