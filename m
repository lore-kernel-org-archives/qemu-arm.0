Received: by 10.223.161.27 with SMTP id o27csp895824wro;
        Thu, 26 Oct 2017 09:37:48 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+ROaCQkWGjH9dUzl/C3doqOhhO2AYPqEVN47VNVv9MOV7Nx8m9j0HinWNeS5zXkswU15jcj
X-Received: by 10.37.210.199 with SMTP id j190mr3745639ybg.424.1509035868007;
        Thu, 26 Oct 2017 09:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509035868; cv=none;
        d=google.com; s=arc-20160816;
        b=b58eXnTXgHh8pQPflJ+QNrc4oPvL8aWuUxVHDufbnDkZkg3Axmcy0SbWTXw/f24PiL
         zGRZqWgO/nmvaCT83pbK/c9pEyk37KrRoo5oMChd1mzjk/NXw3GVEk3UgPHwQ69UHn1G
         j6RRKvNviKg7kELuz/xzWpI6ChunGVY8jcG+ywx5s7JtNRtjRWKNqv0T2iYNczFuENdy
         ZT8vNVBcwDvZi9ggQYSIOi3XneDz6aT8zr26cMBMlQ0OFJ70uZQbnvmYtkcN+W1Rt5N0
         3FSQtbpqscjEoPX27Vvh2RVAR1gvlXV46LY6s8pUKbr/zgY8UNTbIBYxKKQ5VqgoOx9Z
         YYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lGPqCW6m6vpX5WjqA1o50a3mqAcbZxwvueU5YG2Cw0g=;
        b=AZf7DYctSezQekYlN6vOeTehiv7xvk3s49m92M4LooZdcUG9NVomusG2aFSoqCW2io
         0rWSGefzTpaVC3jsIBV4O2H3SYXziAonavDlgBveV+NHvcr6XZc8TQIH16tmQOvpU/KJ
         Ug3rnenrlYbN26Dem7WHxstO5f1PQPlFcHSXLJTBPo9mf8PaJecTpjbyL0uDENVHwlzK
         tlEuXEbdn3FbDYcLwoT7yXq9wh3X+GZtb3BL4EB8UwgTVk57PwBDCrfXnJMuUixHzsCH
         LmRCgusbRxGb9qSlbg88qRzoXUs5GTIMWTOJllLK+IUXli8lAANiOSC1fwcNF5mxdDmV
         5sng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=HronU7wz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3si771041ybc.761.2017.10.26.09.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 09:37:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=HronU7wz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:53834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7lAB-00053g-H8
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 12:37:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7l9B-0004aS-Dd
	for qemu-devel@nongnu.org; Thu, 26 Oct 2017 12:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7l97-0007QZ-B9
	for qemu-devel@nongnu.org; Thu, 26 Oct 2017 12:36:45 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:43071)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1e7l97-0007Q0-6O; Thu, 26 Oct 2017 12:36:41 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ded56cd;
	Thu, 26 Oct 2017 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=E/PmwxGJ4LQg2SRv+hmexafrDG0=; b=HronU7
	wzg2QW8FYVZMxGr0QU2fIF1DuWh7GZYIfyGn4wBOcPxMPT717UTtieu4mAa366++
	HkNtVMJfuid6oCx7+imiNuQXmJQoXDtH0gl68MkNC0ZHeYNg83YxhnQqBpfOacc6
	cs7w5G59X0jMyMdJ8TWmy2coQFXZRzN5kbIQSSM3vG5Ekdz0+oTle1ZCOg/hDF/C
	YcmzhweixlApY2Cjg7gnd27MGduXa8n/yqciYJh67UAjEFmg30UKvGA9YAXIeg3g
	OCjhP/ho5DObBP/UIbYXYGniiKZpyBNXBHQeBmzo4WAOazSRlelwldiHYkqq2rq/
	acAl55/p3y5NEbJQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7c2e57a1
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Thu, 26 Oct 2017 16:34:53 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id c77so6686780oig.0;
	Thu, 26 Oct 2017 09:36:38 -0700 (PDT)
X-Gm-Message-State: AMCzsaVUcfQXXyRgIqTweGebXWImPr75Vc2X6Ku1h/sr/ULGl7uaJnww
	Iv3nrcD7tYiwvhby/gBh/vDpU353QFromkAB0qg=
X-Received: by 10.157.47.163 with SMTP id r32mr3173491otb.108.1509035797568;
	Thu, 26 Oct 2017 09:36:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Thu, 26 Oct 2017 09:36:37 -0700 (PDT)
In-Reply-To: <CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
	<CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 18:36:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
Message-ID: <CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/virt: support 4 serial
 ports
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 14+/WEzaonLp

On Thu, Oct 26, 2017 at 6:34 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Reordering it would break existing users of the trustzone uart,
> whose command lines would stop working.

I thought this was the reason for all of those virt26, virt28,etc
types -- people who want stability code the revision into their
scripts. Everybody else then gets the latest.
