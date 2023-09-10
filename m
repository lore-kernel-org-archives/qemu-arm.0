Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1024650ejx;
        Sun, 10 Sep 2023 16:41:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESFUPezmddmZ76uMoN8MA1P9T0X3AKDPFfd69BHjorKAKc2kLPOs89FfcV8r0lvRvuf8fd
X-Received: by 2002:a05:620a:2883:b0:771:1b7:68c6 with SMTP id j3-20020a05620a288300b0077101b768c6mr1782537qkp.31.1694389260368;
        Sun, 10 Sep 2023 16:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694389260; cv=none;
        d=google.com; s=arc-20160816;
        b=vz2T8NzjpnYWmKa6ARsytczL7knR69nrrzi1xIFVLYh62IthpFiLB+RATt57ON0BEl
         wK/VS0VG85P7jw/IVbH3AjW1v511L0OfsZUPN+XWGfwOdmPPFtI2FcK27MWt72Ry0inO
         ilPxYbX9F2jUCahmAzjx1d/7rspFG3OfWyms8YTLRrpVmYLQ0V2ktqgq8TwknrwQEcTm
         FD4Xdvp8aLkrSEctW2A97qJ0bFETbU61DqGWnk+I+Oqo6YhK2tNZB4vaUCGhCcHtfBFe
         dnO3J1fgJT+4Z8vMgnd/FHypbM6CtFPsLjwvd6lpopmQoaxAFb5sKN/gc6w0+f2EZX1h
         9rXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7gFrfst67vcV3eEFf0unDwCn+89yqJz8XENfDXeUu5o=;
        fh=umzWOJsUp6qBpMZfaR/35tHg7PJylqVzX5Du8QxP/Gc=;
        b=helvI87M1fYUCYRn6nSLfW+E3vp8LPPNTUZR+/MP58iU11Q2p622mFUlk/fMen3M6v
         GSjQdK0sgrr4Pb8uAdKLAIXSSvHO6u4E2A3BzmXeDl1AnQjMEy3nzXjdXLKBQTn/Kk68
         YXmC/xQF2SvCrnH/wLOaQYoMR66aCRj5LYbGYyurlnu70ThHIjfNeil0Ko9A0ZpPvk8C
         k/D+SQE8NigHhEFPs6MumglzNP4/HiIu9PhodJkKR2Ofm5Agmq9q3/Pa0lfJYp8SOtMe
         wzY/ZQaDm/3rYvj6yhOLak9j8iDcv6KcYmPVhbrAXN4UCgkbe2t1St/+FH2GWwShBYQH
         t+CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CaBlOINO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm13-20020a05620a198d00b0076801d54d1csi4022852qkb.642.2023.09.10.16.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Sep 2023 16:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CaBlOINO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfU2h-0004Sj-BS; Sun, 10 Sep 2023 19:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfU2g-0004SJ-1X
 for qemu-arm@nongnu.org; Sun, 10 Sep 2023 19:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qfU2d-0007ao-EB
 for qemu-arm@nongnu.org; Sun, 10 Sep 2023 19:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694389234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7gFrfst67vcV3eEFf0unDwCn+89yqJz8XENfDXeUu5o=;
 b=CaBlOINOnDqTvEsEYb1aICzuXKNKz4GNTxf5dsgUkbVIlO0YypkEouF9ApZSVCMDYFZUTz
 dO1qze3s0E3ODTOjxFCA1lC1mXIO5t/vVOKBh0EqAc887TsIrPg6bKJ2KEeIOxbp6zGDlg
 4/MA8BTrqBkDyGLp1tIQuk00ScrhmhU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-q2FAofPFMOeHnhFbBY8pIA-1; Sun, 10 Sep 2023 19:40:33 -0400
