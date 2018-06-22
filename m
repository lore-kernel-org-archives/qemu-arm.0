Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp500965wrq;
        Fri, 22 Jun 2018 00:06:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfWneZNazFNtybHWsDxX+dlISM6UFDo/JEYX0HUXaMGm926595oktQhxW9pSgGrXc2VELMp
X-Received: by 2002:ac8:3fb2:: with SMTP id d47-v6mr293690qtk.401.1529651187923;
        Fri, 22 Jun 2018 00:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529651187; cv=none;
        d=google.com; s=arc-20160816;
        b=zQsiV0lLGy/D/LCcm9Mw6l51wneX0WkOb6Dc1tkQ2qe9cpcQ6O++dZEF18K79Z4P/V
         0yzrrrxvzurM5IUjbRAIYB78DbQqSoAAwal6jlEijT5rvWfzkJ0zewC8SCkRyqomcMOt
         A4zSkUkUzn2duchWLfizK//lgEkCacSXapOCh+4d+OmGgYsjTvUbBnhqYGdoRRESlBj1
         SAaLfgHbYaevZVYNevhQR/CvhANnOuHqNJh1NkdNn9BR8iEiOUgs+fIASAwQGUQgyBGE
         7F5CYL0+M099WI3Sy5/oBJR5ZKham4cbQkORRDfmzpvPpfE04ukQMhAaUdj2JB9sZOG3
         iWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=zKX4cOi1/qhcHstX6ziJuz7XHxCDH2VqrdlcMS+Ms9s=;
        b=NE2Bx5qMa/BLC6xkAZXjsf7y/qDOAQ79duCrqRaIen9qXXdAKVTOE1R1qkIbMebFkP
         Tyx+MTi3CiSymLEWC+2jUy52BumbfpphrVTihW2aWaMRfAEWRO8qRT6P0L6OxTlgogtO
         5dNpQwJya5BkM2S3ptKm1B5sIN5heuoMEjd2PtQz/90ijiCmcZi5Bsj14ydLnw8Qpki4
         GFQ04ieSv6aYxNtFF1tvKPRJTapbPKnXEucOY5UdwT6OteRce/ZAacMhhoy9TcdSuL3c
         eZ4TaokuxsrLGABXUToJnquoAdtYEjTkfp7U+Cp+A1e8Bq/7dz2snEMwIT9xUcKyfyPE
         /xFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rU8ODdgP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18-v6si6900199qvf.10.2018.06.22.00.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 00:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rU8ODdgP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWG9L-00005P-EZ
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 03:06:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fWG8v-0008VT-AZ
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 03:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fWG8r-00057B-Cu
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 03:06:01 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:42207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hejianet@gmail.com>)
	id 1fWG8r-00056U-5R; Fri, 22 Jun 2018 03:05:57 -0400
Received: by mail-pl0-x243.google.com with SMTP id w17-v6so3006853pll.9;
	Fri, 22 Jun 2018 00:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=zKX4cOi1/qhcHstX6ziJuz7XHxCDH2VqrdlcMS+Ms9s=;
	b=rU8ODdgPEQ0gjWa2M38lezFM4H/5nXh666LxfzRdttJylMMY5j53KpXwmG35uz63Cd
	tQXKf3xsUneZ2Dn2DnkQwQUbVJBTGFzAefPwJ2RwVkIqA+9Wtl+a1oeM3WFgfvBC0sWx
	uL4EEk8OPCGlnTTD8QvHWj7hQ+3AgI0nlix5jMxaa+23IX84A1Of6l2OU9hzxWCQjx3n
	t/vVGQvVU6yMJJHp24acl2gJ7ZkqUN6p8oiDgdA+hiIyEd0QBvRa5wUeKftVHx8zrCuG
	jJJ5McOskhmLT2c5NxSuBm0F4Wc8epxapiiMsiGaFDhMm2ywhelwKlBsCzK7XROlIEpn
	fqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=zKX4cOi1/qhcHstX6ziJuz7XHxCDH2VqrdlcMS+Ms9s=;
	b=i6W8VkG5tQzdZFOq9mxUA2ilib16+egMowr6wlPbLd9H/8oxeh+SPqQXM1ZtN6eCt4
	LYIQDsfSx9T6S8wkrlvawrx00Jbd2ptyDAweWpe2xWgq/U/1rfhwGE9hWyd2yWli6n2Q
	nFuszlfvGtCJQg9I1U9VmSZAr3Ud52UXNWvMr1Fx1YOOqTW7CcWx7oKrOBarm26XG9JM
	MdiZ9Ja3vLJf+7OyzjQhe7qf4zsyWSM/yknXWn8dBBXdHinxI8mJr1oa+QOoPHXRH725
	ABOmdf0KgEYtOJu7ke9P9INNCLU2PxqyMZDruU9IPBGXHl2flxGm/r1IIsRddULOl1ye
	q/wA==
