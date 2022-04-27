Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1117326lfu;
        Wed, 27 Apr 2022 09:21:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDXIh0oXr0RY7HConcqePJg1CVQxarVUMfM24ceg++LYqJ8nwjbQ8GDLm3JqTGeqzox93D
X-Received: by 2002:a25:d3c2:0:b0:645:74df:f43d with SMTP id e185-20020a25d3c2000000b0064574dff43dmr26141877ybf.394.1651076464383;
        Wed, 27 Apr 2022 09:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651076464; cv=none;
        d=google.com; s=arc-20160816;
        b=l7Wtku1fKtzUiRCczgL7N5obF+n9E7xSe3UD79/ZGC237Fxce2oPgX84syH6/P6Wxm
         kOHARUhK32jfmROcyUeNwaA1tTISLgG7WammIBX0c0JPzpHdIq/8O/a4qco44685Nf90
         RuohLpMmznIKDLCJ/0OJQjkGzklEpCE/PD3YNiSGdOyEFV15RS1v5RhQHGG/Xm7p7bwY
         VYqBCCEyF6UJQa9DWpxhxPuaoNw/437SLqgpRiiVJZelrGyq1+XZ/US+bTF9A0f4tWgn
         aWSu955Vnj/JBtMPffNwHK9LqcsdH1bAFaoLdhjjvttJ92is8LMxqLi1sDXP6pzs4+U9
         OoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=OW++peAFDsCVIrgYtbjFsekX4dEE9FsplicciWrO38k=;
        b=waRmdCblfwyRWl7+rrcUxYH+uDbVpy4O53p89Vpc/pehI6MADV4v+mY+ld22SfIMcf
         OuGIRGvtG3fXrckPAWIeshvf80Umf3wcfGFxaeMLmmxE3eZ5vfImpMKrZgLk6UXZW//q
         iIvuAEckPDnKNFmMTrQBKo6pmVd6ZYOOzcLcOyIGkKCMNfPnXpJumdM+mq7W6xapqQ3x
         XuYgdCfh5NHN9C3bR4+VZnfW/fLYPtv9WdoDyYmFik0YPhRR48lpe+YH2SwX6xQ50LhK
         PtrU/e+4f1wdrM2MlaJ40xEGSQf7t6EcLN/iVHwVX2f2YHgJLBYKlh1r2mn2S7JuEq73
         4yfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gFmyqR84;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m63-20020a25d442000000b00645772bf14esi1505293ybf.5.2022.04.27.09.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 09:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gFmyqR84;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njkPX-0007nx-Mx
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 12:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njkOy-0007nZ-LK
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 12:20:31 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njkOw-0008MM-W5
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 12:20:28 -0400
Received: by mail-pl1-x630.google.com with SMTP id q8so1989476plx.3
 for <qemu-arm@nongnu.org>; Wed, 27 Apr 2022 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OW++peAFDsCVIrgYtbjFsekX4dEE9FsplicciWrO38k=;
 b=gFmyqR848xkKSvU2F+4xuckCfxK6TE7vQ9EvJ5YoUHAoxrkag0U988qSXjPLJKV2+L
 5N+MqE1bZyo3KhvGwhu3KGpwj1A436S2lnHO0/fi5OjY/Q3xBq0b0ySPEZL5A4K82/HR
 lauiW+QmVptC4BUZM9sR0c+3rWEGIbk6mLKFRiJU6tEbBSXFrmnj2DSE7Y3jC7yNA02q
 FS5ajK1dEpTL0YrkssidEmq51fKsIgcQlYiVK4ai7GBn4DMUNkGn3vqaWEzSuYLVNT7B
 PsxrFhPc4H0BApR3kB+4RJ2UJNsz/raS4QaYDZ50For9iokKFRBnj9CH9Lrhb6x+kbjT
 LJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OW++peAFDsCVIrgYtbjFsekX4dEE9FsplicciWrO38k=;
 b=nPw4ct3L8MFMqceiR3xV8Zpg7xAt9X0CDJNrXjWsWPvJNFehZmFItObtbsn5K298MO
 27d3u+huLTsbuYiJyTRVWO44QXxXz78sAjXqEvfjJSMOcW6SuvpuPdxwcQFx61uBexM5
 L881m1eBTzxb4W0aJJWVmgpsmIYSDYksZHPc0jqEfBqq2AErl/z2+LW33bQRqjCv2lTg
 8pmF6Nx8QVnFAjQjYsRH/bKCpjoSYDzZ7Jyoj7iCCCvwC5zxL9e5kjx0+JyFWtEvPz8Y
 JVQn9vdES0Hi43oBTsdCAVNGVcAaRtOc0XB+NKkKyt4a0SzC1yf7iOvucyuZExGrVGVY
 jFdA==
X-Gm-Message-State: AOAM530X/NZTwURF+tukYiyLjd5JzdlxsNzltEYKqY+oGXZnVB1chkz3
 pxtYkRw3mtdrDR+buNgQ4JTGCQ==
X-Received: by 2002:a17:90b:1b06:b0:1d1:6633:5ec2 with SMTP id
 nu6-20020a17090b1b0600b001d166335ec2mr45033907pjb.103.1651076425621; 
 Wed, 27 Apr 2022 09:20:25 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a655a8d000000b003aae0fb5668sm14386981pgt.42.2022.04.27.09.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 09:20:25 -0700 (PDT)
Message-ID: <817b585f-3b0e-29c2-9373-39c93401d5d5@linaro.org>
Date: Wed, 27 Apr 2022 09:20:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] hw/arm/smmuv3: Cache event fault record
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com
References: <20220427111543.124620-1-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220427111543.124620-1-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oB5UERxkte8M

On 4/27/22 04:15, Jean-Philippe Brucker wrote:
> The Record bit in the Context Descriptor tells the SMMU to report fault
> events to the event queue. Since we don't cache the Record bit at the
> moment, access faults from a cached Context Descriptor are never
> reported. Store the Record bit in the cached SMMUTransCfg.
> 
> Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   hw/arm/smmuv3-internal.h     |  1 -
>   include/hw/arm/smmu-common.h |  1 +
>   hw/arm/smmuv3.c              | 14 +++++++-------
>   3 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
