Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3383696ejc;
        Thu, 16 Nov 2023 02:13:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY+ReC1mIfcIWgrTFBkzYtzRGvvx2YwfFszRqpH5qFTolU4u076BRy6B/LFzjqlgJciNVm
X-Received: by 2002:a25:d404:0:b0:d9b:351:6657 with SMTP id m4-20020a25d404000000b00d9b03516657mr15988631ybf.23.1700129604185;
        Thu, 16 Nov 2023 02:13:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700129604; cv=none;
        d=google.com; s=arc-20160816;
        b=d6xoFwlsgEPTaHKouuCObjGm/yOiVip1SzCQnHBdlpWjwVUA//CLuzHSrLX4y6EdTr
         VfWI9nWLYfo/7/i/KMOU/u3yCqBXEcj74wrc8nqUtrscROH+0fOwqa1WCx8IcHUh9PK7
         Qu0eEAnOxdZpWxq4MjCETc89fbTLSq1FqT1xD3ghDbHipLcjEUb3SFFh8XiAzJ7uuTSj
         +hLv4Xglp89Uh1O0/wmOVoGu/WN4iiUs/qSrGeB8yfC5Lht5yaOUTMryjbVMiasw0MIO
         hXzf4ZcRa+up43Cdzj+sKXms9ulILg7ejsGJy6TK/XJbdee8SUhKxku3y59TNsLeskpi
         tSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+u6id15jXGcOGlTGr5+ijFRSSNJOKfEYhpt2E3GbuoY=;
        fh=a7pXOaTBsSHAOcDhqYGjai0RHNA6jEApxyxU387OqdQ=;
        b=lnmKpK+peEIkLvmNYRsY/2HYrGBJus9uIPk2ZdKiLMOAw0y9+mVKEKvT1aSs0E5Ccn
         xzsCenAQ9EazGuiM6H8kErwEzqhG5vFCEnD83hixm2HxDgRKYOqD5vTJcusotu+dl4s9
         TKvk4gLbhT3Sp8NuLGSMDYhG+GOQONztSBQKLnvnxC1/rOzTZJ6KfMBwk8KBFgqWaheZ
         pz5BSzlpVcp1HuKeyN3tp0G2YQFA44pxITWrhA+4pQa8mMUo1pSS5kp/YtHlesWg1dxH
         mX3iDjcn2DwRNv0eLikENUA6vrUmAitzViFeyeJE7KInPvCgT9+UBfOq3fgSKa4BqVPU
         UNaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W7ZkfrBy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7-20020ad440c7000000b0065b231f117dsi11461156qvp.205.2023.11.16.02.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 02:13:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W7ZkfrBy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3ZMW-0000gg-AU; Thu, 16 Nov 2023 05:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3ZMT-0000fb-Di
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 05:12:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3ZMQ-0002qo-U1
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 05:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700129554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+u6id15jXGcOGlTGr5+ijFRSSNJOKfEYhpt2E3GbuoY=;
 b=W7ZkfrByRj/qhZnNSqBblPK7nJiUivAdYnoEmxO3ZuYDwhSqaJVi/mKThu49cQBvOl2iQo
 dSFmagCevfewivp+Ln/eHMCJ5U6Bsbn9qRW7crPLEfTgFoEE549D0Ms04zp6KhaFTwQ5Yq
 lx49zXhrjtxYMHpUrxTHHZdYiFTNyKQ=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-oG1DlnygO5yOXlOgV1rQzw-1; Thu, 16 Nov 2023 05:12:31 -0500
