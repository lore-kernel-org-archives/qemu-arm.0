Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1514446ejn;
        Fri, 28 Oct 2022 12:44:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM60jXohY5LqpYWkkCFnwud5QWzNmIwovHG479ER3iJ4VI+9KzfmfoVO/SFb36E1pgkc+d8W
X-Received: by 2002:a05:622a:490:b0:39c:c82d:557c with SMTP id p16-20020a05622a049000b0039cc82d557cmr975806qtx.463.1666986272272;
        Fri, 28 Oct 2022 12:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666986272; cv=none;
        d=google.com; s=arc-20160816;
        b=nE4FNkruATxcmhnlbnJgQhPgpIEfoSGNOs9tRZ/3YXso6LMLNxuZE8ZJptYdQVNRCU
         waX+hEllEQ+O9AtsbWAuKXWDaa/mtHQSTCK7eiWguBpRAVl/lF0xdNK2S8eXkxgujwMr
         ++GPS4Ej0J+57tsG5n93tHagAOQgBd3DX90No4eUNhvcpjms92O8QlIs4PSRo+iUanGk
         +GsdYm3ScwVNp+rrMCWHifLvL35SvDIcgMHe0/Qw9bgPZErerzWUZr1u+URMqBN0Kwro
         Hm6I4vy+SwFxvdZOYsVl5ijIlZBn5PkViU5MoOsYYEkHY18UyiQWeKA79ZVORbgnDvxc
         DZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=tmLNbgk7tWZcUet+svGTFSQSXOEpucKmUZQob3ntieQ=;
        b=mCQpkHSZXRSC4wyl47Dx/+RbtK6wYTqnucBRCDSc5wTw0BUTFfqilSbXYD6ovO011G
         bKKvA5+37rHi6NSbCg0ynEW5h/mZzrceRDA1Lz6arr1lMskOFqltIGhbVP+q76hnJh0W
         ezWxQL4hZR5SduRZP96M0eAbLfbhup3q8x/FvnScO4VMNihN8j9vnOkePLqTNcaLCrAU
         a16/CIfIIfmKbLzCscDMhscklMLIRHeB+WsSoWRNt5tsJpTpyz3DDGT3oqf4y3Jl51mC
         fx1V7TQ7Z2MyEHQ10szfXTOA+8ag/hl6k3JtgyoUxmCFnINXScGgM+UJowtoVtqiB9tC
         81sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XhoaWT/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm14-20020a056214268e00b004992c5f80besi3571664qvb.12.2022.10.28.12.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 12:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XhoaWT/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooVGy-0004k9-9L; Fri, 28 Oct 2022 15:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVGw-0004iC-DJ
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:44:06 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVGu-0007Aq-Ov
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:44:06 -0400
Received: by mail-pg1-x530.google.com with SMTP id h185so5677220pgc.10
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 12:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tmLNbgk7tWZcUet+svGTFSQSXOEpucKmUZQob3ntieQ=;
 b=XhoaWT/2d2xHi8392I3YCIyNtx/GBna2WLhizkg+VfFXylHq1X5UA39Y4c/yDr3NJ6
 N8NbG9pnhy/PODSC8G/UTMOpSb30EizAZZqrgpBmM/paHF/BLmGuj5MQqCXTw5L63Q2z
 fqadtXtkg0HZTj9HvxTVVeo7n0fuN8eOInEVA4aECPO//0gY38BVwAseSI9WpwZ8I61k
 8GZhhrX3Vi++Pt7QUJAgXQreBYzu2ZqIWFxZJ2aA6Tzz1XeXy3dx2DqB0CgcMSQAY10S
 W8wEx87VSw+s4XwNLyHzlFIUexgqtxsoCed24LqXqhlrGpuvof1f8jSmGjK6YZpfJx+w
 q6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tmLNbgk7tWZcUet+svGTFSQSXOEpucKmUZQob3ntieQ=;
 b=iez/fCbaQbF88CMauJsLXRljKENua4PjnnSPg/q6gCBMId250ECJ2lhoKaUtjza+Tn
 j+V9V2ROun4NRZ6b/vYh3crSe+y/grLUeol/FEyVwmwCk7ryrLw3Y6BMAU9dqQocN8An
 kJqzaVAPAwL1F3154WMW0qC2tZ3SKEwxJ77PFEmOpi3Cl01RIeJKcpYFu80n8uaN812V
 XyzvO0ffzIuTsLnxpd42HXwD6/EBXj8hJMCO/OtNMxEK3LgQ8wJQd832qGPcuM78tpUA
 +mXJe73Ios4HO8bzoFRsvVb65Kx0yhdRT9RLLv1q+W18E5taRx1LF/C+M0gEJYb8krTv
 pesw==
X-Gm-Message-State: ACrzQf3B+F9XG+2WMGTy4NsIlMmaKV/0AXhN41aeHKw5SHfY30PSZV8e
 neXfYxZThDb6v3+Evaj6R3lZrg==
X-Received: by 2002:a62:1482:0:b0:55f:eb9a:38b2 with SMTP id
 124-20020a621482000000b0055feb9a38b2mr675990pfu.29.1666986243283; 
 Fri, 28 Oct 2022 12:44:03 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 cp9-20020a170902e78900b0018700ba9090sm905387plb.185.2022.10.28.12.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:44:02 -0700 (PDT)
Message-ID: <17d1bc6a-a30e-ee8c-b3c3-a74dce657375@linaro.org>
Date: Sat, 29 Oct 2022 06:43:57 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 5/7] target/arm: Implement HCR_EL2.TICAB,TOCU traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZyehJ330gr07

On 10/29/22 00:40, Peter Maydell wrote:
> For FEAT_EVT, the HCR_EL2.TICAB bit allows trapping of the ICIALLUIS
> and IC IALLUIS cache maintenance instructions.
> 
> The HCR_EL2.TOCU bit traps all the other cache maintenance
> instructions that operate to the point of unification:
>   AArch64 IC IVAU, IC IALLU, DC CVAU
>   AArch32 ICIMVAU, ICIALLU, DCCMVAU
> 
> The two trap bits between them cover all of the cache maintenance
> instructions which must also check the HCR_TPU flag.  Turn the old
> aa64_cacheop_pou_access() function into a helper function which takes
> the set of HCR_EL2 flags to check as an argument, and call it from
> new access_ticab() and access_tocu() functions as appropriate for
> each cache op.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 36 +++++++++++++++++++++++-------------
>   1 file changed, 23 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
