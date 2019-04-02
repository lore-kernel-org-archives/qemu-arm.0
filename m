Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1771988wrx;
        Tue, 2 Apr 2019 08:56:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzFRAr+9FjsjXHx/K8O65Uqy5SN7wmjmvZJunAtRM/gymSksSNl0XIAtPFRxESACfmf7vey
X-Received: by 2002:a25:2382:: with SMTP id j124mr2687505ybj.79.1554220594028;
        Tue, 02 Apr 2019 08:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554220594; cv=none;
        d=google.com; s=arc-20160816;
        b=c89DFAEy+lyx/tHR54ROvNHpzR3508Y6s6TBsgccUwleaytvm3gvgZZGIb2Y4Jd+n0
         ydrr7k7nDaqHlLZ41I/qMR77wmpeXoYuWBS/ruSzRXg9p3r2/pSGcjM8GPP4iUe5x1xm
         NBgaFvy5ZJG584IVrCfzpZOBS94tz+JYGYloL9mKAg1x1Fz8Mqnzvh2WTtOZ2JK9qxaO
         nnujm7XGTrHTctt0FGqxXw3Myt9ZLbBqGOk5S8wVCUvQMEMAyvOE59N5aotOz8GRDO7s
         HqiYRzLc4bjwZyUUHBL1guunm8aFpMJocey4OSaAIdlVHjSaxbdgxza/d2h/c1f+jbGG
         KNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=aDrPJ1m6MMWBbubzxv7fjqsQmPmGtcx8iU+kGDxiwAo=;
        b=UG1Gs7kOYee1y2qS7riT9y3UnmamkCRt31AFUapYUeDJb+FmBpQiuBG5sJqhjXVcy+
         CrIjWRO4soFw8D4qSUfE28bzCZWs6z/HhRX2OWzukV2XkgWRZvWvWLmRL527RRMCu26s
         hAjnouOLGc7BcdcawDZ5wqh8WPy9Mn8fKevCI7a468ZoAwEDS80SAuNdmEGXqCfLgzot
         lJLdy+e6Zbx8dpky9szgd16TOREEnZS4CugQPC+bwsj6nZFbdBzHLTVHQLjjFurHoqVB
         ioJ1ThMeaCRVhCRAacRHY6RA4IVwBWOVZVmOmKDBj9kATRZZrCDVwZo9befhuKKESYMy
         TbAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s192si7982892ywg.112.2019.04.02.08.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Apr 2019 08:56:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBLm5-0000DG-FP
	for alex.bennee@linaro.org; Tue, 02 Apr 2019 11:56:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hBLlq-0000Bh-Eq
	for qemu-arm@nongnu.org; Tue, 02 Apr 2019 11:56:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hBLlo-0006dL-Qj
	for qemu-arm@nongnu.org; Tue, 02 Apr 2019 11:56:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1hBLlo-0006T1-GS; Tue, 02 Apr 2019 11:56:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E51383092644;
	Tue,  2 Apr 2019 15:56:10 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-182.rdu2.redhat.com
	[10.10.120.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 596F97D14E;
	Tue,  2 Apr 2019 15:56:01 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: Auger Eric <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
	<0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
	<CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
	<a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
	<459862f9-18f7-0a37-dfb9-b8ca9aa6a2d2@redhat.com>
	<20190402094257.218aa0e5@redhat.com>
	<9b776e3b-7b1b-239d-bc36-6bbd78f8b67e@redhat.com>
	<fed34443-e5b0-41be-21ab-323fb7137163@redhat.com>
	<91a906c2-ef90-3aec-2b2c-fbb63c41f7c2@redhat.com>
Message-ID: <59dfd9cd-3762-cbb6-0823-e1247ec5fcd7@redhat.com>
Date: Tue, 2 Apr 2019 17:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <91a906c2-ef90-3aec-2b2c-fbb63c41f7c2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 02 Apr 2019 15:56:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce
 opt-in feature "fdt"
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kemWaSONX29w

On 04/02/19 17:52, Laszlo Ersek wrote:
> On 04/02/19 17:42, Auger Eric wrote:

>>>>> The firmware does consume DT:
>>>>>
>>>>> - If you start QEMU *with* "-no-acpi", then the DT is both consumed by
>>>>> the firmware (for its own information needs), and passed on to the OS.
>>>>>
>>>>> - If you start QEMU *without* "-no-acpi" (the default), then the DT is
>>>>> consumed only by the firmware (for its own information needs), and the
>>>>> DT is hidden from the OS. The OS gets only the ACPI content
>>>>> (processed/prepared as described above).
> 
>> I am confused by the above statement actually. In the above case what
>> does happen if you pass the acpi=off in the kernel boot parameters?
> 
> If you launch QEMU with "-no-acpi" and you pass "acpi=off" to the guest
> kernel, then the kernel will not boot successfully, as it will not get
> DT from the firmware, and it will ignore the ACPI tables that it does
> get from the firmware.

Sorry, I ended up answering "what happens when you run QEMU *without*
-no-acpi and pass acpi=off to the guest kernel".

To explain what happens when you boot *with* -no-acpi: in that case,
"acpi=off" doesn't matter, since the guest kernel doesn't get ACPI
tables anyway. The kernel will go for DT.

Thanks
Laszlo
