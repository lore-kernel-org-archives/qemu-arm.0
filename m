Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5794155wro;
        Tue, 30 Oct 2018 09:21:49 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eHoGu7h4sEYSoG48lr9sdO4lPa5pGEtVJH+Iv0fg8tN0xg2yavj3yfupyqWjPCtdLPBuoW
X-Received: by 2002:a37:c016:: with SMTP id o22mr7712190qki.162.1540916509481;
        Tue, 30 Oct 2018 09:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540916509; cv=none;
        d=google.com; s=arc-20160816;
        b=fcEmmElOI5zei/6Vq7piqb+w26QjuCryGRz4SaeIkv0n5kaYhFZQvdqi3vLoT3GKJd
         4knO1UZBI9E92AM/qhDKUBw2MMYUP9cjhCoW/prOnXy7VSLir7ZfgOq/IW/b3FcKonJt
         rYnlw+IVH+3ocjw84d9D0A9/qIcAbpNQMMV2gMz0q3CYaY87A4ckd1VGyAqZWjTSGOZ4
         o1j1I39wRz/gKKH47rohW1Lp/WrcaEghaSrqYuUD/GxtogK95Oa4r1cJbRZ+747Zw1Vh
         5TsXfZOEVAQ7zOlyZrsy5bi5LIBxJ+Mt6EOSNHvKYGYvOIauO+/2Gyi5eUOKsMKQqfnU
         yH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=Xaipa+Dmt5yZgXigIV5//gKUzZLMA0gup+KWox19TwA=;
        b=puzufrPjQfLVna097XoEA8jIZyN5j6QJNi5qN2bnT7Z+dtKZ5ZU5a9xzvBhSz/kJLv
         jJjLFdpNjnAlx5FmsFydWuUrvhaDUlH0fLAJn4CsUFadnFw6+ZMfpojFqpWpOcjwh97R
         mndfgz4tDWk78PB1MKhO4H8vyjusUpAxrF5Uw/NtJW2W696iejX15s2+Qi+G/YsJBNOj
         1KyZ7iIgB5CdIUgz36efuj9WOtcnoIh9AGNVT++gdX5Go9TQ8U6SQrIpdu8DUrrHSqzO
         mPxt1c6lEPoanYxq7m6rCGS6mA8SceS7DPloZbJ0X9dN+xQXnP5QPbNBULX/SmiwVLOk
         +qnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c5-v6si1560120qtj.372.2018.10.30.09.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 09:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHWm4-0001q6-J1
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 12:21:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gHWlx-0001pp-Rx
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 12:21:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gHWlq-0002KC-R7
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 12:21:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36864)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gHWli-0001J4-Ng; Tue, 30 Oct 2018 12:21:30 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98B2E7F6B3;
	Tue, 30 Oct 2018 16:21:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-34.ams2.redhat.com
	[10.36.117.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33AFC104C456;
	Tue, 30 Oct 2018 16:21:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8D69A11385F2; Tue, 30 Oct 2018 17:21:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
References: <20181029162441.31631-1-sameo@linux.intel.com>
	<874ld4mzlb.fsf@dusky.pond.sub.org>
	<20181030152041.GD5291@caravaggio.home>
Date: Tue, 30 Oct 2018 17:21:15 +0100
In-Reply-To: <20181030152041.GD5291@caravaggio.home> (Samuel Ortiz's message
	of "Tue, 30 Oct 2018 16:20:41 +0100")
Message-ID: <874ld3h0ck.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 30 Oct 2018 16:21:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 00/19] ACPI reorganization
 for hardware-reduced support
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P93sqGIc2vNE

Samuel Ortiz <sameo@linux.intel.com> writes:

> Hi Markus,
>
> On Mon, Oct 29, 2018 at 06:28:48PM +0100, Markus Armbruster wrote:
>> You neglected to cc: maintainers.  I'm doing that for you now.
>> scripts/get_maintainer.pl can help you finding maintainers.
> Sorry about that. I sent a v3 with all maintainers cc'ed.

I don't think that's necessary unless you add more people than I did.
