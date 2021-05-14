Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp56542lfg;
        Thu, 13 May 2021 21:19:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJtHOzwV6IKRpcECaUwa9YNtM9rNxA7eLpziCz28WOzAwwGvmYKWkeToN8FP6ssw/VREwZ
X-Received: by 2002:a67:2e13:: with SMTP id u19mr39738158vsu.51.1620965984286;
        Thu, 13 May 2021 21:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620965984; cv=none;
        d=google.com; s=arc-20160816;
        b=SwIiZfArodCIZprSPnuTsEFaMDnl0sdC8t6Og12ZDpExyx6RIxVl9VPnjhs7SYk/f7
         lgRH+ZK7VA6VKf+yRO2CyxT3Lry0lKnJUMfgntZvfuMaDGBHv/1ysAPnKbrGZNPdI8Nk
         XBYUMPonytOVIHbjttK9yhyfOy+T+yulU5pdnu6QYhXPd2A/HXwqB5iv09hTV/2GjiSv
         4WOvxwwQqIsFH2XnIVTBmI7X8+Y7LgSrKQknStfQHLGGnAx6+Zwh/HXMCA0NHeD6I0Zy
         DAlPodNtJuy06XuNTU14conVHlEq+S8o1C5GaFVzmHxtG0aLYmsFI+4uqCYOTHAhPWpR
         wihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MfKiCXlDwQT9hqznflIHbvKOzaKkhvFZ7AYYtQVo3o0=;
        b=1LsnkbNNgtzQAMnfWQK1hz42Q4IGGs2pMMrKLG9b8MhoqCgjSpMbCvcvl1foVnjmr+
         hClJ5KxHRPCKNkTWkEONmLXxzjoWO+OFF8XerfSgz4I1+3LOFxFL5Wr8WbMRiUTOndMY
         QQRLJBddAhzZdtLiTcXFUsStz1MhCyDkdUQXRuS8nnRMZKxNA0wyQT4yQr/wwuy/U80r
         ae7ijhV0nJbw+MsRaGjgb2CztckcQWQUmb6A0PjtVpOC5G3rD/DelfMAK5fCJFpFmPoJ
         EAO++zrUKdExk2N6WFhVXEKZTYZ79Qqd4pmxGmeNTIPsUPfDOcr2NVlyclN6wisc/ETK
         H91w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TzGZjx7Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14si3226375vsj.26.2021.05.13.21.19.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 21:19:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TzGZjx7Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhPId-0004pi-Ms
	for alex.bennee@linaro.org; Fri, 14 May 2021 00:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhPIV-0004pA-3B
 for qemu-arm@nongnu.org; Fri, 14 May 2021 00:19:35 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:35731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhPIT-0005YL-Je
 for qemu-arm@nongnu.org; Fri, 14 May 2021 00:19:34 -0400
Received: by mail-qk1-x735.google.com with SMTP id x8so27688594qkl.2
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 21:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MfKiCXlDwQT9hqznflIHbvKOzaKkhvFZ7AYYtQVo3o0=;
 b=TzGZjx7Zlx6ZV5IDVBKE9DRdIDLBJxMVM5z4jt+iDgp48fhFZ5numBjgod/tdOHIsV
 RzKKVpr1HBn1LuatNQZLT/hKzx0RadcWNJzh5lRtuIifjCzzv+iWs/juFDXwAfR51ytN
 AmujgV2RCPNd4gdQMZaOu/tevOnisYOgLG5m9GcVm3KkgKR/EmFduvqnKQhW4QMh777h
 +pr1nrjQqEey9WV/odrZWujjd+nKEGzpBRPalmo6WC+6k9q/JV3WB32iWj7tU1fptK5v
 d2p6oZxq9ZciCcpNUKFr9Do+pkkPbUIqTnHxVv9Qvi5grCwe5Y7m4JcptX4jMKZFBmYQ
 uDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MfKiCXlDwQT9hqznflIHbvKOzaKkhvFZ7AYYtQVo3o0=;
 b=qaj9n9BJRztzB0lNKnjpsEKIjCcmVuJfuqw0PWEjiGNbMyPASuPZKghMv/t8mLtwCf
 RWeNfaOQp+zHshouVcRBhWPnMinvUdR0XyKnyuW4Qne6A+URETKwPBLjnzH8ZMaa2fXp
 2Zx8ohlzDKo5VwktfJYc+gpA5uT/1AQ+90yyx98tFjg8ciJuM/KTPWwaa4+3s0a0MuDI
 JpaRJ+qTL/o/v0Ey0IZLU6rAKTPO9tT+c1rZr7Y18Ee3cXnsrEBIDRUJMhLUh2T3nz3J
 RhnR81k1/ZlUB5S3UJLAusxK0g95srniQtTnludweoRFl9datf1fJlAIb5h28FPNrgLb
 M7ag==
X-Gm-Message-State: AOAM5318yikLzdlaoib5r0TS5CkmXwWxaXLPJkz4GPwjoJ+CPlH9nYEc
 4GSRLCtBUmSxv3ITlu5+7H9RDlaLLBycJ6uNGyY=
X-Received: by 2002:a37:b107:: with SMTP id a7mr14397695qkf.366.1620965972534; 
 Thu, 13 May 2021 21:19:32 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm4196614qke.13.2021.05.13.21.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 21:19:32 -0700 (PDT)
Subject: Re: [PATCH v9 2/3] target/arm: Add support for FEAT_TLBIOS
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210512182337.18563-1-rebecca@nuviainc.com>
 <20210512182337.18563-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cac9bab-c9d5-977e-a88b-c7787c9e1eb9@linaro.org>
Date: Thu, 13 May 2021 23:19:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512182337.18563-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L5QKm5OV7sgB

On 5/12/21 1:23 PM, Rebecca Cran wrote:
> ARMv8.4 adds the mandatory FEAT_TLBIOS. It provides TLBI
> maintenance instructions that extend to the Outer Shareable domain.
> 
> Signed-off-by: Rebecca Cran<rebecca@nuviainc.com>
> ---
>   target/arm/cpu.h    |  5 +++
>   target/arm/helper.c | 43 ++++++++++++++++++++
>   2 files changed, 48 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
