Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp4129967lfb;
        Tue, 19 May 2020 08:17:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx4MLAcLsPDNEEldFiNcqNtnge009WHlc+iIScSyZbiQ7O1nKcrk6KhIdh9jVCRVdTSLFA
X-Received: by 2002:ae9:ea0f:: with SMTP id f15mr22228609qkg.435.1589901437344;
        Tue, 19 May 2020 08:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589901437; cv=none;
        d=google.com; s=arc-20160816;
        b=Gr+TauwEMEklrTRH9WrtjitYYbIDgCx/3cv6PQFGSe6zG7sEwEy3SpWHsd0EZvak+K
         Mp1Fm0nVHss0KwmBGs6D+dbXecOk4AaXx7dkWMPyimMSc4YByiTqdaX2f1rfH6kvZWae
         IjZG4dmPxdXMLaicvlelYSmuzNeUl/vO3CYBhk5LNYD7y16tbiEid/E7IPegtGUZhcS5
         CiPTfaClUpnZQkFnIusxPI3CIf0MStfLKrv2ZNpJwonskZ01F90QpeVdy2C3go3FG7wV
         gP1pPvxwzLwc6ty7GLf8Wq372GUOiYbDkfWkQQsw27xoKEuOFkJRoOvF9wfYJKzHbLtY
         hBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tqNPJ2qlbgindtQDqmEZgtsuos9sPlbkNEiIAspxVTs=;
        b=qYwQDMM/isMNDJI8YVniY3K2krlyLjK/O0dRnN7UnCqQbP/1YXQniHSLB1elFMQTQT
         H+JGAp2xY8bJxqVMBEeR1ihugBID5u9roPWnrRNV+FQF4r1RQbQYpDGH93TU2FeeZJYz
         1yVRhuazECzHbtscqQWa2XslozNSpMHjUjH+cWw7IYdFBAzG0iZKNVoVUUuTntGwbafa
         /WRdWbchQLiGH3eRyNbpHii4G0UEkYRr7OK5FuplWkCm1sZM2KYrpoQwLe2qEI2Vrys5
         VX7Gv9GHjPQmXVGsVsWeQqORdSwAZyBEvnxyNrXfw3qmpSgV95dYExe+41SZdoZmveQA
         IlvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aBmZC8WO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19si55793qke.115.2020.05.19.08.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 08:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aBmZC8WO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jb3zY-0004ic-L2
	for alex.bennee@linaro.org; Tue, 19 May 2020 11:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb3lC-0006pi-Bv
 for qemu-arm@nongnu.org; Tue, 19 May 2020 11:02:26 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb3l9-0004dF-8M
 for qemu-arm@nongnu.org; Tue, 19 May 2020 11:02:24 -0400
Received: by mail-pl1-x642.google.com with SMTP id k19so5732689pll.9
 for <qemu-arm@nongnu.org>; Tue, 19 May 2020 08:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tqNPJ2qlbgindtQDqmEZgtsuos9sPlbkNEiIAspxVTs=;
 b=aBmZC8WOl7MQPVNZmpvpHxAHZWxL6pODQeAzSFx0gcnbBOVnUF0JEYJF9xlnjLviyS
 uUPH8uLh6n8JFF5Q12EKAG5pV/uqiZztUEtlrIAnysVWq339C4Ilf0yj6BOSD4yuweSr
 fSDig6P67GGdh6krl/DgUKkJCSF0QU2VgrqmiTulSF07hPojFWbIcAR1IJlVX7jFV9NO
 SCWLI9925izfLDwAilcTp7vAYpEjfjbYvYgX3Z0uvV7S0OG/MqGKHwwEjuZC3G28ube4
 GmC5BzatlsxoZkY30rELB3+qjt4bbl54vB4WNtrfCDoFRqFt/nJ8JN6FLSFevfjioj23
 KxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tqNPJ2qlbgindtQDqmEZgtsuos9sPlbkNEiIAspxVTs=;
 b=b0zPtCgoN8PytNtpjBR/1PkRCPR1EE67luH2NCwuxqo8GFnwa9EcA5U6nDgjsYzw50
 sR+tTRfeaeqLMN4TgyRwT49dnsz+Tpcm1QgoeMe5kQclDp6mdgtzdiTJGE3eDFvkqaC3
 RJo15TSMPkDd+eLQ2mH9YleH65v9LQoK0INMor0Z6lH/1MZ0iDUMqOMFl3VBWdDAfCY9
 gkJUzt9gA3eGcsxzUSbVmfOp94OAKmzH7B0ZvDYA9skCER6P71KuvLNKd23stOyZitZJ
 N4tgBBYzrZBUiNcuB36z2GD02nyqvR8w4dWBNVloXBmb3rd8cZ8ps466oVmycMNEisei
 VWHg==
X-Gm-Message-State: AOAM533IUzly2Fb3Jrhweu1qXaVGxNlEY7jO7O64mRL/RpIiM+uquWth
 xNKR5fYVKTCVp6jf0RIIyDbLtg==
X-Received: by 2002:a17:90a:7ace:: with SMTP id
 b14mr4973656pjl.116.1589900541523; 
 Tue, 19 May 2020 08:02:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 127sm11902367pfw.72.2020.05.19.08.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 08:02:20 -0700 (PDT)
Subject: Re: [PATCH] linux-user/arm/signal.c: Drop TARGET_CONFIG_CPU_32
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200518143014.20689-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21f42bb8-074e-3e63-989d-fa0c94c55e2a@linaro.org>
Date: Tue, 19 May 2020 08:02:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518143014.20689-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jav6ig4u+WQS

On 5/18/20 7:30 AM, Peter Maydell wrote:
> The Arm signal-handling code has some parts ifdeffed with a
> TARGET_CONFIG_CPU_32, which is always defined. This is a leftover
> from when this code's structure was based on the Linux kernel
> signal handling code, where it was intended to support 26-bit
> Arm CPUs. The kernel dropped its CONFIG_CPU_32 in kernel commit
> 4da8b8208eded0ba21e3 in 2009.
> 
> QEMU has never had 26-bit CPU support and is unlikely to ever
> add it; we certainly aren't going to support 26-bit Linux
> binaries via linux-user mode. The ifdef is just unhelpful
> noise, so remove it entirely.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Based-on: <20200518142801.20503-1-peter.maydell@linaro.org>
> ("[PATCH v2] target/arm: Allow user-mode code to write CPSR.E via MSR")
> to avoid a textual conflict.
> 
>  linux-user/arm/signal.c | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
