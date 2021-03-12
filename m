Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1067946lfg;
        Fri, 12 Mar 2021 01:51:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfsp4LdClWisjmaH3yE2ks+xxgUjH9p8U0SgZ3DxDx37HKAV/0KTj0CbNj4u62cFfhOYXn
X-Received: by 2002:a25:ab82:: with SMTP id v2mr17913020ybi.97.1615542674452;
        Fri, 12 Mar 2021 01:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615542674; cv=none;
        d=google.com; s=arc-20160816;
        b=UYkqnoqc4i6wgN2RMKg0O8MXe3QfPsJvlk/+Na0mstEyZnmgVj0R3KpSdQK90+c9EW
         1DsNBi1LgEyZea3I52FGOt97cpag2nQhV5fcy4fgXePChiupf3cUd8AN2jCz12r6Dq2t
         xjQZcc6OdKSidC0rD/s5Xc3hKBqmjvkvq2UIRT8pq4le9+vRCum7IZO2xLRlXoF1uiBS
         Z06fcRTSzU0Igd3s68lqkz51ko72CGrQeFH17a0E5ekMuXiMyvSNNR6sgSMYU2alTEi1
         WCzWgfsji0W6xiinbXkPVsn5ksUp3OiLkipUcHWa7xiSw/K3xLnis7FdaHYuRizfHobR
         4Wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8+QQ3L72ZvCDp5QYavE+Fdl92Bga421vHIaktO+mpV8=;
        b=qmmPiuw81XoR4Ah2FILUyZ7wyU1ps+UG7CHoddBIHBIf+60J2v54K1KuVHwYKJ3vkY
         ZBzFf85I86RR1mhpifsLdYnYtbO3h9oxPoSjKjYE2E8yq69rxIr18ICD9lKbJOPSMFtY
         +a+BqhmsqTZJkK4RfIHmkeddfaePw0L2gd6t40gAN3WzMcbbzX93f39bKDi5NBI1KBnH
         D+gOsqYIjNYfoJDBgs/tCmoh7JOE43bP444d/BfuNnpoocP1AcomDADOZ2vTMy6a9zoR
         QOAPD6prF5Ts1oxnvO7mduIFfSyEfoJnqLvc/7FkpIE6J+OELuv2VtFPbC4wJb6SBpHV
         CqeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ioqoPGkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si6050068ybo.123.2021.03.12.01.51.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 01:51:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ioqoPGkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKeRt-0006d4-Ox
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 04:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKeRQ-0006aK-TF
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:50:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKeRP-0004ed-4U
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615542642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+QQ3L72ZvCDp5QYavE+Fdl92Bga421vHIaktO+mpV8=;
 b=ioqoPGkliifpBFqMw1cvvSlNaN1KWk5Yc+54U2SXew5mPlyb4Lh++Knml7fQlyIvZaPZvb
 yO5VnqLAhmIrqEv7lg9SoVeAp5if6BZm+Qm1qn7Cj9XQcp3Bkxd3/sO9WY45aCnMdEm7a7
 aRysekfwlOf5K2/b6oNVyjHslH+rsmg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-oc03U4pVPuOev2RXgx0Xhw-1; Fri, 12 Mar 2021 04:50:38 -0500
X-MC-Unique: oc03U4pVPuOev2RXgx0Xhw-1
Received: by mail-wm1-f69.google.com with SMTP id m17so1897943wml.3
 for <qemu-arm@nongnu.org>; Fri, 12 Mar 2021 01:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8+QQ3L72ZvCDp5QYavE+Fdl92Bga421vHIaktO+mpV8=;
 b=a4vBP2tA7utILl24t9K0Yoz6HGt4P5hi8XRtnieHSzoJ0Ia//GgdckxvqaikdneoEn
 PRIVNZK7dpcj1uTg6c2S0yl0M8lQA4IgRwgZfWZf2eiDAC1dVSTZq8vw5/o3Xr2Fxbvb
 rkYOGVwWczoRw7EUgGTeymoDS1VB6u3LIAzGCwrAfQWgoLyYeZ9L5OAbSLpQj39DhmfI
 2sAiVvYKUgDiHIaoLXGWHINtM1auQaDRxgdao9kn9S4eArRFkiT/uglJAKV54pWg4KHU
 NBjQDBpBiBkW/z6YdBgwAIwxwT7O9kEEBrtH8/HU/yfQd+BrgDAn1BvyMOePSstvw2vq
 ELyw==
X-Gm-Message-State: AOAM5304ql8ZzQHFwiWcT+ijymQlg97WMcvICpgPVWubhimoHqW1qscZ
 91QBEHwsmCh7J1VHYeLVmt94bYa+WNU70k5JMs1bdFu9gU6C/qFWlfAWahvFY/Q7Afh0uYWEZah
 wp7sQ6OjXCuIq
X-Received: by 2002:a05:6000:11c1:: with SMTP id
 i1mr13049481wrx.215.1615542637147; 
 Fri, 12 Mar 2021 01:50:37 -0800 (PST)
X-Received: by 2002:a05:6000:11c1:: with SMTP id
 i1mr13049451wrx.215.1615542636920; 
 Fri, 12 Mar 2021 01:50:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id i10sm6773084wrs.11.2021.03.12.01.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:50:36 -0800 (PST)
Subject: Re: [PATCH 4/6] qtest/arm-cpu-features: Check KVM availability at
 runtime
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Thomas Huth <thuth@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-5-philmd@redhat.com>
 <4c8f9841-1fda-db4f-57fd-bf764f3a0962@redhat.com>
 <414c6e5f-2a7b-1c4d-46b7-53aadf592dfc@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7bdd024e-a561-9a48-a0e7-c007f6ca60d8@redhat.com>
Date: Fri, 12 Mar 2021 10:50:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <414c6e5f-2a7b-1c4d-46b7-53aadf592dfc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: radCsn4owXIJ

On 12/03/21 10:32, Philippe Mathieu-Daudé wrote:
> On 3/12/21 10:05 AM, Paolo Bonzini wrote:
>> On 12/03/21 00:12, Philippe Mathieu-Daudé wrote:
>>> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel
>>> tcg "
>>> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
>>
>> Wouldn't qtest_init simply fail here if KVM is not available?
> 
> I guess my previous approach was what you suggested.
> The previous patch (bios-tables-test) is a better example:

Ah no, qtest_init adds "-accel qtest" automatically.  So this patch is fine.

An alternative is to first probe accelerators using "-machine none" and 
then skip the tests *before* the call to qtest_init.

Paolo

>    g_autofree char *args = NULL;
> 
>    args = test_acpi_create_args(data, params, use_uefi);
>    data->qts = qtest_init_for_accel(args, "tcg");
>    if (data->tcg_only && !data->qts) {
>       g_test_skip("TCG not available, skipping test");
>       return;
>    } else {
>       // check data->qts or the following will abort
>    }
> 
> Having qtest_init_for_accel() calling qtest_quit(),
> but this makes the tests logic more complex IMO...
> 
> Is that what you have in mind?
> 

