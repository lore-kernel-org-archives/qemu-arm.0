Received: by 10.25.134.130 with SMTP id i124csp1974246lfd;
        Mon, 11 Jan 2016 05:47:08 -0800 (PST)
X-Received: by 10.194.6.37 with SMTP id x5mr127711055wjx.178.1452520028934;
        Mon, 11 Jan 2016 05:47:08 -0800 (PST)
Return-Path: <paolo.bonzini@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com. [2a00:1450:400c:c09::242])
        by mx.google.com with ESMTPS id v9si198836172wje.152.2016.01.11.05.47.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 05:47:08 -0800 (PST)
Received-SPF: pass (google.com: domain of paolo.bonzini@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) client-ip=2a00:1450:400c:c09::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of paolo.bonzini@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) smtp.mailfrom=paolo.bonzini@gmail.com;
       dkim=pass header.i=@gmail.com
Received: by mail-wm0-x242.google.com with SMTP id b14so26405139wmb.1;
        Mon, 11 Jan 2016 05:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=VFyI1QzZFE00RB4KhyEpQEqcajV8kvNvEmfMVekPspE=;
        b=k64Zrt2Mtsvcsc9jR2UbuDCso0KpbmRSXufJ/k/Duw7Y7fXLEwt6hgqMQSUP7g/37Y
         o0DdJq5xnd4C8Y62/C6NYvmZIGbWILIeqHKD/UwQM5UHti+is2Nio12LGIFJ7xvW6+yK
         s2TRlBT3M0OrpiIT3QJoRagJaleOmKbxsAWI4Fi8931dZZox0m4kkPc30csMru48j5j6
         YeaCtOqMdEnmMXZoZQzW2M0RvxD8EzfZemvBbikBpQqGZzbDP1IWJO+JoU15/5wGdHu5
         u+9Y9G7bLhYQu6Ajh3rQxxJEvUHy3yrw24lAcFg+O56Lf8rzxIgboTKHN1j7SrLWOVvR
         w9fQ==
X-Received: by 10.194.192.71 with SMTP id he7mr21176608wjc.82.1452520028182;
        Mon, 11 Jan 2016 05:47:08 -0800 (PST)
Return-Path: <paolo.bonzini@gmail.com>
Received: from [192.168.10.150] (94-39-195-126.adsl-ull.clienti.tiscali.it. [94.39.195.126])
        by smtp.googlemail.com with ESMTPSA id ei9sm12004769wjd.40.2016.01.11.05.47.05
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 11 Jan 2016 05:47:06 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Subject: Re: [PATCH v2 09/19] exec.c: Use cpu_get_phys_page_attrs_debug
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
 <1447682723-3977-10-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5693B259.2030106@redhat.com>
Date: Mon, 11 Jan 2016 14:47:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1447682723-3977-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: 37OW8EtDVF0q



On 16/11/2015 15:05, Peter Maydell wrote:
> -    hwaddr phys = cpu_get_phys_page_debug(cpu, pc);
> +    MemTxAttrs attrs = {};
> +    hwaddr phys = cpu_get_phys_page_attrs_debug(cpu, pc, &attrs);
> +    int asidx = cpu_asidx_from_attrs(cpu, attrs);
>      if (phys != -1) {
> -        tb_invalidate_phys_addr(cpu->as,
> +        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
>                                  phys | (pc & ~TARGET_PAGE_MASK));
>      }

The only question I have is whether it is right to have empty MemTxAttrs
here.  Is there any way to use the MemTxAttrs for the "current state" of
the CPU, whatever that is (on x86 I have added cpu_get_mem_attrs to
target-i386/cpu.h)?

Paolo
