Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5048498ejb;
        Mon, 6 Feb 2023 23:18:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9+MY5qyZbe7FwRolH3DX5OQ1m3Fdvwhs2O9I1ozlNLYMW0+Oh5VNE4TgppjstXLJ1vOuoD
X-Received: by 2002:a05:6214:202b:b0:56b:c6b3:e574 with SMTP id 11-20020a056214202b00b0056bc6b3e574mr3696535qvf.23.1675754317675;
        Mon, 06 Feb 2023 23:18:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675754317; cv=none;
        d=google.com; s=arc-20160816;
        b=YQfPjwfkstsJNrSpBf2TcfmtTIBRX4gnzZTk419znu6pF4qhm9FAT89sy6PYndJW/E
         Ka2xGS7uFVmaadM1YJ5hyHo8lJ5RHL2q1SFqDBlmZOS+2Ywcwu9YgEFqj1sgvZ1PtyOn
         wcfOQ7SgZacIPkk+T/jVLIfjOn0VEsnAO3YBMN6CjDr6W1f4GtFrwQ05HWRubjW8p3pk
         CapwsexdEgi1ZMSRR/X+20C1TvTj1jY/SNDP4A9peNEi2o8nXj0IkBYWLuZlBOPuSTzf
         KVyRL2QBpNT7QtkyKtxE859BtKwagP1qNZV8CvZVsqnIWORNuwB4BVqYFhpBEcQQoI09
         OTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aoJp/X2qeP4aHLRK+qPZEOY34PqbOLhVAXlhXswFXQ4=;
        b=FIS0IJId0p0UN5b5XBgBh3IoAI3Ki+OK0+ru8E1gPV3ZHk19H2+4aWJQQquUJ86a4U
         eBnP9XJpSENXk0CqsGzxRBTs/uloBTSib3bjjlRsSnZFgxzHQg/qxl2vkYyDg82yRTLf
         AwUossSMJkIkkN2tHZ96ZR242KqdMO4Ul0EwIxhrzjDmbjCLtPDfdhE3xi0NwqiSzeVp
         rE46AOciqqxIPASD4xfGE47cJzFzJ/F77wSte7dW3YTTUQarr8co7LGqvUys00m+NMNj
         FA4aqv/Ov0dts5wkh+HXyT8iWcmFwYxge64Iy0gALO97oyJVSSeFKxlCKF7G+IbQLYXd
         06uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PNVPVYZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a05620a040f00b00731114e2182si6538382qkp.236.2023.02.06.23.18.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 23:18:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PNVPVYZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPIFN-0000IF-D4; Tue, 07 Feb 2023 02:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPIFK-0008S1-JN
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 02:18:30 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPIFI-0002FJ-BK
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 02:18:29 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so12448625wmb.2
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 23:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aoJp/X2qeP4aHLRK+qPZEOY34PqbOLhVAXlhXswFXQ4=;
 b=PNVPVYZFcqQo0+NAGYZBBOEXAgAS6KmW4hOHJNuwd2Qz8cp89ZN0T11A+TmvXDLSi3
 zNWA+D8W0TUnulEcTetk0PMvZD0oUZro68XqnSR6I34R5y+m8RMfmsMFdEZSH/sG48G5
 IdyCU45a9x/I66/+RcRtpb44i918iDmG3LRoW+g5yLG0C2xrZMtJ/CAUJkIBvPiOreDu
 6MAh1TY6A8mbLjEjKtrXHF+F1gkcmmN/9poLkYkqKVuET+4ILyJH2ef950k3JH+1f9Gn
 fYc8AfeC5gRPHQKsBYVpXT5D+kIRreSNzyma7XeF4Y0oeGd8is9j0zhmkOlCESTemYov
 UZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aoJp/X2qeP4aHLRK+qPZEOY34PqbOLhVAXlhXswFXQ4=;
 b=r1/4jC0TcbmUbtsF7Wgp7YxNoxn1AUF5iPLNdWtjtjAMUBZXAhDPAKArmSQLmCcOjT
 lUMxABgHRdfpgM5tqv+3Vx0YQjlUNSiW/ix9slE7YL933EzX2EUCpKr3Ih/4o8ZZVyou
 //JdCitfPnMDP49sS51JB7gbZS2BM3GaKhFFBGIrisC9+TybFQ1Jn0qPnVImm6O0/isj
 IetbyEhN/4GAEMmqyQJm3n1Y0JeQpAGvHqoluaqXyiRJWtchfaazqlXW4LYYys3f2mpL
 Cf6z3EC6ms8jzcKU8L7o/uj8HQ/NSh6wxc0m2cAMvR8xjSQHWY9HivCt3Jsfnsc8gLlk
 TBzw==
X-Gm-Message-State: AO0yUKVfBiVGFqR5o6Eo6FSPVQUuDNzcOf1IwExPVohHxBYQp//A02vI
 HA3KNo+DYXZc0hjK2YdiWyltpQ==
X-Received: by 2002:a05:600c:331a:b0:3d2:392e:905f with SMTP id
 q26-20020a05600c331a00b003d2392e905fmr2045055wmp.24.1675754306899; 
 Mon, 06 Feb 2023 23:18:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s22-20020a1cf216000000b003dffe312925sm6177018wmc.15.2023.02.06.23.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 23:18:26 -0800 (PST)
Message-ID: <084f4fed-5646-d30b-21c9-0402063ae5bf@linaro.org>
Date: Tue, 7 Feb 2023 08:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] hw/arm: Attach PSPI module to NPCM7XX SoC
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com
References: <20230206233428.2772669-1-wuhaotsh@google.com>
 <20230206233428.2772669-4-wuhaotsh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206233428.2772669-4-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: R3MQCvoCG0+r

On 7/2/23 00:34, Hao Wu wrote:
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> ---
>   docs/system/arm/nuvoton.rst |  2 +-
>   hw/arm/npcm7xx.c            | 25 +++++++++++++++++++++++--
>   include/hw/arm/npcm7xx.h    |  2 ++
>   3 files changed, 26 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

