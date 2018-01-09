Received: by 10.28.173.206 with SMTP id w197csp3902323wme;
        Tue, 9 Jan 2018 08:50:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBouaDlJNJWSl3a+0v5kPyL3WVrRGiSORYlo+C6SAj7NEg97aNCLgAjzNWEdRjjz+QZ2noB2k
X-Received: by 10.129.52.87 with SMTP id b84mr10291484ywa.72.1515516608400;
        Tue, 09 Jan 2018 08:50:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515516608; cv=none;
        d=google.com; s=arc-20160816;
        b=qo8dqPvjF+NgM+gOkDdpsH9DSb1DEjJDuFWd4cKgAGcuxxoUQZo8XHUt6eHnl2pHC/
         UShXlIiLpaFtix3LsfhPJ/11p3CDFmZ1/k43DxAPCb3dEZYG/SgNOmwgKyKVZ25RD9W2
         FsAiUuXFAgfjG0lWT9AzkfVkERIW13mJDUy8JUOn3FvNey4iQx6Ba++1CvR7eMCaouFG
         lSZxAjtlxxVymSoptbm8AxxITICuiAhfC2eRgTD9cbFhTGYdDIRi3DGgFjJLRGIkLg+S
         cl/XRN4YC+pBU3i9YvN+/rEr83yFEWE2YU6dfVGLh0h2Nstkvp9g1zfUa54kQO2ZV7CF
         2KtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=AOSJSdFChr943SlDqzie09ysq3OWvewUz/FHXAbNmdk=;
        b=aQ4PmYI97ZCPx5VXqf+MdThrYtzt4T6KPTzFWyn5I5aTV/OBgsFWV4pN4zkv6TJPh0
         kYi5ingsWeHW14HJzJcxGQ/SOjaVcpo2lsPlrYwrtc3Gu2i6Z0QlZoJMZ+UlR8y/nAWY
         DQ5hjYdRqX8wiLU+/GJi64WtwJ7m951GAekccGKpjlfc0KmQ/4eJYIpuxK9syug1dr71
         peCahkoyLxB/18tsp8NpXkmMvJYo9/876N0djavtmooJPb7yEZssCpK1T7vCJrQOUmik
         5K8Hhebndb39phU9kvsUYF7RL78qMNdV1FtS10tjY05Jub/4QyOY2RC/vyul5gc19Fyq
         x6uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si1672976ybf.404.2018.01.09.08.50.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:50:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYx6F-00007o-St
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:50:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eYx4q-0007bg-Dy
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:48:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eYx4m-0004Du-Gw
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:48:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36258)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1eYx4m-0004DL-6Y; Tue, 09 Jan 2018 11:48:36 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FD964ACCA;
	Tue,  9 Jan 2018 16:48:35 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-223.rdu2.redhat.com
	[10.10.120.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D65D46BF7C;
	Tue,  9 Jan 2018 16:48:29 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8NbL7ROZs99hWhpAF2Rdi2qEiWLNo3hr_9W7gmgXyw4A@mail.gmail.com>
	<6d20557d-5722-706f-ca4f-489ab85358c0@redhat.com>
	<CAFEAcA-Nn4VmSnxT7Of8Nh+p5QgF9cMzkqZ-VBCC=2zRgk-Xdw@mail.gmail.com>
	<e40cc107-2fe9-d8a5-b4fd-385c0d22c564@redhat.com>
	<CAFEAcA8QqEna4u92bk88++Y1JrpCJD=KDpSfbJ8DhfSiTRm+=w@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <c6dd6485-3159-fd4e-6aed-fcb5cd34e4f8@redhat.com>
Date: Tue, 9 Jan 2018 17:48:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8QqEna4u92bk88++Y1JrpCJD=KDpSfbJ8DhfSiTRm+=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 09 Jan 2018 16:48:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 0/2] GICv2 & GICv3: RAZ/WI reserved addresses
 rather than aborting
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
Cc: Drew Jones <drjones@redhat.com>, "patches@linaro.org" <patches@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SlXy/nin5U8Z

On 01/09/18 17:35, Peter Maydell wrote:
> On 9 January 2018 at 16:29, Laszlo Ersek <lersek@redhat.com> wrote:
>> On 01/09/18 17:12, Peter Maydell wrote:
>>> On 9 January 2018 at 15:58, Laszlo Ersek <lersek@redhat.com> wrote:
>>>> Sorry, no clue about any of this -- where should I read up?
>>>
>>> I cc'd you mostly as a heads-up since the QEMU bug is UEFI affecting,
>>> not because I wanted to make you read the GIC specs :-)
>>
>> Thanks (and, thanks :) ) -- from patch #2, looks like GICv2 is affected
>> too, and the patch seems to be fixing commit a9d853533cc1
>> ("hw/intc/arm_gic: Switch to read/write callbacks with tx attributes",
>> 2015-05-12).
>>
>> Is that right? That commit was released with v2.4.0. Should I have
>> experienced the error? Is it KVM / hardware specific? What are the symptoms?
> 
> Happens under TCG emulation only. The bug got introduced with
> commit c79c0a314c43b78f6, which changed the effect of a device
> returning MEMTX_ERROR/MEMTX_DECODE_ERROR from "RAZ/WI" to
> "guest data abort". That's in general the right thing to do,
> but in the case of these device models we were returning those
> values for cases which aren't supposed to provoke aborts.
> 
> The symptom is that if your guest code is poorly behaved and
> tries to read or write offsets that don't correspond to documented
> GIC registers, it will take an abort that it didn't before.
> Linux is fine; this UEFI image I have lying around stopped working.

Thank you for the description. Now I'm thinking the failure indeed needs
combining both bugs (UEFI -- presumed --, and QEMU). I've been using
qemu-system-aarch64, version 2.11, on my x86_64 laptop, for a while,
with no problems at all -- it's a registered RHEL-ALT-7.4 guest that I
last booted three days ago. And, v2.11.0 has c79c0a314c43b78f6. On the
other hand, I tend to run bleeding-edge ArmVirtQemu firmware.

... I see that your patches restore the GIC behavior to (sort-of)
pre-a9d853533cc1 state, thereby de-fanging the over-generic
c79c0a314c43b78f6. (Does this summary make sense?) If you think an ACK
from me isn't worthless for reflecting this "realization" (lol), I can
provide it.

Thanks!
Laszlo
