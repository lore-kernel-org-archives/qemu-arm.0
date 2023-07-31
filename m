Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2002864ejb;
        Mon, 31 Jul 2023 00:46:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGGaIlFgpXIHL/QcIkspvC5VjamOVCjrxJitRuDho6kdPSe6aXM37U6wK6xakjlmgtVLFLR
X-Received: by 2002:a0c:d991:0:b0:63d:419c:5914 with SMTP id y17-20020a0cd991000000b0063d419c5914mr10850231qvj.57.1690789615783;
        Mon, 31 Jul 2023 00:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690789615; cv=none;
        d=google.com; s=arc-20160816;
        b=RXaF734pfK46tI0LUZL08Gr5SXy3Dgyf9XCZpiB8X1cj2bjLHBWa9dYwAYBtHnxSZZ
         86FvjjL9VLSix8HJr+Mi1MGOc841LcLO2CDvOjFu+od8s0e8MYWs40u/b0nTNvJsmEw5
         rumB8G4LhqmrXC78MYr97U+3eGOjEnu4Ys3IILAmI4Fejd210GvZI4tFfoVw6noeISaY
         OyWQLp1IRkIIyAj9M1ijy2YmtOM3t1RgC/kYfvvzZbkYiyxQUvhaSGQPHQ0Ybr/3p1yN
         zSd7pmlTpKXtbrdOjCewUl/e4OAUfUvjJzzS9lAOKkE3kkh0+/T+tzLWH6sNsUa+xDEf
         Kn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7U6z31L1yNwWi9trHUTUdQ1wcJjxcTZbObPL+gqrFaM=;
        fh=o+KmjbnwQstJger2O7DN/SdbInfbsakgHzcDoCjU+rI=;
        b=NZxd87kbqGwvSLGzK52XNtuvKTjWopvCYZLYCWSx0swpmOdGPO4wbPXfRO6IR9CwiL
         /qofetjZdySNolj3fiulVlD1H0HL/qdS9slk5+6sMzmdllHuDlc0IKyzODgoaqKPeETf
         MmpZxdyBjPN3zk5SJglz8dB6Db/aSAMtUsAD3o6qqonTKgBSGyFq6vpdGvJc4uPpNQl2
         amPjkT9jAdUvzF/pXwzYQz2nPUE8dnYamp9pMVwPj08Qw0bDGz5aBd3olF35eCEHTUIK
         jJMndIwDgzzFIdJrW3Uc54qCZ85SqIZ86YqQLcLYAwnJg4e21ECTbCMh/dTjt2FOjuwK
         c3PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FCGOXRRO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020a05620a409500b00767eaadf95dsi5691097qko.379.2023.07.31.00.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 00:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FCGOXRRO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQNc5-0001Gg-Qr; Mon, 31 Jul 2023 03:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qQNc4-0001FO-Js
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 03:46:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qQNc3-0003N2-4D
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 03:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690789602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7U6z31L1yNwWi9trHUTUdQ1wcJjxcTZbObPL+gqrFaM=;
 b=FCGOXRROFGoIT1JMT/ntN/JxoWtJyuq3lZKPEQyG/gv/H9cr9ORcKS6/Jmh9o27gEq+efy
 a/h8/E94LRc6hlcvVLU7ABEy+9vuxqpiUDSoNijSGzEp4ZbnX22SdUxEMU1irED7fWDNNc
 HWeSH9tEc/gm2Hab4+WQfLMr3lesnTg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-gj3ZEMyzPFiP76eUhXyB6g-1; Mon, 31 Jul 2023 03:46:40 -0400
X-MC-Unique: gj3ZEMyzPFiP76eUhXyB6g-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7683cdabcb7so518116485a.3
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 00:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690789600; x=1691394400;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7U6z31L1yNwWi9trHUTUdQ1wcJjxcTZbObPL+gqrFaM=;
 b=QOibQczWGgWQFVkTT8D7nqtwJVk6MEWDVhZsIvag0uPUkNfmd9+EhFvhJDiAYyAmXk
 XoEpdzkCTlVRUODlvVdurAqjCBkXJt7xyYvWSw4g4zyQnnsz+wG2iMJ0HloTIGawD28S
 lnXA77HEyiZ1ml/TAjTXj0NO6yWP6kdzO3SpFgCGXp/OOxMFm+EUDPgNWgdSZQD8is5S
 jS31Gr3tMLLE8AU7IeS+GVrU3rEGKiYar7nyx8OAJLhyOPDwQs/KzTXZO8OgrM55S6ga
 czDDIWLEQp1XUI/dUZ35vLTuAtisKxYxYw3KhW3cdLP2HVw0dJ+0txp6+AZo6lceKayx
 bGcw==
X-Gm-Message-State: ABy/qLb3ecvlm9sNKuhrPk84m5b5/WYwkxJ95SLOnejK1R1nGkqauhP7
 o6e8/XxLF6ciY2ERJTecEcrXjrZCmuPNUT1EurEEcRdQuWkd9iMjkGeF02QtzLxR+ajUGiRya//
 5aKklqfIXv+/u
X-Received: by 2002:a05:620a:4001:b0:768:cfe:297d with SMTP id
 h1-20020a05620a400100b007680cfe297dmr11214712qko.73.1690789600293; 
 Mon, 31 Jul 2023 00:46:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:768:cfe:297d with SMTP id
 h1-20020a05620a400100b007680cfe297dmr11214688qko.73.1690789599953; 
 Mon, 31 Jul 2023 00:46:39 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a05620a159400b00767b7375eadsm3069911qkk.39.2023.07.31.00.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 00:46:39 -0700 (PDT)
Message-ID: <c887c365-e4ab-a2e5-25b3-3685b7737f4a@redhat.com>
Date: Mon, 31 Jul 2023 09:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] pc-bios/optionrom: Add -fno-stack-protector
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Brian Cain <bcain@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20230731065904.5869-1-akihiko.odaki@daynix.com>
 <20230731065904.5869-2-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230731065904.5869-2-akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: L1c4F9mr23U7

On 31/07/2023 08.58, Akihiko Odaki wrote:
> A build of GCC 13.2 will have stack protector enabled by default if it
> was configured with --enable-default-ssp option. For such a compiler,
> it is necessary to explicitly disable stack protector when linking
> without standard libraries.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   pc-bios/optionrom/Makefile | 2 +-
>   pc-bios/s390-ccw/Makefile  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index b1fff0ba6c..f220d81f2c 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -19,7 +19,7 @@ quiet-command = $(call quiet-@,$2 $@)$1
>   override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
>   
>   override CFLAGS += -march=i486 -Wall $(EXTRA_CFLAGS) -m16
> -override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
> +override CFLAGS += -ffreestanding -fno-stack-protector -I$(TOPSRC_DIR)/include
>   
>   cc-test = $(CC) -Werror $1 -c -o /dev/null -xc /dev/null >/dev/null 2>/dev/null
>   cc-option = if $(call cc-test, $1); then \
> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
> index acfcd1e71a..446d448913 100644
> --- a/pc-bios/s390-ccw/Makefile
> +++ b/pc-bios/s390-ccw/Makefile
> @@ -38,7 +38,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
>   EXTRA_CFLAGS += -Wall
>   EXTRA_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
>   EXTRA_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
> -EXTRA_CFLAGS += -msoft-float
> +EXTRA_CFLAGS += -fno-stack-protector -msoft-float
>   EXTRA_CFLAGS += -std=gnu99
>   LDFLAGS += -Wl,-pie -nostdlib
>   

Both Makefiles seem to add -no-stack-protector in other lines already, so 
this patch does not seem to be necessary?

  Thomas

