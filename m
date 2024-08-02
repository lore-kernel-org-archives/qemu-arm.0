Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1261098njb;
        Fri, 2 Aug 2024 02:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX4alnNHFfv5DZKyR92ijknFGQI0R3v+3azksg3XTTJ+bTghlKM6zqRNhDvwtjdbDznjjOsbkvY6Zeosu+8CHoOTVmUwOI9
X-Google-Smtp-Source: AGHT+IF5W961ukaoDJyJgzHQCNNUH86iSx5TPHZOUURZZ7xhg7xA960KgjvoHkQOs7BuNJGcxvxR
X-Received: by 2002:a05:6808:3094:b0:3d9:360a:3a08 with SMTP id 5614622812f47-3db55835400mr3371730b6e.34.1722589326866;
        Fri, 02 Aug 2024 02:02:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722589326; cv=pass;
        d=google.com; s=arc-20160816;
        b=YpaZEE7EYlrsmaKVO9X7QKkEidbdyMVCyQ4Ywh/007cntuGnKClX5tqa68FqEDwHcD
         DaUqRkWOJ3XibbdSOEZYRif2kvg4m7m46LwF4GUcPopqU24xReCk7L+eEWepFV63qIcK
         Tpfu7vnzaCo7TW+8piiiVCS/CVNYFz0uaK1lvTutLg/He+r+wUwyZhQMTcxhmmxDr/13
         6EemHNX3tD7mKqfD3ODM6LDpU82dfOZ3KUteK7DGfDePPxxGBGwVOgZ8r8oY00A1mjXe
         hTj7im+5qNEv8hFGjXTQkWYcSmG3IFQ+m29TN/XVQlc13ZUOY2yCgHevO86UVkbx3Rju
         v5ZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=Lrdj9yuORukWqUYUIt3IAzaQyJKJfeEL5MPERDg4KCU=;
        fh=av4Lzl1i54ZZVdhwEfHxfkcztF4tk+3WW6g+MX86NJs=;
        b=rW0zrr2tTcJNKYEjbeegJPZJd3JgfWnO0LdqkVyXA05ZOHeqnOc/pJ6CLWLmxqNNn+
         KLvlhi/KDgiZ8u/0vvJ0hTeo26dWzQnl6Ock981bW6cKMSu0GisLcJyJXFEdR65OT0Qt
         agoLXwoCvhaALuMq2yKCu54h6SMvhAmUiLQMQYkhXQgytC+wbtsAA7suSNr1d5sAbQgk
         rtf7vu6T0h0Lj+3wclMfxz4SCmDvDDZkKvCWvbJZG1ju9s7QZM+rPFvr7vS2Hd1ojz56
         qmT9XjysJ0TqEynJsd5nTBhaV32JNNsqX+RF2yar5hMeevRKWkfD6m26xlQ4KHsTozke
         ZoAg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ByyNa7dI;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-23016-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-23016-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-23016-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-4518a783abbsi17913281cf.524.2024.08.02.02.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 02:02:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-23016-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ByyNa7dI;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-23016-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-23016-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80ED91C21861
	for <alex.bennee@linaro.org>; Fri,  2 Aug 2024 09:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6FB1C0DD9;
	Fri,  2 Aug 2024 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ByyNa7dI"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3E649659
	for <kvm@vger.kernel.org>; Fri,  2 Aug 2024 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722589320; cv=none; b=P6FQ1ZNxqsT1m0CCUK3a6pfKiUCRq7SfbA67KlOaJ8PhyZsrz7tRUYC1lk6weqMlT6dCD+gRAphnrF0n7+GMJNfMKVy9KoeNuArJBwu2uvQm6s8tbP4pTZfYFs0RCCSUE+CkF0wyUjHP9VO4tJ5VJb2M1xxE8c4lVS3Qh5GC0gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722589320; c=relaxed/simple;
	bh=zyulcYQkrrebscXog2s5Vfev9XvTOPt6BGkYQNOQz3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXKNBZ5LJwXkb1cM5PXBZG019uRc3NVvmgpTDk6n1QNrnLyry9E+kd5EMMEAECdGXqeNMEvjWg0z0j0WxMONd2wyJC2k7sw2/OiGJMpMSk3NUM/NzAa1H3IsEkIxTuTM7Fumc1VO+e9mwN2yK19P6Fm/K1CmVI48eHJXu1c/XAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ByyNa7dI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722589317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lrdj9yuORukWqUYUIt3IAzaQyJKJfeEL5MPERDg4KCU=;
	b=ByyNa7dIH/dHsyIUyz2bxUrVzhtCdg48bYlyTMOXf3uLwFjHmhRQSROGl4Hbg5F+Fldh8s
	qjU9urM6ZHuTHyDJKfxUm0XqHEtzI/8SGw0+LBwjpAAduPCGVmovVO0MPQrf7PVgsTVTl3
	Y23qqMtqeQ9+Lu7Mb3sGCqYDX//oxgc=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-YNeCs_msPTyXtCuiwVnMvA-1; Fri, 02 Aug 2024 05:01:56 -0400
