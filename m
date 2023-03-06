Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4756706ejc;
        Mon, 6 Mar 2023 07:09:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/nuUXdsMRxYXx21C8pyJGhbaeUIwbrbSJs95FrgXwOTXcLRsFQCYSgXtlJPmLPTXFtM7oy
X-Received: by 2002:a05:622a:11d0:b0:3bf:dc7d:2221 with SMTP id n16-20020a05622a11d000b003bfdc7d2221mr18567948qtk.47.1678115372894;
        Mon, 06 Mar 2023 07:09:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678115372; cv=none;
        d=google.com; s=arc-20160816;
        b=MazKFVeqdFcVhMtag6UrBasI3x/Q2QFpbCLrroJySd1AnF3rEApaLn+LjrakwuRfY8
         msOcfjLyR0CdwOeLjccro+jubpmwwN8cgdGCJiRcgfg5iKlYaXMvD24f156yPzQMlI3d
         jC4xG1d0nWSg9C+eQXRV7pYn1BwiVigwWDqAXoC3xQqRqxz6rOaCrGFtYBsS+qMB3NGj
         qU6e//BAycEBXgmZeR/iIfues9fHBd7CA3k8tf+DWPAGyE0FYgiuc3BEsPxKTf+Ssp/H
         HShEwXPxM6b6d2Ca4S8Wy3Q5GJIlzvvCYSBbp4tGPo/k+us1R6pNP99IufDcPhIo9PJE
         luFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NjfFXgRBu2mFU/p8wC8b/Tz6qqP/Z/aF+roBFRxHKpc=;
        b=VdP2Rnqzy4poSSXWDx+35cH672f6ksBgq9ThepnQ7sJfE+njTufnIPyzXAufpU5WHf
         xrPlskxSdRF729L2CUP9R2qLJ8Ck5eq+zjq1I9d5Y12d8+bTFccRAfr7+JN6mOxfatYW
         POcDYEOhpN35eAW9vuGk/xAH7PKwpBOpGtHMPuBfAixN22BMLUiItirI4IDHXPyRw3JM
         e55dHpqWJ6Nno0aWnv/zRI16NS/S32INIetj3LRlSx13bMArYlxwhF82w2yXi7aLLr2Q
         igp5qmmwGLzB73JLJowAuvW/JpNjaZ8HoWp7cbmCuNySMQtvKTFuiUVKdewur4sfqFdF
         ARog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lYZecB/T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020ae9de03000000b007423f882a75si6931108qkf.99.2023.03.06.07.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 07:09:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lYZecB/T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZCSR-0000pw-4s; Mon, 06 Mar 2023 10:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCSP-0000nz-5n
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:08:57 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCSN-0004hD-3H
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:08:56 -0500
Received: by mail-wr1-x433.google.com with SMTP id v16so9219448wrn.0
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678115333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NjfFXgRBu2mFU/p8wC8b/Tz6qqP/Z/aF+roBFRxHKpc=;
 b=lYZecB/TCNAmO4XeEvAZGWBge/fE6Wjpe6tEg35igN4c4rJ6Bx/m3Gb6EdJQDU68pA
 xQsHm5h5160AonENwjHPFobESvaYaWT+uaQccM1Hd/B3H+INs12RmL9EHm9tsX6cc9Ky
 0Lk9P7cmayaZV7uLYlybtadX1TqaNQeTv3Qy3kA1em5zMFjZ0/i2ScChBMfqg41Xb21+
 1LJaUTpOCDqv84RbTCAeHGeIbMDooYFX/UlkHhY2NJjlJnfPCyay6KFOeJ469eO2ZnMo
 B/fprfw8aqBXl+rcjIUShJ1rJhC8jXCyVxHiTGvnDKGJeVe1YVaVs9ovqaK7w/P6/Q42
 9Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678115333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NjfFXgRBu2mFU/p8wC8b/Tz6qqP/Z/aF+roBFRxHKpc=;
 b=tcFXDRejiegpwkdb83BBBFYT1dofVNKDyEtZx7n1aiHsY2LctyGwBHegmCbhhPRXly
 7f4hUuhFfqiUtxLgPtjuXGeVIUhahwgFf/b/0vBF/ci+lIhbq6kmPTSofK21hJ5y7bLj
 65if/JR/xtigOBQ/FQwNtveXH1YhMomf1EmaQXTN8ma/PiAQXsZUEDjeeW85kEr0IEt3
 CgOJ/eD7tr/ELeJaQW7L6M0tKt4BoHhvZrAM33RHz7x/saQylrm9n5X077WL/kN89cvP
 RHFZYSF2x0CO5cO0w8DY+NEFUkONnDs3t0sU0coLoqLvx+zfvHxOEWaziTxfymgESUu3
 b3Ww==
X-Gm-Message-State: AO0yUKU2O9HWkStDt/G3raxRFYjOhGnNNFeYgCNEuPUqnYf89KEj1a/W
 P2DJHL8z/PlN5sNzMi977h3pyw==
X-Received: by 2002:adf:efca:0:b0:2ce:34c8:44c with SMTP id
 i10-20020adfefca000000b002ce34c8044cmr6637846wrp.19.1678115333400; 
 Mon, 06 Mar 2023 07:08:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d494b000000b002c54c9bd71fsm9782018wrs.93.2023.03.06.07.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:08:52 -0800 (PST)
Message-ID: <3e3c97bc-973f-b0dc-a84b-39390adf26ad@linaro.org>
Date: Mon, 6 Mar 2023 16:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 34/70] target/ppc: Split out gen_vx_vmul10
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: kpchMltwrCsK

On 27/2/23 06:41, Richard Henderson wrote:
> Move the body out of this large macro.
> Use tcg_constant_i64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/translate/vmx-impl.c.inc | 95 +++++++++++++++--------------
>   1 file changed, 49 insertions(+), 46 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

