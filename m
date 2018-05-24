Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2086917wre;
        Thu, 24 May 2018 09:58:45 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLXxAu2rxLTVNWwCw3X2lF3+alvn3PkS8Me9p1nkESnRrBbNH1lMe47moq3XMHCkMjPonMx
X-Received: by 2002:ac8:2947:: with SMTP id z7-v6mr7493599qtz.251.1527181125750;
        Thu, 24 May 2018 09:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527181125; cv=none;
        d=google.com; s=arc-20160816;
        b=nwaQau1lpl4VczvZ8UFcTmDEcc5sFgDiyh33b0n+k34Roo23eLHDWVfL9224hJMMLl
         fSSiSxUzKm7eRstcfhD39YUb/i9bXlxRfXFmXDjVwoqWwyzpiaI33kjIZtWjKYDlXilF
         ETofc3ILdDm+1M19cZ08KN/J1wTd68WArc3xYDNVEq8dQp5M6JpxiyIoYVQKWkGlgkxS
         f3GaUlq2p4Y14UMKr/aaMkYF0sPbNM+V+ONxeUTHS09SzX87hOJmq2ltAJrixm0MOAnR
         7TqBnsu86Tqb13QZ/CSOTJk5CNQA9UIQNkhlR0D/CrLkMi/tVhjcqJCgmJ4lz2cKz/Fg
         Liog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=2uLLLulBK7rPbOqPJsQvzqbmcMO4iTj3QFeOeD6oMCI=;
        b=zYV4d1GV+1aLcJntN3dwenHREgNmwdRLBtsq2CczMpBki4S3GFOgfcIq94brihdY74
         HUJ5vfbt8KMnIwmpUlp7H2mrKOTqV/37geYujhbPpvXNqN36YQXE3KjiauiYpds2nrZK
         +Sz/tMCGvnVKX/vU+NzRRiHX27HIBPactwea8D5lDdcA/DRAL3C6qhsEL8dvZ74DJbJE
         7h88i347PPzf/XpJJMKC6mD2OxVVEsVqpy9F1TkqXe4cagTgHvEfFUBKk6TdT2MA072K
         WdSOFl+TwVFLkpvVM9Eo6D+06xTozJNfAnjauzR3mGFYmwtSVR22NoZUnaLJHEyNkhT2
         7+Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17-v6si3797968qth.259.2018.05.24.09.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 09:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLtZd-0002Io-AE
	for alex.bennee@linaro.org; Thu, 24 May 2018 12:58:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLtZT-0002IW-QA
	for qemu-arm@nongnu.org; Thu, 24 May 2018 12:58:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLtZQ-000588-Nn
	for qemu-arm@nongnu.org; Thu, 24 May 2018 12:58:35 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55696 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fLtZQ-00057n-JR; Thu, 24 May 2018 12:58:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E259A4022407;
	Thu, 24 May 2018 16:58:30 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-84.rdu2.redhat.com
	[10.10.121.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54DBD11166E3;
	Thu, 24 May 2018 16:58:23 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
	<22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
	<CAFEAcA9LMV_-vVAwUkuY=uw2Gf6XLvsgmi8y0PgHPJnQZkWC0w@mail.gmail.com>
	<550464ac-5155-6311-d0f7-92c7c0813f82@redhat.com>
	<CAFEAcA-hobu_=VKhYQ+UZ1WX_JFfwCarkPKQhiBtXc3fre57rg@mail.gmail.com>
	<ee204f5f-600f-2425-a1ff-0418b4611e96@redhat.com>
	<a8485329-0986-c99b-ad64-ec5af0a987b8@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <694034a3-9d4c-3e7e-759d-6fd8f8cfd9c8@redhat.com>
Date: Thu, 24 May 2018 18:58:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <a8485329-0986-c99b-ad64-ec5af0a987b8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 24 May 2018 16:58:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 24 May 2018 16:58:30 +0000 (UTC) for IP:'10.11.54.3'
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
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pZrovgbpCMQA

On 05/24/18 16:09, Auger Eric wrote:
> Hi Laszlo,
> 
> On 05/24/2018 03:59 PM, Laszlo Ersek wrote:
>> On 05/24/18 15:07, Peter Maydell wrote:
>>> On 24 May 2018 at 13:59, Laszlo Ersek <lersek@redhat.com> wrote:
>>>> On 05/24/18 11:11, Peter Maydell wrote:
>>>>> Won't it also break a guest which is just Linux loaded not via
>>>>> firmware which is an aarch32 kernel without LPAE support?
>>>>
>>>> Does such a thing exist? (I honestly have no clue.)
>>>
>>> Yes, it does; LPAE isn't a mandatory kernel config option.
>>> This is why we have the machine 'highmem' option, so that
>>> we can run on those kernels by not putting anything above
>>> the 4G boundary. Looking back at the history on that, we
>>> opted at the time for "default to highmem on, and if you're
>>> running an non-lpae kernel you need to turn it off manually".
>>
>> Ah, OK, I didn't know that.
>>
>>> So we can handle those kernels by just not putting ECAM
>>> above 4G if highmem is false.
>>
>> The problem is we can have a combination of 32-bit UEFI firmware (which
>> certainly lacks LPAE) and a 32-bit kernel which supports LPAE.
> 
> Is it what happens with the FW you provided to me? There is no LPAE in it?

That's the case, to my knowledge.

Thanks
Laszlo
