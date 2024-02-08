Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp293575ejb;
        Thu, 8 Feb 2024 10:23:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhMmg3fSUFiuR+AjgB0seCP5EIRg+YQfDDYKdOXW8p3+LHyYYYaxcERz0uIcN/Q34aAXlE3/oyiklPYtQjrilV3YBcyLoK
X-Google-Smtp-Source: AGHT+IHVSG9tvxyRvmomKP7eXhErGfE+2tay6QZkwv2WrIksw+V848g8vD7nF5m5+WVTJO0r3tsy
X-Received: by 2002:ac8:7d84:0:b0:42c:345c:b2d9 with SMTP id c4-20020ac87d84000000b0042c345cb2d9mr13655124qtd.50.1707416621882;
        Thu, 08 Feb 2024 10:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707416621; cv=none;
        d=google.com; s=arc-20160816;
        b=t0/dhxWxz/bYdvqXoQSYmhNUuhLxYRNetxHsqajY4JPHkv5XAbqWnDnkIPuaeqXV8l
         FlzPuNM7X7UX6/0KG8gu8MUQT6AWSvMMOZnH7QlMJ3/zNNQSWM6gC4T00ZAsDp/paVnV
         mUbj6n4wyfriH0Ukdt2SOWrbxD4U0horCqTCAjX1XOWFg1Bg36Sa0RS/RaRbbDNMCAcg
         /ZvNCHLqFcKz+mueDgjnHqvL4QE16oLDCJ50rp2032AzRV6AnA6+Eo9JmNe8EFszbNK6
         VYIStXLTP8iZiU8QHZAAQm7CtJBsXyGrfCdtm7DyRKnwO9fDuSKh27cTQx5TiqF2OEbc
         NeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vqtGZlnaPBanzxaRtaUg7pF8Mthu78g1bIUNZU1buMc=;
        fh=WW1dLj8EjD0QniWI3zlYFxfWv+xVoc//2G6nLKH33wE=;
        b=Q0AKfzx/yyT49U4VWiWCMJkjAAmC6ML0BLAO8Ig/WkM+TrS5cmtmxAkf6eNK/GtfWz
         aP3u2HcuDwN6fFInNGrDTJOSIG6btTNF+frdKJUb8BUy7+9lHKrewldYVVKwe1yi38ao
         ieNnNHdys2g/VrJMFR/jgihtVjLn0uvVkTAXvBoDNcvXeL85SRxdRgy/7dYNIc9Sb9vP
         V2XTWHcblSmDwutQhB7zfpnkKfOFVvL5MrvdLRnT3FFCRQWNmlIeGk6aA6dOrg5xSNfK
         KoihCnHDTAHqaVakk//UqfW91DMBanqxKXQDLpLQYRZC/kaAr3RqIA6drqtXDHhBIda8
         1Gbw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NBozkHdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCU1avpaaSXZTzaPRkn/uEea6z1DQQ8xkoRbujt6qB1v3MbQpiXlJdcY8wHtl8iO8WdJoM139Pq1k+ITEeBAU+0kJcCBQ+KT
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18-20020ac85a12000000b0042c4aafc09fsi9639qta.58.2024.02.08.10.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 10:23:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NBozkHdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY93X-00085S-2X; Thu, 08 Feb 2024 13:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1rY93V-000844-2s
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 13:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1rY93S-00008a-7v
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 13:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707416601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vqtGZlnaPBanzxaRtaUg7pF8Mthu78g1bIUNZU1buMc=;
 b=NBozkHdTLgHIV5sYRVCpPyFKc9JvxiGyO/3WRFYJJbVQLWAXO4ZdUlchmekzJ2R+3hs/yt
 6IGuYydb1/1DuaadpE4VXOTKM8UyZrnhfxLv5912GFx3reO1B1oNsgrmJ55455aIEYiwDY
 N+l6pIOvyIZjUGHUqUtRSGCIptFOaUM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-0dNDTHo9MIiVtMlRXs1eBA-1; Thu, 08 Feb 2024 13:23:19 -0500
X-MC-Unique: 0dNDTHo9MIiVtMlRXs1eBA-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7853d5e398dso19166985a.3
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 10:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707416599; x=1708021399;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vqtGZlnaPBanzxaRtaUg7pF8Mthu78g1bIUNZU1buMc=;
 b=B7TJWwfw792vY7VMz379rmZ4insxtgYNU/heDL+6AEGfeHbkVl6AolF3QPRBb1Yt19
 HNcbfxzIby9XJUbA6E2Gs6hskYX6rmLmrmdwvlNp0swwANTi8yJue6hAPmqdd9Y4zAhQ
 prTqOetMpmdum2mQiCc1lfhq7BXeniKdRbWYO6uXTGivev1xuDNleWTZDcHMMX3uXBiv
 aG9Y1buVMPJofXpCR60xfhONs/uJTFfuxeKD7I/zVl2Iw+r6tc8U+NW/Hfx8OJ8hhvEK
 utWfoC+W5672+Yyd6TRlGS61Qz/X9F6/7K2S83vzuvlJCjIWIkZzbmFgU04RVY25Rf8H
 VJrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6ydpM6Ze1KIHjeaxlup3BFkQC9ziJ6XzG5w6n0qDBNEhkAi/R1L4KcjP8S4FCLc3ZH7vAThY0xBQXBPb7jqHlyz5s
