Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2152210ejb;
        Tue, 30 May 2023 05:50:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FH/FXRjsIRs0oQ7BRGUySdQ+PtZoHKvxmOXQf17RCp8Unz3zFaw6HpWc52aztWJx0dgqj
X-Received: by 2002:ad4:5ece:0:b0:623:8bb3:ad5c with SMTP id jm14-20020ad45ece000000b006238bb3ad5cmr2279788qvb.1.1685451053819;
        Tue, 30 May 2023 05:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685451053; cv=none;
        d=google.com; s=arc-20160816;
        b=X27I95VwskBzlk1nMdy2cA/FhJ44r4W2FidErIYWeU5rkj2W8YWJjX+SJCgTifnwqO
         utFJgGFyMhbz87tyyoBTe8R11Bw1nZVyLG72o3IGFuXbAmlvbzGB5QdyRY9bHPWirY0K
         HFm2Gh27THAQPQoEH/5VUo4B93CU+wL++vNs9MBdgyk/+zJzgAtxOdtQoML9QA4rOC/a
         4N19Vr5p3hkdQydZwm59OJdrona/3wMkPDe+yYs0b0FHkvvPPQJpWbYWIDTVm/bhiPqd
         umyYLzEr0sBZjPXI1yN0u53WcshRLaiV1tlkRXAgkMQLtj2T9PNW+fqYuRG5AZHV4lT0
         hOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=z9NXJBTYuX2yVfFEwemBKzXghuXIm3ndqcC1KCID+tQ=;
        b=Xl9A+H6HlxFPXB9IrKcqW2YJ699W3x5PFhGHnNr7Ev0pxNO5szNqh1m+HYLbMy0qQm
         AGjwfUX67VkRyFkwxG+P9rZ1yheXJAmlCCHnSDwMV+2X2zauj9Q8GTxHUZ4/dyO1h/4k
         3wj3Awdp6WdiH0EqS5l/ADOb7T4Li6B70tp6U4wsyb3EVYwvIvYa0TjxodpeHGUR3OnT
         IXUYIsEBiaq1q6mkB4mXDyG5p4cFL3xyg23KxNc1/+qoSrR+HigWaj8hXbhinFqZZBCc
         d3iPOtG6dVo/VSfesodaVi2XH+xvLa8FQf6CIVHmr+HhHbmLlbf9PVrQEnlwmd10XC16
         mY3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNeEvAXq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj10-20020a056214528a00b0062101f478fasi6320609qvb.10.2023.05.30.05.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNeEvAXq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yo8-000734-1y; Tue, 30 May 2023 08:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yo2-0006vH-8L
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:50:30 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yo0-0006s1-O7
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:50:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30adc51b65cso3926621f8f.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685451027; x=1688043027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z9NXJBTYuX2yVfFEwemBKzXghuXIm3ndqcC1KCID+tQ=;
 b=MNeEvAXqpGAJ97zZ4ZWbFy8C30mnh0yeQCeSkuXfyN43e0ovRH0g5eD4/Z6mCef3HL
 VoZKuQE1ybl6y4Y64vg8Tn+OGI0O2S4mA6HCC3frd3ZDcDrTiyGVF8SU87r9hLFQv/AG
 apYQKe0zTd1vEGeSofYv9zDBWKCdDKwtOoRKnK0GAR+p7Ft03s1+RQeRelMt754GOFQo
 sJGXo4yfkaNzAKkanVIHD/fiGg69rHYFPyloUOn6vd04xNVxfckT5+iuhvvs/UmOxcfD
 Z2181a1LWofUgh23rASXw7cvdph5F2M9IO+SnjwwYPjYWlMleUR13TB3b+zJiIEx3wEy
 Gzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685451027; x=1688043027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z9NXJBTYuX2yVfFEwemBKzXghuXIm3ndqcC1KCID+tQ=;
 b=DROvjv5oD69bC2lVIlKWkmdxTnt4LH/HkH9BAhO2l6Cb9TECJYlwjbBZIjKX6ZXGTA
 wxHXUIZwTBnpK/tzZsuRTaaTH5HvP2Y/IR2T/BvfD5H6T4hnZgIcA0xlKXX9W6CCihn1
 QGoqrl8bY9y4l8ricISjk2Q58eSUk1w4FRkxmD2mPVn/DYPXIngkStEyHwX0YJDWvpg4
 C3vLXcDGZj6ufNDE6c3stvJ4DmWMgHhwVLbtOCgSYm2zIwomwdTVQ4g6W9xIuboPC1cN
 NRv8QfQZu/156J+zB3eKH4K8A/QQ99jyBKVtEVDtbQrzQ23jdjgFP5u+9FmvDdWqC4Z6
 zibQ==
X-Gm-Message-State: AC+VfDzt8Pj3vtnvSulh0h2xJepUPU4VMDSaCQAZXVGiyk6uz4qbepAw
 uSX0oIoRkQ+Cf9e9y0f5BuTT4g==
X-Received: by 2002:adf:dfc1:0:b0:307:7e22:dfc3 with SMTP id
 q1-20020adfdfc1000000b003077e22dfc3mr2108746wrn.63.1685451027261; 
 Tue, 30 May 2023 05:50:27 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 r10-20020adfda4a000000b0030644bdefd8sm3200373wrl.52.2023.05.30.05.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 05:50:26 -0700 (PDT)
Message-ID: <50a81b76-84c2-79b0-4e20-16ec16555c77@linaro.org>
Date: Tue, 30 May 2023 14:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2 02/20] target/arm: Add feature test for FEAT_LSE2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
 <20230525232558.1758967-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230525232558.1758967-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: h8365hi96ddY

On 26/5/23 01:25, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

