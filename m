Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp574162njb;
        Tue, 13 May 2025 07:50:22 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXGAS+9DthU10nUMdNWq028PNTKvT9Q2EeDBzZ8eIV8NOQ8TriqDdJ/SRBktud/JL+sa42tOVBLM+wKjA==@linaro.org
X-Google-Smtp-Source: AGHT+IHCI/3UHd7QXVQigYtSLt9pYzSxeJ7AHxvbYr3VvDzIhx2r/4pbz0PacgpmG4BmP3FaU5g2
X-Received: by 2002:a05:6a00:4652:b0:740:6f69:8d94 with SMTP id d2e1a72fcca58-7423b3f12e7mr24766191b3a.0.1747147822092;
        Tue, 13 May 2025 07:50:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747147822; cv=pass;
        d=google.com; s=arc-20240605;
        b=LqzEaDyFCc2z7gvKRGLS/m4mpAUBfX3ON3DTc8PmzvX7hUL4Vs1lr7N32WSNkctM2V
         5vdZ3dPpngDdl6iMMQl9yC/CkPKYoudeuvgpTY+2uVq1Rs3XUs9ak6/Ctp8ZB/E8d3SZ
         17PMDidSiq/+h2BGs9e+w0b5AjOrUxLX9SlVGJtNONd44G6Kj8jLtv5fhP5TUQJaKrbW
         ydYSDWt9tOZo/gCSy/vtxc8exodJKBR8AD6zAJQH7LYNq/tGTezryElWytgmOSBquIdL
         rZ4nnGrjsKZ/iviNIdxm5oE0Le3xKT4g2dIp1Vo0RL8glYosbbj6UBLSZE626Cfvsjow
         RshA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:date:message-id
         :dkim-signature;
        bh=9Vh+wAuJrcvPvfiLhvY41nHVEZ4KPPjEC/9ttCXTHuk=;
        fh=o58F1lQQ6mZazJgh5LGCFN5u+fY97jGK5O30C1mKFzs=;
        b=AZK8GuPYwcpPfXwDonQW6v/+cPR1QL6+y6D5Dmic6dGKH3j7P2c2Xb4krsmaCSolXS
         STdnB1mE/SHM0eMPuGO5hcnKExRqj+ehTMs3JGHsGr8N7A1m1gYWxw39RNnff5iHaG8q
         hVl56lfIB57ZpbwbDUA9nhdjFWN1wecnniZGmd8lV633QWQ7MyJSF67eqAMR0P8dMX+V
         ElKCbzljMRKE+zi2wxNrJxUvP5bG4LUAxvmJMrJmifCL+1DLaqgSubznBov2ptR/BuRY
         yKzyP9xDs7GeV2ipeSU5dy6yKMpWJyftLHN0HJ7xqB39hA+8LO62HAOPb4Qz0jQ7Pq6P
         7hPw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EjZtIIax;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvmarm+bounces-21494-alex.bennee=linaro.org@lists.linux.dev designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvmarm+bounces-21494-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm+bounces-21494-alex.bennee=linaro.org@lists.linux.dev>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-74237a3d084si13210297b3a.212.2025.05.13.07.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:50:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm+bounces-21494-alex.bennee=linaro.org@lists.linux.dev designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EjZtIIax;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvmarm+bounces-21494-alex.bennee=linaro.org@lists.linux.dev designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvmarm+bounces-21494-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BFD03BD73E
	for <alex.bennee@linaro.org>; Tue, 13 May 2025 14:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB10974C14;
	Tue, 13 May 2025 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EjZtIIax"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7911171CD
	for <kvmarm@lists.linux.dev>; Tue, 13 May 2025 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147817; cv=none; b=HUSlp3eee/gMapUvW69FP4L0+dikDP2hXsJ8z+G4wKL6uUHG6B6zhfhOH9FdeKHIZcQCpC3VVAlXYCfGfMhtQ/WEeZTEyw32KJqnzV33WVcZsPz39jI0p7GA1Nap9JWw5faCdQ8A8TWl/lmk30RiimC605BYWphzjXC8U/F0o7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147817; c=relaxed/simple;
	bh=NPdApzljCRakyNI6ev6LNVKv3xaSYdKmpqNH2xiZgXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4jWbKSfQ3VtSGygbZaWUfKAIoYw+MI9zavlrLhbcW0MhBy376BQtAbX/7YjAM3XwIxMBKh374NyG+6dAw0YAwBitkfL0e0iMiHOy+gRm6vLhWgPc031PZxuEOJxflbms6FoXoatcaadOMILXFslDmIE6IQqpih6+87xoeXLIL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EjZtIIax; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747147814;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Vh+wAuJrcvPvfiLhvY41nHVEZ4KPPjEC/9ttCXTHuk=;
	b=EjZtIIax5Ftg5uT6u+xauViwEFA0YlVGoN+OvZzdISl19iyGjwcX6jrZtyiTwAHJ/sNX2x
	YSqbirK6e6e6W+zxRfgrZqWh7wV8OE1OFmXsn+zx6yfnSmXHskYSQa4WWHds0VK2pFQppY
	u7GyCFS8SBeEjGmw3o1erLaBYX2bbgs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-w3NKzFz4Oa2A9-3jY9eSuA-1; Tue, 13 May 2025 10:50:13 -0400
