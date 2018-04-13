Received: by 10.28.71.155 with SMTP id m27csp806721wmi;
        Fri, 13 Apr 2018 07:14:02 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48apsSqcYdAGXwa2cDvY0qxYOFfain6Cpj4HAgMTUdpCoFxSDBw3lrCh5Qtj7tOn/IArQvN
X-Received: by 10.13.249.6 with SMTP id j6mr4769308ywf.358.1523628842163;
        Fri, 13 Apr 2018 07:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523628842; cv=none;
        d=google.com; s=arc-20160816;
        b=MIjkcvkiUAZLA5N5Jd1hwjgKLmpZw+b4pNYbuy0pod9rim2nhEckUzoBzh79SCWtTV
         cuy3VyLaB64J18+w8jq1jIY0xpKawg21AgLNvL9uhy8vQM95fOClZPDQOycOAgwOQSb3
         TFhOe1O99oZ5Aq8QiTcuXZwXmXLy43hVL6joTKU3Ueum5YLBpqAcZVnaxgOTelKNrg+E
         EDe124H6I2g6ZsUR6ty8gBYmffXGcFetnW/a9+9eTJDqlbE0YZx0b+I667+iI8nqZ0AQ
         zYbUIaKhkNY5RjveXoAqFm5hN8xtn7n17nihtroEEggyPKCGpjVb1NuRzBqe7qsQ5aiY
         Xrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=inIxfsroc6GCS2GPPDizaXwG7lJbK5OnCHam7CW/wZQ=;
        b=HqjKTm1+beWtw7WnBbjEm31QiM+h/q7ktTFI1+TBzze4ikGjVPr4t38D+IHvrydKnf
         X5OV4++q/XNEPvQz1pQTUUhRYfqZizvWZCOnxYpXJ8rOUA7Np1mXAliicrR40OBhDK7g
         PXMwO+IsikeoUKNrUwb3mjPk3snXZJWt0krJGd1GsZWSEQjAw50da4GZ9mvpX+TiF5M5
         xxM7ylTqlIrbM3eMde+5+I4KSX9lZb1ayFDrNO7lM4e8jCY2Xgft97OSpge4OVgN9yDa
         DxdkpQCQjNStqOf+GOimbv8vPHUPFlqRK75PX/5moL2pi3z7l68kAG2un2lfZeiGTS2T
         du5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e30si7410807qtd.348.2018.04.13.07.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 07:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6zSj-0003iU-IY
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 10:14:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6zQQ-0001sX-RH
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 10:11:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6zQN-0005Uw-KJ
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 10:11:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33276 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6zQN-0005Uk-Di; Fri, 13 Apr 2018 10:11:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F1F24075A6E;
	Fri, 13 Apr 2018 14:11:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C5221A468D;
	Fri, 13 Apr 2018 14:11:25 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-9-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_O3QK0t5DHfnAFEOHv_yyxvL9HZX+0geHs0ibVVwTbNQ@mail.gmail.com>
	<57b01152-1179-9735-eb6a-a9dbfc933a6c@redhat.com>
	<CAFEAcA-wT8vERbkjq_HoROi1ymPauAe+y3oc16zoCJXsHKqBoQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <94299045-3027-517c-d634-4613f78de163@redhat.com>
Date: Fri, 13 Apr 2018 16:11:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-wT8vERbkjq_HoROi1ymPauAe+y3oc16zoCJXsHKqBoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 13 Apr 2018 14:11:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 13 Apr 2018 14:11:31 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC 8/8] hw/arm/virt: Allow up to 512 vcpus along
 with KVM VGICv3
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
Cc: Andrew Jones <drjones@redhat.com>, Christoffer Dall <cdall@kernel.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YdbaXtfdGTeH

Hi Peter,

On 13/04/18 16:06, Peter Maydell wrote:
> On 13 April 2018 at 15:01, Auger Eric <eric.auger@redhat.com> wrote:
>> On 13/04/18 15:41, Peter Maydell wrote:
>>> I think it would be better to explicitly check "do we have
>>> support for split redistributors" rather than looking at
>>> KVM_MAX_VCPUS. It's not impossible that a distro kernel
>>> might have chosen to backport support for one but not the
>>> other.
>>
>> The issue is we have race here:
>> to check whether the new ATTR is supported I need to query the GICV3 KVM
>> device. This later is created in the GICv3 initialize. But to initialize
>> the VGIC I need the VCPUs to be created. And to create the VCPUs I need
>> to check their max number. Or do I miss somethinh?
>>
>> The KVM device create dry-run mode cannot be used here. I would need to
>> really create the KVM device and then delete it. The issue is there is
>> no kvm device DELETE ioctl at kernel level since KVM devices are deleted
>> on VM deletion if I understand correctly. Adding a KVM device delete at
>> kernel level may not be straightforward as I suspect some
>> simplifications could be made in KVM device deletion knowing the VM was
>> under deletion.
> 
> Two possibilities:
> 
> (1) do like we do in kvm_arm_get_host_cpu_features() where we
> create a scratch VM to interrogate it and then throw it away
> when we have the info we need
Oh OK. I did not know this was in place. At first sight, this looks
simpler than (2) to me. I will investigate this solution.

Thanks!

Eric
> 
> (2) add an API to the kernel to make it easier to query it
> for this sort of feature
> 
> thanks
> -- PMM
> 
