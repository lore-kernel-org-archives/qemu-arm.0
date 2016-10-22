Received: by 10.80.166.35 with SMTP id d32csp1758647edc;
        Sat, 22 Oct 2016 02:31:41 -0700 (PDT)
X-Received: by 10.200.52.151 with SMTP id w23mr5872735qtb.115.1477128701110;
        Sat, 22 Oct 2016 02:31:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p76si1584987qkl.211.2016.10.22.02.31.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 22 Oct 2016 02:31:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxseS-0003Cc-Ho
	for alex.bennee@linaro.org; Sat, 22 Oct 2016 05:31:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bxseL-0003C0-U3
	for qemu-arm@nongnu.org; Sat, 22 Oct 2016 05:31:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bxseL-0004ro-63
	for qemu-arm@nongnu.org; Sat, 22 Oct 2016 05:31:33 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36392)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bxseK-0004rQ-Px
	for qemu-arm@nongnu.org; Sat, 22 Oct 2016 05:31:33 -0400
Received: by mail-vk0-x230.google.com with SMTP id 2so137353094vkb.3
	for <qemu-arm@nongnu.org>; Sat, 22 Oct 2016 02:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=It0Oj9Xdrp54RLlLJTTr/m6tOaesLEHbLEzK/qb2ong=;
	b=hoEahlAJdThYu4GgB8/F48XoHDBLTIjC3SffYiuQTPRjgsw4+E3mJKdpWfkUb3gv+l
	tuy+81s/+sKoz7feb3lU1Migg9jotL5Ucd2GDGyFTeIUUSpOzBSgjyWN+OwLE6ORUQ6T
	588jka+0wQY2R1J7pWrlQqPn17TYkVwNTFf3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=It0Oj9Xdrp54RLlLJTTr/m6tOaesLEHbLEzK/qb2ong=;
	b=UB9wqWJy4RoQBm1Tr5T01+V1SaVGkRBgW6J/snLvnov3i78RSaeBdTV/flU5CFFXtM
	trPEBx3WtA50pUrDm1V/jos9Cni9LE6yZ8VeTuvb/R+ExdZFGEtTcrMM8mVuRCcijqxx
	ik8VXuzDzE9qI+5oXjeLjL2cEB4IdYxYHO2X1ae8KTI3A0odCQkTTA9yNYd5bz2En4UA
	hFliizlKkJ4Y7LxjsaG7HR3A8KCAKP/qmO1XXA5+haDLdHUApBEFTJdlZ82Lf2vot9D9
	a1uszKWs7xPi9MaGguvI+27mnFfUuZzQ2+4rLI5rUoyeUI0Nt7ymD5af5sUey2iX8fIv
	g7QA==
X-Gm-Message-State: ABUngvfZawNL0HDJt7EVCcnLl4KSzjzM0cDJmTeW7pYRTNgZyuGMftgENeO6AnInibOxefRf7rXCQ/ZcwHQZKYDb
X-Received: by 10.31.79.134 with SMTP id d128mr3531880vkb.165.1477128692033;
	Sat, 22 Oct 2016 02:31:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Sat, 22 Oct 2016 02:31:11 -0700 (PDT)
In-Reply-To: <87d1iteeym.fsf@dusky.pond.sub.org>
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
	<CAFEAcA9Cd0TsLHgBr-GuOwYmrwcPW656YOP2msAGrhghDS3xBw@mail.gmail.com>
	<87d1iteeym.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Oct 2016 10:31:11 +0100
Message-ID: <CAFEAcA_OqsPrQzD2pLWXkP18fu3ems=ZZwg62kL7roMm+TU+dg@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [Qemu-devel] QOM properties vs C functions/fields
 (was Re: [PATCH v3 2/3] exec: rename cpu_exec_init() as
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
	QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Jia Liu <proljc@gmail.com>,
	Alexander Graf <agraf@suse.de>, Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tWmv5l0cYDqr

On 21 October 2016 at 19:26, Markus Armbruster <armbru@redhat.com> wrote:
> "Device not pluggable" does not imply "device has no configuration knobs
> a user may legitimately want to mess with".  Plenty of onboard devices
> have such knobs.
>
> Right now, users configure these mostly via board-agnostic options like
> -serial.  Anything that doesn't fit the mold can't be configured that
> way.
>
> However, A fully mature QOM as I envisage it would provide users access
> to QOM properties for onboard devices, too.  Not with -device,
> obviously, but with qom-set and similar, as Eduardo said.  If any of
> these properties are not for users, they should be marked as such.  Just
> like for pluggable devices.

Yes, you're right about this. (What's the command line
equivalent of qom-set? We have -global but that's a bit
awkward if I'm remembering its syntax correctly.)

> Perhaps non-pluggable devices tend to have more "not for users" QOM
> properties than pluggable ones, I don't know.  But that would be a
> *quantitative* difference, not a *qualitative* one.

I agree that it's not really qualitative, but a pluggable
device's properties are all by definition for the user
to set (since the user is the only one who can set them).
In a pre-plugged device, although there may be a lot of
properties, some of them won't be usefully changeable
in the context of this device in this board (ie if you
mess with them you'll just break things). We don't have
any way for the board to say "this stuff isn't for the
user", I think.

thanks
-- PMM
