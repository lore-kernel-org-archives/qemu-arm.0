Received: by 10.80.166.35 with SMTP id d32csp240205edc;
        Wed, 19 Oct 2016 04:38:22 -0700 (PDT)
X-Received: by 10.55.101.201 with SMTP id z192mr5030273qkb.35.1476877102614;
        Wed, 19 Oct 2016 04:38:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f140si23978233qke.270.2016.10.19.04.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Oct 2016 04:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwpCQ-00007z-2K
	for alex.bennee@linaro.org; Wed, 19 Oct 2016 07:38:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwox3-0004U1-Lt
	for qemu-devel@nongnu.org; Wed, 19 Oct 2016 07:22:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwox2-0006wB-Rk
	for qemu-devel@nongnu.org; Wed, 19 Oct 2016 07:22:29 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34908)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bwox2-0006uN-L1
	for qemu-devel@nongnu.org; Wed, 19 Oct 2016 07:22:28 -0400
Received: by mail-vk0-x232.google.com with SMTP id q126so23374188vkd.2
	for <qemu-devel@nongnu.org>; Wed, 19 Oct 2016 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pGYtPc/oq//jd/wk3OWEbjewbmYkauJyNHWm2RT9/Os=;
	b=Lpwbuj24CFIc+68mk6OhDVJk0WOnMdfdvSU3NdnZrn5g+bjnQwC06h8AB1jLo5Pox2
	HABPmv6688EwUN7aIMVyDp2u7Il4ZmzpdclaXoqXmJSwxIejZc27OUX3SCBaUtCreRzT
	cvMnEiV5OpN11HrAlryD75x6PWAAxapFfBcPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pGYtPc/oq//jd/wk3OWEbjewbmYkauJyNHWm2RT9/Os=;
	b=hGXl2+8dp3gLBP8x142mutY53Rgb2JEl2yHEz/9aDBGD2FjfZt8UHQN4krJYn7FSen
	0RlKXXOI6Bz9G2/dNC2ozG9xlOWKzFWmlVs72pkpnhqLcrCmc9Bpzz3JhTEZmnUJbtTX
	wvb3jDuJKEchLFdRxyIW88Fcp/hdfTr51xyeHZdjnZNZD7qAgvSmo7PV8+JOGBj5e0cE
	EiI7r4vcyef6E0k8iPPk5D+DZmE8Fcn0ocM6eYPL7DxCUSzKpdpSaWb8aLGRFG7Gpx3A
	Eu+CKj8+eCROvI5qOH1ce4wkJ8D0T+nwy6WsoGHTMIp3YUsspLbIBPJYcjYYr5XItlTz
	fHuw==
X-Gm-Message-State: AA6/9RlKmHldazcCi67Tf/JK7V8ERBQ1mcE1gyIBU0N4KyMH2dC75tfujshr/axbmxImWvX1U/4MrLOKGYu4QGZW
X-Received: by 10.31.79.134 with SMTP id d128mr4511543vkb.165.1476876147724;
	Wed, 19 Oct 2016 04:22:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 19 Oct 2016 04:22:07 -0700 (PDT)
In-Reply-To: <20161019111106.GD5057@thinpad.lan.raisama.net>
References: <20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
	<20161018152207.GZ3275@thinpad.lan.raisama.net>
	<20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
	<CAFEAcA8UtCr6wpz_3aYb694ixPhuRnyiTrHNwRjGWNYe+9t4aA@mail.gmail.com>
	<20161018175737.3biqteztu3esvaaq@kamzik.brq.redhat.com>
	<CAFEAcA-TxifV3Wfnv=6byJSABnLyPnbtfMsK+aPvwGd-p5sqLA@mail.gmail.com>
	<20161018184532.GC3275@thinpad.lan.raisama.net>
	<CAFEAcA8nCjr2Zz2no3DikyGtRtYRm+ieouatfOJnynkzpJ+thg@mail.gmail.com>
	<20161018204937.GB5057@thinpad.lan.raisama.net>
	<CAFEAcA9Cd0TsLHgBr-GuOwYmrwcPW656YOP2msAGrhghDS3xBw@mail.gmail.com>
	<20161019111106.GD5057@thinpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Oct 2016 12:22:07 +0100
Message-ID: <CAFEAcA9acBXou9XwTAdjc=OQp-FaUpkiW7TdUAoe4wHT_RXZrQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-devel] QOM properties vs C functions/fields (was Re:
 [PATCH v3 2/3] exec: rename cpu_exec_init() as cpu_exec_realizefn())
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
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VgOzShBuEpAC
Message-ID: <20161019112207.uR2e85fRI_r9UXTSzsjyQyYJ0YeiGQ8lb741gjlineo@z>

On 19 October 2016 at 12:11, Eduardo Habkost <ehabkost@redhat.com> wrote:
> BTW, if most devices aren't supposed to be used with -device,
> possibly many of them don't have
> cannot_instantiate_with_device_add_yet set properly.

They used to be covered by hw/core/sysbus.c setting
it for them. In commit 33cd52b5d7b9adf that was removed,
because under certain specialized circumstances it
is now possible to dynamically add a sysbus device.
If the machine model doesn't set mc->has_dynamic_sysbus
they'll error out via a different route. If the machine
model does set that option then it'll probably just do
something unhelpful unless the user knew what they were
doing.

thanks
-- PMM
