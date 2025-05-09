Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp951175njb;
        Fri, 9 May 2025 01:44:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmjZ1ElZb1kLvkWO0kPlKqhCQNRu+87vq6W0uaMv3xBhKXrXNwa7E+1eooolIrZNG987dKc2aoE8U3zQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEK12c/va0LRSCUJ4vPQturNcY33wUcUPdMPYZpYrPu4vpR2v/T59RAq4Itx+xzRNGKDRZe
X-Received: by 2002:ac8:7f55:0:b0:476:b7e2:385e with SMTP id d75a77b69052e-4945273b4e9mr34896431cf.17.1746780274145;
        Fri, 09 May 2025 01:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746780274; cv=none;
        d=google.com; s=arc-20240605;
        b=E143JYxtl3eWphPxkaGzrCZ+utiopM3BhwaGR6nffvxEYtqnFm79yAa/5h6C7czlLP
         YX1RddngYaHww6WEynv9Z9kvBILVS6ymgyvRLw68M8Tsv+Med+LJ+dp0INj0+b4/bTkN
         zapDxJzH9q+TOgzeEZgUpSySISIps7wphRWWz66o3Lva4sxfRnKnFVRQHt/zZlgIjeJ7
         SNtak2w/h2TV++nqJqHM7ugVLj3d5HP40eISFvQeEIvEXp1tbbU+7iMHu9nebnjp/kxA
         XuZ2cF/CB+50naCrf0EMmifmay3bqAPfOZO+nV0aK90ALvx5OVQLGL/8GexOJHcyh0vO
         npIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fBHynceJcsqRDfScd6aML6WkopdCdLRM/8UguPER3JE=;
        fh=m7u770aiODuQ6Y4Myn+6DocwuIU7a3ctsUPS8xZxumM=;
        b=iObVDZ8ybw1WUT+VN0tld96rBpVU26fhFsNeYvoRXe1auLq1P1SJhFjezPG1rNy04m
         LzUwySaB4yV2xOo46RSJ4INhjfrqIPzOr8K7DSLQIwclz6FT2P9Xt96C6kkE7tJ4kkyT
         Hd8uUueBZJoWXPCqVSV98PJXz2v+/JgKN7FygtvOUzuufCvW1anHVd3RPDKSPgMF8YYK
         IjGLjyFnm3LBR6p7imIt8xMtUiLFDdOsYPrJ23c/WboSNFyJpfVcHgLyMLVL3WyYq8yC
         y3X0zvOUWyoOhTbqzSSDpdpLxdiXBSR/rfB6vUs/dbIo7edbRYFJBzYB5l787884lJXV
         ef4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eIpUq+oY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452459f11si16758891cf.5.2025.05.09.01.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 01:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eIpUq+oY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDJL9-0000P4-AJ; Fri, 09 May 2025 04:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uDJL7-0000OS-NJ
 for qemu-arm@nongnu.org; Fri, 09 May 2025 04:44:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uDJL5-00063V-Uw
 for qemu-arm@nongnu.org; Fri, 09 May 2025 04:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746780254;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBHynceJcsqRDfScd6aML6WkopdCdLRM/8UguPER3JE=;
 b=eIpUq+oYsYY9LyaqZRBlVm3r6PWQPZSERp247jtEEuyRuhunp4QE8WnY6iQYYnDhlAjW1E
 f4RWbegDLidmKWcNIjWgwobYwnllTu4LBG/3El1mB5GHXDsD4/7puBx7HHP1HhCiyo6aHv
 ub3GqIlAsUXk2eMCrSy1wa18EzeN7is=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-RFXl6weyNpaPzjd7Mgj6pg-1; Fri, 09 May 2025 04:44:12 -0400
X-MC-Unique: RFXl6weyNpaPzjd7Mgj6pg-1
X-Mimecast-MFC-AGG-ID: RFXl6weyNpaPzjd7Mgj6pg_1746780252
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-441c122fa56so7601855e9.2
 for <qemu-arm@nongnu.org>; Fri, 09 May 2025 01:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746780251; x=1747385051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fBHynceJcsqRDfScd6aML6WkopdCdLRM/8UguPER3JE=;
 b=DXnpYzecOBQPRLvkwXQGsW494f47GRLi1XgPWfl+SIu8iJRrzOv3yHwb9KQENFqkqN
 xVx58er9pdl5Qwk281vTCkafPHKl1ubHdYwQavAh2V01Ada9Lc+l6tmljFEot2T8lN6/
 4FjbQaPDi4aNsnEwtCKpW4cS6pY3UtCWl2wNznEonWzjG39UPm/xluFRS1fSHrW4l7Lo
 7RQE9aswwmk1KVRKWQ5P/lA4MvFZ82b1xUbvSz7V+xSUVeQCel6dMfgQi8bLWMOYuArG
 1itOzPjHmU3uKk2IDCyaJfsAkIjExp8heXud8eGxs1Uo8Dn43FXEhurdJ/YociA0c0qd
 RGag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp1PcvrnIepG1RQfUEsTn/3Dlv3+MpXdzUYKCvlbn45i3ykxub4TkV0Ixuppgam7sEUz51EY6XOw==@nongnu.org
