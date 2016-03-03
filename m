Received: by 10.25.208.211 with SMTP id h202csp2534993lfg;
        Wed, 2 Mar 2016 22:34:10 -0800 (PST)
X-Received: by 10.140.222.136 with SMTP id s130mr1090074qhb.62.1456986850173;
        Wed, 02 Mar 2016 22:34:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a89si9342912qge.3.2016.03.02.22.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Mar 2016 22:34:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:60920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abMpt-0006eG-LN
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 01:34:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1abMpr-0006e9-HP
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 01:34:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1abMpn-0000ws-DQ
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 01:34:07 -0500
Received: from m12-13.163.com ([220.181.12.13]:54415)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1abMpm-0000vY-Dr; Thu, 03 Mar 2016 01:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=pKBSO
	kCqqsQR/tsGRb2AX5FYhJ/tsk79aN7fIMCQK1c=; b=QmvXbZ1+KRHv294ZGDvOy
	1eIr3fgIBH4jFGylORM8W0IsTHFJHApluGnimGFkNTvtz5stvxlQvkZql6IYHH5L
	qrfL9Ig6SqEOtUs9em7YGyK6ObeVPenS24BVudNxT8Qs2d9bdxdb8bdEaJsRC41m
	Kq8pPGvO1b1J+SYUCJLh90=
Received: from [192.168.31.184] (unknown [101.254.142.162])
	by smtp9 (Coremail) with SMTP id DcCowAD3_1+g2tdWQBSbCg--.33604S2;
	Thu, 03 Mar 2016 14:33:14 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA_-+gK88n0UvcZi4nQPyNhjS26CSY-Xd5nv=L6jUovTkg@mail.gmail.com>
From: hitmoon <zxq_yx_007@163.com>
Message-ID: <56D7DA5E.6020402@163.com>
Date: Thu, 3 Mar 2016 14:31:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_-+gK88n0UvcZi4nQPyNhjS26CSY-Xd5nv=L6jUovTkg@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------040007030904070806070502"
X-CM-TRANSID: DcCowAD3_1+g2tdWQBSbCg--.33604S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVq2MUUUUU
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOwohxlXlSHrXaAAAsr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v5 0/8] QOM'ify hw/timer/*
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C04Etm/hS5y5

This is a multi-part message in MIME format.
--------------040007030904070806070502
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25 February 2016 at 10:30, xiaoqiang zhao <zxq_yx_007@163.com> wrote:

> This patch series QOM'ify timer code under hw/timer directory.
> Main idea is to split the initfn's work, some to TypeInfo.instance_init
> and some is placed in DeviceClass::realize.
> Drop the use of SysBusDeviceClass::init if possible.
>
> Patch 3,4 (m48t59) has been tested in a sparc vm with debian linux guest
> and savevm/loadvm looks fine.
> Comments from the relevant maintainers are needed!
ping ...
http://lists.nongnu.org/archive/html/qemu-devel/2016-02/msg05859.html

--------------040007030904070806070502
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <pre wrap="">On 25 February 2016 at 10:30, xiaoqiang zhao <a class="moz-txt-link-rfc2396E" href="mailto:zxq_yx_007@163.com">&lt;zxq_yx_007@163.com&gt;</a> wrote:
</pre>
    <blockquote type="cite">
      <pre style="color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">This patch series QOM'ify timer code under hw/timer directory.
Main idea is to split the initfn's work, some to TypeInfo.instance_init
and some is placed in DeviceClass::realize.
Drop the use of SysBusDeviceClass::init if possible.

Patch 3,4 (m48t59) has been tested in a sparc vm with debian linux guest
and savevm/loadvm looks fine. <pre style="color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">Comments from the relevant maintainers are needed!</pre></pre>
    </blockquote>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    ping ... <br>
<a class="moz-txt-link-freetext" href="http://lists.nongnu.org/archive/html/qemu-devel/2016-02/msg05859.html">http://lists.nongnu.org/archive/html/qemu-devel/2016-02/msg05859.html</a><br>
  </body>
</html>

--------------040007030904070806070502--

