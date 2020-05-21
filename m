Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1614523lfb;
        Thu, 21 May 2020 07:21:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2r31vZrdYNrDoL9zfHoMb/72RHrKPKGbAL5ZwbUvR4ucW0Ebk6CeRcSJpYduwWRD0yyak
X-Received: by 2002:a37:b14:: with SMTP id 20mr4641848qkl.401.1590070902897;
        Thu, 21 May 2020 07:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590070902; cv=none;
        d=google.com; s=arc-20160816;
        b=G7G5XVzg+7UQPjE3Io5uoKGpUP65x+Zzf8bOurahG+s5wsGZGNpYAtn9s+P3Frgr1o
         Dvuop7ObQvk7CGQy7mQJUxuK8mRDVc8HdLIpo9MDjplX7Ca4nmSW2a3w5Eojq9Lwg5tE
         DeYwD2zyXiyc/J0fB2JVcX+PXjlvCVZa0iEhsONKP1GDxiHZYLutcaMlY/4kSgGZYndz
         IpxIqLYIs1S2cTdaExjP5DYSBykvEg9LSawz6L5mZoqoHAsd49SjvsL+2iS9cG5TKZRK
         sD56UgbtLXCwfHdZMKaCs3GHCqvBSjV1HMS+dZuUGpDYf0wa/d17Exw1YBjjQRgTNlh0
         hUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xg3bKzC4by8jf2C0O9TYTrZkk9SIrF8VIiDgmcnMufQ=;
        b=y/3t29I+lXRwqWtsLUg81+23eDgeYGtdag2aFaHxY3OccpWR1/423xRFQ69/IaWqix
         h6iZfUEF5fYu2psa6lRnJr6gbNK0cnxvj+1wXE8jYp0CHVsNqQup/KOkhEqqfLhC81cF
         QuXsALdENsjxIKocaHIG/MLamEgnpGMxtnGlOe9toIg2WbP4BFKEgXrbOzkbpUbJThmC
         potQordiWPDpwwVi5TXmX6EQmw4yBK4rO0dRXqWTGxMMQgaP612KuXrbIuA7G4CstXST
         ayTGOyrufgfusA0SkbCCDU6NjA5ZpRYzx21YqLHQ8LYKeXgfbXsoPvgvUclws2OhUAZE
         mwmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e+sJx1m1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c188si3464154qke.1.2020.05.21.07.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 07:21:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e+sJx1m1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbm4s-0001bD-Bp
	for alex.bennee@linaro.org; Thu, 21 May 2020 10:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbm4l-0001Ym-40
 for qemu-arm@nongnu.org; Thu, 21 May 2020 10:21:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24095
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbm4j-0006Ds-DZ
 for qemu-arm@nongnu.org; Thu, 21 May 2020 10:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590070892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xg3bKzC4by8jf2C0O9TYTrZkk9SIrF8VIiDgmcnMufQ=;
 b=e+sJx1m1otnib5QfqDhRz8hvGjc+AKmfEx5Saz9RVA51oVk381MWh8/o+w6USrhvRtlhgG
 +cCFpLbGzQAqSOrS+PGwAQ5N3eCLV3fEYlQW34D/sYIfjnejAo+umjyN6FtcRzGjE8K/ow
 hZow0Amuth7XnK3uKcZAMzHu2W2Vpe8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-FocSnfbPOeqBj6LS9_A1mQ-1; Thu, 21 May 2020 10:21:30 -0400
X-MC-Unique: FocSnfbPOeqBj6LS9_A1mQ-1
Received: by mail-wr1-f69.google.com with SMTP id f4so283375wrp.21
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 07:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xk3PN1V81+WyaTVGKsiFpvv3947Bx6sjeseiShYqzcU=;
 b=YTlhheb0fGCi76CzWqvecWt96DJ53NxfpfsIPunyyJlVhNxq2BEXUibnkGRuXi9Q2H
 uGKQFybR6SzcEN9ao+Pn3RIthbk9rOXn5/wAEzDO38tOyz1vn1rme0tGAtDgvNDDdpug
 cV1uzKHneJV61bTeocd0w1pvvee8mEof271MKBsi5HwF7P+s+J4QCSVIh+e2xLZMI7/0
 o9nSfadZlPrUpHWspjsj05fyX+F9QjBjujreLsw0krYLGuBObnhr0PXoBLh4hGwJpVk6
 Z3+XiRw+kgfYFFzJV+67uGP/cvi3ea0n6MA1jEJur7xG7SlV62TrWMSZjglG49kDB93Q
 J+gg==
X-Gm-Message-State: AOAM530MQT5K+AipCsZpIRuq5ZnQ/mtLtAFdhKKs8epbtaH0bRQf5HnU
 g4a7iV7lcHv5bHWrDd7ONTVyJgmmcIzHH2YjleH3GYEqlm4rfrwwRWl6nCZB3KEXGQHMqj0FrNO
 E68Fj2nmWS5uv
X-Received: by 2002:a5d:6803:: with SMTP id w3mr8693023wru.151.1590070889117; 
 Thu, 21 May 2020 07:21:29 -0700 (PDT)
X-Received: by 2002:a5d:6803:: with SMTP id w3mr8692999wru.151.1590070888853; 
 Thu, 21 May 2020 07:21:28 -0700 (PDT)
Received: from [192.168.1.40] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id f8sm6389879wrm.8.2020.05.21.07.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 07:21:28 -0700 (PDT)
Subject: Re: [PATCH 0/4] memory: Add memory_region_msync() & make NVMe
 emulated device generic
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <20200508062456.23344-1-philmd@redhat.com>
 <20200521123245.GG251811@stefanha-x1.localdomain>
 <5514da71-8d9e-e784-bfad-5939bd7ac99f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <770d4c73-440c-5579-582f-7dea5de2c051@redhat.com>
Date: Thu, 21 May 2020 16:21:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5514da71-8d9e-e784-bfad-5939bd7ac99f@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:44:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lEssTioSDnSL

On 5/21/20 2:46 PM, Paolo Bonzini wrote:
> On 21/05/20 14:32, Stefan Hajnoczi wrote:
>> On Fri, May 08, 2020 at 08:24:52AM +0200, Philippe Mathieu-Daudé wrote:
>>> Let the NVMe emulated device be target-agnostic.
>>>
>>> It is not clear if dccvap_writefn() really needs
>>> memory_region_writeback() or could use memory_region_msync().
>>>
>>> Philippe Mathieu-Daudé (4):
>>>    memory: Rename memory_region_do_writeback -> memory_region_writeback
>>>    memory: Extract memory_region_msync() from memory_region_writeback()
>>>    hw/block: Let the NVMe emulated device be target-agnostic
>>>    exec: Rename qemu_ram_writeback() as qemu_ram_msync()
>>>
>>>   include/exec/memory.h   | 15 +++++++++++++--
>>>   include/exec/ram_addr.h |  4 ++--
>>>   exec.c                  |  2 +-
>>>   hw/block/nvme.c         |  6 ++----
>>>   memory.c                | 12 +++++++++---
>>>   target/arm/helper.c     |  2 +-
>>>   hw/block/Makefile.objs  |  2 +-
>>>   7 files changed, 29 insertions(+), 14 deletions(-)
>>>
>>> -- 
>>> 2.21.3
>>>
>>>
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> 

Thanks both.

Stefan, do you mind taking the series via your block tree?

Thanks,

Phil.

