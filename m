Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp915683lfo;
        Thu, 28 Jan 2021 23:50:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIOY8y237SbUZK4RFWnvoupPEgGpS3W084AvfEmtdB89xnoivQ+Ssp76Ohf6jkV/1sctUB
X-Received: by 2002:a25:c244:: with SMTP id s65mr4619227ybf.128.1611906618757;
        Thu, 28 Jan 2021 23:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611906618; cv=none;
        d=google.com; s=arc-20160816;
        b=Anusm6edguLZD3ZgBNeqi+lnJmEY7d+I4P3TmGm/OUgEwlF14kRs4spdTRJQYaibce
         qyOzylBWp8dHuczvXURdJhLKd7UGn9ilp6iNWuomUDvtfyt2DrjH/bX6nV2HsQabHmHG
         fh/QjZ1wo4RqpcOM4GoYtEV+q3ZVruSIvZ604Go+JpRh8JMH4Gp3OA8xdvKlVnmwLYRf
         GYGdgT5hcmjTphgxAkpVSnxmEVvI5IVGoUMRYN5vRmvthouL6v8mDjwNvyu91NHFLaPi
         E12QNSbXnW0QRw7afsKS4/AFZBeabyZW1jOEgIQS3qBk61ozwzRQaQ9h0vhV3OxhCaYv
         QDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1yyT7ljPAJOw7efUdqwpwE7JHJhtQxFtsvtnJrgCkJc=;
        b=PeCDRXUJLgAoG3qafml4c7u+NTbFnqLtCvJz6otz09rR1pTjzKwpupXztcJhJF2gPw
         BDf6cbfvhaDKhkMBZcnQMRLGvpnNlWPLLwT6u9qvUHfWQlt4ZHe6RGJblwY/FC9tzG2d
         UhccXOqI5ln6RFO1XzmwOUHxTbsUOf9wQbcHvOaxcAvD8aP+xt0j7dzPDkMpmWuKWmD0
         fs6xLOPyJPqHZvpfDiZrBo7nBC/zGev4MbH61+/TKJGFYQg7JuQVZ/jOBT29JOGv4GJ+
         LBJFelz04T0CNtREgPVclE35GUyJut4o0tpzXL3wUzwFFbBkB82CY3KU2Uom+cPex4y7
         qJuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ngkrqmsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t39si7711200ybi.19.2021.01.28.23.50.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 23:50:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ngkrqmsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5OXo-0003n3-PI
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 02:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5OXc-0003lP-DW
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 02:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5OXZ-0000XZ-LL
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 02:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611906600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yyT7ljPAJOw7efUdqwpwE7JHJhtQxFtsvtnJrgCkJc=;
 b=NgkrqmsibO5AdQZ1HkaNs7EMgaiv2sAN8ollieHiUeb/XaMGfAkl4bpSqRVtHN7wAj7mJ0
 dMuf6EUE6yC2Ib3ZiATlDEX6ZiMFt98LrWVCMJedi/FFqY5y4SfqZquYAPmyu53ZITsMxz
 7EgAyFaNQhqlFh9/6kcxepoF/OtahLA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-wf8bU_m2PJat6ifOUMrhNw-1; Fri, 29 Jan 2021 02:49:58 -0500
X-MC-Unique: wf8bU_m2PJat6ifOUMrhNw-1
Received: by mail-wr1-f70.google.com with SMTP id l7so4627046wrp.1
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 23:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1yyT7ljPAJOw7efUdqwpwE7JHJhtQxFtsvtnJrgCkJc=;
 b=Zu1i4yATtjeB9WLdVI1A7t+7Wx5qzDIbyd4Jk6aREgnuysFv8Z6LqDt3JE22b43Ki7
 AyzlXFx92CexAdG/ILU/EnI/h74onKohjg9qDx4O5Bcyr/ZTaBWvF/S6Y5PRL2t6Q9pP
 wkqgSRYcZVUPt3OXuFFlgFX9exuwW7hqnlx66N7F88Delvjp1akSLuXEbMz3aDx14OtU
 Ieg5nZXUTVVRTKlEJ9+n0ZTKVheSda5gtod1rKUcgZb2wc1i86hczmf8jJFHUcrJxnEQ
 JK1+VowZFabxPPdOZch4XQJLQJHDYw3Q3nsYOaB7QZRKhzfgXVmXVptNq/lb1Y/nB9Pp
 VK0g==
X-Gm-Message-State: AOAM530J3lZMij/bvkyiO8JimXBswNWapzhWwOkplatTKfub677+H22N
 Mq/r8Lbb0Au3xQF+/ZZNSgU6D0ZpIXZkWDuRW32ARJQkulluLaWSbIH4q0l7SlXeI4g61bVUoP7
 f7ZmjUKSGZKJt
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr2560631wml.110.1611906597628; 
 Thu, 28 Jan 2021 23:49:57 -0800 (PST)
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr2560597wml.110.1611906597264; 
 Thu, 28 Jan 2021 23:49:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d17sm4591500wma.2.2021.01.28.23.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 23:49:56 -0800 (PST)
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
 <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
 <20210128200223.GJ2951@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d6825e67-3533-ab81-abdb-16c2ab71cfe7@redhat.com>
Date: Fri, 29 Jan 2021 08:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128200223.GJ2951@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 jiangkunkun@huawei.com, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wluB0gXpz/El

On 28/01/21 21:02, Dr. David Alan Gilbert wrote:
> * Paolo Bonzini (pbonzini@redhat.com) wrote:
>> On 11/01/21 08:34, Keqian Zhu wrote:
>>> +static void vfio_listener_log_start(MemoryListener *listener,
>>> +                                    MemoryRegionSection *section,
>>> +                                    int old, int new)
>>> +{
>>> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>> +
>>> +    vfio_set_dirty_page_tracking(container, true);
>>> +}
>>
>> This would enable dirty page tracking also just for having a framebuffer
>> (DIRTY_MEMORY_VGA).  Technically it would be correct, but it would also be
>> more heavyweight than expected.
> 
> Wouldn't that only happen on emulated video devices?

Yes, but still it's not impossible to have both an emulated VGA and an 
assigned GPU or vGPU.

>> In order to only cover live migration, you can use the log_global_start and
>> log_global_stop callbacks instead.
>>
>> If you want to use log_start and log_stop, you need to add respectively
>>
>>      if (old != 0) {
>>          return;
>>      }
>>
>> and
>>
>>      if (new != 0) {
>>          return;
>>      }
> 
> Why 0, wouldn't you be checking for DIRTY_LOG_MIGRATION somewhere?

Actually thinking more about it log_start/log_stop are just wrong, 
because they would be called many times, for each MemoryRegionSection.

Paolo

