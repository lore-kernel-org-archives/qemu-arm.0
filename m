Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1154727lfp;
        Thu, 16 Sep 2021 07:05:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfNECRNPrKRXxA29iubwKqPtC/zKXM80ctqcoPo4XNzKjGiUVDc5XzF7pYq8saZEs3jyOa
X-Received: by 2002:a05:622a:38f:: with SMTP id j15mr5242476qtx.163.1631801156969;
        Thu, 16 Sep 2021 07:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631801156; cv=none;
        d=google.com; s=arc-20160816;
        b=MWtduFuV61g/wZLE65nyNzgL0011AqTgyHAfZfMFHS08fMOJctee+pabSgCNPLkuNS
         y4mTM5pes6yHpxouI5WCJH2wt+bhzv0tdl9UvZsiJ4f6SH9J4gKZhhcg1X0gOWpVR7Mt
         h3WbgqWGqMa9iskdy7+EvZqckp7ddDIV8tY3dC7rsIZ6cXf/5qw37lTbBujDWiQYGNjD
         UM3MuvFZGW/48XuZuBzmBnw5ZGaonJmVnRsWJBqd60XlD2WzVNyLspnoQsW7ml6d5Yze
         gTWueirJnHDHQw+fthM7L2QX2E28pkrQrGgZ4emuKgsVr6vjD6RSOCb8XWs7n85ovnOC
         L1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=i6kknlXKLcrMU6F3BmDitprwnsD+Bp2iVn8L2/anpzA=;
        b=giOi+ukWVQALWYWyBXcdWdmFV/y2ZN2sIRampcqUy6jI1XRkd4NcD0nwEwuwrju9sn
         UHWMZMV+mnbMx1mWW4R5q4T4SZeoGU6dLYeSjVmA93BoxW8zCIBZe9D2XIZgZc6DD8Lq
         3xK4LqBLOWxpCN7AMBEOUAwReNQ3fnKPjbqJbwQwRsm14XX7rTUtMC1VpeDq8Qw3OpHZ
         DPQenLDiCFaPNbEyhNPq6/Dsli7G2sqZ0Keynd8SdscGAF19ePV7OezyNagtdPWTIJ8S
         VnLLzZtnRoIGesxwS3IrSHpTfXNwUZhHDlO5fpv0cmTlZ7ENliGbmYL5EFNGmxDPXaea
         qOIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si1979714qtg.64.2021.09.16.07.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 07:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQs1T-0000SE-CI
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 10:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQs0i-0000PX-Kt; Thu, 16 Sep 2021 10:05:08 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51212 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQs0Y-0000b7-K9; Thu, 16 Sep 2021 10:05:08 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id 183016080098;
 Thu, 16 Sep 2021 16:04:50 +0200 (CEST)
Subject: Re: [PATCH v11 02/10] hvf: Add execute to dirty log permission bitmap
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-3-agraf@csgraf.de>
 <CAFEAcA9e+tnF56J11AWcsyKGH+h+3VKKADOFGaM37JhYR_HqDA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <2b3f4581-56c3-db0e-f083-fd6d1b7cc2f8@csgraf.de>
Date: Thu, 16 Sep 2021 16:04:49 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9e+tnF56J11AWcsyKGH+h+3VKKADOFGaM37JhYR_HqDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C+5IrMGbhdq+


On 16.09.21 13:59, Peter Maydell wrote:
> On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>> Hvf's permission bitmap during and after dirty logging does not include
>> the HV_MEMORY_EXEC permission. At least on Apple Silicon, this leads to
>> instruction faults once dirty logging was enabled.
>>
>> Add the bit to make it work properly.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> ---
>>  accel/hvf/hvf-accel-ops.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
>> index d1691be989..71cc2fa70f 100644
>> --- a/accel/hvf/hvf-accel-ops.c
>> +++ b/accel/hvf/hvf-accel-ops.c
>> @@ -239,12 +239,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
>>      if (on) {
>>          slot->flags |= HVF_SLOT_LOG;
>>          hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
>> -                      HV_MEMORY_READ);
>> +                      HV_MEMORY_READ | HV_MEMORY_EXEC);
>>      /* stop tracking region*/
>>      } else {
>>          slot->flags &= ~HVF_SLOT_LOG;
>>          hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
>> -                      HV_MEMORY_READ | HV_MEMORY_WRITE);
>> +                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
>>      }
>>  }
> Makes sense -- this matches the premissions we set initially
> for memory regions in hvf_set_phys_mem().
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Should we change also the hv_vm_protect() call in
> target/i386/hvf/hvf.c:ept_emulation_fault(), for consistency ?


The x86 hvf code seems to deal just fine with !X mappings, so I'd leave
it as is as part of the arm enablement series - especially because I
have limited testing capabilities for x86 hvf.

Roman, Cameron, would you like to pick up the ept_emulation_fault() part?


Alex

