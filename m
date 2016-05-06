Received: by 10.25.208.137 with SMTP id h131csp133140lfg;
        Fri, 6 May 2016 00:33:12 -0700 (PDT)
X-Received: by 10.194.166.3 with SMTP id zc3mr18591819wjb.104.1462519992167;
        Fri, 06 May 2016 00:33:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7si16730179wjg.17.2016.05.06.00.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 00:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ayaFr-0005Jd-1n
	for alex.bennee@linaro.org; Fri, 06 May 2016 03:32:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ayaFj-00055Z-8D
	for qemu-arm@nongnu.org; Fri, 06 May 2016 03:32:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ayaFX-0001QH-Iu
	for qemu-arm@nongnu.org; Fri, 06 May 2016 03:32:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39124)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ayaFX-0001Ln-Dt; Fri, 06 May 2016 03:32:35 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C2623B726;
	Fri,  6 May 2016 07:32:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-54.ams2.redhat.com
	[10.36.116.54])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u467WFtM012778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 6 May 2016 03:32:17 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 473201132D8A; Fri,  6 May 2016 09:32:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
	<1462417489-28603-4-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8io8mxvragDfEDiEkysfbceP_ebE=ExSX1RzdwvrogXg@mail.gmail.com>
Date: Fri, 06 May 2016 09:32:15 +0200
In-Reply-To: <CAFEAcA8io8mxvragDfEDiEkysfbceP_ebE=ExSX1RzdwvrogXg@mail.gmail.com>
	(Peter Maydell's message of "Thu, 5 May 2016 13:47:15 +0100")
Message-ID: <87zis363r4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: xiaoqiang zhao <zxq_yx_007@163.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BDgHhunrdp6p

Peter Maydell <peter.maydell@linaro.org> writes:

> On 5 May 2016 at 04:04, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>> * Drop the old SysBus init function and use instance_init
>> * Move tmu2_glx_init into realize stage
>>
>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
>> +static void milkymist_tmu2_realize(DeviceState *dev, Error **errp)
>> +{
>> +    MilkymistTMU2State *s = MILKYMIST_TMU2(dev);
>> +
>> +    if (tmu2_glx_init(s)) {
>> +        error_setg(errp, "tmu2_glx_init failed.");
>> +    }
>>  }
>
> The milkymist maintainer might have a suggestion for a
> more informative error message here.

Also, error_setg() doesn't want the period:

 * The resulting message should be a single phrase, with no newline or
 * trailing punctuation.
