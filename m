Received: by 2002:a05:7022:fa01:b0:6e:5a56:ff6c with SMTP id sy1csp21057dlb;
        Wed, 18 Oct 2023 11:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCkXuDhiQYiFhFJ3Y1oZBZyFbqNUlsF9W/ZO8MBNbkGGiINd7IO9KbHVtNEPejCKxuNXDd
X-Received: by 2002:a05:620a:8a15:b0:774:15ea:55f with SMTP id qt21-20020a05620a8a1500b0077415ea055fmr5056355qkn.77.1697653575030;
        Wed, 18 Oct 2023 11:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697653575; cv=none;
        d=google.com; s=arc-20160816;
        b=DAkVN2eg7aecIkdvEmOiljzuvPmzPBB3e+8APpa5ez/Henn7f6BKCL0dsAYPngTdYu
         0rg/oESMq7j2AIIIl1Kb2bmbSVYzt00Tjz4rO5zguvBhwJH1tTXp3LOBCXZAk75ZGyzR
         4FUel+The9cZ1W9DxtN16qf+WFGV+oFZNrJ2lAaqNttUT9XlqI9i/625SYGzmH09QqJJ
         hRb1iZpz15lWZMkrYuGmxvYCzpp1uXN0oDyqQ5rrUM5K+l8oBZ9WdP76rtDbB1QmDKtj
         XgSxa1NedfHpbEStB99cNe1VdvdeKD83USXpDfYE1maprQUFWSCSwusqjs8O/XXgCVei
         G+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=luUIFfDg0a88T8tG/op5ev0d7DWUNCX4ymwUFyZS6tg=;
        fh=eFDoKNrJE3v3BqwczSGYBHnIg7T/J/oamfU2KtoPZMA=;
        b=jTi6SNsQyesy3xCAkUa8HcxYSpPK2siwZS+fapAD5VkVftGRSnDh38qF3rRW5ObJ22
         3x5FOFtUiouXXaKHk1R9WbG8c6aWFTIMzvJWM+jtBdxx4oCHyV4MD40V0gK1G8sVGn72
         LQAFgJLMjbd01RspC5qJCt3IYuhRoU7jKAlosDlvgI1ZVjaSnbk6GQa40yCLff88VMio
         e9WHDEwuzRnz3DVacuKB2srVELnNUiLoyufEZyLjIqpJjr7nKJq5zu7JMpxFZdasZW9Z
         qjsc+A6/pStNw1Yuk/eoaR8Tym/NNFGTKlzCF/TVbFxxN2FLDUFn2KgsEfirAyiaBfpD
         yzlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jlqVqPYU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16-20020a05620a06d000b0076ef9e388a8si327794qky.141.2023.10.18.11.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jlqVqPYU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtBFC-0005fR-UZ; Wed, 18 Oct 2023 14:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtBF0-0005SD-MS
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:26:00 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtBEx-00039a-Ox
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:25:58 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so6483212e87.2
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 11:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697653554; x=1698258354; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=luUIFfDg0a88T8tG/op5ev0d7DWUNCX4ymwUFyZS6tg=;
 b=jlqVqPYU/od0ttExRY3sbeI5KhZJJ6jyjqgVquk8JrQ+LoBwu6CY6aWoE5TU1t9pv3
 D7QPY1E65f4qIvBEzwtdKU/80VHSK0ol6j7Mr+OaLqM8oRhz1aBifK7a4o65KIMQyDNQ
 Vh5N1T2Bh76TZyAx73/6ZgZvxykPhFg0uzl0YVqBa/B8bSIRlXMur4E33ggsnsCZ/6UF
 Ix4NCYp7d6kuAq3mV+/p5Wqb1R0NOGM2D1wHQU0NHQ2FvB66DOh1FKnXUZrm74bZkbKT
 ZnT3Mk4QfqLzUN1mwTqJCdfbI2ftLvithw2P82wcXvz6mKpjIdcXvVHop+q6cwdR/DKX
 qH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697653554; x=1698258354;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=luUIFfDg0a88T8tG/op5ev0d7DWUNCX4ymwUFyZS6tg=;
 b=nmBMMFwJkjG70WeT+UQg8+fCSt/VNl0gxcV8Z5XSefp80PGJpC4RZaWbhgRvdWQMOi
 M6tiCVTclUrmcNxySKkx2G9oesqpEs2qZ8khdyu/ADdXQHnsWpqC8AfYcVjD62dzbojv
 Dx7kZZs7oMFkLRCmLRwqAzl+8qW0yuQoD6zEB6es2R/4vHtAJcVBywJRV6f+1N2HmCvQ
 /t/n9+sRQmmp54QmUYpc/H1GFH0IJAqk5i84nxGOLzSaZ2d4P3+i1O3/wFIR9Ce6T8Mt
 YDlVKkqUUhJjoVQRoNmwGFXzcilDTPByIYbTq+PUHG/aCOaXQ/q/somd3UrNh5nJ5VFl
 46/g==
