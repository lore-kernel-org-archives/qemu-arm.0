Received: by 10.25.208.137 with SMTP id h131csp1452625lfg;
        Mon, 9 May 2016 01:55:10 -0700 (PDT)
X-Received: by 10.140.232.137 with SMTP id d131mr36128165qhc.87.1462784110164;
        Mon, 09 May 2016 01:55:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q83si2776926qki.58.2016.05.09.01.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 01:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azgy5-0006D6-Jq
	for alex.bennee@linaro.org; Mon, 09 May 2016 04:55:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1azgy1-000664-CR
	for qemu-arm@nongnu.org; Mon, 09 May 2016 04:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1azgxw-0008Qo-1P
	for qemu-arm@nongnu.org; Mon, 09 May 2016 04:55:04 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:40054)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1azgxv-0008Qd-Qu; Mon, 09 May 2016 04:54:59 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 7E69722464;
	Mon,  9 May 2016 10:54:58 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 09 May 2016 10:54:58 +0200
From: michael@walle.cc
To: xiaoqiang zhao <zxq_yx_007@163.com>
In-Reply-To: <1462532375-29264-4-git-send-email-zxq_yx_007@163.com>
References: <1462532375-29264-1-git-send-email-zxq_yx_007@163.com>
	<1462532375-29264-4-git-send-email-zxq_yx_007@163.com>
Message-ID: <c686b39fca0c5915bc4c5beca8db8cd8@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: Re: [Qemu-arm] [PATCH v2 3/5] hw/display: QOM'ify milkymist-tmu2.c
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
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zZjxHwddwJKA

Am 2016-05-06 12:59, schrieb xiaoqiang zhao:
> * Drop the old SysBus init function and use instance_init
> * Move tmu2_glx_init into realize stage
> 
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>

Acked-by: Michael Walle <michael@walle.cc>
Tested-by: Michael Walle <michael@walle.cc>

-michael

