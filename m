Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp2237856lfd;
        Wed, 27 Jan 2021 04:46:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwicbJYEr0ORYRioIYrdKYUDXhmmPW/tBmRdWuhOFrcToWDSD+Vzgyqv0UWqHNUmDPb0Fi4
X-Received: by 2002:a5b:751:: with SMTP id s17mr15805656ybq.299.1611751610043;
        Wed, 27 Jan 2021 04:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611751610; cv=none;
        d=google.com; s=arc-20160816;
        b=H/PzZVv2gUdm2u1p4mS51B1sxbWVPM15gvJEMvfnZqkNha6LDfarkPuTs6s5+vpu1P
         VVDq5yqcp3/1vzcbipHC/0xB/rgIq2NNtV69MIRKZF3eqUGoaoSyWBt56G2NmAKTppoz
         dsNNZH2KxL7ay1hR4iTkkeAPFiBE78yNIsZ30oIqER6dcIy/cCM+uakQqjxBLKCVDhvR
         K5oPYdiHNkSMobFljuOKEiNX2XYppvKepGtr4X6wUAYXCdjwDlRiWrUmK49lmEZUJdpr
         5kAybzrLJMTEBWFtrosXbRsOu2jAc6KfzMN0jotfP7aOlXWoOApmxAlh8n8zqYTudDss
         7wRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CIwJVP8XTwkEwGc2lclH4Er1kq3hZ3+j54OcUbnlBHg=;
        b=J7305UGNjG1IHE2tFi7k6RhSu/bCK7MWU9iA0BdPYZ/czgW8lh4+nR8+LICV8XvaIl
         lQJwSabwrnKID/4anFXwrGv0aaxWik/Tnx/8iBAhR8nMWfosDI6lPKGeFxAo0hSWyT1o
         HuJWxNnL/57Y9dDyOrUSbDiEP9ERfaNfXf+hWmMNwX4osumVsCpx+J3XgrsuuxRoouCr
         I0WlJqkIP0iH8J+AtcV+KxGp7uB6+s5D+mMu2BiZfslCpy7GGmEY+/+Kif/Vdrbjfecq
         XZiLhYhhpQqwjrHBZrCVk2h7GtGWlGHIlEkGtlG+Mb7JVj1yqEzg9D8qdRAOeopUqEu9
         4/5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pzp+aeXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q82si2151097ybb.349.2021.01.27.04.46.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 04:46:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pzp+aeXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4kDh-0006hM-Db
	for alex.bennee@linaro.org; Wed, 27 Jan 2021 07:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4kDX-0006ff-Ja
 for qemu-arm@nongnu.org; Wed, 27 Jan 2021 07:46:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4kDW-0004av-2a
 for qemu-arm@nongnu.org; Wed, 27 Jan 2021 07:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611751597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CIwJVP8XTwkEwGc2lclH4Er1kq3hZ3+j54OcUbnlBHg=;
 b=Pzp+aeXxBmBYV7mntgSMpqCyPFpyp3RKg37/9H4tZ0t8fs1PzXgUZxFc3LA+6mJqMUe5Fk
 fhVG3RkQIq/mYHkVFAljZJgTzbuW3/O8RJccH/gA2Q4YRKs3F4A7WqQ+fiDoZT2s+tadAk
 CnCj2GpubBnI6HoO1a18lumBfAalzNs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-onFWom5jMHC4BuV1NUlJXg-1; Wed, 27 Jan 2021 07:46:35 -0500
X-MC-Unique: onFWom5jMHC4BuV1NUlJXg-1
Received: by mail-ej1-f71.google.com with SMTP id gt18so600220ejb.18
 for <qemu-arm@nongnu.org>; Wed, 27 Jan 2021 04:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CIwJVP8XTwkEwGc2lclH4Er1kq3hZ3+j54OcUbnlBHg=;
 b=NWHZK2Vg4Z+wpVZBTW60+WenHgNuGWWLAiKluTBQA3cNcjI9IMAS5gg7CdlABlMlrA
 HzI5CBgQ/R+96OL8kG7tUW35oEPojzlRIrme0Z46CA3cqwiBn6lFofhFiC1YrWbsupqy
 +OQZEWtu4d3eGi8PzPVQxlOcBnp+U2pNuJcv6m4n1ltIQOxzDWeisXwKpac8uHyJEeBS
 dwaoNuxH7mhrKi7tnLRHAypHsxEXKol0rdS5JZMtU7z0KN0nauotTfhCuftQc4lWi2kd
 ZoV27atmK2Pz9XXEzJIbsYCuds7ztEWU52Jh4elJGhAxLSyaDZIMHrBppoYQNCDBzHza
 3niQ==
X-Gm-Message-State: AOAM531yJmvKNxZvcL4qpFZ5C7WXqQFsdfN0qUtgfBoFe7RjeNAiDkOd
 HMm258jzX3OjZRDHHWNGAterjUTSgp+Hgm1HJjN55nqBMbqBxXFlOw+1vLDCzKE4ADBIrMDPGBP
 Tvz5PyWxVwcDJ
X-Received: by 2002:a17:907:abc:: with SMTP id
 bz28mr6621379ejc.395.1611751594510; 
 Wed, 27 Jan 2021 04:46:34 -0800 (PST)
X-Received: by 2002:a17:907:abc:: with SMTP id
 bz28mr6621359ejc.395.1611751594318; 
 Wed, 27 Jan 2021 04:46:34 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p27sm769172ejd.72.2021.01.27.04.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 04:46:33 -0800 (PST)
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
To: Keqian Zhu <zhukeqian1@huawei.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
Date: Wed, 27 Jan 2021 13:46:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111073439.20236-1-zhukeqian1@huawei.com>
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, jiangkunkun@huawei.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ADtaGvzBS1cR

On 11/01/21 08:34, Keqian Zhu wrote:
> +static void vfio_listener_log_start(MemoryListener *listener,
> +                                    MemoryRegionSection *section,
> +                                    int old, int new)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    vfio_set_dirty_page_tracking(container, true);
> +}
> +
> +static void vfio_listener_log_stop(MemoryListener *listener,
> +                                   MemoryRegionSection *section,
> +                                   int old, int new)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    vfio_set_dirty_page_tracking(container, false);
> +}
> +

This would enable dirty page tracking also just for having a framebuffer 
(DIRTY_MEMORY_VGA).  Technically it would be correct, but it would also 
be more heavyweight than expected.

In order to only cover live migration, you can use the log_global_start 
and log_global_stop callbacks instead.

If you want to use log_start and log_stop, you need to add respectively

     if (old != 0) {
         return;
     }

and

     if (new != 0) {
         return;
     }

before the calls to vfio_set_dirty_page_tracking.  But I think it's more 
appropriate for VFIO to use log_global_*.

Thanks,

Paolo

