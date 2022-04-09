Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp654505lfq;
        Sat, 9 Apr 2022 13:50:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/43FBzQIOMkUQE24bfY0G4onnFmZyCYblulfddSThO1w9GY2Ek5Tco2tP+LjtFOchw42x
X-Received: by 2002:a05:6214:2b07:b0:432:f7e6:e443 with SMTP id jx7-20020a0562142b0700b00432f7e6e443mr21220354qvb.125.1649537454903;
        Sat, 09 Apr 2022 13:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649537454; cv=none;
        d=google.com; s=arc-20160816;
        b=JXbcFQcRZO1miN2YbcZusWQWeW9LC5KIRkdBDXB3esnca6QuIBE8yUB5ODLu4Jdwx5
         /DvQVGTq+2MyHX15jYQEC9Ro2ic0Vd9QzSP0V81Kl0mAeAKL/27qn+L5irXRY602K4Zh
         qRRRSFYZ16jlbetJofgpsh5d9nk9Nh0IZfj1Sja0JlDxtSEyaQmgxHXHiFarI7SQT0Cv
         FYqlW9mMsm+HneNZkAyeK/5GQOtnYSp4qBnYIRStQDaComA0AGva7EfypdDnhkRyjFK/
         jEW2+FSt6k/ZpWF7ns0D4VerJbtq0IWWCKhQWzU5/kVaDDk2IHn7DEt1F5LzoLx6ChBL
         ivgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=VNpuLewJ4Bg0eOowEp5pClkJz2gT29vLZ7tOoLyNSg0=;
        b=DIEamFKN4aQak/SSNk1LTBpxkhzKruym1ah2I4i+IS/VooDXKByB0eRPDq+L1SDCE6
         xHRkmvo+mScGECqVA/zREfFAanze8rZJdjECpyOjdw2FUkWYennjwKYFYaRP24xhyIRy
         OhJe/Kdkk0x9gKkDRVNTM723lRFhkKzFVtx4pm64Uw/q1+0sYPfNXX1X3w1Agy0pUdpB
         UYN/VClVeOKP2lsB+SxkvKVBIsI08vxULsqFYR29F5N4JRGeqhkyIyxhpJK9PWH74CA4
         G3eBOHtMNKmlT+sUa/iDHQtLzBZhTfqKxlCfqKPkrEdkPo7YR/mtzvnr4Z1/KqavhbDc
         ATVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hlvx0iNb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a05620a400d00b0067e4be23a6asi2691168qko.687.2022.04.09.13.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hlvx0iNb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndI2o-0008BQ-DN
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndI2X-0008Ab-PI
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:50:39 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndI2V-0005cq-50
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:50:36 -0400
Received: by mail-pl1-x62e.google.com with SMTP id k13so5599523plk.12
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 13:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VNpuLewJ4Bg0eOowEp5pClkJz2gT29vLZ7tOoLyNSg0=;
 b=Hlvx0iNbNLySRtV/nXdEVoiX22mDVc6Mfyyf66GK1TscQ62QRVzqVMQWQMfCzWtiZK
 NERk0qm0NkZvC16nQAAGE6PI4LLk7uk1t4wdtpmjPNtAbUEqKZ2ki+2GTdxNsHCjibCZ
 OFqjSAkw5pzdrAigEUl8nyQPUVYQme17b8ui52wQC676pCA9+NTZSznO+1xxZCasCbYE
 rcOdz4wmafB25eKRWyCZ/FjBYgTHwMWMcA91w+1+veoh8opatmdRy33NJvK/sheyMo/T
 v/IiDDnsNb+y19ZZ2ipbANzMHaZVoLw96nzrIg1LoCeTl8RUUUPk4Hz64H/N7GZnBsHw
 WK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VNpuLewJ4Bg0eOowEp5pClkJz2gT29vLZ7tOoLyNSg0=;
 b=rBgb9pO/Pa5uZB/adt7v7VhttIdsbemphX6GqLAIlMUwFs3qlk8QfClS+rI7rvkxrE
 6woVCKKJSTD/+uVQOQtvup2hv4/nVuezxHIp+H/ueBom0uKygA6O/iZlaH5yfBflIo7B
 nu+sgNcC6uM6AvDMAdvvC3mnVLVwYxM6IPSajzE1pIVqWCWZmsICU072s7nw8rUQzYe+
 nasZGV+ujU8iRQVRCvzeDQvU75DPiKJG79H0ZralZPokcVHClXDRfMgLLgMZrIzOq0PD
 1FOP2Zhxi/D6YaZ9DVrDiYECIBUP2kggFPqjPE/6t6QTLKa1Gg3Dp7GLW5xc+wQRhwR7
 /fFw==
X-Gm-Message-State: AOAM531ZQ6ClFGZqM+fdEz2q+Hp8PZSIOHNuNqwhymOJbwj8Y3q3BwS1
 D82HyAfuaAP88V5FxnBF+7M0bgs7zahy8A==
X-Received: by 2002:a17:90b:3b50:b0:1c7:5d55:3cb8 with SMTP id
 ot16-20020a17090b3b5000b001c75d553cb8mr28723659pjb.78.1649537433735; 
 Sat, 09 Apr 2022 13:50:33 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 75-20020a62174e000000b0050579f94ed2sm6724853pfx.96.2022.04.09.13.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:50:33 -0700 (PDT)
Message-ID: <a77c5192-1dda-1815-0fd1-1691947fbe97@linaro.org>
Date: Sat, 9 Apr 2022 13:50:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 38/41] hw/intc/arm_gicv3: Allow 'revision' property to be
 set to 4
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-39-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-39-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /XgB3GSOnyEQ

On 4/8/22 07:15, Peter Maydell wrote:
> Now that we have implemented all the GICv4 requirements, relax the
> error-checking on the GIC object's 'revision' property to allow a TCG
> GIC to be a GICv4, whilst still constraining the KVM GIC to GICv3.
> 
> Our 'revision' property doesn't consider the possibility of wanting
> to specify the minor version of the GIC -- for instance there is a
> GICv3.1 which adds support for extended SPI and PPI ranges, among
> other things, and also GICv4.1.  But since the QOM property is
> internal to QEMU, not user-facing, we can cross that bridge when we
> come to it. Within the GIC implementation itself code generally
> checks against the appropriate ID register feature bits, and the
> only use of s->revision is for setting those ID register bits.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_common.c | 12 +++++++-----
>   hw/intc/arm_gicv3_kvm.c    |  5 +++++
>   2 files changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
