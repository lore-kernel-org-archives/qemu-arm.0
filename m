Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3320649ejc;
        Wed, 15 Nov 2023 23:53:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMIv6+a5RTlMNKlmyufdyYXcgDqPvQqPAoMX3830HEiOMKACySwSB9bVlaa/8a+iCQL5Cv
X-Received: by 2002:a0c:ecc2:0:b0:670:6678:10ac with SMTP id o2-20020a0cecc2000000b00670667810acmr8257810qvq.37.1700121180359;
        Wed, 15 Nov 2023 23:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700121180; cv=none;
        d=google.com; s=arc-20160816;
        b=wTlEmGOqw6sLKPNDBovauN0sNE2Pej29Xvp69knln7O8Q6whZUSyDH6YmCkEJloODM
         6leE4Ly53+36PO6JfwECUqkTPY+phNUb/fnYpwPDE30RDrkkU12vS0TyQSE0thuQy+Mk
         zeiHy/xWcXVdXGIoYtFAMvyCAKELimuG5dJefj9Eba9A/b2ZMN2Oz5mCt5roAM96xr9l
         lsZ7/47tgSThFN+R0ixdW1P3w1ix8RyayjAGvSKxUH9XT3kBbkkYgNmt7NPJqyjfYcch
         8gwm3qR9ix8fe3yBAerQeI4/3CXTQmazRAqRjv0n5N9xMMNxdmw+ijib/E4q5f6BlMIk
         60bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bVBLTPcn6P6YOOV5bkUTIF63TSWbVHO4Z9N2cS8rcho=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=mGgVjssXq9VQ9zr7qtbF9qF+QLQSkwkmmGEXFQ+M+LFu7RZhRI2nDoElOyD4dDbr1e
         hZviypRRr9cmFbQYobdBN1ga+MKSgukaitRI6yXYmuzZHYxp4AkMhsv0iC0OVFhpidYQ
         gFDTJfVYHcvqF0pjEb0wcbfKcs/B1PSjr7l3sPNhtufYVKZDu4AVUESna1cyXrQ26ZVW
         y3hYP4evsbHI4YOcFHinYqIyOsMCJTLA67CeDCVSWvWegYSlAw7yosZKW1dqipS9WyxG
         wJci7S4WFydFRB5+VKrT9HdSX6jN7+fqg+0Zkc8XvIRFLxM7ZZP2uXvtFE4ac/XXbNUA
         nRrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hiyJxWYk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020a05620a248700b0076dbec5d9a0si10648953qkn.710.2023.11.15.23.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 23:53:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hiyJxWYk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3XBF-00043M-LX; Thu, 16 Nov 2023 02:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XBB-0003tu-91
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:52:50 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XB8-00018E-Mn
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:52:49 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso4254715e9.1
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 23:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121165; x=1700725965; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bVBLTPcn6P6YOOV5bkUTIF63TSWbVHO4Z9N2cS8rcho=;
 b=hiyJxWYkN7eOiYsE5ASuQ8qHQlJE5/kirDv1XOyRVbaWjiviJ2yesR1vW5qig7uGwN
 +84hOJLdOGfS4BGFimpU9i9xCubbZhoHDXL8QSUBTAqPq+PkkrxbRVSiHsUIigPzM6G9
 q/0kVGUMQ7PsSNlt8F0V5fn+YckPRZePVqdQaLelk8o09Mwz7XXQCEfaJ91S2MhBib4R
 LpcRpK03xs3RIev6qeZ19n2h8d4Uv3rRsDEUb105nV5Va5kgpwsjozqCFRvjXolpSZJK
 A9WF+nnxtlaBS++7+GMPSC7GDVg4UJJfm7qc1BIKo0BK5YBZTEfrd/lGyKy7l/WLVWeM
 fKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121165; x=1700725965;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bVBLTPcn6P6YOOV5bkUTIF63TSWbVHO4Z9N2cS8rcho=;
 b=fbA42UqrfK8P+VGyNtkcUqljEDwtc5fVKy56szx7S9KPsI5QpcZksDg6rMUBNO7uDa
 jxieh50lw5UuqsX1HkLYJdgh6qmVOjzDVW+KfTkhQLHQV5oOSEAytjrlt5QCe5VNC3SN
 Ri3nNp+ePXO8RHMqpiwiQODDbraZITA1o6MPY9hl0AGak7TECiYECV+AoW1ktquozJ8h
 jXxLtXh/kQu08hUf2kIyZLUL9OaUkZGfNAkt2lUa6IH3b9geKgYv8tpF90Q3iZ3RLDg7
 M1EfB9B80b73Zhil8se7cIfwHjNSmU/tg/XIgPKgN5iGsQeSVOdNL81tR66IroxpTQFQ
 /aiw==
X-Gm-Message-State: AOJu0Yw5BbsLoMVPNvHDqeqfVvbUs3/tSJ4Zw4Roq3tLIQ4D/e1wbG6Q
 IyvlXUNfs9oq3TpuOs68zThMuA==
X-Received: by 2002:a05:6000:2c1:b0:32f:c750:6ebc with SMTP id
 o1-20020a05600002c100b0032fc7506ebcmr11761156wry.71.1700121165106; 
 Wed, 15 Nov 2023 23:52:45 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:52:44 -0800 (PST)
Message-ID: <e76fa4a3-a768-477d-a67d-cc8ba5d777d7@linaro.org>
Date: Thu, 16 Nov 2023 08:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/31] target/hexagon: Use generic cpu_list()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-12-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-12-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: z4EGWuCYPHnA

On 15/11/23 00:56, Gavin Shan wrote:
> No changes in the output from the following command.
> 
> [gshan@gshan q]$ ./build/qemu-hexagon -cpu ?
> Available CPUs:
>    v67
>    v68
>    v69
>    v71
>    v73
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/hexagon/cpu.c | 20 --------------------
>   target/hexagon/cpu.h |  3 ---
>   2 files changed, 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

