Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp29504ejb;
        Thu, 16 Nov 2023 15:14:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuo8gK+StHfMsu9fK6eeZ8t/Ra+0MQ/UcsGT66eyLKPDKIA1bH+EYuuyGW8VEotfrIHar8
X-Received: by 2002:a05:622a:1c0b:b0:41e:23fc:a040 with SMTP id bq11-20020a05622a1c0b00b0041e23fca040mr10786449qtb.56.1700176484630;
        Thu, 16 Nov 2023 15:14:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700176484; cv=none;
        d=google.com; s=arc-20160816;
        b=owfH63KfprCdcyGLE45gWjAMyhLgOqNuiCEQ8Q+KS72k79l6oI9JEBZtWijnyurXwi
         2lbmb1DCBNwKSOattDHVAKEY09oZnkRVELh6XOqXcxnnwHwYT5sUXcaVn+D/pwmDY4CL
         CFFlS2IF7815eCX/odBItSbdSfwcrwJKWy9KubRb0UxYnkFoZGryrswDfj/yB587BhrI
         Y477dZmxbp0MWRTpDjnpaqrGlTJsCcoCrNY6JvMIh6PHzyG61RDtN8y7Gp9rpGyUVMz3
         MC0MYv7KuSgL3FDbs3Z+RrhkWqNUJ8lUfrcDCUsXN0d9ThIss8hv8ca/iSUw0Qk7jpFh
         AObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uhX49lsCrLvnu60dw4Rb1gmQVUOoYKUwb+Zbt/YIRWs=;
        fh=a7pXOaTBsSHAOcDhqYGjai0RHNA6jEApxyxU387OqdQ=;
        b=V91g0Mc8wwt774UNwkEQmNtKTxjIEJhIS4MWROqJw4lebw0g9TrMsNVEaUPXjcJH+Z
         G3rORLD7rrNgn1ll4lQQXoJ9LHsQL1Wu8q0q/EaR2IHwAQtk9v5XJWlFy0oiJ9eU3d5q
         SI07GhQqcuPsjZaFAHmlYeCjiqYG6wSiJhrMOk0R7Nn0uw9Z4pSC1c5Nh1cWrNMDOMiN
         etF+x3lfIRIoCgh9Zm2oI5X5CI47gHk4iiml6WFUmS2ZW4ye4XURvv9pKBrJpcmEQhND
         pTrOjaz9l04bPWksmKox4A8U8CUY6GjZuCHByPGx29j2u83DiY1tQxpZDiYWNLwAWscu
         T/3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Abj9oAhq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a05622a018100b00421c7919ee1si427119qtw.370.2023.11.16.15.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 15:14:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Abj9oAhq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3lYj-0003mS-Hx; Thu, 16 Nov 2023 18:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3lYi-0003lk-FX
 for qemu-devel@nongnu.org; Thu, 16 Nov 2023 18:14:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r3lYf-0002d4-Fx
 for qemu-devel@nongnu.org; Thu, 16 Nov 2023 18:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700176440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhX49lsCrLvnu60dw4Rb1gmQVUOoYKUwb+Zbt/YIRWs=;
 b=Abj9oAhqS4dKEjV3xbC+jD6DNhJex2A3sBki2r9VtvDFi3l9MqMhBihLBlHVyW7SH1ZwE1
 ZHXz8kkJO4Hh87/1YV2rcF7GSRRB7U5g0ByfcJzfo/T6BDHFDlkq/Jflf1pAcBbt45UqTM
 5H2a+jFTd9PPAIleg7ehM4R81+2vUb8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-6BohWB_KNJ-ov5j7TR0Vfg-1; Thu, 16 Nov 2023 18:13:58 -0500
