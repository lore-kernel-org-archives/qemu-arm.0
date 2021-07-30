Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp555879lff;
        Fri, 30 Jul 2021 13:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfKg4O+dfDqAc1b7LI24ncEgRXq8qNvRh9VhNP82v0Z5KDD9PSKMTM7Te7WvHisnwizysB
X-Received: by 2002:a17:906:6dc1:: with SMTP id j1mr4595950ejt.324.1627677247773;
        Fri, 30 Jul 2021 13:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627677247; cv=none;
        d=google.com; s=arc-20160816;
        b=CaqClx10KD1EeAg7CFQKj862/cDcHuZscwCCHgC6f2HpvxOS8qehYE7wzN10XDWpL8
         0CdBWNBC2FlKfUbhonJKU67ghSRpSzOs0m7ckTCP9jSB7DFO9PNb6lpkl51vqU0Lmw92
         BZelz/X9bLRP3xC7Z52q0XAnIkdlvAeBSdMBq6L/YAPDdWxxqBhiNdmLMEal2u1XsT40
         xkomy0wlHK/WDuLdVE9RsG/qNl4Eof0aCKntwyRtEc8bfFVrK2d8WT1S+kKMHWJAgeJU
         rHHhfAi6ZQvC+19U/n+hOirkRq1gAlxhjmB6g6QMr7A20vRDGHLoZFmoNRTnK+Iz7Gvj
         mc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EFDmzefkk3tdwffgmXbSaxcxkRkpMcHi0LkfxkXHGdM=;
        b=MqA7A59OVexEEC+Kc4MPRMWHLvCpSaKlgh1LuJz1j7HixMh84rxgvhLD7fpP1LcLNt
         7cD0z+ZTtAbetXRv3vPTYQ3pKRogRWcjTyJYE8/DxEDbV9vOX6UWuYBTKMu8S2AtifGW
         4ciNk0UpFV1BW1ctxjexba+G3A8ONw91FPfoUe9zSFgwbvXCTX5Yp8IaFbVrNJvly1jO
         qCB1isQtS+NuF/YPY06jfkJ3/wnVbRhxFJ0GvEqIr7qo84WKQTwYvqPVmJ5WS8xYUchq
         UAfGSg2UGDD8yMIacbBvPI0EQ8I1bEptFbHTlpXf0Jd0r3yJoeuHs7wQlDNKQI9hb75G
         qQsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ly1tcmuu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id la20si3203087ejc.685.2021.07.30.13.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 13:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ly1tcmuu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9ZCo-00019Y-Tx
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 16:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9ZCg-00017U-5X
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:33:58 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9ZCe-0002Nq-LH
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:33:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id ca5so16856328pjb.5
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EFDmzefkk3tdwffgmXbSaxcxkRkpMcHi0LkfxkXHGdM=;
 b=ly1tcmuue5YVGjrUFGfd6uKmnLrQzfmgfEVBCwD3qrE3Q4enb6eq4qJ6EWohO/z0CD
 pJKQNbKH1skNPmo0vP4ME3wYlf17J5CvcP1iVcgannmMbo7snRutOc70Nz2vvafxiXZ2
 oh+GMHgJu7Uzk+BHxTHr7/APWg3/1Yf+StoL8zerllMAzCec2GYBl1zdUJn6kSxXk/Mt
 RTJI6wtgVZKFT4P7gsteM0FZqyDId9yWRsc757oLwyg7FFGJYfqfVm+lcB8GRDglAiKM
 sMmqhFswq+NwNQCEHTcPCr1Xip0r8TUDexfj5JCbbleWp2M53DCbYOAHsKkJjDMk4mKM
 S1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EFDmzefkk3tdwffgmXbSaxcxkRkpMcHi0LkfxkXHGdM=;
 b=bIPM4S0vTW28P7FaLOgNMHoWPlrs/bEDdEf6b3m01pF2Oitf5mS+Yvtk4tjujgQLfU
 79QTdrxuPuuo1iyWhSsxNhCJZ1dkkK4AN+3cYq/gGcxu17Y/XgJAagvlmYKI7WgatA1Z
 /0+bo851ZznTz2POYZGQ2sYA1inDCWHCnQRG5Bv9bKLhzWLKP1S+wL42Z49kkNJbGb+M
 VSoaWNMw3EEvrNceuMMNjS6O0sYQgXubnTtATe1pfejV0osEaZS1l6p/ALaSSDAvcamo
 Me0yo0gztkuiUUig3S/zy7c+YECRx/M4okKGJ+XTWhbrqXEH7eWIySBPLaTVZ/FcKGrt
 +bng==
X-Gm-Message-State: AOAM531/6zccusrUCsL0Vw2rBJ747Gf3VsKGgiKnD9T+EXBL/mSugi7T
 CPEmM+f1WPY+U9WHFs5jueAzxA==
X-Received: by 2002:a65:61ab:: with SMTP id i11mr3855545pgv.168.1627677234880; 
 Fri, 30 Jul 2021 13:33:54 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id l1sm3787393pga.35.2021.07.30.13.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:33:54 -0700 (PDT)
Subject: Re: [PATCH for-6.2 51/53] target/arm: Implement MVE VCVT between
 single and half precision
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-52-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c2eae08-0c32-e775-0964-f2861483bc27@linaro.org>
Date: Fri, 30 Jul 2021 10:33:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-52-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
X-TUID: m+Hl7ySzTsnO

On 7/29/21 1:15 AM, Peter Maydell wrote:
> +/*
> + * VCVT between halfprec and singleprec. As usual for halfprec
> + * conversions, FZ16 is ignored and AHP is observed.
> + */
> +#define DO_VCVT_SH(OP, TOP)                                             \
> +    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vm)   \

These might be easier to read as a local function with an extra "top" argument, rather 
than as a macro, since you're not passing in anything complicated.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
