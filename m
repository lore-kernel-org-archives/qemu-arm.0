Received: by 10.25.208.211 with SMTP id h202csp1190702lfg;
        Sun, 6 Mar 2016 20:27:46 -0800 (PST)
X-Received: by 10.55.215.83 with SMTP id m80mr23707797qki.84.1457324866041;
        Sun, 06 Mar 2016 20:27:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f80si15159949qhc.105.2016.03.06.20.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 20:27:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acmll-0001aD-JH
	for alex.bennee@linaro.org; Sun, 06 Mar 2016 23:27:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1acmlj-0001Zp-9x
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 23:27:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1acmle-0006BX-Ai
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 23:27:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1acmle-0006BL-5p; Sun, 06 Mar 2016 23:27:38 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id B8BDDC00FBDD;
	Mon,  7 Mar 2016 04:27:37 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-5-200.pek2.redhat.com [10.72.5.200])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u274RQLM021887
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 6 Mar 2016 23:27:30 -0500
Date: Mon, 7 Mar 2016 12:27:25 +0800
From: Peter Xu <peterx@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Message-ID: <20160307042725.GA7438@pxdev.xzpeter.org>
References: <1456993272-32292-1-git-send-email-peterx@redhat.com>
	<1456993272-32292-4-git-send-email-peterx@redhat.com>
	<1457007587.4468.2.camel@redhat.com>
	<20160304025255.GF30973@pxdev.xzpeter.org>
	<1457081004.4468.4.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1457081004.4468.4.camel@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, armbru@redhat.com,
	mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v2 3/3] arm: implement query-gic-capability
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
X-TUID: u8aPqeGZiGoQ

On Fri, Mar 04, 2016 at 09:43:24AM +0100, Andrea Bolognani wrote:
> On Fri, 2016-03-04 at 10:52 +0800, Peter Xu wrote:
> > Andrea, do you know how much effort we need to add this support for
> > libvirt, say, we can specify "accel=" or "-enable-kvm" as extra
> > parameter when probing?
> 
> I'm afraid this is not going to be possible for the same reason
> we have to use '-M none' when probing: at that point in time, we
> simply have no idea what the guests will look like. Actually,
> it's the other way around, in that the result of probing (host
> and domain capabilities) will influence the guest configuration
> created by the user / management tool.
> 
> And we definitely can't use 'accel=kvm' unconditionally, because
> then we won't be able to probe eg. the qemu-system-aarch64 binary
> installed on a x86_64 host.

Agreed. It is awkward to specify these for probing.

Posting v3 to allow it work even without kvm enabled. I am using the
hacky way to do it since I still have no better way to do it. Let's
see whether we can get more review comments on that.

Thanks!
Peter
