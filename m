Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp83591ejh;
        Thu, 25 Aug 2022 23:03:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR64p7l9uqSxCIkVgekiqeFZzvyiDlzfrpGKbu2vLam9yNhW+KmulWoaTAOqH6y0IsFJEaHy
X-Received: by 2002:a05:620a:4104:b0:6bb:61ce:73a3 with SMTP id j4-20020a05620a410400b006bb61ce73a3mr5422337qko.250.1661493796767;
        Thu, 25 Aug 2022 23:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661493796; cv=none;
        d=google.com; s=arc-20160816;
        b=wFRaaj7wJ7BnPDtgJDYL0zwwm8y1pjW+F/firgxb5LF6m+KPD10Snpk+zaeVkK3r4S
         ME/qbIl+FvR/5pzNA9A+Hclx1OnUkZtxcN73Ytsv5UxpRl+UvZQhB7WNQn4P1TpsfhyD
         tBENyeDp7UFNTezcbIgnawSyVO032Eq6Y2TwmZ0vSfT4iwKV5omAoz4audBcL2obJYvP
         2PADL3M1Yy/43R1AlBRDOxCkkrxoziGCUwSXvphyRI4Rgeq88/2kttAQGTwYLz/TJ91M
         KzS3jfGEYwzg3rs262lmXEmDOuYJv+eWAIOLa41HBVo3wP7ztVPyAjFmP07vayDi0TSR
         R71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=V5PTrqBaiOB7zLfdePuBxbwGmWH/wJwU01ywLG0PiU4=;
        b=aCKbzlQn9LwGamnJgITpWqqmnLGBklZCLO7a/X+2q3u3P0eNteN2lb8DQABJK1HABZ
         sL0KVfDy+/ETZadgX/yHmLuv+azPPaVhF8m9A4rOM1tXpNXKyP9yOjLwEKvCaVrTOokI
         oRcJQAcnCE8GQSEgLhTNc6gCAYozvWKe+8jSqkvff9eFQY5iGJ1+vxcsycalH/OsRUql
         Zq9MbpAwSPQjP5U5f6/ZL+Alsh3Ru3nx/aSS6l3R50pyeGsdkjtOXXhObPhckv2wuVcb
         NcOa/U+kSeuEznrm4WEEvYhYFDHC7dIZDcOBxYHCmQIE8AIpzG4Dcq6T+R9pB2g6l+aR
         gIRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VwOdQeeY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a05620a244d00b006bbb8927076si933502qkn.712.2022.08.25.23.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Aug 2022 23:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VwOdQeeY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oRSR2-0001PY-AF
	for alex.bennee@linaro.org; Fri, 26 Aug 2022 02:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oRSQn-0001Nh-5Q
 for qemu-arm@nongnu.org; Fri, 26 Aug 2022 02:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oRSQk-0004fd-BA
 for qemu-arm@nongnu.org; Fri, 26 Aug 2022 02:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661493777;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5PTrqBaiOB7zLfdePuBxbwGmWH/wJwU01ywLG0PiU4=;
 b=VwOdQeeYh41WZ350b6sWaM1LVXQDM/nrjdBdvQHwNJN4j+EklS93NkQi7dACprnOu8Fp9Z
 L0WBrHDPjFFV+RvvlVg4SHy9o1IX/82vBzc//ZhLs6w5/LWf2f1dtlKRYjaz3efTmY60fJ
 Tefzu+Za9TRn7h0fmtaQMGi0c4Ze/+o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-7s02-bnNPOK-R3zPLnYSbg-1; Fri, 26 Aug 2022 02:02:54 -0400
X-MC-Unique: 7s02-bnNPOK-R3zPLnYSbg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C1593826A4A;
 Fri, 26 Aug 2022 06:02:54 +0000 (UTC)
Received: from [10.64.54.16] (vpn2-54-16.bne.redhat.com [10.64.54.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDEA5403348;
 Fri, 26 Aug 2022 06:02:50 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] hw/arm/virt: Improve address assignment for high
 memory regions
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, peter.maydell@linaro.org, richard.henderson@linaro.org,
 shan.gavin@gmail.com
References: <20220815062958.100366-1-gshan@redhat.com>
 <8f219b9f-d5ee-aa9d-519e-e3a7623c2c63@redhat.com>
 <67f44b09-7c9a-fd83-d222-f505a91ca99e@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <eea48243-f3f6-750e-9f88-a8fc4aaa4e65@redhat.com>
Date: Fri, 26 Aug 2022 16:02:47 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <67f44b09-7c9a-fd83-d222-f505a91ca99e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YWedMiLEm7Fb

Hi Eric,

On 8/24/22 6:06 PM, Eric Auger wrote:
> On 8/24/22 05:29, Gavin Shan wrote:
>> On 8/15/22 4:29 PM, Gavin Shan wrote:
>>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>>> are floating on highest RAM address. However, they can be disabled
>>> in several cases.
>>>       (1) One specific high memory region is disabled by developer by
>>>       toggling vms->highmem_{redists, ecam, mmio}.
>>>       (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>>       'virt-2.12' or ealier than it.
>>>       (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>>       on 32-bits system.
>>>       (4) One specific high memory region is disabled when it breaks the
>>>       PA space limit.
>>>       The current implementation of virt_set_memmap() isn't comprehensive
>>> because the space for one specific high memory region is always
>>> reserved from the PA space for case (1), (2) and (3). In the code,
>>> 'base' and 'vms->highest_gpa' are always increased for those three
>>> cases. It's unnecessary since the assigned space of the disabled
>>> high memory region won't be used afterwards.
>>>
>>> The series intends to improve the address assignment for these
>>> high memory regions:
>>>
>>> PATCH[1] and PATCH[2] are cleanup and preparatory works.
>>> PATCH[3] improves address assignment for these high memory regions
>>> PATCH[4] moves the address assignment logic into standalone helper
>>>
>>> History
>>> =======
>>> v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html
>>>
>>> Changelog
>>> =========
>>> v2:
>>>     * Split the patches for easier review                        (Gavin)
>>>     * Improved changelog                                         (Marc)
>>>     * Use 'bool fits' in virt_set_high_memmap()                  (Eric)
>>>
> You did not really convince me about migration compat wrt the high MMIO
> region. Aren't the PCI BARs saved/restored meaning the device driver is
> expecting to find data at the same GPA. But what if your high MMIO
> region was relocated in the dest QEMU with a possibly smaller VM IPA?
> Don't you have MMIO regions now allocated outside of the dest MMIO
> region? How does the PCI host bridge route accesses to those regions?
> What do I miss?
> 

I'm currently looking into virtio-pci-net migration, but need time to
investigate how the device is migrated. I will get back to you once
I have something. Thanks for your comments :)

Thanks,
Gavin

