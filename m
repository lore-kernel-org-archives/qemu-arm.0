Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1091086ejj;
        Fri, 24 Nov 2023 03:37:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnRZlmW2ga/1iATlgYrlqP2dVlR2HLN/c41pz+9miXLbdtnmdFUlFYGSJb0ERod9lKncpJ
X-Received: by 2002:a05:6830:d7:b0:6cd:4fc8:3efc with SMTP id x23-20020a05683000d700b006cd4fc83efcmr2451071oto.19.1700825847801;
        Fri, 24 Nov 2023 03:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700825847; cv=none;
        d=google.com; s=arc-20160816;
        b=zvLb0jbaukertYN4FG/Mxjoj017+pRZPNofAEiOG94j91h/tF9k0mX7zEMCjHaf0gU
         Q4WGGk92tLdNmVIdsk5+R4z3M06P2q/RGuYa5nmahDrMRJfOOtH+0D+fjtfkQzciFJpf
         u6TmBDH2ICqp7TB7voSV9QhW44nolCO0rpGDGR0dtEzkPW9+CGnE0EvomSNGhJGVX6Vj
         qUe6c8jB4WeStU++2KqjpxA+QPtBRXvdu01v6GjQ6PbEw3bdcr2yJB6LBDKPPPZ8rclb
         ZARN1zo5s47x2SDcfY369RBkK0RdCA+kl1xVy8SkCp/8EqgVYdMcXucLG2VXzTuzju/4
         /cVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5sC1btWtsw+91xFP0BzSofhkxnN3GjDSpQs6fWt0Kp0=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=OerdrhfN7Tt2V2haRrY8nnC9KrI34JfAAgs9r5qaoh5f9gismlMN8f+JNgJdVwwD1P
         wkwHx2Ah806QgvC7z+xiersNljsugn/15ZTbun3i44PgOW+lfyBv0cVmQj2TuWE+HUiY
         /XXcEdPGXR2kzwQSBRD5iW2qQbQ8pCSqZ/FYhGOyU0eK1XZL0rJd6B8h3igAma2k0Kyy
         sfg8IrzAAZhOtuH2R+bAXmgibvHP7xUfznBxgnRj1aKSsUcvmQBsTqqQwLoO+XI+OyaN
         5zVcduN7AVA1yHbp/bIYcOhxHxgZrW/TO0gE5MdJ3YmdX1Lld2NVqfQWtyx8Mg5YndBs
         MVlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lBgrbvgL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bd15-20020ad4568f000000b00679f64dc055si2836311qvb.616.2023.11.24.03.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Nov 2023 03:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lBgrbvgL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6UUh-0008NG-0Z; Fri, 24 Nov 2023 06:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UUf-0008CB-1i
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 06:37:09 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UUc-000827-SZ
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 06:37:08 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b31232bf0so14123315e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Nov 2023 03:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700825825; x=1701430625; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5sC1btWtsw+91xFP0BzSofhkxnN3GjDSpQs6fWt0Kp0=;
 b=lBgrbvgLqH4A7Hyoo5OOnejdqG9vmCVOoxCHIeQ/AuAaOwgKZp3XkR4RQ/BDdOX45k
 XPOn3ajxT1n4DcR2PztZCPCrivS+ZCgAU/d8gIE4QJrXhOThIC0S5nlbqcpEKlmj2sfA
 IP0X31FUqIhtvdZQfjJQx1EABJuA0hrLdKEAMotQL/8uO3SOrSKdR7SmwuXjx3x4Zuj0
 lqMsomM/g4nqydxeTVYs88pRvH8ZZyCfDCEoneWgcZ5WZZLm863FthddT14LJYpT0iLC
 y8nI98h56m1XsokAHTZj2TiPNNPXXFrYF9se2oWQE4mz96Tu1ro92ACPfsdbKNTVRs6Y
 5lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700825825; x=1701430625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5sC1btWtsw+91xFP0BzSofhkxnN3GjDSpQs6fWt0Kp0=;
 b=AyShg3twiFRmB5aw47/mVtl0wI/1ORvR04P3xOr8madXDGcQ59M355flivko8EIAZT
 CbsVhmgVKSzXtIqdjXNVDeeGarGIjTJs1FaGINnOiCImtQvaJJwd5diHNWODJM26NXLt
 +WQ5JTjxudnp9DJB6ga+/8gx/mTugtC8n+OGLjrgDt0YoIROXKZh1Zo8VGdRw5evcJAb
 XwEJxaZArr34S0t/+ZoerUtiZ8dzB//25XZNEAOTZLpfQIBxG8xpX12qW4L8/SfJRUuH
 0CXQmb24iVs81nxrmPB2V6tB4KzMtdbB2SSbgG5hQKNtt23exHL83CFnByFcqKzmd5Tf
 J4xQ==
X-Gm-Message-State: AOJu0Yyifdnz6gZ/hD5qTO1ip8Xz96q92J8cCQwRMoXpXyjKIiIE24KL
 uyzvz5bsif3hR9vUBlYPl0BSWvV28VY9zi5O0fc=
X-Received: by 2002:a05:600c:314f:b0:40b:2a18:f1be with SMTP id
 h15-20020a05600c314f00b0040b2a18f1bemr2118372wmo.1.1700825825295; 
 Fri, 24 Nov 2023 03:37:05 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.17])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b0040b34720206sm4835060wmq.12.2023.11.24.03.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 03:37:04 -0800 (PST)
Message-ID: <bafb1ae9-6cf6-4764-8ac9-9b750b48cb89@linaro.org>
Date: Fri, 24 Nov 2023 12:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/21] target/arm/kvm: Move kvm_arm_get_host_cpu_features
 and unexport
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 00dyHG6mJx9T

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h |  22 ----
>   target/arm/kvm.c     | 265 +++++++++++++++++++++++++++++++++++++++++++
>   target/arm/kvm64.c   | 254 -----------------------------------------
>   3 files changed, 265 insertions(+), 276 deletions(-)

Reviewed using 'git-diff --color-moved=dimmed-zebra',

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

