Received: by 10.28.71.155 with SMTP id m27csp370647wmi;
        Thu, 22 Mar 2018 06:48:16 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuqzjwGuZR61wGhGTgIzr6gnuAl/sT2EoWg4eRfW9NMCsn1YiqTnb/JPz6wa0qUA19fZ8nP
X-Received: by 10.55.217.77 with SMTP id u74mr34766591qki.148.1521726495887;
        Thu, 22 Mar 2018 06:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521726495; cv=none;
        d=google.com; s=arc-20160816;
        b=vpSFzr4zTRIQ1ILjto7/f/JTbPki91ij2iL8LPqPbeerH7jSjB4sqdS1Yg1O8NG8xn
         DBGfdzFs58ttpehBFUKZOK5QC8RpoZZvCku5Y4bbCZLTHZqhSNFT2y6ghQml6DqziB+V
         2ZwhxEe7wl/GwxKm/iA1GE4SP5F0HN6SQcliC9mnxr/w4W2/FQlLEEVxMkTBVDnnZFXt
         nLROT5AwGd1BFs8vFw1oKFTZK4nEodsw+zl84Kb2q/c+8THGj9Usjlwj48Z6Ztm3xlJ9
         PwuoAOtlkihVc7oiv2jhVkQmLlFxfEvsCoxyMmrJp1MhJ7NOGQP7M57/3zEosgzQirIx
         Wn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Iy5oTbJUN9UVG3hE1JlRs+1fcwOLlO2VoyH27oskVsA=;
        b=lXh6JQwlOOcyJdYpda9m8eDDUFEAhpA8Tmoag0XGae0bdKKzhT4JLHsyYu3TG/utkK
         7e3f0OwW8fCeL8TlQCFRQrnnqvblXynCdCLpVZNH+Zw+Te8NS6pI6RF9DT0u7YHISrar
         iQal5qIFQ4//JSmlFvPmT2C57zjOoDOkdyNHbAClQy9MEW7dZiBBvvFpClavhPWF8Inu
         0n9e0h9OEmC5O1ZzUF4egDFwAaJ9ZcQXtvurG/PavHZtkD8OC6iV2i0EimBJJyLjPwhj
         hgTo+K9LM9KuPGjUGp4Hx30plEgWlIWuLqaT6pKjKRQXSnoucBKIIVCVyi+45hbRBqxx
         4Yvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v33si1046685qth.314.2018.03.22.06.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 06:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez0Zj-00041g-Ds
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 09:48:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ez0Za-00041Q-4S
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 09:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ez0ZW-0000T5-61
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 09:48:06 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41536 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1ez0ZW-0000Sh-1V; Thu, 22 Mar 2018 09:48:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9C00406805B;
	Thu, 22 Mar 2018 13:47:50 +0000 (UTC)
Received: from [10.10.125.19] (ovpn-125-19.rdu2.redhat.com [10.10.125.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7CEE2023230;
	Thu, 22 Mar 2018 13:47:44 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <20180322031216.14569-1-wei@redhat.com>
	<20180322080156.x2q7w6wtdrvc3wk3@hawk.localdomain>
	<CAFEAcA_Sb6iz-8cg00JXhNF5pMS3z2=QxhoEhwSgG6PG04nKqg@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <1571d9c0-de78-3daa-20f6-3e0e293f6658@redhat.com>
Date: Thu, 22 Mar 2018 08:47:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Sb6iz-8cg00JXhNF5pMS3z2=QxhoEhwSgG6PG04nKqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 13:47:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 13:47:50 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'wei@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Set VM's SMBIOS
 system version to mc->desc
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1hJOVEQ9X+Kp



On 03/22/2018 05:53 AM, Peter Maydell wrote:
> On 22 March 2018 at 08:01, Andrew Jones <drjones@redhat.com> wrote:
>> I agree we should change the useless 1.0, but shouldn't we use
>> mc->name instead of mc->desc? mc->name would make it consistent
>> with pc-piix and q35 and also be a less verbose "version". We'd
>> get e.g.
>>
>>  System Information
>>         Manufacturer: QEMU
>>         Product Name: KVM Virtual Machine
>>         Version: virt-2.12
>>         Serial Number: Not Specified
> 
> I would vote for consistency with x86, I think.

Drew and you like ->name better because of its conciseness consistency
with x86. In my view virt-2.xx is not very informative. "Version" info
in real machine could be verbose. Using my Thinkpad as example:

	Manufacturer: LENOVO
	Product Name: 20FAS1EG0N
	Version: ThinkPad T460s

With that said, I will change it to mc->name.

> 
> thanks
> -- PMM
> 
