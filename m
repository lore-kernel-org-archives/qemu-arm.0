Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1706099njc;
        Tue, 11 Mar 2025 02:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqzsP+bDiLV/H/Cj01uSrNoI6b5A99BIfusp2DNzxiFdQVlWRIZ8j8z8icyctFGFAxZNIp3YAG+fLCIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGelswgpMoBRB4ECXG4JxODuckXj6i/jiNis6mx0gWEoGvxYSMPAp8c4rBXEUsMx3yReHfJ
X-Received: by 2002:a05:620a:8086:b0:7c5:5670:bd6a with SMTP id af79cd13be357-7c55670bf10mr767540885a.24.1741683660499;
        Tue, 11 Mar 2025 02:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741683660; cv=none;
        d=google.com; s=arc-20240605;
        b=PhP+7oJztCMxjjHeLqALUXnKYQkiplkRqneTNKXvQbTZY2IBic30sQ449DUklV8zWq
         6NqukjhT1i3jpQM69U8/1TrHZGB2e5pPM1WoAuMZ5D7pr0MH4V88M0EqGfmGiBxnv/an
         1pj6sKqBGVndIjhbiIU1Dmnq4mJ6WrOixVLUiwSNIIP1lqRrW2K3zfV+qAX8kREBRclt
         CRqhnFsoVs1BWpwPq4Ln0eiR048fZqLDU57fiN49aGH6dK1pkNDYcWv6/edXIJRL+7o2
         bMF06nVnBgQotqDGmYGZsmxdcPOq+xYexlnZHOKetaAGecoBR0VrUVDa1W5KeINQL5eZ
         orqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bpCEWWNPvzqb3rOyOlkFLzMAqItDhePeEA5w9A+Lq6w=;
        fh=FFEPJlF/4o7RrRCmMhRbGZ+0ZOShCEpJXyalLBZeJLc=;
        b=Zm/NG68hurwnnycTqhQdAii3kXLfI+y7PWwxrQhwVGFeLuAei8njCFx4WzZb/iPEwR
         VIO2z6HlK5fQUTMnrQbksdn2ZW4fhSbX/4nQ6RNth3/20vYoVcPal+LkAYFmITtPc3Dl
         1xpDVAHnIaItNrDvGnHVkY1uVjUtSHkCFjOD+pTm312QgLA4Y8diRIG1fj+pMxzUYxLY
         1kC8RYS4Yg4YKP8nB9ycaEvk9DdMm0WCGhwXN3/AkfvqtiyzLmGoQ+bm601YLQC0oa/h
         /eYOpnL5TsgQproZn/qyMd7QrMFuMDURH8dXc9IWulwuCnPU2GYY/dbum0UArbWedtns
         R3tA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwXrCYlE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c55e4c41eesi171032585a.292.2025.03.11.02.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 02:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwXrCYlE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trvTK-0000rP-1E; Tue, 11 Mar 2025 05:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trvT2-0000Xk-Ci
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 05:00:05 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trvSy-0001iZ-8T
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 05:00:03 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso2519153f8f.3
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741683598; x=1742288398; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bpCEWWNPvzqb3rOyOlkFLzMAqItDhePeEA5w9A+Lq6w=;
 b=OwXrCYlE6uw39xaQNuCV/l+TKD8JYV41YzsVKPP2bgLPQBnUHGeKtB9LjQUyN+CPXc
 cW99DTj6JQEcBI8AxfjNxL8sMyyCuXxU2wKM7rqQ+26yULSPhyM7srr3pKJjSQiErtnj
 l1cf30wT3TJOhNv9i76/XvMEXzxtL4ORrH0Av271gGU03JuTNvEvAKuZynNCU4R3UME6
 2PARI9e+tqeTOLzBFB5WuwqUenQS5vylfmu3YPwQsIQ8w45w1dhnCptpjoekxOL49a0p
 WekleYy/rPpxXbiavwXZ/GPj4sxGoXP7gQX7FxJI5r52bQfPKi9akks4EV3mtb5iNYM7
 mbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741683598; x=1742288398;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bpCEWWNPvzqb3rOyOlkFLzMAqItDhePeEA5w9A+Lq6w=;
 b=sO2dUMDAQ1FuWcTVYqZ6vrGvt1Q4hOB7a9Uqzz2266ox4LPvBBXMY5+UVQiBCcxnGE
 1Df9EK34AWQXiVVswIYPhr1toMgK+6RsV4za2D9g/Dl2odd4oO5FpkUd2NaAjJSOZAzt
 UM8cmujQ3fT0WU1aTdx1+cqTneX6+zfyWjEAWnsL+gSV/DIyDVM0DEihz+h2VCr5M/6G
 Uh4nS69JeI/77xSOJ/0gbB+TdZXxvRfNwUWYvldg/nrijjRVi9LBWqPc5pFnrW5Q3DtN
 IIne3C3MVnVyDrzRkQEe1ZkndhM/ZuxlyX/guJ7U2VwF4sZ/nnK46eRAtzxO+0+9RJC2
 ZbrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwMaq1H4s7OfE7+lVBwSUIKEXdYH/XgyXRjRSb+2ZwjkASzUjXxbnoO0CiVl+QilnhL9AedWFFxw==@nongnu.org
