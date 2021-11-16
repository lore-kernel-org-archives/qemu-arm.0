Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp7305353lfk;
        Tue, 16 Nov 2021 03:11:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmj7m3zTZ/qD+xnJBoWLiHWhv732TJeBhuuxATXx7Pv/cuXBlEQcEyuHalftEIFYeoqeor
X-Received: by 2002:a1f:2c13:: with SMTP id s19mr28050940vks.8.1637061111874;
        Tue, 16 Nov 2021 03:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637061111; cv=none;
        d=google.com; s=arc-20160816;
        b=Sj7SzGa0tZEjGBQxzuDlGRy3gr1CODwX9tupHMdbLdhhTyqpo2Mo9GXCzduzEvQXZB
         2iAPT7V1LhgjrqXd9t2bsdJyinKJ6CIMdJKRx4ar5tWnkimcYtKSsj0euqYXub+mIkj5
         RkEDdAwuMrWaGF3t8nW1N9VAzFtJ25NQzvfkunkuCSooXBLP85XeTNPX/f5g1RsuVY5F
         lrMPQO8lok/BGg7qvAlLx0DlTIS88JnBihbacxhiCI9kYfhGmC8c8Cp9Q2LnOXyk+PeF
         eUDcCD76cQ2O4FC8IzMPa78aFhsEF98cijZiEWV8yyTYP+327hfciGm9ziLQLB4Ehatv
         qB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=CkolIweQscYOPDXfCjJTBsMGMCH+H0slToqry6VpWZU=;
        b=kUBYGAbkrDk5HachaRF4A8wpZzSuyJbopmWZcbi/bSu/g7g0xHwicrRDRAMWT4gLzf
         YHQGUeHKV0rFtiaZeLdesBC6EHuxatUTChNK62QtwqwM8vTbUlOwSobvNnGAVhVh4Fdf
         xCRQtEct74AVrMSbVnqIp+0SruoTLbFsnofolL1XnS1Ml/3H+NtysAQSgOHcBIPGcmpt
         c6cusRiJUa6QWbJ3LmCjZTC8YX7zqzuuoUE0mRO4ONhbQ/FNqPKBO0HpBvvxTj5KerKG
         k8VPG6Geg6t8d5bgbZyupSS203ptcPlLWtKoIztT+w8AUhPx+YgcpxqqYHyW///BXeXR
         tQ8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="F0rpxsf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si23865403vsr.400.2021.11.16.03.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 03:11:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="F0rpxsf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmwNT-0002H2-7a
	for alex.bennee@linaro.org; Tue, 16 Nov 2021 06:11:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mmwNH-0002Cd-3G
 for qemu-arm@nongnu.org; Tue, 16 Nov 2021 06:11:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mmwND-0005mX-68
 for qemu-arm@nongnu.org; Tue, 16 Nov 2021 06:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637061093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CkolIweQscYOPDXfCjJTBsMGMCH+H0slToqry6VpWZU=;
 b=F0rpxsf/NFfc4Q7FQo32WriYnnJuHm9lOQwy/v7XU891J+4Lf0f4yAvH976wQ9jWUzJvHN
 l+sBNGYIWWvyWMh7uB2cAcDruNqmK2DQouqlxwzmrSPCnW8vcGq/mDN19UCd6t0YVTX3Nw
 FPqaZ6sw6JYOq53zbAKhOXpbEw5I0ps=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-JsxYqCj9Mji4wNCtRQM6lQ-1; Tue, 16 Nov 2021 06:11:32 -0500
X-MC-Unique: JsxYqCj9Mji4wNCtRQM6lQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so1304735wmb.4
 for <qemu-arm@nongnu.org>; Tue, 16 Nov 2021 03:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CkolIweQscYOPDXfCjJTBsMGMCH+H0slToqry6VpWZU=;
 b=3JXAd9FQKgVg2bF5qEhu+rEhrzQiRlkshQgQ6cGIdqsXjL+hZ/oo0HGvGdzGfdQ6za
 /VEPk0RyZqTTz/AxUbMYZG/qg1FNP/IbUMqf/M/37h2Ck8JJQ6S91LOTA6FRmE0hN8Ze
 sJ0qBhgDOnWLUomrnvh+Pft/aM4PLFMxNMtPhyD+GHQfFlc0al2QN+WxfQA7kCZZPbGH
 +b0snvJm7jlAE07kAaYaE7804IY4IK2ER9Lfy++4XVEq0lLHxkrp0wDbUp//9LamWcfr
 BMyz6s2aGk9TH/2DElG83gkuqRfYAzkBUkXf3/NvBQfl8X1FaeI0TQ4lx9NnVdAb3FtF
 5WFg==
X-Gm-Message-State: AOAM533FWH7MWTMsfni3bU4mb+TEwyavwKkWTYeF6BGxAMw1JpoPNFPx
 I2Jxv4O0HvyOzrKvUcgyvJB8xBRJGejFGXktP4mbmuFdPhg68znCU5CmuNWeVNCVQgK5B5J+lrq
 8nYlzGqVBvwkl
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr8283424wrw.104.1637061090908; 
 Tue, 16 Nov 2021 03:11:30 -0800 (PST)
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr8283394wrw.104.1637061090728; 
 Tue, 16 Nov 2021 03:11:30 -0800 (PST)
Received: from [192.168.3.132] (p4ff23d3a.dip0.t-ipconnect.de. [79.242.61.58])
 by smtp.gmail.com with ESMTPSA id
 m20sm2353656wmq.11.2021.11.16.03.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 03:11:30 -0800 (PST)
Message-ID: <188faab7-1e57-2bc1-846f-9457433c2f9d@redhat.com>
Date: Tue, 16 Nov 2021 12:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
To: Igor Mammedov <imammedo@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
 <20211110113304.2d713d4a@redhat.com>
 <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
 <20211112142751.4807ab50@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211112142751.4807ab50@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 Gavin Shan <gshan@redhat.com>, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GzNLEzkYxCAd

>>
>> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
>> this memory is exposed via cpu-less, special nodes. In contrast to real
>> HW, the memory is hotplugged later (I don't think HW supports hotplug
>> like that yet, but it might just be a matter of time).
> 
> I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
> some by MEMORY entries. Or nodes created dynamically like with normal
> hotplug memory.
> 

I'm certainly no SRAT expert, but seems like under VMWare something
similar can happen:

https://lkml.kernel.org/r/BAE95F0C-FAA7-40C6-A0D6-5049B1207A27@vmware.com

"VM was powered on with 4 vCPUs (4 NUMA nodes) and 4GB memory.
ACPI SRAT reports 128 possible CPUs and 128 possible NUMA nodes."

Note that that discussion is about hotplugging CPUs to memory-less,
hotplugged nodes.

But there seems to be some way to expose possible NUMA nodes. Maybe
that's via GENERIC_AFFINITY.

-- 
Thanks,

David / dhildenb

