Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp153304ejb;
        Fri, 17 Feb 2023 12:49:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+mbwJ4jYzQRbBx72en21CrC/+9hDaXIzGSS1P2nptSOZ8AqYYUSspzHl6TOoPTEZdPGJQR
X-Received: by 2002:a05:6214:1943:b0:56e:b1e0:3ff2 with SMTP id q3-20020a056214194300b0056eb1e03ff2mr4708680qvk.9.1676666987115;
        Fri, 17 Feb 2023 12:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676666987; cv=none;
        d=google.com; s=arc-20160816;
        b=gCn84dTvXop6ExtTKP9sciI3Q3H88PUYNuRa8l7Q43slCfPObnv5MqEC1aBqDOobhW
         etK2ug0lp920uGFJAbPoIkym68r3CO4D7Jy0SfoEaSDbfyrHqRB0DCI0biiT9snvsRoR
         CcCKJpsE581KGU9M/1cSlsq/fZeZ/jt4f30bAw9xqnqncked7rCXGXCggwyySxRKTyBS
         OUI1myqDPLsPQJGZx4cV6qFcVzedE06Nsh+PdykhZVBX8oAbNTkgRMgVBZPA1XgWydLB
         OUPOsAohXutMiYnesTV0vuFRMvS4s78IzjZ6BYXZfQt5PBgbmLjJSZrp4VVElG7dScNV
         rOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=R/seUeA0dC31v1aAbgYurYzTzGK4jHJvZ1cmxlPwxwU=;
        b=fySWY/fAayLj15zlu/+Ngq990Qyp1DzKsmF8f6kpqNEnx8xsO4ZhVJbzug9zyv5Ozc
         E/o6ZejfEpu01CSX3HWlaScbmy//In2CL/3mEmXl7hquqK3cLvIt58L6xQiyUuu8xtC7
         viyj4FH3hQrs0bVVhOcCuenrKRAd4NP9xxM+NleTDISbI/7keMFPQ4Gk7nyrE/kwirsc
         dGd6slagcigLIYg/IcYDcTiqWncx3+snuH6AY3SrlNLPUjrhNvYuPeL+wLrm4L1XorrC
         GiMXenc4Qtv+rZpQH9sOKCy73+pxrdVhWAC450zeOw77gGfZ3QM7l73WUGwkeATd7zJ3
         V9pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HO6N8jbJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a0ce40f000000b0056eb1aa8734si3803210qvl.405.2023.02.17.12.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 12:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HO6N8jbJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pT7fF-0004Rh-Bb; Fri, 17 Feb 2023 15:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT7fB-0004QH-6U
 for qemu-arm@nongnu.org; Fri, 17 Feb 2023 15:49:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT7f8-0004MV-3N
 for qemu-arm@nongnu.org; Fri, 17 Feb 2023 15:48:59 -0500
Received: by mail-wm1-x32d.google.com with SMTP id p22so1842956wms.0
 for <qemu-arm@nongnu.org>; Fri, 17 Feb 2023 12:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R/seUeA0dC31v1aAbgYurYzTzGK4jHJvZ1cmxlPwxwU=;
 b=HO6N8jbJG4s2X9PZ7oh5cSaEQnx2MIybfM8C/w3h5onNkogKPkzDfGSeliyxcdgyzh
 bdxDEZWmas5ulI3Uds4t/vBYAq7YdSgfewRIWPbcBKHRoWxv5tlvtyLFdpEebSStNSEP
 Op1b8RMDJ8pXG2NvAyKToRixaG6ieLKB1QBQsMOqyXzHi9xeCn+vi5JZdPDRiReY4dYl
 K8LkOJmaUdRrO6rs0l4XJiYTgKxd1FC6FecjoiH8qtr3plJ6+6H4WzPZR9if5gJpCqsq
 rpBGiWTTVPUahW+ozn9jx/zwLzw1rjgQJcdYjfaCu50ipGo2CHDWuzkCzs0ddun0+qwS
 7EOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R/seUeA0dC31v1aAbgYurYzTzGK4jHJvZ1cmxlPwxwU=;
 b=Y6TZ/uMpdthDBAcc5QuiRaLQrFFIvItUdkq/z4xxghPvs/FrKGreGPSBdv+iblCL7i
 3hRwbFSQRv3ms87fc4/shST97dJfFn80Z1jgAarzUcjjWPrm6BGm0O51gS9U5D7nxFsX
 AUNJWsvZtkE8eLX98BC2V6apRYF5tHUFGnSeyf3ZtmSm15ofqna5nSpnxbyAaOERNkcL
 HVGWlRZTWuZrmFA9wANMp75zSMJWV7jtvcv0cp4kuYJioZaEMT32JQNFxMbjPJdXgEva
 xxtB8K7jS7wzTP5r9qz5prAI624xyWFZatW/KGLUPbdl3DVTFc5FYrt6gm6k+PTsJ2IZ
 zxcw==