X-MC-Unique: oG1DlnygO5yOXlOgV1rQzw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1f08758b52cso521973fac.3
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 02:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700129550; x=1700734350;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+u6id15jXGcOGlTGr5+ijFRSSNJOKfEYhpt2E3GbuoY=;
 b=pR8CmEwNr4PJ9s8SDgQQBDcI004kk+6r4YeOWrNHtEXPHkObln2UaIqSbhtO+yZrQS
 Yb2TZ9XXNw7IC1PR2ekNqshuD4j1sHEevLXqAP8gJPQ5wLxirkTulnt+oaKd3x+0MIah
 fu0LXTCVz3oM1ESCquNxJuDKZk/RTBPdf3H2SBNrXEKmejaEZneNp6CSRVEG7uNCVGfH
 IS9PYj7yJf6TIPYTDiGqZXd6cZhNdbcpjVqBzbYRFgrTMKbV+P3XgWavMTbcHQwl0nI3
 FQ+C530QTlMPWAS4cg9D+buwpIDCFUbkf8ker80g1SHbmvNLB7D4BFZFABSUP1R+D5aW
 w8yg==
X-Gm-Message-State: AOJu0Yxcntfvi1PS0RuHSsJCEbu5c+jZXJu5xRvBJGQvWNmFYxw8tAFu
 wczlnSzV31vvFrGmbA7LHeGT6in1maIjpGsqwkmgNO/rkdGf/6hhQvwW8W8wtMWNdKHYsJJqa8H
 k6v0ZSvpSGdqQ
X-Received: by 2002:a05:6870:7992:b0:1ef:c499:174e with SMTP id
 he18-20020a056870799200b001efc499174emr21576365oab.49.1700129550573; 
 Thu, 16 Nov 2023 02:12:30 -0800 (PST)
X-Received: by 2002:a05:6870:7992:b0:1ef:c499:174e with SMTP id
 he18-20020a056870799200b001efc499174emr21576349oab.49.1700129550345; 
 Thu, 16 Nov 2023 02:12:30 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 k6-20020aa790c6000000b0069344caf840sm4332076pfk.18.2023.11.16.02.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:12:29 -0800 (PST)
Message-ID: <c4607c50-420c-4ff0-bbff-8b2c2fd03f27@redhat.com>
Date: Thu, 16 Nov 2023 20:12:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
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
 <d5b43eb1-93b4-4e3e-8c37-1dabd5a4cb52@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <d5b43eb1-93b4-4e3e-8c37-1dabd5a4cb52@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: PeEu+bKU+h/q

Hi Phil,

On 11/16/23 20:01, Philippe Mathieu-Daudé wrote:
> On 15/11/23 00:55, Gavin Shan wrote:
>> There are two places where the user specified CPU type is checked to see
>> if it's supported or allowed by the board: machine_run_board_init() and
>> mc->init(). We don't have to maintain two duplicate sets of logic. This
>> series intends to move the check to machine_run_board_init() so that we
>> have unified CPU type check.
>>
>> PATCH[01-04] consolidate CPUClass::class_by_name() so that the returned
>>               CPU class is checked for once in cpu_class_by_name()
>> PATCH[05]    add generic helper cpu_model_from_type() to extract the CPU
>>               model name from the CPU type name
>> PATCH[06]    add generic cpu_list(), to be reused by most of the targets
>> PATCH[07-21] switch to generic cpu_list() for most of the targets
>> PATCH[22]    use generic helper cpu_model_from_type() for several targets
>> PATCH[23-31] validate the CPU type in machine_run_board_init() for the
>>               individual board
>>
>> v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00302.html
>> v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00528.html
>> v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-09/msg00157.html
>> v4: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00005.html
> 
> Maybe I missed the comment in earlier series, but what is the plan for
> the following targets?
> 
> $ git grep 'define cpu_list'
> target/i386/cpu.h:2289:#define cpu_list x86_cpu_list
> target/ppc/cpu.h:1623:#define cpu_list ppc_cpu_list
> target/s390x/cpu.h:922:#define cpu_list s390_cpu_list
> target/sparc/cpu.h:673:#define cpu_list sparc_cpu_list
> 

Thanks a lot for your review.

The generic cpu_list() was suggested by Richard on v5, so there're nothing
you missed. For those targets, there are target dependent output from
xxx_cpu_list() and the generic cpu_list() doesn't fit. So the plan is to
leave them as of being.

Thanks,
Gavin

