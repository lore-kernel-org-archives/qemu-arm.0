Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp605070lff;
        Wed, 16 Jun 2021 11:40:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfoE4L8aA3DyhU8N9WmRkHPGQK0Wc4Rq1ceUzDgiPMYKcaymTOqahkbP6dY0bNxYYW7mGi
X-Received: by 2002:a9f:2124:: with SMTP id 33mr1268514uab.134.1623868812487;
        Wed, 16 Jun 2021 11:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623868812; cv=none;
        d=google.com; s=arc-20160816;
        b=gWjS/z5Wgq4Bek2E93oe1vrESKK3jLG3SMV5mdfzuAWUxsFUehE57TZzsrniGd9AXX
         MVDyYyhWxbtxRtRL13J9Z0+DhIcm7Xt2bG5Tv1lZL8dgbG5y7Ip1qiXvVVORRYAmqbDz
         0vAc8ZNpuNVllTjYz9P8nq9aen4FnEUECnOTQ3RrMWyQP3ne3UMtNvpYm9GkZpsnt3vy
         2yDihNi/fXq1CGqSoF82kHroQQUOl59EIqZxkHl8M3TdqioDECG6V1oYs1vDMVwg6JrA
         LPA0N0HFj9BWxX9X7CkPvIwtyg/f2fAEZKxODdNY2hwEQePXu0T37ZI/v44gm20LvH9s
         kAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dXadQ5WSk57Fj8FSMnGg1LPKs4Q+DgDE5DvfHJxdaYk=;
        b=hjGMRzjuhqs40YnKTAFPFkjVpiofpEoXW+Zwpa0xsQc5X97mh7RRn1v40xKsP9yVaU
         /EJVNf9eIwab1N7lgmYlsMSBVhJHcZ641WN5BX31+pp60YckxaTbyUKxFyRuKqKuHPDR
         zXHI/NdZgtS/kMoYqWeVvp97DYM3Ec900OWI41e32y/EDCtrUKjgsrjcm3cMfB2n7j8C
         hQLlQE0pIn6yp+xrLgStX1k4RX8gZXN0QCAyDIku6SDH8Pp6IQRyAlDA6M/ZBvXMz8zj
         xKxNY1jdwVpcbjo7T5sAstp34pBwuIt4Tqf1wKbvAd1zpTDF6l12UMUISMYUFRJUyvaS
         UErQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GuiNWEEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si2105515uaf.139.2021.06.16.11.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 11:40:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GuiNWEEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltaSR-0008Mq-OF
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 14:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRh-0007Ua-F4
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:39:25 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRe-00028y-TT
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:39:25 -0400
Received: by mail-pg1-x530.google.com with SMTP id e22so2698017pgv.10
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 11:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dXadQ5WSk57Fj8FSMnGg1LPKs4Q+DgDE5DvfHJxdaYk=;
 b=GuiNWEECbrGsG0QUZaG5eA0jLPq3cB+b4ucPJpCL88EO7S2lYHvT8na3hOamkT+/BY
 Ivl7ys/N8w/oqXB9To6+u21QYLpXPWCY6K4HxTKzklpiUq8BxjxziUEcVZQ0Qs0M9ahN
 uaApXXg23N97b6lHDJGwe285nTImNTBA7LZnvTbZLagIcd93LPlNHw60oZNjHIUnJbNv
 z2tjA5Mru6wXrqPXwJY7pblmmKyoyPqJz45KpIvVhj4iKVXYVgaes7cyBktEIRa4BzA1
 EHKLwcrtUss2rQXdwLzdFtJEcFdw4RxEHcSmKhBEw7a9F4SWka3iI9JsZ0rpceQpGTLZ
 8TUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dXadQ5WSk57Fj8FSMnGg1LPKs4Q+DgDE5DvfHJxdaYk=;
 b=Kyw44H212hphoT5NdjddEIVDYIN7xzSwFvhpCL4LAdQM8mOwYET/EiTzex0fdmsiKd
 jrASfQsDbB5ve2E7ALxCRxYkTRUGmzUSstwXePWDEVwh2ojGlsf3DyMHAd8pEXp2GJ8g
 ZTRFbYdaE6IUwBxO4yyXlS7qpSvzbOUTTjG3a+wXgCsv3URspalvFDmBwwGp/y+SKOEW
 U7JS03BqC6B+Z+yDYOPbbczXLTmfEFUqPtGnK+GsqR6C58BT+sKrJojaJRCmZHWTGlnI
 Cx61D84TneXAeeU1ifLVeDaoMScHFILyBuahPH1eGcV0MeK8GJhfDWMGhGAcQFj+FwcF
 JC8A==
X-Gm-Message-State: AOAM531d7HOqU0MmXq5J0CJmO/j8i1X04zONX9FevyWITePFiUfzjS3t
 hOZnAXrGquwd51Dg6aOz3pkyOQ==
X-Received: by 2002:aa7:8003:0:b029:2eb:2f8f:a320 with SMTP id
 j3-20020aa780030000b02902eb2f8fa320mr1193861pfi.70.1623868761724; 
 Wed, 16 Jun 2021 11:39:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 4sm5436887pjg.30.2021.06.16.11.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:39:21 -0700 (PDT)
Subject: Re: [PATCH v3 02/13] hw/input/lm832x: Define TYPE_LM8323 in public
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ecb8ccde-4ff0-58e6-af5a-9eb9a9f4125f@linaro.org>
Date: Wed, 16 Jun 2021 11:39:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fD0G9xsfS4er

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Define TYPE_LM8323 in the public "hw/input/lm832x.h"
> header and use it in hw/arm/nseries.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/input/lm832x.h | 4 +++-
>   hw/arm/nseries.c          | 2 +-
>   hw/input/lm832x.c         | 1 -
>   3 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

