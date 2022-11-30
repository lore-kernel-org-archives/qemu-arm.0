Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1091518ejx;
        Wed, 30 Nov 2022 02:29:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5SnE9QNnUNGPcVhkdSbWQreal2WcwDL9ca1Nrc7QZDe+fEc6xUgRkzTQgbRKTc9oZLy44E
X-Received: by 2002:a05:622a:509d:b0:3a5:b69:5015 with SMTP id fp29-20020a05622a509d00b003a50b695015mr56685022qtb.211.1669804181279;
        Wed, 30 Nov 2022 02:29:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669804181; cv=none;
        d=google.com; s=arc-20160816;
        b=L3s1YuXxOshHrN3bKo1KfyfJPDaCvXIc6cT8oADdEj0Ifc6PRKNUqqWZVRQGLV0vEN
         AavGfL//kxv5Jp6vNqBCJP+pCQoyPZZME4rytnQ0JQPwQDcPqlFKnMvtve4pmeFvM/Zh
         cgk4fSDgSLBk3Dvsbpbb6Qzbs+2HOoHag/Zzukk82tG2K8J2XbHqHHAqdMuOUomxo82P
         xCw/F4W2KT0wSm0DQA8jM0vrsvGQeEv5D9LLC17Qb6jYzeg5fYeakvlOP77EuKYBZsjc
         kki1N40z29cBHM0fG7xVLR8ip8MILvavey3JZdKT4RWcOwwH6pT+abVLCqNl+lW8j/fj
         gu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=yujB5tnKoYtUChUwU2Maf/O7hOsAZ/kbrK9xzrgnC70=;
        b=S+aGsLl2BZFHXbFkBsOLwZIQxGa3fWwuwkDnAPyabdD+AqdBKC8+Ql5KxNtolpJYG2
         ZE3O24syMsAIvwDY+daohvxV8MJG1LC1dRxMaeajkSCSUVA5QN3t44tom9NLsLrrLiFR
         xcXxZlJIBMgjLZfl7fKdBNNb7eT/7RUr+UzxOjgTRTPlhZzm+xiymkdidZiMGQKFll+T
         kquKgfHoSjR8mXXBDn9ZbxHgJwrq5oFXOhqSFWFJACqwBz0z6IsGz1DnNLJWnsXqA/tO
         UDWZGZ4mg17ug9E2yYApzPaLmdj9q47veDpgomCTZ7I3NFoCODREr9VDtUG59TN19xRz
         48Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YBWAC0EW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q26-20020a37f71a000000b006fc98aedbf2si470362qkj.393.2022.11.30.02.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 02:29:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YBWAC0EW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0KLT-0000wp-MH; Wed, 30 Nov 2022 05:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KLR-0000v2-Gi
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:29:37 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KLP-0002TG-Tu
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:29:37 -0500
Received: by mail-wr1-x42e.google.com with SMTP id z4so26375778wrr.3
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 02:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yujB5tnKoYtUChUwU2Maf/O7hOsAZ/kbrK9xzrgnC70=;
 b=YBWAC0EWLsThkKSXxQpyfxRJaNI7xLZZJwgLBlvyMFuVrDxJ1lN/8vdJCk7FAUTAY6
 fKgfylP3y14+C5d3J1GMFnxWoQth4tFtUO8UrcCkYCGeldJYfq98Znx/TRDY6MKBvfgg
 MkkDCls+A0Dnh/tPePluOjMZboEH7u5ZqwQPOu1LL30rmEKGwzvDBDzzsiLHr9oLrCFZ
 gM9fjLca+X60k//0D/i1Wzz5zU2Ix5haFRAeN81Rzy6odmbnYp+kGx62bj7ERJwHYifj
 LkvRq6LL+Cra3mtGeZohcUaz/QnLDCQIrDu78aEx0SP79f2GJ9AmY0g01sdneUa+VzDv
 6vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yujB5tnKoYtUChUwU2Maf/O7hOsAZ/kbrK9xzrgnC70=;
 b=m6wObIeCDcr7r0VDHERWeb+R5PzAD0FSffuJkgSpFpD+tgU4S9xE5g3pRz0Tu/mg3y
 tkCFzOPgy9PmgHWS5GPVykAfgasHFFJ5E0dz3KLexZe3GHiimEvZrtjUZQZvFkhQ34DD
 T39bE8v6JG/QHY5vLKxhFayp7w4NekrJpg6I3Pgc9cv184tnxai1xgd+ZXgfYXBShB9V
 DV8sIim3mWBciuSY7KTu7r9yB5zwT1yA1/s4Pt+rP27Mkindw9b2GtjqvRs7HAvCbcxs
 /qpW3o3kqtalFGYjNvrn2lcr7o9A5dIPzBWWm9G/mJam0mirnFJB/guU8A+ViC+f+C6g
 oGGg==
X-Gm-Message-State: ANoB5pmhB+zfYy+6k5ETFczHcFy2nit6vWulj6GcYhDiNoWOivkDJebf
 MkajjLID7iV9JXbqMbylHuUvvz9Lo9ZP8K2/
X-Received: by 2002:adf:ffd2:0:b0:236:59ab:cf33 with SMTP id
 x18-20020adfffd2000000b0023659abcf33mr36893351wrs.568.1669804174609; 
 Wed, 30 Nov 2022 02:29:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b003cf894dbc4fsm1482986wma.25.2022.11.30.02.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:29:34 -0800 (PST)
Message-ID: <555fbaf6-d750-66ba-cdd7-46f8612b4bd2@linaro.org>
Date: Wed, 30 Nov 2022 11:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 4/9] hw/intc: Convert TYPE_ARM_GIC_KVM to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: iLXIfOYhdpYw

On 9/11/22 17:14, Peter Maydell wrote:
> Now we have converted TYPE_ARM_GIC_COMMON, we can convert the
> TYPE_ARM_GIC_KVM subclass to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gic_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

