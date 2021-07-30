Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp552881lff;
        Fri, 30 Jul 2021 13:29:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOnaFlGMYxTeIDe4bNUnMZxlwUczGLsaerX0A4gIDsAtYZVoyLW9hg+wmggViprvVE33bz
X-Received: by 2002:a25:4986:: with SMTP id w128mr720601yba.7.1627676992100;
        Fri, 30 Jul 2021 13:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627676992; cv=none;
        d=google.com; s=arc-20160816;
        b=IvjIFOyyYZsqYzIKQCMYY1j+Rhvds4d5kWjTf6CiImCVSEkQFnb4l09IdjuHSA1tlz
         GBJ+AedTwRXOasyUXCgKn1WoK3VXu3sv7BbiXkAymJNT68qvhF8vZcsqpoziEfYGdN9X
         oi9tFXmvrCb1KnfBEjLt6269kjKlF4zexZyRcFoAHVFTguL+HT22tVTl1gjOpy6sVg2o
         p99v0YULVYbplUl6+L9B2Cy5PvWF5Do0k2fhUCUNv5wGVO2Kp6K/RERNlThwxNywxu+9
         MXz/7DU6OUfJ8RYyADdWLb4sco0u/1haj99S9DGIxAf+FmgfBSq/eIN9akHiQfTTnqkc
         DwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uTqsnjzUU8mbt6v+c9czfyTS9p3a0IyFHnzjJTkUQ1M=;
        b=hv8+XCO8nZWUEvV3DWD25t8WYkWCQIm4JUa2Qgq87a2FK72wt6OheCzXjSfJqR0Vnn
         r82RHni77MCcDqOj9Pa30T4fZ8KQk70WqBrfmqARtmgvDHcNEgh8e2F6u2I7k7w+F1vl
         CGaXWebgGk00mRs2xEu4c3CjCaMVpa5VLSJSRiFeLVyH0FRTbGuTdXXoOghQjRe5mfDA
         B+XB/YouWttWfgJxWU0Q77qL2W864osZAI0GG05w6aiePcb18WTgDMcGYeXPxule5tST
         /K6odXFRZtMHveACHxscj7zgzPWQHl2AxINIKZfUx7ddSdsOk2Wo2ya3y3wS0yZaMd1x
         VWiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AKbc4Qhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si2639176ybo.267.2021.07.30.13.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 13:29:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AKbc4Qhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9Z8h-00079m-Ew
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 16:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z7w-0005Om-Ox
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:29:04 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z7v-0007N3-77
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:29:04 -0400
Received: by mail-pl1-x632.google.com with SMTP id k1so12431860plt.12
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 13:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uTqsnjzUU8mbt6v+c9czfyTS9p3a0IyFHnzjJTkUQ1M=;
 b=AKbc4QheDIvRvh055sdPtd3WIgh2GuAop3RumY/Swh4yrBHuAVl67q/khbVAlYtAEy
 A9J/KeKM4NBeOBuy57dYlb2CgvUK1ZbKobDyT3KfI65bauEVPsfqnLgK2xn0TyUsCi1k
 LtieJUPPr980JApPcJZTRGB1JtfAdlrNVbSH3BAZ01x8rHCmuPh27kyGiU3W8QlJZPzo
 qOX+PuCr4S24sMHlbtrcmg5pkMf/f7FpJEG9MYVRQwu7kjY5HfWEnOxwruRCTkigW41B
 n3vB0JHztSd7NlloxSmY1USJS6b/DhMSwDTCMoKttBiF8Ai99/7qrw/zM7/jv0s1MySC
 Kgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uTqsnjzUU8mbt6v+c9czfyTS9p3a0IyFHnzjJTkUQ1M=;
 b=HZHE8N/irf3Yfkm3L/jF3glQg+Ffk9IHbmhOU+g2eOOcCkMm6xNEv7Eap6xIhlk7Pk
 Z525I2MBG9HT9EHoe9sMPd83K5iUhZ2BYkGxgVeUehxdNkKXmBO+7E1RHJ8a6ZG23bgM
 gGK46on1rtdqQqnym7lhpivTwpNDO7WYcI8oIXvABH0N2W4l2D+rnjNHjPZ4uoWKVth8
 zFkA9HZxe39H4MUjve5Pc4lqB1vFtreLAsdPQ0xMBjMpVq/Y34jKDVQ7BL+pzY9EqkaJ
 iqgTowk/TodClHUiDOcbrsfEDZDHZM4RiDd80XgdAIj70SsLXQbw8D3WeD26bn3SIQxB
 JZwA==
X-Gm-Message-State: AOAM530XYa/kguK+xl6KrVupYyfaPoXY6G6bVDFZQ0ioVze+gtrTovSl
 EHtxfWA0SFUNP7Xxwve7+MWeLlLz5kt8kw==
X-Received: by 2002:a17:902:a9c1:b029:12b:8ae3:e077 with SMTP id
 b1-20020a170902a9c1b029012b8ae3e077mr4100189plr.75.1627676941869; 
 Fri, 30 Jul 2021 13:29:01 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id u21sm3408117pfh.163.2021.07.30.13.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:29:01 -0700 (PDT)
Subject: Re: [PATCH for-6.2 50/53] target/arm: Implement MVE VCVT with
 specified rounding mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-51-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <910957d9-91d2-5aa5-912d-e8a820ff4569@linaro.org>
Date: Fri, 30 Jul 2021 10:28:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-51-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vdJdazOCyDh6

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE VCVT which converts from floating-point to integer
> using a rounding mode specified by the instruction.  We implement
> this similarly to the Neon equivalents, by passing the required
> rounding mode as an extra integer parameter to the helper functions.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  5 ++++
>   target/arm/mve.decode      | 10 ++++++++
>   target/arm/mve_helper.c    | 38 ++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 52 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 105 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
