Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp456864ejb;
        Fri, 26 Apr 2024 08:04:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+i2fYihZ2qfWNkDRA5aDsNsmc/HT6WnfmGUUb+tdIKKxnk+ac7GYr739Tj6uLL57PnSXiGvDrtdA90Sffue5+Cy+5X5MW
X-Google-Smtp-Source: AGHT+IE20CUjNUBPBG4haksseeuad9fv7qkJYoXXt8TZhDSuQ2O2UbiS5Aadft1fomQSCC1jGfMw
X-Received: by 2002:a05:6102:457:b0:47b:614e:cbd with SMTP id e23-20020a056102045700b0047b614e0cbdmr2923286vsq.31.1714143887338;
        Fri, 26 Apr 2024 08:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714143887; cv=none;
        d=google.com; s=arc-20160816;
        b=LHNQUgc3Le+5GjbNLdOPDhrVP0OqbCV/E+AcRPYdQpLjSIj1GMBMzT1G8xvylowO4F
         JIGUF/v5m5eDhzWqqbHBwfnAOgOmsuKeU8z5MB8iVwxvklJgxjQaIx+H42MwpH5GCBq4
         TApdN6DpEmm6ZftcX6sNX9qjttoPIFquATBz8TABvZmYmQ5MAL3jgiRut+N8GYXOxl6h
         TsgmaKVLEUnBancmTWbTdAi/VMJ1yhYWgSRvTWsZTipyZ/OXN5ja91y3M6LECu2phH+p
         I1VUaHbL0ha9sFeDtPznnI5lsQRGBPjBqvyhr8jyAU9Ge0iAwoA2t2abU2gahnaV1YqX
         IIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DPvFAWUn7+P9t1NudqBmjHJ5I7VSCG+4l5ujIe/40qo=;
        fh=ZSnS4/RlpPY+3AF5rcTOAH0BmzPDHY0xQKrv5wKyaHg=;
        b=XgAtkvgpz7sCDySC/r5LCud8tKdPcZ58SjmpIn0xJvHQd08KioHlNGdk8MNF6FUwk6
         3i8Ry49dDTsywVLZbkWqLY13SrvAinyPCxioftirq1nxF5TtmOE2rtCZBTqT+mAh3M2Q
         hgb731zBtNap8NNvSK6ztv/bxPyQZCNYpFQjYvMKVlNogx2Fh3vc4y23nVe5bY69VC7p
         J2gMCjLOUj2yVZ+HhRuLfhUb/qlodkuhs7PRSSEV1/rkdPgWWvvBSyf4QDbXnKEXeS8B
         T69wF9TM5722QWIn1+otnJEnL8w+M1dnpDlb6rlOF7UGeg8+Xo7e9cEvNXJULsja2WJ7
         QAWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KiGaiGKS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw20-20020a056102469400b0047a07009ad3si3230468vsb.193.2024.04.26.08.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 08:04:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KiGaiGKS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0N7L-0005yY-0e; Fri, 26 Apr 2024 11:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0N77-0005xJ-JH
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 11:03:51 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0N76-0003Vl-17
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 11:03:49 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e69a51a33so2343337a12.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714143826; x=1714748626; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DPvFAWUn7+P9t1NudqBmjHJ5I7VSCG+4l5ujIe/40qo=;
 b=KiGaiGKSU/YWl0yP3p8+YVPuKkIpq6TGDcBLlbbdKQEoG8abG2sQVzj/mewjgEqEH+
 AgbdKr2zFuJccHMzNz490vxoCg6eesEAtX/PPzvkNzHE+I25Mo2EIDDPbVgyh5O+SmEU
 9GTiaV7xZIUfHa/VtL3fPfKPw60+bbM+PTpPams0U9utcG7xRexd8jfy3jfmFuIwv6Oc
 tRSMzocOSlm9erTiQBWJwy1Joo0E6zDgJHeiyiO+icsUGqo561s3/u/9x2LNA/ESJ9I4
 0Lm2E9lPO54PdNWVPtNsJpE6Q5DFgYShR9xxBRRuppoTR3hI8nuDiFDP8FU3Y7UnTgsb
 jr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714143826; x=1714748626;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DPvFAWUn7+P9t1NudqBmjHJ5I7VSCG+4l5ujIe/40qo=;
 b=N5/v8HC1kNsDQ7enIQVJPiMaLZ1fOVGuKDYNWSdmKiDos/1DSwTTRuXzXqVjjYzXVG
 aVZwzvQFcWMmozZWfRtclwVSPUstUamZhn4sUOacZXJMa5gCctNs3+BLy3rk5S/dLerX
 gg8CJous4iomxchQiB6finhmUbMfqu3gBxdTavdoK5FG6Zye8pbE8O4RR7+OAU9ry7at
 ShHSpdTfSm5soYZwPka9+MO5CX1+uk4/AMZUbPTy7yoISUkn9E1Zcn/HXZHdXf03cJMg
 dMHy5IsNlei9FkVrKqE4wS1TzN66pBI5XMXuRqZPrcfCmuWX+tCH7fjNR42KPo3MaD6v
 BkTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiac6a7IvLpP4p3BlA4uVxMSb00Gukla6U3o1TKWpACCHZhqNqGEerDZWUoLaFSSJeO2KN2vTmyTNEao52PyeHxu3z
X-Gm-Message-State: AOJu0Yz/o2avsmIUKkKHMj3TaQag9i4mTJPyT5HU+ZVRtPvDRHZFdb4F
 MYcwwboh+bCKU8P+W60Dwqkp84YI4vLB+Gqui+NV5ynKCQvLgjiQorGOKVhRR0Q=
X-Received: by 2002:a50:bb6f:0:b0:56d:b687:5a45 with SMTP id
 y102-20020a50bb6f000000b0056db6875a45mr2295070ede.1.1714143826203; 
 Fri, 26 Apr 2024 08:03:46 -0700 (PDT)
Received: from [192.168.69.100] (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 et10-20020a056402378a00b005725ffd7305sm223625edb.75.2024.04.26.08.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 08:03:45 -0700 (PDT)
Message-ID: <76d4e198-2a10-48c3-95af-30a5ce14838d@linaro.org>
Date: Fri, 26 Apr 2024 17:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] accel: Add new @dirty field on HVF/NVMM/WHPX
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Reinoud Zandijk <reinoud@netbsd.org>
References: <20240424174506.326-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240424174506.326-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: uy9JGVGEJyk3

On 24/4/24 19:45, Philippe Mathieu-Daudé wrote:
> We want CPUState to only contain fields used by common code.
> Start using a specific @dirty field for HVF/NVMM/WHPX
> (TCG then KVM will follow).
> 
> Philippe Mathieu-Daudé (3):
>    accel/whpx: Use accel-specific per-vcpu @dirty field
>    accel/nvmm: Use accel-specific per-vcpu @dirty field
>    accel/hvf: Use accel-specific per-vcpu @dirty field

Thanks, queued.

