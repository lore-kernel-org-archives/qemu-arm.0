Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1491916lfb;
        Mon, 6 Jun 2022 09:26:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNIIiG1zLR1f4gjvXWfcNgob+8wssZi/kTQs0G4pwkh+noLsnyCh35I6vwu1wBLkniDmLR
X-Received: by 2002:a05:6214:c41:b0:45f:380d:2f6a with SMTP id r1-20020a0562140c4100b0045f380d2f6amr72038674qvj.54.1654532807960;
        Mon, 06 Jun 2022 09:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654532807; cv=none;
        d=google.com; s=arc-20160816;
        b=LDTFl2BxFOuciuh+vldWGs1wDLQe1oWgpJkUzQmy5+bTrFyJjy0IgfbbsW2bnx/rnn
         eN/cAMtwGpoo1CfAAEtegFyNBrQ2VaklRmpteDJY4o4jAxfSI5N6G99mZI6uTbJo0+9N
         ZE3AQtalprhgB3G1BG/OPRUhYsKbhCy12C0GoIhER6kr1vW2Y4Whkyt6Nv5GWFMoI44Q
         jp0IjHnExPiTYWBG1ptlzuGZTt2SqPaVnNB2ZocCC1Mk5fFe8lDJR5pbgSq3HIhSsT6F
         iohCwJFFKIEB4KQ7NqvGqdlVrQUMNxVHYt+3Ybg3DWIyvUbcJM0tPHsHHqW/Waw9plum
         IydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vNmtWm60jUY8ST/y4CsCZs9u/UkYeZ6yUlP9MvlITPk=;
        b=JL39iHzbR1/WVPUKkX9dsFH33I1wotffSxMFA5bMKDvZSaIxgzbSeLVzs3pwHM/kx2
         7tCjxCRAB7ISGUeIjIpYn0ibb90NMp5dkHxTbIY7T32JOVrz0o+RGaG6jWZNlBRk6C7v
         m6DeKauHqyawxTrPmNCuU9BJuVv0s107gENxJpxcqVAK23rv1wQmIBjnJ8PFYH9nRYE2
         xNO8Mv/s2bSbDPax+vcvulU79+O+MqXVRd08+FEjfxM5cKoH+EbmFhPQfUoe8uHDB4CS
         ePdr4jNPHmv9zkargJ5RJdnBil6XI1YI5qhfXzrEu+Snui3ZhVskN+eL1kFPwLKfs9Ih
         ZDQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcn5DPF9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16-20020a05622a001000b00304e126c8b3si5586345qtw.617.2022.06.06.09.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 09:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcn5DPF9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyFZ1-0002zK-Dq
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 12:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyFRz-0004Hf-Ph
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:19:32 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyFRx-0001Ll-TL
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:19:31 -0400
Received: by mail-pg1-x535.google.com with SMTP id e66so13270181pgc.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 09:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vNmtWm60jUY8ST/y4CsCZs9u/UkYeZ6yUlP9MvlITPk=;
 b=fcn5DPF9L/HGQAh7IqdrbqyoAOLaMCEQoTEkM7pNNOd+smJxpShaJwYFBxVsQPPZBY
 2HPazh1SoNdmp4x/ty+VWnCXio8yxViBB21OCXKrAi32EDPdhZd3Qfk5VhgHCvV1Ai8k
 AkMpJ35COEQNXIyQsSqNgyC8B+y8RtpJbSaqS6jA9VjDDDsHhzMKA9N3GIGGBKqC6vui
 JVMci9C+GAwLbp30PTEA06pZC5/m7fCAmk1ksfpXIThSLGSQOD4Ep0J2RIA03m2zMPhW
 XU56QR6xbaVzxPpbyUPtpmR5Ce7sp1y2f75nxD2237zqr+1TpcDS63HkkkukOOpjr7Le
 Wkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vNmtWm60jUY8ST/y4CsCZs9u/UkYeZ6yUlP9MvlITPk=;
 b=tYMQLsjGqZkJinIB9Atk+k++svT1XGuV2/fHn/NeC3z8ohoJnL+b/2OTb5nTyDxdTe
 SBRCQx4Etx6bjFYUcGe0iv+TZdSiyHPHjxH9XAhfRLopvO+yFXC9XkN+zDH6u7I26XKr
 ngONKjULEoigFDsO1UQ0WNzDxN9bCq+fooZatArwDJlQdKyGX2F8NXdtFdZlx+B0jMus
 9Dj5J/LRu6/gXuEfL1uXlML+YlHzYeqmkk6OeUfFqcSO+oLdgV6yUl4OBhfNaUVzityd
 +tqdTsljB1yklSOtiTLjqmdkAWxtrEhutxMo0HFRS70SodNtzMPFdm+D5F26cLR/gIMg
 eLng==
X-Gm-Message-State: AOAM533CigzkcaKy4xg4aGSVUn3ZFgm4dz/YMkQD2CBAL3vsUvVq5B4W
 UhHdAeHCkuJwRri8Q1CL6Khzjw==
X-Received: by 2002:a63:f046:0:b0:3fd:a876:10c9 with SMTP id
 s6-20020a63f046000000b003fda87610c9mr6886095pgj.237.1654532368330; 
 Mon, 06 Jun 2022 09:19:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:dd1c:9738:3e40:ffe0?
 ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 iw10-20020a170903044a00b0016188a4005asm10733616plb.122.2022.06.06.09.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 09:19:27 -0700 (PDT)
Message-ID: <b092fa65-384c-46ee-ccf9-b8912358bcb2@linaro.org>
Date: Mon, 6 Jun 2022 09:19:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 20/71] target/arm: Add ID_AA64SMFR0_EL1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-21-richard.henderson@linaro.org>
 <CAFEAcA_HoMLWudYorTmJTgqGPv1mwi8jZ3GkhjQB3TorZCOrWg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_HoMLWudYorTmJTgqGPv1mwi8jZ3GkhjQB3TorZCOrWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TDH6//O3N0c5

On 6/6/22 06:05, Peter Maydell wrote:
> /*
>   * There is a range of kernels between kernel commit 73433762fcae
>   * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
>   * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
>   * SVE support, so we only read it here, rather than together with all
>   * the other ID registers earlier.
>   */

Thanks for the wording.  And looking at those two commits makes it all make sense.


r~
