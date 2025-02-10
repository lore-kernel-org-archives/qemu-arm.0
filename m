Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1799334njb;
        Mon, 10 Feb 2025 00:50:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXB5Vb7MgUKKkzDpmwpFKn0CTJKphBEfZP0UUU5g2FcVdzp6NeW6WSiHf97gGCEc0Ia0KrzT+xQmZKpiw==@linaro.org
X-Google-Smtp-Source: AGHT+IG5IYxJoUIMNtPHUjSjH68HGQLUXl7YBYA/SkHARdFRKJ6DS2CUYFjcZ7tE8pUCLNgH4HAH
X-Received: by 2002:a05:622a:8f18:b0:471:78f7:6db6 with SMTP id d75a77b69052e-47178f76f92mr64729041cf.14.1739177407612;
        Mon, 10 Feb 2025 00:50:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739177407; cv=none;
        d=google.com; s=arc-20240605;
        b=C2zwFmRv5rNDwZ1avHcDrTloFEK+ruu2lMwTwPnmXPwtQIJHwXl7wv9mH2llxVQNjn
         w9CxFkpmSPoDDgLvf2DYsIexQNZugpkB480x6CdgLP/ZWjQQdl8TLfjyw/3j9DUxdcJL
         ecciG0U5y1PT1X6u7STWbqzl38QlTg9FecmY/dv4+6h7oTH9+J6p70YhNd4bayWUSvn8
         /Xs9LJ+YQsaZ5XL4dLLcnYQidRKGyUmdjCSpw7qRk2C/ng+Syh1IFujdD1RR9uEWl78U
         V14+INZdJ8hrv/0tAYrk/KcTFH5tS8cKywWs2rA/5ysBhj+blW3bBl17LoozcjV2Uusy
         r6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=F9XnpApMrWMs33jKiI5vvV2CtuS8qw1OBYUfsnaLN9E=;
        fh=/Wqu7i5aXGvoiMLzeZCllhf5EVwEVfxiet73ATGDM6I=;
        b=LIlv7px0jNX1+IVuqcJooL9hFnkHRQmsAAfPOrJHcV+l+dFSw63asggYUIJZX/mykO
         WCpqr8gvP2I53YVpnMvHzJcxTlEpSS8VllqCRqwaO/WkHSRcU+3tDNWVal3xWbYJ9y+L
         rwwSs1j2mDJZep6jid+JzSQfQ8DAWr/HJLw9LXz/F6TLpSJFEkywZaUe2YZK+o3nzZWG
         K45GgeMfSI8htPnWgrQoxOad4wHJ1dfbmCa0DgeRE1NQmJe8euYeo4NH364pp+rAZi4T
         uGL4E72DKZP7UQUxgCOCShQZVtU14iWfK++wfg84QAhOKXmSBGrDjOMz0iN2O08/l3eZ
         aDZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M5X8TLs5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471969ad730si11741281cf.172.2025.02.10.00.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 00:50:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M5X8TLs5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thPUM-0003vP-EW; Mon, 10 Feb 2025 03:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1thPU7-0003sZ-K9
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 03:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1thPU5-0004FH-O1
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 03:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739177380;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9XnpApMrWMs33jKiI5vvV2CtuS8qw1OBYUfsnaLN9E=;
 b=M5X8TLs5ogMoiI61weCpZvxjLpjjYSr7o9iZCc8OaMS1h4JcgSz4Ea02tgjdGw6zs0Q4/m
 pqGfAcJLcaEJk8mr1TArEHvw2BxRs6aTTm/3Has2N8DeLDeXfRxkOSwlZB/lOPPLKl8wNo
 7OraMEMlosRCFKmu/YuDnQDJaK7m4U0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-mzVBzcd9MauAfkrFg6j6NQ-1; Mon, 10 Feb 2025 03:49:38 -0500
X-MC-Unique: mzVBzcd9MauAfkrFg6j6NQ-1
X-Mimecast-MFC-AGG-ID: mzVBzcd9MauAfkrFg6j6NQ
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4361eb83f46so30627555e9.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 00:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739177377; x=1739782177;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F9XnpApMrWMs33jKiI5vvV2CtuS8qw1OBYUfsnaLN9E=;
 b=uXgXcrufq6uACPO72GMWu8pqxbmdhOsIEHuaLbL1spMcNt9Dsq45PJjKjTTXmM5c8j
 +jlcYnvedBBH75unK09XnKE//PROqdPTngkra6PK10kCguP289qqx00LMs0oUqjt+mKP
 P/9+7DlwTgZq9LCbhWGyizTZQzHdhUrjaEIZtBcb24v0fKjYkOoW0EtC9yX72z5dybYy
 VxRn2+GuGOvaUdOYMUFOcc4mJ8Qevb6uE8JBFN5H19yFIyUc47fX3ioLhBLHqPXt3q9k
 l1mCzeTaOPn333OYpcVunrXS+7C9hUPvDDnrHON+qe0i9RlZdW0wMJj2wBVeG1rNio//
 FKMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfamoOE3pmq2emlmNigYW6pnZ9x5d/nLQ17Hp/DRxcy/7wBMNGx8uxC8m8dITo1j9V1YRLxWyflw==@nongnu.org