X-MC-Unique: 6BohWB_KNJ-ov5j7TR0Vfg-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1ce5b6ec63cso4413155ad.3
 for <qemu-devel@nongnu.org>; Thu, 16 Nov 2023 15:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700176437; x=1700781237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uhX49lsCrLvnu60dw4Rb1gmQVUOoYKUwb+Zbt/YIRWs=;
 b=WZmbqj0MAPYNECxlqpTEmCngqaDDrc8BS9LwYTSOVxj8g6X/vDHrZxJQbe8VXcVByj
 46JIQlFWu776vtCRs0I1ZowxJdC5GORxShL6ajXw5LIx+rUQs/IVjGsyoitcwpbTQ6bg
 eYMd32c9f55trgZjje7w0deHna1i7z59UJZ20LdadpP55Qq3RIkzw/lzyIrTIW6f9vTc
 G34byTiKyHpw4HdUhA2ADjLvNIWHC9wF1H3OOLFUtKFmogd09r37AIPNsLQ6pP6HvMDj
 yCcnrfA1F0LMJUkpSGFIuRdMH0O7F3IrqGHUCxnz9P0AF1y1omwiOTt7twRM4n2ffTEV
 I7zw==
X-Gm-Message-State: AOJu0YzxVtf4blbTirZELCoDDj9u/eS6Dk9vDvSkGmK0VMqiwV81IFP7
 7M4fWPx9AZk7EoncukSnQieNVJ4rfpBIsYeuvaor1fJT2DY9XtNwH+clYcNEH7un85NvsQ8irKt
 vaK1abBt44YQOp4A=
X-Received: by 2002:a17:902:f544:b0:1cc:4146:9eb0 with SMTP id
 h4-20020a170902f54400b001cc41469eb0mr11890991plf.57.1700176437608; 
 Thu, 16 Nov 2023 15:13:57 -0800 (PST)
X-Received: by 2002:a17:902:f544:b0:1cc:4146:9eb0 with SMTP id
 h4-20020a170902f54400b001cc41469eb0mr11890936plf.57.1700176437262; 
 Thu, 16 Nov 2023 15:13:57 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a170902d71400b001c726147a45sm184151ply.190.2023.11.16.15.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 15:13:56 -0800 (PST)
Message-ID: <41f9dd8e-eb57-47b6-b159-328024bc339d@redhat.com>
Date: Fri, 17 Nov 2023 09:13:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/31] cpu: Call object_class_dynamic_cast() once in
 cpu_class_by_name()
Content-Language: en-US
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
 <20231114235628.534334-4-gshan@redhat.com>
 <d7a80e9e-9ffd-476c-ac98-a92838e11b5e@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <d7a80e9e-9ffd-476c-ac98-a92838e11b5e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.117,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pfv/pe6ovyO7

Hi Phil,

On 11/17/23 02:08, Philippe Mathieu-Daudé wrote:
> On 15/11/23 00:56, Gavin Shan wrote:
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> For all targets, the CPU class returned from CPUClass::class_by_name()
>> and object_class_dynamic_cast(oc, CPU_RESOLVING_TYPE) need to be
>> compatible. Lets apply the check in cpu_class_by_name() for once,
>> instead of having the check in CPUClass::class_by_name() for individual
>> target.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> Gavin, this patch is missing your S-o-b tag. Do you mind responding to
> this email with it? Thanks!
> 

Yes, please add my s-o-b if you need:

Signed-off-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin

>> ---
>>   hw/core/cpu-common.c   | 8 +++++---
>>   target/alpha/cpu.c     | 3 ---
>>   target/arm/cpu.c       | 4 +---
>>   target/avr/cpu.c       | 8 +-------
>>   target/cris/cpu.c      | 4 +---
>>   target/hexagon/cpu.c   | 4 +---
>>   target/hppa/cpu.c      | 7 +------
>>   target/loongarch/cpu.c | 8 +-------
>>   target/m68k/cpu.c      | 4 +---
>>   target/openrisc/cpu.c  | 4 +---
>>   target/riscv/cpu.c     | 4 +---
>>   target/tricore/cpu.c   | 4 +---
>>   target/xtensa/cpu.c    | 4 +---
>>   13 files changed, 16 insertions(+), 50 deletions(-)
> 

