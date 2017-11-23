Received: by 10.223.159.82 with SMTP id f18csp912545wrg;
        Thu, 23 Nov 2017 08:05:49 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZYoAZJCr1RqsavHo0maHfPfttTQ7aPO4kXaPtN7RvjHXluRKPTyt3NiQhQozq39otkorKZ
X-Received: by 10.129.146.18 with SMTP id j18mr15950967ywg.288.1511453148977;
        Thu, 23 Nov 2017 08:05:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511453148; cv=none;
        d=google.com; s=arc-20160816;
        b=tNzyiIcPxeD0BUyvPw+bXMgS5UC6dR3k8RCR//vh+XwkdFOAQPSQAlCpxCfKKIR9T4
         RmQ9bqmgRuvoP5dcUADnAjKofyjl1Gu5B9NoDHEK6sgS97+hemDgYoB0hMQoy55I86fg
         QPUwK3KZbqgAoUJsU+W9FXfzV7U5sI/bOfBF4+Hq9szUMqQVnjnxiPYQDJGHY1OgTeKh
         J7DjATwhcjLVDamJgFqNHc6COm/Mdq556tJ/tYoZriIEkBj8+1lBn37i31Gxt8wJCemB
         p6sEpHR8CAGDqXWNbXWclm4qQ76yg4KYKpDgWBtJFn7poi+RzOKZTjX/ik7nxPygyBk3
         ctrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=o7Wds4pGq4qskrK+01YVkSxGJ92ZY+vqnUGFpe5s+WE=;
        b=JUYga+g1cOuDcXN5QLpny/l2abFdMmlwoxF2CgLrs9AGpC5TQTr7AhORzgT1kLuTNO
         WRY54Knzx+3K9my6wsJT8OEdL5logkZcxbJ4c/ceGQ3i48bVBYo4gYpPea2w8Odvrifm
         MZ725wJpRaXGZ0kbBKQEJkHwdRwmfCYQ0WNAdj92QQX2Ve62B7F+aqFcHdFO57vbFuL4
         xGm2r1Tlc/rriSnLaKe/+7dFVvz7zxAMpNuMrvuELfrZBjdBDoRk3k6euDssNAX47Gjd
         pqFh9cEPZtl/aLeWIxGWyPWA0LQ4p/oJWrYHntF2Z4bF0yc+2hUbAJOlpQ4B+0xe6YAh
         4LVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x127si4092387ybg.139.2017.11.23.08.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 08:05:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHu0a-0004Jf-Fk
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 11:05:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHu0S-0004IG-K6
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 11:05:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHu0P-0002R0-Sf
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 11:05:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45866)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eHu0P-0002QO-M5; Thu, 23 Nov 2017 11:05:37 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDED9FC7A0;
	Thu, 23 Nov 2017 16:05:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9BB85EE1E;
	Thu, 23 Nov 2017 16:05:30 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8T4cShPYONdo8hiaZKvd+zq9Uo1o5awU3rA03uu8Vsiw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <1bede1e5-cc11-dca6-9f0b-ef16b9031d7a@redhat.com>
Date: Thu, 23 Nov 2017 17:05:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8T4cShPYONdo8hiaZKvd+zq9Uo1o5awU3rA03uu8Vsiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 23 Nov 2017 16:05:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 0/4] vITS Reset
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
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	wanghaibin.wang@huawei.com, wu.wubin@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GE6P5OBTru91

Hi Peter,

On 23/11/17 16:19, Peter Maydell wrote:
> On 23 November 2017 at 14:56, Eric Auger <eric.auger@redhat.com> wrote:
>> At the moment the ITS is not properly reset. On System reset or
>> reboot, previous ITS register values and caches are left
>> unchanged. Some of the registers might point to some guest RAM
>> tables which are not valid anymore. This leads to state
>> inconsistencies that are detected by the kernel save/restore
>> code. And eventually this may cause qemu abort.
>>
>> This series adds vITS reset modality:
>> - the 2 first patches bring a minimalist reset through individual
>>   register writes. However, with kernel versions < 4.15, this reset
>>   is not complete (vITS caches are not voided).
>> - With kernel versions >= 4.15 we can rely on a new ITS KVM device
>>   reset IOTCL. The last 2 patches introduce the full reset.
>>
>> Patches 1-2 have all kernel dependencies resolved.
>> Patches 3-4' dependencies were pulled for v4.15-rc0 but as the tag is
>> not set, the kernel header update still is partial.
> 
> We don't need the change to be tagged for us to sync with the
> kernel headers: if it's in mainline that's good enough.

OK. do you allow me to keep a partial update for:
 linux-headers/asm-arm/kvm.h
 linux-headers/asm-arm64/kvm.h?

When using update-linux-headers.sh I get suspicious errors at the end:
grep: /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such file or
directory
sed: can't read /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such
file or directory

and include/standard-headers/asm-s390/virtio-ccw.h deleted

I would prefer having s390 people checking and testing that.

Thanks

Eric

> 
> thanks
> -- PMM
> 
