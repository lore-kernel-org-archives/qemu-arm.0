Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3772076wrx;
        Mon, 4 Mar 2019 08:13:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxykZhe1eHJkXyFYchdM8b46HFbJX1ncv4AVaOrBYSJW0ZPgqpipq0llh92bdTgmamJQBB2
X-Received: by 2002:a25:dd8:: with SMTP id 207mr5412871ybn.379.1551715987000;
        Mon, 04 Mar 2019 08:13:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551715986; cv=none;
        d=google.com; s=arc-20160816;
        b=Klx+Zz6MbfQHzVwA97eutViDiZMUu6mlpdx8/3AbB879kObKOykOvgJgATZuiNsTQA
         bf7nONR6JojLevGgQrA8teOTTq+yEo+gsQYGeF4qsv4T31tFTdy5bdfk6VJdPim2tUnx
         32FJsgqshbks5x5arNqnOCA9dxefnU7120Gx1YIEZHpq4AqCCMDkA2usQYmx0jryrxNK
         DqsPQB959mzI2ixYpYmaxmhnK9L5EXfixzbc4+hmGFZFtE7fBbCUKqvtkfFKe99ugLlo
         bU7gTeWcRQirA8fXk0vR1wT7IesWK8wvId1WKBJIGlkDw5ZE6cvRtK6dy9y0OFA2U6CM
         LFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=jff3OwqqDiCcU1fajIUUH5EmO+GhI4E6/jSc7KhAXzA=;
        b=WcKNyCfdXeAArCgx3pIkmK3F0hX2YMfCnBJIU9uITn7y8q9SlXgyriKyaKse8jzn5O
         yU4xt2FQzeki8Y88WGfQ4tI5jPDYubSvQBDpwh+cY7sNIEaDIdShIizUCTZj7on8fcqW
         fE6e/6MHZ6H6071szOr0k32868X3Mbde5GeWfrSckmfiu8l5tRt8mV6S17fI01uoZCGB
         QVmfO5zEfJTQIvCBd1SC2e0APl08aZIaLaI0auNA4k4243r6pHUFvh0qDOyjXd0NCEfT
         EHyT3OrxcneYW/oKP2bPTGOZhpTU4Hh/ImRBal0hctV+Kn+urksSeWAVaXNYOtuhNJjU
         0JFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p83si3530187ywb.163.2019.03.04.08.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 08:13:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0qDC-0004ZZ-Db
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 11:13:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1h0qD0-0004YI-M8
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 11:12:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1h0qCw-000591-Nm
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 11:12:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56732)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mprivozn@redhat.com>)
	id 1h0qCw-00055D-DB; Mon, 04 Mar 2019 11:12:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49C703082B5A;
	Mon,  4 Mar 2019 16:12:46 +0000 (UTC)
Received: from [10.43.2.30] (unknown [10.43.2.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BED025D6B3;
	Mon,  4 Mar 2019 16:12:41 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com> <87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com> <20190304123908.GK4239@redhat.com>
	<20190304151641.3deefc3b@redhat.com> <20190304142432.GM4239@redhat.com>
	<20190304161932.0438c880@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <ae0335fb-9201-e09d-80ad-5e497365267b@redhat.com>
Date: Mon, 4 Mar 2019 17:12:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20190304161932.0438c880@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 04 Mar 2019 16:12:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate
 'mem' parameter of '-numa node' option
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c6tebFF6rwuR

On 3/4/19 4:19 PM, Igor Mammedov wrote:

> Then I'd guess that most VMs end up with default '-numa node,mem'
> which by design can produce only fake NUMA without ability to manage
> guest RAM on host side. So such VMs aren't getting performance benefits
> or worse run with performance regression (due to wrong sched/mm decisions
> as guest kernel assumes NUMA topology is valid one).

Specifying NUMA distances in libvirt XML makes it generate the modern 
cmd line.

Michal
