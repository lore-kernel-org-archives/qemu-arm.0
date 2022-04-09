Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp175045lfq;
        Fri, 8 Apr 2022 17:17:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHN2FeTf+M2RBogj8CziPgknVXCu0pV5I6W17Aybw6E7vlLXxF61m73aypYdVxsTeWdffo
X-Received: by 2002:ad4:5244:0:b0:443:df14:66c0 with SMTP id s4-20020ad45244000000b00443df1466c0mr18231179qvq.98.1649463453194;
        Fri, 08 Apr 2022 17:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649463453; cv=none;
        d=google.com; s=arc-20160816;
        b=HVd2ppZl5AdG7ZZ1aZV+PoBepiBg05ESvjqquDoYWlakFLZYJM0Pl0BT9C4osNwZSr
         uQ1FhOm5sMTGY+o4sOuIYt/xIkjIvbN44AL78aRDOOt//u0LDB5be2I1UpKG3l5zLf20
         4umlDVefy0UIuyZEHyGSjYjRPbfJAnTGvPXWsp5xsHU+JpLNQ50xJhl43w/n6hlWnqmG
         RzWMrvnBBdOMOOtO7n2oKYCPzgMNPyc5d6olqx7/4Vc2suhhiRNVUWkQCqT3AEabQU3n
         oYby9vCNVBTHkFmB60DP5eeBZqoS/v0Nw7v+xlk8Hvk+nFRTrcE+xEyXWzvZc36/HREc
         qTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=BuWpH8rgjblEHze3wJrhSPqdrqFkhN9R04a7GqOtU8k=;
        b=zASzbY9xpFwvV7Urcf+icCmKFenRORwkjkecKPuYLkTSl9TZ+4v2/Mi9QQfXb1DhEN
         TlPYg2qOJzR24KV1Ug8Gbcd+LR24VOYrYd9GOa//AT4IYGpwm2IvrArbh+eHxnXhKf6Y
         LIDTNXPk7I+9/ODzjAE8pzJ3BGEHegFCzR9whgq3RO/Wo54Rjyi9mXxeLxK/8Oaif2b9
         dH2R/iKMRGeubHHNlqjZktE4ajvOjdfRcFPGsRAnSVI42Gx+PXYwp4TPs0lV+d0oJn8N
         xTvmJuauBbhmCaO3UoINnlrcUlCJlxO9hfdPKRn015HQ5/TDIy2Gy6GPY7NDY6FibfGq
         UmGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AiGdODlO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br10-20020a05620a460a00b0067ec1d9ef94si1434454qkb.23.2022.04.08.17.17.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AiGdODlO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncynE-0008Bs-Nn
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncymw-00083J-JC
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:17:16 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncymv-0004wj-2o
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:17:14 -0400
Received: by mail-pg1-x536.google.com with SMTP id 66so9078214pga.12
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BuWpH8rgjblEHze3wJrhSPqdrqFkhN9R04a7GqOtU8k=;
 b=AiGdODlOnB3r273MWyhRnI12yVfI9nZamw3J4s+ajVxc1S8pYPqq+8hk+ptZ8I0bd6
 2xxZ82r3AIZnXHNASUNZHBn4Ooz+Hduj86kbT47woeF5S7Q3pM8bFYuso/qMTvuKfLpJ
 hZmPeq9UbLTjc05m/IgAqoYDGNe0gcC2vHYbjpzNusBZ19gxbPnRAeG/4DEDFetlYggh
 Iivk4mC5wNNWXj5DA8PPprpP1Gh0Vut/WH4wK380i4D1aUgDtImEjHkPBOwwcY4XMC+f
 7BUM9o7VoUWCs9aGrLlnPv7o4nE0vnm/ZJ2ecq/ttqgdBq7jxVpAm2VlgTm9XIy4Edii
 /EKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BuWpH8rgjblEHze3wJrhSPqdrqFkhN9R04a7GqOtU8k=;
 b=npHQnMufPONZhXUnqB59WphACsFChkL1h9HMeITXwkhv2WIFi2cNSMqgXkCNAFzmhH
 AY0K5JlRz5XNtLPFX+VGp7HkcobClWGs9+066gc0O3gxhH+9OyrqxI/yEc6ojwsGpLJl
 1jZGPAjv3jhCwaLyjZpGhksAPrHTsL+MOa/nI63P/OXn0S909uY6+A8ul7nAvo//+YSB
 nv/CvKXWM+t1u9fFF2uPtvwkhhLjWe/Mq9MAfYtv7pi6fR72Bhrw/3ZjEuFJdOJmqc6r
 tFz0o2OrvvXFU0my80oYXB9x9Ygyihu3pv4FThF134ymfHLN1G86s+Lb3LzBTk0P/mH8
 a0tA==
X-Gm-Message-State: AOAM53039H8O6yYx8mKAH5lL0N9viQep1lpI5tXiXNScILpzhRZQxB6S
 McoUJv96lMCxmWfMBT68MepD0A==
X-Received: by 2002:a65:6a13:0:b0:373:14f6:5d33 with SMTP id
 m19-20020a656a13000000b0037314f65d33mr18241834pgu.62.1649463431558; 
 Fri, 08 Apr 2022 17:17:11 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a056a00190300b004fa2411bb92sm28704592pfi.93.2022.04.08.17.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:17:10 -0700 (PDT)
Message-ID: <6004f6aa-f71d-8473-afa7-a41833f6372d@linaro.org>
Date: Fri, 8 Apr 2022 17:17:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 08/41] hw/intc/arm_gicv3_its: Implement VMAPI and VMAPTI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P6NP3IHyi1Vj

On 4/8/22 07:15, Peter Maydell wrote:
> +                      "%s: Doorbell 0x%x not 1023 and not a valid LPI\n",

A little confusing for hex not decimal.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
