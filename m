Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3862770dye;
        Wed, 2 Jul 2025 07:46:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUbWGch1v+Jzgj8GVUlvu8TxfGDSj0z0xxSz9jZCH7S6s0hfLPCl+UDAieX0Ua7c2w2M8Zbx9BaiSRthw==@linaro.org
X-Google-Smtp-Source: AGHT+IE6rjHd8d6NVM2XcgBZcKw7ko1lAx42v0FDiSSfS1PKi7CES0kKp0mXkmsXb/zAN6IZF9tg
X-Received: by 2002:a05:6214:76b:b0:6ff:1548:6f27 with SMTP id 6a1803df08f44-702b20aa09amr45105076d6.42.1751467576953;
        Wed, 02 Jul 2025 07:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751467576; cv=none;
        d=google.com; s=arc-20240605;
        b=PXoZrusSiA+4NWQp3egMxKoIdHxjG9FYFYGQTsLN91kzkzp440sE22bXQlK3dauJyV
         R4k2wUpvhy3qwIVr7rkzMmhjiL/MRs8tQz0a6LtqpTudeMX7SGCyeIiAwMOa9MNIZLr4
         93HD6IHkQ9oerP0Bg0Wf9Pd7qubhg1cpekDnQp5/XFdaI2tkWhh5y2fiFZhKbiQeE3O0
         0eMk1cE/n0U4WQdt0HU0mJxMEvcLyoecEjHiZi9/cM7uvVkQCxy2r4iDk6DE8Ui3Rbca
         T/8Ga9yahHGv9Uoh8jPhfKVYaHaClKgjmEKU4rP4Pcui8ieEkDEWlDd4kOmvktOB0Vsm
         2rxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TcvruI7SrJqMu/I1zSdlWdkR1NrX7rdtg+XEHoMTuFg=;
        fh=ysey150Zo7UQvfLpyzEx3SehrVuNZYVosP1lmIwyBrs=;
        b=lj6btxne9dI3pXT0AElhnBzQaaLGdzAd5aExtB/CSK0/anIUvVKvdcpUI/fP3Oj5gr
         IG53W79P8iONDD3X/vTkxqVH0+YsgiV2zmrtSOfFSWxQgzGMIjPknict2Ez+xkETSMZp
         Jngg/vCmGZdNK03Ccy/99QcdENwnyj5ByGDyAd1Bl71L945UAKzcdZ5+bvZbyBroVWqg
         j8qWQIE8sWbFsKMvwXRbOKUwnleBSg9ldGGhEy50BkKpwLlEagH4V+ywzbBwfwXokwSo
         fBES/vReBmXlDuLPsPzt2Cr/RASMbXRMbGrcue6PCgh5VzzwP0HRVoT1htQovQp+q7FJ
         Uycg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CW0VxKr1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77354867si151004536d6.226.2025.07.02.07.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 07:46:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CW0VxKr1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWyiw-0003Zc-GP; Wed, 02 Jul 2025 10:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyiv-0003Z0-9W
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:46:09 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyit-0007aq-05
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:46:09 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2ef60dbaefbso3139092fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 07:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751467563; x=1752072363; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TcvruI7SrJqMu/I1zSdlWdkR1NrX7rdtg+XEHoMTuFg=;
 b=CW0VxKr1S93uGqyYfFagKyOwQMgd3Yx3mO26ebESB+xLRhTZ6qeNgelUVxPWMT578y
 mxnqt4rPICRcEdJncVMjlHbKwXO9o1I+sR/un0IzOwjABQ1ei3HS+aILzkksMjGj2b+r
 gjJ25NsCL/ID7hjADzikxD9kt2k8MKx/qF0aoPFElzsPVZeaHhHKS/ctSzlAlqa7bs3O
 a9911u4Ckxs8aikt/9Dou254noQUewyZx5hPz3SRfbZ7wipRDuJ2o0QXjPeOR6P3jfiT
 LJGc8lIn9q2JtgjloX+kM2LEt/WTMzdll2U7l9Bm9x5RZwIkGJpOqT/yhjND+Gd5Tkig
 2tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751467563; x=1752072363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TcvruI7SrJqMu/I1zSdlWdkR1NrX7rdtg+XEHoMTuFg=;
 b=Zst+50uTAWoLta1nYe9VBOJpdMCrxRF/73G534JmtemFIhLq+0F31JVnrHKnX+MJZZ
 Mem93zVyB/Qkcxa7jNzUt//kfaf3N/6t7pdFrjkAtIjKr1A8JSLoM4cuca8OEpxvo5Z1
 qNBzGXtGnM+pK+bAq24VFv+90O2xSdSZPC8ztq5sqvQVYFCOyFuW7lhUFFwYuYL87WWv
 IVzrTvQX3eJmSVk2H7+h4UOPn7NI7LBHabWjw9qvh3Wi8la39MFxAf48pmehfeI7jnpp
 VhrHe9/NytNoVYdWuUNqrD3XwxGsDONctE25KpSGIRdvDDUiNEReEJmbOPmB/0jjmSBa
 9t1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjp0NF17KgY1lX81VYRoe8YUvTvLD6EAFLFoWRf7AxHcReCyKaaoFT0aN2E2GcZVZAHHr60zkm5g==@nongnu.org
