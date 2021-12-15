Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp58178lfj;
        Wed, 15 Dec 2021 10:32:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxW7M5H8u75vnYxyVY1zfpcPHNTkH5C62uQmx3vgc40UjwFXHX6wia28awbToG8cZXvePp/
X-Received: by 2002:ac8:5b90:: with SMTP id a16mr13501112qta.300.1639593143832;
        Wed, 15 Dec 2021 10:32:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639593143; cv=none;
        d=google.com; s=arc-20160816;
        b=BwvqGHXAuq3dcc0NK0B3CA9YsBx9j4MLrGjFwzWeourab4416ekEkb9vOh5H3WUaAS
         hlLLjcTNoe2llZWvRg4db8jNHQQVDa0oO4AAnTQJva5XduWKG2oofO6pN4W4D2W/05rc
         oBOQQZn5ucutEA7kFsmAwodFZ57scmOvnpJ0kQ2FaaXF4kyNBw4njTrRo3+ORnsQmAg+
         nLyOalEEUST6R1YsUkrVR5B1jw/StXNddgUh+CMvegRbC4BISGQ1oWW1I0fbS57KLtwW
         oD/ipq3jUpq3O1Vnbr303EIUDexyHTJaZCPhfc/JBwQmVjBCy1Wf0ybCYW/QlrF+ytAi
         6aVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=D7W8yCdgxujTQXBUcwTQP0YT4WKi+2Bfreyrw9yWArg=;
        b=MxO49H4gfI0YHA9QMTAdx7EjvCt+TrGvDYA6OjjrVpjOFCpVzxUW1bnNWKJc61j9nm
         b347Vt5g9JQkySmwpDOEtxY6O3qonfuh2KF/H5pR+qdvvaC0UJyDhi1HP07EWwf74x0c
         sxdQydbNOEe5EuG7wNUQeiyOwCp19jUcliqSc/cUmLp1aF5/4gpnr3mv5BZVc9Zv4gcv
         efLLfF1MzFrEo5O5vcB01BITfu7NXP/zD+r12DTUXZOHhGKABgP7P3Hvjh/8If12je5I
         APR5pYWOUbwB7ezB/g0v9jtK2GWSdPrfYT4tzArZFWOoEW6x+Rkh1yRBKA0I0lz/7Pjg
         06mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z9NHrm64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22si1545272qko.336.2021.12.15.10.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 10:32:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z9NHrm64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxZ4h-0004eD-2O
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 13:32:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXrJ-0006PE-3U
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 12:14:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXrH-0008W4-CO
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 12:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639588466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7W8yCdgxujTQXBUcwTQP0YT4WKi+2Bfreyrw9yWArg=;
 b=Z9NHrm6416+Hyh9mp3F8g4Nk8uVbG8qFcjMWG8x0aCBu8W18lz2Y4CTV48/DKN+d3TjvBh
 hzNbshVk6xBw037MJzyLhwATQTR0kZFoGp970qho8H8tcdQZ/ezgfxK3MQcAPwCnlD/Bfi
 CoODnGVpI1ZwnRL8uupzSHiaf5ho18k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-ah0F9bnvMh23C8Fg98jlKQ-1; Wed, 15 Dec 2021 12:14:23 -0500
X-MC-Unique: ah0F9bnvMh23C8Fg98jlKQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so9296995wmb.4
 for <qemu-arm@nongnu.org>; Wed, 15 Dec 2021 09:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D7W8yCdgxujTQXBUcwTQP0YT4WKi+2Bfreyrw9yWArg=;
 b=W9R/mtcKmgwQL4PrZO9xKZyFJ+GoyIyNJJ/C5fKViQ1kmljwonXDp/1Z387P6Avm60
 RQmVb1LKZ0RkXK0auwoF7MVzvlDgk6WZP+XzwNCtfT8Vm/YgvdWy0tL2GyVcXPMP//AY
 VOMuAWB1mF7haXqSrTOE1ALLNR1m6gCKLz/l3Js5d7dWWTleLdpewPDfxGljq988F3Zn
 dJKCj9xoV2l1Rj2RbIlLyVNRSxs5OXPezUaNH35IzBm2Va908+UoF+EHB1XFXAvvV9EY
 ka/hJGTTECJ7MzJ+MbnbD6BKLXJLgs8Hr977BPMj/3/XMyf8kXILvsU0fLGI1udGuR/2
 KrLA==
X-Gm-Message-State: AOAM530OaROT5Y+nqFYPHbJ/bGQ8A3m46xnteJ73Lz53ELsXvTwgBX+q
 aVxT1DxNNgb+5dsSv6EtWycjPN/Yi+KyPJl01395nEjvB0tyZ6NeXgFV+JOufy0o50fG/IuUwNn
 Gx8Ab/vichLFH
X-Received: by 2002:adf:c7d2:: with SMTP id y18mr2177905wrg.717.1639588462041; 
 Wed, 15 Dec 2021 09:14:22 -0800 (PST)
X-Received: by 2002:adf:c7d2:: with SMTP id y18mr2177865wrg.717.1639588461750; 
 Wed, 15 Dec 2021 09:14:21 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m15sm34071wrw.27.2021.12.15.09.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 09:14:21 -0800 (PST)
Message-ID: <3e160727-eb18-3e7f-1a60-3d143b6bde1f@redhat.com>
Date: Wed, 15 Dec 2021 18:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v2 3/5] exec/memattrs: Introduce MemTxAttrs::bus_perm
 field
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-4-philmd@redhat.com> <YSPr6dN+iKKFlCxy@t490s>
 <922195af-f70d-eaf6-2aa4-b924f8196076@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <922195af-f70d-eaf6-2aa4-b924f8196076@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: whXlOouIYaFy

On 8/23/21 21:04, David Hildenbrand wrote:
> On 23.08.21 20:41, Peter Xu wrote:
>> On Mon, Aug 23, 2021 at 06:41:55PM +0200, Philippe Mathieu-Daudé wrote:
>>> +/* Permission to restrict bus memory accesses. See
>>> MemTxAttrs::bus_perm */
>>> +enum {
>>> +    MEMTXPERM_UNSPECIFIED   = 0,
>>> +    MEMTXPERM_UNRESTRICTED  = 1,
>>> +    MEMTXPERM_RAM_DEVICE    = 2,
>>> +};
>>
>> Is there a difference between UNSPECIFIED and UNRESTRICTED?
>>
>> If no, should we merge them?
>>
> 
> I'd assume MEMTXPERM_UNSPECIFIED has to be treated like
> MEMTXPERM_UNRESTRICTED, so I'd also think we should just squash them.

For now they are treated the same way, but ideally we should
explicitly classify bus accesses and remove the MEMTXPERM_UNSPECIFIED.

While we can use the same definition with comments, I think having
different definitions ease maintainance (thinking of git-grep), but
if we know we will never classify/convert the devices, then indeed
having MEMTXPERM_UNSPECIFIED is pointless and confusing.

