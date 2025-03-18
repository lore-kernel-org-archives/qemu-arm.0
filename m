Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2750945njb;
        Tue, 18 Mar 2025 00:37:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYSUyUM873zvJpIPhXT5ILOh7i/SnbprXUZP8nxK8M4s3wYbEOAt9T2tvMsXz8LYeVNmtQ65szkNsinw==@linaro.org
X-Google-Smtp-Source: AGHT+IH/i1rd2PELI+1DqczSOQROZO/TN9pIyPZdvP76Z/csCAB9Yrz7MBLYLteC85kvacZx/2DS
X-Received: by 2002:a05:6214:2426:b0:6e8:fb7e:d33b with SMTP id 6a1803df08f44-6eaeaae68dfmr197949886d6.33.1742283471696;
        Tue, 18 Mar 2025 00:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742283471; cv=none;
        d=google.com; s=arc-20240605;
        b=c1WZvRVZr25nsOE7Zy22bhPCiaJSwZEct18MCNHWP60uymLRbYAn2dnAIEKZ78tUjZ
         TDPt6x4wNHbxfV88Nt7Vt29V96xCnQbMqlRp7seS/ZzngpYwSVaY83V7WrFbyuJ0zg2x
         vALzoCXaWA990/koHH0go1+UJewcgnq516VAVs9vgCERsLGAf4yINsvf9NP+Eedl8pH3
         t6jHgiUyjIO35ke90YzMN9yXzU1HHixrxWpu9mOXzbGz6gybXZZ/ba7IukbTTePGKSDW
         keUcYame7PUaMKrygHwsHM0MmZf1YN0jEXloi2T3l3ClNvL4jt4CNvGeBpHF3VqlkFEp
         3gcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0i8L8ErIHIcKjhHNLC1JQVz75Bq37QLmHg8dkfMBKIw=;
        fh=pXUW4T9Imq05X8ePJl4GIVigR+0XBZlKU/dpSMSU8tQ=;
        b=j/bQdcxFzOX+MHNc9ko93g717P0mNibvQmuZZeponzjR4yDUW4oW9zTIHEzw19yJR6
         uWu5VXfGwG5cCS4b6c+at9zCuaN3gUNJBfAqrBLypn1P1QxtjCdPbIITQptCX7tXw5M2
         KFv+Y45jKwwwhUuScopeZyutla/bcMu4wUC0ntG50xaG63MQybYV06bslbwHYjGF0He3
         2chft3JYHZVXxwvKG0/+FOGcgvycZN/r/r5uUJf0hEWchZKY6t5q1FPea5Qm86GtQ9Zy
         ObgIRAVi2A+pv8eBPMa3/hdsdytKLMxZknaikO+0zdW2p4eZnGteN3mnVtkUvL90KJMc
         PS7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GwiR5i5O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade3555c9si112363176d6.334.2025.03.18.00.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 00:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GwiR5i5O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuRVd-0001v8-Vl; Tue, 18 Mar 2025 03:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1tuRVb-0001ub-7z
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 03:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1tuRVX-0005qT-U4
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 03:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742283421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0i8L8ErIHIcKjhHNLC1JQVz75Bq37QLmHg8dkfMBKIw=;
 b=GwiR5i5Ob4iZSJGNBn7+IXszUuKoJOAme6WpvkLdSelpLWQMD/0SC5WbiEpNzYL8MTEr3r
 psVIx/D9fDJiMRjieJVKgeN9Gequds4sjgXCzOKDi52fmKoUkZH6O/2fCmp3j2zsMs7t6x
 9O9kxdaSL7wGLXNCGJQZZHOBlvaMy6U=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-tAHSoWPUN8SBlnnd8c6rdQ-1; Tue, 18 Mar 2025 03:35:34 -0400
X-MC-Unique: tAHSoWPUN8SBlnnd8c6rdQ-1
X-Mimecast-MFC-AGG-ID: tAHSoWPUN8SBlnnd8c6rdQ_1742283334
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff581215f7so3291557a91.3
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 00:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742283334; x=1742888134;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0i8L8ErIHIcKjhHNLC1JQVz75Bq37QLmHg8dkfMBKIw=;
 b=hmlUGf9f6+1YNsaxki5X7ybes2TR9/VbcyvFqmSrKQfKAI4nwhTMqFmSbZS8YghpoD
 HJQ5qD0XLiNuYWB5BfLnWK5H0b+hnZSHxv97VnSyIT1wZlI2jbMf+CggyKUnnL3DkXtz
 EWmegvUnIGoFKhsVG6d5p6D2otbMkOqUvQDftY8O52MevT4YKa9tiRdj+rDHa29UZaeF
 VQQEfKix+cTxVquZS7/nkX050mOp/IpW2i0QvS6rb1nY0lV3zaBzEvnUu2+S4M4Xt4nG
 6TuY4HBjRR89D8pc5TCNJ5cbLCWJAbodTpXmY00BtFgqzEw/ap0dwbqTk0sDCcLjZx8w
 a8iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTe4rcs9UmTevqF9tbG+si2cjbqGT/Z42V8ffjhAb3VmWvzfLsPHRPW7kZcoDRB9bNIgtcgD06Gg==@nongnu.org
