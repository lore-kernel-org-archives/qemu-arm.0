Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1446960ejm;
        Fri, 21 Apr 2023 15:28:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350aHAOtCDn9fQ1IvX5TM6T8s4dCyb6YdqXxYeyIyGk2ygbiw8xot57wdJ/DHWiL2kRJpmdYv
X-Received: by 2002:a05:622a:1802:b0:3ee:be98:9fe1 with SMTP id t2-20020a05622a180200b003eebe989fe1mr11396677qtc.22.1682116138456;
        Fri, 21 Apr 2023 15:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682116138; cv=none;
        d=google.com; s=arc-20160816;
        b=vsBQKPJFOWN7YVV6jTzcEHJ4/fMStxlDOsOnFPX1nw8sMPJXcyCPgyuEU8x5gBNltz
         8W4YoiJjzj+U1N+hGJH1KNyAZoJZ6eR6Y/xqO7UMKYSNXKLt7tgkN6Gqn+bjA7iLDOLF
         GXcHU4YV+9OFyv+vUBYl9xXfjXuGSwdIUEpJL2lR2Jv+lhId/Prvl7vZxkN4CtljsVca
         kcBfEu/lwRoAZC5smdzYIE0r7nG+p1CboqFy3FYkzYbMcoqqe0KwuUVmnQGuH2iIk6mF
         CEr/xdQlzXHN4vMTX6BrpTgPrakTH5QZHW4Ab823kP3Hftv0mqS7uIwY1IpifM7PpXaS
         u/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=93ElVCSWliPNbtf+IQS6C4pqPFXfm7DyQZafVbfLyoA=;
        b=w0U9reP/cFKIKPBM/rf92/T+AxY8oq/MzwW/3FLy+oxH+YXYox2b6A9CNVyNYCjHrM
         mMTilDdXlKN6mNvt/HmqhTqHD0GlCYYAYGtx2hoGwOK/jbraTt4PuMk/7vAcoj4hkODI
         N3D43pz/sMdcPiXT3QCrwhAh/lPjAt+YV9za6ImiCYb8OWk2kJ37opyANZx0XEoaSIlG
         FQosWGdhummpublHviIrL//t28qpIYKMJTtLv2r6Ghl0oO+BCfO45bZw4hcnvP7nerS0
         iijuAjKSMWqvJ37dNWBohQKWpWiUGA0dKNbwrzyhFk95kS7+P5ngl5u6BQ/BW28ThrsY
         OWBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JXknaJ2V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020ac84e95000000b003ef630a0152si915349qtp.669.2023.04.21.15.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JXknaJ2V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppzF9-0001zK-A5; Fri, 21 Apr 2023 18:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzEy-0001pu-9V
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:28:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzEw-0006AL-T0
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:28:28 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso63349845e9.0
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 15:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116104; x=1684708104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=93ElVCSWliPNbtf+IQS6C4pqPFXfm7DyQZafVbfLyoA=;
 b=JXknaJ2VkdiVb57XrTk8D4Mph6RkJ6Ls6CrhYELgAAvqrd2oQwD12JVAEolszMSZue
 abK0pGTzH3px9oUqQ34vHpOq8UIdfnB5OaqrDA6+YNpr2xEgsyR1gkoCukSUpXoR9dUx
 6RWNQDdtq8JUoetwMzW5HOiGpnZGs8VJxXHgCVOKuSX22VeD7jVjQOjgyEcqPGeZLjQb
 GZ5xq8aQEKsAzQQCCF+uySRTYGHeM9WScMn5VVUz9CCJJXtGZ7Y5KN2nGs/BEmPB6+rM
 00i5nemBC0UY9vGVMeP2xeuUJ2oj3BYCxV8JHU5lroDVMNMGGjYGhwSK/tZxUf27AsLQ
 b4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116104; x=1684708104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93ElVCSWliPNbtf+IQS6C4pqPFXfm7DyQZafVbfLyoA=;
 b=LFOUbEeEFVLJlooqjV++h82uvVSunah44ssSxQqPjTLNUKUVSpyUU/B2G7wnWomXwt
 SIhLxO/GaHz59kf0jWJH4lzmPbc5j7pm/j5luZ8Tt06XZxFu9z7pq1EimSi7Vva7uREB
 KZxnbSz9OCLXVHnQ8pX7C/aPB6QPKS30xIBT4kWT0yJzPj0RGMfx1MHXEBiIYzbKH12K
 szobcaOT/aMzmxsLgvwQADCaeHTqPlfzMWSV5/iEWyVvGXy9NBYLOf5sAM7pNdDIwok0
 fy+/dI66Ys7S8WIqWe74AoCD/jBSu96bXxYZ5ykg6nxcQL82D5CmcaWss0GWLifQ12kF
 Eksg==
X-Gm-Message-State: AAQBX9fojCAVbg3AIupPdIZzaxnlNvNomVXzgfKmjfMV3+4lUsGGIYft
 izBQbhqWJM9yRTxeQsr/EUnbOQ==
X-Received: by 2002:a05:600c:34cf:b0:3f1:7510:62e8 with SMTP id
 d15-20020a05600c34cf00b003f1751062e8mr2844785wmq.3.1682116103850; 
 Fri, 21 Apr 2023 15:28:23 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003f179fc6d8esm5812268wml.44.2023.04.21.15.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:28:23 -0700 (PDT)
Message-ID: <9f7c229b-4490-d7dc-93c4-058003de6737@linaro.org>
Date: Sat, 22 Apr 2023 00:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 30/54] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pswRkIWJ0dYg

On 11/4/23 03:04, Richard Henderson wrote:
> We need to set this in TCGLabelQemuLdst, so plumb this
> all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

