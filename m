Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp212311lfb;
        Thu, 21 Jan 2021 12:23:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfYq7zqq8Rt52hdd0cedw1ITgotpaYRDmweXZ3pYNF4rGN6PY2unwTuy2E7slQNyMJvhl+
X-Received: by 2002:a25:37cb:: with SMTP id e194mr1635723yba.476.1611260621893;
        Thu, 21 Jan 2021 12:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611260621; cv=none;
        d=google.com; s=arc-20160816;
        b=Uz0JT4++NEQlbXnXQx6mOEuQvVGZ59WCropWR4Aruvd1zP3oWUaNN6wGBfoJs2dwSy
         R/1ZD0w/NdoaY/0dnNu2KUHJJuCjimOY6fm6tS5FsHVvq+eb6y3lZ2+T9YBI4J5J0HgS
         S973wIPrQcAZkTqcTYo0un4A9xZvZCj+5OWJ3CmYSw1D5zy9vpYlP8XbkXBt4Ky5/dhs
         eJoqnLCkrKDkbx4+zY44ta6xnnqHqyvX8yFMDFtaXQzF/cy9xrG5UxvuaDDIPjyWIuU5
         35gi/E5BkKGbCzZ8AoDuKW5kZaqiCGP80f2z43zORgtvdxvGXFTazK1t9D7UWMXjIuTq
         Ql/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BUyioOXyxpJhXE0jFgEZtyk4nWwaFvEEbfgUCv81KuI=;
        b=j0TLjTtlbDwKgMIpKJMbJOsvdaKH8BpqmjOH8EQTiSzsFBxzLRPsIomF/EuAQ6FquJ
         Lbnv361lXdhhUrzr+A/cxSQvMQCvCxKefSBrzH6rsNmpDzoVaJWDyQ2QihPiOZbD5b4v
         0lpYwxkBMNfexqtbEkhZ2cnNqYW+jMH5Re+wRKV0FCzEk9Ej60GuqD4JDQlhRMtON7Tz
         drhgojZRzUTgY6J1l++wZcHTMt8zkkL10TKahlf0p/T+cpDYfN7rPhaI+3mxE0e4ZpYE
         ZOzSUS1BcMEhi0ErkHhmqwdatJclW5hXCS+xQnae9Uu8rG65L7FN3ZLW+tp59fFvO3Kx
         cohA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O5NZF3Qf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si1917389ybd.488.2021.01.21.12.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 12:23:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O5NZF3Qf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2gUX-0000Dv-9s
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 15:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gTH-0007rQ-A0; Thu, 21 Jan 2021 15:22:23 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:38913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gTF-0004lB-KO; Thu, 21 Jan 2021 15:22:23 -0500
Received: by mail-ed1-x535.google.com with SMTP id b21so4027351edy.6;
 Thu, 21 Jan 2021 12:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BUyioOXyxpJhXE0jFgEZtyk4nWwaFvEEbfgUCv81KuI=;
 b=O5NZF3QfRB3617JnvXplSyMWVTbQ/mCT1XL3cX8JmJOK+hUbCUUpNvkewty9eShycf
 Tq2CKFMuWksEnfcjC80kopq87CL19GJutG8FKtTxXk4JVJwBXFNK7GN/Yeh//rs0BssJ
 /6HEkxFJCYaYZI0NHNNkvjRowYR1V1LSSJ5iBBrxd+ksHnza9KEjxOpWZ1wwG4ycLI37
 sSskUn8VmVCjSMBWpU3Es2N0zjore/gE8LE5C7s9ffLONi5M8WbxLwPl5FoRHlS21yQM
 7oaelFcpjGCOPOcqz72Dl/nWfy88IvNPful8I+o1wnjmJPuELkeJPBZVvcydL5Q5p27K
 3K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BUyioOXyxpJhXE0jFgEZtyk4nWwaFvEEbfgUCv81KuI=;
 b=Qei1pEwBUctAoG7NlLieNZo8qGe6uq3eTvM4IDsRq96djzWHMgowxLEvQ9v0VZnwcf
 D/IpqXYCHDSyiyTEIhe/iQirQ+42JUB/gIAGZnlNGbbZgyvRHV1lQkDuizh4/CeUrTQt
 ZVgbfVnkWnV6jdPFHg6dqAGoO8wOMXJzdXtSlY7VieQCbdn1t+/+8Nly5IeHRfRdQ+Jf
 BmhEXhhwa/rLXvFeQpmfMnfjqocpKetI2bOWKh5FgHie5TTraXbfjq0WKl0aL+u5eGmw
 au1n/MFiGFn5c0/ITy1tA5ZCHuMA12TYv5rOiuVWZzfV74lYOTbc2Rf759TsBP8l19Yl
 eimg==
X-Gm-Message-State: AOAM530qeVwfuu28ERVT/wj+yonIzFoCRqb6RdgrlouhLd26iuM5gqy5
 UzZhej5LLuWHuoxRK07srGE=
X-Received: by 2002:aa7:d94b:: with SMTP id l11mr696768eds.1.1611260539945;
 Thu, 21 Jan 2021 12:22:19 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s1sm2710726ejx.25.2021.01.21.12.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:22:19 -0800 (PST)
Subject: Re: [PATCH 07/25] hw/timer/cmsdk-apb-timer: Add Clock input
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <197be2f1-7f89-4669-bf65-2d175753ac5e@amsat.org>
Date: Thu, 21 Jan 2021 21:22:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RoPbRg3c+ul6

On 1/21/21 8:06 PM, Peter Maydell wrote:
> As the first step in converting the CMSDK_APB_TIMER device to the
> Clock framework, add a Clock input.  For the moment we do nothing
> with this clock; we will change the behaviour from using the pclk-frq
> property to using the Clock once all the users of this device have
> been converted to wire up the Clock.
> 
> Since the device doesn't already have a doc comment for its "QEMU
> interface", we add one including the new Clock.
> 
> This is a migration compatibility break for machines mps2-an505,
> mps2-an521, musca-a, musca-b1.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/timer/cmsdk-apb-timer.h | 9 +++++++++
>  hw/timer/cmsdk-apb-timer.c         | 7 +++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