X-Gm-Message-State: AOJu0YwN92a8sgHF5eAM/yHwV4jEwHFhxf3dg0XWKPZDGjhRzhKVHuuX
 mijx9dw/0Zq8mDULw2CTsXfBf1DlvlkrYrTAYnzGaIOIg5oRzaTa5OMP0hMD97ZW8WT9H1MtJQ8
 UYm7YyP7+nEkD/Dwg3FPjOe3KqInuiEClt9tQnfQYrQeYL8Awpw==
X-Gm-Gg: ASbGnctoECRMmOzmYdQnbYTAN8qstGI5gHiyCnxo0zhojSfwEIVgCVN7QRjHzV2TP4L
 Fg/lp/lhXcteVx4EMeHkccMqenfsj8q5y2RHjY6beJDGfNw0Drb20mhyX3nHv73eAKW5oNl5NWp
 90q/On2fh5LcLs2XYev4sf6e19sjsQPDeWiCqI9EZc1Sd0mcbKj1Sj2icmAt2XOl+1mvfpGAT7e
 fprcw6ZUhYCwjcbmroIa/Z2xMHaARbUeDrtAZSy4WXfN6bJyuor6WkzdU2OEo3fzURxyceuybrv
 JBLS5A9NP81Lk3jIPYcB
X-Received: by 2002:a05:6a00:b95:b0:736:3d7c:2368 with SMTP id
 d2e1a72fcca58-73722353269mr18334340b3a.7.1742283333050; 
 Tue, 18 Mar 2025 00:35:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:b95:b0:736:3d7c:2368 with SMTP id
 d2e1a72fcca58-73722353269mr18334273b3a.7.1742283332537; 
 Tue, 18 Mar 2025 00:35:32 -0700 (PDT)
Received: from [10.72.116.163] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7371152958csm8856772b3a.26.2025.03.18.00.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 00:35:31 -0700 (PDT)
Message-ID: <2fe2a98d-f70f-4996-b04e-d81f66d5863f@redhat.com>
Date: Tue, 18 Mar 2025 15:35:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/5] accel/kvm: Support KVM PMU filter
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sebastian Ott <sebott@redhat.com>, Gavin Shan <gshan@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Dapeng Mi <dapeng1.mi@intel.com>, Yi Lai <yi1.lai@intel.com>
References: <20250122090517.294083-1-zhao1.liu@intel.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250122090517.294083-1-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fYPunIJd9pdT7lFKYq74H1-OVadtj7CetpKsgHMXkl4_1742283334
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.335,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: UULVojGnSFkt

Hi Zhao,

Thanks for your effort to respin the PMU Filter series.

I tried your series on ARM64, but it reports error at compile time, here 
is the error output:

qapi/kvm.json:59:Unexpected indentation.

While I compiled it on x86, everything is ok. Could you please check why 
it failed on ARM64?

By the mean time, I will review and test this series.

Thanks,
Shaoqin

