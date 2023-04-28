Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp472528ejm;
        Sat, 29 Apr 2023 05:15:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ngMTIt7YFmLgHw7hwr+kDQ2mTgEmfqZ7uOkF5nY45gEJmX+ZPvLBdy93vpPfPco3bPezE
X-Received: by 2002:a05:622a:1a27:b0:3f0:b57b:3714 with SMTP id f39-20020a05622a1a2700b003f0b57b3714mr14687237qtb.56.1682770531455;
        Sat, 29 Apr 2023 05:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682770531; cv=none;
        d=google.com; s=arc-20160816;
        b=IfG4vMXTkIV53PiVFpajuXA7Xn0AIOKSCElHSP4VuaMsZ+2fBeH7//A6L4pTb5s+VE
         t67Kw7I5UvejNKhA1jjwcadX4qHZfag5jvvcVuKnRb7R5RGD7gsewy/I/EACcJkDwfNX
         SlKrWlqlMBcz7HqfZHGmtwiGmVEI3fZxuSzJu6V6v5a0xwRqqJYNplUWCnHbwl3PiQTH
         kzoo1fCy5lrQ5Z9Dmnt5Xo7vnTRn8dK+MfXik44bhzWua6GWqnH/PlfDYtEGHI+YWxqd
         WyVrN5xK/Ka83HOdI1UMM/sqUS2+jQCbmVgciNIOWJEXW+M65WyAhs5AOun8/qTNHRQN
         29aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=u9ZwrAq2Hf+I60n6WR3DEY2/D6+veeHyR3VSd/yrkXM=;
        b=Vw9aYVCyAK6swfdiVsVgJnjaFwK5X/1roi+HA+X0KzIM/v7KM9Ksf7RN/NioSHG+sX
         t0wYcdfauxMNrgU7IK6lJpIzf1jyugo4CGV6eC+MheCBiwK2Ko3jkqEbrMEF+kHMCwYg
         m+7mYEtXvcQER9U4Pn8b08sUzBxQREVik06crYfiukKWzUCBSf60uI9xp8yFiaKF0Ezl
         iWebJXBGD5+kDPsInASPJ8rsh2rkp852jB9PKdDXa2MkpUFuqX6c9ynVaQIXco9uEc0q
         Mqj7qttxJd3mi+o6AQa81Ie/YOwePAwiQCJqxS3dZJoHBMFa9YUydTH2MOKZSUBDDzFl
         Vz7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=caJaLGU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020a05620a057500b00742b2990946si14334817qkp.361.2023.04.29.05.15.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Apr 2023 05:15:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=caJaLGU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1psjTi-0002rL-4U; Sat, 29 Apr 2023 08:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTg-0002qN-VT
 for qemu-arm@nongnu.org; Sat, 29 Apr 2023 08:15:00 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTf-0004Dx-GR
 for qemu-arm@nongnu.org; Sat, 29 Apr 2023 08:15:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso6718165e9.3
 for <qemu-arm@nongnu.org>; Sat, 29 Apr 2023 05:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682770498; x=1685362498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u9ZwrAq2Hf+I60n6WR3DEY2/D6+veeHyR3VSd/yrkXM=;
 b=caJaLGU+kosA/mcsqeshHAEXP2hxM58QHunt7mUoP1JXkXImdwSQYFrImGPUWAI0KV
 uyuEmBpe36iEG26piag0Jm+8+CVv1TZaEwN3teikPB3dVo1aWhvPsHyYxBHytr8H+twW
 /H11KHM/WQNRE9F0ZviK8g+H5brut2s0D1IEfavfYXVxMRClvteIevzuf0LhKkfCbzNw
 jS7cGA2Qpvmk3BUadS4HweB7/bbuGiZRafGSj6RnZ4lNrtfHslZ1UKmBmHaqICVgliiF
 R8tLbQaMDvVZpSlXosI7ndJSS0lVpdTPstQj2W7MGqNdZBWonDlJFuZGB7OAubZSCP+V
 OmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770498; x=1685362498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u9ZwrAq2Hf+I60n6WR3DEY2/D6+veeHyR3VSd/yrkXM=;
 b=P07g3DN2YfUvuu7Q3+Tgt3h0P4TSoTPVSR/Z1P8DhmRKfZvFUL4o7BDmZAsEuhHlCB
 E5NuztQFyEDY9D4pLeTGlTFL0DNJlJ/7t7hRBCW1XxVlzgTnocCJjQe6nM2LD/7upyYI
 RmivSvW3pAvGc6ALAOZKr03znCRuzJyZkq8gzqDhqTPmgzKWWNwQezS8yAvtTCnZJmOy
 +2C+NiZe+JS9mAoQVPDHaN+Sphv1/pbzK2I3mp5KTUcDSQqFoF4Cr96rkAOm6fMUJ+Nb
 MpUkd+fNjkMHXvqk1s3QrVpyXmvATbZc+tgKp20FljYcwTIHt9p0IWrNk7zyP96lNtbG
 ceww==
X-Gm-Message-State: AC+VfDy0END1W/BaeZFYTVSv6itIz5cNpQTb5ULZTStbETMWPzL9NAJI
 Hi+Vl2NX3qG0l1AQIKLQlVA7Yg==
X-Received: by 2002:a05:600c:2212:b0:3f1:73c1:d1ad with SMTP id
 z18-20020a05600c221200b003f173c1d1admr6086807wml.35.1682770498091; 
 Sat, 29 Apr 2023 05:14:58 -0700 (PDT)
Received: from [192.168.212.175] (7.red-88-29-166.dynamicip.rima-tde.net.
 [88.29.166.7]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c22c300b003f31d44f0cbsm6228773wmg.29.2023.04.29.05.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 05:14:57 -0700 (PDT)
Message-ID: <67418868-d8d7-7aee-3065-08b6f6691850@linaro.org>
Date: Sat, 29 Apr 2023 00:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/nvram: Avoid unnecessary Xilinx eFuse backstore write
Content-Language: en-US
To: Tong Ho <tong.ho@amd.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, edgar.iglesias@gmail.comi, 
 frasse.iglesias@gmail.com, peter.maydell@linaro.org
References: <20230426211607.2054776-1-tong.ho@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426211607.2054776-1-tong.ho@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: P7cJLvg9cEMe

On 26/4/23 23:16, Tong Ho wrote:
> Add a check in the bit-set operation to write the backstore
> only if the affected bit is 0 before.
> 
> With this in place, there will be no need for callers to
> do the checking in order to avoid unnecessary writes.
> 
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---
>   hw/nvram/xlnx-efuse.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

