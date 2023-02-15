Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp377571ejb;
        Wed, 15 Feb 2023 02:36:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9OAv8nt6ohSW2QNYkGX6i4E/ez4FW9zSqVB6DKZrz1HFw26bNkUKMGNBMky6Cd/xdZv3aH
X-Received: by 2002:a05:6214:252b:b0:56e:bd59:40f1 with SMTP id gg11-20020a056214252b00b0056ebd5940f1mr3382518qvb.48.1676457396288;
        Wed, 15 Feb 2023 02:36:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676457396; cv=none;
        d=google.com; s=arc-20160816;
        b=mo/h/WCpojqbLA96PJc/Xo/WsMewyWApIHXIjEvt/Ifs2vwAJ1GL1Ti+bsXKCPFUIU
         PN8o150t6kmo5N9yduXLCbuIJsCsJ2YJV5ra3XzDzzVoqRDSTNdupFJ8gfWwfuZ4dznc
         qFWzVupylIPe/Hb7rz0bYKwm3WjVcVAQQ7VMxADGNC33kjyu9NeKdBj//K2Yb3yPpg0s
         Ab2K1D+M/8VVSaSGE9/fV8MfzkwvMKK5bLC92yEne/Se/z2frlFtAlyd2zBXcaSEaWeB
         SaukCZ67Px2ZkFYwlLV48/6UgjSvBotIrVMMZyvoCZAMke6WdZ350bHDPq4hf3GLQpnB
         mw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RD2vdtD2hCDoDpOR7tgSDmxAVUUdTeXI5S6eB2JsfYE=;
        b=DFLsUJCOs991Zz1+ML8zoZeppeS+5tPBvHUkR8uNQDEEx9vVLCM5vFt5jZq5AOS8OH
         9SoCqH3W+svvRwHGZfjuoWkeZrl7xwZzrwQB/6chuP0NOijmYeIWhCsFLB3wqvPbOo9Z
         Sut1gv8XVQF2zHmxTD0hal7f0kDz2908EVq9RUCqVD0giL8f3cfIUqpS8eRoLz64hVfY
         830cd6ThksnphFoYoPPKAFeJQSjJE2tkm6YM3K3FI/XW0oO05QORolt6BhdTrQq4NaHs
         l/VKD2Ht9EdEOquszxP2YvGN2iuruj+4XmQB6XFt3C/GlKNVKuiDD6WrPDdYDTlG3zpU
         OQrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Bu3I9z/m";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4-20020a0cf544000000b0056e90e0e936si11981235qvm.58.2023.02.15.02.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 02:36:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Bu3I9z/m";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSF93-0003fE-Rt; Wed, 15 Feb 2023 05:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pSF90-0003eI-FV
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 05:36:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pSF8y-0004tP-Q3
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 05:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676457367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RD2vdtD2hCDoDpOR7tgSDmxAVUUdTeXI5S6eB2JsfYE=;
 b=Bu3I9z/mlEAurLdRSwhlZRm9UEiXly16qXa5hvkYuDGKqUvfByKasFUkTi6nWcusKlGkkB
 7ShA0I/NPIf7tnmsIIb1UwVbdSPltV6ZB+LY5QXTouZNDVup3hQkThJ4mmwyGNK3WpWiY1
 ZYpkPVAsX5Lk7RYojea/yHWN7urL6go=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-101-T5xQDf3pPiqIE22pogNM6g-1; Wed, 15 Feb 2023 05:36:06 -0500
X-MC-Unique: T5xQDf3pPiqIE22pogNM6g-1
Received: by mail-qk1-f200.google.com with SMTP id
 c9-20020a05620a11a900b0072a014ecc4aso11194069qkk.18
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 02:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RD2vdtD2hCDoDpOR7tgSDmxAVUUdTeXI5S6eB2JsfYE=;
 b=SGaJ/LoLP2r0P6TAb56jeQ2ofyeImdKG2hd1gXgT7GLeWqv7B7pphWocycfUbmE3BA
 b93gmBW6oTHKLgThuYXRu7UGpj9WGgj1HeMP5xoZMahqSma0ISDdDfoUiUfUg4tNua/8
 2ASIag44DPM8APw4I6TmCz+9RBhM9nssK2u8724+87aDOzpYejJuhxxeRF8CCASqm8nn
 brspDEoqKBtKTmrs9vXcaNgSVriPvGFppSL5F0qkxKZ3iUAOpNMIuLsUQrWD25DRJpZ6
 Yfcne46BCCofFBRJNizzR0lnBUEPDWxumcK3PAhSz1I3FSCFrC0IKzuc0XHoew3LNy5q
 v8TQ==
X-Gm-Message-State: AO0yUKWTDo/grLpuQaWym/L8q/RPeHEoMGaq8DpUmh8yMHEadS50/SsP
 T4mT+V1S0sGBbsWU1ckvI667rPM4q9WhKg3W9f76384A0WQFY/qBD+lO8art5SlZ1GywCjBz3J0
 i7D4xeG8K0I/+
X-Received: by 2002:a05:622a:1c9:b0:3b9:a4ac:9109 with SMTP id
 t9-20020a05622a01c900b003b9a4ac9109mr2752667qtw.64.1676457365701; 
 Wed, 15 Feb 2023 02:36:05 -0800 (PST)
X-Received: by 2002:a05:622a:1c9:b0:3b9:a4ac:9109 with SMTP id
 t9-20020a05622a01c900b003b9a4ac9109mr2752638qtw.64.1676457365481; 
 Wed, 15 Feb 2023 02:36:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 k9-20020ac84789000000b003b2d890752dsm12743026qtq.88.2023.02.15.02.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 02:36:04 -0800 (PST)
Message-ID: <f24a826e-2f90-d23a-c3f3-5985e90814f2@redhat.com>
Date: Wed, 15 Feb 2023 11:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
To: Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
 <ecddd3a1-f4e4-4cc8-3294-8c94aca28ed0@redhat.com>
 <14188fd3-6e97-3e00-7d54-7f76e53eeb22@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <14188fd3-6e97-3e00-7d54-7f76e53eeb22@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: keMsidyXp3IW

Hi Richard,
On 2/6/23 19:27, Richard Henderson wrote:
> On 2/6/23 03:32, Eric Auger wrote:
>>> +void kvm_arm_enable_mte(Error **errp)
>>> +{
>>> +    static bool tried_to_enable = false;
>>> +    Error *mte_migration_blocker = NULL;
>> can't you make the mte_migration_blocker static instead?
>>
>>> +    int ret;
>>> +
>>> +    if (tried_to_enable) {
>>> +        /*
>>> +         * MTE on KVM is enabled on a per-VM basis (and retrying
>>> doesn't make
>>> +         * sense), and we only want a single migration blocker as well.
>>> +         */
>>> +        return;
>>> +    }
>>> +    tried_to_enable = true;
>>> +
>>> +    if ((ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0))) {
>>> +        error_setg_errno(errp, -ret, "Failed to enable
>>> KVM_CAP_ARM_MTE");
>>> +        return;
>>> +    }
>>> +
>>> +    /* TODO: add proper migration support with MTE enabled */
>>> +    error_setg(&mte_migration_blocker,
>>> +               "Live migration disabled due to MTE enabled");
> 
> Making the blocker static wouldn't stop multiple errors from
> kvm_vm_enable_cap.
Sorry I don't get what you mean. instead of checking tried_to_enable why
can't we check !mte_migration_blocker?

Eric
> 
> 
> r~
> 

