Received: by 10.25.208.211 with SMTP id h202csp494219lfg;
        Thu, 17 Mar 2016 08:04:53 -0700 (PDT)
X-Received: by 10.140.109.33 with SMTP id k30mr15008081qgf.45.1458227093068;
        Thu, 17 Mar 2016 08:04:53 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y70si8141666qka.77.2016.03.17.08.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 08:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agZTo-0000HI-Hq
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 11:04:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1agZSW-0006XO-1I
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 11:03:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1agZSP-00028w-TH
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 11:03:31 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:60394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1agZSF-000266-Q6; Thu, 17 Mar 2016 11:03:15 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id E5489223B9;
	Thu, 17 Mar 2016 16:02:44 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 17 Mar 2016 16:02:44 +0100
From: michael@walle.cc
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA9Afp32O6Jz_x=b+5c+RnPqCmouUhLdY4ptnmcbLes7vA@mail.gmail.com>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
	<1456110933-5457-4-git-send-email-zxq_yx_007@163.com>
	<761259451cb8d9bc5823589d63c3c1e4@walle.cc>
	<CAFEAcA9Afp32O6Jz_x=b+5c+RnPqCmouUhLdY4ptnmcbLes7vA@mail.gmail.com>
Message-ID: <7c7701fca9a5e1a2a483fe6c0020ef90@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, xiaoqiang zhao <zxq_yx_007@163.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Maksim Kozlov <m.kozlov@samsung.com>,
	=?UTF-8?Q?An?= =?UTF-8?Q?dreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-devel] [PATCH v4 3/9] hw/timer: QOM'ify lm32_timer
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
X-TUID: 9vavl0OccHpZ

Am 2016-03-17 16:00, schrieb Peter Maydell:
> On 17 March 2016 at 14:59,  <michael@walle.cc> wrote:
>> [I had some problems with my mailserver and the v5 version didn't make 
>> it
>> through. I know there is a v5 version of this patch series and I've 
>> tested
>> with the v5 version]
>> 
>> 
>> Am 2016-02-22 04:15, schrieb xiaoqiang zhao:
>>> 
>>> * split the old SysBus init function into an instance_init
>>>   and a Device realize function
>>> * use DeviceClass::realize instead of SysBusDeviceClass::init
>>> 
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
>> 
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
> 
> Signed-off-by: doesn't make much sense in this situation -- did
> you want Acked-by, Reviewed-by, Tested-by, or some combination
> of those ?

ahh sorry, need more sleep :(

Acked-by: Michael Walle <michael@walle.cc>
Tested-by: Michael Walle <michael@walle.cc>

-michael