X-Gm-Message-State: AO0yUKUXbEZV0uCa3/KN0m8z8nExasH5jmMWCe6NNpnWYW7p2LfPRQ19
 9sHm1WxsmazRejW3QQmDl4EiWg==
X-Received: by 2002:a05:600c:2ad6:b0:3dd:dd46:1274 with SMTP id
 t22-20020a05600c2ad600b003dddd461274mr1433340wme.4.1676666936089; 
 Fri, 17 Feb 2023 12:48:56 -0800 (PST)
Received: from [192.168.72.175] (2.red-88-29-172.dynamicip.rima-tde.net.
 [88.29.172.2]) by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003e01493b136sm929390wml.43.2023.02.17.12.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 12:48:55 -0800 (PST)
Message-ID: <a3206e43-5c72-2af6-f14d-1c43752d528a@linaro.org>
Date: Fri, 17 Feb 2023 21:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] hw/timer: Reduce 'hw/ptimer.h' inclusion
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antony Pavlov <antonynpavlov@gmail.com>
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217141832.24777-3-philmd@linaro.org>
 <8daaae78-c773-af8c-de6d-c3b0a45d4253@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8daaae78-c773-af8c-de6d-c3b0a45d4253@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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
X-TUID: bg4ss8whO7Xi

On 17/2/23 19:52, Thomas Huth wrote:
> On 17/02/2023 15.18, Philippe Mathieu-Daudé wrote:
>> "hw/ptimer.h" API is mostly used by timer / watchdog device
>> models. Since the SoC / machines only access the ptimer via
>> reference, they don't need its definition: the declartion is
>> enough.
>>
>> On order to reduce the inclusion on the source files,
>> forward-declare 'ptimer_state' in "qemu/typedefs.h".
>> Use the typedef in few place instead of the structure.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> "30 files changed"... but since this is trivial, there is
>> no point in splitting per subsystem IMO.
>> ---
> ...
>> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
>> index df4b55ac65..effcba4bca 100644
>> --- a/include/qemu/typedefs.h
>> +++ b/include/qemu/typedefs.h
>> @@ -104,6 +104,7 @@ typedef struct PICCommonState PICCommonState;
>>   typedef struct PostcopyDiscardState PostcopyDiscardState;
>>   typedef struct Property Property;
>>   typedef struct PropertyInfo PropertyInfo;
>> +typedef struct ptimer_state ptimer_state;
> 
> Would it make sense to properly CamelCase the type while you're at it 
> anyway?

PeriodicTimer, PTimerState, PTimer?

This API is documented as 'ptimer API' although, and renaming all the
API methods doesn't seem to bring much, so maybe stick to PTimer.

More generically for QOM objects, we can agree for no 'State' trailing
for instance state, and 'Class' trailing for class one, similar to
Object / ObjectClass. I.e:

   PeriodicTimer // instance
   PeriodicTimerClass // class

Maybe 'Device' is too generic? Here the API uses 'qdev_' prefix, so
QDev / QDevClass could work...