X-Gm-Message-State: AOJu0YzuUYNRQq059d1I7v5BgUuY4KacoBTM88cB6yR0Usy82gRf5WZe
 P4goSJGhOBVu4bfP2H/ccwQzqoDxIBBn2Ka5go0bTJoorW71TGbW83uPZReFWe/Ywflvohs6y9g
 zpApxzMM=
X-Gm-Gg: ASbGncvW0+THSB9IBx+KzjllZu0j1t2v/J9LHxSkioHuv2E+hCK41HeLaAtXWpzTv+f
 /A+yyfjML5IU9P/DUUWV2pEVLqtahHd6m9yg4AdDy7Sq9lbnOb6EazRnyl2VjlfXTDcxfM7mU4o
 ci2NReOoCtIj/l6t4Omxn6o7bavoPkZ3Tp7i7GLgFqTg61KGmGWNnDBvnScLG3/zU6yN9f8FoQb
 7mlH4xC2wk/c2evcNnkPCy5RdL73fgaWYtFucdnLVm1Uhuvij+qG+ESRFS2TLycn7RxtoyxsMxm
 MlMBw/OXflv21ZYeswsF9qrGg5JmyfMEjRfYFgLUORrzIrO/gCm75iVo4+Lqlg85RxMkxGelEpG
 D
X-Received: by 2002:a05:6870:3313:b0:2d8:957a:5163 with SMTP id
 586e51a60fabf-2f5a8b200a0mr2340130fac.10.1751467563516; 
 Wed, 02 Jul 2025 07:46:03 -0700 (PDT)
Received: from [10.25.7.74] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4eb261fsm3911600fac.8.2025.07.02.07.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:46:02 -0700 (PDT)
Message-ID: <41541d93-90c0-44ac-ad6c-28656cbf5746@linaro.org>
Date: Wed, 2 Jul 2025 08:46:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] target/arm: Fix VLDR_SG helper load alignment
 checks
To: William Kosasih <kosasihwilliam4@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
 <20250702111954.128563-7-kosasihwilliam4@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250702111954.128563-7-kosasihwilliam4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: M0V+fEqkXTgs

On 7/2/25 05:19, William Kosasih wrote:
> This patch adds alignment checks in the load operations in the VLDR_SG
> instructions.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
> ---
>   target/arm/tcg/mve_helper.c | 42 ++++++++++++++++++++++---------------
>   1 file changed, 25 insertions(+), 17 deletions(-)
...
> +DO_VLDR_SG(vldrb_sg_sh, MO_UB, int8_t, ldb, 2, int16_t, uint16_t, ADDR_ADD, false)
> +DO_VLDR_SG(vldrb_sg_sw, MO_UB, int8_t, ldb, 4, int32_t, uint32_t, ADDR_ADD, false)
> +DO_VLDR_SG(vldrh_sg_sw, MO_TEUW, int16_t, ldw, 4, int32_t, uint32_t, ADDR_ADD, false)
...
> +DO_VLDR_SG(vldrh_sg_os_sw, MO_TEUW, int16_t, ldw, 4,
> +           int32_t, uint32_t, ADDR_ADD_OSH, false)

Use MO_SB, MO_TESW here, as previously mentioned for plugins.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
