Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4123010ejb;
        Wed, 22 Feb 2023 01:40:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/eIWN8KPUbJxigQQ+fUfwG3CmOT2xsMvDo63VTXY3nWqaGNeUceLb+GGWJDzlcZDQP9eD3
X-Received: by 2002:ad4:5bef:0:b0:56f:1cc:120d with SMTP id k15-20020ad45bef000000b0056f01cc120dmr10679373qvc.26.1677058811038;
        Wed, 22 Feb 2023 01:40:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677058811; cv=none;
        d=google.com; s=arc-20160816;
        b=g5AMj9o3V6dqqEKZRtztjMFv4S+/gXjbf30vd1uk+09hNswGstQdvmHiI/+ogFkdsh
         MAdzksnElFfnQB7F+WrHPf9MapgKhHnC4mkhOOwiOAy1dJI+wZKMiu4rIiZ14y2BfeVy
         g/BcVsiBAhU2M2w6t3BevyTmLf18FRIoEhOcZzeU11PRjtspCnPUVjR4hspAFhJw0TiI
         MwusJkLa0OqAv4TbnSt8fuiHb3AQ+tdCTfTf28np9ojMmzNq8pbzTPQRT6OkKIeOmqGV
         5R2FRq+ycO97EDfWn2VAiBWJHC8ub767h0kSDIFd0sIwcTBirKHjemTwQc//hUc2hfDP
         6tFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GafCA2BVZGZyDc8jMSxRCynXmGgPbwedSbXCngEo7qM=;
        b=JG29uxOXz4jBN9edcYS8WlOPL/ndm0Q9HTqPgWthJ95+/oT8CwZ1A0Pdo0Lc5XOJR5
         P/anziIIBw1Q6nhOyIUCgIf/TqOoSHUv6e+v9zp2jWvUk8e/igi+GY72alCtum2U20Kv
         ujmjAu1eJ5lF5bCLhhCf6YW4EhF5nQObMBUCQLCuoXx1fW1KRPZw66eiyXukWxK0lGvn
         zXclpW0SqRYcYzw3/R1SayJz0GIuvE/9W6YKZPxjK5xK6g8tkPHbpghjMlxh6I1Qm5EI
         kuz/4SsLDthD+NApsacdgD4nwu+SemRrWMpchj1Hqvn3KatgpoEj3RG34aOz+E3vg/hU
         DPvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sCdM19Iu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a0cf483000000b0056ebf20ba85si5928325qvm.311.2023.02.22.01.40.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Feb 2023 01:40:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sCdM19Iu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUlba-000820-Sp; Wed, 22 Feb 2023 04:40:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlbX-00081P-W4
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 04:40:04 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlbW-0006mG-AO
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 04:40:03 -0500
Received: by mail-wr1-x42f.google.com with SMTP id c12so7067512wrw.1
 for <qemu-arm@nongnu.org>; Wed, 22 Feb 2023 01:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GafCA2BVZGZyDc8jMSxRCynXmGgPbwedSbXCngEo7qM=;
 b=sCdM19Iu7p39yTCgSTEbg1T3pHfyvo5ePS91G4hGCW72W9JUdRxQaBe13ChHRNM76I
 PxtLzTLzJBIMQMRgeGBlFLSkgeJocF5BCHXloNtDvhwVzw2IzyUs2TlrZTIv2x/kG5NZ
 ehH0oiCrD03vaw9LVZvS0eZTtKtqzyN7TzG8rklOzJgrJQnCwFOClKalR/ecCev54a+U
 J66eoSspRMxRez2GpWyI0KR21i6DpYOSco9QlG6g3KifGE0tl81KphSoAZOlI2UZ5FW6
 nZ3SVBH6NUphX/6yn38XeHztpMMau+IkHfHsAXv3+WPwLpu2y0L1OO4uLom93dxrWWY1
 /2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GafCA2BVZGZyDc8jMSxRCynXmGgPbwedSbXCngEo7qM=;
 b=rNnoROySjAhRZUhQwc0YxtVO56qrYP+ziFZ8xPTWS7Li2I5Nj5d4LJPLFCv/t0d+GR
 EpbqSNA90KrlHaSpl4FD+IQOEDRkqSfw6LdoHr5WzpcLJos7sVgiiibHp0KXFd1DAPMs
 mkuc8lQmDFTRihdhOxPTOrhja8lga1mhUd2U0OgDCdlO1g0qwNmjyzsu61UVCTfmqqqA
 7xZ8xxx5le1/h0NPixr/xDRuIa6BeK3vn3utyhMUI9VxzrB4QOQkk7/nxthce4QOlHXA
 14x2hl7cN8vRa0HCuIUjsQyrKLBE8hOfPgJ7T94Bttfzp9d+gBtwfN3BmGlanyNORjBT
 LBsQ==
X-Gm-Message-State: AO0yUKVUGjy0Yh+O+gpy0rqZdHnVxElGKJ0VGPMB32LcVIJAcdmCw4PA
 ppzFfNqXSn+pnwD6m9+rlVIBRA==
X-Received: by 2002:a5d:67c8:0:b0:2c6:75be:f2d7 with SMTP id
 n8-20020a5d67c8000000b002c675bef2d7mr5470833wrw.51.1677058800656; 
 Wed, 22 Feb 2023 01:40:00 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6802000000b002c55efa9cbesm6962912wru.39.2023.02.22.01.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:40:00 -0800 (PST)
Message-ID: <f0fdd2ad-6a12-318e-59e5-97893668427b@linaro.org>
Date: Wed, 22 Feb 2023 10:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 03/25] target/arm: Diagnose incorrect usage of
 arm_is_secure subroutines
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222023336.915045-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: mMHKD/znmmSl

On 22/2/23 03:33, Richard Henderson wrote:
> In several places we use arm_is_secure_below_el3 and
> arm_is_el3_or_mon separately from arm_is_secure.
> These functions make no sense for m-profile, and
> would indicate prior incorrect feature testing.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

