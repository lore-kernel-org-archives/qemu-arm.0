Received: by 2002:a05:6214:92e:0:0:0:0 with SMTP id dk14csp160840qvb;
        Fri, 15 May 2020 15:50:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDt/y0CNmtteCnLvoUJRx7nQTSh0bcN9YAVUN+MmS62PE+UBt0DRe7cR62SVH+M6rvgXbI
X-Received: by 2002:ad4:548b:: with SMTP id q11mr5792907qvy.129.1589583040780;
        Fri, 15 May 2020 15:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589583040; cv=none;
        d=google.com; s=arc-20160816;
        b=030GhZbRhxJASYk0vQ10+A+Q7QJqykS+CgAu8Zke8/AKf1Nkzz0NeyP2QB2V5Cz28O
         hhS2mJ3HSwnQAgAIassQc2BrzliwsCCBEI1vBTAoyd9ObdkoNUbeeUmzVg/VviRNb/y3
         Ib0z7Tv+IjL2/4jO3GXh9w6jjomKRueaZAfJrE0RryWsDroT20CkGfrreBxER+A7gcrE
         JvhNdtutVU9ODIgIa9v39DM58aN06PZsAxt4MdFIkUJ7IXCORJykQ+4mxEOSxYL4YodW
         VhCh2ufBqGW2MBPVsWmqobLmRjWrUSMsXsIOaHHONngEpjE3wM7Xq2ji5fg5EWPXR4w5
         3oJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oi1H+y19DLbIULVXG8f5Ml+d6LyRuAkFYrmphFta2WM=;
        b=Nd7mbBrAUz9EA1FbxBZyT8gXl8YRJKuX4eLsa2n5PHdX+Ettiw1LcH2oBrR/Tkqage
         G9Ubg5DyH2NXtXEUn7t4i398ZH8A8FFvIrqiN7f+1Fc+UyN2b6TBZXCiKpVSYrBOUNTy
         KAor4XwtVs4LKImMN7rbBT/AIjWMr+dmL9UM3llwGiQk78QxI0rCHCk9maUJscJu+2RZ
         DmCXutajqy+5nRmuLbVm/lMaQy4mVyNc8bNCFAsHed8VFtmitPlKrf7Vk0tCaQW8xVM5
         EAhJIbMBJziLQl7TV1FykfmMSkkQzKPDn8wx3Q29n9z42i7zGJu1XJfLD1fnSZDHu/sT
         iOoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGo4g96J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 28si2009747qks.51.2020.05.15.15.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 15:50:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGo4g96J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZjA8-0005AW-6Q
	for alex.bennee@linaro.org; Fri, 15 May 2020 18:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZj9m-00059B-JV
 for qemu-arm@nongnu.org; Fri, 15 May 2020 18:50:18 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:33329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZj9l-0006xG-0E
 for qemu-arm@nongnu.org; Fri, 15 May 2020 18:50:18 -0400
Received: by mail-pj1-x1043.google.com with SMTP id z15so4597633pjb.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 15:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oi1H+y19DLbIULVXG8f5Ml+d6LyRuAkFYrmphFta2WM=;
 b=RGo4g96JrPoxz18SVMoIGCG/1S9yw7hR4c4E5b1E5YfRDOR4PcP/dfhiZzo2gCn5cT
 vJRrnryzdN5VytnSK0ePzQ06ceyXiKcVatE+T7VcwRCHcZ9EsMyXO7wtlCjShttT/yUS
 nsB5o1/C3n6gx7cPTpJZVIhPHf4Ru5rYudfNJF4v5pvCqVycb7vEy6ScDgEWy9+fN5FV
 rMCxxBc/rvFySGUV1tUy+7QyFQMGK74q7x9ZVYAqtS36X71BWjnPSch6KZj2BsgoEZtV
 EWnxvsJFwqDFsMFBixHiX2ChU3u45IY/Ub7E2b2jQ2Xwej88I8XmyPBHt5bQ4BYQn8FX
 GX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oi1H+y19DLbIULVXG8f5Ml+d6LyRuAkFYrmphFta2WM=;
 b=e02D1UXUwH+CFdAI2McAZOo7x3eoACzMORNjLa9Ranjdg+RqTPGrhiqnkcEmGV6aN5
 4RpVGrE7VqNQdSl9VdtDUc2MPBkVH/4vjr/DOCl/WiRbwAmTrgPxLsleMoGZwfrKichQ
 Nec+PAnbWR6Yq3+OkHpcpRFPHX4v7UViB7IpwbZyl1yH9ZnXqrmhOf+XbNdzWQzx/9L1
 FO1u6gSwchErYMVYwkSNnw9WxhYt8xRNKOwBKgGxhRTx1auAbW1fVQEB689RubInvP/Y
 iPAcb1Wj4AQl0Ev+hYPLnnW1q7M3hEetXU3nFoKzjrqUQ3zrc5P3GepYPLktHEPH8dKp
 58tQ==
X-Gm-Message-State: AOAM532M2T3Eirl1Wu1XPcQEwuZsZP07B6viJHO+sZBDZPZFxDEIXI6n
 2gsCUJHZSzRgvSZYp98gmaNwOQ==
X-Received: by 2002:a17:90a:db53:: with SMTP id
 u19mr5664490pjx.41.1589583015485; 
 Fri, 15 May 2020 15:50:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d8sm2474408pgb.42.2020.05.15.15.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 15:50:14 -0700 (PDT)
Subject: Re: [PATCH 04/10] target/arm: Convert Neon VSRA, VSRI, VRSHR, VRSRA
 2-reg-shift insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03386d17-94d7-3fac-3e3c-8d4cf8488ce6@linaro.org>
Date: Fri, 15 May 2020 15:50:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZXjOo1Jv5H/D

On 5/15/20 7:20 AM, Peter Maydell wrote:
> Convert the VSRA, VSRI, VRSHR, VRSRA 2-reg-shift insns to decodetree.
> (These are the last instructions in the group that are vectorized;
> the rest all require looping over each element.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 63 +++++++++++++++++++++++++++++++++
>  target/arm/translate-neon.inc.c |  7 ++++
>  target/arm/translate.c          | 52 +++------------------------
>  3 files changed, 74 insertions(+), 48 deletions(-)

Modulo the extra formats I mentioned vs the previous patch,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
