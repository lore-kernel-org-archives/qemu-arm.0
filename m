Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp971433njk;
        Fri, 24 Jan 2025 09:36:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWueCNn5YYlr1FUGLv3XCFUsesasd5MFSPbmoSwClfe1Ps1fyCx7DwqkNJxiW9CPgsfckER4Ak+mrvttQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG3/rgglYPoOGYj+gVXSwdfoz3zFwgD0FvNWiPJzuti4+qAekKVztxCJ93MT5PkUer0OlwP
X-Received: by 2002:a05:622a:19a6:b0:466:d559:b528 with SMTP id d75a77b69052e-46e5b8065cemr119445111cf.17.1737740217577;
        Fri, 24 Jan 2025 09:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737740217; cv=none;
        d=google.com; s=arc-20240605;
        b=MrJnHO8hZhmEshPgv9MP0aBNalH3s8EvcyGEibbGnn8DwnYgpKchhQFyt/7UcCQMRa
         ERMfSEjwxiIL1AolN2W6T3wpDt0xaHQIi6NZT2QfLMvVJJJt1R3WHfS/VFmmrXcnzE+P
         9Z2Elh8V+faklzfWEyx5HRcCsz8fOHIowrPK8tTKUoWJA/Ktq+eViTunKobb7R1wJjCL
         GSD/4oWqT76Pv8KHMolMLS4ltj0DPycZiUq/ekmDWPnOpHAj1FlIA73ezHr+NdOCpMxe
         N1+6vlbW8h8wJt7yz3doINgcXS/j3EdCgVXevcOfUus77/bUm38KxWYm1NLZ9CXg+W6v
         goHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HBZCb/A6jf+Yq1uxkfMLXUDZ1kCufGeVAA4yoion6gE=;
        fh=CXLOfmGE0gWY64mCpG2ALlVRBbsVQ3eyqbyypc8+JDc=;
        b=ZtyI2c055NRM4M0b12B55L14ZtvGCnvhwJ2N/lEfdFs+E/JQ/s3Kh3+Y3Z22KsVCi+
         4vi2JlykBLwYsYJgHuUYJ7so8z3b6HrkW0mKqcOLXYyhLNmBYIu5jYa7UwdVVaz8+/jW
         ws5fyoxcpn7uBiQPuW9i5reuOlvP02QhsO/7C3tw/wIdHE7l+nslUbNGEf5xgbDLMets
         z2ZXOOB6t8w8KrUx7OEUhQl1wfnieXpEimdRpq1Rh7iaUjfQLNDPfrqa2gsTbs9AAdrT
         WK8wcu3GMyfoUA1zC2TdJd95EE5l4nypsGlZw0cZEtYmJWMd31kNX0AFU+JWeHt6eTIo
         NLRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q9iOpa50;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba590csi32648101cf.551.2025.01.24.09.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:36:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q9iOpa50;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbNbv-0008US-RJ; Fri, 24 Jan 2025 12:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNbt-0008SG-A7
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 12:36:49 -0500
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNbr-0001p4-TV
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 12:36:49 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6d92cd1e811so30357456d6.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 09:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740206; x=1738345006; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HBZCb/A6jf+Yq1uxkfMLXUDZ1kCufGeVAA4yoion6gE=;
 b=q9iOpa50zu/UQmJNo5nynnjWCfUWXKKqo5Eromclt8y6XiJ99B2VfPQ0RJdoBgKIH3
 iox58f0eA4ZuZ+DdcH0uJ/pteMj4Lb81hwTmLcFXj8dt4I955sATmqO8naM2ai8jd5Ns
 VJUh6sA9eLfqgXG9UNaeYtzc4JEldz51DonQtg6wLCHku+nwhHc88EQKSrBZEY4HsCwc
 ttqBMX3CVp6RN5Lhzq24dlz4pxlO5WcOxfVTK2n0My507+dHBDSGf7Yv0mgQcfbuQnb3
 KSNwGrUOYtw0/20BF9QoCK8JdrVLxTFLc9lc6CGhH32heKubjScTydA7H9ImKboxAB+W
 909A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740206; x=1738345006;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HBZCb/A6jf+Yq1uxkfMLXUDZ1kCufGeVAA4yoion6gE=;
 b=BJIW+zZVSnusioqU+NjuG6vbAGLPDnNJZEafm2Pf0hIQC9/qn6kLwI1BdrNRr3UQNY
 T66jevGkiQE22qB9nA1IMLiYIoDcqRI4nk09FYQg60KBBNxj51XzCThbygMQrbfo5V67
 Lf75r5S3DruHkv2IOczdOBXDgUZL27BjiJkBnwnpTQczPuM8K08XlFVEJYxJiVflZpkH
 WK2cbWSjRF1GOQKfOXV9h7SdN8tclp39QS3Spy9TY+CKsjDt8tIgGm/koAMbGkea+tYz
 Pew2HwquRSmYfacsE3U1ax+mlIQQwIs+CO50DKKCQrj3vEJ/8YU8+AeCxHV0iHDSNtI3
 neMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjYBUNBCvoarl/aA0LrF2WIGpQQ9VAVQ3TCDwcFp4lYqv+GzMMWyeXALAmjQT5ur6aWEVqi791rnrI@nongnu.org
X-Gm-Message-State: AOJu0YzZA2K4A5GBbNT0b6el+qy0F2r2sul72iCt3inDWzUJlCZYQAEr
 F3wTvEYuS7HzJBNXYtGa9uY6pRc8zffmZHCnHAcs2DdMtwDvqCWTuJ4PNJKtb9k=
X-Gm-Gg: ASbGncsgTbKQ10U5JSzyQBpMByCc2op0u9L1NZodGWgBLD/AyviPmbbHVidNSRSNn3O
 QfgTGCVJ/cvKDduDJumDh6ps2BaUOKpkhowxL7MhWHQoZuIOryhitHwpd9A8FnRE9ff6jDJAuxo
 G+KDyXt83w3OMEYPHB7D94M4Wee7bMZfKr9Qb2jNrqm6m68cV/G5aGsa0KFVMh0skz5IrqMtFco
 5bdfXVQX2+GlHoI36UWeEq8DC2oI5zlCi/LRk7lFCkzNHlPdiugaLRybgRHMddykn/tM6sZExMm
 spkoxlt3hwSk3lZA5R5fc0gKz/TgOx83yhosS1FBwEzDY78vW6pu9yfaH/39V6psdw==
X-Received: by 2002:ad4:5d67:0:b0:6d8:94f4:d2a8 with SMTP id
 6a1803df08f44-6e1f9fac37fmr131715566d6.9.1737740206633; 
 Fri, 24 Jan 2025 09:36:46 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e20524c9afsm10513256d6.48.2025.01.24.09.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:36:46 -0800 (PST)
Message-ID: <270f4ec8-80ac-4f75-b90e-b72fc65069da@linaro.org>
Date: Fri, 24 Jan 2025 09:36:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/28] target/xtensa: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-28-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-28-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ei0+a0fgZn3H

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Move has_work() from CPUClass to SysemuCPUOps, simplifying
> xtensa_cpu_has_work() by directly using CPU env.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/xtensa/cpu.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