X-Gm-Message-State: AOJu0Yyss8iwhsyuN0HAFjQBfnzIK98pdNgFSHjO50n+jgbgEVO48xlR
 od91pqLrkSV8neH8MyyyUMgAW9fSIGGj/lggK6U5N4oVB++UhRt1O9nXYJxdTf8wx5hxz72tK6D
 Y8UO1dBCrxuOWNqA7ASDW2BgWznTSAUHky2d9nVeRPvllERUlBA==
X-Gm-Gg: ASbGnctOuBiurf7fc269vOYq0naKFWaTX74mXREOFCsvpBO/q+XmuQ4/QCotm+QdTba
 /9ShPxjm1dV3hAUacILAsXZuB0291BwWUdVuagdps0gbv98Q2TbPFOpRaMlv/ohAok74sj9VFk3
 yASy6PC4a9KduhVv6lWuh9Jzl+hn9DkPM7ncETepApuO3JKetwZGjjW0qRaj1x/aMkdPrZ7iSKb
 EpWwb5EYonSHon0gFUQckb/67igZY97ylTNvXF9F/wzup/oLTcl04R+f64UF31Os/mQvH0iQe+c
 J+65Acwpx0c3Na20MTzvMDOuTvIohc7m0FYkDZWrnpKrI7jHrm8EokuKMN4=
X-Received: by 2002:a05:600c:3f0f:b0:43c:fe15:41d4 with SMTP id
 5b1f17b1804b1-442d6d5d9e3mr16938745e9.18.1746780251593; 
 Fri, 09 May 2025 01:44:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0f:b0:43c:fe15:41d4 with SMTP id
 5b1f17b1804b1-442d6d5d9e3mr16938485e9.18.1746780251227; 
 Fri, 09 May 2025 01:44:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3aeb79sm64005565e9.27.2025.05.09.01.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 01:44:09 -0700 (PDT)
Message-ID: <39e01728-f0a1-4a2a-ac35-0078b7289314@redhat.com>
Date: Fri, 9 May 2025 10:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Donald Dutile <ddutile@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Shameer Kolothum via <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
 <877c2ut0zk.fsf@pond.sub.org>
 <e02e884b-0f3d-4426-8a67-2cbd23e80e8c@redhat.com>
 <87frhglwjl.fsf@pond.sub.org> <72f9043a73294bfc9b539ae9b94836d3@huawei.com>
 <d21e0c57-b89a-4c79-958e-e633de039e4c@redhat.com>
 <c0ab36fc56ff498196b359f5aee3746b@huawei.com> <aB25ZRu7pCJNpamt@redhat.com>
 <5b46c81a412f410494f28a2f9ebb9430@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <5b46c81a412f410494f28a2f9ebb9430@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GAO3hOUdXGz4ibIiLdp_6r-sI7_F9JeMAX_m1kA0EW8_1746780252
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6cD/MHMYA6iR



On 5/9/25 10:18 AM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Daniel P. Berrangé <berrange@redhat.com>
>> Sent: Friday, May 9, 2025 9:14 AM
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Cc: Donald Dutile <ddutile@redhat.com>; Markus Armbruster
>> <armbru@redhat.com>; Shameer Kolothum via <qemu-
>> devel@nongnu.org>; qemu-arm@nongnu.org; eric.auger@redhat.com;
>> peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>> nathanc@nvidia.com; mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a
>> PCIe RC
>>
> [...]
>
>>>> - bus pcie, id=pcie.<num>
>>>> - device iommu=[intel_iommu|smmuv3|amd_iommu], bus=[sysbus |
>>>> pcie.<num>], id=iommu.<num>
>>>> [Yes, I'm sticking with 'iommu' as the generic naming... everyone thinks
>> of
>>>> device SMMUs as IOMMUs,
>>>>   and QEMU should have a more arch-agnostic naming of these system
>>>> functions. ]
>>> Ok. But to circle back to what originally started this discussion—how
>> important
>>> is it to rely on the default "bus" in this case? As Markus pointed out,
>> SMMUv3
>>> is a platform device on the sysbus, so its default bus type can’t point to
>> something
>>> like PCIe. QEMU doesn’t currently support that.
>>>
>>> The main motivation for using the default "bus" so far has been to have
>> better
>>> compatibility with libvirt. Would libvirt be flexible enough if we switched
>> to using
>>> something like a "primary-bus" property instead?
>> Sorry if my previous comments misled you, when I previously talked about
>> linking via a "bus" property I was not considering the fact that "bus"
>> is a special property inside QEMU. From a libvirt POV we don't care what
>> the property is call - it was just intended to be a general illustration
>> of cross-referencing the iommu with the PCI bus it needed to be associated
>> with.
> Cool. That makes life easier 😊
Agreed ;-)

Eric


>
> Thanks,
> Shameer