X-Gm-Message-State: AOJu0YzncnIeoPqKirz5aVFmWWQ7UQP7AHFvOOXOxpeZ+YTES2LK0uqm
 PzvCgu30qilOZS7Ks44HLMNpdo5DTp5TTy5WQ8ZSEsZU2TyUklcNAUSx55NRY2IcrOSWdhspqR0
 eYZlQHneoL8FAZjTqPgNDuNJIfIb6x/SvBS0C+tNj1TcecRLsrw==
X-Received: by 2002:a05:620a:2228:b0:785:9c70:c7fa with SMTP id
 n8-20020a05620a222800b007859c70c7famr310473qkh.1.1707416599417; 
 Thu, 08 Feb 2024 10:23:19 -0800 (PST)
X-Received: by 2002:a05:620a:2228:b0:785:9c70:c7fa with SMTP id
 n8-20020a05620a222800b007859c70c7famr310460qkh.1.1707416599208; 
 Thu, 08 Feb 2024 10:23:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxB5yt8DVmHh5gTQyhxvZMwBvIUcZhoi+HvKOKHWwnuE9GLac5LuR+ytD7XBk6JPiLWNmWPtFeq90FpTcef0I1jJkYLyCyib6NkGGC825uv9T2q/BbZkJ/L3Zpcy6CD+1P2+nOLkBrnKuMbs4+jv/LkULmi8O8x6ZevDm535QFJ0wcH78As2LClAY+JFTZLHtpUCxnJD0hI0x+aeQW1pcyU9SfYELZ8OJ0mTW4Kiha40UgxB8EZlnGpW+RpSpZ58cY2LkVIbp4+Kp0tA==
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a05620a123800b007854018044bsm45815qkj.134.2024.02.08.10.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 10:23:18 -0800 (PST)
Message-ID: <b451a263-db41-4ec2-b880-be27721ec00d@redhat.com>
Date: Thu, 8 Feb 2024 19:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] QEMU v7.2.0 aarch64 Nested Virtualization Support
To: Miguel Luis <miguel.luis@oracle.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Marc Zyngier <maz@kernel.org>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <5ede0197-4587-43e8-976f-d3001f42b8b9@redhat.com>
 <69C2ABCA-577B-419D-A0B4-52923BE59842@oracle.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <69C2ABCA-577B-419D-A0B4-52923BE59842@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.213,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: CFmAJf80QA0k

Hi Miguel,

On 2/8/24 18:33, Miguel Luis wrote:
> Hi Eric,
> 
>> On 8 Feb 2024, at 15:55, Eric Auger <eauger@redhat.com> wrote:
>>
>> Hi Miguel,
>>
>> On 2/27/23 17:37, Miguel Luis wrote:
>>> This series adds ARMv8.3/8.4 nested virtualization support in KVM mode.
>>>
>>> To enable nested virtualization for a guest, the host must expose EL2
>>> support via QEMU command line switches:
>>>
>>> -machine virt,accel=kvm,virtualization=on
>>>
>>> Inspired on Haibo Xu's previous work [0][1], Marc Zyngier's kvmtool branch [2]
>>> and kernel patches [3] on nested virtualization for aarch64, this has been
>>> tested on an Ampere implementation.
>>>
>>> This series adapts previous work on top of v7.2.0, it considers comments given
>>> at the time and preserves authorship of the original patches.
>>>
>>> [0]: https://lore.kernel.org/qemu-devel/cover.1616052889.git.haibo.xu@linaro.org/
>>> [1]: https://lore.kernel.org/qemu-devel/cover.1617281290.git.haibo.xu@linaro.org/
>>> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/maz/kvmtool.git/log/?h=arm64/nv-5.16
>>> [3]: https://lore.kernel.org/linux-arm-kernel/20230131092504.2880505-1-maz@kernel.org/
>>
>> I rebased the series on top of v8.2. I was able to boot some L2 guests
>> with it, although it still does not work with guests featuring edk2.
>>
>> Do you plan to send a respin or may I do?
>>
> 
> I do not have a short-term respin planned.
> Please, feel free to do.

OK thanks. I will send it tomorrow.

Eric
> 
> Thanks
> 
> Miguel
> 
>> Thanks
>>
>> Eric
>>>
>>> Miguel Luis (5):
>>>  linux-headers: [kvm,arm64] add the necessary definitions to match host
>>>    kernel
>>>  hw/intc/gicv3: add support for setting KVM vGIC maintenance IRQ
>>>  target/arm/kvm: add helper to detect EL2 when using KVM
>>>  target/arm: enable feature ARM_FEATURE_EL2 if EL2 is supported
>>>  arm/virt: provide virtualization extensions to the guest
>>>
>>> hw/arm/virt.c                      |  8 +++++++-
>>> hw/intc/arm_gicv3_common.c         |  1 +
>>> hw/intc/arm_gicv3_kvm.c            | 25 +++++++++++++++++++++++++
>>> include/hw/intc/arm_gicv3_common.h |  1 +
>>> linux-headers/asm-arm64/kvm.h      |  2 ++
>>> linux-headers/linux/kvm.h          |  1 +
>>> target/arm/cpu.h                   |  2 +-
>>> target/arm/kvm64.c                 | 21 +++++++++++++++++++++
>>> target/arm/kvm_arm.h               | 12 ++++++++++++
>>> 9 files changed, 71 insertions(+), 2 deletions(-)
> 
> 

