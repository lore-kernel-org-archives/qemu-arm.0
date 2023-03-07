Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5265373ejc;
        Mon, 6 Mar 2023 16:11:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/HVrydmm3sDYSApTzoISb0tPQ78ic+9NjP11gYQ4H06dk14xBWMSqFCDiooV7cclEAE9Mt
X-Received: by 2002:a05:622a:314:b0:3b6:8bc3:a09c with SMTP id q20-20020a05622a031400b003b68bc3a09cmr19442728qtw.25.1678147865754;
        Mon, 06 Mar 2023 16:11:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678147865; cv=none;
        d=google.com; s=arc-20160816;
        b=m1P8Sin1KtH/X2EQXUcBx5soq2w6R7fQ6E06UOX9XRhX++CyWDm3gu1vpIOv5jfmzI
         rDRjN5z7HgvyUfrwr4bWUsY1SuSDBCyc8cuV6DP+7bZNflB3ewC57vzdCDZN2OxJe+sR
         Vo9lh9VwNc5GO663n4oZu1HsL+J2lGwe/gsRmKN5hy1MEuF981aGHppm0SHWmiwELH2b
         2ixyn8+ZEcbSCGAgHvrCMihEN2BYP9sOf3XRvBF7HJXrD+hGzr2oqGZTE8gOVdYbdJih
         QoidAgprNRahdt0F7cc1NqmayMAfxhTRO1F+d0wqVNml61VNIRLLvYyqt1P3c6+iBD6q
         ikrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CGdLL4ZiKt/zu1Fn9z2hcTBNyHakwL7rYXL/fjIqxxY=;
        b=ZNz6puRL7gjFzoh3xuKfJnH0F/DAyu1GEdVGtTYmEQKSbcrLSZsesgbEucj2Wv7/aY
         wAkTMYZqQiMdgseRsIkHumoKWPf1oa4+5Irowmc58X/gHSqPFoiZ7lb2fM3MOKBVD/W9
         uTYKAEslV+ENPMrkO5zZY0jS3mBQUDyenBY+aR/kXRqOzgzDWVq9aBeKD1B3z4Xl8AZV
         twUFIsvTkZ7RwQ3Mdb4FYvXMm/2eTMlQpdAGLE+piM/p9ROWSYQqnUb6yIqLMvD7Cl2I
         WxOzTHLVzgGagPa1mLBWcJoavZHESsHGNTCXQWHQg+FzefFVohv/8xITihi+KPzcJP9s
         GV2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vzgOA+OS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020ac85f88000000b003b3e31a8791si8838596qta.443.2023.03.06.16.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 16:11:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vzgOA+OS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZKuW-00039Y-Gc; Mon, 06 Mar 2023 19:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKuU-00038x-Le
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:10:30 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKuT-0003mV-38
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:10:30 -0500
Received: by mail-wm1-x32a.google.com with SMTP id k37so6819959wms.0
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 16:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678147827;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CGdLL4ZiKt/zu1Fn9z2hcTBNyHakwL7rYXL/fjIqxxY=;
 b=vzgOA+OSKxB9fApnlof5ULvSeu2t64srJXtfraY2c2uNvPcIdcW/Dnri5aZcamyMV4
 /c2c39azhnLKxbqBsA9Ig+iYvJFFgdzG0dgBjlPMkWLgvP03NB24xVvpvvcO15ysTvq6
 QEq9ppT2OxlFs3HLJFjSpO9V0SO3iWSBpoL7DbS2+Suihj/QSDZfbigjHHKKokZEkKBv
 YY0+FwGrI1PRMGt/2RGKDwBz5nWhnbPVgNNR1AOL8tpb+ZeyOF/8QI2fVXvDmjSAILMm
 Jw6ZrUSuYSZRT3IXEjLW37QcOWw1C6ASBrqp47/OuK7QalYe/qXVOeRm9M1gjyEXYL5F
 2y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147827;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CGdLL4ZiKt/zu1Fn9z2hcTBNyHakwL7rYXL/fjIqxxY=;
 b=g3gQgfADhYV96mQAmSOcx6G1Tnk/69YAnfRe/f81CZmA5R6dnK3v1pce8U+iwvhjbs
 cSXelDdF7vkd1AQE6tesXIppsGgUs2UHJVqQxi7FTAwlRb0J/TjHG81uZBfqtOePvtlU
 G1kJTRBIu95GcqvXclZ7NahZPn1rH2WecMGFCXDdSW8uuKA2T4nOL0Sm5YVJTG18SPaC
 v4KYvsqg6F1+4AJM/xLVlrrNnAQBtePrc0SbU+THyNxDv7B2EqZyMg+69Q3alHoZWtDF
 LUeA3Ii3Gr6+42cAHBYZp8aBELdjiZErSwTaeWShu+fC0JuAJnBTKMgn++mWqV02/ZJB
 zUVw==
X-Gm-Message-State: AO0yUKXmi75qlD0eIC4Rnc9AFPQu4Zlur0qXDfTmQQRUl4DtdqiXc5vp
 2FDgjaMyBBXE3R7hk5AuDwlqcA==
X-Received: by 2002:a05:600c:3b27:b0:3e2:6c6:31ba with SMTP id
 m39-20020a05600c3b2700b003e206c631bamr11332895wms.11.1678147827504; 
 Mon, 06 Mar 2023 16:10:27 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d44d1000000b002c58ca558b6sm10993073wrr.88.2023.03.06.16.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:10:27 -0800 (PST)
Message-ID: <b176860d-a62a-20f0-ef9e-084617497346@linaro.org>
Date: Tue, 7 Mar 2023 01:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 61/70] target/tricore: Avoid tcg_const_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-62-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-62-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /gBrSYDTvKIp

On 27/2/23 06:42, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 127 +++++++++++++++++++------------------
>   1 file changed, 64 insertions(+), 63 deletions(-)

Long patch but friendly enough.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