X-Gm-Message-State: AOJu0Ywq4h+5Wr6x0CHFZNirERY1LaA2qXWA3KMZWSBxGa5WxvwkNqBO
 6bfPZxAIpkNScFyjJhglKaRHttSLSVu3Wb3fkcpxSyiLl6k3iWIKNnBS9ANxSXixX+Y+vwcAVmu
 t2Fs=
X-Gm-Gg: ASbGncslmKEvy2K3ZLhb/BfnprrWbYUXEhj6J7zP0f77oorSBPrdfTYeYQvyBr+EQkp
 SOEcx1PENZmW04mb5D/exfj19HTY0mAElCQFcfUr0Po+VvSOBi/dUv4WF0HvwBsWqchYX/k9K/8
 Dd1DXIjsScFzQ0Q7kiSpfr3fBm7mnIeJAn1+BNSz/2mTLbJOf3MXaZQ4blkeSyoMSFOfbnc6oXN
 5atfr6JGorj1i/rfNd8Ag5nq39I6EDzgZR/22rGiu0BvNyigeibzmcqjVpABflW9xnOLkHeLUXI
 IREzSFjEY9jT719kC9ZfRlNfwzYes+a+eqRrTQgbYiRTYNiIcMZvyuvQ9ZV2hmkYWQll/MpabrA
 lCtbPF1kF3thWZQaLITaSmMw=
X-Received: by 2002:a05:6000:2a3:b0:390:efe7:20fa with SMTP id
 ffacd0b85a97d-3926c69b312mr3560764f8f.47.1741683598400; 
 Tue, 11 Mar 2025 01:59:58 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfb79fbsm17765161f8f.13.2025.03.11.01.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 01:59:57 -0700 (PDT)
Message-ID: <4f0367df-d873-414e-96fc-1a874ee1f501@linaro.org>
Date: Tue, 11 Mar 2025 09:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hw/net/smc91c111: Fix potential array overflows
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250228174802.1945417-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: WjV+d2OImK0I

Hi Peter, Jason,

On 28/2/25 18:47, Peter Maydell wrote:
> This patchset fixes some potential array overflows in the
> smc91c111 ethernet device model, including the one found in
> https://gitlab.com/qemu-project/qemu/-/issues/2742
> 
> There are two classes of bugs:
>   * we accept packet numbers from the guest, but we were not
>     validating that they were in range before using them as an
>     index into the data[][] array
>   * we didn't sanitize the length field read from the data
>     frame on tx before using it as an index to find the
>     control byte at the end of the frame, so we could read off
>     the end of the buffer
> 
> This patchset fixes both of these. The datasheet is sadly
> silent on the h/w behaviour for these errors, so I opted to
> LOG_GUEST_ERROR and silently ignore the invalid operations.
> 
> Patch 3 tidies up the existing code to use a constant defined
> in patch 2; I put it last so we can cc the first two patches
> to stable without having to also backport that patch.
> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>    hw/net/smc91c111: Sanitize packet numbers
>    hw/net/smc91c111: Sanitize packet length on tx
>    hw/net/smc91c111: Use MAX_PACKET_SIZE instead of magic numbers

Since Jason just sent his network pull request, I'll take these
patches via my hw-misc tree (with patch #2 fixed up), except if
one of you object.

Thanks,

Phil.
