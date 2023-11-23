Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp318482ejj;
        Thu, 23 Nov 2023 03:33:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHH16VwHoWnH4iS9eWMxghfXpQN1dMqWwT/Qyh9fpLSTSawcpWHNH97JTRQKsyHPAHvZ7Db
X-Received: by 2002:a0c:e091:0:b0:66d:2785:a2b0 with SMTP id l17-20020a0ce091000000b0066d2785a2b0mr4770657qvk.29.1700739187621;
        Thu, 23 Nov 2023 03:33:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739187; cv=none;
        d=google.com; s=arc-20160816;
        b=pgVkqzQIN48EzHCzaklNgjJljqChH9LZoV18VgzW4Jx25KYA+kJHKnSe7AAteW03eb
         gj4p0xi64vkVNQVsFqRnzeDQOXzBF4qbzdqhrYqAnuCHkVrED/lLLjZe1GWkW2nO4KkC
         usQHg11X4qyXzkqK6FHJjoyDfl05LIoIV0V6IgRP4PEN1KxeAa3H8b8wycUIY7K4wj62
         oJuKCLsrPigGjmf+lk9Wul9qgbB34ECd9+RQSDQVrllz/LFfb8FCCnxbA9mKV70IzIJc
         9gj1am2HqjCcvRl3A08rf9j1d0ZXm7bBxhVNO8jrZB2HkNJ5cBC0ITKucBL+0At/Q5Kh
         6oFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GXAZ8UoS6DVW2UI5M5RQhgLOI5x79I4NycCzbkT3Vcw=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=KY5bu4MHtGTwaSaOauzcxJB6MAlIPUyPBu5gqUXBdYTid2FZ2D+cXlHPAWbT2WsdFs
         xYnLRx3zZL49qGvRmEyxWomUg2h2eH5cJ8D1YwqsBoEkNPNeoNhTUSJdeoKOvABqOPZc
         IE+UaDSzbxnS8uW1/7ssFsyIrqzdlPCFGzq8FIljo6MT0BRrKdUNKcWBZDdbs9rB3UlM
         JaBwGK2XBDikzHcuBU2H/EBvsMdGSVNecCmj4/3bU1AcrzxZH5DIaP4a8IsVUBqi6t2k
         M+Oa7T05cC07veh4yQ1yOfboCdB2jsjcGbRn3aBSf7IrEMlKvYGCdj3UYd0s2ykVsZZ+
         JPVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cK0ipV/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a05621420c600b00677f225b5b0si1104318qve.189.2023.11.23.03.33.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:33:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cK0ipV/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r67wy-0000BF-Hw; Thu, 23 Nov 2023 06:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67ww-000072-61
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:32:50 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67wu-0001vb-OG
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:32:49 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40b27b498c3so5121725e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 03:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739167; x=1701343967; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GXAZ8UoS6DVW2UI5M5RQhgLOI5x79I4NycCzbkT3Vcw=;
 b=cK0ipV/nF5SlzfWLG3EXCvSoDGYd2AcdK6PSZ0q2UUMojUhfCeUQ+HYq4ONzHImmxz
 FVeLSubSrY9chrxRTEb721dVBzVCRNdO02RJypVJtJ9mHe6t3j6fO7fJY9TYxeB87Qyx
 gt5N8JmfxF5RFjKe+9/95JZMZlnnb22DlZ0tZe/yoPIDbz/5IOpr+pVMfon7Fr1QBIl3
 CbKELRhSM/M4ldSzj02cGClfWN+5AxrrRK1KBIf7eIz99d47eCQGbgH82W/44ejEv64A
 +i0fGuaEv3/zjUHxJIAfh6AoDc9cQQaOonjAOfbJwwh4QAp2p273m6aYo2Z4hTttTz6c
 Z7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739167; x=1701343967;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GXAZ8UoS6DVW2UI5M5RQhgLOI5x79I4NycCzbkT3Vcw=;
 b=ZuETjhFc3eAGwumiRh258Z/TCo9aNyfQmn4NJk6+m1vcyvXIEgg3zqeR9mQMEAub5v
 u8WAImSA6sCAYttT8Rctk9kKWmV+n2fr78QBbEV118+hVIDVybJTemeHPxh339MaocBy
 4uEb9D4+MOfP3YAY2UU7jdKomHwaankuh5a4MK4KsqizkotreThZvJP2lWaItHaJvPuN
 LvZ9hnBb5AHmyyTT21BrPbQ3d9/2rIsZppcGJzuOvAaLtnphlglTSFb8Zh7xy7eWeJ3K
 RvSap6EMXvnLBGCDVoL4LoHL3IVSTwKGegWJ70kcF60vE/i0SRf7fkkuxuIdVmAhNptA
 Nwxg==
X-Gm-Message-State: AOJu0YyTUXTaQvvPEfLBHeB7nBe4oka1sAEiD0d2p4V6l9TRLmIkFWTw
 4xF54BPfpx+PpXqRXFAtzilLeQ==
X-Received: by 2002:a05:6000:2c6:b0:332:d314:4dbb with SMTP id
 o6-20020a05600002c600b00332d3144dbbmr3326209wry.57.1700739166969; 
 Thu, 23 Nov 2023 03:32:46 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b00332cb23ccbdsm1381619wrt.81.2023.11.23.03.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:32:46 -0800 (PST)
Message-ID: <c171f2d9-9389-424a-8649-98011dfc250c@linaro.org>
Date: Thu, 23 Nov 2023 12:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] target/arm/kvm: Move kvm_arm_copy_hw_debug_data and
 unexport
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: UQ8ucXvO6XIR

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 10 ----------
>   target/arm/kvm.c     | 24 ++++++++++++++++++++++++
>   target/arm/kvm64.c   | 17 -----------------
>   3 files changed, 24 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

