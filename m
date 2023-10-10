Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp64321ejr;
        Tue, 10 Oct 2023 04:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeEMdvJSIHNlfOlZUJUZ5QFFno2S6xr+NMjMmdUcB8vnjLXvaytWu4mQgQnOxrt8HDd46B
X-Received: by 2002:adf:da50:0:b0:31f:afeb:4e7d with SMTP id r16-20020adfda50000000b0031fafeb4e7dmr12843196wrl.18.1696937912389;
        Tue, 10 Oct 2023 04:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696937912; cv=none;
        d=google.com; s=arc-20160816;
        b=E2y8SSwGJxFu51VPOhTJmSCFkb2UaJwLchGS+Nyyx6hJBk4gT/8dLiuPFETI38Xrs4
         TUgUvyEVa6J15iREsxPAzWmElaPr15kOIk2/xniHzRCgCcTeI7XwFUgafuxx2pQmVeS4
         teEyAmid8CI7eWYrSeAavu0KEyjyy/w2LxQkkRXgr5gVFBdZgOXopg4+YIcAdXnoIev/
         7girbPBVpFQPVuMWcHEKosDaFe9ZhHeh+FQG8Cmx+79wpX+Flyy2R1MVqPW/VEmjx0CE
         dBUfkkUuVRT7OFfknyEyvRw7NjcFtW/O1lH2iRzKjI/nYT8kgQDs2S7EiTZya1ItIQZn
         NMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=iG+kNFY8svaWyTZqpCDSZb7BqfwhlNqyMflj61Rir60=;
        fh=RrTLZV0A5IZHRs0gL1etM0WUwmKqocsoR+7SZbDKYTk=;
        b=vtht4DSd55MnbM9z2vBB6G8LINTyzxaze5AodMDlLWQiVXB0aa+WZ94uRB+nk+D6hS
         82WoeANABYwkKb4nEDLXkkwmC/E71So/5LPpfVI3QJRhQLYIF743MsEXgckxIeYFDCjJ
         4rjYq4V+c9irCLdmRoBFbF8L0FS/2210OVHiDJP8JadhPrqhUJYEDATLHmeK1LM93P06
         vDcTZyT46nY/MMOlmzAaXy5rWrGkrRQcXN+QqyhpWlD/iG8gQzoCkxI/c3CGhUY+BtA9
         996hBgp/1eRiVqQyUJCsDLomA7K0lh3c3fMETDlwuw7kb9alWD5eQxtTASaIPXduKWFW
         ejqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=alibaba.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a5d4f89000000b0032172b9eec4si4526225wru.870.2023.10.10.04.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 04:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=alibaba.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qqB41-00086r-Dc; Tue, 10 Oct 2023 07:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqB3m-0007oU-8I; Tue, 10 Oct 2023 07:38:00 -0400
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqB3j-00048w-57; Tue, 10 Oct 2023 07:37:57 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R561e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=43; SR=0;
 TI=SMTPD_---0Vtsm3Mn_1696937857; 
Received: from 30.221.98.57(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vtsm3Mn_1696937857) by smtp.aliyun-inc.com;
 Tue, 10 Oct 2023 19:37:39 +0800
Message-ID: <22ebaf0b-4272-481a-bfaf-5bd2d5f3fd56@linux.alibaba.com>
Date: Tue, 10 Oct 2023 19:36:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/18] target/riscv: Remove CPU_RESOLVING_TYPE from
 'cpu-qom.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Marek Vasut
 <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
References: <20231010092901.99189-1-philmd@linaro.org>
 <20231010092901.99189-4-philmd@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231010092901.99189-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.112;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-112.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: VABHIwW9X5YI


On 2023/10/10 17:28, Philippe Mathieu-Daudé wrote:
> CPU_RESOLVING_TYPE is a per-target definition, and is
> irrelevant for other targets. Move it to "cpu.h".
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/cpu-qom.h | 1 -
>   target/riscv/cpu.h     | 2 ++
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 04af50983e..8cb67b84a4 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -27,7 +27,6 @@
>   
>   #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
>   #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
> -#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
>   
>   #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>   #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ef9cf21c0c..374b813f20 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -31,6 +31,8 @@
>   #include "qapi/qapi-types-common.h"
>   #include "cpu-qom.h"
>   
> +#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> +
>   #define TCG_GUEST_DEFAULT_MO 0
>   
>   /*
