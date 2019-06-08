Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1548449wrg;
        Sat, 8 Jun 2019 12:38:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCtEgcrp5KDvgIqYfkBmbXnR0CMuOXPJYsqOVnSsF30z+CFceuLIWib4s/lUsAU9HS8mYl
X-Received: by 2002:a37:bd86:: with SMTP id n128mr49011318qkf.318.1560022690370;
        Sat, 08 Jun 2019 12:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022690; cv=none;
        d=google.com; s=arc-20160816;
        b=ubLBvjgIGWKzu4kLSwy6Vugt4YSwyH7nVJBhfPjSWgiRqv2n0ZA1LAVBlDGR+cFSRd
         5THO4NyuYcxZ7UbupmiY1wpJIQq/7+n9YLS+zeAwiahnkPK+X89DvKfsG5oAxxCUrpbv
         WP1+DYLxylagPSNUywPg8r3Ob2TYdDCVSNt+zGMlMl/rAPI6ABuKOSO/vE5ew8uhvZ1o
         l2JaELm++ou7h53mP9tJtPevVS4DTvHhe1YdYVTGtcZoSVwisN2GubBgS4+0ggwKRE6B
         iZ+B4u7j8Qy0/qQ0segZWpft+xcw132NW7S1VwqFi1xVmSJXGvymDoNQCA7SUEe9ivVI
         LKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=JoR1SjWnwESl+oE1fv6KVo2bguHNcd7Kf704UAmfTZQ=;
        b=DHXD+Ett9OGNvUnwK5OgEyyyec+krnZAL79O4QltThFqZIQsx/59CkLwZqDfOVbb8K
         RBZkOzPd6j5BUkeL9hjZshUehCQDFf1+WQBZ7ilf0BprkP4Qv3ihLIDsv9AnYFbLkjX+
         fMPpcN46LcFjQmNmdKDbP3ZNQBpZd5Pray1QKPXeF4sMloF/X4sTyvDiBpPUu9wKxKq0
         zPRpsXuWYoqR6RGwMtEtVL8pgY+xKxypem1qpRebVtkDynC2vM81XTylIxZKB/fuoMSx
         3i99nMSUynA4iIFd5QA71tIImsCI2ID5x4CUlk2aMGo8yhGdi3SoFQbw9ayeS10E8TkU
         ZKoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T3ezc+yY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si901181qta.375.2019.06.08.12.38.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:38:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T3ezc+yY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhAH-0005xv-U6
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1A-0006Wk-BW
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh19-00073k-H9
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:44 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35016)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh19-00073D-CM
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:43 -0400
Received: by mail-oi1-x244.google.com with SMTP id y6so3721141oix.2
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 12:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JoR1SjWnwESl+oE1fv6KVo2bguHNcd7Kf704UAmfTZQ=;
 b=T3ezc+yYs3zZjk1UzhnINZWIhJ2WrzxKamCiwg9Y4RZCspJXl6/0I8BFz/IMb57SWq
 A5q5YT+qAotIagV1RxCDJpRKhn4zFQ2okPIqCDfTJqw+3rBoZD9ce9HWk2IlQ0Yz4X0F
 Q0pudbyUC90rjUUc+9BGkapfwOuIBYWseazRz0lP/fSbsJJAPK4WL0xQ5TTEuOkVoHZ6
 e6SiStoQud379XGXxmwlzwnQTcOBTX8fpn4ymS1UsizFWUrIGUIQEOnOQmAebB3aA1k6
 H3IDMBMXln9E2djKqSVULF5ewCkm8lcHT8zTnmqefejNVngGYhwRw20SlWQYTAv0ZXYS
 bCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JoR1SjWnwESl+oE1fv6KVo2bguHNcd7Kf704UAmfTZQ=;
 b=EQWQmqEjLhXD+YWnOcAZerIfYTkltU2PUkOpylMzbk4BNl6ch7g5K3uL2XER5KEr8r
 Tc4i5ha0yO0a8a7ycAA10RwEV7lr+5rLy3KorJWkATphISgt4Zw0joHpXJsh/CCDAPOe
 7j9XvfpVSNd1oXumegnh2UO7koW5c/BuRgYsLi8NtO2h7QUkbtJJtnDQtmP/9aXewU1v
 mcF2pGGA3vSBp6bvHhsFM8LfwfEVOi/L/aVh7E3juu7kM1YBZhx3K0USjAFfMjG93NLC
 Y+5j20SU09b1oKEv0rbUnX41KnofWBvwzwaLqr83cGndluUFJcrWCa7KXIx5yVYVoh5o
 LXQA==
X-Gm-Message-State: APjAAAW5aMvg4xruR74ZSv0jHW+MKXNZ1o4b6/dRc1USnYkWOQeRJwO+
 2UNsN4Ffc5UMekTLlwu/xW3Vpg==
X-Received: by 2002:aca:7507:: with SMTP id q7mr7840925oic.87.1560022122570;
 Sat, 08 Jun 2019 12:28:42 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id 37sm2562333oti.45.2019.06.08.12.28.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:28:42 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <24d3e75f-bf63-beeb-c06c-79b11ad917de@linaro.org>
Date: Sat, 8 Jun 2019 13:31:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH 26/42] target/arm: Convert VDIV to decodetree
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 26qY14nA4KB1

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VDIV instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 10 ++++++++++
>  target/arm/translate.c         | 21 +--------------------
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 16 insertions(+), 20 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

