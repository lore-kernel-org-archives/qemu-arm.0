Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp77224lfc;
        Tue, 25 Aug 2020 11:18:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3yBiO98dsnqU0lHXQQHp8lgJH85jE8EJ10J2MUW/Syc82iRvaMcvqPf4pvK8FegW3BUgZ
X-Received: by 2002:a25:d207:: with SMTP id j7mr16563866ybg.339.1598379507332;
        Tue, 25 Aug 2020 11:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598379507; cv=none;
        d=google.com; s=arc-20160816;
        b=sKnDUfDQOaJhBhOShDl0ZOfkY93HIukozK8SvfHiBgmxN4n43IeZ59KTCdDBfyiZzn
         weDEYTwXvQc3AMMyNbnI8+NUev8y9fqHiCbTErEUSjv0K6mj4quNdbqQo6oSHwQSHkDs
         z9KYW1Q3XhNLAkmLNX8Lrz+VZi+7BE+kKGtJx9ummdLfsTuA5K7v7ybWeJFYzkdayeQe
         UcAR2RQclLU68GdchG4L2Lzstneymc1q8wwKaLCQQ+pnDu3vdK4ml33XO3BU6akJdiMX
         Hwvdu6Y3XowN3VvYeKPx+HURVA/qmmugOdN9nQW2Hny7yjBQRJJZCMyvMpY4fVlbWdXk
         HX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fuTc2zBh9rwXdECeGPaGAqn4nm98x6JdAAQA/2oE9MA=;
        b=OBXWsdg9WLcsvkm+snzhxrcPW+uYpCdElL4fJEDQYogI724SFmWU5xedP+Qs9ds/Ca
         Ay6V4IV+JV183CmNNY5YVSWN0TOXECE27BqKS9oFRU9BIW/kTeP18CPtGEsqraUda/R5
         Tz0milMWypjZ3Vt+N0GsPFars7qXXKTllFWXnJv6YxuoRTf0zMfiojJeltt4idMHE6hA
         U5f40FkQhNIQd5reVLfrTh00JLIQTmXZHl7L4sk3lagKLmdz0VgyjWSodL+ElVNii5QB
         PhaOfyU+76UBV9AsAgUvRCT7hcZBrR+emHmUjbLTC0g4aImB59O7C/tqif8299HaoJSC
         EcWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJdZPUQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si15849002ybm.341.2020.08.25.11.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:18:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJdZPUQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdWc-0004R3-O7
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdWU-0004QW-MO
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:18:18 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:56299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdWP-0006GF-IE
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:18:18 -0400
Received: by mail-pj1-x1042.google.com with SMTP id 2so1666839pjx.5
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fuTc2zBh9rwXdECeGPaGAqn4nm98x6JdAAQA/2oE9MA=;
 b=xJdZPUQIrunrKfVhmctP1vt4YqIav7O0Wf+KFPPO1AEewdM/pEPJ5HOeC6tFMDoonc
 RQsKYfRxiBRqrv7yw2h8FJlfzYau2t6Y0vM39XWSH+yztOcnvhWp1JzY+34Yu0cy+Gz/
 sBALu82s2CSsweZ+FPtYj/yI4B23Rp7oio49wSbbCw8+RYHeginkS50vTRJRCtowZUtP
 gUujAAu6eZV8wTgShjqyVzOjq+bE9A6HQerkDPql53xxc/T2Yye8mqoK9lodTT//ACBW
 5lihIdaHNBWuLDs6lsmOxLWKRLRwP2jf1BMdpzdpjeJjJJWfA/WxeXmcMEUySfCDvfMo
 IC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fuTc2zBh9rwXdECeGPaGAqn4nm98x6JdAAQA/2oE9MA=;
 b=nwHLkB0BIv8Qa80P62wTVH8jPnC2i+GhXDYofRlT/yLscQThOp2iFPqaDDSXJGpv8I
 wIxBs2vIEe7BZV2F9khmVZAUThG2Ar4w5iYVCFStfbAbZD4V4Uqw1Xf27iPYViYO8yxz
 V0jd0eOHxtZlQX0UZnUlHbzNUNycrH6T3dP3NiARvXT5RD11saREshuOHKx3ZYk0T6sg
 zAw/F+6ZOmF70QGc7BvotqFU5gBw7JBomaiLEtA9N6/lCmjf2itxiPCNotjTnyrOHSIe
 stkDy+vHRf5baungWW8ql60Pm/26r/hX8/pVt0veWYt7f7+Xi6xLjVi3IddNXZ6huCpN
 y4Jg==
X-Gm-Message-State: AOAM532WA9xUkR1BeISOmPHFXAyAb5DrAMje76LEXMZ4vV1ovYRHdu/K
 qM1se7i8+AbunfGCUQUYF5Bs8Q==
X-Received: by 2002:a17:90a:a61:: with SMTP id
 o88mr2638707pjo.201.1598379492045; 
 Tue, 25 Aug 2020 11:18:12 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id s129sm9817343pfb.39.2020.08.25.11.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:18:11 -0700 (PDT)
Subject: Re: [PATCH 04/22] target/arm: Implement VFP fp16 VMLA, VMLS, VNMLS,
 VNMLA, VNMUL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e45bef6-ff33-7d65-5af1-fce55cad7e80@linaro.org>
Date: Tue, 25 Aug 2020 11:18:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8dIxgAPsgsMH

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement fp16 versions of the VFP VMLA, VMLS, VNMLS, VNMLA, VNMUL
> instructions. (These are all the remaining ones which we implement
> via do_vfp_3op_[hsd]p().)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h            |  1 +
>  target/arm/vfp.decode          |  5 ++
>  target/arm/vfp_helper.c        |  5 ++
>  target/arm/translate-vfp.c.inc | 84 ++++++++++++++++++++++++++++++++++
>  4 files changed, 95 insertions(+)

Same comments re the helper types.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


PS: At some point we really ought to inline all of the fp neg/abs helpers.


