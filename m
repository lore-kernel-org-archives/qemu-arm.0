Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5862614lfg;
        Wed, 3 Mar 2021 18:16:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKaDkZoaIyZMMExTm++/gETATGYn/vEStSS60Ia3RqdC8xXQOxhw2A1ua1o8acRfhhbgZT
X-Received: by 2002:a05:6e02:1d8a:: with SMTP id h10mr1934705ila.224.1614824207184;
        Wed, 03 Mar 2021 18:16:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614824207; cv=none;
        d=google.com; s=arc-20160816;
        b=KwSLZF5LRPeTgI5s/yl805l50LxXveYlQ5hdXff7vXZ/jajk9h7A/lAf++TmYEoZNu
         EUcj+D4CbrPSZpd8YdXs0wGsqBVVr5PskTDbFISYC+EwnZ7c1A+tFiew6uMxqg+fhPP5
         YxrpM0+ASNpXGnbPd8yObLsjcpH+LV2hJShRgcuactgZzwEfukssUnWecM59TSkf61lp
         tynIiuWf/TkOPmQ00/bzbJtBIaofZQ3ArjU9Mfjzx7b/xJhYm5eBN5K5mRKs7Hk1U0TJ
         OW61X9GYKvoHYD4IMaboB4oHpGzWPbB0c7CqXhOtIY7IJ0X6/IV7CTorXXyX/8MbSt2k
         2zlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=J1HqcBUztnKP7LpcnCgs1Y1m/Tm/ZANgeytrO8AsuEc=;
        b=UFSuhWhqnBwypKZlToKkRS4o9JNnkl8SqFRfBno2czd4jbIuT2zZv3UaAM1RxzkU3E
         Ln3Qio2aDTtsmhp+IN7zgtYxGs5p/RxFeQ8eMi48yJsyZTzdejIjf8PeD34jGaLMLhid
         N+ylY/uKuSbfuOsZ53qYtzaiB9MaolPYdVXWjWkhp1h8tub8kIeccdw43I2W2giaZgPp
         skHlGuFqlUg3L7gCWG5bgBTS6HFmNwddZdjOtWetRSlSb24BF92+iizOpVds91f1UJa2
         mlAevryePNqroV7wnhcmzeo4B79tCqers+MwMg88qeB/J4pSqaHdestdoXcuvDDc4xBA
         KnEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPplATN4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si22468155ion.44.2021.03.03.18.16.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 18:16:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPplATN4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHdXi-0007QH-Hk
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 21:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdXK-0007Pz-Cc
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:16:22 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdXI-0006ao-R3
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:16:22 -0500
Received: by mail-pf1-x42d.google.com with SMTP id l7so13566117pfd.3
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 18:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J1HqcBUztnKP7LpcnCgs1Y1m/Tm/ZANgeytrO8AsuEc=;
 b=yPplATN4hkZUZYpL+KBe/tSertGx43/PKAXYMbFxLu4V3PMkcYUnkUVtT/1XfC+/n7
 R3lPyBaeXkQ2LijdW7gb6hr1TgwEy5QiyMuDHFn8Is34qtXfgTiGGLIE9u5qfiNZrhbF
 Za2ow2lrWIA9Qj2d5TRqcnfgYyD5AJWMzWl9mrmSW3jn1oLVyJFFx5YKu40bQ/4gSxs3
 frqNyTGGJ++/Mv2gOtMVNTvweNjro8fKiUiTJy7BHj1ODAkm247J2HqP9eCNXAZORhyN
 Tuqr6xxX+zYXq2UUIrZWKRQxd19EngsQ6tHpmcEe0vbVA6fOyCdFsXtW4jz6BOwkt2jL
 wEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J1HqcBUztnKP7LpcnCgs1Y1m/Tm/ZANgeytrO8AsuEc=;
 b=GUxstjGaB4cl/8KXghHVThDggujlCPunCc86yP52W8KqTSK8Mv0ExarFev/frKNgHr
 v0aiBmSt4csgd2Ug5vzwimdtpfIglGHTferxyQk1Xkib+ETdhz7TIvDgI4DdjKZt5qvi
 mP+qFAjLqu4lpz6nc3YbYU4sywuN/De76YmC67ADQWe3wH4xjrg/5HX8uGqLn67hKMrZ
 6NY922xwbVy7VbzTrsClKNDLhjDQbUl/qUmhsRIDjjcuzGcS2gxrkjWYyAkErpKZvuRb
 9AjKMSpCmqAQ4EsSYFFfcdXuLfuHwjSABrPH42N1J+OPVuA8wGsXsbkYGKj4PI5SFUVK
 aGLg==
X-Gm-Message-State: AOAM533ficsB0xVf+8YKxnosLeDJq/eZ8aZItJrJMYNMdN1KoInJLp1c
 Gdz+1Fipciyy/F2fADkLeRr6ng==
X-Received: by 2002:a62:8445:0:b029:1c1:c862:8fc4 with SMTP id
 k66-20020a6284450000b02901c1c8628fc4mr1585336pfd.77.1614824179205; 
 Wed, 03 Mar 2021 18:16:19 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 68sm12386165pfd.75.2021.03.03.18.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:16:18 -0800 (PST)
Subject: Re: [PATCH v2 21/24] hw/arm/mps2-tz: Stub out USB controller for
 mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7975259c-9fdf-0eb8-effd-c47028bb028b@linaro.org>
Date: Wed, 3 Mar 2021 18:16:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yI0pC595K8lj

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN524 has a USB controller (an ISP1763); we don't have a model of
> it but we should provide a stub "unimplemented-device" for it.  This
> is slightly complicated because the USB controller shares a PPC port
> with the ethernet controller.
> 
> Implement a make_* function which provides creates a container
> MemoryRegion with both the ethernet controller and an
> unimplemented-device stub for the USB controller.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 47 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

