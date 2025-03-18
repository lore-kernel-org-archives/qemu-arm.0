Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3124535njb;
        Tue, 18 Mar 2025 11:24:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0HNoEzUzCZ9FD8at66CsQsBc4BQzJ3OTwAtkh27HZN+Y/yR6toqnpk0xo8RPdLshGHVZ8BWXagKSAaA==@linaro.org
X-Google-Smtp-Source: AGHT+IHGuhatrjkDopOCbjrf31FS4ieGhZK7bFwRCCKTmdkly8Mdxc29nVUGhx7hA6Or+ujvv+74
X-Received: by 2002:a05:620a:29c8:b0:7c5:6742:764b with SMTP id af79cd13be357-7c57c83397emr2757926785a.31.1742322249310;
        Tue, 18 Mar 2025 11:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742322249; cv=none;
        d=google.com; s=arc-20240605;
        b=SBbZ5i0+piBu0RHtgzpe6ixCCREHbe2081WTEy9qRz3x+BCikUGrLTEVq4oXMgByMq
         0ufjsEqTLggaLHRloblnrSa2bkwoBpyEkG0TDXegcVwS7NpbUtMfweexayJLgDKAz1gy
         x/6pK28c55XrZvmdGjH5yfPArPWwTH4mguMEpdFdOf0dEBti5P8fubLXt197115w83ak
         b4sfBqHHjmbFmc39B87a4GTl8Wq1KJlOhMDRvm2SN1n2u6WftpvrnkDx3PWApxXPHPBi
         xrRVKnj3K8G9ttgl1I0hOvA1zw46R6O3iQKUnrecpqtosgqd7xmhAIIISb4VpZsp83z5
         1/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ca5OzeAfDza/pVt7y4FEpceZizjqIEYxRi/Rj6lwIAY=;
        fh=WFc2KcX4NNxwQnd6H76CLfs7B5CgWC6kg9gzCckKPJ0=;
        b=JRJGQW3t/xWCrxyNAjcvI5v8C+gIqpQR/hWS5t/yNr6/rjUQgctvxquQbVnYxB0GxT
         LqKyyT7VHuAtzxYfgzcLNicLMNI/WKMAyXqJ8yu+Yh7eHlR9L5JUCmjNiEZ0A8yIAFHz
         06UWA4w0EMeV1g7UApN53N7z2HVS/kLeCeHYbK5jQe3aX9py1mL6Ae/+qSpib165aL6V
         prJLhZvLbdXuzdsmPiMBm9ZAlUHKJ2yMayFuH03iuwR50yIr1OgVZ48+E12qZqqCd/s2
         ht1HUlSWRTt4/mW4CaiLBNItxqTjlGhxjCXeCdzI+Tx39T7OL/KGJNh/nUW40iO2gO9A
         h1Yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bxMDnaqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573cb722esi1237993085a.214.2025.03.18.11.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 11:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bxMDnaqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tubbe-0005ST-Ok; Tue, 18 Mar 2025 14:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tubbb-0005RN-Ii
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 14:24:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tubbZ-0003it-PB
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 14:23:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3912baafc58so5137010f8f.1
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742322235; x=1742927035; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ca5OzeAfDza/pVt7y4FEpceZizjqIEYxRi/Rj6lwIAY=;
 b=bxMDnaqwF/c2KRK3dIvEEgUnL0plevmT8FGy+UJrZ8Qi+Z3PbWZs77AzkbFvYuV2mW
 +LU6fTfQId0bhK5Razkz5Sqed3SsGQn+mR7LzRtJIodceJJxv2pilzucePmA5X+CQtHp
 sLET8SJzgoudO0FfVsH+cGO20N3onvX5OVhQ42LfP+VFYQxZlmnR46gxvz7B5wnW54rt
 xEivo6JkHaN585Um3p+cLzxllj88zJcdk194/chyXcog62xfq62xd169kFtX9IdceQlQ
 9MQgy1iNPRbvGscXuVTJV4Kl6Fw/i+vmXTqCY32Qvf1paJp2yia4SGDu3+0lKK1DfoDk
 NKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742322235; x=1742927035;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ca5OzeAfDza/pVt7y4FEpceZizjqIEYxRi/Rj6lwIAY=;
 b=DCeleCA9mHzAYguVgwCpFquM83ayjo8H4OXNvtxFYd3FmDyESJYwDPDS+0lYMHHmTK
 nbTns8dn9QpebnoicOJ7R5QHzyRNcbBu8BaP95DzOAs1do37tgj9yLOWnt2gGwh/9Sqg
 fzyJXHM0kCZ1pqlRsJOc53hjD0JYnoQAEQ7ydENC9rCiyXTtu9YVQ8NKSNq7b3CJj8BO
 xdL6fjjfy9G5rkOGqjDZiSMYtftDy1fp5xetEJd63W5TdZTFVvDovEnb5dHfkyJnjayt
 zWOCuFNuJppm3iHY4CjPxcT5435F4Au5bbh7twXCjkUxGtUx4DVzZOfqsewcitd5xqH4
 ClZQ==
X-Gm-Message-State: AOJu0Yz4jptrxXeX/Nqb8ef8yRXdM7hwUEKoWGCOuJp5WCF36kktrBwK
 ikfWQ8rwFkPurM+FY/887qwJgI3MbW+b2GsR/Lc30mvZKIGQAfTDjiqisEJDVTA=
X-Gm-Gg: ASbGncuNdXJ1zFOLpPoi3dHYqYk9m5VitCMS9oDkoH0Q7a1GeXt5J7YbNt90idxsvcr
 wiNOo+NQUkpK9n4VDv0LDdTN8BsUSbBqeq+mS7kS91jhmGIC+7BjoPShsp+8AKZKhc5UUc5uMpc
 +FgHSyiTLNddXEZsylBzueBWze/Uv5VPLES+wB6SWIA57Zk59fm7X2EcW55J6CV/wBlKyDObPZb
 AX1KCk0KebTsqnCyj5yHRhRc1t43qmFSPxZKQ9vzfFwoZXxkIUzTITV0fDo9GSOg05wdU4NXR0I
 nIa1Kndd3cMWo8QewmnVk0assSwJdVvNXerJnBGmP6HiOcEPQrGMovfg9cdGotS07+ys5/5CjLd
 2Jxl37My+jsJx
X-Received: by 2002:a05:6000:1885:b0:390:f0ff:2c11 with SMTP id
 ffacd0b85a97d-3971d234488mr21408671f8f.2.1742322235142; 
 Tue, 18 Mar 2025 11:23:55 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6e87sm19430848f8f.32.2025.03.18.11.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 11:23:54 -0700 (PDT)
Message-ID: <b8cab5d8-c024-4cb4-a240-9a9f3ce3588d@linaro.org>
Date: Tue, 18 Mar 2025 19:23:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system/arm: Use "functional tests" instead of
 "integration tests"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-arm@nongnu.org
References: <20250318061420.20378-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250318061420.20378-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: bIslLpiTAlKS

On 18/3/25 07:14, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> We don't use the term "integration tests" for these kind of tests
> anymore, it's "functional tests" nowadays.
> 
> Suggested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/system/arm/bananapi_m2u.rst | 6 +++---
>   docs/system/arm/orangepi.rst     | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

