Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4429417ejc;
        Mon, 27 Feb 2023 01:06:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+XEnTvT94Dsovs5UwOBTxt2umly5pw6UQSIOE2tT+AtCiKVc1N8C2h5TUwA6MORduMpgot
X-Received: by 2002:a05:6214:2b0f:b0:56e:a07b:f4df with SMTP id jx15-20020a0562142b0f00b0056ea07bf4dfmr46352601qvb.13.1677488800486;
        Mon, 27 Feb 2023 01:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677488800; cv=none;
        d=google.com; s=arc-20160816;
        b=Yi913qlxGKJpWd60+Jh8QxJHlx82h1yME49YC9EQzzMmEKA2+3JUgb7ObB4p8lHN9B
         5i0tyVF/zGzTu84e1Las0eperQFP10ZS5/qOM7xEnDELTmuekk4gcz4m0IolK21YkJOk
         hL7IK4QqW0Y4CysozBhBJlbwwt4wh0juyfIMWGpE33p3jbcl6zTthEPUKSgmTb96dlh4
         Z28n5Fkw/rs2C0fhNwhibtUkunmCTLDfDZC106KDRSFBKjgP9M0f6TaAwqJ9Q2KeDMEY
         vFvCEooS7q31G0bXSJ+no7eEOySiaQyQ7o4TXlqgOse6fzEAC6ZgnxW8PmLYVwN4DNYA
         /f2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qUfnkj+8TrKtAgCfgVEMbz4qz9NEWYnkfi0dsKgSzdE=;
        b=ZLsE7AKe2ypYF0cWoQDk6bO2QbpiXj8LHM6DAK33RYZZja6Ke2wmAJ64K2izdkzojM
         uMVLVXJOAkkcSMwuLAO5LgsYug4NugF5HUn/gov6V7njMgYaMMlt8qyQ1kB1SwK53ScS
         h31luiYY5ux320BnIuzs3HuX5VDF0ZK00fDm+xWo5x2XVnTsm0n0j51IjepSr/Ndgw6m
         Jyxt45Dlk5JftaxgBsb24hcscbPVBcHgtlnMxN/ciTVXjnMrtoa1N+mFZrCONlltcPs0
         nUROJymv6Jbt+SbKbl7sRyYePaUhpAliuXRIZmbt72glBsxOf1OFDzbJSlWOIfxsTok1
         d49A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQLPeqsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a0ce207000000b0056ea60a5c74si6083152qvl.528.2023.02.27.01.06.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 01:06:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQLPeqsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWZSI-0006Tr-FH; Mon, 27 Feb 2023 04:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZSD-0006RB-Cs
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 04:05:53 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZSA-0002AN-Ke
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 04:05:53 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so3340812wmc.5
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 01:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qUfnkj+8TrKtAgCfgVEMbz4qz9NEWYnkfi0dsKgSzdE=;
 b=qQLPeqsqIHphsX9N5iEAF6EbnTIylOj+6/i32CIitgZBWZwkxhhFGlNZGYKSLwoGhV
 m0UjMnwUi82eMTlR4cW1leFNxCLT/qkNx1Pv2InQmS/nYtOSJnV6lcqS1x9omB+0QVhk
 Q2fBGrQCMUUbkKeWRHbVO7t/SAGA8+LxWICJJJrJKOBIe+khotdoT99h86NGdD/qIkDg
 +MnfAbS48WCh9pWjDYJ0Mjl3nefNJAq/PGQz5N8iSFzQQaQZG7dnlAZsbCUFSTIEbaLJ
 0xmNXgaW3Yr8dTw3x1c17EO5VS04sAIq5YiPLsi7CbzxOoeI51BDPcJo847d3SH8YGGH
 R2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qUfnkj+8TrKtAgCfgVEMbz4qz9NEWYnkfi0dsKgSzdE=;
 b=jvSmtErXtNLJfUuw2ZKKqL0cIhddPnecpl7AhGvnTZ9XrUSsNQxTcNCsZl5nlgP8Az
 TFfGeqqp1u6JAA6v2AAeBBzGSLzcz7Ov1Zv++QgbIH1PLGfYIRqjJZdN8bai3cyMY4Yp
 fe9iovXER7WVPHz2EePfM3v+i9NzOidPAjbdrhRxTe0G1ZlqPUNlAh+9STxZfbfZUQIN
 fKU4NaGvsoVjZCksELA+esCL10RaOskBtvo+LSsxWOph/m84vk7NsunIALRdKlGGTZUK
 do0wJ5btmQPGoG4h4oo4vBnNryFME6Cq61+5BImLu8349OAKP1vDKQOFCnpGVL53Vqe2
 1crg==
X-Gm-Message-State: AO0yUKWa9ippPKcKTTPg73gRKiVp+V5ULPY57G9/GYv9CgkNYXErtqo6
 xHycYuAiPAxKVnWhgBHx01xAqw==
X-Received: by 2002:a05:600c:4e89:b0:3e2:5f6:3647 with SMTP id
 f9-20020a05600c4e8900b003e205f63647mr5997954wmq.16.1677488748870; 
 Mon, 27 Feb 2023 01:05:48 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c1d0800b003de2fc8214esm8804045wms.20.2023.02.27.01.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 01:05:48 -0800 (PST)
Message-ID: <57484d75-00b6-e83c-13c4-48d639ed607e@linaro.org>
Date: Mon, 27 Feb 2023 10:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 45/70] target/riscv: Avoid tcg_const_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-46-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0Y/IEBXRpT2P

On 27/2/23 06:42, Richard Henderson wrote:
> All uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/translate.c                  | 4 ++--
>   target/riscv/insn_trans/trans_rvv.c.inc   | 4 ++--
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