X-MC-Unique: YNeCs_msPTyXtCuiwVnMvA-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1fd0000b1a8so4784535ad.3
        for <kvm@vger.kernel.org>; Fri, 02 Aug 2024 02:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722589315; x=1723194115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lrdj9yuORukWqUYUIt3IAzaQyJKJfeEL5MPERDg4KCU=;
        b=dygqqDp27vh/OPtg2Oxd/H5ryS66qjTvxVEkOcC03Yvw2lwX+i6ZkKn9QFa0sAS5Q9
         eZIYnGNrFIw0WsYcBDVkq67KsaYJl+Yu7F/XAFdjUpn2S3v2s8LJtFKrtzJBBR9OXKou
         XA7cxMsw/4c4wM42uqT8TtuLOA83HzxInjKbd2+rPkCGeL07p7Gpx5TcNkW5IZdp2Rqf
         bmLoCt5nS8XKQoiFLT4iMwoQyWz42Wmev491jO0AeHeET5vYCpbJt7ppTM6Ymw5GBPdJ
         aXPsaS4rFExI9Rg1O76tYqza5i/WcaR5KJ+0w+uEcGD23tcqYQvJkYKlgskCrzoXFXvk
         4WuA==
X-Forwarded-Encrypted: i=1; AJvYcCVe0TuQNIt29dUsZ2MTAiIzxbcMg9vGjuKuCwJD1JzqDr0pulPFo53Cw5rRxJBOh+aQX/RBeNAOfMrAGDj/PfYKe+83
X-Gm-Message-State: AOJu0YyRoHRiryPyNAuipfEwxdc+H92YkRP0t9TDcFjH0ksbfOYiIkkm
	vsNP4Dws+DhMVIsTua0b7cgdGs4LcdZbqepo5T9MaRDjIZl75JkawwagPoZhzJanmGpiB5mti6X
	HnyhqxPPYFx/K8g9C3P+OQ8kwv/C5NitCgvisNxFqTVILAYVhNQ==
X-Received: by 2002:a17:902:e811:b0:1fc:7180:f4af with SMTP id d9443c01a7336-1ff572930a2mr22180945ad.1.1722589314880;
        Fri, 02 Aug 2024 02:01:54 -0700 (PDT)
X-Received: by 2002:a17:902:e811:b0:1fc:7180:f4af with SMTP id d9443c01a7336-1ff572930a2mr22180715ad.1.1722589314400;
        Fri, 02 Aug 2024 02:01:54 -0700 (PDT)
Received: from [10.72.116.40] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5905ff1asm12222005ad.180.2024.08.02.02.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 02:01:53 -0700 (PDT)
Message-ID: <b10545d1-8e81-44f0-8e13-eee393ea4d1b@redhat.com>
Date: Fri, 2 Aug 2024 17:01:47 +0800
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/5] accel/kvm: Support KVM PMU filter
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
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Yuan Yao <yuan.yao@intel.com>, Xiong Zhang <xiong.y.zhang@intel.com>,
 Mingwei Zhang <mizhang@google.com>, Jim Mattson <jmattson@google.com>
References: <20240710045117.3164577-1-zhao1.liu@intel.com>
Content-Language: en-US
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20240710045117.3164577-1-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Zqps0AH5VvXN

Hi Zhao,

On 7/10/24 12:51, Zhao Liu wrote:
> Hi QEMU maintainers, arm and PMU folks,
> 
> I picked up Shaoqing's previous work [1] on the KVM PMU filter for arm,
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
> -object '{"qom-type":"kvm-pmu-filter","id":"f0","events":[{"action":"allow","format":"raw","code":"0xc4"}]}'
> 
> For i386, this object is inserted into kvm accelerator and is extended
> to support fixed-counter and more formats ("x86-default" and
> "x86-masked-entry"):
> 
> -accel kvm,pmu-filter=f0 \
> -object pmu='{"qom-type":"kvm-pmu-filter","id":"f0","x86-fixed-counter":{"action":"allow","bitmap":"0x0"},"events":[{"action":"allow","format":"x86-masked-entry","select":"0xc4","mask":"0xff","match":"0","exclude":true},{"action":"allow","format":"x86-masked-entry","select":"0xc5","mask":"0xff","match":"0","exclude":true}]}'

What if I want to create the PMU Filter on ARM to deny the event range 
[0x5,0x10], and allow deny event 0x13, how should I write the json?

Thanks,
Shaoqin

> 
> This object can still be added as the property to the arch CPU if it is
> desired as a per CPU feature (as Shaoqin did for arm before).
> 
> Welcome your feedback and comments!
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
> In Shaoqin's previous implementation [1], KVM PMU filter is made as a
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
> 
> [1]: https://lore.kernel.org/qemu-devel/20240409024940.180107-1-shahuang@redhat.com/
> 
> Thanks and Best Regards,
> Zhao
> ---
> Zhao Liu (5):
>    qapi/qom: Introduce kvm-pmu-filter object
>    i386/kvm: Support initial KVM PMU filter
>    i386/kvm: Support event with select&umask format in KVM PMU filter
>    i386/kvm: Support event with masked entry format in KVM PMU filter
>    i386/kvm: Support fixed counter in KVM PMU filter
> 
>   MAINTAINERS                |   1 +
>   accel/kvm/kvm-pmu.c        | 367 +++++++++++++++++++++++++++++++++++++
>   accel/kvm/meson.build      |   1 +
>   include/sysemu/kvm-pmu.h   |  43 +++++
>   include/sysemu/kvm_int.h   |   2 +
>   qapi/kvm.json              | 255 ++++++++++++++++++++++++++
>   qapi/meson.build           |   1 +
>   qapi/qapi-schema.json      |   1 +
>   qapi/qom.json              |   3 +
>   target/i386/kvm/kvm.c      | 211 +++++++++++++++++++++
>   target/i386/kvm/kvm_i386.h |   1 +
>   11 files changed, 886 insertions(+)
>   create mode 100644 accel/kvm/kvm-pmu.c
>   create mode 100644 include/sysemu/kvm-pmu.h
>   create mode 100644 qapi/kvm.json
> 

-- 
Shaoqin

