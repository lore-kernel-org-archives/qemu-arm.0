Received: by 10.25.208.211 with SMTP id h202csp1883231lfg;
        Tue, 23 Feb 2016 11:09:17 -0800 (PST)
X-Received: by 10.140.165.205 with SMTP id l196mr46899255qhl.58.1456254556983;
        Tue, 23 Feb 2016 11:09:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si24312344qgg.2.2016.02.23.11.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 11:09:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYIKi-0002lA-9b
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 14:09:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aYIKg-0002l0-HV
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 14:09:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aYIKc-0002RY-H1
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 14:09:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aYIKc-0002RN-BU; Tue, 23 Feb 2016 14:09:10 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 4BD108553B;
	Tue, 23 Feb 2016 19:09:09 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-251.brq.redhat.com [10.34.1.251])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1NJ952t011319
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 23 Feb 2016 14:09:07 -0500
Date: Tue, 23 Feb 2016 20:09:05 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160223190905.65sroj2tysb22hbz@hawk.localdomain>
References: <1456175198-25210-1-git-send-email-wei@redhat.com>
	<CAFEAcA8vyVL6jyMTGCap9Bu=eyqR2OUN5LzH5Sjo965Fn4PmHA@mail.gmail.com>
	<56CCA649.8090906@redhat.com>
	<CAFEAcA-gXuVJjJS8T87ru9YE+5VrJ25eXoqkwxsd21OK6__Upw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-gXuVJjJS8T87ru9YE+5VrJ25eXoqkwxsd21OK6__Upw@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Subject: Re: [Qemu-arm] [PATCH RFC 0/2] Versioning ARM virt machine types
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
X-TUID: zhaXJJbSTMPE

On Tue, Feb 23, 2016 at 06:42:16PM +0000, Peter Maydell wrote:
> On 23 February 2016 at 18:34, Wei Huang <wei@redhat.com> wrote:
> > On 02/22/2016 04:14 PM, Peter Maydell wrote:
> >> My view here is the same as it has been in the past regarding
> >> adding versioned machine types for 'virt': are you (in this case
> >> Redhat) willing to stand behind it, in the sense of taking on
> >> the maintenance burden of adding new machine versions, reviewing
> >> new code contributions for issues that require changes to make sure
> >> that the old versions stay looking like the old machine, testing
> >> that old versions look right, testing cross version migration,
> >> and so on?
> >
> > I understand your concerns. Currently our in-house tree already carries
> > versioned ARM machine types, which mirror both QEMU 2.4 and QEMU 2.5.
> > Thus someone (including myself) from Red Hat shouldn't have any problem
> > of maintaining/testing it because we are already doing it downstream.
> > x86 and ppc have a similar situation.
> 
> Thanks for the clarification -- if you as a distro are already
> supporting versioned machine types downstream that's a strong
> argument for adding it upstream.

Unfortunately the word 'support' is super overloaded in this field. I'll
just quick clarify. We have a series of pre-releases for our virt stack.
Later pre-release releases are based on later QEMU, and thus we've
versioned mach-virt already. But, as they're just pre-releases, they
aren't supported in the sense that we're working bug reports against
them.

I believe our downstream versioning has driven some changes to libvirt
already, so I think it's a good time to bring the how to best version
mach-virt discussions to all the respective upstreams, despite it
currently, at least for us, being used only on pre-releases though.

Thanks,
drew