On 1/22/25 5:05 PM, Zhao Liu wrote:
> Hi folks,
> 
> Sorry for the long wait, but RFC v2 is here at last.
> 
> Compared with v1 [1], v2 mianly makes `action` as a global parameter,
> and all events (and fixed counters) are based on a unified action.
> 
> Learned from the discussion with Shaoqin in v1, current pmu-filter QOM
> design could meet the requirements from the ARM KVM side.
> 
> 
> Background
> ==========
> 
> I picked up Shaoqing's previous work [2] on the KVM PMU filter for arm,
> and now is trying to support this feature for x86 with a JSON-compatible
> API.
> 
> While arm and x86 use different KVM ioctls to configure the PMU filter,
> considering they all have similar inputs (PMU event + action), it is
> still possible to abstract a generic, cross-architecture kvm-pmu-filter
> object and provide users with a sufficiently generic or near-consistent
> QAPI interface.
> 
> That's what I did in this series, a new kvm-pmu-filter object, with the
> API like:
> 
> -object '{"qom-type":"kvm-pmu-filter","id":"f0","action":"allow","events":[{"format":"raw","code":"0xc4"}]}'
> 
> For i386, this object is inserted into kvm accelerator and is extended
> to support fixed-counter and more formats ("x86-default" and
> "x86-masked-entry"):
> 
> -accel kvm,pmu-filter=f0 \
> -object pmu='{"qom-type":"kvm-pmu-filter","id":"f0","action":"allow","x86-fixed-counter":{"bitmap":"0x0"},"events":[{"format":"x86-masked-entry","select":"0xc4","mask":"0xff","match":"0","exclude":true},{"format":"x86-masked-entry","select":"0xc5","mask":"0xff","match":"0","exclude":true}]}'
> 
> This object can still be added as the property to the arch CPU if it is
> desired as a per CPU feature (as Shaoqin did for arm before).
> 
> 
> Introduction
> ============
> 
> 
> Formats supported in kvm-pmu-filter
> -----------------------------------
> 
> This series supports 3 formats:
> 
> * raw format (general format).
> 
>    This format indicates the code that has been encoded to be able to
>    index the PMU events, and which can be delivered directly to the KVM
>    ioctl. For arm, this means the event code, and for i386, this means
>    the raw event with the layout like:
> 
>        select high bit | umask | select low bits
> 
> * x86-default format (i386 specific)
> 
>    x86 commonly uses select&umask to identify PMU events, and this format
>    is used to support the select&umask. Then QEMU will encode select and
>    umask into a raw format code.
> 
> * x86-masked-entry (i386 specific)
> 
>    This is a special format that x86's KVM_SET_PMU_EVENT_FILTER supports.
> 
> 
> Hexadecimal value string
> ------------------------
> 
> In practice, the values associated with PMU events (code for arm, select&
> umask for x86) are often expressed in hexadecimal. Further, from linux
> perf related information (tools/perf/pmu-events/arch/*/*/*.json), x86/
> arm64/riscv/nds32/powerpc all prefer the hexadecimal numbers and only
> s390 uses decimal value.
> 
> Therefore, it is necessary to support hexadecimal in order to honor PMU
> conventions.
> 
> However, unfortunately, standard JSON (RFC 8259) does not support
> hexadecimal numbers. So I can only consider using the numeric string in
> the QAPI and then parsing it to a number.
> 
> To achieve this, I defined two versions of PMU-related structures in
> kvm.json:
>   * a native version that accepts numeric values, which is used for
>     QEMU's internal code processing,
> 
>   * and a variant version that accepts numeric string, which is used to
>     receive user input.
> 
> kvm-pmu-filter object will take care of converting the string version
> of the event/counter information into the numeric version.
> 
> The related implementation can be found in patch 1.
> 
> 
> CPU property v.s. KVM property
> ------------------------------
> 
> In Shaoqin's previous implementation [2], KVM PMU filter is made as a
> arm CPU property. This is because arm uses a per CPU ioctl
> (KVM_SET_DEVICE_ATTR) to configure KVM PMU filter.
> 
> However, for x86, the dependent ioctl (KVM_SET_PMU_EVENT_FILTER) is per
> VM. In the meantime, considering that for hybrid architecture, maybe in
> the future there will be a new per vCPU ioctl, or there will be
> practices to support filter fixed counter by configuring CPUIDs.
> 
> Based on the above thoughts, for x86, it is not appropriate to make the
> current per-VM ioctl-based PMU filter a CPU property. Instead, I make it
> a kvm property and configure it via "-accel kvm,pmu-filter=obj_id".
> 
> So in summary, it is feasible to use the KVM PMU filter as either a CPU
> or a KVM property, depending on whether it is used as a CPU feature or a
> VM feature.
> 
> The kvm-pmu-filter object, as an abstraction, is general enough to
> support filter configurations for different scopes (per-CPU or per-VM).
> 
> [1]: https://lore.kernel.org/qemu-devel/20240710045117.3164577-1-zhao1.liu@intel.com/
> [2]: https://lore.kernel.org/qemu-devel/20240409024940.180107-1-shahuang@redhat.com/
> 
> Thanks and Best Regards,
> Zhao
> ---
> Zhao Liu (5):
>    qapi/qom: Introduce kvm-pmu-filter object
>    i386/kvm: Support basic KVM PMU filter
>    i386/kvm: Support event with select & umask format in KVM PMU filter
>    i386/kvm: Support event with masked entry format in KVM PMU filter
>    i386/kvm: Support fixed counter in KVM PMU filter
> 
>   MAINTAINERS              |   1 +
>   accel/kvm/kvm-pmu.c      | 386 +++++++++++++++++++++++++++++++++++++++
>   accel/kvm/meson.build    |   1 +
>   include/system/kvm-pmu.h |  44 +++++
>   include/system/kvm_int.h |   2 +
>   qapi/kvm.json            | 246 +++++++++++++++++++++++++
>   qapi/meson.build         |   1 +
>   qapi/qapi-schema.json    |   1 +
>   qapi/qom.json            |   3 +
>   target/i386/kvm/kvm.c    | 176 ++++++++++++++++++
>   10 files changed, 861 insertions(+)
>   create mode 100644 accel/kvm/kvm-pmu.c
>   create mode 100644 include/system/kvm-pmu.h
>   create mode 100644 qapi/kvm.json
> 

-- 
Shaoqin

