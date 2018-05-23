Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1134590wre;
        Wed, 23 May 2018 13:55:38 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpNSH47/264vsqm7izpLV/DyhToZJEagpFJaJkM5FqJAOllUggbKOVReMIuF/QkZxB+bZ+R
X-Received: by 2002:a0c:9944:: with SMTP id i4-v6mr4303175qvd.192.1527108938685;
        Wed, 23 May 2018 13:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527108938; cv=none;
        d=google.com; s=arc-20160816;
        b=tZZhLxQI5wfAmci1pubgp1n8beP9ILf8Oo1JlMsKexG7VE/8tbIviL9hnYOL26kKir
         v/zt+cVnLEfMVK9zutNvwbtB5tvgK/XdZPlog8eNY6NyIcT7C2jK0VdNbu3QjBryIIj2
         3N9lw9UEi98Qj5kRa0j55Pd9B7+Egn/1BU6iUm7qwOKOAbLS5Md1BtHNLRAKlhfRc6ek
         T8j95RJox05geKS6ilXE9qWQVVNJLMelLBOfmdNF2VXa5l2jZOG1bwH19qiMZ4AekHU0
         Kj6TE1m+yeLI2tHF5ZkclRXHo0o560kWjHzibpMrw6YYUnmIYYDVuTGg2WZHQLHOvTGh
         HwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=R8AczcashoP1SQMc3zRsX2RUh3/quoXVtBC4x+xiU7M=;
        b=CRyBBZ7/uGIYrcdaNIf4JxizrLhEFHhaJxoPXjz6sFh7Y15wSKqCLmL9EfOgratxhE
         lH9LU4yu56Robtm4PZucuDLNn/gHGAyGVpD/qMzenq6U558iF8JFqyPdjrbN3DEYWRnC
         dKC/YhzeYi7InpZhvxW54fFoP0q+pdUlwB8O3zS7XYEOR7vaUKAc7zF9HHrSupghrHRx
         CoicvtbgTfBLY79nDSgNbq3ApQzTkS+7xCLi8n6ygOyiWTG/tgcF1ppQJE+beNTqbTFk
         HKitbOTmpSvDfX8sXhwGYwtm46aTzKade3E5PtO3rAyaInjJgoJoRk7vpDhePd5Jdz1n
         KqJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h39-v6si308539qtk.13.2018.05.23.13.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 May 2018 13:55:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLanK-00034j-95
	for alex.bennee@linaro.org; Wed, 23 May 2018 16:55:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLanB-00034P-EV
	for qemu-arm@nongnu.org; Wed, 23 May 2018 16:55:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLan8-00082c-DL
	for qemu-arm@nongnu.org; Wed, 23 May 2018 16:55:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45904 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLan8-00082R-3v; Wed, 23 May 2018 16:55:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CAD9CB9C7;
	Wed, 23 May 2018 20:55:25 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0945710E4D03;
	Wed, 23 May 2018 20:55:21 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
	<22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <09062993-dfbf-70b3-587e-72a5b9a049e8@redhat.com>
Date: Wed, 23 May 2018 22:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 23 May 2018 20:55:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 23 May 2018 20:55:25 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
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
Cc: drjones@redhat.com, zhaoshenglong@huawei.com, ard.biesheuvel@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uSBbdvXMsMkT

Hi,

On 05/23/2018 10:52 PM, Laszlo Ersek wrote:
> On 05/23/18 22:40, Auger Eric wrote:
>> On 05/23/2018 07:45 PM, Laszlo Ersek wrote:
> 
>>> Regarding the second patch, I do believe we need "more sophistication"
>>> there. For example, I guess it could be possible to distinguish "-cpu
>>> cortex-a15" from "-cpu cortex-a57" somehow, and stick with the low/small
>>> ECAM in the former case. (The 32-bit firmware already runs on cortex-a15
>>> only, and not on cortex-a57, according to my testing.)
>>
>> So we should detect we are in ACPI boot  + aarch32 mode to force legacy
>> ECAM region, right?
> 
> Agree about the aarch32 subcondition.
> 
> However, "ACPI vs. DT" is not the right "other" subcondition here;
> instead we should (minimally) check "firmware vs. no firmware". See the
> "firmware_loaded" boolean field.

OK
> 
> I also suggest waiting for feedback from others! :)

sure ;-)

Eric
> 
> Thanks,
> Laszlo
> 
