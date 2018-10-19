Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3860860wrt;
        Fri, 19 Oct 2018 07:00:12 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dxwTAM11ecKoRzSJsliftP8XDNKTPkdog4gUQ68cAkOTYO/Rc31JRv6huI3AOL6xOybTlb
X-Received: by 2002:a0c:fbce:: with SMTP id n14mr6200220qvp.43.1539957612752;
        Fri, 19 Oct 2018 07:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539957612; cv=none;
        d=google.com; s=arc-20160816;
        b=PKaq9i8y33zziLa0pivRQDhoEcGS7uaAwtR7nJzsL/DxUXvAQVJIDwjWT+/ias8VKc
         hWfWBNabKcCG/OvvKFAYV07Af81N7hQaxdNtimj9RT78pll9PiDP1kyrNpvEUzvUmqOx
         BKYwsQyy2UNuv91SzCbBrRLg3qTaHRNTqU9NcHg9zoi6JQzbYk+VzANtDm/jun4ufolF
         +p1ytQy1qcF+8pR21EdffDAPsxQW1PNr2QYuTrCj4MgmscfplM6o+Alp8+91re0+AaIO
         61Tspq7XZBPGsbV5HMxfwPOn611N+Z5Z1ZtSOu1xv4hnfsuzpmK4t3xKstPOUWU+UMYv
         cIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=2rqADi4o0dKm/KyXKJX0yjgF08TLp5eWP/BvIT+IUEI=;
        b=duWj16RLnMped2NX0zqv3JpIYIYqsz8vms1nOq199VlFGjMRwA+N5wG4tahcK5yJ1d
         rwdt3XgyojqUWA29/Ez69GhSnUk2w6lXhz9F8ubQM/gQlD+bHRX8b8AAzknjqdfmeobm
         HQ8BdvmJkzLsEXcFYonCdh4Kri97R010DVxMdJjOYNcyNhnmzbeE3ZEoFtSKBcWjaVXZ
         EWVxyYGcTHhWpE5bbG5bT/xnlKoOYLS1ceSZIM2c6QaB3gKzj4E1EvpZzfCaMGnk+hiL
         4byiaY3xZ4bJMp792t/srhemdo+CxOeFAb89EdJZAY5LdHJFNtpmG1URvcG5MFRvR1kB
         tb4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7-v6si1545820qtq.186.2018.10.19.07.00.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 07:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDVJz-0005BM-J0
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 10:00:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gDVJm-0005AX-BD
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:59:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gDVJi-0002q5-Bx
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:59:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gDVJi-0002p8-4B; Fri, 19 Oct 2018 09:59:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB7A2308A964;
	Fri, 19 Oct 2018 13:59:51 +0000 (UTC)
Received: from [10.36.116.234] (ovpn-116-234.ams2.redhat.com [10.36.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0BF45D77C;
	Fri, 19 Oct 2018 13:59:46 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>,
	eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
	kwangwoo.lee@sk.com, imammedo@redhat.com, david@redhat.com
References: <20181018143042.29588-1-eric.auger@redhat.com>
	<20181018143042.29588-8-eric.auger@redhat.com>
	<9f8fa71c-555c-72d4-70a7-031f9b69e9bc@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <cfbbabcd-fd98-6451-7673-5e4bd19c1908@redhat.com>
Date: Fri, 19 Oct 2018 15:59:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <9f8fa71c-555c-72d4-70a7-031f9b69e9bc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 19 Oct 2018 13:59:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 07/16] hw/arm/virt: Implement
 kvm_type function for 3.2 machine
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7v2SBzCoVSMi

Hi Richard,

On 10/19/18 4:58 AM, Richard Henderson wrote:
> On 10/18/18 7:30 AM, Eric Auger wrote:
>> +#define SZ_1G (1024ULL * 1024 * 1024)
> 
> <qemu/units.h> already defines GiB.
noted

thanks!

Eric
> 
> 
> r~
> 
