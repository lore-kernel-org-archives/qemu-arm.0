Received: by 10.25.208.211 with SMTP id h202csp920432lfg;
        Tue, 15 Mar 2016 19:28:27 -0700 (PDT)
X-Received: by 10.140.232.15 with SMTP id d15mr1893678qhc.87.1458095307051;
        Tue, 15 Mar 2016 19:28:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y94si100969qgd.108.2016.03.15.19.28.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 19:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:52664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag1CE-0001pv-K1
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 22:28:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ag1CB-0001pl-R8
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 22:28:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ag1C8-0003Ei-7O
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 22:28:23 -0400
Received: from m12-13.163.com ([220.181.12.13]:57754)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ag1C7-0003CY-5U; Tue, 15 Mar 2016 22:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=tOR9x
	hWBccglC6BO3xS9ca0Pzr2sOOmDGMp2BU947kA=; b=E9eqWxi4HLTcz3i8oXL2l
	d2Arj5xt13VpLKqSb08N94inB2VvKCFW8oidO513PuflLKOe9AWxHwjjIwjlg48p
	8CLYbkMyecJZy5L22Yqq/Ze2lfX5t5S/RiWf+cPxkYyyk/1tFFx+sKO+GUoGJW7r
	OI3FM+1cTKIHcAyDC7tyXs=
Received: from [192.168.31.184] (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowADXBFKZxOhWzVjRAA--.15133S2;
	Wed, 16 Mar 2016 10:27:38 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA_-+gK88n0UvcZi4nQPyNhjS26CSY-Xd5nv=L6jUovTkg@mail.gmail.com>
	<56D7DA5E.6020402@163.com>
From: hitmoon <zxq_yx_007@163.com>
Message-ID: <56E8C44D.1000103@163.com>
Date: Wed, 16 Mar 2016 10:26:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <56D7DA5E.6020402@163.com>
Content-Type: multipart/alternative;
	boundary="------------050909080304040309090505"
X-CM-TRANSID: DcCowADXBFKZxOhWzVjRAA--.15133S2
X-Coremail-Antispam: 1Uf129KBjvdXoW5KF18uFWUGF47Kw47XF1UJrb_yoWxXrc_Wr
	WruFyfGws7Ww4xKa1I9r4fAr15JFyjqFW8JF12qF4xX34rJrs8A395Kry7A3yrGF43CFZx
	AFy5XrWkK3srJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnOB_UUUUUU==
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEhsuxlZXwnsJdAAAsk
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
X-TUID: U4geS/nay5Dp

This is a multi-part message in MIME format.
--------------050909080304040309090505
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2016年03月03日 14:31, hitmoon 写道:
> On 25 February 2016 at 10:30, xiaoqiang zhao<zxq_yx_007@163.com>  wrote:
>> This patch series QOM'ify timer code under hw/timer directory.
>> Main idea is to split the initfn's work, some to TypeInfo.instance_init
>> and some is placed in DeviceClass::realize.
>> Drop the use of SysBusDeviceClass::init if possible.
>>
>> Patch 3,4 (m48t59) has been tested in a sparc vm with debian linux guest
>> and savevm/loadvm looks fine.
>> Comments from the relevant maintainers are needed!
> ping ...
> http://lists.nongnu.org/archive/html/qemu-devel/2016-02/msg05859.html
ping! Any comment guys ?

--------------050909080304040309090505
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">在 2016年03月03日 14:31, hitmoon 写道:<br>
    </div>
    <blockquote cite="mid:56D7DA5E.6020402@163.com" type="cite">
      <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
      <pre wrap="">On 25 February 2016 at 10:30, xiaoqiang zhao <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:zxq_yx_007@163.com">&lt;zxq_yx_007@163.com&gt;</a> wrote:
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
      <a moz-do-not-send="true" class="moz-txt-link-freetext"
href="http://lists.nongnu.org/archive/html/qemu-devel/2016-02/msg05859.html">http://lists.nongnu.org/archive/html/qemu-devel/2016-02/msg05859.html</a><br>
    </blockquote>
    ping! Any comment guys ?<br>
  </body>
</html>

--------------050909080304040309090505--

