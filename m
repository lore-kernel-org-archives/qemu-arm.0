Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6411914lfg;
        Thu, 4 Mar 2021 09:12:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5ALxaJHO9/oX8a7ZEmXT3aMem8ae5CvYAG6/vq0r6H4ojLWgOqDWo2rS5SIewCiW2dLPc
X-Received: by 2002:a02:ccb2:: with SMTP id t18mr5058057jap.123.1614877931466;
        Thu, 04 Mar 2021 09:12:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614877931; cv=none;
        d=google.com; s=arc-20160816;
        b=FD/tLnupZBGTzxwT7x3lZMMVPUXqmy3afCCBKADsLpRdFnzltS/dtWkbZjkBLqDLRG
         0zajyCSHkndUoRAGdk1UqY28KRJv3vIxxwj1ISaI/KBsftzMhpGMzvIdkN46ZJueKWPC
         WKnhRB0BP01EY3lgXM97yvGPhRfXzVO/fWCiEVadZHrHsfvL4tDZWPpT3G0o5F9EIhST
         va0Lv3wE9a5lh38I1CR3SVywhdRh/h0SJQp08HBG7/M0JPNwJO99Km59pchmlI4qd0Py
         jmh8jj9VyWkiyofd5qCMFNfWzY3Z53W8OVCk2uyUQdGxyrcHqR59nVlhprIp1Zss66AJ
         ZWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MGt+ihZVtHOBWwg9Z8lGP1hpPwL6eMH1fZ9Un1ypzpg=;
        b=wscBbZpzMAvFMZJetcMXSeh6wMW5hDb0LVX6tj2v7c+xcj4ChPIuyKrQ2SduiEecON
         bGGlBt5ov20vL+yWZIXoITVQF7hV46EHpffDnC6azpRelVJF2Mg+6KN1XMi58j76peP5
         2fHH/o87AOPbVbZw7FBnIgOFu1xofY98esSwhpI/PYaRYuajZNdUs6NQ8DRiapTud62y
         po4kB9so4I4u9kc7LQ2ykJ4SrsdswIKhlD/GsCKgBhxEwIIzRWRoigOQm0ffTYdaw5e3
         JRADpTAJ5AlRCkPhSquLDT1cdjzMZAN66U+P5JTTGYjheSr4LBDybt5f9e4BhHGKmf9/
         sjdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CzdV/bcZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si16393386jao.83.2021.03.04.09.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 09:12:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CzdV/bcZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHrWE-0003Yp-O0
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 12:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrUS-0001SO-Dm
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 12:10:20 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrUQ-0006Kr-Cs
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 12:10:20 -0500
Received: by mail-pl1-x62b.google.com with SMTP id a24so16479757plm.11
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 09:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MGt+ihZVtHOBWwg9Z8lGP1hpPwL6eMH1fZ9Un1ypzpg=;
 b=CzdV/bcZ3PEA0kcX9dtgj+xBuwOqJhEj+P8+0IJVedE47ISZ+HnfEwVTNeFz/wnRx9
 gC3yF0AQ9YM1UG4QL1iRPR5od7iTNGYtr6W0JwFC543hmXfG/mhDIBnXyXqH5jPh+rnk
 sEeMEq+8NKFOVBoTh1b06emKv+P3mTCsT9hvh7F4VVXU3EcWDSwwlWKUYt0poDKeKNKG
 HAfFulfEasuUFo4/3SfRfP/Yzu8a6MqWncA237JvCfBNP1aXjnTKYU0C8IjwUM/8YwsI
 UZDKeXbwZIaJQBocug0cHXNl5ayJdEmxxepcU3nVP4i8bIT9Q7X/+v/aETI71gqC7x0h
 Z7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MGt+ihZVtHOBWwg9Z8lGP1hpPwL6eMH1fZ9Un1ypzpg=;
 b=RAZXlo39x4/FDb4rq9p1jTC3L0uc96EEhTvPVIbdcJy8gU0EWLMgp67igEAxhZHLwU
 fYd4uN5dJstunFzc78pECkIgnEUpP5zOBGoECELlSKONYlpMYso5dFGsCELyjPFfn9p5
 q/jLWkaZCygEGfncwN+ur6CFj/HFSnHknBh92au6OUObzZnbW3vokqmrMC6+USWVAY6H
 VY2VwtJcwf/9TYgXn51NByPb48Q9lHQU71zpqiaoevppwqGKeg//7euRv6VixCaxndxj
 T/eOJinfKZoOKwuQ0NpZvQfImiTzflVGc02jZuo0VVPU40tdc3Mwc+KutXnzanOSCMz/
 5ZQQ==
X-Gm-Message-State: AOAM530u4Tf4FeC5kCmUqHh/X+8TKiviQErCSIjrkMF7QlW1XSp6+FJe
 PrOqsRCsBRJ4Gyxzic5LRyQFfQ==
X-Received: by 2002:a17:902:d487:b029:e4:a950:6df2 with SMTP id
 c7-20020a170902d487b02900e4a9506df2mr4665989plg.79.1614877814669; 
 Thu, 04 Mar 2021 09:10:14 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y63sm3189pfy.68.2021.03.04.09.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:10:13 -0800 (PST)
Subject: Re: [PATCH 05/44] hw/arm/armsse: Introduce SSE subsystem version
 property
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bbddf31a-42c8-4acd-d31e-83868e74534b@linaro.org>
Date: Thu, 4 Mar 2021 09:10:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ll5Ar4dNJdO/

On 2/19/21 6:45 AM, Peter Maydell wrote:
> We model Arm "Subsystems for Embedded" SoC subsystems using generic
> code which is split into various sub-devices which are configurable
> by QOM properties to handle the behaviour differences between the SSE
> subsystems we implement.  Currently the only sub-device which needs
> to change is the IOTKIT_SYSCTL device, and we do this with a mix of
> properties that directly specify divergent behaviours (eg
> CPUWAIT_RST) and passing it the SYS_VERSION register value as a way
> for it to distinguish IoTKit from SSE-200.
> 
> The "pass SYS_VERSION" approach is already a bit hacky, since the
> IOTKIT_SYSCTL device has to know that the different part of the
> register value happens to be bits [31:28].  For SSE-300 this register
> is renamed SOC_IDENTITY and has a different format entirely, all of
> whose fields can be configured by the SoC integrator when they
> integrate the SSE into their SoC, and so "pass SYS_VERSION" breaks
> down completely.
> 
> Switch to using a simple integer property representing an
> internal-to-QEMU enumeration of the SSE flavour.  For the moment we
> only need this in IOTKIT_SYSCTL, but as we add SSE-300 support a few
> of the other devices will also need to know.
> 
> We define and permit a value for the SSE-300 so we can start using
> it in subsequent commits which add SSE-300 support.
> 
> The now-redundant is_sse200 flag in IoTKitSysCtl will be removed
> in the following commit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

