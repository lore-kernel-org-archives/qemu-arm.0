Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDDCC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 22:15:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbYD-0000gT-DG; Thu, 31 Jul 2025 18:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbVB-0004t9-FM
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 18:11:53 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbV8-00061I-QD
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 18:11:53 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-24049d1643aso7724435ad.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 15:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753999909; x=1754604709; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s7p+FwvyvHIZCZ78ukG2Bjd7lRncEsx2cxfkc2H1Shg=;
 b=H9rDbT8hBDb5aOCLUYGzcWxL/99osECelzmzii2gDXNnQjb4NJF5Zj24g6eFYf1sJD
 oTVXRiga02icDolwgAWMuefbqBiF7dOETVC7sm9kBnyH0JSildCylR6ZMOTKxt6vxrZt
 asDJn4s410sB7E2pN8InNAw7a6aND0p7NsEFSJY0q1zOTZv9t5Snca1FNlcwoWJxpHw+
 AJyJaEh/3vw/CcVTga37T6l1V1FMdEoykOAwHiwGFgJ8ExlVqDxP/R62Hs7AP07hZb0I
 aeoId69rz3ARr0q+XnorBo+0BHQ4HIQauiZB1x1mlu2a6lvO4heJ+tr/7q7uE7uCVMWz
 j0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753999909; x=1754604709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s7p+FwvyvHIZCZ78ukG2Bjd7lRncEsx2cxfkc2H1Shg=;
 b=hj5J8u8PKOtWUnMN0fUtH5Bzyd+BGrEdmpJ+Mp72Ly5IsXz+gSnDxOEk3Udxd8Aexm
 twub7FIyewqVT/DODyh3usaTnyUEQ0oj8ojbnXVhrobzEjC3o6DP1sYgOtls0L/QFHKt
 xpcnOlBQmU0vKKJ3HjwVLnD5iq62lFckXBpaGXANEJmE0uZixNeATh6r2e4Ky1S4rYEF
 B9KNg5xsrlA4nD5t44xAVE9MO6do7ZraUDc8TIPdHQPOM0N32rY8qaYejs9BHzpZJBWv
 MFvf7oMPTW6ZRPTHo+TSJuRn7KgRYkfJfgFtYQ9i5E6/trlomX7inFgvfPS3+JWdm6C0
 uGMg==
X-Gm-Message-State: AOJu0Ywnf/YudtkpODUbh+biJPIMqBAS0kEgmMnY0Nj4fwNwbtC+2hQx
 ScWSdWbRAxz5Bj0CzGI/J9fqeM+n44txtWlRUMxdiS0ywxLdGqav45mIWidob0XQgJnPOMB/zDu
 57qjL
X-Gm-Gg: ASbGnct0sHqPTXNqOaBOqm/KazHlK5MWpzwO0dbgp4Fow6xTpBjZ/2GnwM0u5a0Vz5o
 ZCEpmEswz1c5cbSZsOhiC6T3/Ish2zkzD2lxUFlMuMQFDa0/lONiee/ZFrEaHGzlw/d68F+P6Or
 ECzDNWazi4giSoN/K2eVD9j14mspzvQItn0iPBqCZFQgusCKBOLWJ5+UcGy+5wjjVWOT5dG1sp2
 8Fi5ZsY09d9SbROsdRvi1/sI6oL2k6bFAh38/UXTOTDiflU8Gpqt0o0A09miP77CZJf8HRA5mTn
 u1Ezjg2xe3LSj5u6ik7lNfhnKl55o6DA5v62g3jR5qNEUTDKGV7yB3wCDU2Um4MvmC6cjdBVn1w
 XaliyF+z6gwDEkPgk4b5XZjkqljV5OUDoXBg5SAeZFR73Kg==
X-Google-Smtp-Source: AGHT+IHfocy4RzaacvYQmjB11yckcZGUFHrZjcJwVyHT+45CNuiQT4AjScYamzVXgVJkhSoxuIYwMA==
X-Received: by 2002:a17:903:22c6:b0:23f:d8e4:ded2 with SMTP id
 d9443c01a7336-2422a6d8f27mr4627865ad.53.1753999909073; 
 Thu, 31 Jul 2025 15:11:49 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef48fbsm26645975ad.36.2025.07.31.15.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 15:11:48 -0700 (PDT)
Message-ID: <545f1049-bf37-4a88-97c3-1f732ac66263@linaro.org>
Date: Thu, 31 Jul 2025 15:11:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 81/82] tests/tcg/aarch64: Add gcspushm
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-82-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-82-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Validate successful and trapped executions of GCSPUSHM, GCSPOPM.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/aarch64/gcspushm.c      | 77 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/Makefile.target |  2 +-
>   2 files changed, 78 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/aarch64/gcspushm.c   

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


