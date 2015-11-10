Received: by 10.182.105.169 with SMTP id gn9csp1666188obb;
        Tue, 10 Nov 2015 01:39:53 -0800 (PST)
X-Received: by 10.140.31.161 with SMTP id f30mr2796903qgf.95.1447148393798;
        Tue, 10 Nov 2015 01:39:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si2175194qkx.21.2015.11.10.01.39.53
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 10 Nov 2015 01:39:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zw5P7-00049U-6x
	for alex.bennee@linaro.org; Tue, 10 Nov 2015 04:39:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zw5P5-00049M-An
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 04:39:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zw5P2-0000ck-17
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 04:39:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Zw5P1-0000cb-R8; Tue, 10 Nov 2015 04:39:47 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 08043C0AEE39;
	Tue, 10 Nov 2015 09:39:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-23.ams2.redhat.com
	[10.36.116.23])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAA9djIh008455
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 10 Nov 2015 04:39:46 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B765A303F90E; Tue, 10 Nov 2015 10:39:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1446909925-12201-1-git-send-email-drjones@redhat.com>
	<CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
	<87twovpqg1.fsf@blackfin.pond.sub.org>
	<CAFEAcA8rsWg=9ZV75ZmJYPrPznUH-bQObvzHUem1Tciv3_5CaA@mail.gmail.com>
	<87oaf3jww7.fsf@blackfin.pond.sub.org>
	<CAFEAcA8Rh9ts2r-nMGbNm7Y=SpdxL4gv0ch3CBWOHiHTRMeztg@mail.gmail.com>
	<878u67atv0.fsf@blackfin.pond.sub.org>
	<CAFEAcA-z6NzyGkXqG27seP9G5c8qAL-MwY0QCPT1qZhfq6DZ+g@mail.gmail.com>
Date: Tue, 10 Nov 2015 10:39:44 +0100
In-Reply-To: <CAFEAcA-z6NzyGkXqG27seP9G5c8qAL-MwY0QCPT1qZhfq6DZ+g@mail.gmail.com>
	(Peter Maydell's message of "Tue, 10 Nov 2015 09:31:15 +0000")
Message-ID: <87y4e6xkf3.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: error_report
	cleanups
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
X-TUID: zCd8wFcFLcnu

Peter Maydell <peter.maydell@linaro.org> writes:

> On 9 November 2015 at 18:52, Markus Armbruster <armbru@redhat.com> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> Thanks, I had missed this useful improvement to the API.
>>> How does it work in cases like this where we don't have
>>> an Error* to fill in?
>>
>> You do what error_report_err() would do had you had an Error *err to
>> fill in:
>
>> In other words, you print the error message proper with error_report(),
>> and the additional information with error_printf().
>
> ...so in conclusion Andrew's patch is correct as it stands
> and I should just apply it? :-)

Yes.  It got my R-by :)
