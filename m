Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp392524lfg;
        Thu, 19 Aug 2021 07:43:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYbIpaBnQhk5GfbFANZVd54/OGH6A6Tf9S41se/ggXa+i4l7pmUL9HXinNFp3PEO0O5Wc9
X-Received: by 2002:a67:7d83:: with SMTP id y125mr12896387vsc.16.1629384226415;
        Thu, 19 Aug 2021 07:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629384226; cv=none;
        d=google.com; s=arc-20160816;
        b=Ewgf+h8IFuVRjLGx3zwZ/5ClucRTuW6rcJHhotBGfEy5sQfPnQW38I4ae7G4ij/vC1
         JnqwMTxobCQv0wR9GEF7FtlKS3TwoIeJLHQrifY0kv2efP6ROoIKuN6scXuK6DoF6Lmb
         dJvzDACz8hq9iQRHUBMY3KzOiSp7aX0OrtS3Han2GKmMezoFmtOca1b5i4oIgqvELgtW
         +Z1g/isOkmPEgt0dehp4RsK7OZqDYeq2/UB8C0S5ZY5fqFwP4jjTax3Jy+gkYWTa+3Wd
         c+TSI4bEcqsWLPPNpaPqxDtS4JtEyekdVXeYplAHCISNPDMDM+FA0HTkATWZcCq6aIr4
         p1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AqzCjfjb5h9IcPdl70FmVugn+5wS8Buwyd5ngEDix30=;
        b=wPMxH4QMoj30LGammqm0giD8V10AOLiwlC0DQjGdX1SZzKh3dF5mEsJQMr8iOxnaEE
         JE1YLno4J9qdufcsy7siLvm3RSILm7fj4gyuuhCLcIeBYULjPK12/fIgdPkfhB4IaeJG
         tOzifZ558r2Y7LYV7GRI5kco0XgmfT0kxbV9+5dFhk4uoYaOq222dOYYsqbUaQ7bZxe8
         Kf5g1yHn2ihzWKZIXFrbu8Bv32f1D0mVFaHTr5m52iIQiUkQUv0Cu5+dEQKo6KKB5HfE
         JNhZruWm0lqAlaigsHI+abzEj0pjXFZElfgFMp1eW72tz2oqxwlkspuyekckaV1uC76Q
         MgAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pa5FYMlk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si2094442uak.29.2021.08.19.07.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:43:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pa5FYMlk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGjGj-0005eQ-Pg
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjEw-0001c6-Jz
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjEv-0007YB-4w
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629384112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqzCjfjb5h9IcPdl70FmVugn+5wS8Buwyd5ngEDix30=;
 b=Pa5FYMlkMmkU9silDHDqfxoFhBtOsKz0ecimgpF7Dkq/yMU/dPz3HzjkWq7LEe+Iqg9ML/
 rDnKB41+1maCk2DtLxsCejLyxj4lZB/AvNSA2wa3sYZKkfPoj4CrjRtKQVipPE5Qs7xPoA
 rcJHYdYeK9vhCEHqxzFcLf51GnRXGAY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-BDb1zmMFObGkKbDst__Z9w-1; Thu, 19 Aug 2021 10:41:51 -0400
X-MC-Unique: BDb1zmMFObGkKbDst__Z9w-1
Received: by mail-wm1-f69.google.com with SMTP id
 y23-20020a7bcd97000000b002e6e4a2a332so1399217wmj.0
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AqzCjfjb5h9IcPdl70FmVugn+5wS8Buwyd5ngEDix30=;
 b=t+LsNJMvvU5urmo0FI+S8sRLGVAC+V5bps61GWNvmORUeBd3i/j1h2/gSm5XzwwrRh
 6d1U22iyGPlb/d0ceMM8AzPxDVGZD4oENBeZynMX62dg7mQ5v0fm3HfmywbSUNj+Xcdl
 OaC4410roGVS5q3a5DGgpxpv1qNCtlCW/s1u0uYW0mQHgrFQddRNRS4shSdDQnffdbaE
 TBMVXvlSCgK+Jxzk2wjifOf5jEeTI8IZo5R2d2Z24ZfuG+h/fKVzsRp07oK8deLXvhHM
 pOdiudQ+wzuuZxCHDtVwzcCM7aJFITKJ8xKbAKwNSxomCX9ZhaT+ezBkAjSy8iITRE83
 jAMA==
X-Gm-Message-State: AOAM532biXX9G/4YJcRfRXVU43NY+gdnHjbus4/Mja+oEXvMB6aq3xP6
 1tctwujNMlSgAf5/vZjCykOKDc6NHasOwvFxmdOsfwIRk6PMlCO0VMkL7KCf/VIUgpcMcCJLYbv
 XL+2RXZC0FzF1
X-Received: by 2002:a1c:150:: with SMTP id 77mr14006270wmb.90.1629384110298;
 Thu, 19 Aug 2021 07:41:50 -0700 (PDT)
X-Received: by 2002:a1c:150:: with SMTP id 77mr14006250wmb.90.1629384110146;
 Thu, 19 Aug 2021 07:41:50 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p3sm3178103wrr.21.2021.08.19.07.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:41:49 -0700 (PDT)
Subject: Re: [RFC PATCH 6/6] memory: Have address_space_create() re-use global
 &address_space_memory
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-7-philmd@redhat.com>
 <CAFEAcA_7t-9TpamdbAsyzYT7CFuQSjQt9YFj-1xG9fX_iMv5xA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <14b38d05-74d3-10c7-ffa8-14b8f78817ef@redhat.com>
Date: Thu, 19 Aug 2021 16:41:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_7t-9TpamdbAsyzYT7CFuQSjQt9YFj-1xG9fX_iMv5xA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fv61ZClEb4+x

On 8/19/21 4:34 PM, Peter Maydell wrote:
> On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> We already have a global AddressSpace created along with the
>> global get_system_memory(): address_space_memory. Return it
>> directly instead of creating the same AS with a different name.
>>
> 
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 16a2b518d8d..e4506b5a0d5 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -2941,6 +2941,10 @@ AddressSpace *address_space_create(MemoryRegion *root, const char *name)
>>  {
>>      AddressSpace *as;
>>
>> +    if (root == get_system_memory()) {
>> +        return &address_space_memory;
>> +    }
> 
> But most ASes aren't set up with address_space_create().
> This doesn't do anything for the common case where the
> AS is initialized with address_space_init().
> 
> This also seems to me to be the tail wagging the dog. If we think
> 'info mtree' has too much duplicate information (which it certainly
> does) then we should make mtree_info() smarter about reducing that
> duplication. Off the top of my head, we could change the code that
> prints ASes to do something like:
> 
>    hashtable = an empty hashtable;
>    QEMU_FOREACH(as, ...) {
>        qemu_printf("address-space: %s\n", as->name);
>        name = lookup as->root in hashtable;
>        if (name) {
>            qemu_printf("...same as address-space %s\n", name);
>            continue;
>        }
>        add (as->root, as->name) to hashtable;
>        mtree_print_mr(as->root...);
>        qemu_printf("\n");
>    }

Got it, thanks for the review, explanation & suggestion :)

