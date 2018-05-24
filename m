Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2218682wre;
        Thu, 24 May 2018 12:14:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKresud2Zs/Krvc9H4r3mM7pR/jaMO/o+1bDsFBL3HF7mrVj2YB/48kj4PH5wyWu370eUqA
X-Received: by 2002:aed:2461:: with SMTP id s30-v6mr706240qtc.4.1527189240997;
        Thu, 24 May 2018 12:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527189240; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9WLpOZ1495m/8FOt1e6lAOFkBJyOKwtRTF/nPwZMZ0897l3ucOLV0pbNKGLOsGfr+
         wphrrScj8cWDqZgu44pQPxgTPuYq/fSgfEGgLQO4iZX9nJNVzqLZfeB/JUL7hGLf8DCT
         82ozCf2PT3tC4HGPNbDN0Ic3Jo+PEpsgfdeNUYxIuxl0gmCN6+1pf5UuKIi+cu3tgeMu
         t9h+lbyE/CKw3Lj9m1imBYaRwZB5qCy6PTYx8dMYMpVj05+ezcI/xneb0VXoosAlpFWK
         C8xXeeES6RyW3sy8WvVodtBgrmEP8RgxESHKd471SKBsZ9d5/Scw1HZiGmnM0+EW4rMz
         jL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=SQMMTGOBN15wDS8uaNzr/Vd0NXr0xrFqDAOZb6iurIs=;
        b=p00RZeQjYNmdnAM5pHcDUV7BOm5km4CJamisGTMeeLGxtnq5cqcX8c/wBi0JD6ghkE
         gBkpgFoCzeqQhvjj9ujoKfu3oI6bPRnITIkZr4mGLszq7LWKjyQAUnnW8VGU2siQt4dZ
         MaWil/b/92TiaDOb3fI5z53HaUX+vMUcjSsVeeScQEzLiIIBbppRtI6nSqtRTGy1vwnq
         BdKFFIPKhP3hNLEJ1HZoyu4mqWmKfi1fCtUc/wpc4vwf2KG8nNYzLku9gQGlL9Lt8/Wf
         bWx5vm2P8Uwp3K3M2zj2l3ox0IVL/IBwnGu8AZKiw2NaqTROAmvYYROoHpr+TCsF9vPM
         RWEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id t35-v6si13409091qvc.208.2018.05.24.12.14.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 May 2018 12:14:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7501E818BAF4;
	Thu, 24 May 2018 19:14:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25BBA10AF9EA;
	Thu, 24 May 2018 19:13:59 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 15/27] iommu: Add IOMMU index argument to
 notifier APIs
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-16-peter.maydell@linaro.org>
 <0774094d-d3e1-5983-ccb8-3d3412bf44fc@redhat.com>
 <CAFEAcA95XD7_4q0p0Q6aPCxHHxHoRrVaKc+Nq+niZp-4PV8JLw@mail.gmail.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "patches@linaro.org" <patches@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8b0353e6-18f1-6e7f-5f4e-2d1a06a20b29@redhat.com>
Date: Thu, 24 May 2018 21:13:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA95XD7_4q0p0Q6aPCxHHxHoRrVaKc+Nq+niZp-4PV8JLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 24 May 2018 19:14:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 24 May 2018 19:14:00 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: NbtG7IxDo8s9

Hi Peter,
On 05/24/2018 07:03 PM, Peter Maydell wrote:
> On 24 May 2018 at 16:29, Auger Eric <eric.auger@redhat.com> wrote:
>> On 05/21/2018 04:03 PM, Peter Maydell wrote:
>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>> index f6226fb263..4e6b125add 100644
>>> --- a/include/exec/memory.h
>>> +++ b/include/exec/memory.h
>>> @@ -71,6 +71,7 @@ struct IOMMUTLBEntry {
>>>      hwaddr           iova;
>>>      hwaddr           translated_addr;
>>>      hwaddr           addr_mask;  /* 0xfff = 4k translation */
>>> +    int              iommu_idx;
>> I don't get why ne need iommu_idx field here. On translate the caller
>> has it. On notify the notifier has it?
> 
> I think this is an accidental leftover from some earlier draft;
> nothing in the patchset actually reads or writes this field, and
> it should be deleted.
> 
>>>      IOMMUAccessFlags perm;
>>>  };
>>>
> 
>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>> index 8e57265edf..fb396cf00a 100644
>>> --- a/hw/vfio/common.c
>>> +++ b/hw/vfio/common.c
>>> @@ -507,6 +507,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>>      if (memory_region_is_iommu(section->mr)) {
>>>          VFIOGuestIOMMU *giommu;
>>>          IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
>>> +        int iommu_idx;
>>>
>>>          trace_vfio_listener_region_add_iommu(iova, end);
>>>          /*
>>> @@ -523,10 +524,13 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>>          llend = int128_add(int128_make64(section->offset_within_region),
>>>                             section->size);
>>>          llend = int128_sub(llend, int128_one());
>>> +        iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
>>> +                                                       MEMTXATTRS_UNSPECIFIED);
>> In that case VFIO ideally wants to be notified for any guest update
>> (whatever the page set) to reprogram the physical IOMMU corresponding
>> entries and doesn't want to register a notifier per iommu_idx. Also it
>> does not know which ones are supported. Is there a corresponding
>> iommu_idx value? MEMTXATTRS_ANY?
> 
> If VFIO is actually dealing with an IOMMU that needs to handle
> multiple possible transactions for different tx attributes, then
> it needs to know about all of them, because how it programs
> the physical IOMMU needs to be different for "map X to Y for
> Secure transactions" versus "map X to Y for NonSecure" (say).
> (This would require new kernel APIs, I assume.)

Hum agreed. In any case the iommu_idx must be passed to VFIO along with
the notification, either as part of the notifier itself or in the
IOMMUTLBEntry. So VFIO may need to enumerate the supported iommu_idx and
register a notifier for relevant ones.

Thanks

Eric
> 
> If, as is currently the case, the VFIO infrastructure assumes that
> the IOMMU will always translate any transaction from a device
> identically regardless of its transaction attributes, then it
> should just use MEMTXATTRS_UNSPECIFIED, and trust that the
> emulated IOMMU will translate those correctly. (There might be
> scope for VFIO checking that the IOMMU really does, eg that
> it is only using one iommu index?)
> 
> Basically, VFIO is shadowing the behaviour of the emulated
> IOMMU to reflect it into the kernel; if the IOMMU it's shadowing
> is complicated then VFIO is going to need to be similarly
> complicated, and "merge updates for different page tables
> down into one" is not going to be the right behaviour.
> 
> thanks
> -- PMM
> 
