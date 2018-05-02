Received: by 10.28.4.212 with SMTP id 203csp611696wme;
        Wed, 2 May 2018 04:32:03 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoSZM43JrdDtVtIZWGeeh2kulLjLsDI6SrboguB1yX9UT8EFzbOtXcNw1giQ+PSCWL7z6T8
X-Received: by 2002:a0c:9557:: with SMTP id m23-v6mr15836616qvm.142.1525260723153;
        Wed, 02 May 2018 04:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525260723; cv=none;
        d=google.com; s=arc-20160816;
        b=0RRZIirF47ay4QIagUFQ7MqULNxVO+7XX/gfhocBw6Gc0fGwwPp4lxQ6hWUDuBsSyQ
         9YCH36ahfUEjqvu4CzSIwDkDfQ0Hex15VhmKb9qm9bssGzu0m2/TSvvgL4hb2AIornHC
         eBdk/W4PTf4IvWXUbfDnQsRFwtwZvpsPtGFRIZqA41wGixrWkmbz4TSaHpsvwUz7D136
         lVv+Nivv1IS/sHWWww0AtHqzQ4nfwl5iAm6Wig8CUvSgLPfNW9HMTO8dh4pbgybiTohM
         MNtwCktkMYvBFvkn859BT+NPPmEmtx7/mwX/NMvBlOKEnfIeFRinChhWEEE8IwlEPwfL
         nD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=u4TPDYQCLFM4et5uNJj1CX1V6zJsszx/deXPTKe078o=;
        b=Zlh1F06H/9ZVuxTkvKuYB5Qcqn5E/VhAdSgBU+DGQMU7MdEvAcPZ0lYG1oac+5vNuF
         gSHnxM75/809JQpwBxka9FiwvUVVbNrGsAKTY4wG7PiAsurEumkUW10Y5RgEEanJTbPH
         /VeZTijNa+eIuV5yuA9YyHY5GjqUTmOEFBYDc2+jDOW+jtB+swiF/oBuNI6U6WN3Igvn
         +OFqdQYuzk7pDXPorKSnxOCCbjQzFz6ZwY28Q5XD9REn/XOMUILn2XYR3Kqj+U8Hn48w
         wh2+sOrfovR8OotOLCPqEAcbbgS6Xxqi9LZtOqjhbPMmfdzU2kUDQnRLAw6SRXfvQoMr
         87JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i13si110979qke.123.2018.05.02.04.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 04:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDpzO-0008Bc-Eu
	for alex.bennee@linaro.org; Wed, 02 May 2018 07:32:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fDpzI-0008BL-8b
	for qemu-arm@nongnu.org; Wed, 02 May 2018 07:31:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fDpzF-00027G-3i
	for qemu-arm@nongnu.org; Wed, 02 May 2018 07:31:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51974 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fDpzE-000273-TN; Wed, 02 May 2018 07:31:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 847EE406E8B9;
	Wed,  2 May 2018 11:31:49 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-197.rdu2.redhat.com
	[10.10.120.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0BE452156617;
	Wed,  2 May 2018 11:31:47 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>, qemu list <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <f41972e8-0ae2-7c1d-a66a-499a841080e3@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <13d95529-d61e-fc30-ffd4-f1ef93edad40@redhat.com>
Date: Wed, 2 May 2018 13:31:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <f41972e8-0ae2-7c1d-a66a-499a841080e3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 02 May 2018 11:31:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 02 May 2018 11:31:49 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] Expand ECAM region in machvirt 2_13?
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
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uW+7AD0wrS40

On 05/01/18 17:59, Auger Eric wrote:
> Hi,
> 
> I would like to resume the discussion on extending the number of PCI
> buses to 256 (as in Q35) as a follow-up of past discussions:
> https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg03631.html.
> 
> With the current 16MB ECAM region we are limited to 16 PCIe busses.
> 
> Could we envision to have a 256MB ECAM region and move it to another
> location beyond 256GB, in virt2_13 machine type?
> 
> Current ECAM range within [0x3f000000, 0x40000000]
> would be kept unchanged for legacy and when vms->highmem is set to false.
> Migration from <2_13 to >=2_13 would be allowed whereas migration from
>> =2.13 to <2.13 wouldn't.

If I understand correctly, the idea is to *move* the current one range,
if the virt machine type is >= 2.13 and highmem is set to true (which is
the default IIUC, from 2.12 onward).

For 64-bit (AARCH64) ArmVirtQemu, that should work fine. The firmware
takes the ECAM base and size from the "pci-host-ecam-generic" DT node,
property "reg", uint64_t elements #0 and #1. (Sorry if this isn't exact
DT lingo, I'm paraphrasing the firmware source code.) If the QEMU patch
just changes the values, that should work transparently.

For 32-bit (ARM) ArmVirtQemu, this change (the new ECAM default) could
be a problem. PCI stuff in the firmware wouldn't work unless people
specified highmem=off on the QEMU command line.

Now, I notice highmen defaults to "on" starting with 2.12 even for
"qemu-system-arm -M virt", not just "qemu-system-aarch64 -M virt", so
why doesn't that already cause a problem with PCI in the 32-bit guest fw?

Because, currently "highmen" only controls the presence of the 64-bit
PCI MMIO aperture for BAR allocation; it has no effect on config space.
And if the 64-bit PCI MMIO aperture is exposed to the 32-bit guest
firmware, the latter simply ignores the former, and works with the
32-bit aperture solely (which is always there).

So, for "qemu-system-arm -M virt" compatibility, I think we might need a
separate machine type property, which should default to "on" only on
qemu-system-aarch64 (if such distinctions are allowed).

Of course, I can't tell if the 32-bit ArmVirtQemu firmware is possible
to run on "qemu-system-aarch64 -M virt". (I think it is; I recall
something something about ARMv8 having ARMv7 compat, but I don't
remember ever trying.) If that's the case, then even the above
suggestion won't work, because it would break 32-bit guest fw that the
user has run (for whatever reason) on "qemu-system-aarch64 -M virt". In
this case, I believe we can't just change the contents of the current
"pci-host-ecam-generic" node, but we should implement some structural
DTB addition that old firmware will simply not notice, while new
(64-bit) firmware will specifically look for (and prefer over the old DT
stuff).

Ard, what's your take? (Sorry if you've already followed up, my email
processing lags.)

Thanks
Laszlo
