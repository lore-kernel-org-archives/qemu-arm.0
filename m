Received: by 2002:a05:7022:fa01:b0:6e:5a56:ff6c with SMTP id sy1csp24771dlb;
        Wed, 18 Oct 2023 11:32:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3VM6tORdob8J3x026dZcebQd5w5Z6ibSJh93PiGsOQno6tndxnvOU85wMiRgdrEFTBjh/
X-Received: by 2002:a05:620a:40d6:b0:777:72a1:efae with SMTP id g22-20020a05620a40d600b0077772a1efaemr6813812qko.67.1697653973513;
        Wed, 18 Oct 2023 11:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697653973; cv=none;
        d=google.com; s=arc-20160816;
        b=IoKCdL/RrqfnTm7KejvXBECw+X9JXUOrMPKbjqoSqoQZlH4JwPXwvhxLPGksUKq3DO
         1cvtwDSRJV8aXA9hx2nB1NfHDfeT477QRtnuICTYzCFVFA3Ulmw/21/jYrgKIMO8PJ3c
         fvCk1NdfIXwxuhBEWVPqq5XLObW7srxNnjqHokesneqe+feFmXXpc4hcPvLyZJTMOu9x
         SLoLOpvKYCotgeCoMUDaFKM/bdrbdaNnObOsLT6cTX5kVlNnRK5PKE8qMt0tQXFzllQ7
         SJnCEldkoejuqF2hWID16dTrjhSVTx/kvll+8tCYLZ1wUn4IyVEuMCJJjhP3+cLwxPqC
         N0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mbtYO3FVscziXI6WqkBGQAZiD+XUBy2z2f1p9zcPQPw=;
        fh=69dT1U6nWC4tBntircimUxcuNuERa9H08GutzdeIku4=;
        b=ln6+V+oaR+OKVdJrlVlKUYFThvC13m29lHdNrkzkKqLmyKOdOZAQSsbw0vs8AbCv1L
         qOpUuVdMT+tCL5tqh7aAHmFgPWcavJ6mQ/KFwjPxOEhW0sJVYb/2roJo4z6FbO2YGXlA
         7rCIKIy6QZYV0ywJ6ewe7ggSz/IAIHGAIDkWrdZWkMuiC1bIu+OMKaC2SdwXLHs+Fbs3
         2MHdzdVbeKS5nnPlhh2gNurSGoQC+y2d3KpxZVQrEGO/rc4J14YKbWbp8SnSpAKaE9CH
         yQwnhytaR+LT6cou/WpYjfP5JD9nXi2RZugE7ERV+z2XSOpX+L/XZkWDokHeghpCV+eg
         G0Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/w2x0r0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05620a441300b007742059b2c9si351988qkp.482.2023.10.18.11.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/w2x0r0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtBLQ-0002mA-L6; Wed, 18 Oct 2023 14:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtBLO-0002lT-K9
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:32:34 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtBLM-0003uH-97
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:32:34 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso1156201166b.2
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 11:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697653949; x=1698258749; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mbtYO3FVscziXI6WqkBGQAZiD+XUBy2z2f1p9zcPQPw=;
 b=T/w2x0r0qVrjxKF35MGg6aGDE7h/TZH5+6PyUlp/zuTL2nVZp/o4RJ4VRI574ARbUa
 3MEwOGR6C1ACBlISGy5TTSfJqEZabLF8HAPwpVbT1pyzJdKJFN8bcwSvGyEdlli8WmEg
 fnHItTC0OyylbAPoQHaWPMOc718Hd7iadex6aLMDb6P2UYxc9hUItDa6YHLbPEruh+n4
 gJfxvaYvWBmCDxm2oOQVxzucqkfc/yc/tMcFWMJqMQ+EAQIxinlzCyDxGlIGwjhc7m2T
 6tstre63mcXm/VzP+3BhFE++CTUnjVAkL+9n2SK0XzdIqo7hlWxe2/fU4cLJoNVK7PkN
 v6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697653949; x=1698258749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mbtYO3FVscziXI6WqkBGQAZiD+XUBy2z2f1p9zcPQPw=;
 b=C6SLypSh0q8VKF9i6gmtdUZyvRTDqdbtiHFQOjW2lgDe6uN08KbQnNJxy4p5mocQ5N
 mhClLrtcfybGVsqYL4nA51Ks2Ke3jEjoccUCB4XKq2NAlK4zmV9aQNcfkCds5m/ukHNw
 1shc487Xrp2oa6NikojKXX+99IY9CdHIbTKP8KsbGhVOP3BS/K4ztDvsguFJ376iSI3H
 kqeFWRKhtINgP/tsVsJRmu1SFIHh6rAV9nKrXx2I8XPB/AAPYM6KJt98P/brq104xx/s
 V+F0YM9fQMKMZEiD2J+naz2/1wz1gsMcO1N0NWKOROpatVP2UhYtnoD8TKbW9PdDlKXN
 MvSQ==
X-Gm-Message-State: AOJu0YwWo6x2h09DJlBqMDWDBbG35uoskM/GNNnLFFf6XOi/qnzAtJ32
 eU6Oq1cMbzIP1ySAYG5lwy9vRg==
X-Received: by 2002:a17:907:3687:b0:99d:e617:abeb with SMTP id
 bi7-20020a170907368700b0099de617abebmr82140ejc.23.1697653949135; 
 Wed, 18 Oct 2023 11:32:29 -0700 (PDT)
Received: from [192.168.69.115]
 (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr. [176.171.218.149])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a1709060d9400b0099bd046170fsm2144780eji.104.2023.10.18.11.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 11:32:28 -0700 (PDT)
Message-ID: <66f04f0f-604a-e609-2d21-39b881d4ab64@linaro.org>
Date: Wed, 18 Oct 2023 20:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 00/12] hw: Strengthen SysBus & QBus API
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
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
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: W6n2mqQNgZ6I

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


>   24/433 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test              
> ERROR           5.94s   killed by signal 6 SIGABRT
>  >>> QTEST_QEMU_BINARY=./qemu-system-aarch64 
> G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh 
> QTEST_QEMU_IMG=./qemu-img 
> PYTHON=/home/thuth/tmp/qemu-build/pyvenv/bin/python3 
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
> MALLOC_PERTURB_=105 /home/thuth/tmp/qemu-build/tests/qtest/qom-test 
> --tap -k
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
> ✀ ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> qemu-system-aarch64: sysbus_init_mmio(type:pxa2xx_pic) but object is 
> realized
> Broken pipe
> ../../devel/qemu/tests/qtest/libqtest.c:203: kill_qemu() detected QEMU 
> death from signal 6 (Aborted) (core dumped)

I neglected to mention that in the cover letter. This is mentioned here
https://lore.kernel.org/qemu-devel/1b159c7a-f52c-3705-8757-c2b80a04965b@linaro.org/

I ping'd Peter on IRC because I'm not sure how to fix this PXA2xx code.
Apparently it cames from commit 3f6c925f37 ("Use i2c_slave_init() to
allocate the PXA (dummy) I2C slave"), which I presume was how to model
slave<->master transactions *before* I2C bus modelling.

Regards,

Phil.