X-Gm-Message-State: AOJu0YxMOZyyshUQ5DkNxXhlJ0ys/YfeOquMJ0agGmf+xf/jnSnYdQHj
 Y5GHB6TW9X43sO4iBGPLFH3E5V2jPtXuBVzt27q4TKF1ir6QweSdrGpuDJWsopqjwqWYqQGhF3K
 nVk8lk8kQDgHgUdw4+xI/qycKm/fyg14nb7FtmN3UwcMSB75d2Q==
X-Gm-Gg: ASbGnculXN69PTuGziAnkyjpBqWu4aR0S5fcCIzz5doKjCrdzOMZlH7wg+ypdrsAIP5
 6HGcYq3RQexcu9d8fywnsKts+Rjaa5eqqqYuDUU5jfRrkn63SQeKlree7cCZNIO9RPW9cZDf15a
 97WmtibbACEzKqRO6vIr8FpN7nY2opWRK6UEtk9rvxTmNbf14WIpx5LuHe9IWukrMFJz5r+xQz2
 LMydXttuVi6EwcCKOlFEtfUssNiyVxlHl8TQCr+7mkaqcsLW/eF8aXdbket4uEQKRHlRLL0n5EA
 BfAAtGxK6m3D0G2fXgRHs+McLzA4WlTVb/q8jJhWgCwezwhrNRef
X-Received: by 2002:a05:600c:4e43:b0:439:34d3:63cd with SMTP id
 5b1f17b1804b1-43934d364e7mr50688285e9.9.1739177376959; 
 Mon, 10 Feb 2025 00:49:36 -0800 (PST)
X-Received: by 2002:a05:600c:4e43:b0:439:34d3:63cd with SMTP id
 5b1f17b1804b1-43934d364e7mr50688115e9.9.1739177376638; 
 Mon, 10 Feb 2025 00:49:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dfd8047sm137405245e9.33.2025.02.10.00.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 00:49:35 -0800 (PST)
Message-ID: <c6b63631-181c-4cad-b542-5fc89f6d066d@redhat.com>
Date: Mon, 10 Feb 2025 09:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Fix vIOMMU reset order
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
 imammedo@redhat.com, alex.williamson@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <Z6Y6sf064FBWT5G1@x1.local> <2a18c763-cde4-4798-8866-3e023fc6ffc3@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <2a18c763-cde4-4798-8866-3e023fc6ffc3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0rfDFstfPOeuxP1yns9Apv68Mo-1K3tod9DgIWgUYwM_1739177377
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: txHRrVMhKO7y

Hi Cédric,


On 2/7/25 6:25 PM, Cédric Le Goater wrote:
> On 2/7/25 17:54, Peter Xu wrote:
>> On Thu, Feb 06, 2025 at 03:21:51PM +0100, Eric Auger wrote:
>>> This is a follow-up of Peter's attempt to fix the fact that
>>> vIOMMUs are likely to be reset before the device they protect:
>>>
>>> [PATCH 0/4] intel_iommu: Reset vIOMMU after all the rest of devices
>>> https://lore.kernel.org/all/20240117091559.144730-1-peterx@redhat.com/
>>>
>>> This is especially observed with virtio devices when a qmp system_reset
>>> command is sent but also with VFIO devices.
>>>
>>> This series puts the vIOMMU reset in the 3-phase exit callback.
>>>
>>> This scheme was tested successful with virtio-devices and some
>>> VFIO devices. Nevertheless not all the topologies have been
>>> tested yet.
>>
>> Eric,
>>
>> It's great to know that we seem to be able to fix everything in such
>> small
>> changeset!
>>
>> I would like to double check two things with you here:
>>
>>    - For VFIO's reset hook, looks like we have landed more changes so
>> that
>>      vfio's reset function is now a TYPE_LEGACY_RESET, and it always
>> do the
>>      reset during "hold" phase only (via legacy_reset_hold()).  That
>> part
>>      will make sure vIOMMU (if switching to exit()-only reset) will
>> order
>>      properly with VFIO.  Is my understanding correct here?
>
>
> Eric,
>
> We were still seeing DMA errors from VFIO devices :
>
>   VFIO_MAP_DMA failed: Bad address
>
> with this series at shutdown (machine or OS) when using an intel_iommu
> device. We could see that the VIOMMU was reset and the device DMAs
> were still alive. Do you know why now ?

I have started debugging this other case. At first sight this looks like
a different problem. First this occurs on a qmp system_powerdown
The error messages do not occur on qemu reset but rather as a result of
the guest disabling the intel iommu anc curiously when the aliased IOMMU
MR (nodma) is re-enabled. I need more time to debug this.

Eric

>
> Thanks,
>
> C.
>
>
>>
>>    - Is it possible if some PCIe devices that will provide its own
>>      phase.exit(), would it matter on the order of PCIe device's
>>      phase.exit() and vIOMMU's phase.exit() (if vIOMMUs switch to use
>>      exit()-only approach like this one)?
>>
>> PS: it would be great to attach such information in either cover
>> letter or
>> commit message.  But definitely not a request to repost the patchset, if
>> Michael would have Message-ID when merge that'll be far enough to help
>> anyone find this discussion again.
>>
>> Thanks!
>>
>

