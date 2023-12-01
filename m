Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp891413ejb;
        Fri, 1 Dec 2023 02:58:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELg7yR55jejaOOTwszZOpQztFXPMpHL7q1roChrVqvAvYNB25HuiwJGLXlK6ZIoknfpPs0
X-Received: by 2002:a05:622a:1b15:b0:423:aa7f:def3 with SMTP id bb21-20020a05622a1b1500b00423aa7fdef3mr20838616qtb.45.1701428305433;
        Fri, 01 Dec 2023 02:58:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701428305; cv=none;
        d=google.com; s=arc-20160816;
        b=i8TRFYhOxUSJOU2Z14hZygpiizF2o+v8NvUSSxsKokokAq/0Cu1kTQAkZE8IrkxZ8q
         pbvVcHMU89S6697+JUoKe9IrKKfq25pCzeHC6XD78cqVlHaLiK5YNc2A/Rh3cYP78t3o
         pCVUluCZvAPe6WsqFM1t7pQzF/A42i02S55fKd/4c0X+duGaD1PvjsTYKnMVTFLElrlT
         HDxahnaoSCh4qDGAwUbuFSG16M6weRh41P5SV0agt7/UefX8Bk/spYSoHV7iXxo0q6F+
         IVpnsNTQ8VX/ddqf5DWET3CLxYx6LkA0LuwPCeuRgYg0LPHvwlghRKwKE8CyHMJo9c+1
         jxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DNRPfE3nS0S9aFqg9iDHO3DZDtkZRObv/JYi45WTizo=;
        fh=CRercKJbM0EKhTPngniMzt0szygmuSJ33W87FfqFq5k=;
        b=GICcv3oEQWed4z0xtGr0sV5ZeByeb5n6f7Belcs1AR+mYFlVKMYb2pR69LUaR0NLx+
         aNQT389DYzBaqs30UhkSzWp66U7hTfX+6rSM0O7La7ZtCf27l7Iic8T9gseIRx7L1UJv
         zW+eRoColYQAhLs2O1GQDS9IKIVrSDKQanhowxTfgsixt01sbKi/XW4adP4eYPJUr+d4
         BoZa8XTDDOPBVB05Q45/e01VtYtN8WL0xiedH/+5NYj6WNqiO5Ebl6HICYLSEWtYqwNZ
         s2kiRQkM3r52rVIYGkrWen2fRrB95DitwB7gg0YN5FvhhRa1yfN7aRogGhTx2vye8vm0
         FR2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OS4mdo4L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ff25-20020a05622a4d9900b0041092f38eeasi3200709qtb.434.2023.12.01.02.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2023 02:58:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OS4mdo4L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r91DY-000240-W9; Fri, 01 Dec 2023 05:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r91DU-000239-Ll
 for qemu-arm@nongnu.org; Fri, 01 Dec 2023 05:57:52 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r91DR-0004N9-OH
 for qemu-arm@nongnu.org; Fri, 01 Dec 2023 05:57:52 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40b4a8db331so18621995e9.3
 for <qemu-arm@nongnu.org>; Fri, 01 Dec 2023 02:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701428267; x=1702033067; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DNRPfE3nS0S9aFqg9iDHO3DZDtkZRObv/JYi45WTizo=;
 b=OS4mdo4Lj/VuiDkyuJ8pP7AoGJ+LB4MvndeQC76qwYg6pMVxvTPXUtNCheP8+pN7wd
 oj2eCn7x3tPULtb3wEllBO+XI0eNFWQYgO1NkdLwQcRjZFUIK6H/Pb4TUjs0B/0aVW/R
 AQJ4gWT90ywIOTcHGPW1jfPIJc2d+K600DCYr9lgNWCFt5nFfLf4290xHyQs+b7J27W6
 MdvTLvKQjxoUp4A9EfCFHK1UzC+WljLjOxYayPlOJ/h3H83Lu5TilP7ZQ4E+vpE4mIK8
 mAE9tEoHXCeBHuiIJV4C6c9gbqk4Wmde8/tnDX9ym1vyApAYtPgOvkJ930jjBwNz9hpc
 WBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701428267; x=1702033067;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DNRPfE3nS0S9aFqg9iDHO3DZDtkZRObv/JYi45WTizo=;
 b=Fab2UWOb34yPiv3CqB7+p+v8a4HJLzcoVNosHgOxq+6s9Ied8eMLerY7bgQ4Igp6Lm
 nD3wHrCYUL7amwwGwKCaVW+WOvzkKMnSPi7olRzwE1tBOauoluCOuZlAtGTQ8OrXSI5M
 7S9BW5EyfaGadYym6dGomghmWHvXy3r3Cym72gBhhllPR0WxlfK/S57JRIkqj5bNXFB+
 PO9xGSxZ9TC8O2pEOvzZnN5buht7Q11hYFhsRCVo7vbRqZiDLVyLt2gSVN3tYLws91fl
 LyZGh1rARieTskPzrj7UUxAKAt0pD0Qxloq2G8Gi4FrxpfDY0dybLZwpaah5+A8V34qG
 Z3Zg==
X-Gm-Message-State: AOJu0YxLKkvrVy0GY9B6lAwN8rSZQdRutNOW8/1VIpQ6v3FBagfiwnxe
 Sv6E7caQxyIB6WQlj9DqtK/SvA==
X-Received: by 2002:a05:600c:1709:b0:40b:5e59:c566 with SMTP id
 c9-20020a05600c170900b0040b5e59c566mr332467wmn.144.1701428267367; 
 Fri, 01 Dec 2023 02:57:47 -0800 (PST)
Received: from [192.168.69.100] ([176.176.160.225])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c348d00b0040b5377cf03sm8725717wmq.1.2023.12.01.02.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 02:57:47 -0800 (PST)
Message-ID: <83046c42-1df3-499e-b202-b123391d39cb@linaro.org>
Date: Fri, 1 Dec 2023 11:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/9] machine: Improve is_cpu_type_supported()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231129042012.277831-1-gshan@redhat.com>
 <20231129042012.277831-4-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129042012.277831-4-gshan@redhat.com>
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
X-TUID: Xgt9wvac0fyN

On 29/11/23 05:20, Gavin Shan wrote:
> It's no sense to check the CPU type when mc->valid_cpu_types[0] is
> NULL.

This case is a programming error, right? We should simply:

  assert(!mc->valid_cpu_types || *mc->valid_cpu_types);

> So the check is skipped for this particular case. The constraint
> has been taken when the error messags are appended.
> 
> A precise hint for the error message is given when mc->valid_cpu_types[0]
> is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
> when we have mutiple valid entries there is avoided to increase the code
> readability, as suggested by Philippe Mathieu-Daudé.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/core/machine.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)

