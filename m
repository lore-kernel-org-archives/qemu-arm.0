Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4726147lfb;
        Tue, 27 Apr 2021 05:16:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznc/qV8NUzBtOpqYiPVzEs2JPXL+QWPOIbsyE/1ZyHHeACOYtRHGQy1f/pyrhomzjlq6gw
X-Received: by 2002:a17:906:6789:: with SMTP id q9mr23265080ejp.295.1619525768529;
        Tue, 27 Apr 2021 05:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619525768; cv=none;
        d=google.com; s=arc-20160816;
        b=wydF01CSr7yOsNNRj3KX5vIwzLFRwZTWIm+O8d3Sl+m9kxMeKaJIoLksYXphGsX2Qa
         x4zCpZmcSUiiFOK7cJWronTxJJfiQUitqWYBSsWrC9HMqtFrFXfeea5DsaAASKlsbh1y
         NdmqwTKCZDcoSoe4meJImitMMHDjCk49go6psfIC/5zDn6GU+keB5duFYWwXaU948UXn
         CdjXo4+dvgRURkQPzDRVa5MUv09yxE/HQZQU2PKbD8opNKbvHnD439rwaciCDhEefjX7
         NTO6BY1NmfnsgIfd4la3rW05j53eVI412LM6DaPGDXXVu1+Kl0ViKAXYpavvRsF2RJSo
         /MWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mWpk78itXvEXOeGAQa5LeLTvdGlpzh0HH/9BHTsSuBY=;
        b=msXSEh3RDI3JRF6/Cpoyj5EFLsElaWdWfdw5LKDrVJ33i2/kWQCTMDlDXcT/afC8dZ
         XbXPCvXHBek3L0XrqUP/+F6C22Xyn+hY3XqYxipWmvBQyTr4OpbUCqSdI2wXhSUWv1FF
         7LgTf+I15nVrDYoh5+B6Bt7uxSCUWG2GwgZkaJGKDwJ+i4Brr3bcV82cFnI2aY+5xe8R
         kXdCYnqVpwbmggfZ4ojV4apebGB7DAoDFF2sC5NMXhHj2CkkWj/rprnsrKX9QsMA2xtf
         opU+Pvfu8EtJsaKqZ447Ax98ON5oRSi8/2UyIfG+UZYwmEhTMiOZxzPDS1VmhkRJK57q
         bPxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WTXVqa7H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si16011830ejy.742.2021.04.27.05.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 05:16:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WTXVqa7H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbMdL-0008Qw-K7
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 08:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbMVz-0005yC-K6
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 08:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbMVv-0006Qt-A9
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 08:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619525306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWpk78itXvEXOeGAQa5LeLTvdGlpzh0HH/9BHTsSuBY=;
 b=WTXVqa7HIi5VD5i9yh0wBr4rXn5SP32P+Dw7A0YNsiaeH7AqtY9nIt54l21GBQyuEhZqa/
 bVe+gEMzCMjzWiobBkk1tQfsF1I5dJCdTyeui2KoBhUBhWNzQs607q9YNIdItejmHatGY4
 juu36UaF4/+zpHEgf27Lx+vYCzpPR0k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-DozuZEKzPGeSgObJRxWWOA-1; Tue, 27 Apr 2021 08:08:24 -0400
X-MC-Unique: DozuZEKzPGeSgObJRxWWOA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t14-20020a5d6a4e0000b029010277dcae0fso20528697wrw.22
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 05:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mWpk78itXvEXOeGAQa5LeLTvdGlpzh0HH/9BHTsSuBY=;
 b=MkOzwqR1ElxuELeU5wQsfBe5UOxCoAUVw+WEzyvRHyqR7uaKhg7JQK+PGTDS3q1aUo
 Za/r4TWSq3dSzCLZP1dFWWj2AHGw4+uVFWYFdleU1wSlBleTA/pE+9XzJke5OvItGgpL
 sWIAkhADNYgwPuAGvVFrMceemL8ddkrLn5z/hlXhQdJ2ZjPo0UNjp3Xht2Y1LgDHbXPP
 FiGiOXLnIXTZfkfE+g4PdvDL2mahsnrjgmoZJNAITrhb7zpEKwWNOr4+nSFNhOwFUk4p
 AS4+QsTWyxDQthSbj9xbaaIR/rTtlRnwgXv5gv2LlGgFvKi46n8PpvgsOx2CbABKPi9Y
 ma9g==
