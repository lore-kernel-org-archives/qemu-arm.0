Received: by 2002:a17:906:a8d:b0:883:7228:2f81 with SMTP id y13csp7504ejf;
        Fri, 27 Jan 2023 18:37:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/DWBsEIu1GPuF/Kn+z3Ski6v3hcFe27B8/ZggOSlRWg0UmX0ZOwulcTqX5bCxAhb4pluJz
X-Received: by 2002:a0c:b29b:0:b0:537:815f:6c6b with SMTP id r27-20020a0cb29b000000b00537815f6c6bmr1073406qve.44.1674873431333;
        Fri, 27 Jan 2023 18:37:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674873431; cv=none;
        d=google.com; s=arc-20160816;
        b=uYmybaBvGdU/Bfg8VSB2BI1jC4Dvx5xA76uryxrTmbckJxz4+63HX1pJZ1lQ8Kvvdw
         EuE3AdTP/p9C8sqTtblHM3qXwUqsglq3ZFsMIUyKFG3xpbgOjGxp8J8NNPzSjpSsLyw4
         LaMlRrU1bILBRy3IhZpyBQvlovwwogedZqqeoEtfPglw1qAkr+vvIWAMl0eSNNbah0Wu
         HAy52AvuBpdp/nlnwzQcNe3G1e3i5Hb9AbYXdiOja+OdRfMvwImsBBtYNGKhPgw0e8xC
         17wbrDYVzpur7QMv9usrbHyOHuw4HgZCgMAGQHPjMK12VpMnCQB7BfFQLfTPpF8JXE0q
         r/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=PfhjYHQxkLDkhgFEAq0RDCvvIlvQ17QxBaSnhHldefI=;
        b=dMMJYSNr/IHesX76LIU6qnO4RAe/RhU2mczSmQ+0OIqb4d26W/pdel9Z4OAL8RYlas
         v46O0BzdOogdFhcXvK/e0QoUOa7l1zFifZZLjIXrqa61AG4FnnqMRWV2WmURXgDlWkVR
         lAIXHWxtyM+2Zxit8bvkIvJRIrvi1q6hGar4GCa5lF6X2PiKxtfFlZGz937GBFJ1Ldem
         OcbNQtPV574HQCpJkkPI8SmjErypHLKJBQcK5m0HRFHU/ryRpeAA8ehUo9fdU8u6b6Zv
         S7B+JKTNA9AP7LZREBeMGrLpq5RUB3YAyKr6Spdq6MPuqrQ+5qZumq5tF7YVozuYge5u
         t8NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tw2PyEap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n74-20020a37404d000000b007062eecae0bsi3631241qka.114.2023.01.27.18.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 18:37:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tw2PyEap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLb5L-0002tO-Es; Fri, 27 Jan 2023 21:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb5K-0002t5-9J
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 21:36:54 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb5I-0006y6-RT
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 21:36:54 -0500
Received: by mail-pf1-x42d.google.com with SMTP id n2so4483238pfo.3
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 18:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PfhjYHQxkLDkhgFEAq0RDCvvIlvQ17QxBaSnhHldefI=;
 b=tw2PyEapUMzQrrb12aTaQcPKX4SxbD45xkRjnkh6HltEjyQSOLERHXr5XC8FHEqVbs
 0tL+S6XF8VlHvIeMY0kuC6HnntQH6ahYPQdSMY8IIZoJTPwFBAwsJXZT6MDL2ZOpepNs
 TGjcO+QxOTT854B4Uxgp/jL6C0annPyG1Y5d5EmMHEVJE+X7kGPlAm7Loo0wvD6gTi08
 tl7k4Sub2jyRI4nHhjB/xyAX1TCmXPxkxhx1UDrttyrlWMJpOZAs8e2BYHaecRNAnAH3
 lutym8AmztaJTSM/p7BnUVg0B2wuy+7Un7q4TtchlsYOujOFaNZCdXcEKVdPeQx1iy87
 gZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PfhjYHQxkLDkhgFEAq0RDCvvIlvQ17QxBaSnhHldefI=;
 b=MHI73vZhpOu89Qd+Vvh2a4w3stps7LwejlI6f09iL4zprsI9cPN8QW/30AAM2je3sV
 BovmC+BnvKh9xepLSCqzswL7PaSulxu5prv5Qoym0fk6FG2tYfC9ic2TRVRzC4R017Aq
 F71YFKfl+lhTTHVIYlrN2EnZKl8KPUy+jAQD5OYNa/sxV7MFqblJ80a7jtMMWynYd4/Z
 bAP/vGOM6qEYrrQS1BstVZUFh6gTHzIS5ndGhmo2gou+b5eK+ENn2K4k+D58BGJG7Bu0
 Mz8eNwzDXD28TR1f6lOx35qdUERwPGtRw4oe1l7PS22oBQHiq91A/u1nz8TJYZPuYozH
 CLfA==
X-Gm-Message-State: AO0yUKVATU+wLsEw58noz5bCPtJYJ7NGluof1FgaqtBHE1iTNKPoVM4C
 Er422PjBgZmetX/vQ0vAtwdQdQ==
X-Received: by 2002:aa7:9834:0:b0:58d:9251:b2a6 with SMTP id
 q20-20020aa79834000000b0058d9251b2a6mr691299pfl.1.1674873411268; 
 Fri, 27 Jan 2023 18:36:51 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 y4-20020a056a001c8400b005906fdf418esm3274399pfw.59.2023.01.27.18.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:36:50 -0800 (PST)
Message-ID: <6b4f7ce3-a815-50c8-9568-054271fd5b2a@linaro.org>
Date: Fri, 27 Jan 2023 16:36:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 10/23] target/arm: Mark up sysregs for HFGRTR bits 0..11
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: oPFl47yi3KBo

On 1/27/23 07:54, Peter Maydell wrote:
> Mark up the sysreg definitions for the registers trapped
> by HFGRTR/HFGWTR bits 0..11.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> The annotation of the cpreg definitions is split into multiple
> patches for ease of review, 12 bits or so at a time.
> ---
>   target/arm/cpregs.h | 14 ++++++++++++++
>   target/arm/helper.c | 17 +++++++++++++++++
>   2 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
