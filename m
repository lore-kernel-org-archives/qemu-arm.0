Received: by 10.25.208.211 with SMTP id h202csp493088lfg;
        Thu, 17 Mar 2016 08:03:10 -0700 (PDT)
X-Received: by 10.140.195.203 with SMTP id q194mr15791115qha.45.1458226990204;
        Thu, 17 Mar 2016 08:03:10 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f132si8176279qkb.7.2016.03.17.08.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 08:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agZS9-0005GG-LU
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 11:03:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1agZQI-00028o-7H
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 11:01:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1agZQE-0000GY-4g
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 11:01:14 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:46756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1agZQ4-0000BS-2r; Thu, 17 Mar 2016 11:01:00 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 6F71F223B7;
	Thu, 17 Mar 2016 16:00:29 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 17 Mar 2016 16:00:29 +0100
From: michael@walle.cc
To: xiaoqiang zhao <zxq_yx_007@163.com>
In-Reply-To: <1456110933-5457-7-git-send-email-zxq_yx_007@163.com>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
	<1456110933-5457-7-git-send-email-zxq_yx_007@163.com>
Message-ID: <d4d40b2ab5f5e997bfff7d5b2f2a0099@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Cc: peter.maydell@linaro.org, gxt@mprc.pku.edu.cn, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	m.kozlov@samsung.com, afaerber@suse.de
Subject: Re: [Qemu-devel] [PATCH v4 6/9] hw/timer: QOM'ify milkymist_sysctl
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CThRthD0l5Ts

[I had some problems with my mailserver and the v5 version didn't make 
it through. I know there is a v5 version of this patch series and I've 
tested with the v5 version]

Am 2016-02-22 04:15, schrieb xiaoqiang zhao:
> * split the old SysBus init function into an instance_init
>   and a Device realize function
> * use DeviceClass::realize instead of SysBusDeviceClass::init
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>

Signed-off-by: Michael Walle <michael@walle.cc>

-michael
