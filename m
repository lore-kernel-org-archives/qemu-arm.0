Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp474041lfp;
        Wed, 29 Sep 2021 07:58:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYMjrZCdlWoH8bkWj4kCaq+DZDxW5BrGe8UrkZ4xt2yFP3s/QgHyGqpx1C/0DKv+vUKeDA
X-Received: by 2002:a05:6122:1ca:: with SMTP id h10mr305407vko.20.1632927482949;
        Wed, 29 Sep 2021 07:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632927482; cv=none;
        d=google.com; s=arc-20160816;
        b=1CWk44np8C4d2iAYuUwdtzWwup33WiB/t/q6A6LWU0bP2sQFH1EfurIVgLsgJAjU9c
         StbOsVGp1YMD8vQkxlbRbyXTLwxfYXS+CuOVihl3iOfqKNViCs4Tb523UE2lx/aNXA4A
         ZTNVuJ36o1jzAYzT3KQq9dOXDGp6h49NSw6MAP1nNnQ3GKibICShNLLY4F3nsu+G9JVF
         Tt9zpgrU4f5izpjnkLK9RlIJQpoSD54zeLH0AoW+5u144QQ5h1R74XmbzREGsNxq+3OL
         IR47g2sjXC02EN9D2C+/m0O+d4Jb2ghp3PHBsGbJAhZAaRnE1r7SN13l+Iyim2YT31/b
         75xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ClkLC89eOjyRm24cWRofxm3lI/IZtLH8xob3cAVr6tY=;
        b=uW8pPLZnq/jwuDVpmr+7F8GZlJhr7MHHrYQ1yNpklFC6AixuaH8uGn6XtNHIXb1swa
         yu9/gzLzJUY16X5VydwYWBC1QhgYN+mH+5BxgWOefitiTLrZkNCGJ9+QZVmEO15ts8lF
         eOeWw0izLVrKgeA9uOKCfir2Gj+IXWGWdpICuGQOmNiLoiimAH2O+8YwdaP+fRhztmnp
         KeOjn04lwvtxMLYjxFTg9oOOTaE6JRzG6RT/Qr6pKrwi8eZ1w+6sEojW6J4BXWwCgH8b
         g1EOi83KErt4YAV7D0oFbBLuve9NisticQ11W+mYQHHdqbZJVMs/MKUtzkqOQTXKb9Uc
         q2Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q5oJtUjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26si2472530uac.121.2021.09.29.07.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Sep 2021 07:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q5oJtUjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVb22-00056r-8A
	for alex.bennee@linaro.org; Wed, 29 Sep 2021 10:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVb1r-00056G-Lh
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 10:57:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVb1o-0002Py-IM
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 10:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632927466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClkLC89eOjyRm24cWRofxm3lI/IZtLH8xob3cAVr6tY=;
 b=Q5oJtUjOcZG8BLbJ/bqCuni5yaLUT2FLReyRPI2bl9Hu/4/+bynWCJJ8VpTpwZsBpHSZic
 1OQcVR1HiVFsnDaBK37tBkkXNFxJJZQKpScViKyQPmJ5wKv3+jxSckv3AXdAq5Arc9XQTH
 vzUJwXmY3QO0ob0WufdEtiVOxSR0/q0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-Vmc4p8bSOGS9KB-TolbPeQ-1; Wed, 29 Sep 2021 10:57:45 -0400
X-MC-Unique: Vmc4p8bSOGS9KB-TolbPeQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so2410481edj.21
 for <qemu-arm@nongnu.org>; Wed, 29 Sep 2021 07:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ClkLC89eOjyRm24cWRofxm3lI/IZtLH8xob3cAVr6tY=;
 b=31d+65hfxlb4EAyIV/efnl/3S0OMzM53Cd63jQYIBW07W7PAm8wqrJcQLKgQlNWEOs
 rrtjZoLGD5N8dmcbPrQLJCsApwDZDcUnoy2qWMw1AZB/DNJRjrJZwN4qgUnMyb4xufig
 QgzhvIC//XFUbIlqJRlF3cIz6KGhq7G01lAgpWfzVeNyp7R3AljhSGCJGb8irB1iAARe
 luN+4QKyAKnL0p914ANJ35Tsmrwe23jgPEuCvNg+wJ+A3RmzwIGit0eY+7PdDPDS8Hev
 149x6x0kwTPeaJUqeBJ036gftiKyDbvPfDTitI0IPmflUs1+StEUib/DsObfDj9xBbpb
 63qw==
X-Gm-Message-State: AOAM531CHLTuUivh3UBTbr9c02F7hkE6PplUkzqq7DIh3gosZT+KVzph
 /otlzGBhNO8wwhEo+yfKNNcpaZOJa4XaTH7J2uJSvG+C5LJKbL8OB4MTLOaqQZxfGqWPcnWbPS3
 tcPvKxMvZOwaL
X-Received: by 2002:a50:cfc1:: with SMTP id i1mr356062edk.251.1632927463738;
 Wed, 29 Sep 2021 07:57:43 -0700 (PDT)
X-Received: by 2002:a50:cfc1:: with SMTP id i1mr356026edk.251.1632927463479;
 Wed, 29 Sep 2021 07:57:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a22sm18731eds.62.2021.09.29.07.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 07:57:42 -0700 (PDT)
Message-ID: <f0df8f93-0214-58cd-4304-20afd2e150ec@redhat.com>
Date: Wed, 29 Sep 2021 16:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 00/16] machine: smp parsing fixes and improvement
To: Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <83769e14-f85b-26bd-705c-498557b26f57@redhat.com>
 <87sfxntp5x.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87sfxntp5x.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A8wos35cgEaA

On 29/09/21 16:46, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 29/09/21 04:58, Yanan Wang wrote:
>>> Hi,
>>> This is a new version (v12) with minor update suggested by Daniel
>>> and Philippe. Two new commits (#1 and #16) are added. Thanks!
>>
>> Queued, thanks!
> 
> Could you amend PATCH 16 to drop ERRP_GUARD() in machine_set_smp()?
> 
> 

Sure.

Paolo

