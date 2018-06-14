Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1765031wrq;
        Thu, 14 Jun 2018 02:03:56 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKo8kUlzLmEvPXXlAV3T+tJp8DEprBEGekal9d9KIZxzrNGuSWsgXDooUYI5u0s2ynWsLry
X-Received: by 2002:ac8:2e1c:: with SMTP id r28-v6mr1425780qta.156.1528967036581;
        Thu, 14 Jun 2018 02:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528967036; cv=none;
        d=google.com; s=arc-20160816;
        b=njMGqcpNkdb/O5D1JNeVtU/lXvJ+UrmqqCkMXe0hyhEfVIB5fJ0XbwNHhoRVFRqO/s
         l99BSvEekHIf5cC8rgiXj+Vt+1iesxW1SWIKbsxUuKLFEhyXAgph4JMSuOdOZxycKmRX
         wsWmwHyE7IiIy+zutvY6nBmSE3eXz3nE3fUbfckPp0PSMWw3OAYqGCKXA5WrmpqLSvVU
         plJg+nvKLE6WXIhr25/O33sGCMl4YqAMHFeGl0iIOJPyt7Qc+UApkZGFEb/2BfXb0Ncz
         adMfEw94k1+gD89CNzxOzS+kARLX+OSKMZi06eDr7ZFkhI6yF/geBvIm6ALrfZd0qzmn
         ymWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=G7esCIwPqJrnkboW72N+eayfdAtg2uPKf7Ehtd5wxE0=;
        b=N89+EDAQ4vC6s5hBVDustqrAtfDk7ucTiJ4yJpn1PbmE+Jj0QsPQbYQuEJDPMvlVxw
         yLWQkHN6dgB8rRTy9qAaCWNGuwfGR/WqG2E8Sm3EsE8FSkx5XBU9Y4TJy1EZmmmzWOs1
         nyIbGiFOTkHZUEU6ts1POQIuzHX0WYoYFvapUj+TxWOdMvzwdKZE385VDu94Dpaasm3v
         pd/9+hEplETNQJgOzVdcjNadW966M7YDhWCypPxBFKXiztg/jYlNZgUUYbQ3G6KlN5Ym
         Iyzn6DBzTrOdctVreTUpW5liwjtjFq8iF4AlXVjzzsiSLLbo6mNdGYQ80O7t6ElRLE2K
         JRrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o86-v6si4711350qkl.255.2018.06.14.02.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 02:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTOAe-0003MJ-4J
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 05:03:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTOAL-0003IS-GM
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 05:03:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTOAI-0002or-C4
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 05:03:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56578 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTOAI-0002oe-6D; Thu, 14 Jun 2018 05:03:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43B8C87AC7;
	Thu, 14 Jun 2018 09:03:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA4AB11166E1;
	Thu, 14 Jun 2018 09:03:28 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-10-git-send-email-eric.auger@redhat.com>
	<8bf1bccc-b32a-9982-6123-b644c41a96d3@redhat.com>
	<33a3fa10-bf1a-45cd-73bd-403cbd8d4792@redhat.com>
	<fbd7ea65-8f3e-bda3-1bb6-09b3b67d2543@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <36f03e6d-2960-f4c7-8b60-c462e6e01b35@redhat.com>
Date: Thu, 14 Jun 2018 11:03:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <fbd7ea65-8f3e-bda3-1bb6-09b3b67d2543@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 14 Jun 2018 09:03:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 14 Jun 2018 09:03:33 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 9/9] hw/arm/virt: Add virt-3.0
 machine type
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UKMtq0ht+JMm

Hi Laszlo,
On 06/14/2018 10:56 AM, Laszlo Ersek wrote:
> Hi Eric,
> 
> On 06/14/18 08:27, Auger Eric wrote:
>> Hi Laszlo,
>>
>> On 06/13/2018 11:05 PM, Laszlo Ersek wrote:
>>> On 06/13/18 10:48, Eric Auger wrote:
>>>
>>>> PATCH: merge of ECAM and VCPU extension
>>>> - Laszlo reviewed the ECAM changes but I dropped his R-b
>>>>   due to the squash
>>>
>>> Was there any particular reason why the previous patch set (with only
>>> the ECAM enlargement) couldn't be merged first? To be honest I'm not
>>> super happy when my R-b is dropped for non-technical reasons; it seems
>>> like wasted work for both of us.
>>>
>>> Obviously if there's a technical dependency or some other reason why
>>> committing the ECAM enlargement in separation would be *wrong*, that's
>>> different. Even in that case, wouldn't it be possible to keep the
>>> initial virt-3.0 machtype addition as I reviewed it, and then add the
>>> rest in an incremental patch?
>>
>> Sorry about that. My fear was about migration. We would have had 2 virt
>> 3.0 machine models not supporting the same features. While bisecting
>> migration we could have had the source using the high mem ECAM and the
>> destination not supporting it. So I preferred to avoid this trouble by
>> merging the 2 features in one patch. However I may have kept your R-b
>> restricting its scope to the ECAM stuff.
> 
> to my understanding, it is normal to *gradually* add new properties
> during the development cycle, to the new machine type of the upcoming
> QEMU release. To my understanding, it's not expected that migration work
> between development snapshots built from git. What matters is that two
> official releases, specifying the same machine type, enable the user to
> migrate a guest between them (in forward direction).
> 
> In every release, so many new features are introduced that it's
> impossible to introduce the new machine type with all the compat knobs
> added at once. Instead, the new machine type is introduced when the
> first feature that requires a compat knob is added to git. All other
> such features extend the compat knobs gradually, during the development
> cycle. Until the new official release is made (which contains all the
> compat knobs for all the new features), the new machine type simply
> doesn't exist, as far as the public is concerned, so it cannot partake
> in migration either.
> 
> This is my understanding anyway.

Thank you for sharing your understanding. Maybe my concerns were
superficial indeed. If Peter confirms there is no concern with
bisection, I can easily repost the series splitting the virt machine
model modifications in several patches, keeping your R-b ;-)

Thanks

Eric
> 
> Thanks!
> Laszlo
> 
