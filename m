Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1906590wre;
        Thu, 24 May 2018 07:09:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLb+LMriEvbGt74Jrp3yalUpEr8D3filbrJK6KmK1O6hqkOpBPNHKqnU/6VV66SHvmyj2ro
X-Received: by 2002:aed:3fda:: with SMTP id w26-v6mr6937046qth.15.1527170976638;
        Thu, 24 May 2018 07:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527170976; cv=none;
        d=google.com; s=arc-20160816;
        b=zZAkM5jggIIeXXRnh2y8lQ235SNcKI7tlgldfz3c+mRfFw2fNe3Day4pjFpJToNXrW
         LuhHS3haZJgIv261Ozppy+befS8Rb1YluoRTf6b2Q1CtxDIRvDID+kAzPG4qsukGPRBs
         WPQ9Irp4EgXWbCvieNBCw8TwcXtq/iH4FFtx3n8JBuhZN8eTdYbzJWKzW1+PUz8u9Ttc
         VLQcpuagqCQJEKArh230nJKk85IyjG0xxPDOKENxykSz5BdPu+tCwSOIlPRaT6jUa06q
         Qo5HBoE/kSsHjWSoqtRGe2Wy9jKegmLkT8Bwjv0poALmo4vGRPH6b17TLkSHpvzd3mPC
         7Ifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=bRBQKDE3cdYBqMsKK1AXlhmsE3EqLcRElwEnVeswe4Q=;
        b=PHms9T0C7SIrkdJRU6MwCXPEcRW0BNKUZDlIx6Ik1av1qzm+hXCrS+rsYE/ys3qiJf
         cGdGZ4Jcm6gRj/W4l1hd2r8o1qjd89JdvRLJjF7ZpUEQ1JJFNhxXk0vd8njkkh5+NEXw
         xnpP+uVr3n0YnnG851dpgEcCWbctiMicIZb/QBaEsEIHyZ0N2l2E78nkkpppXAhN7PjA
         rbwhsYFxWJ1giKfErxqDoKqLjeZ3dcuhTXH2yaWFRZ9kjxCC/f/YAsHrb9wv+zxtywty
         Ku2F7hYPw38H5UzGSM/nS0N9pYsqUdanITM5Kk+d0yUR/fpfFHYH7pWqq/MnkPgacC8G
         /5tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f13-v6si8286030qtj.27.2018.05.24.07.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 07:09:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLqvw-0000YJ-5V
	for alex.bennee@linaro.org; Thu, 24 May 2018 10:09:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLqvf-0000Os-1Y
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLqva-0002gf-0T
	for qemu-arm@nongnu.org; Thu, 24 May 2018 10:09:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55472 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLqvZ-0002gO-Qo; Thu, 24 May 2018 10:09:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54BA9BB408;
	Thu, 24 May 2018 14:09:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C094F63F30;
	Thu, 24 May 2018 14:09:09 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
	<22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
	<CAFEAcA9LMV_-vVAwUkuY=uw2Gf6XLvsgmi8y0PgHPJnQZkWC0w@mail.gmail.com>
	<550464ac-5155-6311-d0f7-92c7c0813f82@redhat.com>
	<CAFEAcA-hobu_=VKhYQ+UZ1WX_JFfwCarkPKQhiBtXc3fre57rg@mail.gmail.com>
	<ee204f5f-600f-2425-a1ff-0418b4611e96@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a8485329-0986-c99b-ad64-ec5af0a987b8@redhat.com>
Date: Thu, 24 May 2018 16:09:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <ee204f5f-600f-2425-a1ff-0418b4611e96@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 24 May 2018 14:09:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 24 May 2018 14:09:13 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
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
X-TUID: Y8ZE6MZDpkaE

Hi Laszlo,

On 05/24/2018 03:59 PM, Laszlo Ersek wrote:
> On 05/24/18 15:07, Peter Maydell wrote:
>> On 24 May 2018 at 13:59, Laszlo Ersek <lersek@redhat.com> wrote:
>>> On 05/24/18 11:11, Peter Maydell wrote:
>>>> Won't it also break a guest which is just Linux loaded not via
>>>> firmware which is an aarch32 kernel without LPAE support?
>>>
>>> Does such a thing exist? (I honestly have no clue.)
>>
>> Yes, it does; LPAE isn't a mandatory kernel config option.
>> This is why we have the machine 'highmem' option, so that
>> we can run on those kernels by not putting anything above
>> the 4G boundary. Looking back at the history on that, we
>> opted at the time for "default to highmem on, and if you're
>> running an non-lpae kernel you need to turn it off manually".
> 
> Ah, OK, I didn't know that.
> 
>> So we can handle those kernels by just not putting ECAM
>> above 4G if highmem is false.
> 
> The problem is we can have a combination of 32-bit UEFI firmware (which
> certainly lacks LPAE) and a 32-bit kernel which supports LPAE.

Is it what happens with the FW you provided to me? There is no LPAE in it?

> Previously, you wouldn't specify highmem=off, and things would just work
> -- the firmware would simply ignore the >=4GB MMIO apertur  e, and use the
> 32-bit MMIO aperture only (and use the sole 32-bit ECAM). The kernel
> could then use both low and high MMIO apertures, however (I gather?).
>   
> The difference with "high ECAM" is that it is *moved* (not *added*), so
> the 32-bit firmware is left with nothing for config space access.
Yes it is not possible to declare several disjoint ECAM spaces for a
single segment I think, hence the move.

 For
> booting the same combination as above, you are suddenly forced to add
> highmem=off, just to keep the ECAM low -- and that, while it keeps the
> firmware happy, prevents the LPAE-capable kernel from using the high
> MMIO aperture.
> 
> So I think "highmem_ecam" should be computed like this:
> 
>   highmem_ecam = highmem_ecam_machtype_default &&
>                  highmem &&
>                  (!firmware_loaded || aarch64);

Looks sensible to me

Thanks

Eric
> 
> Thanks,
> Laszlo
> 