X-Gm-Message-State: AOJu0YxEajAh3IlG2CCKu60559A0+v/zG3Oqa7qtKUNQKoZ4+iv4/ffC
 WrHE69p+SchFs47fHQ5/R/w6zg==
X-Received: by 2002:ac2:4da3:0:b0:503:3816:c42c with SMTP id
 h3-20020ac24da3000000b005033816c42cmr4310458lfe.41.1697653553824; 
 Wed, 18 Oct 2023 11:25:53 -0700 (PDT)
Received: from [192.168.69.115]
 (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr. [176.171.218.149])
 by smtp.gmail.com with ESMTPSA id
 gh6-20020a170906e08600b00977cad140a8sm2148969ejb.218.2023.10.18.11.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 11:25:53 -0700 (PDT)
Message-ID: <70a34b74-aa36-0805-1400-f7f8a41640d9@linaro.org>
Date: Wed, 18 Oct 2023 20:25:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 00/12] hw: Strengthen SysBus & QBus API
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231018141151.87466-1-philmd@linaro.org>
 <393f1aa0-afb5-4269-8499-80afd5b98e48@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <393f1aa0-afb5-4269-8499-80afd5b98e48@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: nd+/r8w0E0NL

On 18/10/23 18:24, Thomas Huth wrote:
> On 18/10/2023 16.11, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> This series ensure:
>>
>> - qbus_new() and sysbus_init_mmio() are called *before*
>>    a device is realized,
>> - sysbus_mmio_map() is called *after* it is realized.
>>
>> First we fix some abuse, then we enforce in qdev/sysbus
>> core code.
> 
> I like the idea, and just had a try with "make check-qtest" with the 
> patches here, but seems like there are more spots that need attention:
> 
>   10/433 qemu:qtest+qtest-ppc64 / qtest-ppc64/qom-test              
> ERROR           0.72s   killed by signal 6 SIGABRT
>  >>> MALLOC_PERTURB_=217 QTEST_QEMU_IMG=./qemu-img 
> G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh 
> PYTHON=/home/thuth/tmp/qemu-build/pyvenv/bin/python3 
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
> QTEST_QEMU_BINARY=./qemu-system-ppc64 
> /home/thuth/tmp/qemu-build/tests/qtest/qom-test --tap -k
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
> ✀ ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> qemu-system-ppc64: sysbus_mmio_map(type:power9_v2.2-pnv-chip, index:0, 
> addr:0x603fc00000000, prio:0) but object is not realized
> Broken pipe
> ../../devel/qemu/tests/qtest/libqtest.c:203: kill_qemu() detected QEMU 
> death from signal 6 (Aborted) (core dumped)
> 
> (test program exited with status code -6)
> 
> TAP parsing error: Too few tests run (expected 17, got 0)

Sorry, I forgot to add:

Based-on: <20231018133059.85765-1-philmd@linaro.org>
           "hw/ppc: SysBus simplifications"
https://lore.kernel.org/qemu-devel/20231018133059.85765-1-philmd@linaro.org/

