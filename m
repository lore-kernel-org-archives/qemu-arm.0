Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1894070wre;
        Thu, 24 May 2018 06:59:38 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIRmTK4fI8FO6fLwJ2PScbtGFBbCYYBm++iJmXAgjbpiKNWt71HDWD47VRPCn9Z11uoK9eP
X-Received: by 2002:a37:85c6:: with SMTP id h189-v6mr6417041qkd.360.1527170378187;
        Thu, 24 May 2018 06:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527170378; cv=none;
        d=google.com; s=arc-20160816;
        b=iN1UJQhrAu/F3T1yr8Gf264Y1u0mA+0XgF5fHJcWa9VPWl7m0q3a0RLt5ZGZ5Psien
         fC7cqb0TTobFhTJrokYyjvvhk1mbq838mdfN3Rv2KJap7VrhnmXJ29MgR9CgAX2M7GtJ
         yYREmpUrsf4Z8LxuzXZ9T9TCqNGF4+acQJiWT90XJ2c3ckhHVrcWCm2ZA7ic0YCagZbg
         jVZitvisgCG1n8RNZrwrleUq5qxbcI8P62Wx3FvfVh/mrNSasV3fwKks1CXdOeF5UtMz
         /tPgU7i2GH1c+ZclIGDMVcfuFcoin4VaZVm6vwm9Rr9oVHGEPSbs19x7Nh+WwVrO/ccw
         MQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=9bHmTp1Te+Cn6mzD+06dxksSCDkpWjTLc5CV7YVRh5s=;
        b=gfwGfHTHbdNsEfvGCfr9k3GzgenLz401WAbf+OVQ8EotEo9WakgcqtNVfXOte9F58h
         N4ULG6hW1RhMTY4cW5bprx0RNDL74SlgtvZ+1Cpg3EH7B76AP+CIMK67pOQWJebt9XuW
         LGOMCks6OUo4DuhusEq8v7JU6D8SIfzgYGKuN+PZ680ZKjLbhBxtUGY9ndleYM29YuI9
         rQ36SNHAwAx0TQd/DlmT9xfZ4YM9axEOr48/B4TG3dhfNtI24UW6VZkb4UVWb0Np7Otz
         9S6Z33pJBS9c7AkObOBUU+SJJkbttRjiV2Nwom4kLJUJnEOFHtJ+8TPRynhsQdsnjXrg
         nHdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 44-v6si5657364qvw.123.2018.05.24.06.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 06:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLqmH-0005Eb-OY
	for alex.bennee@linaro.org; Thu, 24 May 2018 09:59:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLqm7-0005E0-Lq
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLqm4-0005vl-Mo
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:59:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55066 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fLqm4-0005v1-Ix; Thu, 24 May 2018 09:59:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F31A55BCB6;
	Thu, 24 May 2018 13:59:23 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-84.rdu2.redhat.com
	[10.10.121.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 013321117652;
	Thu, 24 May 2018 13:59:17 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
	<22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
	<CAFEAcA9LMV_-vVAwUkuY=uw2Gf6XLvsgmi8y0PgHPJnQZkWC0w@mail.gmail.com>
	<550464ac-5155-6311-d0f7-92c7c0813f82@redhat.com>
	<CAFEAcA-hobu_=VKhYQ+UZ1WX_JFfwCarkPKQhiBtXc3fre57rg@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ee204f5f-600f-2425-a1ff-0418b4611e96@redhat.com>
Date: Thu, 24 May 2018 15:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-hobu_=VKhYQ+UZ1WX_JFfwCarkPKQhiBtXc3fre57rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 24 May 2018 13:59:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 24 May 2018 13:59:24 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/2] ARM virt: Support up to 256
 PCIe buses
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
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zmqkJctWH36w

On 05/24/18 15:07, Peter Maydell wrote:
> On 24 May 2018 at 13:59, Laszlo Ersek <lersek@redhat.com> wrote:
>> On 05/24/18 11:11, Peter Maydell wrote:
>>> Won't it also break a guest which is just Linux loaded not via
>>> firmware which is an aarch32 kernel without LPAE support?
>>
>> Does such a thing exist? (I honestly have no clue.)
> 
> Yes, it does; LPAE isn't a mandatory kernel config option.
> This is why we have the machine 'highmem' option, so that
> we can run on those kernels by not putting anything above
> the 4G boundary. Looking back at the history on that, we
> opted at the time for "default to highmem on, and if you're
> running an non-lpae kernel you need to turn it off manually".

Ah, OK, I didn't know that.

> So we can handle those kernels by just not putting ECAM
> above 4G if highmem is false.

The problem is we can have a combination of 32-bit UEFI firmware (which
certainly lacks LPAE) and a 32-bit kernel which supports LPAE.
Previously, you wouldn't specify highmem=off, and things would just work
-- the firmware would simply ignore the >=4GB MMIO aperture, and use the
32-bit MMIO aperture only (and use the sole 32-bit ECAM). The kernel
could then use both low and high MMIO apertures, however (I gather?).

The difference with "high ECAM" is that it is *moved* (not *added*), so
the 32-bit firmware is left with nothing for config space access. For
booting the same combination as above, you are suddenly forced to add
highmem=off, just to keep the ECAM low -- and that, while it keeps the
firmware happy, prevents the LPAE-capable kernel from using the high
MMIO aperture.

So I think "highmem_ecam" should be computed like this:

  highmem_ecam = highmem_ecam_machtype_default &&
                 highmem &&
                 (!firmware_loaded || aarch64);

Thanks,
Laszlo