X-MC-Unique: w3NKzFz4Oa2A9-3jY9eSuA-1
X-Mimecast-MFC-AGG-ID: w3NKzFz4Oa2A9-3jY9eSuA_1747147812
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so32605265e9.1
        for <kvmarm@lists.linux.dev>; Tue, 13 May 2025 07:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147812; x=1747752612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Vh+wAuJrcvPvfiLhvY41nHVEZ4KPPjEC/9ttCXTHuk=;
        b=GFoclyUrMGyFKXBdQlauJOcZXGqMqnv38VXXAVEhuSZQvj4oaCuX4hEXPNbJ2DMas6
         bqpwC/jLvu7Xk+Zp6GgRGi2MH6+WHuxtT5vfIBsu4GzyxLEWhz1PnTdz6mrjmdCs2JTZ
         J9ussL2LxL3f6jgnwSSERYz7yX7JwcSSD4DxsbuqZOu8uahHIKj6VEOsxcm+TyC9gRXh
         yrGhJUyXX3Ohw7dlk+WUvr60d91RVuLZnU5yCbC4sykVmBx4psJwipEMe7WCFZZJtsaq
         B7YuLZwoHIi8GSWecgOum5fb3LGrvfukc4mfcklsYWG2nLXiv6+HbN5WbVXh8GAUsZxh
         cESg==
X-Forwarded-Encrypted: i=1; AJvYcCVFu8FoOTsW9UN4ic+lYDBiuzbp6ZLWPzVOAh9tVXnge3o7CCYLgpjHwkzkvLfFrP1HsnBjzM0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoTmCYiqGl6YTBlAlMzrnwOGbryi+pqCmbvyCte2a/1wRhG9QA
	omZ7oF3Mt+zbwzDdk3qOcJLEE0bZAKWqaaY/JYogA6q3/oZCDYYq9uIGFrs202916GfZcWqGZbm
	VISXxE+D2uqudHIFueYLlJ06UM8/TE3IoRONd9B4BQCNIw8iBhgFxBA==
X-Gm-Gg: ASbGncvdbiVFsJejOzOuNmVbGcFiAHzyBASZetwYK/BPQmRbbp1tBajo0uh6pVUfDK/
	DyckQLI9Kz8PtN0V9mag88hLSX1UTYnyd8JgxguWa6sUizaNWAeiOi0tgIfTTkkbIvIPO2YlY59
	2N2ajkN0yspVx71yefBz2qgKhgpVHgV4T13R3ywA+DS5A9Ay/41CFV1RuAVRysSpbYh3n/szMpk
	1lfYRfP4tOcSx7et9oP3Z1jEHch1RraYkTKucno4LMAdJ230n2QkKVzrvMhN1xx6wFBwhDtydwL
	3CEfMX/JhV/FS2Z8VetqGgrfEp9sZBu45+gWj9zqeLWzHX/jvRmJA7Wxixg=
X-Received: by 2002:a05:600c:628c:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-442d6d71df0mr161957515e9.19.1747147812368;
        Tue, 13 May 2025 07:50:12 -0700 (PDT)
X-Received: by 2002:a05:600c:628c:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-442d6d71df0mr161957185e9.19.1747147811919;
        Tue, 13 May 2025 07:50:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bd84sm212123835e9.22.2025.05.13.07.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 07:50:11 -0700 (PDT)
Message-ID: <5d2f9062-8bc8-40b8-9a0b-d04f232756bb@redhat.com>
Date: Tue, 13 May 2025 16:50:09 +0200
Precedence: bulk
X-Mailing-List: kvmarm@lists.linux.dev
List-Id: <kvmarm.lists.linux.dev>
List-Subscribe: <mailto:kvmarm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kvmarm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 09/10] arm-qmp-cmds: introspection for ID register
 props
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-10-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250414163849.321857-10-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iXCbvUzzRJ02QHGRDVhEVA21fHe5Ra26VP8Hy8iKDOc_1747147812
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: Rm9OPWoXeJIg



On 4/14/25 6:38 PM, Cornelia Huck wrote:
> Implement the capability to query available ID register values by
> adding SYSREG_* options and values to the cpu model expansion for the
> host model, if available.
>
> Excerpt:
> (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
> {"return": {"model": {"name": "host", "props":
> {"SYSREG_ID_AA64PFR0_EL1_EL3": 1224979098931106066,
> "SYSREG_ID_AA64ISAR2_EL1_CLRBHB": 0,
> ../..
>
> So this allows the upper stack to detect available writable ID
> regs and the "host passthrough model" values.
>
> [CH: moved SYSREG_* values to host model]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>
> ---
>
> TODO: Add the moment there is no way to test changing a given
> ID reg field value. ie:
>
> (QEMU) query-cpu-model-expansion type=full model={"name":"host", "prop":{"SYSREG_ID_AA64ISAR0_EL1_DP":0x13}}
Isn't it a mandated feature for layered products to be able to try a
given combination. Do you think this would be achievable?

Eric
> ---
>  target/arm/arm-qmp-cmds.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
> index 883c0a0e8cce..5f48c7d835e1 100644
> --- a/target/arm/arm-qmp-cmds.c
> +++ b/target/arm/arm-qmp-cmds.c
> @@ -21,6 +21,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "hw/boards.h"
>  #include "kvm_arm.h"
>  #include "qapi/error.h"
> @@ -209,6 +210,24 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>          }
>      }
>  
> +    /* If writable ID regs are supported, add them as well */
> +    if (ARM_CPU(obj)->writable_id_regs == WRITABLE_ID_REGS_AVAIL) {
> +        ObjectProperty *prop;
> +        ObjectPropertyIterator iter;
> +
> +        object_property_iter_init(&iter, obj);
> +
> +        while ((prop = object_property_iter_next(&iter))) {
> +            QObject *value;
> +
> +            if (!g_str_has_prefix(prop->name, "SYSREG_")) {
> +                continue;
> +            }
> +            value = object_property_get_qobject(obj, prop->name, &error_abort);
> +            qdict_put_obj(qdict_out, prop->name, value);
> +        }
> +    }
> +
>      if (!qdict_size(qdict_out)) {
>          qobject_unref(qdict_out);
>      } else {

