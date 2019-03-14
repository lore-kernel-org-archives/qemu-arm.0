Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp596090wro;
        Thu, 14 Mar 2019 02:06:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySaimOKrvkDlMJCyyUJbB9Ms7Xd2Ar/rYv13bmAdCsPN4z41rL4DvGCz9+CFEYGYo7xL7E
X-Received: by 2002:a25:c804:: with SMTP id y4mr40865575ybf.429.1552554418309;
        Thu, 14 Mar 2019 02:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552554418; cv=none;
        d=google.com; s=arc-20160816;
        b=KUGIuiIV1O3GnRim8fH5ESQ/96TjElSgNHeMykc+CQXV9vG/s/LJxn6QBJVHtE3GxB
         m8/o2LzC0zVyGa5LGHzmAQKGzuwimF8xuc/eGFVYTViX32+F3iP/Qx9fezKFAW1nz+1J
         T4d9r15wxfXhA5B05hFkHK0wfss8sWzHO+Fp8bzM234t+1lPDc4gtsTVmsr4QK6gXnQJ
         b97d8GKUyQDQ5WyRHZunsVcc+gbWuQAugcO0Gsu1xArvLvZKfknbOrIjExVrgQMPUEPe
         ODizWw3S3bcd7OjLv37RIZ0xw3oJmR2l93GJ4zTOCguN5ZvczN93gtzT5Ul17UCS84uK
         97BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=OyZiJ5FtEPOjWZDX5FG1PKGIf7PMUvldnM4G7wkrwCE=;
        b=WqZwY9sGzaex7aokWGtGIRFvwH3p+YNMzuRCB42EecKODHpqPU+sRjY/LiHXncwagT
         wQ6EAP5fJDKp5tHIA64Fm3zbYlPUqBvG8J2H8WGRZZNYR+TezagRMuvRLmGKh4Yc7nyy
         /ADYC6623CDkm2YcrVsZTH5Usxlu0uBRY04laED8kjei0Me7bbLenHYp4ySof38LBhM4
         gBuMDD4IoBCFYFyAnopUD9Pm0tnp/cDtuwIo6kTGK/icCySQMXcDAuU4HnNZHSeFjgxy
         b2lYpYa+tJO6gsJ8LgsY7Vv0hUvo2KCgZ61Js+l2ap1QTgtYEf2oXwN3E1SMEj2jS9UD
         RYsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i186si6227300ywb.229.2019.03.14.02.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 02:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59439 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4MKH-0000Of-N1
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 05:06:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4MJw-0000HV-9x
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4MJv-0003ko-1k
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:06:36 -0400
Received: from 4.mo177.mail-out.ovh.net ([46.105.37.72]:56229)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1h4MJu-0003Xe-QU
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:06:34 -0400
Received: from player715.ha.ovh.net (unknown [10.109.159.90])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 3E602EA609
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 10:06:18 +0100 (CET)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
	(Authenticated sender: clg@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id 6365539A0C1E;
	Thu, 14 Mar 2019 09:06:06 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <155255399748.14224.8340819987953765086@00e3a2c681c7>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b240943d-9294-6894-1295-6110278e81cb@kaod.org>
Date: Thu, 14 Mar 2019 10:06:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <155255399748.14224.8340819987953765086@00e3a2c681c7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1840001925752064870
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrhedugdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.37.72
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/5] aspeed/timer: Fix slowdowns
 in recent Linux
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
Cc: fam@euphon.net, peter.maydell@linaro.org,
	Christian Svensson <bluecmd@google.com>, andrew@aj.id.au,
	qemu-arm@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3BzNlmyZCmwg

Hello,

For the time being, we can drop patch 5 from this series. 

Thanks,

C. 

On 3/14/19 9:59 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190314084235.9887-1-clg@kaod.org/
> 
> 
> 
> Hi,
> 
> This series failed the docker-mingw@fedora build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> time make docker-test-mingw@fedora SHOW_ENV=1 J=14 NETWORK=1
> === TEST SCRIPT END ===
> 
>   CC      migration/xbzrle.o
>   CC      migration/postcopy-ram.o
> /tmp/qemu-test/src/hw/timer/aspeed_timer.c: In function 'aspeed_timer_set_value':
> /tmp/qemu-test/src/hw/timer/aspeed_timer.c:279:19: error: '__int128_t' undeclared (first use in this function); did you mean '__int128'?
>                  ((__int128_t)delta * NANOSECONDS_PER_SECOND / rate);
>                    ^~~~~~~~~~
>                    __int128
> /tmp/qemu-test/src/hw/timer/aspeed_timer.c:279:19: note: each undeclared identifier is reported only once for each function it appears in
> /tmp/qemu-test/src/hw/timer/aspeed_timer.c:279:30: error: expected ')' before 'delta'
>                  ((__int128_t)delta * NANOSECONDS_PER_SECOND / rate);
>                  ~            ^~~~~
>                               )
> /tmp/qemu-test/src/hw/timer/aspeed_timer.c:276:22: error: unused variable 'rate' [-Werror=unused-variable]
>              uint32_t rate = calculate_rate(t);
>                       ^~~~
> /tmp/qemu-test/src/hw/timer/aspeed_timer.c:275:21: error: unused variable 'delta' [-Werror=unused-variable]
>              int64_t delta = (int64_t) value - (int64_t) calculate_ticks(t, now);
>                      ^~~~~
> cc1: all warnings being treated as errors
> 
> 
> The full log is available at
> http://patchew.org/logs/20190314084235.9887-1-clg@kaod.org/testing.docker-mingw@fedora/?type=message.
> ---
> Email generated automatically by Patchew [http://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 

