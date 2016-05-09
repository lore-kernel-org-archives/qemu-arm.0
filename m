Received: by 10.25.208.137 with SMTP id h131csp1454130lfg;
        Mon, 9 May 2016 01:59:44 -0700 (PDT)
X-Received: by 10.55.114.71 with SMTP id n68mr36031987qkc.37.1462784384470;
        Mon, 09 May 2016 01:59:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14si18026386qke.162.2016.05.09.01.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 01:59:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azh2W-0002XD-3n
	for alex.bennee@linaro.org; Mon, 09 May 2016 04:59:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1azh2T-0002VI-Nh
	for qemu-arm@nongnu.org; Mon, 09 May 2016 04:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1azh2P-0000mg-9C
	for qemu-arm@nongnu.org; Mon, 09 May 2016 04:59:40 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:35234)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1azh2O-0000mb-V1; Mon, 09 May 2016 04:59:37 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 40FCF2237D;
	Mon,  9 May 2016 10:59:36 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 09 May 2016 10:59:36 +0200
From: michael@walle.cc
To: Markus Armbruster <armbru@redhat.com>
In-Reply-To: <87zis363r4.fsf@dusky.pond.sub.org>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
	<1462417489-28603-4-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8io8mxvragDfEDiEkysfbceP_ebE=ExSX1RzdwvrogXg@mail.gmail.com>
	<87zis363r4.fsf@dusky.pond.sub.org>
Message-ID: <cbc6c93b757ef5d90842f6898f613158@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RESEND 3/5] hw/display: QOM'ify
 milkymist-tmu2.c
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fS72DRw9r5mv

Am 2016-05-06 09:32, schrieb Markus Armbruster:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On 5 May 2016 at 04:04, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>>> * Drop the old SysBus init function and use instance_init
>>> * Move tmu2_glx_init into realize stage
>>> 
>>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
>> 
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> 
>>> +static void milkymist_tmu2_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    MilkymistTMU2State *s = MILKYMIST_TMU2(dev);
>>> +
>>> +    if (tmu2_glx_init(s)) {
>>> +        error_setg(errp, "tmu2_glx_init failed.");
>>> +    }
>>>  }
>> 
>> The milkymist maintainer might have a suggestion for a
>> more informative error message here.
> 
> Also, error_setg() doesn't want the period:
> 
>  * The resulting message should be a single phrase, with no newline or
>  * trailing punctuation.

Sorry, I can't think of a better description. The TMU2 code isn't my 
code. I had a look, but basically, it's because some glX functions might 
fail. But glx being not available isn't one of them because that is 
already checked in milkymist_tmu2_create().

-michael