X-MC-Unique: q2FAofPFMOeHnhFbBY8pIA-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-68fcbbdf9c3so107841b3a.1
 for <qemu-arm@nongnu.org>; Sun, 10 Sep 2023 16:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694389232; x=1694994032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7gFrfst67vcV3eEFf0unDwCn+89yqJz8XENfDXeUu5o=;
 b=Abb3+U6whFfbZKNiKjWMF1miZH0Hs6Q6V8+mdS8QZGKFuYn0A2bqaIdcTKpZBD3IjM
 rHcMYORmGKU+RIEtBHzZAuGVz3FPnJJHe5cck+V8qyc91XVY/Ld6+1RqokXrNyooOUWT
 IMZMMOt1X9qzIlqelXr0+IJqTBVdTRGHmJAlBunAn9DBXal/cyszIXY5f+tBXJtwuVN5
 TENkGYVsOJXQ0vAbEiR1hEsE5JLiNVsHoJPQabUCZqRF+WSEACPPXmYwkFxw+i87/0R3
 IN4escEAScAt+FUb7SZAQbweS7CVVOAiLsjQ9nTo8PdqNpsAJz82f+9ZbjMtP3mycgw4
 mKHg==
X-Gm-Message-State: AOJu0YxmlYW17I9XQ5CMs3D8DYmax6H6lLU+aoKR29+EUa8YNxcujdEm
 DBFqPFtOHSkKQd1bXVheZxzcVYw3cAD88S8ihKX19ioksPsW5Wy8+DXBhAbA2jRXwbIigpAdUp8
 zrrig40v8QJEB
X-Received: by 2002:a05:6a00:1389:b0:68b:daf2:b2d2 with SMTP id
 t9-20020a056a00138900b0068bdaf2b2d2mr11631015pfg.1.1694389232078; 
 Sun, 10 Sep 2023 16:40:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:1389:b0:68b:daf2:b2d2 with SMTP id
 t9-20020a056a00138900b0068bdaf2b2d2mr11630977pfg.1.1694389231682; 
 Sun, 10 Sep 2023 16:40:31 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 ei10-20020a056a0080ca00b006871fdde2c7sm961856pfb.110.2023.09.10.16.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Sep 2023 16:40:31 -0700 (PDT)
Message-ID: <78b44397-dcc4-c795-a5f2-c5fd7003e267@redhat.com>
Date: Mon, 11 Sep 2023 09:40:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/4] hw/cpu: Call object_class_dynamic_cast() once in
 cpu_class_by_name()
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
 <20230908112235.75914-5-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230908112235.75914-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-TUID: 8D+UMG4rBWKC


