Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5264499wrq;
        Tue, 26 Jun 2018 10:15:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcswTRMUFj1jxy6iSfVVFJXN0cVUpHMhWH6RNWV6YFk1PO52h1+QAXSaxC1Egr+BJKSXuLi
X-Received: by 2002:ac8:e4f:: with SMTP id j15-v6mr2194800qti.165.1530033325535;
        Tue, 26 Jun 2018 10:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530033325; cv=none;
        d=google.com; s=arc-20160816;
        b=vc0dpUuNMP142EW6ZNyYVTBp+up/tU5tCLBHn5XdDNEnSJYbGikNcZwogwGtk//KDB
         9V0W067KHaq/AJpQ5ny44dKXhN8M0muhoqJZ+5say3GlScwcmrpTP+3Z7ADwFoFu302g
         hsYDjfnHkkDnlbhoILMa7eRtI574XY8RZ5ufcjfQa78Pa/XJTsLBWEWoGghpN0Ewx99F
         NJDz9t+RHOtGyF2bcBXDYLlov3OXaj46rLzHAQRRXAk9vChdpUvOP5KHBDNEsvvth5kI
         7/XUA55If7V6E1yIKkI2aQhgYrHxYjiBjqdSFAx7sz4QIsWEG9Gg7P3ZHd8URofLA+NK
         NYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=x3SQJHLbcCX0KxbSQWkzmDfkRH2/x2pD66BlJPmxuYM=;
        b=U8hz5rR+Oyl1grXv7pnaldjJWz/hLeef8mH+g7MaCOE3LSKT/1z2mZDTLk/qgPSWDC
         zWOP25RSTyylrAbZRoEMycm+4cTe3rfEYXlfZUZZnVLDUAS32I9V17V2e6GE00JAjTfD
         1bh0vvHUYN6v70M/n0yuKr+sfA0ptYLLc/F5N75kMOFosD52ZyPYBOWoO9VF9rfmOyxw
         4xQUxDMXertNTpCOLqEifVbnGHM0YbSQF37ggk0jBOjsjO6kignXQ2taSC0R9j2An9aG
         vm31UaxdeXxZcGx/zC4IcPseB/4M1RD1OhKG8eOIvrIVDUEgeFuoGVAHojI3IVVNsdaP
         RDzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f16-v6si1964350qvm.7.2018.06.26.10.15.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 10:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXrYr-0007YA-08
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 13:15:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fXrYf-0007Wq-Nt
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 13:15:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fXrYa-0006Ec-Qd
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 13:15:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:32972 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fXrYa-0006ES-Ke; Tue, 26 Jun 2018 13:15:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0D927A7E8;
	Tue, 26 Jun 2018 17:15:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDF462026D6A;
	Tue, 26 Jun 2018 17:15:06 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1529673765-16627-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9Pg3C+XD7WuLyNr5RfifRCvXB6t01YuLiK9Cs15v-Dpg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a49d3e03-a6aa-b627-c2e3-2b3c4bddf74d@redhat.com>
Date: Tue, 26 Jun 2018 19:15:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Pg3C+XD7WuLyNr5RfifRCvXB6t01YuLiK9Cs15v-Dpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 17:15:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 17:15:08 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v3 0/3] ARM virt: Silence dtc warnings
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
Cc: Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zftl03EyoTCh

Hi Peter,

On 06/26/2018 07:06 PM, Peter Maydell wrote:
> On 22 June 2018 at 14:22, Eric Auger <eric.auger@redhat.com> wrote:
>> When running dtc on the guest /proc/device-tree, we get the
>> following warnings: "Warning (unit_address_vs_reg): Node <name>
>> has a reg or ranges property, but no unit name", with name:
>> /intc, /intc/its, /intc/v2m, /memory.
>>
>> This series removes those warnings by adding the unit address to
>> the corresponding node names.
> 
> This didn't apply to my target-arm.next tree. Once I've
> applied my on-list arm pullreq to master, could you
> rebase it, please?

Sure

Thanks

Eric
> 
> thanks
> -- PMM
> 
