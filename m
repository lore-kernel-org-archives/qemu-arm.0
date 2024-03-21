Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp654083ejv;
        Thu, 21 Mar 2024 10:16:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUC6gQ3MnPsQx0hkIGYBDpV+ASZfKFL9kJAGMQSoVNRVb43w+NBtGhrwsiJ1kqo3ydbFC/y8LrNgBoD5F62Uu9fWa87GO9m
X-Google-Smtp-Source: AGHT+IEYrd2RJ7metj2vUzJvSWz8zUAW5bsb7duOiU++rVDaymyq92F6OVsvSdDlhUuT2f+UZRTa
X-Received: by 2002:a05:6000:234:b0:341:9074:9a13 with SMTP id l20-20020a056000023400b0034190749a13mr3530146wrz.26.1711041377037;
        Thu, 21 Mar 2024 10:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711041377; cv=none;
        d=google.com; s=arc-20160816;
        b=e2f/X9j4WffnqzvPiGGUXbOLTBEuCVeP34kGjMEcAUBkSqKua1jgrIhmjjC24TqC0z
         EMTA5KwZwEtIHcy8AUYpab1ZhJaKmA+KwQe7+G7T6K1kHg8X01DRGL7nvPYoenoykYnd
         bAlJWiIICIxCwlUauI6n4vF8vHeo5Xchz0kIkb/pZEuAq360aHh4bGUGb3j0IS030o88
         a84ibfO0oWV0pTYyxE0jT6VYH8kbE2f4OhvI/rprxvLusk1XaiWjZ/j2yjRQFrHw1h/f
         sNMOcOBEu3eIhLZd6et6bUigHyA5OkiBQbzaEX6lHqTqSb48voU2/vMAwSfqLGPiDPAU
         S6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oSYt7LsVH8jFKn+JCFIJODpA3VsWy3bMjgZ/771cPy8=;
        fh=xOrmY4488zTdEnFWCdGSNmMGuFL2WVgTQMjdc1BoInY=;
        b=AyqguWl3Cjs0nJOWosPE9/s3LHRLq1M1pZPmzwAOKwuxX3L+nIkg7mV/Oc6CwEMPPX
         XaYMW+R8K6vRjxh2nwCgzRVv03gzCHgxeZBmHbpSTdsYfy2g/JO8pbmF8pZwFXvhTfGV
         /QqD8GkMAP6vGG8XVcTyz189hpNuvGoBl5Gt6kly9fNDHQOAOkUoTN0L8lK3n5lYYEmZ
         3RWZ66a3556DnaBZLGBmkLJhIADJWJkL9EIBvx1s9fLsrhVr9dC4R5oeln+rDI8TYUPN
         c8R+ffhUBecqinPSBf1S0HoQViFkEqoZ+wwMSlVdh4CHWdA3SmJI7TRUYRk3hOzL3+35
         zL6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uyo7eOfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a5d4c92000000b0034174a875c8si44985wrs.114.2024.03.21.10.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 10:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uyo7eOfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnM1C-0004Xl-Ue; Thu, 21 Mar 2024 13:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rnM15-0004Ny-A1
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 13:15:48 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rnM12-0006yQ-Ty
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 13:15:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56b0af675deso1491117a12.1
 for <qemu-arm@nongnu.org>; Thu, 21 Mar 2024 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711041342; x=1711646142; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oSYt7LsVH8jFKn+JCFIJODpA3VsWy3bMjgZ/771cPy8=;
 b=Uyo7eOfBI2c7tpQRypYvSsqbRxWfxxqDO0NsiFpfhmkJIv8K7+U7BPXGrJbQWxSl4C
 kJTdklrQXHTjh2P/8+K+MLsLF5/kd/iW/iCQukYF04E/VSNwLXRnNv3gG9fqBop09gw+
 dLpaIYsMcaDSOVcQolFcwqEUmmj7xWP5Gn5X7X5SB2A+q4RwEJUmQmtMbgBp2lDqbgOW
 hi0RD3Lkg+hiu82aPPPnsRXNgcjQYcQqxdYXhJM8RWy3a7KhfoHBpd4swB47v3Ofpb4+
 iMEI257KT+U9bicgm31zcORV3F9lR7X2O+idoQexzmG1uy1gG6np0A+cADH2Mgw+05Az
 vzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711041342; x=1711646142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oSYt7LsVH8jFKn+JCFIJODpA3VsWy3bMjgZ/771cPy8=;
 b=Sj9Ptkadq/YlLxA6V4FgMIjM7rMaH5jEWSyIPcTGxSJFn8YTCUwIa5EXYeZ3DOGEji
 c2i8TFLqebmlio9/ppktUjHATmbeEGu7yJ41Y/lGz/OUNIvjwyf5mcU+CIgsNhIxDlo7
 l+0BoVt9Hbe5/y+jVqgbz9eQChjhmM/zh9HF/twINAoUKkX4hcwqKIWFdOt9AKumjsYE
 ghtBA7+CxQ2OGiWUrBy1f02lTgJaA3/hTj4RGt680KlyCkCTKonIHext4TH4ZA4e1ADO
 BAL3jCU5ofD6ZgaXO3dI+La2QWR4WsIf8C2Zv87kviMt/0F+yPF5qxpZnuCEanL+vB3a
 W+AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4buDw+kE6maUcBcPus2J8Xhv9vyfJkPxlJKTRwdi+3qoBWwIb9n69fLbQ/C/tCyM7Z23r7lZUFkFxCixSC4iHkttn
X-Gm-Message-State: AOJu0Yw5xmC3ZhXzYg5ko++HivXnu8Mi0z0VXLcvoD3X10aarIkTMGio
 78nUNNAGBh9n0h2Fg6V2hXo8n/l61hq1+IYwtFQMPDGSmA9TdNoxcRlrmT8M7Ks=
X-Received: by 2002:a05:6402:1d2b:b0:566:41f4:a0ea with SMTP id
 dh11-20020a0564021d2b00b0056641f4a0eamr3447353edb.37.1711041341967; 
 Thu, 21 Mar 2024 10:15:41 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.206.222])
 by smtp.gmail.com with ESMTPSA id
 el9-20020a056402360900b0056ba017ca7fsm76589edb.87.2024.03.21.10.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 10:15:41 -0700 (PDT)
Message-ID: <f74d141d-69aa-4d7a-8536-5378e4353db3@linaro.org>
Date: Thu, 21 Mar 2024 18:15:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc/pca9554: Fix check of pin range value in property
 accessors
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Glenn Miles <milesg@linux.vnet.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240321160154.901829-1-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240321160154.901829-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: Lh0QuetwLBRA

On 21/3/24 17:01, Cédric Le Goater wrote:
> Coverity detected an "Integer handling" issue with the pin value :
> 
>    In expression "state >> pin", right shifting "state" by more than 7
>    bits always yields zero.  The shift amount, "pin", is as much as 8.
> 
> In practice, this should not happen because the properties "pin8" and
> above are not created. Nevertheless, fix the range to avoid this warning.
> 
> Fixes: CID 1534917
> Fixes: de0c7d543bca ("misc: Add a pca9554 GPIO device model")
> Cc: Glenn Miles <milesg@linux.vnet.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/misc/pca9554.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Isn't it the one Peter fixed in
https://lore.kernel.org/qemu-devel/20240312183810.557768-5-peter.maydell@linaro.org/?