X-Gm-Message-State: AOAM532MdwsXxGw2ro5mwupweII+gSa/dpI7n76cCCtBUus304fj/PfJ
 dIQG2z9IgIOujx+JqiEhQic2bKkvoGrKu7Jo/noiJ25lOtEM3hBSNTJzkmnuVZPPVK3bp4214PX
 3TxTATUQQDdyo
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr28752936wrx.281.1619525302908; 
 Tue, 27 Apr 2021 05:08:22 -0700 (PDT)
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr28752923wrx.281.1619525302778; 
 Tue, 27 Apr 2021 05:08:22 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u6sm3271443wml.6.2021.04.27.05.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 05:08:22 -0700 (PDT)
Subject: Re: [RFC PATCH 0/6] Introduce cluster cpu topology support
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210331095343.12172-1-wangyanan55@huawei.com>
 <13983bec-8b6b-4277-288a-e243d096bfb3@redhat.com>
 <a883cf7e-b820-9d20-6424-e2add3007e9b@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d21d4ec0-9b2a-c881-5e2c-0542b4166704@redhat.com>
Date: Tue, 27 Apr 2021 14:08:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a883cf7e-b820-9d20-6424-e2add3007e9b@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /n3DfMFsGyO0

On 4/27/21 1:00 PM, wangyanan (Y) wrote:
> On 2021/4/27 17:57, Philippe Mathieu-Daudé wrote:
>> On 3/31/21 11:53 AM, Yanan Wang wrote:
>>> Hi,
>>> This series introduces the cluster cpu topology support, besides now
>>> existing sockets, cores, and threads.
>>>
>>> A cluster means a group of cores that share some resources (e.g. cache)
>>> among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
>>> 6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
>>> share L3 cache data while cores within each cluster share the L2 cache.
>>>
>>> Also, there are some x86 CPU implementations (e.g. Jacobsville) where L2
>>> cache is shared among a cluster of cores instead of being exclusive to
>>> one single core. For example, on Jacobsville there are 6 clusters of 4
>>> Atom cores, each cluster sharing a separate L2, and 24 cores sharing
>>> L3).
>>> About this series:
>>> Note that, this series was implemented based on [3] and [4]. Although
>>> they
>>> have not merged into qemu mainline for now, it's still meaning to
>>> post this
>>> series to express the thoughts first. So a RFC is sent and any
>>> comments are
>>> welcomed and appreciated.
>> At a glance: tests/unit/test-x86-cpuid.c should be adapted to be generic
>> (but still supporting target-specific sub-tests) and some aarch64 tests
>> added.
>>
>> Similarly the ARM PPTT tables tested in tests/qtest/bios-tables-test.c.
>>
>> Otherwise, the overall series looks good and coherent, but it isn't my
>> area :)
> Thank you for the reminder of the related tests. :)
> I will have some work to make them cover the new features introduced
> by this series.

BTW if after 4 weeks and 2 pings nobody sent negative feedback or
NAcked your series, it usually means the community is not against
your purposal, but has some doubts this feature is necessary or
well designed. Tests help to show your work is safe, as it doesn't
break anything. You might need to better explain why this feature
is needed, and what are the limitations of what is currently
possible.

OTOH QEMU has been in "feature freeze" for the next v6.0 release
for the same amount of time, so maybe the maintainers/reviewers
were busy with bugs and still have your series in their TODO list.

Regards,

Phil.

