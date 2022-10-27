Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp708213ejn;
        Thu, 27 Oct 2022 14:13:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5lJo7JXri30wJxOo/qn90t5PpmmgqEIK6/WX3LK/XtW+614EeI3D130KqdTZL0gEGfkEyp
X-Received: by 2002:a37:2e84:0:b0:6cf:8dd4:7adc with SMTP id u126-20020a372e84000000b006cf8dd47adcmr36837872qkh.723.1666905218167;
        Thu, 27 Oct 2022 14:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666905218; cv=none;
        d=google.com; s=arc-20160816;
        b=EqfqzNrxwX6cjlusmeQ8V+MKhj03FrUTO1/e/5RUEerkHjIPwC5oopfC7wKzrnYXtX
         +AcCNIoiSxUgZU/Al4GdJRl33SK1LxM0K+lQSobU26gyulr5yAzc153xoPfWaUkm5984
         nyF8YJd0ay7I3wb525EdR54S267o7hB31Qa0MvtmhlM49k70NaA+fGgjHo5YW+W/hzF1
         pmi3bJlz0BP3mm0fWniSDA+b0y+NjrodhPM8TeVM0u0NXU9uq89VnotGz49NgJu/4Y5k
         6seisd4w7Y0arwhryaKbSzu5pOR9CEP5Hn8aeeqa/CbdtrXfPJUHV+8vrM9lue5jIrYQ
         IMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Uk4PKUN41u2ml651A9Iwj+QGAFZESqRPSm/ASQZfBFE=;
        b=u09zoCZ3klGcYuwrRJ8AGShmGhvgIP9smoWNMWNXW+jSuVX381cp1gOD0IfJH9WX3Q
         fW/YE+5Sszp2L0q8sIdywzg89XPhEkKzsbL62Fd6pRouh5iTRy8brIkZfuoL28UvPcNz
         pm8CBRcL1TNSRd9GS+WLIZmJ8xQKT+qOLL2BHC4eT5GDmOLqRC4NXs/YMNopwANYGG/U
         7LLmpDQIgxVjZ9gdbc51eGd2be3Tl8YisXiHeQLywqyAb4ae5eJCiWWXQwnjRaehyrkW
         Zgzm28p5BENTrU+3E3nzc1SbX0ybAfPj+ZwtBbD7X4iUQrNkGVN/0Npa9Jat5F7SlW0h
         IYbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C7Z5/49w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h23-20020ac85157000000b0035de2be972dsi1494828qtn.483.2022.10.27.14.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Oct 2022 14:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C7Z5/49w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooAB5-000389-JE; Thu, 27 Oct 2022 17:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAB3-00037e-Jv
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:12:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAB1-0002xv-NY
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:12:37 -0400
Received: by mail-wr1-x431.google.com with SMTP id bp11so4254959wrb.9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uk4PKUN41u2ml651A9Iwj+QGAFZESqRPSm/ASQZfBFE=;
 b=C7Z5/49wYrtVINQWv8teiqN7YyK+CGpXsbGPqI0vNkAZhi5GcVVQGVrMNeJW9nILLy
 ZUXbbOpkJct7veUoIOj5lyfppwZ7oaDT3fMTUlOkdPKjT2SRZKHMStHtNB9WhBo5vPBZ
 JtxAnAJ5AWnfV/80UqIhKHu7KXtVijJXC09dt+QXVeWFa13vQsGH1vLyI9y+qZHFEvQM
 N8ZgsbeB/auBQPGOHP/7gAJMlNZQxC4AKQAyzPA4MOShjBqjDsovCfebCw8vV6Z/Vfgc
 6rrwngTIu8BG47EaPgGi1U18oMj/a6cLJYHu8ijqB7fp+l7WUErB9WwPjCog8qML2a6y
 yI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uk4PKUN41u2ml651A9Iwj+QGAFZESqRPSm/ASQZfBFE=;
 b=6GT9Pi6ok/Hs2YKboNrC7il5/JvgQ+ZHcA0pgSMlRczw7R2dJoV86SLYkp2f7UzVuG
 6ORFmjnWusDncLcoXaYNFipUU7as/ms51BXLp48BYTadJZtqidatic+XSnrTIkGthLtO
 oTa7E/fj3wkZsvn3rGHMIRFPVkpKOvw7xkOaaPdDwnxwyDKiQPgaJQbOH905cGLfh/ZA
 unEO8G6SybLGnxAYVnA/FMO3OtYs2gD0ikdyCMutg+wj1wLfzn0QE2dzyC5D7PBLbUb8
 dRWBmaqi1ul/ImHaQwcCpvQ3hUVX8igRSodsQiVzAFjstoIHsFFxLIx4VTdm7aFzBPSc
 t64g==
X-Gm-Message-State: ACrzQf00cnnV8CAd5/pfs9KnQcIK3Y+g3+nPuOkJi45PuCfZ0tuHPdhy
 EVpGItX81jvgjQhtY/X1VWys0Q==
X-Received: by 2002:adf:fd4a:0:b0:236:87bc:a900 with SMTP id
 h10-20020adffd4a000000b0023687bca900mr8230139wrs.706.1666905154263; 
 Thu, 27 Oct 2022 14:12:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a5d690e000000b00225307f43fbsm1932329wru.44.2022.10.27.14.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:12:33 -0700 (PDT)
Message-ID: <656ed959-7b40-a357-5e58-c353f548fe10@linaro.org>
Date: Thu, 27 Oct 2022 23:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 7/7] hw/ppc/e500: Add Freescale eSDHC to e500plat
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018210146.193159-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wsszClbNoVpG

On 18/10/22 23:01, Bernhard Beschow wrote:
> Adds missing functionality to e500plat machine which increases the
> chance of given "real" firmware images to access SD cards.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   docs/system/ppc/ppce500.rst | 12 ++++++++++++
>   hw/ppc/Kconfig              |  1 +
>   hw/ppc/e500.c               | 35 ++++++++++++++++++++++++++++++++++-
>   hw/ppc/e500.h               |  1 +
>   hw/ppc/e500plat.c           |  1 +
>   5 files changed, 49 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

