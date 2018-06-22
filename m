Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp480993wrq;
        Thu, 21 Jun 2018 23:39:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpclfAKIWagIoQ3Q05S5mZDpx2Lx5RS3RgbleSBQQxjqwI31L/9DZcXYZfaSfhIgw4x0JSNn
X-Received: by 2002:ac8:509:: with SMTP id u9-v6mr269542qtg.97.1529649589085;
        Thu, 21 Jun 2018 23:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529649589; cv=none;
        d=google.com; s=arc-20160816;
        b=GplHYL1wULe4584Xo6Nkwe5RGDUcawNXQkYHxZlu8GGPyrSt2FRsFGzcLTiMYPuWzY
         vwn/Y0zf4h2sft0sWXBTz5MxQXOxuCnp63dfDA63L7dRQBvBi+8p+oCHNPCbHZIQwY+r
         Zp7QV1cVkoCdCr5+5Dg3IM7Xfb/BqYk/RY8Ux9VmBwZjQedqL3vATpJ1BdvJ2H5jzA5v
         M+9yt60ZRHv0WnziX9xW+94bRejdYYIMHUY9V2fbp4ez3kmaANvFD9FS2b/TrDk/KYJ4
         JLahXMIDVAjlwZkqt1QGxQdyc0jzNDJ1eUkhUajgfW8yY+wJvZdZs/A9Lz80z0tXdDy4
         arrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=eg/pFItKE6V1nSbAUFcWvxKNbMt2HbfeECk0ANB/Vgw=;
        b=V8fizr19INxYE97psUChT2x9qoj5Y/GvbWoVfPhVWkG35sQk+Ntzls7HUlzW4mHaqA
         Llre8bWumo8djcLOQsXW/cf67o+cItjl0B4dylEANdeeW7teMEIYvCpERfd8YcAuW+De
         dcdzs8DM0hwpzPSSU8vTjCAbAjLEBqIWL25rVGxB81mkbqfk0Zf8E8qBv+syhn3T1Coq
         zOUJF1cQTppSULTuTpzJV8m8oD4xzn/Wx4Sxz1qjYvLDnVnkb6hbr7TZI0YtfnWLzHIE
         xo2DAIX7P0vF/pzsI/Ycz1a46KGmItQJ7kir8ObLvUR90ccX6W3SQBhWGJKKrcqDuSoc
         mJlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o17-v6si6591464qtp.288.2018.06.21.23.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 23:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWFjY-0002yc-L4
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 02:39:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWFjP-0002yP-Tu
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 02:39:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWFjM-00083y-Rf
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 02:39:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39690 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWFjM-00083n-Mi; Fri, 22 Jun 2018 02:39:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8499400E9BA;
	Fri, 22 Jun 2018 06:39:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16E931C67C;
	Fri, 22 Jun 2018 06:39:34 +0000 (UTC)
To: Jia He <hejianet@gmail.com>
References: <d5f8be99-9602-a628-bc43-486e7befc4dc@gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <90a232ff-74f7-8d10-74f4-87a0008c41df@redhat.com>
Date: Fri, 22 Jun 2018 08:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d5f8be99-9602-a628-bc43-486e7befc4dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 22 Jun 2018 06:39:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 22 Jun 2018 06:39:35 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [Questio] What the proper vfio NIC for
 emulation smmu?
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JgEO1HT92+9L

Hello Jia,

On 06/22/2018 03:44 AM, Jia He wrote:
> Hi Eric
> I want to test your smmu emulation patchset with vfio-pci ethernet device.
> Could you kindly give me the NIC type information.
> In my test, there is vf probe error for menallox connect 4 NIC and TX Unit
> hang error for Intel X540 NIC. That's the reason why I ask this question.
> 
virtual SMMUv3 is not integrated with VFIO and is not planned to be. It
was tested with virtio-net-pci (without vhost-net).

With upstream code you should see the following warning:

"SMMUV3 does not support vhost/vfio integration yet: devices of those
types will not function properly"

With "[PATCH v3 0/4] ARM SMMUv3: IOTLB Emulation and VHOST Support",
vhost-net gets integrated. VFIO won't be integrated either. If vfio-pci
device are attempted to be used along with vsmmu, you will get
"SMMUv3 does not support notification on MAP: device %s will not
function properly"

My attempt to integrate the vsmmu with VFIO in the same manner as intel
iommu (using a fake caching mode) was rejected by the kernel maintainer.
So for VFIO use case, we need either 2 stage enablement (not implemented
yet) or virtio-iommu. I will respin this latter against v0.7 spec
probably next week.

Thanks

Eric
