Received: by 2002:a17:906:a8d:b0:883:7228:2f81 with SMTP id y13csp12432ejf;
        Fri, 27 Jan 2023 18:51:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8LhWhl5eniCJNsNNJfJAU6Sm0umOQW0iryuL5RZ4Wf4jpPFGOYlv1h9+mdTLow++ijzTZx
X-Received: by 2002:a05:622a:5d4:b0:3b8:2628:7ec2 with SMTP id d20-20020a05622a05d400b003b826287ec2mr6864620qtb.31.1674874283596;
        Fri, 27 Jan 2023 18:51:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674874283; cv=none;
        d=google.com; s=arc-20160816;
        b=wf9+GCefd34l9cHPOp11sbC/YLOZwol3qxdJcMXOqdz7hVUo4Pr8esXROhaPW0Xjns
         vPFggmFNFzjbQGdin1qPnBEX68eIPQT7pT4GgIRPN+5nr7DCAYi0ffHEaJ0N4DumJ4y+
         fJNScAhaDtrVFsJR/C1wKPBG2ry/6lCXwxXyJcu9tpA1mfWcSVoKnzFCy6zfjibjFOg+
         pzWoKkhfZlonemcFeqxRBT2adJAI/+jdgBOUtUqJ+kL8C5h+QRfGtJkn+B+OHXhPD8G6
         BeqnlP5hLnzwheIuN1Gy22X0nAhmRWwqjCMROIqzDy553qfO+ZXUKdOKNDGSVazH+kwG
         Dcvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qGYerxNgvB8V5Qq+bZAzG2YBBq6Itq8dw6o/nyS4fNA=;
        b=MCXZ+txmYBrQE86oodsN+iiNzL1wiDiJ0x5cep93ckWFz+47mTB4j4gDoX8ChhXYii
         0HrEdOZEmyzJ6kf7vdDSoqCCjLsmqvjsY13BzTagI4z3Nsq10RC/csXzrFKWLWZdXvpy
         9NXcxh0/1/acv9LJ5jjHxMHcsAOmcuOeaLkc87kAXIs6K2bIODDIJxdeY8Zz2E/KNlg4
         lMeMofuPoZToJtzi661hoGqkU4qKFxHZp40beIOiTICfLRHA7byHpAk/IwTDkCtCdVB1
         07htifwXnlCo2sJ5EJ9EsRRJBOlNUi/nsn4hbxufddyfwcqmMvaGygqxmT+6YOvsO5/T
         nPwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwCCnC2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19-20020a05622a149300b003b645b7c7aesi3391959qtx.115.2023.01.27.18.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 18:51:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwCCnC2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLbIu-0008Bl-O4; Fri, 27 Jan 2023 21:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLbIs-0008Bb-O9
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 21:50:54 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLbIr-0001N8-A2
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 21:50:54 -0500
Received: by mail-pj1-x1033.google.com with SMTP id o13so6368070pjg.2
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 18:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qGYerxNgvB8V5Qq+bZAzG2YBBq6Itq8dw6o/nyS4fNA=;
 b=XwCCnC2DRjgM6G+9GWQlvCjHim/WyhWt3UcXslojtNe5BZW6f/JHZx/sO6osUJdspm
 W77KBejwe+hYhpjFBK7b/HXIZK1a38lYrc+aRmhQKfDOdj0J3/+pivvI+6/2MC1QfpBB
 Dh2IX8oPSRfZGrH7BCa1S8x8vgvAqy5My3M9SUYQjZSffw6E9W1WexLfzhgmUzxzhggX
 60oJbkE+dFqS7jWTornc2KNM5a/2J7TAnuEEaQ70YcdC3uIFTMtlZ1EbX1AnckIjEAKT
 XTGyfhAUbOAEl3g7iA4KryRk8WcDkqzK5OE5tdvcC/C9+zF54rsNYCUCHZXuL9BrM3yJ
 tCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qGYerxNgvB8V5Qq+bZAzG2YBBq6Itq8dw6o/nyS4fNA=;
 b=AvFRfccZ0vEQoKLtnGIQZutpYA/85XKGR89qComhJZ9XNSty7HjUbBl843NAhcsM+2
 1ZfnPvCHiIN66MOOLWMclO13UvTQ9O6lGHRnmLCkGh4EasptVZtEwX0YJzEiOwIEgvF4
 2o216OAnndcImstreSuD7aNXyPaHXr3ogFyPAkANJszeALV6/PzIsAGxOUtCkzVzqHdE
 S3jGYEBm0Bzr2oDQp2u/VspaAvJV9lO5JBbkUQIMZoDokzmrfUHZ3xgv9WDC/u+hyjkZ
 OaFTF2sKB5WH2MVS2jctKEc26eQCNs7kuV0+bLOrN0QU3cN9Al8szbnbxZwjexxQjQ6w
 NhwQ==
X-Gm-Message-State: AO0yUKVnLerSbz9euQkPB1Ad+ZDgq9uNLTl2tBywvdodiv9YnWDYyTUk
 +wifpX8Ada9tOtlNsSDDn9IqpQ==
X-Received: by 2002:a05:6a20:690e:b0:bc:7371:e3cf with SMTP id
 q14-20020a056a20690e00b000bc7371e3cfmr2158981pzj.59.1674874251474; 
 Fri, 27 Jan 2023 18:50:51 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 dw26-20020a056a00369a00b00580d25a2bb2sm3284517pfb.108.2023.01.27.18.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:50:50 -0800 (PST)
Message-ID: <ccb73551-9139-fa36-e449-4b585293b73d@linaro.org>
Date: Fri, 27 Jan 2023 16:50:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 13/23] target/arm: Mark up sysregs for HFGRTR bits 36..63
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: fOdC2Ufmmv9M

On 1/27/23 07:54, Peter Maydell wrote:
> Mark up the sysreg definitions for the registers trapped
> by HFGRTR/HFGWTR bits 36..63.
> 
> Of these, some correspond to RAS registers which we implement as
> always-UNDEF: these don't need any extra handling for FGT because the
> UNDEF-to-EL1 always takes priority over any theoretical
> FGT-trap-to-EL2.
> 
> Bit 50 (NACCDATA_EL1) is for the ACCDATA_EL1 register which is part
> of the FEAT_LS64_ACCDATA feature which we don't yet implement.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h       |  7 +++++++
>   hw/intc/arm_gicv3_cpuif.c |  2 ++
>   target/arm/helper.c       | 10 ++++++++++
>   3 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
