Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp266265ejn;
        Thu, 20 Oct 2022 05:01:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM620SHC+WwsEs2EjjeBTYMVGNkk4S2xB533MEEVN0KGJ0sWlhBNVzpKOxuS2tSXOyuBRk3D
X-Received: by 2002:ac8:7f16:0:b0:39d:a58:5484 with SMTP id f22-20020ac87f16000000b0039d0a585484mr2312488qtk.381.1666267268527;
        Thu, 20 Oct 2022 05:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666267268; cv=none;
        d=google.com; s=arc-20160816;
        b=iQXnxoi6kwMOnOp+6eUR3RywjmhOjx6de3u7S868pl712VcGDsU0Fr6B0vY3D4XoYB
         eMOjP59skk8W79mvH6pP9vssTaEfw29dSd1DElOgFzZvsu3/yevuIGkpZgSROm5Fsb75
         HMtNdjAxvbLJ0xjmfQjVtsH8odl+fq1T2ynkIdPnOfgZhjRJybH6lvQD2oMl526z2J6s
         YybK7aEScJVhWXtCPfHEiqX4izZA3cLCSxA6VTIluJ9ly6KOMFShYw2qsVfhAQIglWRg
         Nb/IELOo+/Wf5lAkjg6nnqlTvpVNoex+m4rDGuZldBKFiiiKMgV43ZWb7GTYyROxOAYg
         vgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Icpr9TIKW3pdbwf7eBbyJZbn19syVkSVZM9f8vHXz7E=;
        b=Zkk2ThoI+pz7AxoBnPxKsCPQ8v4x1jAnhG4EIdclMdLq7trW4kuaMHG8cHxpmKeimP
         Cv4u4J5iWlZtWSZ5sO6Mz6Gi5Fecyzcqxm/KOsqvrj8Dsht1Yax3/lHouZ19SbemQ3Am
         Lz4CR9nWUUPVyhyt3CU3mo62Vj3O91Wo7YGivgv9cMt4ODW2YPa+SyR5GmFNZmdhmL+R
         Xf7ylCMASYmB9eUi64uG9R2So6LQixPSPQZw3g02gv+u9HpOQ5lk/HJtMJFjAZ29Jw7e
         jdF35Q2owDHqQ93d3Kd3YjUO0bKwcXcMbwCMDpYBuw+OaKo+4KkSrDMPUK6v/EaAyJ2L
         hKuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UXpcdZyE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1-20020a05620a240100b006bc62fc0712si10610065qkn.262.2022.10.20.05.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 05:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UXpcdZyE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olUE7-0000ui-Pa
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 08:00:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olTyP-0000LP-VC
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 07:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1olTUm-0003bJ-Qh
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 07:13:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1olTUf-0006qL-UT
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 07:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666264419;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Icpr9TIKW3pdbwf7eBbyJZbn19syVkSVZM9f8vHXz7E=;
 b=UXpcdZyEXZCOZd24kCnyTxfh803cx3GBEs5fz+zmsxO2PlO2+TwgYv4hk6Cfo3cPBORcCj
 NCaz8wzwlGVhw6KlFmTATuo0Aq0T26SFz38Rp6qCisysMqyrTEJdlDvrWGSLjIt3lpiOSz
 85v2HzmSTCCeS5XIzA//0LA2n82vYXE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-mmHrmiQsOJu_ndMsSvUcIg-1; Thu, 20 Oct 2022 07:13:35 -0400
X-MC-Unique: mmHrmiQsOJu_ndMsSvUcIg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05DF01017E6D;
 Thu, 20 Oct 2022 11:13:29 +0000 (UTC)
Received: from [10.64.54.70] (vpn2-54-70.bne.redhat.com [10.64.54.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 585F049BB60;
 Thu, 20 Oct 2022 11:13:20 +0000 (UTC)
Subject: Re: [PATCH v5 6/6] hw/arm/virt: Add 'compact-highmem' property
To: Marc Zyngier <maz@kernel.org>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-7-gshan@redhat.com>
 <9a43b31a-63d7-d312-870d-168df1b41921@redhat.com>
 <6566e453-9b05-7092-f112-ea9e523be8b4@redhat.com>
 <865ygeg77q.wl-maz@kernel.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <e21444e9-f7b4-1006-7a2d-ca36afcdfde2@redhat.com>
Date: Thu, 20 Oct 2022 19:13:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <865ygeg77q.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +pYkkBHcSUs9

Hi Marc,

On 10/20/22 5:44 PM, Marc Zyngier wrote:
> On Thu, 20 Oct 2022 00:57:32 +0100,
> Gavin Shan <gshan@redhat.com> wrote:
>>
>> For Marc's suggestion to add properties so that these high memory
>> regions can be disabled by users. I can add one patch after this one
>> to introduce the following 3 properties. Could you please confirm
>> the property names are good enough? It's nice if Marc can help to
>> confirm before I'm going to work on next revision.
>>
>>      "highmem-ecam":    "on"/"off" on vms->highmem_ecam
>>      "highmem-mmio":    "on"/"off" on vms->highmem_mmio
>>      "highmem-redists": "on"/"off" on vms->highmem_redists
> 
> I think that'd be reasonable, and would give the user some actual
> control over what gets exposed in the highmem region.
> 
> I guess that the annoying thing with these options is that they allow
> the user to request conflicting settings (256 CPUs and
> highmem-redists=off, for example). You'll need to make this fail more
> or less gracefully.
> 

Thanks for the quick confirm. The check is already existing in machvirt_init().
I think what we need is simply to calculate 'virt_max_cpus' with consideration
to 'highmem-redists' property there.

     if (max_cpus > virt_max_cpus) {
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine 'mach-virt' (%d)",
                      max_cpus, virt_max_cpus);
         exit(1);
     }

Thanks,
Gavin

