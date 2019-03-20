Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp655712wrt;
        Wed, 20 Mar 2019 05:21:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwosZ1kurqwic1vILmb9tGqoeLPiJ/eJ/Yq0XNC6IGPVpqKTJcaI75DgTQXjxJz040PYxiK
X-Received: by 2002:adf:f68d:: with SMTP id v13mr21600913wrp.6.1553084498709;
        Wed, 20 Mar 2019 05:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553084498; cv=none;
        d=google.com; s=arc-20160816;
        b=TQ0ni/tApA9z1xozjghu2RjS9DuhOKjM93UhsS00UUo2Zs5QcIXfYJk2YchHX9e8by
         kGIwXwNkNhXt+szAwtjB2QZO5HfeSZv9QH+0HN40+hCaM38DN7VTeMMDPs9tl6DokaCM
         +UnvLk92cCkDvbLiFluM7UMDbJxV6Z0gOyMuJSkhStT2FynuP9/GkchmMYlqNY2cHqtu
         1rv/nc3XRbCDCsGD+Mt4RLk+Y2QnuzCCd/wA5nwSkinyL6ca8Sn+DxemRewuRGSPPthG
         IE6h6P4LzvHNmkIRUM1lQu4M87i8MhirSxGOO8CbAG4YMKJsMqhsdqcFMBTgbuWY9/nP
         0D6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=ojPoH3wNf44TFOhSQxDlNjMstHoX1oq0WtFz6pPDwGE=;
        b=RGTsNC55Ni17Otz1Z2G63ppAzUdrH0AzVdhqballePEgSnwmC62yJLTjdmyVs/UgwD
         btjqAC1Ec3oFNdkEkaXeIKQ3qzxstZ1X595IOjAedoKkJ6zXO6iFztk9HcPD3MzWM3gg
         V6R0N2F8K2CN+2lphMENcYvafQVfyvFTnjxQ6OIplWDhg8/k0v/JXtUSTUfgz7VzSXbc
         EK64BHYPGnuV74LsjjynnX9s+FQ+t0SpTBK4IQ0Dbi0zkuCgxKFnJt+PqEnodxdHdmH5
         U5MeLtgEMhOlyFRZ2X/mqXLuOJ5s26KbojBxB/ave8L2hxaWxvYTw9DxYl0C98rejOPt
         EDTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 196si1375539wmb.147.2019.03.20.05.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Mar 2019 05:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:47310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6aDx-0007df-MN
	for alex.bennee@linaro.org; Wed, 20 Mar 2019 08:21:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9753f2423=anthony.perard@citrix.com>)
	id 1h6aDk-0007dD-PQ
	for qemu-arm@nongnu.org; Wed, 20 Mar 2019 08:21:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9753f2423=anthony.perard@citrix.com>)
	id 1h6aDk-0006UV-1u
	for qemu-arm@nongnu.org; Wed, 20 Mar 2019 08:21:24 -0400
Received: from smtp03.citrix.com ([162.221.156.55]:48092)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71)
	(envelope-from <prvs=9753f2423=anthony.perard@citrix.com>)
	id 1h6aDb-0006Et-MG; Wed, 20 Mar 2019 08:21:17 -0400
X-IronPort-AV: E=Sophos;i="5.60,248,1549929600"; d="scan'208";a="81114876"
Date: Wed, 20 Mar 2019 12:21:08 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190320122108.GN11621@perard.uk.xensource.com>
References: <87d0mwatbu.fsf@dusky.pond.sub.org>
	<875zsed86y.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <875zsed86y.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 162.221.156.55
Subject: Re: [Qemu-arm] Maintainers,
 please tell us how to boot your machines!
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
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Alexander Graf <agraf@suse.de>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	xen-devel@lists.xenproject.org, Andrzej Zaborowski <balrogg@gmail.com>,
	Paul Durrant <paul.durrant@citrix.com>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XDUG1MXPiO8p

On Tue, Mar 19, 2019 at 07:34:45PM +0100, Markus Armbruster wrote:
>     = hw/xenpv/xen_machine_pv.c =
>     Stefano Stabellini <sstabellini@kernel.org> (supporter:X86)
>     Anthony Perard <anthony.perard@citrix.com> (supporter:X86)
>     Paul Durrant <paul.durrant@citrix.com> (supporter:X86)
>     xen-devel@lists.xenproject.org (open list:X86)

That machine requires Xen to be started and at least one service,
xenstore.

In dom0, when it's used to attach more disks to dom0:

$QEMU -M xenpv -xen-domid 0 -xen-attach \
        -name dom0 -nographic  -daemonize \
        -monitor /dev/null -serial /dev/null -parallel /dev/null \
        -nodefaults -no-user-config

Communication is then done via xenstore to attach disks, we would use
`xl block-attach` for that.

Another example, when we start a guest and want to attach qcow disk and
VNC. Our tool stack (xl / libxl) would first create the domain then
start QEMU:

$QEMU -machine xenpv -xen-domid 6 -xen-attach \
        -name pv-arch \
        -chardev socket,id=libxl-cmd,path=/var/run/xen/qmp-libxl-6,server,nowait \
        -mon chardev=libxl-cmd,mode=control \
        -no-shutdown -nodefaults -no-user-config \
        -vnc 0.0.0.0:0,to=99 \
        -display none -m 1024

Is that enough information?

Also, we do automated tests of QEMU. It is done by `osstest' and the
results are sent to xen-devel@lists.xenproject.org.
One example of a test result:
    https://lists.xenproject.org/archives/html/xen-devel/2019-03/msg01577.html

Thanks,

-- 
Anthony PERARD