On 9/8/23 21:22, Philippe Mathieu-Daudé wrote:
> Leverage the public CPUClass::cpu_resolving_type field and
> call object_class_dynamic_cast() once in cpu_class_by_name().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/cpu-common.c   | 3 ++-
>   target/alpha/cpu.c     | 3 +--
>   target/arm/cpu.c       | 4 +---
>   target/avr/cpu.c       | 4 +---
>   target/cris/cpu.c      | 4 +---
>   target/hexagon/cpu.c   | 4 +---
>   target/loongarch/cpu.c | 5 +----
>   target/m68k/cpu.c      | 4 +---
>   target/openrisc/cpu.c  | 4 +---
>   target/riscv/cpu.c     | 4 +---
>   target/rx/cpu.c        | 2 +-
>   target/tricore/cpu.c   | 4 +---
>   target/xtensa/cpu.c    | 4 +---
>   13 files changed, 14 insertions(+), 35 deletions(-)
> 
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index 2d24261a6a..f4a2ccebea 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -157,7 +157,8 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
>       cc = CPU_CLASS(oc);
>       assert(cc->cpu_resolving_type && cc->class_by_name);
>       oc = cc->class_by_name(cpu_model);
> -    if (oc == NULL || object_class_is_abstract(oc)) {
> +    if (oc == NULL || object_class_is_abstract(oc)
> +                   || !object_class_dynamic_cast(oc, cc->cpu_resolving_type)) {
>           return NULL;
>       }
>       return oc;

Alignment.

     if (!oc || object_class_is_abstract(oc) ||
         !object_class_dynamic_cast(oc, cc->cpu_resolving_type)) {

> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 0ddea8004c..b184fcc123 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -126,8 +126,7 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>       int i;
>   
>       oc = object_class_by_name(cpu_model);
> -    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_ALPHA_CPU) != NULL &&
> -        !object_class_is_abstract(oc)) {
> +    if (oc != NULL && !object_class_is_abstract(oc)) {
>           return oc;
>       }
>   

No, the check "!object_class_is_abstract(oc)" for this level can't be dropped.
The same check for the last level can be dropped because it's going to be
covered by hw/core/cpu-common.c::cpu_class_by_name().

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 9e51bde170..d29040cd8c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2300,9 +2300,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
>       oc = object_class_by_name(typename);
>       g_strfreev(cpuname);
>       g_free(typename);
> -    if (!oc || !object_class_dynamic_cast(oc, TYPE_ARM_CPU)) {
> -        return NULL;
> -    }
> +
>       return oc;
>   }
>   
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index f6004169ac..53735ff1dd 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -159,9 +159,7 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
>       ObjectClass *oc;
>   
>       oc = object_class_by_name(cpu_model);
> -    if (object_class_dynamic_cast(oc, TYPE_AVR_CPU) == NULL) {
> -        oc = NULL;
> -    }
> +
>       return oc;
>   }
>   
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index adde4f599d..b307d0b9db 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -95,9 +95,7 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
>       typename = g_strdup_printf(CRIS_CPU_TYPE_NAME("%s"), cpu_model);
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -    if (oc != NULL && !object_class_dynamic_cast(oc, TYPE_CRIS_CPU)) {
> -        oc = NULL;
> -    }
> +
>       return oc;
>   }
>   
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index 2d4fed838d..4b8d63c4a7 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -63,9 +63,7 @@ static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
>       oc = object_class_by_name(typename);
>       g_strfreev(cpuname);
>       g_free(typename);
> -    if (!oc || !object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU)) {
> -        return NULL;
> -    }
> +
>       return oc;
>   }
>   
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 189dfd32d1..1eb2c579eb 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -646,10 +646,7 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
>           }
>       }
>   
> -    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)) {
> -        return oc;
> -    }
> -    return NULL;
> +    return oc;
>   }
>   
>   void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index bd7bb103d7..e8b86c80f1 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -111,9 +111,7 @@ static ObjectClass *m68k_cpu_class_by_name(const char *cpu_model)
>       typename = g_strdup_printf(M68K_CPU_TYPE_NAME("%s"), cpu_model);
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_M68K_CPU) == NULL) {
> -        return NULL;
> -    }
> +
>       return oc;
>   }
>   
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 5e1e0576e0..7aac9105bd 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -168,9 +168,7 @@ static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
>       typename = g_strdup_printf(OPENRISC_CPU_TYPE_NAME("%s"), cpu_model);
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -    if (oc != NULL && !object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU)) {
> -        return NULL;
> -    }
> +
>       return oc;
>   }
>   
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e8f04ef82b..0170e288e7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -619,9 +619,7 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>       oc = object_class_by_name(typename);
>       g_strfreev(cpuname);
>       g_free(typename);
> -    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU)) {
> -        return NULL;
> -    }
> +
>       return oc;
>   }
>   
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 2a6df418a8..879d4fcdef 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -111,7 +111,7 @@ static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
>       char *typename;
>   
>       oc = object_class_by_name(cpu_model);
> -    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_RX_CPU) != NULL) {
> +    if (oc != NULL) {
>           return oc;
>       }
>       typename = g_strdup_printf(RX_CPU_TYPE_NAME("%s"), cpu_model);

Same as above. The check (object_class_dynamic_cast()) can't be dropped in
this level. Besides, the check object_class_is_abstract() is missed for this
level.

> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index ffe5158786..f65b8761b0 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -140,9 +140,7 @@ static ObjectClass *tricore_cpu_class_by_name(const char *cpu_model)
>       typename = g_strdup_printf(TRICORE_CPU_TYPE_NAME("%s"), cpu_model);
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -    if (!oc || !object_class_dynamic_cast(oc, TYPE_TRICORE_CPU)) {
> -        return NULL;
> -    }
> +
>       return oc;
>   }
>   
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index 13bed05d0c..6d96e5ab27 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -141,9 +141,7 @@ static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
>       typename = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), cpu_model);
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -    if (oc == NULL || !object_class_dynamic_cast(oc, TYPE_XTENSA_CPU)) {
> -        return NULL;
> -    }
> +
>       return oc;
>   }
>   

Thanks,
Gavin

