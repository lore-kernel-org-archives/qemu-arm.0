Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1248635ejc;
        Wed, 27 Dec 2023 16:53:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgND2XbX701+DpQUyPyfdSxL1TOhONednhnXhlcpohlMSK+JBuVcHeW9OV6BLvqZkGh4FD
X-Received: by 2002:a05:620a:8424:b0:781:5e26:6b1e with SMTP id pc36-20020a05620a842400b007815e266b1emr2000265qkn.13.1703724805709;
        Wed, 27 Dec 2023 16:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703724805; cv=none;
        d=google.com; s=arc-20160816;
        b=iIU6jwc9gjPMAJdHCJDQrwak6yvjkk0dDTvc6GZSHo+17jxe7CwJVprrsoZ/hmD3Va
         QSks80lTT5/QXGAou/6EIS0AUC7AAnc+M1O+DVJPDJEtxABdCt7lg6uCLtwa6HitN62c
         jR9x5S0hJ5MZDU6UQ02N5w6tr1bX7vg31vadeg8eLFsPH33upzabb99Ocv7ff82nmBgp
         UGOpToQTAoiwjWlS/2NSfwFi8kuKZgMis07JPLHGYuxnrIumWIR++giLELvg3vUJFsWj
         HtptEiI4g/JmhWegU5vqqZhUT/SuwYar7fKU0f/20/z4yMjyrUrGSNCj057m6vULf00q
         KKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=5Xwn5APP1bY7qzdrOsqpFEdCkuVZgD8lJBuyKFLdWtw=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=w01k0qIu6muEky+M9pAfdUOhxCeuT0C/bL9pOf/X2SDfpfJE2mTZUTVEEuITHv7kj/
         g987NM6zQqeZyV8iyKrY+kYVxGyM91YNx4ARDE85qWpG+2cNiug/K4RHzl4rAJjerpv9
         uIeq641Wx2NhvXkmp6Y8T5+VF0CZl51URRx9nU8ImFWTnrP2bXW2KNcrvRMNsEo6roS/
         wDgRo0j67gyY6OQD8LoW/JclnHoocron8pzHf7ZC7q46t7fOQl1Ql7ojd5JQKpI2RXKx
         vOm6lCTGq58Nqh6rhG10vE1BbrjuEE8t1qIE5umIctiirUnmh2Clq99Jro7U480ePq11
         b5GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lsaIhv/Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn5-20020a05620a2ac500b007810add037csi15693911qkb.494.2023.12.27.16.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 16:53:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lsaIhv/Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIedw-00004y-72; Wed, 27 Dec 2023 19:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIedv-0008WM-8N
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:52:59 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIedt-0000qg-Qq
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:52:59 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6d9bf6f24f3so825539b3a.2
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 16:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703724776; x=1704329576; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Xwn5APP1bY7qzdrOsqpFEdCkuVZgD8lJBuyKFLdWtw=;
 b=lsaIhv/YW5DB4nwSsSrlm0KFWL5Pha0CqN67IWg4U6BK5bqRZcQaImPCG/zEywrHEq
 OEs39t4+WiXB1mmpZa4eQjsBHCWwLMrnsUwgrmVsZEDj3CFKnXHuix7ArzgUqavvTAQu
 k+vHVwJg4vpE2XGTYo/vqYp+jI1+yE5f12fXUugLRPfAyzNCVbIxi6K2Ele4Olynfg2S
 0kCNek0vTe6OpMrBYBI29udTe1cbYQrmsfcGSjBo7eqpSVun7xi2D1d1K7ufk2JNOAka
 a56xwfyRAiXUIexD22unLK0hy1JtPCTAAk8rSriUyrcaC/Rv5SClVEz6J9dCnFTXkVqo
 ZLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703724776; x=1704329576;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Xwn5APP1bY7qzdrOsqpFEdCkuVZgD8lJBuyKFLdWtw=;
 b=fGEdjwSf748j7baDFU7+S5Mf4yYUWIBDZB0zslzyvCMkM8+IKDwr1NbkLO0C/4bd9j
 Xgm5B7Ge9QKtV8Yt8udVxh6RctmWPa6ozx2X6IgnxB4UmQzrH4S60ZC2pBX8XRKJnRUu
 nS62e1GiAcOqhaEpWhdVLfTcNxsdv+9LJQbbCiHDewt+/7PnAmOslAWjvfzuv3a11I/9
 t98esV+bCVcUH2iIXtbfXCiTT+XxbrVNLQ951SJVq07MbwlxapgYa9mIhzh7oNaW7bwh
 zRSAMT4afIHAZvtiPkuVHbAelGufi7trAOg7HvWTYlqbnbIs8FxRv4s5XwZXrzx96qpa
 PNow==
X-Gm-Message-State: AOJu0YxrOLOdgR0efUqpRvMzsMfd36QUkOVnQG0UrZtMcKGB7jfCRfiz
 7yhJiA42UK8lYGAM/cFn/lnX+Zhxa34pOA==
X-Received: by 2002:a05:6a20:1594:b0:196:4775:b5b with SMTP id
 h20-20020a056a20159400b0019647750b5bmr254690pzj.49.1703724776519; 
 Wed, 27 Dec 2023 16:52:56 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a170902969200b001d4872d9429sm1145847plp.156.2023.12.27.16.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 16:52:56 -0800 (PST)
Message-ID: <8cb62137-ebb3-48b6-bcd0-feab8b086bd7@linaro.org>
Date: Thu, 28 Dec 2023 11:52:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/35] hw/intc/arm_gicv3_cpuif: Mark up VNCR offsets for
 GIC CPU registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: AztmIYlHyA/w

On 12/18/23 22:33, Peter Maydell wrote:
> Mark up the cpreginfo structs for the GIC CPU registers to indicate
> the offsets from VNCR_EL2, as defined in table D8-66 in rule R_CSRPQ
> in the Arm ARM.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_cpuif.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
