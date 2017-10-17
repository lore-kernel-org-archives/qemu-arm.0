Received: by 10.223.197.9 with SMTP id q9csp4568638wrf;
        Tue, 17 Oct 2017 05:54:49 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBKqMvXjMDZc7svDT5bVxMLsipoIbuDJETvyP91DLvkEfNEkUE3fXY9nPQ+SXTr5Ej2YF2R
X-Received: by 10.55.134.70 with SMTP id i67mr19200227qkd.22.1508244889428;
        Tue, 17 Oct 2017 05:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508244889; cv=none;
        d=google.com; s=arc-20160816;
        b=jOGYMoMlcM5IdgLBxTWNBQQNXGQiqsxat378KDnGWv/Tj6BdBcpqKNVVJ+hLL0MC3Y
         X9YHxOtIi0DNT+YYyWgvVTqtzq8MmRCXVNQR5pe0banB5VFVmLejhBwezLN85q50r8pK
         5c5p7QuMteKYnSy8TFx9hnobwmrkFB4OCtm5ZLwYnRWhfkws7XGP8XvZSHJVwIS6dcsP
         A/z+CaBVpLL1qOr1ve2Cn/Yg2Vo+BsLZJeLy4vyMScQftqKpQ5OWgYk+/r9IckypcV+f
         yP/CY1H0iYfRfRUqbYUa1Pbg+QFABpWvZHYP5dRJ//ZIPiOAcyhTAYN5NHdSIFt8qwng
         OjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=XLKWN6nlf3gYfM9ZvlmX7iJPq2sXv6qwZbu7lZfppNI=;
        b=UnOnZd5hUVu/9SXaF/aZ2DLwX5uwvrV2Yywh+1g652zl0tYVouz0A4NZELw/tzGKSP
         dDvsRgoOkPC0+OQRK8IbEjZkk1hYa7z3/XbN8OZ6jPhkvdM4QXAxKI35VzxXx3cHjPIQ
         sqQGWPimF5dFw6tLmemXh0NR+2IqkTKujxTfsrgeLgmo8HrUwxJW38ROzpLD5CMiXarD
         CdKe6eoZTvThRARcGAD246WcARSXLmhI7fM1nz4AWv5UJ0Y/CxfBUbgtyf0y92wkFrdm
         PDDPyQYFuogVkcdvHuh0qGkgLKYDX1/kPhhTqQkBlF6rKaFpyrTQmW63j6AlJ9q4oJbH
         sv0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f13si640964qtj.438.2017.10.17.05.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 05:54:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4ROR-0006od-5e
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 08:54:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e4ROI-0006oU-Tr
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 08:54:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e4ROB-00021K-5w
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 08:54:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58754)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e4ROB-00020r-04; Tue, 17 Oct 2017 08:54:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6E94155AC;
	Tue, 17 Oct 2017 12:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E6E94155AC
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA8A0619DB;
	Tue, 17 Oct 2017 12:54:21 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
	<1506524205-20763-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9P51hn60vYErotTBc9m4REq=fgfp0ZN18mFtoLLbS9ZQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f2e21f58-f630-cbf4-904a-3d86d7c38d3f@redhat.com>
Date: Tue, 17 Oct 2017 14:54:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9P51hn60vYErotTBc9m4REq=fgfp0ZN18mFtoLLbS9ZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 17 Oct 2017 12:54:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC 1/3] hw/intc/arm_gicv3_its: Don't abort on
 table save/restore
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WB4uzwL2gZ9p

Hi Peter,
On 12/10/2017 13:54, Peter Maydell wrote:
> On 27 September 2017 at 15:56, Eric Auger <eric.auger@redhat.com> wrote:
>> The ITS is not properly reset at the moment. It is possible the
>> GITS_BASER<n>.valid is set and the in-kernel ITS caches are not
>> empty (list of devices, collections, LPIs) while data structures
>> in guest RAM are invalid/inconsistent.
>>
>> For instance, this happens after a guest shutdown -r now or a
>> system reset, if we save the state before the guest re-writes
>> the ITS registers or map devices, the table save ioctl may
>> produce a QEMU abort.
>>
>> Until there is a proper reset implemented, let's unplug the
>> consistency error checking.
>>
>> The reset issue will be fixed in subsequent patches.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: wanghaibin <wanghaibin.wang@huawei.com>
> 
> When in particular does this cause an abort -- when we're
> trying to save the state in these edge cases, or when we're
> trying to restore it?
Both.

After a guest reset, device GITS_BASER<n> may point to an L1 device
table that is not valid anymore. In that case device table save IOTCL
returned -EINVAL and we aborted.

On restore we had a bug in case all data in the table is invalid. In
that case as well we currently abort.

 What does the kernel do -- is it just
> rejecting the attempt, or might it actually have done bad
> things to guest memory ?
On Save, in case the GITS_BASER points to an invalid linear device tree
table but the page still corresponds to a visible gfn window, this
memory could be overwritten by the kernel.

Thanks

Eric
> 
> thanks
> -- PMM
> 
