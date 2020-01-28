Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp414906lfp;
        Tue, 28 Jan 2020 04:34:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzGuMJjTFY6eZ1W04EC+vDkt3frIhOi5D63SLNWiWYrXpaSbtHFiUN+BuI6EKflsHHy/RMa
X-Received: by 2002:a0c:db8c:: with SMTP id m12mr7021120qvk.154.1580214864573;
        Tue, 28 Jan 2020 04:34:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580214864; cv=none;
        d=google.com; s=arc-20160816;
        b=kukmI0XH3x3GuSxuBmXDWOAblFYpV/7YKf5LI52wRScoQk71nKqmN9S4SBAWVFiovL
         v+EfJ6FDHaANxLDYOvmar4bOx0U0Ud3POm35fJtAffhrreZLOOQ3vrZEetty4BePRW1a
         Pv/mLxwKrEP2A4uJBfl93qLS7XPyiOWCm0djeW+RQ7ZYc2+rp4tspt/ztaPVD/+/W1wC
         wTMPswGIRyw0PvWrArvwK93M+hiFMBwcbHa0IMefzjB6c++t7ywB7Kuh7Urs2EdRErW9
         IcsPceCi4HSERU7XHi4s0iD0L1m9gT4hLEfjv1QDHY0hjBBeQF5DRoUI3lRHeuA+wmtU
         nwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qYrr1r5HScc8LjsIpP5plCEtmmtVdUjtmM5ZorajYj4=;
        b=HEM2VtULej5e2GQVQEkDsE0fW+1ZTjg3y4glwXIVhyUFo5l4OsqzLtz8JVfaaEJ4v9
         RFZa4ycAo8+QqY4695q5mI6504l2zwFQAIpjl4foo0IN/+2RVXE+mv2gqtfV+xSy4+6D
         VkjUVISABfdr7uq+P4+u6MF2QOqgsnb1dojqdDdpyi/5z0ufR4q+NFu6YQ9wRmkyR5PO
         +M/GsQqV03zse5AXYRyflLotYsyMY2ZcWbIYXEFzqipV+YlG5LDUZVQWCH+ZY2ldfpcu
         Bh5zod94HFYJZ1rElFjFUaSwUtsxsny0+RVTsnngQkx1tKdmQFeL+pLx+H6tgnEVCUA8
         M67w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LqB6Igzz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26si11759020qtn.7.2020.01.28.04.34.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 04:34:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LqB6Igzz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwQ4W-0001K5-2C
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 07:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iwQ4O-0001FK-GV
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 07:34:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iwQ4N-0007R0-Fu
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 07:34:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60620
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iwQ4N-0007Qh-Bt
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 07:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580214854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYrr1r5HScc8LjsIpP5plCEtmmtVdUjtmM5ZorajYj4=;
 b=LqB6Igzz3UwojTBVoAO+nl/EmMTpxfzpFDvpW0ML8RicfeaKLEdTTRMsS53nsETn20Ivpb
 /dQZ1c4bCr7OM0S4rGCz8GOv8ZRMmu3ji4JukTDHjtdiIHvo90BSfrwJigxd+7EAWRrEvG
 u5IZ/DHlwa/ycdWyWTHFkXwGBGnsqTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-f3jAmo7PMRKPlP2m-0SE3A-1; Tue, 28 Jan 2020 07:34:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5310E800D48;
 Tue, 28 Jan 2020 12:34:12 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21A6286E0E;
 Tue, 28 Jan 2020 12:34:09 +0000 (UTC)
Subject: Re: [question] hw/arm/virt: about the default gic-version in
 accelerated mode
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <df1d6ae5-b734-ef64-4ef9-c661e8f797e8@redhat.com>
 <CAFEAcA8hib-3YWuS-MajjvokOFCGKUHeuz+XQTBYf8LBz+PuFQ@mail.gmail.com>
 <20200128122915.ehzgj5kpmsw5azap@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e0b73504-b37a-cc57-3c3f-b9872dd1e16c@redhat.com>
Date: Tue, 28 Jan 2020 13:34:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200128122915.ehzgj5kpmsw5azap@kamzik.brq.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: f3jAmo7PMRKPlP2m-0SE3A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cy04YtJMXqhe

Hi Drew,

On 1/28/20 1:29 PM, Andrew Jones wrote:
> On Tue, Jan 28, 2020 at 10:52:50AM +0000, Peter Maydell wrote:
>> On Tue, 28 Jan 2020 at 10:47, Auger Eric <eric.auger@redhat.com> wrote:
>>> When arm virt machine is run in accelerated mode with "-cpu host
>>> -machine virt", the default gic version is 2.
>>>
>>> I understand the rationale with TCG where we don't have MSI ITS
>>> emulation along with GICv3 so we need to choose GICv2 to get GICv2M
>>> functionality.
>>>
>>> However in KVM mode, I would have expected to see the host GIC probed to
>>> set the same version on guest. Indeed most of our HW now have GICv3
>>> without GICv2 compat mode so our default values lead to weird traces:
>>>
>>> "
>>> qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
>>> qemu-system-aarch64: failed to set irq for PMU
>>> "
>>>
>>> I would like to propose a patch to improve those errors and also suggest
>>> a hint. But I also wanted to know whether you would accept to change the
>>> default value with KVM and choose the host version instead of 2. For TCG
>>> we would keep v2.
>>
>> As with the -cpu option, the default is there for command
>> line backward compatibility primarily. Even if we had
>> better support for MSI ITS emulation we'd still leave
>> the default at GICv2.
>>
>> If you want "do the best you can, regardless of accelerator"
>> that is "-cpu max -machine gic-version=max".
>>
> 
> There is a case where we can probe without breaking backward
> compatibility. That case is kvm-enabled and no gic-version
> specified. The reason it would be safe to probe the GIC version
> is because unless the host was a gicv2 host, then that command
> line wouldn't have worked anyway.
Except if the host GICv3 has a GICv2 compat (which is pretty unlikely)?

Eric

 And, if it is a gicv2 host,
> then the probing will come to the same conclusion as the
> default and nothing will have changed.
> 
> Thanks,
> drew
> 
> 

