Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp764400wrq;
        Fri, 22 Jun 2018 05:18:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeB6WiGBumK75kp8XQsjC9K1H98vDKEXKN1EZB5DD9sMAN56LVmqats5wcI+L9uPR414W5z
X-Received: by 2002:a37:77c7:: with SMTP id s190-v6mr1055991qkc.73.1529669933035;
        Fri, 22 Jun 2018 05:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529669933; cv=none;
        d=google.com; s=arc-20160816;
        b=HlesSTf1sc/LdVxfp5b5UFF69JJIeMfgAU4oflrAS3WpQDlTvkJRNyV02phKySuqat
         buAKPoU+4IKhdNqmuh9xUqDNg9tquzDl+udgVQ+rpmFBD7klQxCGo47uXDgn1TgnpgEM
         ZCIImeAx2mMzrRui0EQxyYM4Qq3OI/pMPiINQrQDvmnbbN6aKgrBki1y5TxXZWpsFOCM
         PQ+sMnW5CvjY1BQSv6FKHMX1A6+ZuI2SgFDHovLQwJqjaGKDW1Och5H9Lzg1wAIiDgMc
         AhkUiwcZDqN6q/pAWO4sLxRKbcsESxiMxZQOfRXGfUbaLzvs2BpNTnOBnwWmtjMY4d8/
         QxGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=jSArRptjs9fGbJ0/aL0WNA9W8dDSveBfL+Svx7mE/1w=;
        b=YW9hAwQ6aFSQ22+XDdDisN49WmIoZ4GFlv2z3CzxzzpIzHft6BCOGlaHoSBo+RLF8h
         BLxq3iGNIlxujyQ1WA4fjf/ZyH89kWU6KsVu0kEGCAj1vzNq6e3gQKhGD+2i2UTWDHYV
         f++m1bgvjYa34mz7ayQanTVoK8sQyC0vW1rsivOrLeRx8FNzh70ZjX62rdYZzUsaNki+
         z2bJbvH9L9LA8SpxQ4WaCLSz+7bh+GaOYMdYIZoCWF2eICCelC+QZ+Or4yyLSqwHE8Mm
         l2aI8PfxEViNPfTYl4tx1eJyRpETMsnbQmTA0nPgmApfcFh5WMihZAQMYjZFQFzhVfcD
         m6EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7-v6si3348483qkf.217.2018.06.22.05.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 05:18:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWL1g-0007QP-Ej
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 08:18:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWL1V-0007QF-Nn
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 08:18:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWL1S-00079m-IM
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 08:18:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48754 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWL1S-00078t-Cb; Fri, 22 Jun 2018 08:18:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D467F40753AB;
	Fri, 22 Jun 2018 12:18:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 676571C707;
	Fri, 22 Jun 2018 12:18:32 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <152966590354.870.11455841719190291898@d39dc562802a>
	<7de18b27-f711-3084-a073-0f9b490b8fbf@redhat.com>
	<CAFEAcA9xkxCBWp_RwOcs4p6eB-fVsjUEyewGCE6CdEAsAA8U3Q@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <552ade80-4287-6383-393d-dfb34fd3752a@redhat.com>
Date: Fri, 22 Jun 2018 14:18:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9xkxCBWp_RwOcs4p6eB-fVsjUEyewGCE6CdEAsAA8U3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 22 Jun 2018 12:18:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 22 Jun 2018 12:18:37 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/4] ARM SMMUv3: IOTLB
 Emulation and VHOST Support
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
Cc: Fam Zheng <famz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	jia.he@hxt-semitech.com, qemu-arm <qemu-arm@nongnu.org>,
	Jia He <hejianet@gmail.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9juDYmm8zMk+

Hi Peter,

On 06/22/2018 02:06 PM, Peter Maydell wrote:
> On 22 June 2018 at 12:33, Auger Eric <eric.auger@redhat.com> wrote:
> 
>>> /tmp/qemu-test/src/nbd/server.c: In function 'nbd_trip':
>>> /tmp/qemu-test/src/nbd/server.c:1980:19: error: 'end' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>      *length = end - offset;
>>>                ~~~~^~~~~~~~
>>> /tmp/qemu-test/src/nbd/server.c:1940:30: note: 'end' was declared here
>>>      uint64_t begin = offset, end;
>>
>> Looks this does not relate to my series or do I miss something?
> 
> Yeah; a change in the nbd pullreq slipped through that confuses
> the elderly gcc in this patchew config.

ouch. sweat.

Thank you for the confirmation.

Eric
> 
> -- PMM
> 
