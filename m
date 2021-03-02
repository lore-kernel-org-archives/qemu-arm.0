Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4457096lfg;
        Tue, 2 Mar 2021 05:14:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxneZgfZm8R6pgZZcMx76k+CDmlXM1HV0nuompJ8x3IUXoH8onBwO+pslakZC7FH86VDgtI
X-Received: by 2002:a67:ed12:: with SMTP id l18mr2036010vsp.0.1614690884059;
        Tue, 02 Mar 2021 05:14:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614690884; cv=none;
        d=google.com; s=arc-20160816;
        b=OGnp8ngAjmTCsFP+y1Oe5Ksuzgonk1AHs4aQBCTiaypD6ad9yXSdU2D2aU8skeFCyD
         Ci/RP6rsqtounkmCDwopsfznnRFSdzmmam7SmlUbRXT0eH0KkZvUB1jSJgc41fwxPGyF
         ObJLeGmTPdNgPdsgTrZ5pPWifyFVE1ZEPSPvOJpA72aCA1aMFMl2CRmo2TMrvx/zudBS
         gRhzJYJgkixL3iRZDyAJTvcnLY+Z5ghZrst7r5djtugohbbwVNr+4hsv1RY9S7MaQd6j
         lmJUljAP82WxvsDyMWYIT9/3Cdq6WOq3bblP/atPdjEOXK1m5gD+AEiw8CtaOryPpfrB
         r2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6uft5RuB5hvJEn3VDjDKLac7psIfy8piU8dMk5AtdqU=;
        b=yZ14TOz1xlksR8l3PAA0f80wwx8Vro7IkHZotGvY8DZ6pKO0yiZg9XaYV3wIRfI6a0
         gzBVqe/o059Mo0kQdc56b/YehLAhC6VmHTLQkXt1MFnpBc9rjdhO8bjBPTPhDAERE+j0
         l51cNdJIC3xeW2HOMTesBTvgmhFzZxv9Ep7ZdldEAQVEY1tyrj376C9kfh/Ej60cs4Xf
         EaqslXSn0QDiJr3GplVPqpuQxdK+v6V7AXHwGp1HZpvL93lfu54KC3tBZWzynC/kCZJx
         cAlRDM1meMYKEMAZYrj+1/XpcEM2rvGS4el1mA52dh2KpW3TWQq96cxctXxt5aQcbXlx
         uD8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D1vRv+0x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y73si3366224vky.21.2021.03.02.05.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 05:14:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D1vRv+0x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH4rL-0004AT-Cs
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 08:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH4rA-00048f-Bh
 for qemu-arm@nongnu.org; Tue, 02 Mar 2021 08:14:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH4r0-00086o-2T
 for qemu-arm@nongnu.org; Tue, 02 Mar 2021 08:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614690860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uft5RuB5hvJEn3VDjDKLac7psIfy8piU8dMk5AtdqU=;
 b=D1vRv+0xgBl4ukIWoGGaP45Zl7xTFwl1Vpp5pgTfwL3SoP0DFYXNdotSa4Ci4Ixi20xEwD
 T/SYN39julZ0l1WGxXqbUCUgx3Ie1JTE3y57e2hdvZ0q03X94Wrq+Cbl47S4Izcwjys6/f
 irbiyKu6SG/DNOn4JxVwrmjlp8DHC2Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-MYUlyEbBOw-fGzYsYA9Q_Q-1; Tue, 02 Mar 2021 08:14:18 -0500
X-MC-Unique: MYUlyEbBOw-fGzYsYA9Q_Q-1
Received: by mail-wm1-f71.google.com with SMTP id n17so434868wmi.2
 for <qemu-arm@nongnu.org>; Tue, 02 Mar 2021 05:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6uft5RuB5hvJEn3VDjDKLac7psIfy8piU8dMk5AtdqU=;
 b=ehSTofPlp1f/NMcK9NY2tYaQtZF5puV85yC090euELAMtjt7a5neuZGb99I1tIE6WN
 QdLRejba9rq5YxuikPajl0yw1CqMgE9hVSMeKRVr9V3ux0bAeyjKzot+TbbEXvBiaEp5
 lMOnpLf/WuWRvc0Ugb04PN47wFVIpAEh3rPyLpXD8TdG7M1p2pwLakeaf4JXgLSJXnhE
 3UhO6TKxU+G9Uedrk24fwU4mjHA6gtSpXKuP2SU6ErjWqLCIaRSdoe+ZXWKLbWWl901b
 y6b/oeMwxIYMdgNZMsS+kkk+Hy2WgfUJebKNnffzdMOJMd0dXWZ6vGXoF3dKbGpwNMi/
 MyHg==
X-Gm-Message-State: AOAM532iRTdT3zp3gO05OfXuPu3cCkJwQGuH1J6p7tqNPNCCUApvkQdW
 pVOeAhNdeaaCsIyHgHgnUSScXQ4Jjv/9vvLKREcado1aAkDCtNKVT/2hdr1glHanwSsztnriE3e
 jNtRjzoTTHTPz
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr22267198wru.401.1614690857340; 
 Tue, 02 Mar 2021 05:14:17 -0800 (PST)
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr22267177wru.401.1614690857080; 
 Tue, 02 Mar 2021 05:14:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u63sm2569835wmg.24.2021.03.02.05.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 05:14:16 -0800 (PST)
Subject: Re: [PING] accel: kvm: Some bugfixes for kvm dirty log
To: Keqian Zhu <zhukeqian1@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <a67939bc-7fd2-092b-c36a-c130b1321c37@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d9a1e3b4-6dd6-df85-f882-460d35f888e1@redhat.com>
Date: Tue, 2 Mar 2021 14:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a67939bc-7fd2-092b-c36a-c130b1321c37@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 qemu-arm@nongnu.org, jiangkunkun@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JVr4DCbkFAEo

On 02/03/21 12:43, Keqian Zhu wrote:
> Hi,
> 
> This patch is still not queued. Who can help to do this? Thanks :)
> 
> Keqian
> 
> On 2020/12/17 9:49, Keqian Zhu wrote:
>> Hi all,
>>
>> This series fixes memory waste and adds alignment check for unmatched
>> qemu_real_host_page_size and TARGET_PAGE_SIZE.
>>
>> Thanks.
>>
>> Keqian Zhu (2):
>>    accel: kvm: Fix memory waste under mismatch page size
>>    accel: kvm: Add aligment assert for kvm_log_clear_one_slot
>>
>>   accel/kvm/kvm-all.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
> 

Queued, thanks.

Paolo

