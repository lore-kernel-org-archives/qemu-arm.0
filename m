Received: by 10.25.208.211 with SMTP id h202csp2267028lfg;
        Tue, 22 Mar 2016 22:44:02 -0700 (PDT)
X-Received: by 10.55.76.213 with SMTP id z204mr1014112qka.58.1458711841908;
        Tue, 22 Mar 2016 22:44:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q95si821339qgq.101.2016.03.22.22.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 22:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aibaL-0002eu-D5
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 01:44:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibaI-0002eX-OS
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:43:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibaD-0004x4-Py
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:43:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aibaD-0004wn-Ka; Wed, 23 Mar 2016 01:43:53 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 09C4D461D6;
	Wed, 23 Mar 2016 05:43:53 +0000 (UTC)
Received: from pxdev.xzpeter.org (dhcp-14-238.nay.redhat.com [10.66.14.238])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N5hgRR005452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 01:43:46 -0400
Date: Wed, 23 Mar 2016 13:43:40 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160323054340.GI28183@pxdev.xzpeter.org>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<CAFEAcA-nPdPrxXS5BdjGnd2PUao9JXvzW43Mo4MT7p15fOAPYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-nPdPrxXS5BdjGnd2PUao9JXvzW43Mo4MT7p15fOAPYA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v5 0/5] ARM: add query-gic-capabilities SMP
	command
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
X-TUID: tOD3filIYc3E

On Tue, Mar 22, 2016 at 02:49:19PM +0000, Peter Maydell wrote:
> On 18 March 2016 at 03:27, Peter Xu <peterx@redhat.com> wrote:
> > This patch is to add ARM-specific command "query-gic-capability".
> >
> > The new command can report which kind of GIC device the host/QEMU
> > support. The returned result is in the form of array.
> >
> > Sample command and output:
> >
> > {"execute": "query-gic-capability"}
> > {"return": [{"emulated": false, "version": 3, "kernel": false},
> >             {"emulated": true, "version": 2, "kernel": true}]}
> 
> Reminder: I still need confirmation from the libvirt folks
> that this API meets their needs, and review from somebody
> on the QEMU QMP protocol design side. This should go into
> 2.6 but we are getting closer to hardfreeze...

Hi, Peter,

Regarding to QMP part, I have got review comments from Eric/Markus,
and will do more spins if necessary (latest v6). For libvirt part,
Andrea should be the one to finish the libvirt part of this
feature, so I am considering him to be the libvirt guy. Do you think
we need more review besides CCed, especially on libvirt part?

Thanks.

-- peterx
