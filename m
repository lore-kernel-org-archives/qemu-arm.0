Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp964843ejc;
        Sun, 10 Mar 2024 21:01:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWssyS4KqJbPJCOt7TxcmxuXt5nKcVds4j0ZQC8BGKhe1qyAugA8F39gxmZzQNQn9qH9qdscMLQ3P1+B0YZhsvUUUsMRBjv
X-Google-Smtp-Source: AGHT+IFyOkbWhf+7qVXjcfsEFhA8dBzLfzEGhU7AFuAnIuFU6I0GlYZ8r902ipqhPPhqeBtYVNff
X-Received: by 2002:a05:620a:2943:b0:788:70fb:9935 with SMTP id n3-20020a05620a294300b0078870fb9935mr1218223qkp.44.1710129709111;
        Sun, 10 Mar 2024 21:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710129709; cv=none;
        d=google.com; s=arc-20160816;
        b=rPxI6vFl5YdtQhtnzOayv1NvFC6R1ZahdEL5tXAZWWIg3bG3TDMLRpOUvQ5KMDEOqq
         Sf17edNcnM8gmabnW5hojwYBDYcYNC1gsmgjJOXCCRkZn0tWSNJFgJKLWJD1DxoDS9+I
         ehCqzYSsGRlk+Vvd/fIwtPGN55LKz9YTsbAfh5Q9j4oj8v55LNvFKCRWLRSHWU9h0t+n
         /7CTmjWJstknZftOkrxdS/1XgsNWAb65vomXmQk+Hhn4SaLGf0N7LcXIL3zu9I6ITfPZ
         ozCqv/3r5hcYeL12Uus0nkqevsuswsqRTPBB8AWrpLmmV2/ChDdaSF+SEs2JkrElj0ml
         mJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=/2noqgZsk5gWafiQlPekRFOdhLF+NBXF0f2gnb9Y8G4=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=hHDPEj4w5AKo/Be5Yrpa4OQaTG9Xlm0WbjdEYFw931lxV3BiiXmm7REIaPAZa1Njf4
         WGHSjGVWAIseo9Fjjmnxv+88DhOr7woQ+6RIvmFnW1fRVXTQO+LB+rMRCpPw8m2Ynjvv
         StDnqFWxAL7qIMstPBvQqN6mJYNYzJ0ePIVEwk+0pcssSdbGDQ6zlUTWkApuHsP6KJU6
         szbHxqYPGQOPHg4Dpw73uWnrwSvDIwPeoaEoDiVWJr9Uaa1ksFcTBe5mwUpth5pvhGFF
         Xrfpnn8TQo3WXaP1uvGHzdQs1E3fphMIhfqJ9s16V1G4fOmhzoijlj0mjuAPA9AVJmsW
         /pgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17-20020a05620a057100b00788322c3c1csi4410183qkp.604.2024.03.10.21.01.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2024 21:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjWr2-0003ok-8s; Mon, 11 Mar 2024 00:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rjWqk-0003nL-4l; Mon, 11 Mar 2024 00:01:21 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rjWqK-0007H9-T3; Mon, 11 Mar 2024 00:01:10 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TtNKQ4tz3z1h1sd;
 Mon, 11 Mar 2024 11:58:02 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id B8DEC1A016E;
 Mon, 11 Mar 2024 12:00:27 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:00:27 +0800
Message-ID: <c57f3338-0f38-1768-7c9f-d2b00a0cb158@huawei.com>
Date: Mon, 11 Mar 2024 12:00:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v7 00/23] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
 <fd515ea4-ca4b-4d54-9d9b-59683ccd683e@linaro.org>
In-Reply-To: <fd515ea4-ca4b-4d54-9d9b-59683ccd683e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.099,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LYVKZ2RRwLe1

Ping.

On 2024/3/6 12:22, Richard Henderson wrote:
> On 3/5/24 17:56, Jinjie Ruan via wrote:
>> This patch set implements FEAT_NMI and FEAT_GICv3_NMI for armv8. These
>> introduce support for a new category of interrupts in the architecture
>> which we can use to provide NMI like functionality.
>>
>> There are two modes for using this FEAT_NMI. When PSTATE.ALLINT or
>> PSTATE.SP & SCTLR_ELx.SCTLR_SPINTMASK is set, any entry to ELx causes all
>> interrupts including those with superpriority to be masked on entry to
>> ELn
>> until the mask is explicitly removed by software or hardware.
>> PSTATE.ALLINT
>> can be managed by software using the new register control ALLINT.ALLINT.
>> Independent controls are provided for this feature at each EL, usage
>> at EL1
>> should not disrupt EL2 or EL3.
>>
>> I have tested it with the following linux patches which try to support
>> FEAT_NMI in linux kernel:
>>
>>     https://lore.kernel.org/linux-arm-kernel/Y4sH5qX5bK9xfEBp@lpieralisi/T/#mb4ba4a2c045bf72c10c2202c1dd1b82d3240dc88
>>
>> In the test, SGI, PPI and SPI interrupts can all be set to have super
>> priority
>> to be converted to a hardware NMI interrupt. The SGI is tested with
>> kernel
>> IPI as NMI framework, softlockup, hardlockup and kgdb test cases, and
>> the PPI
>> interrupt is tested with "perf top" command with hardware NMI enabled,
>> and
>> the SPI interrupt is tested with a custom test module, in which NMI
>> interrupts
>> can be received and sent normally.
> 
> As far as I can see, this patch set is good to go.  I'm fairly confident
> of the CPU side of the equation, but the GIC could use a second set of
> eyes.
> 
> 
> r~
