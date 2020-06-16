Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2876704lfm;
        Tue, 16 Jun 2020 12:00:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4O4xolN1hIh2l/MESYiG2xnkuCeQLzwJWlzrUs0JvucE+RhW6oXGTUboeqfj2wtCdYANT
X-Received: by 2002:a25:7003:: with SMTP id l3mr6534048ybc.380.1592334046420;
        Tue, 16 Jun 2020 12:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592334046; cv=none;
        d=google.com; s=arc-20160816;
        b=mVJs4ZIJxST+Dfl8/h/WaO3CCCr/hkd5sjuXfIjmD97bbqZji+nWe/yO9cvJDby5FL
         HYdC37bsb6mn1jykuwnXY02vJbTJTTUbPvA9XT9Qcwhlmbzm0SlmlLqXbY1PFIucRb62
         dPZ5Gn66ogaJnP22ErKetA2RASBma/aaW5IpJ97nPgE1j3Ef3jw83KmAsuErftkYixve
         vGT/nOd1ZMga/WHQNxi0gATfWSpqg7tVqEC6uaO704DvonpOkj+e0IRKN7As4VhELVoW
         /vNSprivQzAWCdQI7g2TWOdVHYiDPeCUc9TMyazkrsWbrCEWPnKiOTEhCggR4axidiUv
         30mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lODIeabYy1sWGEgwJXGcvNIdPesDYL5vG0+jAHyV8WE=;
        b=tqiYv3LaHqFSHDZxsYudpM/WbuROji1UncCxajem1noD2CiiXlLa1qyQ1b1JR5isiW
         1hvNBVy6us5JcIYQL2IM3gB5H03hDE48ykApJxPKEruXxVFP0dKxHXb/FhGwx4Z7GPzN
         K6JOKkqFbUmaEIoD1UV6YcUVq+oa7ZLv6f3eMgHWh4FcGHooOgk3ZNk9vfVLBbQbZ2vm
         aSoboFdRyFJ31q48lOEsrMACb7KbaaQPy/cp6ovsF8QUjKkVB31b8GdJT+t5fkpE8H46
         pPuBi0oHhjlobTaf+GyvF24UDFLs28sCE/F1u/oTf8p93NeluK6VIEEe6uGOMhEemWBt
         E+zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UX6t/pDX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v83si17014391ybv.434.2020.06.16.12.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 12:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UX6t/pDX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlGpB-000203-OY
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 15:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGoe-0001cR-QE
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 15:00:12 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:33966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGoc-0001hu-Fg
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 15:00:12 -0400
Received: by mail-pj1-x1044.google.com with SMTP id a45so1426343pje.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 12:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lODIeabYy1sWGEgwJXGcvNIdPesDYL5vG0+jAHyV8WE=;
 b=UX6t/pDXWPzeEjyYzLwdeOE1UqAhIAaN2ZAZyepCcGRYiJdnFLk7Y6OUBQWfMiR5KD
 ne7k7+SpZmq3tIVyRyHUUznFdUItUrVl5XO6hqpVDCTFYMbeEqK+C72aMHShgAYjocD4
 YOm8dso3sLH4rTdR7v7FzfLRk9TZxuqgSlKqsuTwLrOBg0hMtp8Ug90XukhM4uLy/7ac
 GF9R0CY7zo0NqhTaO6D6mKzbh8qaAZOlNIpJReiDREFYiYunXXVA/WdDijZOOzT2pP2Y
 mATXHrjNQiSOumFTu39dMdYOS9i6plYBKsjQZTWLri1Dm9p/cyzImgUzp83ryn5rUif2
 ZgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lODIeabYy1sWGEgwJXGcvNIdPesDYL5vG0+jAHyV8WE=;
 b=H+Rz44y/qMfGtxYk6I7u0oQer1+ojx98CZ+FCErCTS6f/ev/TEhmHSDAaD1XDaVFbH
 3ZMI7cfD6edlQ3ioE+OLvprWIH5YRO88mKlbh9T8Y5nzhhx4aj5x6BTJGTas2xTvLG4t
 xpILJIjJIZ/QMDaQfxeiIZptQjWkTzKTQihcKplcj5N80OfVOuTWWPoymcAa9+vGutM+
 37QsXH9jtXHoXgd7WrsjajynUP+lHt/iQ0MoCNP+pD7tJozCoCWRLxNSSmiMqB6yjhXy
 ouCDHuBYT78wS86DLbQQ3b+bojXGq69pSi5B95xK9LD1QhO/V7fRxNS7qINOuWrkEwbA
 Tm2w==
X-Gm-Message-State: AOAM530yySuA3KWA0hW2b4kvhMPVvUDGwQftzdr2GJ/ygFLh13EN5+9x
 lMwTFq6pB6b4QXx7ariQ6TbwhoH66pE=
X-Received: by 2002:a17:902:8bc7:: with SMTP id
 r7mr3357321plo.57.1592334009034; 
 Tue, 16 Jun 2020 12:00:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id jz23sm3333058pjb.2.2020.06.16.12.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 12:00:08 -0700 (PDT)
Subject: Re: [PATCH RFC 0/3] target/arm: Implement SVE2 fp conversion
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200428174332.17162-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db57c0a3-634f-caef-cab6-8b692a22e661@linaro.org>
Date: Tue, 16 Jun 2020 12:00:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200428174332.17162-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FqDFOnaA0ZcV

On 4/28/20 10:43 AM, Stephen Long wrote:
> The only insn left in this category is BFCVTNT. I couldn't find any
> helper functions for bfloats so I'm not sure how to approach this insn.
> 
> Also, for insn FCVTXNT, I'm not sure if it is ok to set the status rounding
> mode to odd like that.
> 
> Stephen Long (3):
>   target/arm: Implement SVE2 FCVTNT
>   target/arm: Implement SVE2 FCVTLT
>   target/arm: Implement SVE2 FCVTXNT

Queued, with the change to the third patch as mentioned.


r~
