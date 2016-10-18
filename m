Received: by 10.80.166.35 with SMTP id d32csp1200404edc;
        Tue, 18 Oct 2016 14:10:24 -0700 (PDT)
X-Received: by 10.200.51.87 with SMTP id u23mr2778567qta.124.1476825023931;
        Tue, 18 Oct 2016 14:10:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o71si22152046qki.54.2016.10.18.14.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 14:10:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwbeR-0007gy-Bk
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 17:10:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwbct-0006Za-U2
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 17:08:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwbct-0004bQ-2M
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 17:08:47 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bwbcs-0004ag-Tp
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 17:08:46 -0400
Received: by mail-vk0-x235.google.com with SMTP id 2so8813249vkb.3
	for <qemu-arm@nongnu.org>; Tue, 18 Oct 2016 14:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XGnaKXnWV/9vPy4gl7aIzv8sUcghtPCGMFk+6s0VACg=;
	b=imAUBANcHWWcIjmvSszbNU0QhDunfbnOU/ei0vxgD+X0Bukd1JNQdsvfCrJTTn8G1O
	dVQpb0178MDJaVrzm0vVQDoC+7ZZpDMHgQKEecQ9Pt15PBsGoKnOobxCGIcZ1yEnRRq/
	Udx6eSEeV23yCluX9FOGUfDkcEOgJnHxgGIZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XGnaKXnWV/9vPy4gl7aIzv8sUcghtPCGMFk+6s0VACg=;
	b=KIUMJntc/25EZTbf0hQEuetaNCcOxaSFHjNUx/H3SDkoN8eQ6bpHJYl9cbGvSIOnB2
	DTv3lGGoyWJMxTJDBLFuh7xqBgNp/URZgtzRzbyNPp78VQHkb1/PBJmI0Q/JcTGioJFg
	Rh/pfDy396mVZPxfcNiuJ4c33o9PobBmQn/UgU6DY/DIPxaW3+10BYGWnhpUtL9PLWow
	6NxSjYB4QkT/LbVuBSH0l2n+6Siz8ZJfvqAPIxTL9aOzNcxK4ljS1hBuxr7NFtJSGgdF
	Egp1DklnxPkZBeCt5YvjxJzu7bkArhImAXVzLD3HtBkk0LTamcE66M7a2dBB0xxSSWzv
	eTuA==
X-Gm-Message-State: AA6/9RkAIAUh13q+Fu+oMfGi8PgAE2ey+Gk6IjMdrjqus7Oblvlzuf9yTT/ZPk054/3pI3+v/djROXcy3A28rfcc
X-Received: by 10.31.206.198 with SMTP id e189mr2428417vkg.51.1476824922361;
	Tue, 18 Oct 2016 14:08:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 18 Oct 2016 14:08:21 -0700 (PDT)
In-Reply-To: <20161018204937.GB5057@thinpad.lan.raisama.net>
References: <20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
	<20161018131829.GQ3275@thinpad.lan.raisama.net>
	<20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
	<20161018152207.GZ3275@thinpad.lan.raisama.net>
	<20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
	<CAFEAcA8UtCr6wpz_3aYb694ixPhuRnyiTrHNwRjGWNYe+9t4aA@mail.gmail.com>
	<20161018175737.3biqteztu3esvaaq@kamzik.brq.redhat.com>
	<CAFEAcA-TxifV3Wfnv=6byJSABnLyPnbtfMsK+aPvwGd-p5sqLA@mail.gmail.com>
	<20161018184532.GC3275@thinpad.lan.raisama.net>
	<CAFEAcA8nCjr2Zz2no3DikyGtRtYRm+ieouatfOJnynkzpJ+thg@mail.gmail.com>
	<20161018204937.GB5057@thinpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2016 22:08:21 +0100
Message-ID: <CAFEAcA9Cd0TsLHgBr-GuOwYmrwcPW656YOP2msAGrhghDS3xBw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] QOM properties vs C functions/fields (was Re:
 [Qemu-devel] [PATCH v3 2/3] exec: rename cpu_exec_init() as
 cpu_exec_realizefn())
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
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NcR/y4oCLqcl
Message-ID: <20161018210821.sH6STWDlpMikVRL6o4kXsVnoXXkVQGXTxLghDrE3vIo@z>

On 18 October 2016 at 21:49, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Tue, Oct 18, 2016 at 09:30:01PM +0100, Peter Maydell wrote:
>> Lots of stuff in a device's C struct is strictly internal
>> and not to be messed with. I thought that QOM properties
>> were essentially how a device defined its public (and
>> typically settable-only-once) config knobs. QOM properties
>> shouldn't be user-facing (read: stable, required to be
>> backwards-compatible) interface in general because
>> we don't really want to tie ourselves down that much.
>> In fact almost all our QOM objects are not usefully
>> user-facing at all.
>
> This interpretation surprises me, because it is the opposite of
> what I have seen us doing. Most of our QOM objects and properties
> are user-visible and user-configurable using -global, -device,
> -object, or qom-set (and probably other QMP commands).

Most of the devices I deal with are not and never will
be sensibly usable with -device. Exposing wiring up
of IRQ and GPIO lines or MMIO regions to the user is
never going to make sense. For x86 most devices are
probably pluggable (and usable with -device), but over
the whole source tree I think the embedded-style device
is in the majority. They're all still worth QOMifying
and having properties for the things board code wants
to modify, though.

thanks
-- PMM
