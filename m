Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1021325ejx;
        Sun, 10 Sep 2023 16:29:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVL2zFcPtQn632Ra9GGKvYONgIQNCDVY1g3gJnpVlsJhzvs/BC6Uxul1xEoPd/r6pG39sV
X-Received: by 2002:a05:620a:1787:b0:770:6dfe:8b78 with SMTP id ay7-20020a05620a178700b007706dfe8b78mr10871955qkb.33.1694388588651;
        Sun, 10 Sep 2023 16:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694388588; cv=none;
        d=google.com; s=arc-20160816;
        b=LHZRX7L5CKpu7Pn48V5+3iKDU8yrR2shdAjk9WdE0E/zktBJ6FafkcUABrfkvFsaoj
         BEDz17CiDgRrtrVFg8Kp8sJqBJkmDqhgeJrQcgB0uCk+2M90SqsfRxwAeOqE9ON16YM/
         vLeYEtM3Pipz88t3hJap7tETHezTTbgIkbBPXsSriF+u9a38hREMqWMr2uRiKovt0/jU
         9g1bXx+EFyrbxUofGyYQCsH+NU7j0FjVKygofGVBhY60ADSWn7HcIgQviS4+inGDbotk
         wZKzfl/f3Y4qe7RW+TM34yKTmAZK0MKYubDbeHDe2G0Pl1o9gibfjfWffg9b/gehOXLo
         0e7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hAju71sftURmQHKQ3rbHJSgblwqG5zsGqkK+gjZHwE4=;
        fh=umzWOJsUp6qBpMZfaR/35tHg7PJylqVzX5Du8QxP/Gc=;
        b=pmPkOr0xRKKdyHFSOwYIOLddz4I58A6D8dec1KecTajYu6OpODZcmarnbHwmiWbC+o
         GArI9hk8xb9Mum6Cr4ubWjU+5nUUgJkqhCgVUhAY6pNjOV0OaNEaCy1goGDyCjamDzhJ
         L7pAwzqs2DVLPNR0A4geUNywl3N01pALknnIc3dkRfJOy3IQJYStWXFdizpklOgZvtkm
         73BuStDcjTah8P1QXC02upCTeBKKF1t39DQv8jNsruRMjhAXR+nZWx1IpMryqdg+m4bu
         2J2OQ6wTiHl5Gmd98toCae+weBGakli/OiPtbCporM8OEb2TkE20IdNvOpZTA511hS3b
         6mHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QedcQoH5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a05620a02e700b00767ba32eae8si4080406qko.359.2023.09.10.16.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Sep 2023 16:29:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QedcQoH5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfTs9-0005P6-Uc; Sun, 10 Sep 2023 19:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfTs7-0005CM-Sx
 for qemu-arm@nongnu.org; Sun, 10 Sep 2023 19:29:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfTs5-0005fJ-P5
 for qemu-arm@nongnu.org; Sun, 10 Sep 2023 19:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694388581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAju71sftURmQHKQ3rbHJSgblwqG5zsGqkK+gjZHwE4=;
 b=QedcQoH53brnu7Mk3fPnJ4IQLDtzAYMskSjk8eEyvTTMj4W3CEbWHfwHRz8BIuEnCE+PD5
 a+CS7wlQCOL6MVyfgheXEgKV2bdMCFRkdiIVU6CoswigCp60bMnVnsLsHUl2lfjpuw5Iux
 QqJtATAUCtov+0UGCd41hlKqdYXetUY=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-ynUTqpNkPMeu9pzI4dsjJw-1; Sun, 10 Sep 2023 19:29:40 -0400
X-MC-Unique: ynUTqpNkPMeu9pzI4dsjJw-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1bf75ca4e4fso45886075ad.0
 for <qemu-arm@nongnu.org>; Sun, 10 Sep 2023 16:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694388579; x=1694993379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hAju71sftURmQHKQ3rbHJSgblwqG5zsGqkK+gjZHwE4=;
 b=f/eyGmPgdIqd502dN53Nkh0eh+g9fgjoky+xCMEvz+dxL5IL1FIBQ4q+dEzHWyLzca
 eONbVsV6y9r6stk4d6FV+rI21I0ApOM8CJRJDHt72/yceR8ZrplLYXmxNkCFLHAUZavI
 TZ9A9aV6epPbzdZKy91Z2fpjSltXFZ4BKigEhRFDdsmRGOrUlPKU4OMnZcftbOfjW+qI
 VM+cVo5fa1VIRaA2foqVHoPOGB/S+sjorMaOJxIQExKBFGh9T+N1Ta6lm+z8LIw3+N+z
 B9N5oUe4pcCi09wBQ5J0tGOjhk7YFZCvFEcMJi2EQAxRZxNv7dvcMmSABFn9VUTRj9+O
 6uLg==
X-Gm-Message-State: AOJu0YypndI48F74QnxeM6pnFDIOUl8beFjGYv4xUAshpHIiS73uybfv
 7UxpQO2jbNeYBXyo3k9XachlbTN8vLRFKU6khvouj0EDjiJFfYE6//en/HqLXSgxQHBnOL/og/S
 rnIXqHz5N761U
X-Received: by 2002:a17:903:41d1:b0:1c0:afda:7707 with SMTP id
 u17-20020a17090341d100b001c0afda7707mr11855858ple.34.1694388578983; 
 Sun, 10 Sep 2023 16:29:38 -0700 (PDT)
X-Received: by 2002:a17:903:41d1:b0:1c0:afda:7707 with SMTP id
 u17-20020a17090341d100b001c0afda7707mr11855826ple.34.1694388578576; 
 Sun, 10 Sep 2023 16:29:38 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 iw7-20020a170903044700b001c3a7fbf96fsm1728421plb.216.2023.09.10.16.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Sep 2023 16:29:37 -0700 (PDT)
Message-ID: <65ad3c9c-92ce-5b9f-9181-d466affaf32c@redhat.com>
Date: Mon, 11 Sep 2023 09:29:23 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/4] target/alpha: Tidy up alpha_cpu_class_by_name()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Bin Meng <bin.meng@windriver.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230908112235.75914-1-philmd@linaro.org>
 <20230908112235.75914-2-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230908112235.75914-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dbFIs0LB3Hkt



On 9/8/23 21:22, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/alpha/cpu.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 270ae787b1..351ee2e9f2 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -142,13 +142,10 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>       typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -    if (oc != NULL && object_class_is_abstract(oc)) {
> -        oc = NULL;
> -    }
>   
>       /* TODO: remove match everything nonsense */
> -    /* Default to ev67; no reason not to emulate insns by default. */
> -    if (!oc) {
> +    if (!oc || object_class_is_abstract(oc)) {
> +        /* Default to ev67; no reason not to emulate insns by default. */
>           oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
>       }
>   

