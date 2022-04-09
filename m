Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp653528lfq;
        Sat, 9 Apr 2022 13:48:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKFKpY/C5ZajBoyLuVREjpuy2F//Nd7yyxGD/6RtCXhDqyK55Tx5nlhqmgskDG+dhc3dT/
X-Received: by 2002:ad4:5ced:0:b0:444:17be:eb84 with SMTP id iv13-20020ad45ced000000b0044417beeb84mr10497367qvb.32.1649537293350;
        Sat, 09 Apr 2022 13:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649537293; cv=none;
        d=google.com; s=arc-20160816;
        b=nqsAdl1q+2zOQk3AXoen9zRtKqpUWPY5qy0xcDP61TTgqEnLVZsPK6VH1rF5Q5Milh
         3YUVIv8+00P6Ti5A0Ym5L6QaaDVJ4wnbhMP49liQN0k67TbvmJfZ/dZgyA4XmNZGmwll
         vJyosQ1uppo2AzWCS/qQZPOt9kK8X71qi1qUkB7PTCK3gQvV0itfmaYYAH1Xuz8GMk1y
         E4uTcnr97KmMKCuQRSqYvUa0sOPoDaMJNcWd72ADH1Wx7ovSXede5V5+5dKricJTO5gM
         f9E0D09EZ+mxJIFMiqr4Qge8VVFfSlAn3lXKki0T4T53/htTR7YcSWWJ5Omy4ya6q3XI
         MPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=twE9MxGPKuDn6x9Bt0K7VtxCoo4pVL4TP9mNCW6xpQs=;
        b=H8IZVlo305n85+IvBTWvC+Cuj2Avv1Ki2L5aNWuZGFQurCuuUe+3y7eSNq5aAS0b8H
         I9ozg0wLwdR9cvJXH/ED9vTHFdxD6rYkiGx47fGYznZUD0eBuXlzWSnoqlzf23znhHv6
         Q2n+8vuFiOAXfaGUlxBMx7QPH6DqqGPJY8SlsxKK1+6wciDDa8tKKPOA8LqbpQV3HZ9X
         hHATE9/HdFnRztpx1CKXIWn1TLyUzmEoMYDxHp5zDVopAWFtk63ak5zPqVDMpQMJROTb
         MyASBKRCOhgPfS9TuSAJj6TD5SzCCLu8bmo6FDw/eRwqAf8dRome7jfbHHs2A74+k6OV
         KAQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkrCf48P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz7-20020a0562140e6700b00440e46a7d07si2183473qvb.421.2022.04.09.13.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkrCf48P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndI0C-0005Wi-Rm
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHzp-0005Sm-62
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:47:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHzm-00050H-OQ
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:47:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so2601719pjb.4
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=twE9MxGPKuDn6x9Bt0K7VtxCoo4pVL4TP9mNCW6xpQs=;
 b=wkrCf48PDmOvGBUhcwVWkMTzzdfE0FOvbBqcqy5mv397HlVV9KRSQpOMwNSBHjTJNz
 x0UCzc3ZQxbW5XIVaupyH3vR+zAC29N81DICjFwI6qR9twTQVGA6YQVWi7RL+jc9ZZtu
 cyHS8YdOUGAo7QEXq4LArAMJt65DwnEoGqA5aaMgHg3XYcT+UWAvBikR33VdJ+Phd5hc
 /ZlAgd/+nlQpuTyIDTEpi07BVBsWfYCQdqMelIHe/QR2wpjh7MQ+wtx5364/CwBnVotV
 dHPEmKQhHzQM9smzm+L21j+kZJ4+7LTm0tVxyCG/lbBlFYDHk2LBKRIYkmM0gdfv/0nb
 VErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=twE9MxGPKuDn6x9Bt0K7VtxCoo4pVL4TP9mNCW6xpQs=;
 b=TLtDqrcIZR4aNIHmFmYREWUHFr5s1shDEG6JS0bcN4nRmaH7ReJlanX2vzEcWsQH0+
 YWxk7S451SBzpPe9WdXuuuLlyJhsShP1GEpEDN1c05aBAJGYqT1OVFE1IaP3tWKPcncD
 B4YIDCHteRlubMYABeCx22cbfT2xOsyG9T7aZJw0yytb4EuWqe5+fjVonLIa/NP0Mh16
 kcRYiqZob+TuB7EtAkRzjSQW4CaofHUhU3Z85jmoyhtxLu3bdrUU0Kp6JCbhMxqOpu6u
 RMMNh7PqtSwBQEM20JIck3LrFmtBxF43NDoIr+uUVAcs8uu1UMCcIQ8avlEQzyAyeLIH
 RX5g==
X-Gm-Message-State: AOAM530jbW+t6PtQ2/mcZJYu6X5avM+uVNTjYCcf45tl82X88w8ePCIV
 wCnubDxYCFWRG5t+koQ6dStJxA==
X-Received: by 2002:a17:902:f64c:b0:156:4349:7e9b with SMTP id
 m12-20020a170902f64c00b0015643497e9bmr25618254plg.139.1649537264994; 
 Sat, 09 Apr 2022 13:47:44 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00170d00b004fb1450229bsm32072933pfc.16.2022.04.09.13.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:47:44 -0700 (PDT)
Message-ID: <f86902e0-8cf3-c492-f356-8d5dd438597b@linaro.org>
Date: Sat, 9 Apr 2022 13:47:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 37/41] hw/intc/arm_gicv3: Update ID and feature registers
 for GICv4
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-38-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-38-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: CLWD3VYiJdn/

On 4/8/22 07:15, Peter Maydell wrote:
> Update the various GIC ID and feature registers for GICv4:
>   * PIDR2 [7:4] is the GIC architecture revision
>   * GICD_TYPER.DVIS is 1 to indicate direct vLPI injection support
>   * GICR_TYPER.VLPIS is 1 to indicate redistributor support for vLPIs
>   * GITS_TYPER.VIRTUAL is 1 to indicate vLPI support
>   * GITS_TYPER.VMOVP is 1 to indicate that our VMOVP implementation
>     handles cross-ITS synchronization for the guest
>   * ICH_VTR_EL2.nV4 is 0 to indicate direct vLPI injection support
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 15 +++++++++++----
>   hw/intc/arm_gicv3_common.c |  7 +++++--
>   hw/intc/arm_gicv3_cpuif.c  |  6 +++++-
>   hw/intc/arm_gicv3_dist.c   |  7 ++++---
>   hw/intc/arm_gicv3_its.c    |  7 ++++++-
>   hw/intc/arm_gicv3_redist.c |  2 +-
>   6 files changed, 32 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
