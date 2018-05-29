Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3590613wre;
        Tue, 29 May 2018 06:47:24 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLE7w/UHpMJaDtDW1LhcU8YQAt+WcVv6CXG9P4EOmcQvQ0iRkMnv51DjjYMdN0B9VuD+/dq
X-Received: by 2002:ac8:1188:: with SMTP id d8-v6mr16452158qtj.352.1527601644230;
        Tue, 29 May 2018 06:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527601644; cv=none;
        d=google.com; s=arc-20160816;
        b=CiEoFklpMVLeydMMdAFa2fuaq/kcYS/8b6BXik3/EyDVrE9IO+qvWhoP8S+QfwE+tl
         svKZaMj5bJUeMChLXJvppbtRlLhXJ0dnebqyTUllGzJ+ZsN2+PZhe/VBxCy7F2AmMdyh
         IMGO+LuXiW800ko6AFutKi7/eSqWGC9WGqL6kdFgpHTddQOJ1a52QQDZ/YpG8qFj8HTf
         PTlwg4HJV2tYo6yVbDsKljOzqTt2rSMmuhzkxplhEIXy5DOyrEcG1zTAp9L7zSRDgplh
         FnJpLSfc7vljJC1um2uuazUzrI2lSCXNeJaTLwoo2d7wuwPFhqDj/9zogNtALAvU771u
         Bp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=7QSwmsVj9n9YKquZi+JP5XCzotMpoxdQPx62SguhiB0=;
        b=P3u/ZAajWLjHzx8JvVIYEyzVRZrPUV6AUI8DtqzaMg64oTW93GWtxHC4FYZyvhsSQF
         0eC/XvUD9LOk9bvPjhFvRvY5ViBpy7bt8dO73NusurzpnY8kkyi1aibK/F/8SILi1zyq
         xExKkgovJscCiwPavwZAFBNGF/00vPkUPsghkAaeCv8JcTaVMuu+U8QgkIESxc/M5nSk
         LZ65FBl5DscX9RxqyjjX/xiSSxwyJWCuWHzyHLUsSHLWCmYni/3miQQwmIncWfLWjgHN
         0wZ7V/aMbIFaNPGCz8I091M6T3YGq72wBAppDx3rMp1YNqjCkTwcwAmczpLiWmp4VOZE
         psIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i41-v6si988053qvi.207.2018.05.29.06.47.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 06:47:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNeyB-0006uW-Pw
	for alex.bennee@linaro.org; Tue, 29 May 2018 09:47:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNey4-0006uN-MJ
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNey1-0002cl-JN
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:47:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57816 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNey1-0002ce-Em; Tue, 29 May 2018 09:47:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED8594022909;
	Tue, 29 May 2018 13:47:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46DC6111E40B;
	Tue, 29 May 2018 13:47:09 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8yo_NKY=mHNYFFTA1+eR-731ePUb5hDum0ubUM2XOxxg@mail.gmail.com>
	<929ce9c7-afae-7978-ed35-3789fcbf026a@redhat.com>
	<CAFEAcA-yWBexVnpd9_iicL0o8A3TNZ2ezAf8nrYJ_ZPmB+xocg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <33e5bb20-aa77-d9bb-9445-dbcc590962c1@redhat.com>
Date: Tue, 29 May 2018 15:47:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-yWBexVnpd9_iicL0o8A3TNZ2ezAf8nrYJ_ZPmB+xocg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 29 May 2018 13:47:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 29 May 2018 13:47:13 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 3/7] hw/intc/arm_gicv3:
 Introduce redist-region-count array property
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
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s1NOyBntZ7WW

Hi Peter,

On 05/29/2018 11:13 AM, Peter Maydell wrote:
> On 29 May 2018 at 10:08, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>> On 05/22/2018 02:27 PM, Peter Maydell wrote:
>>> On 13 May 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
>>>> To prepare for multiple redistributor regions, we introduce
>>>> an array of uint32_t properties that stores the redistributor
>>>> count of each redistributor region.
>>>>
>>>> Non accelerated VGICv3 only supports a single redistributor region.
>>>> The capacity of all redist regions is checked against the number of
>>>> vcpus.
>>>>
>>>> Machvirt is updated to set the count to 123 vcpus for the unique
>>>> redistributor region we currently have.
> 
>>>> +
>>>> +    if (type == 3) {
>>>> +        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
>>>> +        qdev_prop_set_uint32(gicdev , "redist-region-count[0]",
>>>> +                             vms->memmap[VIRT_GIC_REDIST].size / 0x20000);
>>>
>>> We used to create a region which had num_cpu redistributors in it;
>>> won't this cause us to create one which has as many redistributors
>>> as will fit in the space ?
>> Is that an issue? From a machine perspective the whole region is
>> reserved for rdist. dt and ACPI will expose this whole region and the
>> device will use a subset of it? I agree I need to document this change
>> in the commit message though.
> 
> It's a difference, and a guest-visible difference too. This
> patchset is supposed to be introducing split-redistributor-regions,
> not changing the behaviour of other configs. Also, I don't think
> it makes sense to model a GIC with more redistributors than CPUs:
> real hardware doesn't look like that AFAIK.

OK I updated the series accordingly.

Thanks

Eric
> 
> thanks
> -- PMM
> 
