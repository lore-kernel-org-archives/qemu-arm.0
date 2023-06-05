Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2679156ejb;
        Mon, 5 Jun 2023 02:59:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ57KDjvOAOasXDTXZeACVePC31wG0McKf/5lex5LZcqpF1N7BayJ89Fz67WKrdUU/NSmFys
X-Received: by 2002:ac8:5851:0:b0:3f5:543:4c46 with SMTP id h17-20020ac85851000000b003f505434c46mr7081182qth.53.1685959175506;
        Mon, 05 Jun 2023 02:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685959175; cv=none;
        d=google.com; s=arc-20160816;
        b=HrKoNafTc+6RFdnmsAS1VZS2AIeYQkpLmPRis5pMY8/W3qs1iMVB0k5qa3nCBGcvMI
         uZvIJAoIPWkohgBoF6FuQl3n5tzmAxEDCMvuuC0X9fac+9XDtIiIv7RJkXbduYDwYaT5
         2QNSiuz9/lbLFcn8Y/HrjIenP/ryTicz7VYvXGptUDDncHg15qyybJKvWtc+Ayh1vznD
         lxsDN5api842lx7VB192QCFp/A/OygYOGGmfxBHSN5+sgC4hrFxbaqzzwqx/tuWFX7B1
         caAomgjUlhLtXM8+4ucb23xOMyI+G4Ztu7WA2r3Tx/22N75HLeAC4VLDlTt+z5za6tQR
         +g/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=bjMRNC2yotteCj6C50qyqJLR6Xov9v2hEUZoCrJ8ANo=;
        b=R2AFmVxmbdIplhOJt2laIkSY2RqflrzNuhw0/tvBp1RF2lAn+/kjSY62d8PJ935G7k
         NRGfeuzT0tnSDVjyiuhPFmVjoU91Mj/z+rLH9NuKKz4RfxuprNJ3+E9X8n6uJctCaGwt
         hj7RfwJKt24UFYFqwSY3x1i0bScbcmPdwo7dGtpwx2gq/gU55zruMFzKKKFbbEDQQ0LT
         zYZzilcVFfrafV9LU/iH+cEpN8NQOUaAFKVqpGl2H+uIZXGR/9bGhze18L5AKr9tQ8Au
         aluTveoJTHZqGLapRM7YOvgbEZcrQc6OlDvSqvQXHeAxGVXJgAXrR5es+KBlbeEQBDg2
         wP/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wcdyl2Rr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ac8594a000000b003f68b7f34dcsi4550304qtz.340.2023.06.05.02.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 02:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wcdyl2Rr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q66zk-000349-Fr; Mon, 05 Jun 2023 05:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q66zi-00033c-QZ
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 05:59:22 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q66zg-00087v-QE
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 05:59:22 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f4db9987f8so7073763e87.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685959158; x=1688551158;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bjMRNC2yotteCj6C50qyqJLR6Xov9v2hEUZoCrJ8ANo=;
 b=wcdyl2RrpO8r6jHKKS0zIZRE7gSWYLoyID8aTWTabpcAUCOMHrdA2dHUwtaQhvhzJr
 eBSiWSb2ZCGJzANUJzLEe45J97TH1fJ/RqCsqDkT1CA5K5HeHi88HuJRK2gO3GKe/HLa
 AnEO1nfq+ZHiqjNeYtMYaYcmuV2/bdIfvCsAkWV9WZwZpIvdEuoFXYBnEGn7T8x8TMqF
 +PXy5R0MybQMlfFCa+LDjt3uE56qtqYP3ANK/AgGE5juwJUYadnxITYjKQixQ/Q1S0nG
 Z/02U7Ppw41VdR2YuuilVsO8OSbMdhurA6ysXADiTcyZ4AOyvZTs6XsnDkFZyCcwYWOL
 ddOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685959158; x=1688551158;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bjMRNC2yotteCj6C50qyqJLR6Xov9v2hEUZoCrJ8ANo=;
 b=Hh1AK6+3hQRVuSsx5zf+un8c7M15ApbJjvtWwSsa9Jtwre22pp2lCxpLUtXPA63/lP
 54/Ew4uQilYuKToX6rVVX3H/yry4VVVAgp91AkOAO/Lg1fLrSy/xQXZyNPbLxmq6M7r1
 l3v3PtPpeQYAzlzK9UU+pzGdoL6+wDx6qBA6sVapd+0OXoJtk/3FuRSfc+GJiCjX/5PU
 DDDm6/6PSwYo8Msb7Lt5LRQ4UmSbJhExZS0W8WW+qFnm5dB0pa/s+tSoLvsBJjFHP96r
 v6/KuAf/1+65Sd8Pwhn0uhJnh6ALqj/YhWkBxHEIuxAwaZRtlt4JjeIcPAxqGJk1o4C7
 w77w==
X-Gm-Message-State: AC+VfDw4LrlonC+qX26s2xkg0M6BZU0wKzF9qgzIWz48waPXheE2LhEb
 eBs+ymG1b7lFkmNz6dsKMrP59A==
X-Received: by 2002:ac2:4ace:0:b0:4f3:78dd:8e0b with SMTP id
 m14-20020ac24ace000000b004f378dd8e0bmr3041088lfp.32.1685959157746; 
 Mon, 05 Jun 2023 02:59:17 -0700 (PDT)
Received: from [192.168.200.206] (83.21.93.182.ipv4.supernova.orange.pl.
 [83.21.93.182]) by smtp.gmail.com with ESMTPSA id
 m8-20020a056512014800b004f3b319ed4bsm1077689lfo.120.2023.06.05.02.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 02:59:17 -0700 (PDT)
Message-ID: <101d301d-d413-288e-9318-d0a226ea8715@linaro.org>
Date: Mon, 5 Jun 2023 11:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Content-Language: pl-PL, en-GB, en-HK
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
References: <20230605095536.117384-1-wangyuquan1236@phytium.com.cn>
 <20230605095536.117384-2-wangyuquan1236@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230605095536.117384-2-wangyuquan1236@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: tGm4aMPdyFNS

W dniu 5.06.2023 o 11:55, Yuquan Wang pisze:
> The current sbsa-ref cannot use EHCI controller which is only
> able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
> Hence, this uses XHCI to provide a usb controller with 64-bit
> DMA capablity instead of EHCI.
> 
> Signed-off-by: Yuquan Wang<wangyuquan1236@phytium.com.cn>

Can you share firmware side so it can be tested?

The more I deal with EDK2 the more I understand why people go U-Boot.
