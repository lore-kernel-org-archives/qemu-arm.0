Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3117867lfg;
        Tue, 9 Mar 2021 11:56:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhTda2iuHcYJ1lR7NBGAaZVS3EV0MU/0j1/+mZTsmz8S/6STDJjrdiAgP8fQbWLe0VPRQ/
X-Received: by 2002:ac8:6888:: with SMTP id m8mr26274970qtq.71.1615319777045;
        Tue, 09 Mar 2021 11:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615319777; cv=none;
        d=google.com; s=arc-20160816;
        b=Qr/JzdIwvYWCyzyQl+B+B4nM5lkpalcf2xcZXHaO5Dd8eJVxRJTK/B67ZZ+wMUr9Ga
         DiftKtH2UvWGiWPDm5AECeC0FXScHbWOt3SmSoIDmlU/GStZhyD3NXfXo+xlWyqJRVeo
         LWLfmaiOG7wdwkhtY6kBRGBJTCGBNDzKuaxHvg5iQUrVj9y2Yy0x73ujsE4Qiu9X/c6F
         K2ZcB4kovCRMLHC82CHFQirA3mI4i+f0K6BqbhfWe1mWSCCdndK576Bb0SjQyu8mR9tj
         sKvIyLb3pt5JouDt7P3zi7rxlAgTDNem/gGcLB2orku7gCo8NhHV3mTEJDmjxnsKjZs7
         JiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6j/zMx37Fx8V1GILLftlm8yekhZLLhRNo3dX/LZWhvU=;
        b=jxm2lT3t7DMSHZpotzctmsGyUBd4qWAOCmLcKHzTX9RlqaSDboy8idYgmwfOZntmbF
         6lclQTpPv8TmjFq26f2xazot4DTEC7uOf1nVNWAAjvccRC91q9GCr/ATrOjOcOsf5laZ
         aprqMsLYtwBXgnflDabE77EumgVHMn+jBiY0d9FcZy1C4sgbTOS4v1bxpcmGRGUY6eFY
         5ZO7T5kI3ejvNeUNj4Fl7873JpL1zzLnAYYi9Iccju33LWalkuKrv3R4MorzTjqKP+9t
         YTdIOKiKplv4XYpZZOnzqIBCo8YGQ20isGy3ZqnZmoAmWnbTJNdWmqocmGK7y7BgkH2u
         a3mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GrDZOPEM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm12si9291613qvb.108.2021.03.09.11.56.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 11:56:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GrDZOPEM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJiSm-0000Db-Be
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 14:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJhe6-00024k-7O
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 14:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJhe1-0007ap-1Y
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 14:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615316628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6j/zMx37Fx8V1GILLftlm8yekhZLLhRNo3dX/LZWhvU=;
 b=GrDZOPEMi26moMT8qbObU7+a/FGcJ4IovSTwo+SQFYHyFdr8IZrqiYJDcSBgvluGoLxvPy
 aRmqHIYLpkTTwb74kGpXrqpCk5wJ5vZeQS6TnzbUtaZpDA9ikdCvZ40phXIPYWkPBvRECP
 2MelECMq6+8nuHudn7eJdfJGVV63V7c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-DCp73_XLOZmMkiTFC98khw-1; Tue, 09 Mar 2021 14:03:44 -0500
X-MC-Unique: DCp73_XLOZmMkiTFC98khw-1
Received: by mail-wr1-f71.google.com with SMTP id e29so6871119wra.12
 for <qemu-arm@nongnu.org>; Tue, 09 Mar 2021 11:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6j/zMx37Fx8V1GILLftlm8yekhZLLhRNo3dX/LZWhvU=;
 b=BmPMbJBg29ArvWGbdN+Bw7OgQh9IjB0/rMKbsJq9eqiWJRObGOeKkIT8gY4704OIGW
 BDShS45jRTzFbNJ6a8gmwF9P04m1okTiUtZ7+cnEfiaRdD39j2JJ+QS5wqaN6KS/VgrX
 0XryVCcTRftK/QX7fiGfXzj4HM2osfFK1kTeXg/n2B+x0edweQgZOshzr6//YFypWE3N
 9pykjgfhCkPxAHLEvQm8WSgoE9RGVtlmqZWYlbsdLS17WewOoQcKyRf76gRxgMLGPyxt
 GixGr8Qu+xflz/j1Dgbi8DVWr6lu/7DKIUk2079MPMxLrMcJGFCxJqSLJ+Vl4VhTW2cR
 hKbg==
X-Gm-Message-State: AOAM5339nQzE5cj8pvcI5O4M43vLOid/0Tc84WiERHhzSGVcjXwGhImy
 dv3Q4t8S6B1JWWHaNCgFYngoUap9/YvrdUFHB5Zwy1r4xgdAuruknvA+GR9ORDPsCnw+NBKlZAh
 NvSw8+Cz5o6ml
X-Received: by 2002:a5d:4688:: with SMTP id u8mr29752363wrq.39.1615316623288; 
 Tue, 09 Mar 2021 11:03:43 -0800 (PST)
X-Received: by 2002:a5d:4688:: with SMTP id u8mr29752343wrq.39.1615316623133; 
 Tue, 09 Mar 2021 11:03:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a75sm5584970wme.10.2021.03.09.11.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 11:03:42 -0800 (PST)
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
 <65c92236-5212-f725-047a-cb1d231eff25@redhat.com>
 <759785ef-f29e-f05f-9f2f-357e71ae3680@huawei.com>
 <11854ebf-ed88-496d-8381-5385ef1b403a@redhat.com> <YEeM8eUUzm9AlaFI@work-vm>
 <48fd9bee-4542-533a-b893-7acf3744fe36@redhat.com>
 <CAFEAcA-jnVADA85uTxPUUHfPLacN5+-d=D8MjKzfr3bT2hL7gw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eaab7787-1a91-d3ad-a296-52f3b62e32d8@redhat.com>
Date: Tue, 9 Mar 2021 20:03:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-jnVADA85uTxPUUHfPLacN5+-d=D8MjKzfr3bT2hL7gw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U6hoohINmkna

On 09/03/21 17:26, Peter Maydell wrote:
> The documentation comment for memory_region_snapshot_and_clear_dirty()
> says:
>   * The dirty bitmap region which gets copyed into the snapshot (and
>   * cleared afterwards) can be larger than requested.  The boundaries
>   * are rounded up/down
> 
> That is, it is the job of memory_region_snapshot_and_clear_dirty()
> to round the boundaries up/down to whatever extent it requires
> internally.

Or alternatively of the log_sync/log_clear callbacks.  I'll queue a 
revert for now, anyway.

Paolo

