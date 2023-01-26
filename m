Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp522917ejc;
        Thu, 26 Jan 2023 07:39:44 -0800 (PST)
X-Google-Smtp-Source: AK7set82JuV6hBzHE0q3Al2Ze3LR70i9zUz22omRDApFvy+Z1zDJ5uLls/07e+cLZ1rW2QTtrHIZ
X-Received: by 2002:ad4:5589:0:b0:537:7a11:44ec with SMTP id f9-20020ad45589000000b005377a1144ecmr6160571qvx.33.1674747584171;
        Thu, 26 Jan 2023 07:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674747584; cv=none;
        d=google.com; s=arc-20160816;
        b=egzfdJ779m3meNQLkjVhEzlEDMshu+pK5mlhTWo5VJfzfsnxKnsANoXGjGvQx8LxKR
         5JnXFi0hu3lxfeYhjV59sWgPCPyoOteqvVHSiq1wQB3++OtEpyAAdAQ3Dr+U+fcuQ2i7
         K6poMsrWuQvcKfXvs3Pq1VHt564sa3iKhT2LOY3wwMHaDb0dAOtvFqN6O8+VC+3NwPOA
         7kOIuvWCKVd5gpv2sFSOKEWSyotySXxA0X9mrUehuOfzfndZBoMEmF1Qzg8/PTKHQ1cl
         x3HMCfNkaoHQS298PXPn8IlxQesW7tutDRzTbM3+BI4KL7JhNVraCpX+OjMwiiTbVEtm
         ozbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BbFjzNaRKGW2A6L7+E19GfnwvTEEz6x/7c9e0Ylp7HQ=;
        b=AcRC68vD6x67eQLb8Ak4FuUGUqf4SzzK0I4c/cYKxpjohqTuUxr33mtXH4JXo45c6Y
         sij43lg+4Gt8CDT1TxqBWoMPuVJhK4bzB0rXDfYleVHB3vu4IQr7JJ0SBk6neo5Hdilj
         upVWCcpc95vQs7ukV40RtuqNn4c/vQtJ3qNS6U4Y11wPQXuzVuJ6okE8YAMqe8gPSWB3
         HGlPLj6PlAJ0wTZ3PpSkCIaEQ8ewl6HshJtUJ5kOKnO3zVq+vw0hzIWnKbhuwRMQ93iD
         CUX8GhwrU+E5QHKISCvzlUKl5O+bBybFbJqTRCSohbUa026GTShO1scH/I9vifzGGKlt
         13HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bY2NXrIv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020ad44529000000b005346f37ca19si880308qvu.395.2023.01.26.07.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jan 2023 07:39:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bY2NXrIv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pL4L8-0004rF-4o; Thu, 26 Jan 2023 10:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pL4L5-0004qp-VJ
 for qemu-arm@nongnu.org; Thu, 26 Jan 2023 10:39:00 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pL4L4-0005VD-Fc
 for qemu-arm@nongnu.org; Thu, 26 Jan 2023 10:38:59 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so5652518pjq.0
 for <qemu-arm@nongnu.org>; Thu, 26 Jan 2023 07:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BbFjzNaRKGW2A6L7+E19GfnwvTEEz6x/7c9e0Ylp7HQ=;
 b=bY2NXrIvKvpXWIg7uv9ek3LbqXhLhqmXLvq252T41TUjeb+AkzmYwglzSZC8X0GK+H
 z49MZdZCVY4mwy7rKIa1dQmpcTGKaUuKJpN3mxmHNQHXyGCJeSNEOKw9Ov2JKW9Rpnua
 dkjJ0Xij2ZElnqemjkE1kcgdi5Gcz1zWk47C7FnQtuBgcS+2WztrBiuCQ+oLiiB3n+cB
 f2HR3kHAXyjukcdZTbSa3w77EOUhuPtl0JNQbgt8+cu4+KIxYOwX0zSBRs8BioAziouT
 dCeZbTJv54Vn/PRaWnSkB8Bvbt5HHJ4gO9KjESkuCFmtsZWCnmf5T9RRYzRxJUljbo64
 DE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BbFjzNaRKGW2A6L7+E19GfnwvTEEz6x/7c9e0Ylp7HQ=;
 b=JKkdiKTL6XxmafjJMnG9QbezScfCK+U4th7LQTJ0mU45REJZDE49pNODvTTysm6vkI
 KQSqguOu3QC+f6D3kP4IBLGaFweZaSYrjBx6jGRi1HTPdHMh9o0jldEocJbfNHRXvlWe
 BctFhylXvrORRGpNeXCK43gbNUArArg5A3wpUgWGldt/BfavXNJzTnDwLBWvltAMMRYZ
 cTGLf2UGgScDT/jsy7HyoYW9GSwO99Tp9gN1SpOD7as/LVihNVGgWQmS6iI98zdjhadU
 a5YFdxCCjFf8PjPDdT/aKEe5jB6osWTqi09xGfSAwjBqPt0r1OX3LEBbBnZ/OAPPKpCm
 cJXQ==
X-Gm-Message-State: AO0yUKWs1OiDU+bSHNU5fYy1mxiCaW4zzXKcnfUfFrRTqMLLufBbjiw4
 wP6wTaxsn9AwldBTh8dX7r4LoA==
X-Received: by 2002:a17:90b:4a8e:b0:22b:f035:c09c with SMTP id
 lp14-20020a17090b4a8e00b0022bf035c09cmr10589918pjb.4.1674747536853; 
 Thu, 26 Jan 2023 07:38:56 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 101-20020a17090a09ee00b002276ba8fb71sm3466904pjo.25.2023.01.26.07.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 07:38:56 -0800 (PST)
Message-ID: <579dcb33-739c-a850-0f17-f5feee55d00a@linaro.org>
Date: Thu, 26 Jan 2023 05:38:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] sbsa-ref: remove cortex-a76 from list of supported cpus
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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
X-TUID: 10GL0DAjk8vN

On 1/26/23 01:44, Marcin Juszkiewicz wrote:
> Cortex-A76 supports 40bits of address space. sbsa-ref's memory
> starts above this limit.
> 
> Signed-off-by: Marcin Juszkiewicz<marcin.juszkiewicz@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
