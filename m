Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1132587wre;
        Wed, 23 May 2018 13:52:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpAYrr3vPMn3/ZJixndin99XyC78RMacE1782yOGnMLexKuI51O4bTiy/YnSVjRdCZlqwuk
X-Received: by 2002:a37:5307:: with SMTP id h7-v6mr3939953qkb.384.1527108778140;
        Wed, 23 May 2018 13:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527108778; cv=none;
        d=google.com; s=arc-20160816;
        b=PfuliIyIJFB/IxA1dVCGZ8Hov8eG7b0T/4RmqLDqc3wCo1isWkov15zQIEGlwIXZi4
         IZOZ2jTLCbOJpJ5r6KuXylV08G/CplyvH9xZNhUkJP+TVZjFzRjGMYJkCrBuKGZtoV4b
         Ze4dzVFUmW4akh0daQe8Bkf0exPaf+VZpejUffkV5R3CGV4aWLCgeGpPgodusW/l30iX
         J7YoK04vb0npzK5gGnR3geqZWMM5WKdVijVSkko06MHxm+zx4uSm91KMtfEjmBjv4Mzc
         GSZM+gEDTwLE9+9IrYjss1GMi1pfoPkrG7h+n2D1avOUBpUX+fxbHY+N3RirCu+26BDm
         cn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=I1KH/B2uQYgmS88VczBE6qjuoWxDky1D1Yhx6JgsbqM=;
        b=tULr1FLORACoPrlVrwM4J72Ub8EOY/UFsjv85FIMfbzXZywzxhKxgA77kwpWj7ZawI
         /b8fI8+vwyTaNtOqIFFzzRMhMG6SmLWvqXPG0dG8TW9ftXPgaDNCW2tzF8t6ie3qqFU7
         71PXr1KKHfsmPjOZnR5xfD0i0UaMZe+vGP8VrLdpH5s86eBEX0/9X09+Ee4ifwJGlNJD
         fdmiIwnKPqgudJjEHo8hDisVxcjFMdP6kMzOyAi+fmvGNbpq+fN3jSk5KfQsLvdeq6Bf
         FHfu9NYtxAQKm5bUQIoh03olVzXHKWUorG5z1fI8Bi36c9CVjOuE0DsnjWvdQdAJJsiv
         WVrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u53-v6si7497919qvh.212.2018.05.23.13.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 May 2018 13:52:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLakj-00023Z-Na
	for alex.bennee@linaro.org; Wed, 23 May 2018 16:52:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLakX-00023P-Mh
	for qemu-arm@nongnu.org; Wed, 23 May 2018 16:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLakU-00075h-HE
	for qemu-arm@nongnu.org; Wed, 23 May 2018 16:52:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51298 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fLakU-00075R-Bd; Wed, 23 May 2018 16:52:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E8FE407048B;
	Wed, 23 May 2018 20:52:41 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-208.rdu2.redhat.com
	[10.10.120.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 967AF10E51B4;
	Wed, 23 May 2018 20:52:35 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
Date: Wed, 23 May 2018 22:52:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 23 May 2018 20:52:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 23 May 2018 20:52:41 +0000 (UTC) for IP:'10.11.54.3'
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
Cc: drjones@redhat.com, zhaoshenglong@huawei.com, ard.biesheuvel@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Czb/14XRIfMv

On 05/23/18 22:40, Auger Eric wrote:
> On 05/23/2018 07:45 PM, Laszlo Ersek wrote:

>> Regarding the second patch, I do believe we need "more sophistication"
>> there. For example, I guess it could be possible to distinguish "-cpu
>> cortex-a15" from "-cpu cortex-a57" somehow, and stick with the low/small
>> ECAM in the former case. (The 32-bit firmware already runs on cortex-a15
>> only, and not on cortex-a57, according to my testing.)
> 
> So we should detect we are in ACPI boot  + aarch32 mode to force legacy
> ECAM region, right?

Agree about the aarch32 subcondition.

However, "ACPI vs. DT" is not the right "other" subcondition here;
instead we should (minimally) check "firmware vs. no firmware". See the
"firmware_loaded" boolean field.

I also suggest waiting for feedback from others! :)

Thanks,
Laszlo