X-Gm-Message-State: APt69E0oMmlOh6PNyvynajLE4LcHgefnI7JUb58wQlF8lUwIyobqP0IZ
	jKW/LaGZy74OXMIgjqvWbzQCjjqB
X-Received: by 2002:a17:902:850b:: with SMTP id
	bj11-v6mr421060plb.210.1529651156086; 
	Fri, 22 Jun 2018 00:05:56 -0700 (PDT)
Received: from [0.0.0.0] (67.216.217.169.16clouds.com. [67.216.217.169])
	by smtp.gmail.com with ESMTPSA id
	82-v6sm12429074pft.74.2018.06.22.00.05.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 00:05:55 -0700 (PDT)
To: Auger Eric <eric.auger@redhat.com>
References: <d5f8be99-9602-a628-bc43-486e7befc4dc@gmail.com>
	<90a232ff-74f7-8d10-74f4-87a0008c41df@redhat.com>
From: Jia He <hejianet@gmail.com>
Message-ID: <cfbf2dd4-4f1c-8eae-5ce4-feb7b1547e2e@gmail.com>
Date: Fri, 22 Jun 2018 15:05:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <90a232ff-74f7-8d10-74f4-87a0008c41df@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-devel] [Questio] What the proper vfio NIC for emulation
 smmu?
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sAG7oAtZNRRh

Hi Eric

On 6/22/2018 2:39 PM, Auger Eric Wrote:
> Hello Jia,
> 
> On 06/22/2018 03:44 AM, Jia He wrote:
>> Hi Eric
>> I want to test your smmu emulation patchset with vfio-pci ethernet device.
>> Could you kindly give me the NIC type information.
>> In my test, there is vf probe error for menallox connect 4 NIC and TX Unit
>> hang error for Intel X540 NIC. That's the reason why I ask this question.
>>
> virtual SMMUv3 is not integrated with VFIO and is not planned to be. It
> was tested with virtio-net-pci (without vhost-net).
> 
> With upstream code you should see the following warning:
> 
> "SMMUV3 does not support vhost/vfio integration yet: devices of those
> types will not function properly"
> 
> With "[PATCH v3 0/4] ARM SMMUv3: IOTLB Emulation and VHOST Support",
> vhost-net gets integrated. VFIO won't be integrated either. If vfio-pci
> device are attempted to be used along with vsmmu, you will get
> "SMMUv3 does not support notification on MAP: device %s will not
> function properly"

Thanks for the information. Actually, I am using your vsmmu-optim-v3 branch.
I assumed vfio worked fine since you removed that warning in commit
("hw/arm/smmuv3: Add notifications on invalidation"). Seems I am wrong ;-)

> 
> My attempt to integrate the vsmmu with VFIO in the same manner as intel
> iommu (using a fake caching mode) was rejected by the kernel maintainer.
> So for VFIO use case, we need either 2 stage enablement (not implemented
> yet) or virtio-iommu. I will respin this latter against v0.7 spec
> probably next week.
Ok. got it, thanks
> 
> Thanks
> 
> Eric
> 

-- 
Cheers,
Jia
